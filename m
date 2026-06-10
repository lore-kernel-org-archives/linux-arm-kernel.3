Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D35CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=; b=E7/6Q0LlVMfW/dVXLmRT1FVbRC
	u7dBJ1Vhhu55D078M4wZrMUYfX4qQrLvuJgKhiGw35SgilROf3iDOMlvpR/BJrQpf4G5mkBBM9gws
	QUJLlvoD0IQXcOttP2Ii9RkSt7uRoX3A6JCjhVv7viTc991yJxiDta8DS1dkYtbovlWz5f+spkAYN
	Hfn86Kp+0YCCycKJA4I6U+7B/Yts09JGMn8omw6B3967fInfnyJoZVi/XlswpQf4Ds8ScuZJ4s/tK
	uKH2wzUuwqCJlO2EAFfRGN+51bzGqJ+0Hoflcq1Zbzl98UcU9U94KgdszDSEtBdBFC9reJmvFFdg+
	aupkMe4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJIK-00000007o5g-0LVl;
	Wed, 10 Jun 2026 13:48:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJIH-00000007o56-32TP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:48:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBlWQ1072711
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=; b=K27YSiHdh9fr/8jn
	4jofhsStGwSbgnREcY6FOyrDMEq8+oO+uXZVHfPtoQhHHedIvepbL4oBMj9Rexhx
	IieGa09kqmZ3iIGvaBHCa60aWgj79CgXT1zvz2NQpO59iQ7veGLxXvdHzW7EsILY
	OT2zHXZLBTtm4BoIq/ZKH3F2w4ev6musmd1KlIHqm5FZtXsyijos8ZZKJxBTfAXT
	fOci2S/+V/HD9aM78jmYDoDeoHfboLFWu1o3SjEu+zlSIT0zuI+Bd/UyV52UPbmN
	ipSyJ380I8pXtEGko2r2o14nr2Ji9smkjWJK9YmY+3qO9LLuKe7ca99LmxdO6LBm
	r8/MQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjec2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:48:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2a4babe45so11095115ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099311; x=1781704111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=;
        b=fbPU+NP0UP/qKRJLjeA99mDfEqDDNMaF5vzKI8o6KMzOSyJGsvjeF5nPAMZWfPVuTm
         5I/zgpXJN6ZO23czElOxbbp6yZM6IE6YAxCb5POKehVnLxJjDbYuecubYPGC5bh8mS4O
         Xrt7P7KFBKPedJf5K/nSvqTBMjkrh6KDqq6sUPLnj+7U4JHh6N6YkIFjXSSPw2LSG82G
         Ur8P2RLfnS+PRnJTbZWt9t814cXpGi/Xu48XdSN0rXrrstJt6zyDjHmEzhVy8cERxr1B
         BrVImM26CmtIg4IhTJlC+iv9MPLCE5L8of/xLB5k0Mrl9wyGc63qcJhfg+IzqRdArNRw
         ZyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099311; x=1781704111;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1t3DKnJLwN7pmQAaW15e3YyxivpxU3KsElLN9yzYDj4=;
        b=D4rDhKC73PD/fDojePoS/nXXSN/wq4vga3s6D5ilf0GUPhoQB7rG0nWM4zItwfe8uA
         FM/N0hPJpwTEgLv89kVd2PHLsrpe2vMJdaP4f7fBOCm62qmSkiHcf2nRujs/MnYM7FZR
         PuZlplpgJNk2xhSRPkfuUs5XD9wEp5HagMRExOSpplpIAPxFCg0YhC6bAtvXt0T6mgOG
         1ywB2Q399vbM++UIsBmxvQA/C69oYI3yOeIckIK1Cmro/VhkeFbBUqvsQLxXmuOuOBpL
         H9/71QlGDEs1TYZeFJ/3LUA/7zX7JOwcjOAfBL+6R0rhrCmGKvX/0IAr79r/U32q2zXk
         zH/g==
X-Forwarded-Encrypted: i=1; AFNElJ8P12eJvSpFAscKl15rK5L6MkxMJQ27psYgOijckSVAPU0nD+BhzfzfhKwsCUw2Uu7iFQmQ9RYF1iKxxn8s5+j5@lists.infradead.org
X-Gm-Message-State: AOJu0YyXzzjruaoCHE57k2s2iiHG5pnIdUoBxti0QUSQUj1r0Ok0f4sT
	qG0Yx/gEioT7RkibHgp2zhR3wwbQgb3pZdJE3Y9SbH82nao8z+1ci8DTPL3ALzHr7VvUMXRYJrA
	9o8xHntgVbFWlKEgmUnCP1wPUkQy7bwGUOjYr/oCP1shX7lpj+uT3Ee1kA8XuKxZ6sSIiBaG3Ds
	DQLA==
X-Gm-Gg: Acq92OHPHWxLaz4oVsJqoOfhx/llXgVQ9K8DGF5asnNfDVJI/AGBw6qvhY+9e0wUaux
	e5ITontFBTf5uwDYhK2Wx5cJdUB0/yIFFUxsO7IJyoAVtg/fyA8pDu4NQZf737yl37S4YLR7OmE
	wnvJZBhAf6z2twctbL+9V0pF6cGfDk4py4/pAwQJRQa+H81cMbab6Whwr/NkSIph0h8JfwbWgNd
	p2vGt9EEeqG2E5SkaiEsUD8Kzf595nsWt3ZsGTdCW2lTsOdDylirmCm/1Ei5Cwmkxi99yd8JGQy
	u2iahbZLYu1q/4Ue1l3ZhSSGvHiA9wFrmxUgzMFpcI6wT58B6E5J40W/Ej3+VHtiu6nBxWLEqg7
	nK3ykGiwKNMTTNkoxlqHp/3c2E62qKOs=
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr295502515ad.7.1781099311377;
        Wed, 10 Jun 2026 06:48:31 -0700 (PDT)
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr295501975ad.7.1781099310778;
        Wed, 10 Jun 2026 06:48:30 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df6esm270319645ad.48.2026.06.10.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:48:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        hongxing.zhu@nxp.com, l.stach@pengutronix.de,
        "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sherry.sun@nxp.com
In-Reply-To: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
References: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
Subject: Re: (subset) [PATCH V3 0/8] PCI: imx6: Integrate pwrctrl API and
 update device trees
Message-Id: <178109930423.8833.16452944960716589912.b4-ty@kernel.org>
Date: Wed, 10 Jun 2026 19:18:24 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: B-3lsvmIpI2hNBi1fJ48P5rWaR7mxyF0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX+VEhx+H/pXa/
 yqT/uK+6WdDdDHsDOPQmDfaXECSUwlsP237q3eoWaoIJ5QAd4MydrEdkGELr931ZlrsYjS+BKG1
 JiYYQkIX3jgqamvxMOXXxzMtPa4kPBo02WDZyflZN8czxZmWdWzW4wt1YbF6WjtMGeovxMHISZZ
 B7HnkzdeeOANrGMODGkjN4fXxSMbSf/sYtlTda+nQUzzcSY960Ujhcfb5pHyrtl8psf+OnMYLdr
 GfJjunr8/gMcI6ZKBPua1SwPLRPJ+M/n3q+vepIfzkZn2uSNqNqGljPyOZwNO/pXvhNlINiA1sp
 BdrBuS3ZkmGLwOB1XhgYP+sXvMJvsSVWDDuvwJsdydmzWq+QByUNHTOWyxQy0e1yVGpGRfm5CSD
 0tVU4sJM0/xy/R1cbuLtwTZfEoguFBfrLESPyDd7/PYzXaK5s4XOaxXkgNS0rrPanjyEnJBqYzG
 tEFrxsNinEmN/iIP/lw==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a296b30 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=GUrLWBD2z8Uwe9ZWfuYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: B-3lsvmIpI2hNBi1fJ48P5rWaR7mxyF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_064833_774005_29699403 
X-CRM114-Status: GOOD (  12.92  )
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


On Wed, 20 May 2026 16:48:56 +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> This series integrates the PCI pwrctrl framework into the pci-imx6
> driver and updates i.MX EVK board device trees to support it.
> 
> Patches 2-8 update device trees for i.MX EVK boards which maintained
> by NXP to move power supply properties from the PCIe controller node
> to the Root Port child node, which is required for pwrctrl framework.
> Affected boards:
> - i.MX6Q/DL SABRESD
> - i.MX6SX SDB
> - i.MX8MM EVK
> - i.MX8MP EVK
> - i.MX8MQ EVK
> - i.MX8DXL/QM/QXP EVK
> - i.MX95 15x15/19x19 EVK
> 
> [...]

Applied, thanks!

[1/8] PCI: imx6: Integrate new pwrctrl API for pci-imx6
      commit: 85c1fcfa740d4c737f5575fc7251883e54227a51

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


