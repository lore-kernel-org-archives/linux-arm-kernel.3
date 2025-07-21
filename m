Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC17C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 02:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ZG238iiqL1oF374QqgAnsl4UhN940jn7kxJw1Y5yyCg=; b=wclln6SrvdEnS12Q3FyNglwFp4
	vYFUP30JxZ+fn2UwtV6NV0L4MteQl0GJU9y4LM6Lidp/D5vm25sv7QcJO9owx8w+rjtzINtP07wpd
	7tlarENUXNc4gFPhvF3wyEonbaT+WAH+8Ktkj2CbNxlXVo7I08gSUn60CUzR6vpgrlzrJEy0mjLEM
	mkB0YkmTbBFgixMZoH9lgS58XCympKmaMS8tDFWiSXVauTsYP0N/CCMvCz95p+A1/Ei+E4YFZtUjP
	RI8jmHj58yjsh/CTDk9f8jhU2MjZyq0/OTCCkOfUbWq1+Nlcf16v0PU0KFtEEgx1CGOYnAOoYaolB
	JeUFZ70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgcY-0000000G1yC-014l;
	Mon, 21 Jul 2025 02:51:18 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgXk-0000000G1Kx-0yAH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 02:46:23 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250721024613epoutp01117520c270753a4fca4537846f57e900~UJDbl12bg1459714597epoutp01d
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250721024613epoutp01117520c270753a4fca4537846f57e900~UJDbl12bg1459714597epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065973;
	bh=ZG238iiqL1oF374QqgAnsl4UhN940jn7kxJw1Y5yyCg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=DGCAMXaBmH8wMXZoYXvCB9eJ0KhjlGitNip8FfYDbAF0LlToCqrg9HjOIyUXXtjr+
	 kUDoVMk9z9WEc6ziDVA06YAEun0MIQoKHYYjgl2oPmJQdyN2TpCeXFoAn9Ekiwj4kg
	 DlZunwq50HukKvveoBWjf3id2f6W2nICc0jxXg4E=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250721024612epcas2p3f4e5b3b426411163c8327e39d09615f8~UJDbJ9J8J2776427764epcas2p3v;
	Mon, 21 Jul 2025 02:46:12 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bllC76Z9wz6B9mF; Mon, 21 Jul
	2025 02:46:11 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p43099e043aaa6f48c05eb0237065d31c7~UJDZ3TRM00521705217epcas2p4m;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip29239d66d3840037030b3fc786333a782~UJDZzOhmh1443514435epsmtip2D;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Add ExynosAuto ABOX generic platform and PCM support
Date: Mon, 21 Jul 2025 11:30:43 +0900
Message-Id: <20250721023052.3586000-1-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p43099e043aaa6f48c05eb0237065d31c7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p43099e043aaa6f48c05eb0237065d31c7
References: <CGME20250721024611epcas2p43099e043aaa6f48c05eb0237065d31c7@epcas2p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_194620_719870_8713D9AD 
X-CRM114-Status: GOOD (  12.01  )
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

This patch series adds the ABOX Generic audio management driver for
Samsung ExynosAuto SoCs, along with IPC messaging and PCM frontend
drivers, including their corresponding device tree bindings.

### ABOX Architecture Design: Fixed and Variable Structure

The ABOX audio framework is designed with a clear split between:
- **Fixed part** (common framework): reusable components across SoCs
  - Generic ABOX platform driver
  - IPC messaging handler
  - PCM frontend with ALSA compressed audio support
  - Solution manager for dynamic control
- **Variable part** (SoC-specific): defined via device tree
  - IRQ numbers, stream IDs, buffer sizes, and ADSP allocation
  - Defined per PCM/IPC device node in DTS

This separation allows the fixed part to be upstreamed and maintained
as a reusable framework, while only the DTS and minimal changes are
needed to adapt to each SoC generation.

### Major Components in This Series

- `abox_generic`: Root platform driver coordinating subcomponents
- `abox_ipc_generic`: Handles ADSP messaging via IRQ-based IPC
- `abox_pcm_dev`: PCM frontend with support for solution chain selection
- `abox_solution_mgr`: Manages software-based audio chains via dynamic
  kcontrols

### Testing

Tested on ExynosAuto v920 board:
- Verified ALSA compressed audio playback via DSP
- Confirmed solution switching via kcontrol
- Verified DT node parsing and IRQ routing from device tree




