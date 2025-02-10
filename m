Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19766C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/H+us+EpN5gsIUBiB28735vhfURAgKzhJf8uRl0O2pI=; b=qbjH1icCGIjOnw
	3UJCoI9jbFeor3gJ86uKH355C+LvZO+2G15AGxOXtq5p/RJbB1hWi0T4CWtBNY/C4M0thzD3Xl8md
	HSnBhzouBHhySlLj541MjPXwiHsAzxEa82bWARdIlYVLKksSedolfWg8rJXee5p5c9bR1vL1F90B8
	8BVYpiW79pJUGfI8B1boQQf/2LVBXa9tNL00pDCoiuItKpomtgXOwQ5Rw9xqeaXkaZVfBFo0J9Yea
	taUdKeYpYfXW6s1IEhcA7z47ThtvjMY9tU+JsokZjsh2WR+sH90ZZF16Tdl3VfXa0pdB6wF+DwENV
	z0njUXwPFcaKM1tchQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQnW-0000000Gx87-3PXD;
	Mon, 10 Feb 2025 10:13:50 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQhQ-0000000Gw02-1xka
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:07:33 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9epr5012596;
	Mon, 10 Feb 2025 11:07:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=/H+us+EpN5gsIUBiB28735
	vhfURAgKzhJf8uRl0O2pI=; b=4xWJWD3AB2S4EH6i28/FicuBfQaDy5KGsqp9Yy
	xQ3UBm+EpK9IRp4LP1dIXUoCjDHyicQORR+48DCdMMmhBbmktc28Zsfnj5QvEnwH
	0e+JPa6a9TGy5l3D/wk7wrHYxTaH/XyA/9mkPDzDKKRk0Kz4xSS+L3i+avQUfNfJ
	VbdxPRlKddOdD7xVAs+pyKXyoqOF0j4bPj3zVbPEDdWYZJPvXPSRLKKFxkCY2Uin
	81krOXng//YV27/HSDLEkfTQFv/IFj5wFPnT3QPkgLpon+SONoaMhEzhqU8MzRIY
	QPfTEBYkS8msORr6G3foOogx3CbFw1PxxllHUJjFYlhjYpdw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0wswptp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:07:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B2C4E4004C;
	Mon, 10 Feb 2025 11:06:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9629D2BE929;
	Mon, 10 Feb 2025 11:05:00 +0100 (CET)
Received: from localhost (10.252.6.236) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:05:00 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/2] ARM: dts: stm32: correct dtsi and yaml related to
 dcmipp & mipid02
Date: Mon, 10 Feb 2025 11:04:29 +0100
Message-ID: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3PqWcC/x3LSQqAMAxA0atI1gaa2jpdRVw4RM3CgUZEEO9uc
 fn4/AeUg7BCnTwQ+BKVfYugNIFh6baZUcZosMZ6Y8lgjuRQzzWzuPIoHU5ys6IvyfRu4r6iAuJ
 8BP5DfJv2fT/o7CZcaAAAAA==
X-Change-ID: 20250210-6-14-stm32-media-fixes-5810b4feb917
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.6.236]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_020732_793269_20BAA506 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

This series corrects two issues found on the stm32mp135f-dk related
to a missing clock-names property within the stm32mp135.dtsi and a
st-mipid02 device-tree bindings issue.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (2):
      ARM: dts: stm32: add missing dcmipp kclk clock-names in stm32mp135.dtsi
      dt-bindings: media: st,stmipid02: correct lane-polarities maxItems

 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml | 2 +-
 arch/arm/boot/dts/st/stm32mp135.dtsi                           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250210-6-14-stm32-media-fixes-5810b4feb917

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


