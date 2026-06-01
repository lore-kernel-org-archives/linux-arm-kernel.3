Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C06CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=; b=gnjHIhVDHQDD6mYjbV292DfKna
	BZE1tIVMvxYu1xxyKIEqGLpCs0pJsv07r5EYQQbZ2FtvYdOnUrF8pRa37f18KaGZkV5pjhv1QNHvt
	XqWGZ8utR1X+Nlzhfso5L+HzRC1LUAsScvevHDC7/atpfZln9g9+4uK5r9juxVmuC+sGVxFcajDMZ
	U3HiTWEm5RF5199xQyOyHMMX4GaZFGYi7dKmRco+7H0bbiuOw+xd4lYQM8nw3qx94t8zD7Ps6Cdkx
	LBkoou/ctd1nd5zeucg7fIx7l0p+jnQfICJvWYxMzBiWmpMHXDpx29g/LJa6GqBxmBjNQ2HqV9RoV
	x3hW7jGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwMY-0000000ADwz-03W8;
	Mon, 01 Jun 2026 06:43:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwMV-0000000ADwZ-3zKh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 06:43:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VMguxj1445571
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Jun 2026 06:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=; b=fCjnLsQ/g23ip7p7
	oBu+yycb5ND+i81+X9WRkdQWA08JR4L5yOXw5aeuGQE6c/oLdeRYlDn6f/EGKlDt
	W99a2sm91LJ/sp5Hu1sqFS9YntrWh1yrFdkywUpD2uGa9ML5pbH8iOHUdZv8/fKM
	YooEYIDLEwcA1iignOtMKMh7h58yTQEQJvWrViyezdAsQODRwoCpMFFVk/j1eZuv
	V2Kcm7ImvvwPLOG8N9F58VcamlnEviarqp5XgBrGVN0PUAhAQPnSelfdNBeWZUzq
	ojMYfNTd8C5t6MYtCO4J6UnjBpFaCZKIU690IkWh4qSjhqt2KChBchMArhPzIKhh
	ccnwLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr41e4tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 06:42:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso6217709a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780296178; x=1780900978; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=;
        b=eyNm8lkLYu13rOGEGCOld2xTVTrL+Rpkxt7pkdW/pp3TMasBNYSWrQqlphwPTfIDf+
         467Xtfq3CappQn6LwEwaBifdjtHWUZJiXb80LuIH9K94ayKOfdRguiS3fIaLBZ+Y63vF
         ZVYmHglnWYvRTHB29uqVhtf5e3pUAQeqlOyBtpV+eGMn6o6XI+OWxhg6dG4rPPoJyTQQ
         nsI60H9GMOZZlHPytOrFehDY1D4zRKan5JyyKAUdYCmiwNuUIiiDMXg161t4D+uHTOJQ
         nr+cwf1OryWYfokeE+zAC6wBzK9lgPjBQ05pmyBArLMDtNOGYoJRfgavTSaTXObarzd1
         xg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296178; x=1780900978;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUoRT/umrxuN/KHs4F1vXvDSCGOLYsWvMyewnQxtID8=;
        b=orJ4npiKbokdGNwdVjXpCHok/jskJp8LLsSsYFPTTh/ORMXWCnrvE1YLF6sYZA8U1J
         CqwHVCQOPkBltlCOes27NYpkRJka6Q1Zrk0Q6R+7Ps87+W2XcWearKioang7W9rXJDiq
         74vW33olQNNKJi0xDrykSoPGbeE3u99jACha73S1GMVoyQfCt7h/d9aS77AutF6LHFwW
         99h4tBrD/Lu7tZv1MpGj4ttuRkvTWOVJ8aNaeTqwiGIGFZrgHFOOYIPEeNsFzTGm/Qfl
         KhEb3tJwk3/Uz6yzOaPJ1QXm9iTYkHRxcjuMyrVvURflEBsYNPMwBIOeoE0cCf83KlNl
         vlug==
X-Forwarded-Encrypted: i=1; AFNElJ+O0gHb6ARf/hMfBKdoTGbM0I694xUM0ZdCNvNMXCIu4WohfrW+M7QDljep8R/5JALN9jEX3v16VrOYmo28h1XD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhvof99Bp9/UclePPUMihkJhCsfQ8O5rspTDKVEqpn8ceyD0rb
	HudxSVqljbeD+uwbWjTp+KlYDeR9tfIm28iJC19zQX9tYRf7OQTqDv+8SA2MtSR/6cVr/v4Ereo
	I/AHrj13eselGeNOgw7vdJP1INmVdECkTw/09uaQMhYe5Ej2WihsJ2IK8tSdIeVfqLM+hvqtLpp
	Ukjw==
X-Gm-Gg: Acq92OEKd+QZVD1rqF4Pzu4I26lSZKao8SYw78mcl4yXKpEh8ApPHwGL/6LZznrmeHW
	3+KdM5Olbial8XgIn0Ion8JgSm5MPNGPtH8VE2ENXFbrR1H/zVeH+Fd+NJkMEXy2OjkciPOMFwh
	kabByRDAlMFqDYqlQk5lqb+ZnrVUzGpUX/MoPZHaGXdbOhlYKq3MJLYRsmHMWPMlge24A/gsKdh
	miJhOGiESiSqrem1VW8tt9eU2IccaSyP4t2pRmm88zEgFdQXQvIamXfIW1rbvRhbvhtA5cz4Oc8
	3BUiSr/EruhykIGIbpzzt3HQReFRVVR9eInPNjTsWsQOAtp/XEQPljD75+I9DxsxcSiBfuniiaT
	BZMKJtQ9kYKffhERFfEl+K3cfwgyY2jsxao8AM6JwtM62NrJy99wkX5hP2/Sg9Q==
X-Received: by 2002:a17:90b:5704:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-36c501b8fb2mr9707561a91.17.1780296178459;
        Sun, 31 May 2026 23:42:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5704:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-36c501b8fb2mr9707531a91.17.1780296177992;
        Sun, 31 May 2026 23:42:57 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc65e7afasm11934608a91.1.2026.05.31.23.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:42:57 -0700 (PDT)
Message-ID: <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:12:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Content-Language: en-US
In-Reply-To: <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOEJG5ae c=1 sm=1 tr=0 ts=6a1d29f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5UiWIToyZdRRPDun-cEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hLIC0JCzH7DKaGF0Rfm7GxLgZ6q_d22r
X-Proofpoint-GUID: hLIC0JCzH7DKaGF0Rfm7GxLgZ6q_d22r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NSBTYWx0ZWRfX7aQjah5f81Rd
 r3vzI6UovNCAKpDdRmtHBvDSXMGVPLefXzUDOaLHiJ4nTbFtG/E+4AlnmJJeVO/fP40jg1brEuh
 8ovm5KAGywITfFy5FPQgHP+W9iKTkxAxtIPka6D+HxUM1jpHluI9ynUqEY0RX/T14KHubh8vE1U
 IEDjfcnphecvKT31WFSia9lEZE7aMjwcqcv3S5jYv69ACYM1DGbRMmXEBo8gjaJIwcD1d+FhDBU
 PeAi8qThuD4dBYhuuWaACJHN7eenXX7/pVP9gUiCfaUFTzuUFeAIIK/zkuHz4eui/Uy3hvBpqRD
 8tmbNvqVyASKJI4c1dTFFEZkjONDjdA1fEpb4jhIaJTCB7SyyufrLKhjU2tbQvnDzEZQEWHKpXZ
 EGog6ESW/OkxI+oB72y7gR2XPrVCWc3u9F4MqlO232UZBkslMi2ph0ewJZ7iSbmP2xLxwqZ47lx
 3TYOFP0c7pxBmVoVNfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_234300_027455_3E2B1664 
X-CRM114-Status: GOOD (  16.20  )
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



On 29-05-2026 20:28, Bryan O'Donoghue wrote:
>> Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.
> 
> Which will be a problem as soon as CDM is attempted to be enabled and yaml changes are dropped upstream.
> 
> Hmm then it seems to me that five is too many for Agatti's IOMMU set.
> 
> I'd like a number list so that we are discussing facts instead of nebulous hypotheticals.
> 
> For both Agatti and Shikra.

Here is the full IOMMU SID list for both platforms:
Agatti (QCM2290):
- 0x0400 0x00 — VFE non-protected
- 0x0800 0x00 — CDM non-protected
- 0x0820 0x00 — OPE read non-protected
- 0x0840 0x00 — OPE write non-protected

Shikra:
- 0x0400 0x00 — VFE non-protected
- 0x0600 0x00 — CDM non-protected
- 0x0620 0x00 — OPE read non-protected
- 0x0640 0x00 — OPE write non-protected

Only VFE SID (0x0400) is shared between the two platforms.
The current Shikra submission enumerates only the VFE SID. 

Should CDM and OPE each get a separate YAML binding like [1], or
should both be part of the CAMSS YAML binding? If part of CAMSS, 
please confirm and we will add their SIDs in the DTS in the next revision.
[1] https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-bb1055274603@oss.qualcomm.com/

