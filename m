Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC295C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjxEnfFY+QDN6dunr8E34pS1L0NN6GcefMiLtCN2Bak=; b=ZPcAeQmyOZIe3zonVvisxuxuRV
	wmsXX1kFgAH1p6C05jfPL8p5Gcqk0oTNoUQFwmwYA5ceSBW/iTf7nEaloYIh4sXCWP065CuyS89yp
	5Yu1IoabtlucBjG5Bdl+pMFk29uKfEO6FjMJm5cdnk8x5dpQ1+OgImuLpyYuxIy2cwYu2FZyBAS4J
	cIY2lY8ZYebzl+9xeAIyTSlmeMzbk77svWE0eqtxRQ1+qNPdFIC4D8oRaFWscnYl4AtW7N+HuPsH9
	PxgnqdgDGme7Nt9371BgBEJ3moAU6rtNtbscUyc6BBCoXSDLc1ev1tsllf3/KhneMQASiCkHxU9m9
	3HnbdvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugREI-0000000F3KD-1EvN;
	Mon, 28 Jul 2025 17:01:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQB9-0000000Etdz-3yjA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:54:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlLdI018828
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 15:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjxEnfFY+QDN6dunr8E34pS1L0NN6GcefMiLtCN2Bak=; b=P7d4xhYIwyqECKWH
	ZJh2ezZWGyL7V2/cW7gwroGRK6soNCpaSN/j30HXtUs8kY+SrGeYjK+Y4z1b+u+T
	lLQR/lvqdJ0nc9BGZLRluYflMuxhWOYkT5Idtz0sa+/fJ7gsQS65hIntm8zDSoxp
	VCilKG2Mf4MANiJvJTsKwCEb7YAhA+1m54OFBrsWAj84QLKjzF3Vh98BOBPmr+b8
	oweVS7ZW5YUf1dHjJ5Mrxd9g4TXREPQ4B3SXwvbAEYavIBYHfjmdq0jyLZZ1GL2Y
	JLKIavjYz2jj8XGJ88n1xfkVTGHMS71JQmvqwW4A6n7weveyC+e6+pV6w5T7b4WD
	kkmCxg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85w58t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 15:54:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31ea430d543so2005853a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 08:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718058; x=1754322858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjxEnfFY+QDN6dunr8E34pS1L0NN6GcefMiLtCN2Bak=;
        b=GWgTEchDbPLuCV/iDRvXota9TtpCBbgDjCSlKyPYZIf3X6vhN5OWjqvr67/xjJM3hw
         FcELqpS7XwqsggHXtud38LBHSfHIXOxEVCF7+MIijIjuyznSsjfr5vbhuJcdemv+JNpB
         krmRr2OAIZsT1pc/hXjIJd9kCMer3LV81Ysv5gI+JheirgXtx9TQx2PeG5O1iYJdVhan
         Wi1AeYE6HACIMZ772qUwcOyhjKnZC9B6NzdibSY/jh5V/M9Euw0lMlHQewqOxxoWEBQZ
         RXvLP8uzlXYpQXJmsLkHInj0nYk7hP7jMoTxtkJzBM5CAncagHqk/rrH9gOhYbLERRn1
         RZgg==
X-Forwarded-Encrypted: i=1; AJvYcCXOl1tUvWmf5yClDAcxgplfKfynh4Nv5JrgGW7XBnLOZsfVkh+W1gTdfLC+Tiwy+gywHNyd0jkrskmS7w+v318/@lists.infradead.org
X-Gm-Message-State: AOJu0YxErns6/O/fatJzDKMWXrjXbiwV2fNOLeDN67t0ZLhU1JDuRBSo
	n77Ju5H1xaVHB8O4cNAJVuCvQ3b7N4yNfqy6LFZS4sk/+7IcglKZdpJq4aW0/CMXb+KZUf8DB62
	J6eVKGEPfthQYY8DEyr3yUp8qRd/j5z4S3mzF2ot1p47v5/oL/lhnh1l4btWIWwxaFWDifLvr8p
	7bUA==
X-Gm-Gg: ASbGncv0nkrZrNzU8Xxz/bkxHFkndOqmdbnU967FXm/2qHDgDkXmgWXjeNDEQX5woQz
	kJ954HTMZVMfps7IU94ZgniE0m/yx1h4O8GtmLe6FretUUlYYlpsOHMhpbf3iBIHmZm/vjDmy7k
	V2B6TNBYMHDLZc9NuBmQKAr7H9thvF4UWZDcEySyrpyNB8nCYlJSqkoyyJBHn/WsqCE7RL/eMg9
	yqfqg100fwK6x7iKP6X3hQXrzYZyqkY0CARiRa5DPAetT0n8UAvj7fsGMf563MY0yjKG47lP4fH
	PAPLlHmzsLl+MyIWEb/TOvAv1yskTkrkdMml8YnvLxBVIS87wnmEIVu6yLtpt4j4/Oru6djgEnW
	i
X-Received: by 2002:a17:90b:134e:b0:311:9c9a:58ca with SMTP id 98e67ed59e1d1-31e7788a6aemr18357683a91.8.1753718058101;
        Mon, 28 Jul 2025 08:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeXZoAQdjpuChoZyAmT/dag8H3KC5MYBa1b5X4wsMiQZTkrmyQfj2y+wxmkWhpDYeZZkkpmg==
X-Received: by 2002:a17:90b:134e:b0:311:9c9a:58ca with SMTP id 98e67ed59e1d1-31e7788a6aemr18357625a91.8.1753718057573;
        Mon, 28 Jul 2025 08:54:17 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e835ad1b1sm6119694a91.41.2025.07.28.08.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 08:54:17 -0700 (PDT)
Message-ID: <1926e6e0-70a4-67fa-5e91-cd0155af1eac@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 21:24:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
 <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
 <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
 <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
 <2a39c0ab-edd4-402c-95a0-a6286f03102a@kernel.org>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <2a39c0ab-edd4-402c-95a0-a6286f03102a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDExNCBTYWx0ZWRfX/sHouNOQjiwL
 f7CWzZirbvjX3W1bZCicEtUtJKBvNybJIO7ksBIZm9Rqfgut0sKkfzc4Oq77WWoR3zcMpLSvJyz
 UH7SjxrpTncqLPGodLkpZACuxG+tK/js/xSovuNCc6SVVawlIjZkKB5N2DkTL1Z0/SBJj2hKSL3
 L1fZO2cSJj68mbluAzQvnVuDXJ4597Iw5KnEiH/a6P5fMMEBT3Au2YP6iNeCFliCJjzB+5IocY0
 0laHEUcFizaW6M0H0SrVzhuy2YB3olNdZXblElebAZQ14DFo9zgJjsHCdx7/L9llHcek/CYSat8
 quHwVydGCz0xci5g3X1SzUzIfscLREpdsyUfW43pK222t7AyG7FI/glviI761HkBmJXM4NoqnKp
 RhNmwDXaufTef4QSUQ+6GXLjEnwUdQqfLfrgnZ7yzxNr5cs9XcztBeTUhvB0Ir5OPFhp2BDn
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=68879d2b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=sFC1+cT0Mn4vjRNJ/HRkpQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=hszVpQ_PDtPmkvUSercA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: xjEl0_0olzO2rd-kuJ-1jHYnbYk7kdTd
X-Proofpoint-GUID: xjEl0_0olzO2rd-kuJ-1jHYnbYk7kdTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=860 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_085419_995776_AB72D44F 
X-CRM114-Status: GOOD (  18.77  )
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



On 7/28/2025 5:53 PM, Krzysztof Kozlowski wrote:
> On 28/07/2025 14:03, Dmitry Baryshkov wrote:
>>>
>>>> and the reboot-mode is defined in the
>>>> previous patch. So, I'd assume, the path is defined.
>>>
>>> As I said, path is not. only psci/reboot-mode is.
>>
>> Do we have an _actual_ use case where PSCI node is not at at root node? 
> 
> Yes, many cases, because it belongs as well to firmware node.
> 
>> If not, it's obviously a deficiency of the schema. Could you please 
>> provide suggestions on how to describe that in DT schema?
> 
> I do not see deficiency. There is no ABI that psci must be root node, so
> there is no issue to fix there.
> 
> If you want to add such ABI, I will answer: no, don't, because we do not
> want paths or node names to be the ABI.
> 
> Compatible is the ABI.
Will define a compatible for psci->reboot-mode node and use it to find the
node. Hope its fine to define a compatible for reboot-mode which is defined
as a property inside psci?

thanks.
> 
> Best regards,
> Krzysztof

