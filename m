Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE392CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhUi6h4m6Y5VXT2vKK+q0h3TDlsz5Xrrk0iweaBViQE=; b=qAB/n9diYYr3sUEh2QJy5tWDS9
	m0xcwKFngfweIP4Lpq1IHaYdSJRaIthw/6W7zgCN/ZP3KFQmIgoa+sQvZ6WccQvIMa8FqmowTjomh
	PEszVWlmJvaCo6XXBxA+dU/OxEkFoUOoaunlEUBCK0QhQtv4QFAldB+hOQA8wp94OrlSmui9RhSTD
	M6snMRrLnGLhdB/VT/sv/u97pn74FBBYtcsdyHAfweOYGnaro4VBk3YYtvoLkMMdUe3V1SeIJ1sBf
	zV+A1lyPxfjIzegBJXtlZru+dsOCReu4t7n0pIMSGM032HRTk98pj53msF3BftGMYRizxFjUI+qYW
	9zwxerYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA76-00000002E6M-0Ewn;
	Wed, 29 Oct 2025 17:37:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA70-00000002E36-0uv2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 17:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=NhUi6h4m6Y5VXT2vKK+q0h3TDlsz5Xrrk0iweaBViQE=; b=qKJNu0D4kQRKQrN3jZNupdzYEQ
	IT+gdt55ipQyUC6Y2KKuvZ9hz323M2re0x60LzTyirqOR9w+ShavscOSWppsbPFcY7z6ZB2SH7lK+
	SufTnfv0BwFlAZae4UHtdx8+0ULxNON78AJJ69uf2314ETaW2smHoBZNk8usXF6VXRCHSmuoC9Oaz
	+9A0sHVJc3LWeeP6QEz0d/U9YWpZwh+LU9x/tu2bh9M94NAhA8N6uFHImJiWEDW7WGwjkOSO6fS5V
	MOxYuNCrZjtNIXROxRBDJCn+7ILJ8W+IJ7IiV+jS8/8VYmjt2/RIkzwKWHGoULBBqWcq1StIHRgAV
	4LofCxMw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9FD-00000007T9X-457V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 16:41:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-427007b1fe5so90314f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761759445; x=1762364245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhUi6h4m6Y5VXT2vKK+q0h3TDlsz5Xrrk0iweaBViQE=;
        b=d1+CRgPwqluWz8Gs7tncHTAfJQ47G17xUVYqVUf3CWR0iQgAUUcAGvbF/orUyuGnXJ
         QYr/g/IjVBYN2tE0m/aEm2k4uwo5LP/Zc80ohLlXab2Sc3HQ/49Jud0E95gEQThDiivC
         yRBIdslaeX3dzyKgZZ155TUloMrL8bZgCR7YhWqQxf5/c2ZpoqpfBaZIen86qecsvso3
         A3mVZ1NwRyn6/ZZFCXE0ZLfSjwY8IITtWeM6T9kgvSrAT3ERrdc2H39D5GxQFEzPySIT
         h2sl5H7MVLtp2Z8eBU3CqqbITJJoqJ59pdJzBoSohsYBBUzFIHAftFfZnxCo54gzO6yb
         yXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761759445; x=1762364245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhUi6h4m6Y5VXT2vKK+q0h3TDlsz5Xrrk0iweaBViQE=;
        b=LcfdBy6dae5rnG6PXjt1JzJHWsd1IcfShT6P0/uJw4f/bAMjrMO6MedfhtR/k0WSe4
         MjlfGFpTM4xAXprD8J8GDOpCAcUQ9su9CjEpfdq41Mp8707oqweHIs38g9XT+Sh3pCKX
         6BlOMgcQzAYEHVk/zZzjdvHI5jHEsHUlqByO2f2TWssYmAVfv+fzIcYV85YTs9Zphbtd
         aB+NghUtR9FfLiM5J9FBSnIM3fA7Ua7IGCuigMNHl2V/X+19lRXBht0UeNBXYK4QDmIN
         uxt9ARVzGWAx9O1LlXRqZ5OAG2dESNezdMptIs+1BSskWa2uKdNoRVg/l1+gPVPFpHbA
         34Pg==
X-Forwarded-Encrypted: i=1; AJvYcCX4mBAIIPmJdH6fHhhCKhHPKieN8MFN0RbenFMKf0JfuI0bzbYorE1X8+P/lKbckEaRi/XhbhBd32xO2EXmBrJM@lists.infradead.org
X-Gm-Message-State: AOJu0YyYzoyNFDHocHbzQR1IpA1RmnkwM7NJ+01YdDNTpRwqd17ArNbW
	PDyulRBSzhi3BW7kSzkNBsLo32lCeKZVEyNO4+R+pjyA+a2NK1wshTmd
X-Gm-Gg: ASbGnctpY/1/RDHzg4KHMToRxt2GSs+OibY/ZSstV72yj7TH68rruL9JzW8ry6OJ1TQ
	DwIci1/ZTnlyf5qNnzLT8sISa2H9QGdJ6MQkj1I7WSLqKfarL1nkpfPnlnha3ADNYUwSJ6T4t9x
	DgaYnCwKkQCfG8l1b12WEkFFqYM4n2RK3kJmW/pnX05h4LJTNfSp6sqWYIKtwLZ7s1IgJs303N1
	xQahe24Hxs399js9KE5vuPL0KmKJ81a3B/s2Od457ONHyXXLnsF2PbTO7a47x41AuBAzdnJnENK
	oU8iT/plI+KlvdvmgNc+3+b2L8q58tnL8UcPw9QiKfirEHLXtQDpDLi5a65BzIZ9G4MyToFmaXB
	wi6x5Q/w8gZzYh72M/uTZGYjaOlHW+VtCjUgnWxEVV3b2D5pd7YttWWIo0DMSsNf2cE7AYjUt0Z
	7rhG5BKMKEUX4xKS2AMw+0sFmNt6SG/A==
X-Google-Smtp-Source: AGHT+IHzbLzBMCG4vRWavhz0gR3MN2E4QK6PUFiHctEW/nKzQ6EVw44MxYOuM0Le4svI/Ot02aqVPg==
X-Received: by 2002:a05:6000:2c0e:b0:427:632:cd3f with SMTP id ffacd0b85a97d-429aef88c52mr3318335f8f.28.1761759445032;
        Wed, 29 Oct 2025 10:37:25 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952d9e80sm27493844f8f.28.2025.10.29.10.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 10:37:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
Date: Wed, 29 Oct 2025 18:37:09 +0100
Message-ID: <20251029173713.7670-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029173713.7670-1-ansuelsmth@gmail.com>
References: <20251029173713.7670-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_164156_122702_D20FA503 
X-CRM114-Status: GOOD (  13.68  )
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

The Airoha AN7581 SoC can configure the SCU serdes lines for multiple
purpose. For example the Serdes for the USB1 port can be both
used for USB 3.0 operation or for Ethernet. Or the USB2 serdes can both
used for USB 3.0 operation or for PCIe.

The PCIe Serdes can be both used for PCIe operation or for Ethernet.

Add bindings to permit correct reference of the different ports in DT,
mostly to differentiate the different supported modes internally to the
drivers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/dt-bindings/soc/airoha,scu-ssr.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.51.0


