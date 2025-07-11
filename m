Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B265C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ptpi4wEY0VGWKqhP6TpsQQpNA7vOEtkh/zteGyElO4=; b=W/tMEh6rclRITUR085/Z3YZyNF
	YesXyr90l03/BEucWbEv4qZMfQffjTmvlwctx9TGlsMlfqUSJ5E+a72d6HG/itSlhtl7t3rUewOq3
	zqMfCD2e+34Ba8rmfLlMm6mf7UjhBXhNbcJkyfz3IAbw8WEjhPzHOZV1kJhxN04tVCkwIvOrqlrWY
	ueQVGJllLchH0uOymeHlXyE3Wa6pnMqKf7gPcZxiqBaAzcRkeoY1bvM6gmb2wbjhfOXA8TFp0LXIJ
	e/KaNNg1fM+VyJD4cSTsKPwHgEBpBZ+KgL3v/OOZkC2umAkW5zpjqOQqS8tusMCQti/mdSKLB/7MQ
	+fXa6U/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCjR-0000000Ej2Z-0hyl;
	Fri, 11 Jul 2025 12:20:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCfz-0000000Eied-0ZPJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:16:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAJxX4003966
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 12:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ptpi4wEY0VGWKqhP6TpsQQpNA7vOEtkh/zteGyElO4=; b=S3GWZoan6d/rpmox
	q4U0H4l9UhJz6raT1pEsDusqo+f417src7m+DQAdVZB7kQtM0gQ6fbZibMCLMqIq
	1QqgAhdm84nWqNbsz8yJj0/L45TNBFWPxv+CyUbL6Kva+qVU+6lxMl0dPitizGEs
	MCYmTVlYh7+LmkmuW4iyW1sfVK609ikHEnfRn0BgQ48Oifo2Bd5Bxo+uEwyDSHBa
	FuEKVYdf/pHAvU0XpV2a4POtgq4z2KkQNUypj7blCgJaHzEb2HhLcDvmBwXtXyru
	+PG09gTglWi0/wrXXO0K1QrGwIIE1xJJ3knryTZRJ5VYKOlPVNJw51ZLO0ht5JY8
	a+4ocQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp0k3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 12:16:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7dfd0470485so15657585a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 05:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236185; x=1752840985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ptpi4wEY0VGWKqhP6TpsQQpNA7vOEtkh/zteGyElO4=;
        b=Ndi0T5K00s+NOt/38Ukedt/gcfcK6pJAzahpGOTfMkB8Lj2AMROzxfKhx9Vhq1/LY/
         xiYNpqYyX2HyU0Ra0SHtH3CzxH5EpK38vHjHT8CQdBcA+ZmZrLewPLSF53z/21mit4/5
         piMDZau+r3CnsijbUAxwToOhuDhB/zRZnyQT/Vk3II+2Q2DMulha+SuJFNfA2BDrBAkx
         gTE35Crlt8OKqC7sIOAy4f7phVFGvCWn3yKylEu/rBDhTGVCokXp+nYBinl9di7Ib+Ir
         O/n3EG36+7fUy4/SH5TL03CWoo7dKciCj17FUcSvfYbiAGKf0UWVh5R25v6OshQu9oLh
         pAow==
X-Forwarded-Encrypted: i=1; AJvYcCVvlfG/KctoPPIQOnaZu9KHBCQh/OaRjEdne5eqEfeibVNsdGA7gqikMcfoXBmsB8Aio5CBh0JbBRssBEh+9nr5@lists.infradead.org
X-Gm-Message-State: AOJu0YzrcYl0+OsikALuTh2JwFRuWsBIQ0dugC6zJtTokbypjN3iOf63
	hpHFTrnjvaSjg99Ekgoem9ZPkM2MzD+ALxIRP1d6wOc6OlpYr46JoBdVYYgDjordJDyxU4s2OUl
	n3+C5KmzsxGOTUNLbQGBlElre0r/SyOJ/SsyRP6wO3bzOeLALVqo35/6+T+HlpY5yafntSeSc6J
	H0hQ==
X-Gm-Gg: ASbGncuIvXvZAARyWUPXFea93EScBRHRZn+1ElS7gNUkSYmSNfcHvQ5zFmvtj8/1VhK
	rwqhmMudrFXwAcdFI8HqX0amOOChXFFWmtMHiak0ldBPi5fKLPVD6JW6yz7lsV1n+uGEBFKKRyd
	7yQjzeZIdn7RRKrijlPsfi63Nh35iryzSuxQU0xxNiTdIVRNnIr4gzq/iUZPpx/eDoSUm+0ksQY
	Pet6GTdmlh1DP/Mq66ne0068GmVX/DJui6LB43b7NQ0YDfn6g+vo0ELPNoYzTXA8Ej/1GI+QNa8
	o2EL5C+P8VVMMr/fBL8ip8bgeMFHThvCrNi0/eoayzaK3ozg5V38Jfn2p2mCNdztv1vE3FgcBJI
	qqZFKc3opBpUJeT05wpS2
X-Received: by 2002:a05:620a:4004:b0:7e0:1c52:685 with SMTP id af79cd13be357-7e01c522468mr49297585a.5.1752236185077;
        Fri, 11 Jul 2025 05:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwKjT0BW3S+d8V+GzTuZSU/tPNQqmTbJ/pUFGmyL6fSlH8EpT5RkkPdl3aoxFddiWPJQIw9g==
X-Received: by 2002:a05:620a:4004:b0:7e0:1c52:685 with SMTP id af79cd13be357-7e01c522468mr49295685a.5.1752236184618;
        Fri, 11 Jul 2025 05:16:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8265bbesm286528966b.80.2025.07.11.05.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:16:23 -0700 (PDT)
Message-ID: <0ef83a1e-38c3-41bb-8fd2-c28565f2a0ba@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:16:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] dt-bindings: clock: qcom: Add NSS clock
 controller for IPQ5424 SoC
To: Rob Herring <robh@kernel.org>, Luo Jie <quic_luoj@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-7-f149dc461212@quicinc.com>
 <20250710225539.GA29510-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710225539.GA29510-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NyBTYWx0ZWRfXxzheE+F7V9wS
 +KMiC/gqMqcsJjLsQhlL2n88bnHjFksdiQKST+Z0vCxQmz/8A4wzNemJeW26HwEZY80H2GBau10
 w0TkZ8jCE9zCn0B2iptTv9H2+B1BxyGME88RJGm0ksRmc2RFBjb0x9qVBzfmYmjTMzTty9f/szh
 7ARxa94x+ATTTzr9KL3uK1lvdYGKfIKk13Tqw2TjTGiMPyNuvzIgIqIXGWMscRmwzh5fqb0sMd8
 8gbLWFyTKmhhJZ7A6V9g8RjXnWuUY5BSf82o2RaSB+dFxIf3M6gvX4K4YiMOBp8yP5vEOV40mht
 T5VvuzARhn462+cJnSxU3TmUdrzmKRo4WeDqwR4O/3iicFGrw5Vsg3i6PWGLOrfWd2lfMLUbUid
 Rd4DBR7z1sf5kok3BKgNtdYi2Y1HEoCRhjVn00Z4at9u2K1vbNL0p1CvTIH+thkTdRoRUKIC
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6871009a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=AWTENMeICeJJ9JQOPWgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OgKhyjb-qM4UyZiNkypkgr1d_RODpWXK
X-Proofpoint-GUID: OgKhyjb-qM4UyZiNkypkgr1d_RODpWXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_051627_184024_BB1556D2 
X-CRM114-Status: GOOD (  15.02  )
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

On 7/11/25 12:55 AM, Rob Herring wrote:
> On Thu, Jul 10, 2025 at 08:28:15PM +0800, Luo Jie wrote:
>> NSS clock controller provides the clocks and resets to the networking
>> blocks such as PPE (Packet Process Engine) and UNIPHY (PCS) on IPQ5424
>> devices.
>>
>> Add the compatible "qcom,ipq5424-nsscc" support based on the current
>> IPQ9574 NSS clock controller DT binding file. ICC clocks are always
>> provided by the NSS clock controller of IPQ9574 and IPQ5424, so add
>> interconnect-cells as required DT property.
>>
>> Also add master/slave ids for IPQ5424 networking interfaces, which is
>> used by nss-ipq5424 driver for providing interconnect services using
>> icc-clk framework.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---

[...]

>>    clocks:
>>      items:
>> @@ -57,6 +61,7 @@ required:
>>    - compatible
>>    - clocks
>>    - clock-names
>> +  - '#interconnect-cells'
> 
> You just made this required for everyone. Again, that's an ABI change.

In this case it's actually valid, but should be a separate fixup change

Konrad

