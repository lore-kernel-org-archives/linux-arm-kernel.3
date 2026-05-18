Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FCECD4F56
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 22:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cd2gH8+KVNAxcq+NWcUqT38BQp2PFP+quQ7E39pyZhM=; b=sbyVLPJMJCnhUw2jbD8bHkmfn4
	vDC+z30VOMOgYxChwVv/BRgEZ+SaWZV27jErYPSqy91eh/4b0D6dznJVoRq+99PFQQsZ9WoJwMdv8
	RPKKPgnKbhkwZ9unyPBVdCoIgnUCsC6OaMT7oLKDh0mgrSXnY+tbl2H3WrpXG/x6wF0TgrDSGVlF3
	Hy5M3EoHDDXVn3IHQwGUEJafAartc22NGR/VXyUtCA+2xueCyFlVAmCaV38abB5xJkEr/t81GGKo9
	0opdrSxrOrgN+zuk8NpedT+AE2XSffjJ1/vUsERmoBZo3RLlLWC3Kj2HtBJM/SYd2WWOgovTMZ3YC
	6gw0xu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP65C-0000000H3eI-06F4;
	Mon, 18 May 2026 22:05:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP659-0000000H3dI-0dnm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 22:05:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488d2079582so26939455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141901; x=1779746701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd2gH8+KVNAxcq+NWcUqT38BQp2PFP+quQ7E39pyZhM=;
        b=lzRS9yFoRPlqcEpgdEAoMnanaqjrEmkjPXsbe/a8ftnihPm0PUIrBXjv7VFzKH2zDz
         7GqSsj0NWv/PtgF7WarvjSiNjROK/uf8wQFjIW7fnvBuOPbFnJ0IgxHd9hjf/NGwM/fh
         UEKM5eAW2nd/wbQoroko2An5lqFroa7W95PgRzwpACzRY7QvnN3pzsvpV9gPxGCMUkJp
         Bd0rvqUqTfT8eAWrMlBaYe/KbV+R2PfdcbzTRWxr5A4UROmBy0p9SvrTR5QL76a/a1rK
         L5uRMhpsXxKowS7w25JtZX1yBaf37ZYITYjwSEtKbPfgHhA/jAwtDqY3tHsuW4gzRhZQ
         A+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141901; x=1779746701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd2gH8+KVNAxcq+NWcUqT38BQp2PFP+quQ7E39pyZhM=;
        b=E9oOCSSGH5z18gK9il5Y+TgP6+341Vva2HDGkXvH8XYr6+hX3G47SVkR10NamvBulw
         AlRNSrYWH33RRg2q9x1VIcJCctfmZ2As5DQTEYzMRxEFVqAwOhVz7TO8Eo11slBOVmF7
         CIpEJgoXGALncVU/jLPoX59ELOdx9I/x851U2a/3PD8zEzEuSivjhT2BB9M1AcTiB21t
         f+oyinaPs1e5hKy8GAIG5qzKzWW0j43xFQvtZv1SXrLwMoyQ3mQW+tifeZ9+yicW0D7r
         01TcFtzSJ0MtBNoqry+tZqPEe3KUrj7L18OjmUBxfBB8cJW4cm1usZ6yyimPRb4MGqQC
         8E9w==
X-Forwarded-Encrypted: i=1; AFNElJ/IseTyUG15HTZBK+XOvqG6DHlubQBI12FeSqTu98WUx+WtbcUdAB+wrXck8Hq2mDMkCL8CyHAoX8v2P9AdxPZ9@lists.infradead.org
X-Gm-Message-State: AOJu0YwrN+God1rVAbNBz1xJInSopa5Yr22LG6Ihn7gc2NjH3/caw8dB
	SRB1ephpW5R9YU1CN6lKwkuzyJ3z5TSUZS9QHNMni1pgq3fL+YPfCSUy
X-Gm-Gg: Acq92OGtV3KEKpIORDsrCu1b/QV+TH9Ohn4GByM9b9acnmkR+sxUsmvj1VI9oSgPDZD
	TJlgoupUjGVRQo5QYU7LIvNsh/lcOqqA4aKxiRjkvty6d21gvEvOv80dzAv7Ok8/aJtXohddKiU
	mJSAiMPZlbIqGJqL4gvSoCN70zqx1Hg/kENY170pIGfqP/tS+v/CiiDBHeqtB7Yn9IaS8bGBSIF
	OuQehQvMRKEImzslWe5iTL/3r/n5XzEHQ44ME5iIEzz1mpzr1ryo4NUduaMyZi7bZu7l/p7cuAj
	y0D5d5adiUwEIIzen3tScaPRX94GEwBe88+SELmPUYNlELSrlYMzVS6z0usk7qmeQrJcrVXayX3
	aIqDw48ffZNHG3cqmBYqp3O2nTQaoHidDuYLN0kSvdYLVPm5rSBVRSM0So031hU6Nn7p5odK9wb
	Z89PsoWYHkuW05dXxS3zThf1xSBAN4nmAVUTo0sETa84rsVsNyPKfjVtX1mIoB6vG8JLSMWpgrR
	3+BVWSpQVnEGyV04T8MdegKVqCbUb5QEeMKnFpT7+1DU4OvTfKNQPigIkaa+Y98t9JMuonD4ykP
	+b0go8AS2vApQRfLi61FdwUGLas/Qd0a0RpHHLS5QtigxMJuPg82+J6VRMyfgulXr51US2rHk5u
	O9raiZk+ECnJfZVu0ZlYXBw==
X-Received: by 2002:a05:600c:34cc:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48fe59b047bmr287108655e9.0.1779141900529;
        Mon, 18 May 2026 15:05:00 -0700 (PDT)
Received: from cypher.home.roving-it.com (7.9.7.f.b.1.3.0.b.8.f.0.9.e.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:e9:f8b:31b:f797])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm281976645e9.1.2026.05.18.15.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:04:59 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: sun50i-a64: Enable DT overlays
Date: Mon, 18 May 2026 23:04:49 +0100
Message-ID: <20260518220455.156874-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_150503_201227_0BC51145 
X-CRM114-Status: GOOD (  10.45  )
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

Enable DT overlays on some of the Pine64 devices to enable
use of addon accessories such as WiFi or audio modules.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d116864b6c2b3..53e6b701e7d3a 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -1,4 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
+# Enables support for device-tree overlays for named devices
+DTC_FLAGS_sun50i-a64-pine64-lts := -@
+DTC_FLAGS_sun50i-a64-pine64 := -@
+DTC_FLAGS_sun50i-a64-pine64-plus := -@
+DTC_FLAGS_sun50i-a64-sopine-baseboard := -@
+
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-amarula-relic.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-nanopi-a64.dtb
-- 
2.54.0


