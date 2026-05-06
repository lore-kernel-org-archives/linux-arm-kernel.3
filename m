Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B6FCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oPLdXXouDVkhJv0oKpMf1eGEE226oo0STDXOOYuHJQ=; b=VE2axYSXuQol1x5Y2WlaN5/3MC
	GNWzhPTOUzaD5+wnKSapctJkLViFAMcwU0AZXdmN2KTyScPZ7rH2OuBmWdARcoKsH+aa07u97Aq3H
	l8mV9Xm8YWXJjYi8TJ2jbOkEcEjMOf+pZ6nZbvCEEgRI6hKXlLSFR6UBlKCJyMP3kfSkz9DRjAgW0
	sizwQ1fm9U4dkY3T4qHyhHMDoMRET9oSCBLtIna/mqS2a2w2FBrFJweypMsZOwwCKTt8Zpq2CKTA+
	sMvVYi5bouhHij81TVFEhlq1C9IiW2sWA22XaVSLg416CYQ5g0rL5VUwbtq2hsN0n+yn6QnHaEd92
	KdA6XnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKacK-00000000f3B-3OIx;
	Wed, 06 May 2026 11:40:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKacJ-00000000f1z-3N0W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:40:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467KUUZ529341
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 May 2026 11:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oPLdXXouDVkhJv0oKpMf1eGEE226oo0STDXOOYuHJQ=; b=pDkpRUnKxfGFLMT5
	IN9zzXR7jhmgMF1GVsF3zijISdON48bJVwWva/q0u0GihR5r1vz1O+2J7MsBo43P
	cqZVAU11HbGoawH34omEc3A++vGylnf9Kb25BsYi1w1dTWZov8Srucv3oMR5sb1W
	LNoWgFdQKjKrekMnMgjHRT4egouTlr60rtxBzR0T1v1RmzC2BIdrbd8VCCGLyVK6
	AjRB8+3XLAFpEGJcSCzIxHBaWmL/MvWYb39ydI1kDGjODtj1ktEE96R6GOmnFQsI
	w66NyMy9WFDMvwwXf1tsubzcjgHn2DVJLyq8nMJRsft5JWnYUG6sBbWtlI6wZ+sm
	mALumA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e015x9114-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 11:40:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c81086bf930so431217a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778067638; x=1778672438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oPLdXXouDVkhJv0oKpMf1eGEE226oo0STDXOOYuHJQ=;
        b=SkC6MUNmVevMpaD+P6lQXQfM72YizZ8q1RhhlQQXxs2YweIDF4HpjnSWN35HCZIAJz
         opY7JndPnXcYhViBAVhr8KdlaMblLQdMg1lh+hICUBD+BbUjsY19ami821RksKliREMk
         Fme515MhXpricScVjDEWKzQDhZdicspzX/oz0gYNuB1yZHsoNIS3c47J0cax7Q9SnozT
         eOiGw9A1kxOwhPslva5PuAQNZo61KIrRe9HydAOsXN6AHj85dkcwIfEMxx/zWEeFk1ux
         UfYDRQpNtv2EKpKbFY5RzoYw034TtQkXD+ws990suSLUWC8+bTdEHV+2NGC+aVjJzdLw
         gApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067638; x=1778672438;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0oPLdXXouDVkhJv0oKpMf1eGEE226oo0STDXOOYuHJQ=;
        b=EP7xs+9RLzEWx/mRtxmpLwoAU+VdSDA1viGPGyKeX9s6dS+qrSbvfqlm8eSJXq7yme
         bk8OzuNWFbzFTc1jxa3kwvb+wJ9BU8aTZLdcKrastM2ejGiwOVCfRIy+QdAIb8DnZ9Yu
         sjDNCimqOxlr1Ah9KPGG5/RSBW5igQgeHoLRoTkoNl7zLVPoXP7BzNuYZoMDlOK13E2P
         zz9Yg98bcE5B+rGkrThV6aiKQ5eQ6UDPAPYivP3ItgwKSVwkf0DuietEcPM9AAyUMotv
         AEbDYxjt82ZOMPODrAilMmo0X2oFYHxvo/pAfr0YYuYnF4/D4Jt+Pq53hKOreaE8hYLS
         oldQ==
X-Forwarded-Encrypted: i=1; AFNElJ/H+tb+gHMSCVwv2cRy9ak7JP3ymcUjl7XPZTsqqAN0ZL5/5JzhB1uIA9Lbov2JTQnMjNmmmNf8A7CcgPMWfoZs@lists.infradead.org
X-Gm-Message-State: AOJu0YyPOrH1gRCFf5zHy3GsAx2nkBuvIeYVZ2+pBt1xBE1ksqNEZMw7
	Nady7yNwLtSP+L2MYjpVN6smwqIKnyFwCitFQIz4ydhl//3chMwNg507aEdCCwMq79k/YI9XRGE
	BArtuYvuBaEnnFCuuLbOJGppQftBkVuzr7ajtJmoMxJHJDs2cCpMvLBLa449j8WSyRbSP/HfwfC
	Az6w==
X-Gm-Gg: AeBDieupL4JXGlTclQm0L6XBeWnSIAs+2iFbrLmgY6AEFy3r2mJClEUinxTrrXT/ZyP
	dmAnEklBXc1sJkPvJ2W2S2aeIfKdFv9+R/BEQ6leuvNaAhe5y4A1HU3j8geci8wy93nHQR54iVA
	c4Apuwla4AO2jxBxxjDpgwyzmz30mhb3921UdWNoM+ws3GdVLtfBZHJwGmLFk95RKdLLT5spWs2
	nDHGQ0o+197u4T3t96CKp5Jw1TBj3bQcaEw5+xG90RlipStkbq6bGZaRB1ohnNWWUWUu4+p+KcO
	lPZCopMmgJiDg5QUpUOv5nHTn/7DC4uXju8o3XJCv0/s2SwqCsVJYbp4/5j+T0NPnSRs6YEw6MU
	SasIUcdi8DaA4hF5SOUkm9BpOLsqEWFw=
X-Received: by 2002:a05:6a20:3d85:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-3aa5a315ec9mr2589456637.27.1778067636418;
        Wed, 06 May 2026 04:40:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d85:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-3aa5a315ec9mr2589412637.27.1778067635781;
        Wed, 06 May 2026 04:40:35 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.67.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm7058783b3a.16.2026.05.06.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:40:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260319090844.444987-1-hongxing.zhu@nxp.com>
References: <20260319090844.444987-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2] PCI: imx6: Fix IMX6SX_GPR12_PCIE_TEST_POWERDOWN
 handling
Message-Id: <177806763016.14331.14072129675795042605.b4-ty@b4>
Date: Wed, 06 May 2026 17:10:30 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=Os1/DS/t c=1 sm=1 tr=0 ts=69fb28b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=SQtj7D3ryojUavkWoQJ0Rg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=VlnV4lHhP5wV_tSmghEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: A6L888ZlUCoeyhqO8uyCUKchpjcw0Elq
X-Proofpoint-ORIG-GUID: A6L888ZlUCoeyhqO8uyCUKchpjcw0Elq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDExNCBTYWx0ZWRfX5nHJULWNM3VY
 EXksN2mrIyRHtuDNOEh/26feLZH/8Hiv2F5DgVkgiCa5fdE4OG4wn0JSg55k4JAQQ/y0KlM3jM+
 IxOPWtgfbCTnhDffazOsWyD0JjQc5fG2TUmfha/W7pij6kBy92NYk4qvx7jY5x2sKyP4fQRHR+o
 t7RRQr52GtpuDv+vSqtr/eoRXnVSZtYRpNNcx68YHyflwCekQksN3RKei92kcClA/toUqWok6BY
 /aGSPH9P1pT3Wlx9iUt1kfsqtMoOAlikYj28Z7rNSMFBkACXCopD09kuGsERmvAFBtHtuIV8FuL
 xaqCsWeQW5o1wSGcAuJWj/i+uC0M+gOCrMRZWuA0vbQEjnxYQRd2ePvoNqknhAdS5W3cRsvoSkG
 5jZFnW99uwQALEbQU/uuRDrlxPpad93QHjC4kepq/SLNgDuKfnmVe3qaoJzEA1Yyu0CJUHTXiSF
 X+j7l6uvjQH1UudVXUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_044039_852219_BE8D39FF 
X-CRM114-Status: GOOD (  11.61  )
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


On Thu, 19 Mar 2026 17:08:44 +0800, Richard Zhu wrote:
> The IMX6SX_GPR12_PCIE_TEST_POWERDOWN bit does not control the PCIe
> reference clock on i.MX6SX. Instead, it is part of i.MX6SX PCIe core
> reset sequence.
> 
> Move the IMX6SX_GPR12_PCIE_TEST_POWERDOWN assertion/deassertion into
> the core reset functions to properly reflect its purpose. Remove the
> .enable_ref_clk callback for i.MX6SX since it was incorrectly
> manipulating this bit.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Fix IMX6SX_GPR12_PCIE_TEST_POWERDOWN handling
      commit: 5a8c573879379eed867d279f7437dd4e3aebbb7f

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


