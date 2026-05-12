Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394D2CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=; b=zFfCZ2gSRs7njcKYWbXoe05SBG
	YfQohU7A6EuH+CtnLOYGrUYFAEFtcySi0RU18mC9QFBAMdYpFR07R+mkYwPfVkngX9v0yrPvZOyPa
	gz5HdmKruc/Cojc72ckZxuHKr1umZg/J7uyqJB8JS1/9tL84BuDqPV9nI0COzT6gW21cfABY+QlY+
	CGf1q8Jc1hzuDs63Hec7UFfL/9ejrtqbGaBI16DVAyIh0DK3780Irp0UaVVgAbeQSg6iF+F8Y+37B
	FnA8FggrGb/iOaOMccTUvsolPnYMlDT3Db0yVnSXIBO95agKAphwRNodSXyeRpanyfH0o7vmjTpdx
	CSkLlXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMme5-0000000GjPv-47ps;
	Tue, 12 May 2026 12:55:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMme3-0000000GjPE-1izS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 12:55:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CC4XEQ3321119
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=; b=TiuOlbB/AgwHuWBW
	qs+t9ei6NI0us0ahBN/kkUaZ5BwlyLN/Jrizhtek2O1Rqn/n933rubRmaDLtGjLC
	U8MmoM45eOxUS7jyOhKa4vTvDVvGeRalV/U7j3PBqbpP230xKt3wsCYm4rGO42Js
	uO1Fl4SMQlE+y3HO9+Hr+u0JCVNW1+KjdGhkB28kaDZ8PaB/DiIKgtS7cFAa0A8w
	U3rrUsLxyk9fHTmifvFqr1hg+epkZAdZrZGUHfLL5GUtnrBd4JN5x8vyWAjbLtH8
	pGG5npPUEkY6mB1uBlgxMjs0YtvuvB1LcFxUdYhNCwqhZkyoem9005QZsUktn3GI
	Bn1qjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1r4vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:55:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4678c6171so57828405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778590530; x=1779195330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=;
        b=BSEob0AY0zGA2GragUOrsoccaHP7QShV+mfMHoF/HmY7rKrPRtzpaUoS8tLBSIRjDp
         N9FSB8mxLqnHcNp6fwH6v681rgyQu3HHW42GkkaOBrjYEdTsYvZBzhWv7dRwAS8tiW+G
         hL/2AhQxYgRVTWkCfVfRygpofkT2fwdNky2wUgOLOuCIMX6U3N0NUz9fBri2VsulURRl
         vwRGTgIESLsyDX2s6lnfKQ9ZaUyw2HLUr/41ObJyzOii+3+n/eHLyqMzGkSUwi2KGH+1
         uvd0uHA19MJrk9Thi16Z33hS6o/nSUCMpuo+eyMCbx68RJHdtd2OFIdjNB0PYK4UZO0D
         yKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590530; x=1779195330;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wdLp6i7BNy+BYJ5K4nBEP1KKhbsqv2zxhW4M6f9mwfQ=;
        b=bactYXWrOC6ZRfkBt0lbw8jCgoPtfkOzmNm160x4wgxr0tqYw8gpAzcQiWv93HG0XB
         WkPTYTJk5jf2I3gYuFR6HtHroMwKrtakDj7NXxa1gBmEkoKryXrxUa8WOdVObZXooIYc
         1hNfo5MyOnCoY1fWPfBkq6HlMvTCb80wJH36BjRj2FS1467lqLpdDKe45dLOB3UJhHL4
         0mVCtY8ZmlaAYcBSFwo3QvpVwdtZpOefWWGnNbf2QEUDtteS6RiYR5crd3y6Tlkh7pBz
         70B5DJRXAmch7WP+tDtSxeV0vkMCV+Y2do7WR/8A58reQQNHfUTP/0nCEr3tGlk/aiwG
         h8RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ga8o9XfDssdbrG3s7x3jmXSrZcoZojUOLL2YBnQS6n3uQfKkQEEWHRJq0utFg52xIRqC/9uoWKnIQ4LA8F8a8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg2Ci2dnBQ3tRDHqT3zsCv1nnCAW/NCy9b78R6l//Xi+HngHAB
	B9IDon86KG3NnE1lCICWdQAVfIxLdKGKLXAZB4hv9zH+pVTIbG2qjzEd/E5rwjS0zCxt5e97Q1N
	pRmPoYZTToz9184ZqIpEtqWr8vj6zwV64ilANbz/mRtxNkj2On2HiVeg1h3qMwl0jqRMtlSK8VK
	s9cQ==
X-Gm-Gg: Acq92OF8qhi6/DCt0J9WjBeZYNHWiMcZ9KAITTRFOmrjkt6eE3x9YHgFgPItu5pO0Ac
	IVl0IaWODVxhsNsI5xzuDJ9z76DcOPJQBN5J7/1RVEH8tsoFAf2KDOEPvOb0dNuGuF4tSaZvzJ5
	Z9nrq0EP7GAfpoRewkRlG78k2QO6C37E4cTc1FrCJUwSUJUkXdH8U+72bNfQxOutsNVnq9F0Eot
	FSDxCCWmhvu2Xdk1br1N9HovC9jK3jwfYFkthuk+IgsZnyj4LCKZ6cfFgri1fiV/RvC8acy5bvQ
	Y2NJzPtytVrWnK+hO0Jl4Lbu3OIo6RbHxhmBEeq5Zon4EBH9+uN5eWaf/o6h7kQgRyUlO5Tvk+9
	5bblGD94jaMUWKb43J8OW
X-Received: by 2002:a17:90b:4b02:b0:366:3df3:fe45 with SMTP id 98e67ed59e1d1-367d49bbdc0mr14362006a91.19.1778590530031;
        Tue, 12 May 2026 05:55:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4b02:b0:366:3df3:fe45 with SMTP id 98e67ed59e1d1-367d49bbdc0mr14361981a91.19.1778590529512;
        Tue, 12 May 2026 05:55:29 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d64de478sm11080286a91.13.2026.05.12.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:55:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        hongxing.zhu@nxp.com, l.stach@pengutronix.de,
        Sherry Sun <sherry.sun@nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260422093549.407022-1-sherry.sun@nxp.com>
References: <20260422093549.407022-1-sherry.sun@nxp.com>
Subject: Re: (subset) [PATCH V14 00/12] pci-imx6: Add support for parsing
 the reset property in new Root Port binding
Message-Id: <177859052375.25787.11297345759999790209.b4-ty@b4>
Date: Tue, 12 May 2026 18:25:23 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: gf0Plc74pWHim_hkNaNvPNYFfvp1k5bM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzMyBTYWx0ZWRfX3IyoT6rprJCO
 W5Pc3mykbCwZuHotNb4kg9w4fFw/I99Y+RV2F/pSjv+o4aiqxPIklyr7m3foiCD+RttmaLiCvf+
 hrD2Wfx/sE++yCmYqJwSUePyAR92Nawj5u7G1nyhej662hWIuxoex1KUm+Q398xfkuOzcsaJKe6
 fyPMPTbAJ5aogOWFRz+iwfT4HbrnFG9vrOZd1LQveaNqCKbvlAd9MJYBIaTZhZawyGEpiAWZ7cA
 1Rg047xwRhtDBatzgOLDCa9BxX6z3uDZu6RWnc+esl1YcP6jqXUyJlFyghS4bgdIqFoHa95YcOu
 lQnHuvWtG1u3M2lfdHh4MK5746aVGkfDMLAu+d/aOzZW4moAS/kF1GQRjM5u+hO3K+Ysy2EgdzS
 Q1Mf2BSZUQo+nDUFM4AXky9jlAMdQJoUTndlpf4cZGFb8P5iDDCH5plTqeam0HtLgvzTEqZfec9
 T3gwN1fgcs7t0Y9wECw==
X-Proofpoint-ORIG-GUID: gf0Plc74pWHim_hkNaNvPNYFfvp1k5bM
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a032342 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=VUCeidzB4OgQmi4dmx4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_055531_461886_F16C8E07 
X-CRM114-Status: GOOD (  13.31  )
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


On Wed, 22 Apr 2026 17:35:37 +0800, Sherry Sun wrote:
> This patch set adds support for parsing the reset property in new Root Port
> binding in pci-imx6 driver, similar to the implementation in the qcom pcie
> driver[1].
> 
> Also introduce generic helper functions to parse Root Port device tree
> nodes and extract common properties like reset GPIOs. This allows multiple
> PCI host controller drivers to share the same parsing logic.
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: PCI: fsl,imx6q-pcie: Add reset GPIO in Root Port node
        commit: 556c5f7aa06d3e8119d35f40b6602d3a547cef9e
[02/12] PCI: host-generic: Add common helpers for parsing Root Port properties
        commit: 6cfd1e2fae1bbaa9258794ba9f3128afb752245c
[03/12] PCI: imx6: Assert PERST# before enabling regulators
        commit: 97eacf72d1754eeff8624114074929606fc3f2bb
[04/12] PCI: imx6: Add support for parsing the reset property in new Root Port binding
        commit: 40b7f61a1a4d7fd18188f3f87e15ff5a90ce1d31

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


