Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E072C5AC9E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J4IsFEeTpVt60tPxwz78YvmFb7VqMsV3+47tRUOw49M=; b=gqvvW6eYzljKej
	k7/FbjTM2uU3jtlG1snNYWrrToPv6P0WHOETj6YDB3QNKcAwJYPYx23y+wABCQGraUHaB3Xt3G76s
	GSkBvCHZPCmGb9U8bCxttPLpYwm/T+uqom07Ltvn7oBZdwapT1bYvOKQL24PTgkIRxjBTVXo3plSZ
	39xeFgXmw/3f0hSeQ64Zs6duv3g50z7TlkMpiO/GvUR0ggnue106SDytfQooSrZmEbJ4rqF8a+J/c
	g1s/3qeMSk39GBTFq4uufaWHXRXG3NEx21UjJWeRRqEh+c+yQP0j4AyZRQpY8I8JazREncs74T0/n
	kkvFk9VNSny6Ucyv3mGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG9l-00000007S4x-2oBz;
	Fri, 07 Aug 2026 08:42:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG9k-00000007S4F-0T4o
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=J4IsFEeTpVt60tPxwz78YvmFb7VqMsV3+47tRUOw49M=; b=cOrnTgWTpyZM55tNqxxTKdAZW0
	INeKONbVlvhN37h+WqS3YaELT5VTDREgaFZG6UJlsSAlYKLqTLMhnj2tx6+cTfGZ35NLqQkAGzMc/
	6o+gk3H/upeeBW2vPWRGGAsgC7tkF3h2kPerk5e7B4zbPJlF/HgKjRyv06iemQX28r41z0SA7jSG3
	EQjD+H8oAomBpWkRxFn8jqWY0X6jGbEEyBvmIW2uCuxP2LpuHtCUP3xL7e/3SITIE7UfNijbA7HCL
	PjWMyNGmKxN1d11w5keP4+VzgWXY5SiMZ1In/cqMvTrGwrnKKRZRAmkoHrITnoBRWqwijAh/twHHZ
	Qn/P1iWg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsG9g-0000000CDCn-2F4i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:42:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777ow633176985
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Aug 2026 08:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J4IsFEeTpVt60tPxwz78Yv
	mFb7VqMsV3+47tRUOw49M=; b=JMWoD4mp2izJ2WK/bfj07tP/gIkvUi7iz7F6K4
	RrSpug1OPLUEIjFa3UppKFZybBHpxeMdik4agXgcL6BzSEuwvBROlYkTNhl1QAYy
	XESt0pxhsEuipl2pMe7GE6iekrchbQffqSdRjSwvDt5SdGZjFaVWyZfIuJ+MAfxo
	C4aKNQemxBE+mZRAi8PtLy6/cVjNxt07dOy6MloYowg5i269Nx8TyCfTzzNXX8Wt
	2KY6iaVnPdZ7QykGacOibDBO16z8y0XNQQNg+GwrVqam4WPmdldx2ec0c+zGIqmT
	p7jQqYaNigVsfE40KM+BhlZ2BTNDQz2Tq/EsRdwPneCraYPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jk10f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:42:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494174477so260748785a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786092129; x=1786696929; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J4IsFEeTpVt60tPxwz78YvmFb7VqMsV3+47tRUOw49M=;
        b=LDHiIj1yoL2n4XsdFR3HXQoIsLAbw4MIKH2O6eC4BlIPraLxstwZ75MOlWWUPHvcih
         bmXPVIEQMhdq8RTF0J6bkyN1cplq/LigvFkQS7zoNvuyZFLKVLAx7xF+1FDKUX0YvH6g
         yM32ClYvhBNnZaiu3Zv3hOgSVcQHUkhqWWX76MAGtcv1V9kNnu1fzxGLWgOAgDVgiRcq
         0IpGwPMFRiv5PYDWbT3rwtnJ2Sef3uSUcDM2o7MlA+URVIJ9CRHbmGxVjwWMlFTpEbVO
         vAwql3y6wPX/WTxoqHWa7CL8+8nOV45z4k18kCEBBAcop37Z3yD+hPvvqp+BJmf4wLxJ
         FqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786092129; x=1786696929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J4IsFEeTpVt60tPxwz78YvmFb7VqMsV3+47tRUOw49M=;
        b=c60trEpdVsqgndJG2dKJen1W0dXAt2VqoT6EzpU8TLfd2wchPdubXVHEGrKe7wk3C1
         diNgO2vwREXPHb4sX8GVWMOiotdXQ0E0x0OxD6AC2hQZm1c41lho5OKT4RM5ZFJHG8WN
         D8C2/7SHwPf8SG/MqI2qp187wN348a9MpoJtbFJnuQfEHRtdVSwP61CLts9Sqlqxm6yR
         g9FzD+7SmfjA23XS1vSp312vzLmy9GT8lQF3lYIN4jqYchZHLit37XO3JOgPRQWiBz2z
         zodnbnxwn9s/XREfKf08yGwgpdwo5/y0iNYTHYC5aJtgoKqKK8Lk0MUyuSWBXDdeKDbX
         9mJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpjsm8yvRhsUBy4RBDtH98b4IXU7Jkg0lFbnzb3FotXUQVi3tKSAcftcBqf7MDvjRQ1cioDVoVLwftQ1+M4YFvt@lists.infradead.org
X-Gm-Message-State: AOJu0YzaJxey6lEWjEl6uw000KDxPDCu4kPYGhjJgxS5YRVQNCxloKmk
	vNQxJT083dQeo157X3V5RAlx05/Tu+oZtfYO1fsXxbLB2wiu7fmGKifZzL7naIgAmrXaaJt7Gmf
	8icMLPZV4JgRhUGXd1wrDuL2p97Sycd8U+O987JmXWIktNYs8CNBevVlINGspV9fZx5av9jHUPQ
	lW8A==
X-Gm-Gg: AR+sD122Rjf+AjSzXq23qeMR0U2xpI0KM/BEtn7oM9CApIavC7v3icYw5efVzjFF7Lg
	BXbxGfRjFwiYGvpgOsSzXas+5EkWyPXtK8MNTrm4z1c97NGauhsLgC/73nOAYeEWIdXIwlCJxRK
	ZpNw9PuMQ+UQ9F8XYPI2zk0JIqxOXG8M1tgWcoWkJF7cJYirEjLZnbyTrTlV50tocmSd45/N5gn
	2eR13/K3pK8UbmQiGW66ziOH2xrC3fHnqUGJZDbU9xQJS2T4LHqOFSqRmGZnVry35BVuqUzomh0
	1OaNm6i2ofGbkwiAGQEGljMZC+1PyKFMbo+tA6o/TzTJFFyRTZ4s5ZwRirvdq5msl1+GyxvGOfU
	N5gErJz9b24QtgNw=
X-Received: by 2002:a05:622a:1820:b0:51c:963:cafc with SMTP id d75a77b69052e-52ce61e1e39mr210588461cf.41.1786092129682;
        Fri, 07 Aug 2026 01:42:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1820:b0:51c:963:cafc with SMTP id d75a77b69052e-52ce61e1e39mr210588091cf.41.1786092129238;
        Fri, 07 Aug 2026 01:42:09 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420cb4esm126033935e9.2.2026.08.07.01.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:42:08 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v2 0/2] Implement mqprio and ets qdisc offload in
 stmmac driver
Date: Fri, 07 Aug 2026 10:41:38 +0200
Message-Id: <20260807-stmmac-ets-offload-v2-0-9ac67af92cb8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQrCMBBFryKzdkqSSjGuvId0kSYTG2gazcRSK
 b27oQdw8+Hx+e9vwJQDMdxOG2RaAoc0V1DnE9jRzE/C4CqDEqoTV3FBLjEai1QYk/dTMg6t1W1
 ntfZukFCHr0w+rIf0ATMVnGkt0NdmDFxS/h5vizz6f+JFokTfGqFlp51Swz0xN++PmWyKsakB/
 b7vPxYW4f3FAAAA
X-Change-ID: 20260804-stmmac-ets-offload-cc936c99fdb1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, Alex Elder <elder@riscstar.com>,
        Davide Caratti <dcaratti@redhat.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NCBTYWx0ZWRfX8xFo3uIC96Eg
 e68LrpsZx34u9W5BGhzzdjYom6LFz+22jlxbY+Ctfdy7fbJl6IHQG5Sp7Si0VKv2gKBgcm3pJtT
 xJ1EeiXmXAyMalyfYUzhOyemg6hr4NFiaKlv08BlCjsRrXaSK/Koxh4Hf4xrS6vySruCGBGn3Ku
 0++G29v/5e8KBLKhmjF0wdDdKPAnFWcsza+ueSlymO1Rf6dffB2g2kr22SeEmWp5J8YFnclrnOq
 x9H7EJ2sxngt7IDMAGTy+6BvGdlTliO2J/LEMjiUSKePYV1Dniq5GddxnmdhCUvhp7mG7/HmWRE
 wUNJR+N6GVi1R1JmxoR0cojjbqbpRoi8SM6djT9PyNd6NPb+l5MFoxZ9Nht6NZ0pfYkVKrgwzsu
 xmf2HxtXzhWBeegQlvopq6c457jKvZAzBfbF3yuRGk83FI0xzI2Y/eSdzZMAp9TUprfwJ+COB8+
 uQcMrrcC/88cx8njXDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NCBTYWx0ZWRfXw9szN1wIzsKJ
 5HduGNbH6aXRL7JkE8c6akfBvVexIBGckbwMb6TzAHow/nrCODHFVOuhbcs9n/HjUpb6LAJ0PN1
 +GscVGHD6AYPsfz857sN/zv1zi+arrQ=
X-Proofpoint-ORIG-GUID: JkAaFqrdZtvgsKFAWVfB8hUY7NeorOdY
X-Proofpoint-GUID: JkAaFqrdZtvgsKFAWVfB8hUY7NeorOdY
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a759a62 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FsjTgQVixRrW3wEsH18A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094217_239286_4B40E640 
X-CRM114-Status: GOOD (  11.65  )
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


---
Changes in v2:
- Implement strict priority policy in mqprio qdisc offload
- Restore to dt configured values destroying the qdisc
- Do not ets offload if there are any queues in avb mode.
- Re-apply ETS configuration closing/opening the net_device.
- Link to v1: https://lore.kernel.org/r/20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com

---
Lorenzo Bianconi (2):
      net: stmmac: add tc-ets qdisc offload
      net: stmmac: add tc-mqprio qdisc offload

 drivers/net/ethernet/stmicro/stmmac/hwif.h        |   4 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   8 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  35 +++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 100 +++++++++++++++++++++-
 4 files changed, 136 insertions(+), 11 deletions(-)
---
base-commit: b0057c68df711bf6a62033c072ac61c4f9d3cbc1
change-id: 20260804-stmmac-ets-offload-cc936c99fdb1

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


