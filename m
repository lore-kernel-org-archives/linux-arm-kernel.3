Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C5CCFD368
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 05:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2IEBOcA/PnX0xEHWPoSAZx6P5pC0fIMY/puI/SdMtU=; b=KgqTxxLZvrQCgVOhdXCihi0ziW
	rKVG/pITeTJS2h7InDDnT5sAuJTNU8Tox7nr5f1O+KyxYYvEu73L/5cLxrZ+kir75OjR6iKWFPqU3
	Th1u/Px6dS4I935LTSOqAO7SpMcB4VA/aIR6JrNw6SJZfW1LTJeupqHrumSGJkKNkzaYhaG217Oz+
	W722XLSxCy1PpYastFXk0JUBAEgIgT3dcYS2OJWrv0AGHl9IEqZQGv39OScl+fAeFYfBl2EXrcc0Y
	7FYOjgjPJUi4PPeTra3jjqNqDWNbErP6nAOn++dtz1a9s+VcnrbIVt7SdHwhUaiGWM55/Xd5Skscc
	bqZsOChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNlja-0000000Cmy5-3B6U;
	Tue, 25 Nov 2025 05:37:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNljD-0000000CmxF-2svI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 05:37:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2geuG1979059
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 05:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2IEBOcA/PnX0xEHWPoSAZx6P5pC0fIMY/puI/SdMtU=; b=ZSvLUA2rl4UZu1SH
	mZrIGQYwS5dZaWRh9xzy4HXt/hDHQscVl0c4elvWZmNGRQKXMngaHdI4BJefE7Uy
	RLBeuj4OoyKT9sX9XuH0r9tBTKR+4M4psYo8pXIsve0ADnFOW0XYfFXSe1ybFfkX
	0TR395KUIX28faoc0epgemvVRoGf+bpbgFec6GaIQ3BlhUItACv4Y9Z/1kJl8lan
	THc5h+faNJABnlX5sPDgJMJJuOWEJKcWJ4sWHUzrDzAVtW8QNNycCJbrHzY/VHXZ
	zNi4LfawLifPDrpyighABVuYSlkCuOMxXebUwfFI84h9TKt547/SWdD/jTIjg1Te
	X/Q/tg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9gsc47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 05:36:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34385d7c4a7so3206442a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 21:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764048996; x=1764653796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2IEBOcA/PnX0xEHWPoSAZx6P5pC0fIMY/puI/SdMtU=;
        b=bejK2b3iN9klxNqjFy3kJ6wiTU9LUMAmXRvyoOqEVZdWme9BPSzsHkSMxmTEqvr3AJ
         uNE+dHjxBMLOxwpoa6Gi9SJbBYw8VeKTU5ZNyKLUhmiMqfcFi08DSrnQrFye8dpKkZN1
         YASB4zDPrmwIC7YtOorelH3uODDg/T/Xu2fq9m+G9th4TshDuU2lCjSrke8GtZHuEE89
         +oRPPkgIAQjVcNSCS44VsPWV1y0pMMrvhh9xiBt6+i9PibLHrHvhVIVeCqXd87jYysPx
         PBR4vnXL64fLDuMhna+ClcXd4ecCA7viJYwwyfAOQakiCzsW59O3Vq5B9Vo4aP9+ccVr
         xgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764048996; x=1764653796;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2IEBOcA/PnX0xEHWPoSAZx6P5pC0fIMY/puI/SdMtU=;
        b=lK4fISoP9qT3hFbAWuc1JALX/5xElDyYL93PmjFiHi0V2VHhY4JvjVPbsU10fbruUj
         HdofIN3nQZUNk1582RSX1hcLEp00/KwneVX2+ET/PWZHozsTP2gctIOZmvtIgK2jDUlt
         TTQZ704gKevYHz9/ZVFv4BeP1YBjk3YxyvStkHTaEGfmf0U/yoMd/71Y47F0dOdC/hL2
         YJPNz2eqSqob4HQnGQBsPJKZGYxc7Zg7op0FYhYk+xWKywr/eXAA/XC06P5ELa/zHaYn
         +GTHua0fm83ShiQOsNfg7XXejTq+xE1YMZlQ4SKQ3g2qtn48DgNNtlWX/I2dAV6wvp29
         yrWA==
X-Forwarded-Encrypted: i=1; AJvYcCXE8Lq1lklQ1S65LVa3leX78lND3gVoqhE30/2UyI2fgWZk+P24LCPE8aK422TCDYmXNC+LskzqqcLza4MY5qll@lists.infradead.org
X-Gm-Message-State: AOJu0YzcO1H9idtrhQ9SELJZAfS2upblrMrPDfEYxRltfQCLnKdDx/5S
	292FgUCMYXJ75RKutCRiah2+2r9kcAjJnolqXBV9LSZlJfF7AYYQNA4rV9+stSEalyg2L4iTatg
	N0gl3uN9EXIqpGwtTcEc99eXcIKtur601UxRgufVRxe0X/931LrP5puYmLfn+36bBU/XLVMnyP8
	IwOQ==
X-Gm-Gg: ASbGnctC5jtlkgSB3xnrCPht2btLOCWD8Yx+TAdseSLMzKn8TPB/tTEfZ4tV9Sc95xg
	QAbOKv2LgwVD9PSzasEYukOs2fFB7EC0KbVAqwT005uMn/p0ajU3JrTP8ykU5bIglkvaBLbixAw
	XQaAQk4SO0HRAJtFcCSUD7da9aZKMXu70SZcbRkexdj9nJ8Btji61D2aRbt3i9B9U1Pd7dkGADd
	bDoFabkAiqMOKwDUdu9nMg9YR1ZovYXEKuplRifKN5nF0TXgdeLOaGEarUFb5pbTfdRwyaoJ2uL
	aMiHcb2dLpjEonnQEPvSVdLPbRf5zBVb/fYeZQNtYSA7VDh4ptqpAINe8Ps8F8LZbO3jJdcsVGv
	HRWqxD+vKyw==
X-Received: by 2002:a17:90b:280a:b0:343:43bf:bcd7 with SMTP id 98e67ed59e1d1-3473345bdffmr13896336a91.13.1764048995910;
        Mon, 24 Nov 2025 21:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxgaDNdfNEfhXZPwt2DNVay84SPTVRR5ocAbrQwMZt47vcF3pJ96a4PxRWzhqq/3ZJlT+etw==
X-Received: by 2002:a17:90b:280a:b0:343:43bf:bcd7 with SMTP id 98e67ed59e1d1-3473345bdffmr13896310a91.13.1764048995405;
        Mon, 24 Nov 2025 21:36:35 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:88e8:55c:808f:7bd5:9774:52e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ea6d780sm452943a91.6.2025.11.24.21.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 21:36:35 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com,
        s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
        larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
        ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, Vincent Guittot <vincent.guittot@linaro.org>
Cc: cassel@kernel.org
In-Reply-To: <20251121164920.2008569-1-vincent.guittot@linaro.org>
References: <20251121164920.2008569-1-vincent.guittot@linaro.org>
Subject: Re: [PATCH 0/4 v6] PCI: s32g: Add support for PCIe controller
Message-Id: <176404898659.18373.12076537585341452677.b4-ty@kernel.org>
Date: Tue, 25 Nov 2025 11:06:26 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA0NCBTYWx0ZWRfX1IphAzHM14dA
 QzU+M5HZUUK+Hg8Gq9zsc2DLPDTj01p8Jcs83KM2nBxLi4RKbBYRfrXZOBq+cVgufn7V21Hrpas
 88tLMbm4qcKQzJzsUD6ZYRUHe+A3wXmIS5TaPDOC+eatmJA6wdZZNbhMhHoGp7qO0cIFbNR8z67
 fWQXvuA51BdH+/QYOVWnKxXwDZDC4KyebT+l86bZpOnbymF+0Nrs88kM3SZVdHZ+KbUL7BgLhi/
 ZwCc6k/LjCPMIDPLpD9Gy9+qz6zF03s70mxjwCj0m152U8TTnTkgK1u2cC4dRqiyhrolC1qZLL/
 iEZxHg387722YjsHlA4UTHFkT28hd7gZojr/ai4s1SvTXiy4dmxzu+5jDIgQYG1t4bsCs3wPg4q
 rsFrCoR7jk0lw1NeQcrHs57r4d95aw==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=69254064 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=1z36L96dY_S6Ah6j7mkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: m3mM-JgI5mXA0A19WMvdNRrQEzlbhweH
X-Proofpoint-GUID: m3mM-JgI5mXA0A19WMvdNRrQEzlbhweH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_213639_854601_2AE53C87 
X-CRM114-Status: GOOD (  12.53  )
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


On Fri, 21 Nov 2025 17:49:16 +0100, Vincent Guittot wrote:
> The S32G SoC family has 2 PCIe controllers based on Designware IP.
> 
> Add the support for Host mode.
> 
> Change since v5:
> 
> - Removed relocatable bit in yaml
> - Dropped pcie-nxp-s32g-regs.h and moved reg definition in pcie-nxp-s32g.c
> - Removed a useless ret
> - Change kconfig from tri to bool because of memblock_start_of_DRAM()
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: PCI: s32g: Add NXP PCIe controller
      commit: dd17ec3df57b7bd0d23f3a17124d59b2740d81e4
[2/4] PCI: dw: Add more registers and bitfield definition
      commit: bd1be33651b21ce15eee8fa2f080109e3eaa8e29
[3/4] PCI: s32g: Add initial PCIe support (RC)
      commit: c403d6d7282b72fe1a0812c99beeeefb1a7e1f4b
[4/4] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
      commit: 58fc675c34c583771d412aa89fb364c750fadacf

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


