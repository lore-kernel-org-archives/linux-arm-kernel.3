Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FB2CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsAgKQLTqqBsaH8gJxz6UunUN+XMU8p/s3pmuCBnLdc=; b=4ORtnvNsCkNXxfM4ZbVmrfMu9d
	5ecpwEiHYXQcSfNNoiq7tmoi5MH1q+Iw1Sy5kWlQrnQYlVzPap0aTQSowAFrvcYR3Eu/FRhvTSdHo
	M586ZUa11+fn+mJHzl4GLUJL/smFpUXf1aOPBSgTSgVqDWDYz3uO3bEvybalxC7ATGmajZHKuOX5M
	xquxyJtYTbQHjRaywXe4VWJwsTnhMMTZdnr2HY6AILokpf+snf2SJdQsm9CCqWsG0U5nTJxYyt6ux
	ddA/aYM4Ny70fLaJeB4mXK0tTJzd1sMJmOjYNgG0z83j8hP0gwDECK6CZ4ANfZhnhoC9QvmqFdBCm
	CC3TiGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsTc-000000059yq-2NhL;
	Tue, 09 Jun 2026 09:10:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsTa-000000059xu-49a8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 09:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FsAgKQLTqqBsaH8gJxz6UunUN+XMU8p/s3pmuCBnLdc=; b=hCuDFD5EJ5s+BIClH/7J83gOVb
	LZi5hwSozj0UGY5VBQaV8+AudVq3lsKS3Pty4SObPd9Z0WyeuieEegbcm2yKydlwnSKE/6QwBItke
	eZdFkIz5u5RL7Ss+L03hWhhqvrwLO5/i6mItKndjYrLLY9wZQEE+tctBAy4sM5LJTG64mJOt3VAt/
	ApThpbAMq0HCeXoEC0dxeQnssLRJUq2QK7do07frXzOSFl72xDAruxUp5elsiUGhKGvvEp6SWj3rD
	YYoK+ktR6td7lZDDTfcQ3+5twaGwwh8kTv7fB9Do2gM7mrwSWdJrdL+VmRbfLNtN/FDLdolCJKDFX
	Lywlkjfw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsTW-00000002E14-2q8t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:10:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rtY21587549
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 09:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsAgKQLTqqBsaH8gJxz6UunUN+XMU8p/s3pmuCBnLdc=; b=jYvHar5WxGNuOfDH
	aRKrJA7I/I4F1R6q99UP41suPPlymT8UHMSKOoWBlYAx2eUJRtm13uPMEI2kmmWl
	XfrQN1lQJ/MpA7r5occZ0EhWYp1IAnXJc2xh4DTfxFPjk/pibv96THd+qBIPlEfx
	Qk58Qb74lWhVWHHjRr3Q0gS6AR5W1n9fI0h/MAIWdkXILgMgtA/Srk32VyAZHHjC
	edYMIo+wrDA8aM/7PRzAdaAYBnkNevWNNbxJqkrBOveRiEmDRzdo/5OBt0vwBTjL
	S7Agtv5Hfh1WPr+ie0D15naBJUwJISxwXHJLQHlBoCKiy0HtDrnx6luuFsCSpcEF
	v8AZ7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m51ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 09:10:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so6935089a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996217; x=1781601017; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsAgKQLTqqBsaH8gJxz6UunUN+XMU8p/s3pmuCBnLdc=;
        b=i1U+kxITuq8d5k6n0+yGq4UcNCmIwiP3/T1aTYYj6lwopMqScvmyE3QOGhMg/WrQLO
         sg+Qd019/sXATeYTSUSYPTcNiIYGX/nmgJm69pEePSM2SvSmvCDPbsZ+3wRpXR2bOpPo
         o4TxhKFETEftLOkvwsUB2zzExBr8CBexxhUW7CUi1WqcvHMoSCOy/egBzY5wcKt2ZlDJ
         faN6YIrCQm+M665YEEfqO3eXiQvfx0o5AecifDa3LcCA/xf6BqdRwpLZ0HgICdamOfyE
         h6PYmISweMkyYpgFwv3CgaEZjBtxyMLOYvdEfb3R1LAOSmOMwZKga+U2W9O2WLgvxo7S
         Oy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996217; x=1781601017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsAgKQLTqqBsaH8gJxz6UunUN+XMU8p/s3pmuCBnLdc=;
        b=DENv7Wg9ZHXhql2Ix1mN+mvGaDTlYmS6l7QNGFZvP8zJVaFGoMEsAqfFPwqhE3oTN+
         sIvwbh/TZfAexehEtOkqVHxBmRLsLcNh55XmadguKZ6ECqaOMFd7EfWhgscY1Ugd+UfE
         9KQYE8/2Zvti/q+iCGaVn+tY28+pBQh0lwwmH7AU8ZPvDCuGaa2QhVxmnEOU6F5Gu5G8
         0u5YwNLurCRoEvnIPAxRg2IPLGzKgEx9qFCJznwKHikFgbmmX60gsM33RM1brdsRVbJa
         Js569mhf2PqBH4sbrcA93Ljgnqn82znoJngeQoGrOuZkI4oQKg1ikwPpfZtbkCE/XDdL
         LX/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+KLNL2F1k/ZBBOmIEW6GSufcHdYeE8skUTYItQphZw9P9F6+maIeKsz57ivKVa3pULOEiy0NJ0I66ZXJo0rBhA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdc+hEI0rpspe77dssZvWnjj+p+2u105JMHsPrlE3B9HIQA1Bm
	O/7BAkXBDwKF+oEwT2rTz/3lyCIu/0PinaP2H+s0cLdna+VOBNpDaz6caBYfCK/kDGDCXTgvKZm
	gQFCiIqLxiZK2OtcAyFuWm6X0tRlhW730/7PQDvFJfwUNktEaRkuD6kQ3G38pDzboof3xLA4uMu
	BxFA==
X-Gm-Gg: Acq92OHtV0XWlcK3zlnnNr9+pSrSOqrG4bxH01WgeGpjKiG8PNR6V5DicaTUzut29mY
	5TiNb+BJaG66VZwhurZXLUi/3TKtpOOe0tQ0kDs+cNHHwfa3sfqnWZJGDMWmcPABZosGLAm6Bb1
	2IHPi2Kesh44F3/Rc0slv3QseAapac9Nhzy1iQ+ZWYJzP8LNDxRD8eJc0qc1K03xAJvDY2DYs/X
	qh+XGUV1mnolpwdsWxqHUWERKpqd4GFgdIyNCNOTM4eyssbiS8FC7SZkyJVDDoEyHKHK5GlKfls
	qpMOXhsIlI+8eNMBSjIsc3YKrjiOV9tyR6km7GR8FCfbLYyom+FWTjZRp7GaiuPP2AHeUggELe3
	lRmKJ2VCiVyy/jSU9tFsJONpzJ966M59cRZZd3JXktgAyCnS54MNF8FIiOpCIZA/Qfu+xL5Qths
	k/BfTiRt6Y1PJWRDjkuQNexw==
X-Received: by 2002:a17:90b:3d8f:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-370f0772dc6mr20194890a91.15.1780996217261;
        Tue, 09 Jun 2026 02:10:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8f:b0:36d:70c8:3a3 with SMTP id 98e67ed59e1d1-370f0772dc6mr20194847a91.15.1780996216828;
        Tue, 09 Jun 2026 02:10:16 -0700 (PDT)
Received: from [10.133.33.202] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6d109dcdsm20890722a91.9.2026.06.09.02.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:10:16 -0700 (PDT)
Message-ID: <5f74ad99-87ee-4d21-ae26-80dd462d98f2@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 17:10:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org,
        linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Zhaoming Luo <zhml@posteo.com>,
        Ram Kumar Dwivedi
 <quic_rdwivedi@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260529113338.984301-1-can.guo@oss.qualcomm.com>
 <20260529113338.984301-2-can.guo@oss.qualcomm.com>
 <20260529-neat-bright-shellfish-eab5e8@quoll>
 <ada65ce2-6736-44fe-9396-d3ed632274ce@oss.qualcomm.com>
 <b445e9e3-dfda-45d6-bafb-a2deb3357144@kernel.org>
 <7d49742a-7602-4f58-8dce-7e02664b783c@oss.qualcomm.com>
 <64bd6272-6111-4ffa-8a4a-366d0c287693@oss.qualcomm.com>
 <87c9f8cf-1300-4dae-82cd-fe6427649cea@kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <87c9f8cf-1300-4dae-82cd-fe6427649cea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX2xCUPfTjLfRY
 GqeZLShZNWLlcQjqaQKn5O9HIHsPIhn/ejHdQefTP/+VT0KNGxhirR9knVxTLYS6bvm6AfTlbPP
 wNyqQVNZ5D6SmxWi5oh2gkoxFCUE+Sy24HWcB9flCOeohRR3b7Mfyae4wIgde30OHk7m9W0kXXk
 LcQYEAuUvklnybqNwj/bneNpQHB0wa50VBtwobl/95hOzMKauevdekHurUFIwQeVG2DHwIaG0/q
 nbA1J/TSJ/vw7HzDGMmAldfMNVKl7Jcpv9v+1+yDMX/IlLl1AvM6tGFHF5Ex5rpPTPozURl5P1G
 oS12ck2TN44HXJdjWaiDiQ7pXnsoAxdnHMSsAhG4EgXJQwwQjA7g+1QLqjM1xD0IOh/enaNQdH7
 Ic6EFkFPDbtIfoOzkubNqqUG80ma7ZEbq68euk5Y1fKeoNEMjtG740IT7d/epvcmONRBgUE8X/i
 jwhyVVdpslqUWDy2qUg==
X-Proofpoint-ORIG-GUID: gyw1prLpRQHjlTyJapi2zx-dSPlWXvSI
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27d879 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=uOah4UoORehCN5dyJioA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: gyw1prLpRQHjlTyJapi2zx-dSPlWXvSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_101023_541120_F6AF4DBF 
X-CRM114-Status: GOOD (  12.99  )
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


On 6/9/2026 3:08 PM, Krzysztof Kozlowski wrote:
> On 31/05/2026 06:48, Can Guo wrote:
>>>>> is the minimal encoding that covers both.
>>>> Again, why do you need to encode '0'?
>>> The tuple is still needed because Precoding is configured per
>>> transmitter-receiver pair,
>>> so each lane has two independent states:
>>> - Host_TX -> Device_RX
>>> - Device_TX -> Host_RX
>>> A lane-only enabled list cannot represent directional combinations
>>> like lane0 =
>>> (on, off) vs (off, on).
>> How about we split into two properties, something like below?
>> tx-precode-enable-g6-host-lanes = <0 1>
>> tx-precode-enable-g6-device-lanes = <1>
>>
>> Only listed lanes are enabled; unlisted lanes are disabled by default.
>>
>> Are you OK with this approach?
> Yes, I do prefer this, because we don't have empty entries (<0, 0>, <0,
> 1> ....).
Thank you for coming back. Sure, I will use this format in next version.

Best Regards,
Can Guo.
>
> Best regards,
> Krzysztof


