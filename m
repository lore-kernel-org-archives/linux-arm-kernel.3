Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C26CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=; b=DUvKGYIzaPq8VBPdisPuDA1Vjj
	RQZfyW7BpA4toJQrHaSP1xHwEpNUu+O+GCzMm1FflRO7dFO91YYDVDMC8fGOwdj2QOeo6CoAg80cd
	9hClMH60fcnD1YQmZzO7XS8QKW4l3sJDydGhI6uRmsrsMW7Q9qkeAxwa6TInb+zkUe2wbfRZGMTYl
	2R+KYR0IL7rCIlPaUcDyo6obn0N5YCNXMQXtxVWa/ohr6VRQv2n2d1rY6bh9aqGf18bI6G7DagVXu
	H/DBJMVQ/Xc2ny6APM94i6yO6PObztrylMKPz1FXhAOipG3ntyZgR18tXWPJGTe0Dyn7pknisUiON
	sTMP77xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYNr-00000002Prr-1qH9;
	Fri, 19 Jun 2026 12:31:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYNo-00000002PrW-238b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:31:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JCA2Im624980
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 12:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=; b=Pz/g6FMaYoQlQk8+
	3WjzmjdxjC4j44ms7bfVLBwq0rZdzNZoXBxTKXWdnGgXegvrabKGeUMCL5gh82IS
	mOBo6SMiETuCVsq2tWK0CgwFkTRXj9REs7SkW13ibhHozaFEPLUHLQ9W4iUComHM
	rwHUK+D7z5BBZvE2Ew4dk5h9E+6DbDEuU5eOCCWHVPIoTbUqFs78i8Qhd7ImUuFz
	wEvJfUfSXjzJpKntcC//Z4nOzaYZW7T9t7lhTNQWluFTd03VGI2ppEPfzxCc32b3
	BuSJuDbDUrDn4W5QbGWZPLorztFFBKLUydOf4M/NLcx7+OV4UGwIfA18xikEcBVa
	3TSNhg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5hp81yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 12:31:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37c64f7ff48so2464168a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872298; x=1782477098; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=;
        b=gtt1287Er/yiJOMtjakieW8fKZEvW6D5bpUROyY5LvZ88CGFr54a6SvfNP95+GNOHV
         Uto3XWGJlgSXjv0meeSa1gz8VGRWIf7YcHoWPYrlpdX1lsIu0TEg4nrnjKTBsRB84+gI
         Zg1m3AgGP1nPYrev561IV0t6texQgo0C+Rx5rgSyJl75PdHrOSzR5/uo70Zjm3Fbg8E2
         rSBe1D1vMEaKX4x9dN4MEVbNv8veopkCVSsOvtt2WvIV6vsfuAKMWZtqQVeqbRobyM2t
         Pi2JUS49rXnJ9g+HoqsQs3h9BlOQU9sESjOoYLxFUp7BZQigbts+wP+FrxBuHBgc8cwn
         8XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872298; x=1782477098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=;
        b=fgcd6Qea3kEMVhk8rYzl+QNIHLmmKO56KZD/F5jOw6JhRxyH3JAy744iKFqjBRAEcq
         wwE44vlVKtY5m+qP4V2LsCXt844VTDnLryY4z8JHznVbRzhWalPpuuuFmBZAcwPPgwPF
         y7c4XZ7TC9ZkzfZPblIyuL18Cifa8V1s96XCeyjavPEeWCnkY7OJ2zmgocdSzShzpoX1
         /l/hW0jHTmeDlXO7vtcOgh7G0x8fWenSwA8BUTkoQy0nDp5HFqMYpVl9cQDvO9FC6gvQ
         jJVA27ximwk78QsUlUjaaFdn9exh+kfdnSGiYhkASUaOsnB55X28MbX+NV3SlONygVXs
         JHFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UcoO3CljFJ/rmx0fdD23wQ7p2jygXi7/Mqwt1mfP5RGVd6px1+mn4kypvTCuFskk2R1ifyiz4LAKilBObHVTv@lists.infradead.org
X-Gm-Message-State: AOJu0YxYoAH1W/JkgQFImpo6eGKkbJCFHKATPJ8qosDWFfMrt7OgfR6X
	XcNmLUZM76NePIFC9gb7T1PYWXk5DqoH4jn0gFzuZzVSpc7aq6EidmEf/gWUFSTLsLEoA2LX3+l
	EQQUpohcaIM4Lft903HOeWOqZMk+3Iwx0DbhssMwYY+Q69aIPXdJf3M8GsmUMSUpHNkKJ7VaJmt
	1TSw==
X-Gm-Gg: AfdE7cnQDBL/Zxfd/a8NM2Gllb5cOiT+6AExHvpJx31bs/Ksjpn18BzSdAItjUFnSea
	fQU98ascHDr7tAel6bLC6Oh0KpDM0bId9AKIqlkWnu79c6Vg7d0x6Kpj92VOL4wbf/ZZr/IBnyk
	M/hvREZChVZwm5PuYASGrxqqkQmdb9i5imXEwd9kcNxUb1y6qMR43ytdBYOmPC0nZur2FxGQSP5
	Yp2NAgSXYRhi9PuYDPfGq5fft1+Ej/pX5JH93nfFezIubTzMozCF+gFgZKSTUB4Okw2Dake/LRf
	lwIpZK6xPe0wFMswr1KHE2AvV/+hGnAIaMhPh4f182ocOKgjbNZcj0h7p/shxc2gZf6f1pRsGyZ
	h4xGuil+f/EyNfof4jnU+2EokDxKBC3VB3teInnopuwFy6mdffG/X2TBOwlVd5jTDvHbygPEPGD
	iE5B1FWcLcF+aCyhZxDp+p4F2aGO8IlQNYmQ==
X-Received: by 2002:a17:90b:17c5:b0:369:de03:29c8 with SMTP id 98e67ed59e1d1-37d1ea3ad49mr2456637a91.23.1781872298063;
        Fri, 19 Jun 2026 05:31:38 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:369:de03:29c8 with SMTP id 98e67ed59e1d1-37d1ea3ad49mr2456595a91.23.1781872297615;
        Fri, 19 Jun 2026 05:31:37 -0700 (PDT)
Received: from [10.50.22.170] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a8525f818sm2378163a12.9.2026.06.19.05.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:31:36 -0700 (PDT)
Message-ID: <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 18:01:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PfCGDydOqtca1UJKHzSvCf6sYGsP66yq
X-Authority-Analysis: v=2.4 cv=aOHAb79m c=1 sm=1 tr=0 ts=6a3536ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_HCkHYxhaP3GdHjqj7kA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: PfCGDydOqtca1UJKHzSvCf6sYGsP66yq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNyBTYWx0ZWRfXyGccxEs8uRwO
 c3ZVDj8l8U6Iz3zZ5HwdpCHQSsFokC8ZImDrwdq9neNE0sWTewWb1j8b+n+kMFSFPifYaQlTJLg
 +doj0C/IDblFE2/rWrTA72BqOlFzbbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNyBTYWx0ZWRfX3YBLLY98olgM
 62He5P/IdpC/spSkCB9u2M4itcG+SaZDkvIU+G2mjUEkAusBsLb60saqCAAQwpbVUfZJ6ac5WPa
 E5oN8a9IDpNzLbHmO+qOCIMtySLPvDHcwIYtQchlfemuHVDNf03tHGQxLvpIWm63nMb6AIAA+S3
 SBnXu80nL2FrD3NiRPhi1J44laAWXj3pCs32We9E8cFY3fKmYbk/BQvx/fujbEFcgUGQowEo/+h
 ZBytvJq5HUa4vQME01J1lkaqdWuShkKshBBHAyKjfH3jJu+GZH5bHK7btQiMxe8Nw48DtYylov6
 3cbX8kOK4NcP2/7lFgNN/bzDm3wSaBMI2Y4L/VOUXyMjeqGiH9vQ2ITmJv/IXIL2IGeDdhrRs4L
 IGa0yk456FbcJAzpgCDVPENU9fXI44CXZk6IKMOcFY/emng11sDThCHaa9m+PE9vX/1YAbP578m
 yw+74eqSKR2C+mVFsTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_053140_677858_37E59CF6 
X-CRM114-Status: GOOD (  26.52  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
> On Wed, Jun 10, 2026 at 02:21:27PM +0530, Pragnesh Papaniya wrote:
>> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
>> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
>> pre-determined algorithm strings and param_id pairs hosted on the SCMI
>> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
>> mechanism to control the various caches and RAM is hosted on the CPU Control
>> Processor (CPUCP) and the method to tweak and start the governor is exposed
>> through the QCOM SCMI Generic Extension Protocol.
>>
>> This series introduces the devfreq SCMI client driver that uses the MEMLAT
>> algorithm string hosted on the QCOM SCMI Generic Extension Protocol to detect
>> memory latency workloads and control frequency/level of the various memory
>> buses (DDR/LLCC/DDR_QOS). DDR/LLCC/DDR_QOS are modelled as devfreq devices
>> using the remote devfreq governor. This provides basic insight into device
>> operation via trans_stat and lets userspace further tweak the parameters of
>> the remote governor.
>>
>> trans_stat data for DDR/LLCC/DDR_QOS is now available with this series:
>>
>>      From  :   To
>>    315000000 479000000 545000000 725000000 840000000  959000000 1090000000 1211000000   time(ms)
>>    315000000:         0         3         6         6         6         7         0        30    143956
>>    479000000:         2         0         7         1         1         1         0         3       356
>>    545000000:         7         6         0         5         5         0         0        10      1200
>>    725000000:         3         0         5         0         6         1         0         6      2172
>>    840000000:         8         2         3         2         0         4         0        12      1188
>>    959000000:         3         0         1         2         2         0         0        13       272
>>   1090000000:         0         0         0         0         0         0         0         0         0
>>   1211000000:        35         4        11         5        11         8         0         0     21684
>> Total transition : 253
>>
>> QCOM SCMI Generic Vendor protocol background:
>> A lot of the vendor protocol numbers used internally were for
>> debug/internal development purposes that were either highly SoC-specific
>> or had to be disabled because some features were fused out during
>> production. This led to a large number of vendor protocol numbers being
>> quickly consumed and never released. Using a single generic vendor
>> protocol with functionality abstracted behind algorithm strings gives us
>> the flexibility of letting such functionality exist during initial
>> development/debugging while still being able to expose mature features
>> (like MEMLAT) once they have stabilised. The param_ids are expected to
>> act as ABI for algorithm strings like MEMLAT.
>>
> 
> Not sure if it was discussed in the previous versions or not, it would be
> good if you can capture why some of bus scaling doesn't work with the existing
> SCMI performance protocol and the monitors don't fit the MPAM mode.
> 
> Please capture them in 1/9 as a motivation for this vendor protocol. It will
> then help to understand it better as I am still struggling to. Sorry for that.

Thanks for the input!

SCMI perf protocol exports perf domains to kernel where kernel can set
the frequency but here the scaling governor runs on the SCP while kernel
just observes frequency changes made by remote governor. While MPAM is
not enabled/supported on all hardware (Hamoa). Here's the pseudo-code
for remote governor on CPUCP to help you understand more:

Barebone Memlat Pseudocode:
Every sample window, get snapshot of latest AMU counters from each CPU and scale all the memory according to the map_table:

For each CPU
    // Calculate IPM ( Instruction retired / cache miss count (L2 cache refills for LLCC voting and CPU RD miss counter for DDR))
    If (IPM < IPM_CEIL)
        Use CPU cycle counter to determine CPU frequency in the past N milliseconds

LLCC_freq = lookup_llcc_freq(cpu_freq_max)
DDR_freq = lookup_ddr_freq(cpu_freq_max)	
DDR_QOS_freq = lookup_ddr_qos_freq(cpu_freq_max)

// Scale all memories
Scale_freq(Memory); // LLCC/DDR/DDR_QOS

> 

