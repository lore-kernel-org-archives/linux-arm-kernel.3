Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8469DCD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvgE76byBkrnG87M5GQBzCx6Gesq1V6QYXCaC3lyE7g=; b=0Xlvb2qzEn0jOo78ymf6gV0078
	9H501LlmaCvr9/7GxUhO4ogcMaAN/uPktTIYo5lk14TFZfdctPmeOzjErsCrPcSM8e/scbu5Zc7X0
	IX/HQx0PY43QgyiOdMmxmBdLIEImIhVA8IMoM/o2cNZ4zKDrG7dq0M5xsA5ZgPfSVafV/dxwr2DsC
	RIai5x7m5H3T7XKB6vGx4bpqCyvq1990Ac+mPTEq5Bsf+MHGJdSTKgbchNr/kKCHSwCeYKfDUdPgo
	piQUTXOZhd00Pe4V1Uv9pIJjn1jTd5v63Ltsdr3eP54nk6aGMWWEUq1v01mj+El3T1kKF2aA8vDRS
	4GkHTdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwmW-00000005hL4-2mq8;
	Tue, 09 Jun 2026 13:46:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwmR-00000005hIi-1Sok
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:46:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmL3j2588047
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 13:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvgE76byBkrnG87M5GQBzCx6Gesq1V6QYXCaC3lyE7g=; b=Bpvsj4Aq+hkB8ev8
	qS6V/ThclFQ3bGiM/zhmvfP1JnwDvp5OTRRNPWDWQIb/MzuMT87JhlKABvlMp3fh
	MGiTqfaSZS8MZxSlg5VqbWXMILDaBSOn/YTeV/dz+yizmy2Jollw59kpX+azu0Zj
	6N98UocmW1+IIAUAQ3vlVvAMEa3tQ5Gbk6CJOayZ08e4G2GFUMNQV5LMrjsFDKAD
	ovPn7ixC8dR/eNap4G79Brm9XBBks0js5eyB9FjOfpE+UsQ3xy906aWZgzanyEih
	11RsMpE6Tn975TMFt573T5AhmQ5t4aoNDpACJZxu4EbrEfFC9rPIjRoJsPAtX7r8
	7/dCQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4hks3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 13:46:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so6568155a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781012769; x=1781617569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvgE76byBkrnG87M5GQBzCx6Gesq1V6QYXCaC3lyE7g=;
        b=Jl5zxZxLtAtZHEPivDKuuKB+7CTndaWxljZmoNQxc5YKp0NazG8d0eMjxHIQdb8S+d
         JjUphSl06j9YjyVfghTOV+Wyt9+0dtzh7M8342sMxo0edL1O4vbVYHoVi8bmcgfWxHJK
         qyanoj4jQAfLqnKPQ1WVjO8AHB/LlefhrN4V4cCygtUjGVRUvQDnc43g+O4PlJv9iEpx
         VYjjlJnFTkAlMKT3TnBYJPy4xfsczdwEmDYemOOMp7wVXzc+WYk/88WH7NntdkVq8cDU
         xS1RXkIQWuOgayL7vIswk81fTkjUcEpZuf00kBL5h8+T5UhsXq6BbKP8/HUAjseLrWxJ
         40tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012769; x=1781617569;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BvgE76byBkrnG87M5GQBzCx6Gesq1V6QYXCaC3lyE7g=;
        b=UIXlgZE/OdTeQI+YXp3mARrh4m8lWESjIOnpaJxqVG4miM9sDn8HDazlYreb9F0too
         c9Pn5mlUnue6Q/TrIVlfT/fO9QkELs1zDo4fEwMfYOQ1TP6rjMxBF58UNKLkg8cxURkf
         je8e5sx6uSmaiEJOOzxjVh5KoSS2OSyxaxHMZfp+qXAC5yLd+DRhZh2fvFrx4hiIyVHk
         v82Al5OO2OSYypooXbXiUV7QCsbCvICvmBiXbhSdLGC7A8VSRh/iuk1KNN6+Ue9RIlGv
         dQn0H5aKg8GqH/qvs0RKx6S89AyjvXbxF7cAL8j1CsX5nJFsn6rwi7FmZH7ydv3lyxdo
         ktiA==
X-Forwarded-Encrypted: i=1; AFNElJ+Jo6ozDektHthkr8wRRq2phlHn1eqZqNRHUAYzLxKIMBi8y4QC12bVjD54K82QNremWV8//d26+44EjzUFMK4c@lists.infradead.org
X-Gm-Message-State: AOJu0YyAxDSRXsSA5FtjdjQbj3afOyZiPnl1CuHwi6IV2LnIk14kqCFA
	jx31Hbq1u5GxDCOspcTQOUkS3lHVMeVIuBOWnUvJoONv839Q1vFT2oEq2TDKC4FEtmdt6U+Ud0e
	GFe/T/JdhNLMKJMbWn0eyT+q7Jof1UxlyMVqL5UzCbS4H3VAjS3tburXKNWrO1bWl3ilEkraRJk
	FoPw==
X-Gm-Gg: Acq92OEHdY/Xna91yDd/3JUAHL/jb9WG07RhIraWwvhSaR3McQ4YdxsvseRS8x14R0t
	Sz5+VOceCH8LtLyo63GxZKldMip6IhtEVsq/cjyHYDBovTrhryTuAtoi4M8o+P0ipTsTZio4vhR
	mmUL61oomzZcH3jIXe76Gb9vnAbSJr1kcbGZhtyz/mFTuelEOmlH2ikpbDeiCVIknFrtVEMRQ+X
	vRe9fSf9/MJ4M3qLzG3yP7BbzmbODvHvEoiEnD+YRE1mmi581baaBpuRiPm6RzIU/RV/Y7nUpQg
	KVjlmw7DFjFemLLy7xatqGd5aZzolsw0qitbjtojHZ8mj3r2Tfvs/XUqoJ5gk7RhA6dJumYYMjv
	VsEMzhbZm1ZD31PLGghLCieL7MYz/5aQ=
X-Received: by 2002:a17:90b:582b:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3713029bfb8mr16531445a91.4.1781012768691;
        Tue, 09 Jun 2026 06:46:08 -0700 (PDT)
X-Received: by 2002:a17:90b:582b:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3713029bfb8mr16531402a91.4.1781012768027;
        Tue, 09 Jun 2026 06:46:08 -0700 (PDT)
Received: from [192.168.1.11] ([120.60.129.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb3a9fsm9454149a91.0.2026.06.09.06.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:46:06 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
        Jianjun Wang <jianjun.wang@mediatek.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        lirongqing <lirongqing@baidu.com>
In-Reply-To: <20260515005552.2343-1-lirongqing@baidu.com>
References: <20260515005552.2343-1-lirongqing@baidu.com>
Subject: Re: [PATCH] PCI: mediatek: Fix operator precedence in
 PCIE_FTS_NUM_L0 macro
Message-Id: <178101276196.5924.6945802406808403415.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 19:16:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a281921 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=4E6x9rGNEmwsBi5Sc5cS6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=z5-zIPkyTPHoBrqrsb8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: dS4hR1xeHC5HgV3nh8Vd68oVL8lu6XEa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMSBTYWx0ZWRfX2ci772qQ023B
 wCEeIXqJL992ZFpzfs1fpemApISIPhJYUx6ESfFYC3ODGOcGZlfjMR9be9vWymj863OG0bkZX9S
 ZYUppxvO7IJUoEftbfxyC3+AiWrpETGoWVb7OLVUsIrrq8UFvKT6lRGmHldgSalIGusTHHb5q0o
 yaCXDhide2nExi7/mX3ZUG4ZC/CPxd48tiUNPZuGZM+XQ534pVyHEcyji+ZyxDtp6+kWZaoenky
 B5ZOGx4EmbCGU1O0Kc2p4U/J8lg7VGXz6zHXhYSwKnN7PUb+6mS4PYf8sJGQzyKNu2Fric4rADR
 vz6B9JiSYyp0uNHD+TX2GlKXXPO64AV5d/Dl9aRU4b1VpgYtIEQISrAFfPe28FD0FpoWZ7nWRkO
 bMTT+2oeeu3OWBXlNiiHNJALMI+nB+gnkSY8nG1qCWQ1uRTic8OCB6FvcNc6qzlE+s1NfA7X2Tt
 wJFz9GSi9P076ZXtoqg==
X-Proofpoint-ORIG-GUID: dS4hR1xeHC5HgV3nh8Vd68oVL8lu6XEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_064612_108527_11A8BEF9 
X-CRM114-Status: GOOD (  10.47  )
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


On Thu, 14 May 2026 20:55:52 -0400, lirongqing wrote:
> The original PCIE_FTS_NUM_L0(x) macro was buggy due to improper operator
> precedence, where ((x) & 0xff << 8) was evaluated as ((x) & 0xff00).
> 
> Instead of just fixing the parentheses, use the standard FIELD_PREP()
> macro. This makes the code more robust by automatically handling masks
> and shifts, while also adding compile-time type and range checking to
> ensure the value fits within PCIE_FTS_NUM_MASK.
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek: Fix operator precedence in PCIE_FTS_NUM_L0 macro
      commit: 282305d7e9c0e27fd8b4df34b7cd5506a1eccdd6

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


