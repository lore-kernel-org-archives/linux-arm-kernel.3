Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80E9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZQHynXS9Aj+ofzqFulsvS4teiqfVzJDlJMHSlRQVic=; b=zSP1Xz97ziUrZdUuX1BDW2oPPI
	09WjK70vdCuNC+/EN8QyZ1Ld8JmxezuRdMV4dQknx9mGOfreS6DDbpW4tU/00hlzF/xJAhBROdm+b
	DPdieyuFigWRpGbpvEDvIE2xFh+yU+iIHEQBr8nLcY4DshjOqxqZIIlhei7dj/FitAIlwwGtR3rNS
	VgKq/48SjYlkxCZbYJ4kL70Zxt9aRJhB1YpEldnK4jsT5aNOm2LZFid/i2upSPTVPDqHhYqmvUN6c
	yktDtXTEoeBlOZg/ZOX8QDGNu4fhuESc3X+GPOcVbGjjhmjjxnaTRt70zlaJ1Rn5eTbAegSGInqol
	fr1a2VYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsRF-000000004q0-1EI5;
	Mon, 21 Jul 2025 15:28:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqWC-0000000HNjO-3zPC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:25:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAVRrD015777
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 13:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZQHynXS9Aj+ofzqFulsvS4teiqfVzJDlJMHSlRQVic=; b=i7Af87RlSsyPtyRr
	HrR0kGeh9hBMhTS8D+mPtI2cUrZ6cZFvfm6WqrUYS9Lgng9+sPvqV0ogMQKwBuZf
	h+z88asJNbJ/WqxDZZloocEJ+hJyjC23vnIIV0IJPY5RQXT6SPNwAQO9jJBPFLYo
	3Q6MDy2LOp0vidV8nn3ODILDkEbq3J/wB7gz9TTXsBmeCV2WcYt7BYNa3u5zF4Z9
	eUdRlsZNCVI2SA50hRM7wk6IX81r25SPRz5A2ykwvTMQkQdc03t9MKcKpxqtCe7U
	yc+xa3PP7yfNN4RgoyPomX+v4r6wAxjMr1MSR9iT8OnEK1MZ5CiStaKJu2OLtz8L
	koqCgw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451d6sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 13:25:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-75494e5417bso4004520b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753104321; x=1753709121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZQHynXS9Aj+ofzqFulsvS4teiqfVzJDlJMHSlRQVic=;
        b=TlPUua6Qe0TovgrDkulQ2n/CyDvVXL7Dvic23h6U6vYjMYqJH0tWaepIgQVL3eqOjf
         fC0PCUMT78jPQ9GdE1bOnlryIsZVFlp7zb3Pybuc6OqBbHNB4UyXemOAty82IlMdxaMe
         8fbsiBnG+7S6H20nKfof90s8vO8+FLTMeVKSAwrS/y3MPB+h+4tE/zd0BoGalj6G4E0E
         qqHmybO1pkP0aqAnMmjVfySlJRTOFrIB/673PsNsJXWolvP4tWV6xQxdDGPpGSU7nLNS
         DCfdRJMJ52bcDUlE7kEGCiQHifEnNz/rKCgQZIVyHJtCtAD6KyCQ1Cm8Dhx8cX2gREHQ
         HRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6GIHRSLQsZFDjNLWFlWUhTawVBHud6HWxdSnjYQScor4wQD/7TtnfBgoWKy9Yc9hoVteFkvSiDhCFJQ+U6o8C@lists.infradead.org
X-Gm-Message-State: AOJu0YwxOhUrggNV/yENvFlU6+J1LnRwJ4GsQtkFld0lMRY3aBYUCBy4
	M9dH3MWLwTn0a65hGCHxm/wX98mEdYVlC6HeXfm3qnAeuqZABfISKzIU9tagwVk7xr8ymGtD9qi
	w4dZCPSV0T7myZ/TGZDIhCZFkVumRNdaS+y5HLC/SbbabebNCbbbxwH4EiyibEqGGS9Ddf58szl
	+pIw==
X-Gm-Gg: ASbGnct5GcQCoqDGI1pl5pVwBTv7+kQpqKVhy6iRI0ivkZ9VbpmZ6D0n51xp4OwVLq2
	Ak204K9dvlsP8bXZCZ5qjVX+kwL1Mb6oJe2tB4VECB1aE/zfCz0kwwH2j+3zEiGbQIHaIIJ/ARh
	OJEOCyCCwO3cWJTDumJju4fTLpK7G9MOe1eCIalsv8yHwkIhMMfV2yO/AQJxIZfcXe8Yr1Tb7Qy
	one5vGXAURuX/N5i3TXTVazH4nnMBiGNf9Tce2nCmxUbjEZzc1QsdWyaKM51FZkXuZ2jW9UJU5w
	sLU/4CDA1upHXNXpBCbmbRU=
X-Received: by 2002:a05:6a00:440b:b0:74e:aaca:c32d with SMTP id d2e1a72fcca58-7583806f7c9mr22318721b3a.10.1753104321167;
        Mon, 21 Jul 2025 06:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVAG2MuKiinbLb8Q53VUsMTuw7REYbjlHCJcq0ez6hDk7d0Yrje6e4GNuTCOXMv94W2Rtf2A==
X-Received: by 2002:a05:6a00:440b:b0:74e:aaca:c32d with SMTP id d2e1a72fcca58-7583806f7c9mr22318689b3a.10.1753104320687;
        Mon, 21 Jul 2025 06:25:20 -0700 (PDT)
Received: from work.. ([120.60.76.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb76da69sm5688821b3a.115.2025.07.21.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:25:20 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
        Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        dlemoal@kernel.org, jdmason@kudzu.us, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v21 0/9] PCI: EP: Add RC-to-EP doorbell with platform MSI controller
Date: Mon, 21 Jul 2025 18:55:05 +0530
Message-ID: <175310419611.11873.17918717791350182486.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710-ep-msi-v21-0-57683fc7fb25@nxp.com>
References: <20250710-ep-msi-v21-0-57683fc7fb25@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687e3fc2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=5oemJFBbzWj47VPNxq3P8A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=mrIX6-fznQKVqVjsUugA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: zw6UyRhp8L8pwiZxQMf5jHBOqWCkc1PF
X-Proofpoint-GUID: zw6UyRhp8L8pwiZxQMf5jHBOqWCkc1PF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDExOSBTYWx0ZWRfXwGiCxtmX1Lzm
 2CobV9X3fUO+HsKM6PGFOXzEp03bLfLnkLdDbbi0V5TU+RBz1zoVLY45YG8Yewv2sQ+dk/ErBfo
 WQB1mDFffoqN8slwc4gMMyxAw2bhrgaWbiyRejag419qgpl+Djg1YMuX4tGq0/KoQPewEkkX8sV
 E+TeI9GBANeAlphwNaHFmBHhUgV9n8bGYectbP1hybMnmQHkas1b81URCMvyWTj6YN9wYmiYlUk
 Uhtgk4icsOYIfcDyMYQ/fj8SahGb45dswqB3wC8fhPA6cnGeRp4ym5ZSN4Q30XfBXiOj8ux7UuR
 AGMaNw7lWCamvONOmpZaAF/jeSmO4Vg6acsZPagJHwTafLzFNR3dSmBWTwbRica4YntN6Vi3P/U
 CY67j/j4aCbmveR1y46UHFaDrhDab1Q6kuHZBj9aa3W7miq+KRqP9Qkf2Rxif3qYxuar7OCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=993 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_062525_124926_8C6FAABA 
X-CRM114-Status: GOOD (  12.51  )
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


On Thu, 10 Jul 2025 15:13:46 -0400, Frank Li wrote:
> ┌────────────┐   ┌───────────────────────────────────┐   ┌────────────────┐
> │            │   │                                   │   │                │
> │            │   │ PCI Endpoint                      │   │ PCI Host       │
> │            │   │                                   │   │                │
> │            │◄──┤ 1.platform_msi_domain_alloc_irqs()│   │                │
> │            │   │                                   │   │                │
> │ MSI        ├──►│ 2.write_msi_msg()                 ├──►├─BAR<n>         │
> │ Controller │   │   update doorbell register address│   │                │
> │            │   │   for BAR                         │   │                │
> │            │   │                                   │   │ 3. Write BAR<n>│
> │            │◄──┼───────────────────────────────────┼───┤                │
> │            │   │                                   │   │                │
> │            ├──►│ 4.Irq Handle                      │   │                │
> │            │   │                                   │   │                │
> │            │   │                                   │   │                │
> └────────────┘   └───────────────────────────────────┘   └────────────────┘
> 
> [...]

Applied, thanks!

[1/9] PCI: imx6: Add helper function imx_pcie_add_lut_by_rid()
      commit: 9d0ca8df2451eb66a0c13a9932f348d417d9603b
[2/9] PCI: imx6: Add LUT configuration for MSI/IOMMU in Endpoint mode
      commit: 234b9258c6907cabbb2594ee366286d35ff056f3

NOTE: I've dropped the Tested-by tag from Niklas since the tag was only given
for the EP patches.

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

