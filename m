Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EDDC44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 11:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Utm4P1WbP2lIpaXwLG1JxwvoUEmp6e9qMX5dfGldD8=; b=RDQNXXsnc7tVexN2UH+NaQoOk7
	dAWvfBc+e2KdzMtbvOhp/4sbBBAI+6c1FGI5TlhcWolNBMjXxAGmpI52KxxltH5MHpkVSjsy3JQuh
	ONk0tBnX9xM84quVGc7fU4+BSCRTvuKh44L8470dlpsk1M6Y44ZRq2CJsCKDJnmnpuJTHD1pzYRGt
	OeN+PHIEHGuCVrYP7ong3ZSVSRyokIlm4eCw2aAOHU/VxcsHGSlSnERaXHAoWm0CX3rLSeFoHHLpV
	TYd+3IcZFG0xks0YHOqvh3Dq3mVcEN856vekT+Y8ykgqkko9Q1oMUHwinp/69UIEwpjggMSq5T0Qs
	zONnMCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisj0-00000007Q3w-4A2D;
	Sun, 12 Jul 2026 11:51:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisiy-00000007Q3a-3LfD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 11:51:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so24350095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857115; x=1784461915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Utm4P1WbP2lIpaXwLG1JxwvoUEmp6e9qMX5dfGldD8=;
        b=XL6WLbe6+Te42/i0McP6j/rOkCVYQxexYmL7CxH/ocqZT6nREhTPT1nTtjc1ncrZfc
         rElXC8l6bVNijAh2AfYYHP0n1OyMlckFOZcyadLBbY0XzN+APC1bpbA40IOGlvLgx3ex
         jSImklgvxQEa3DlXeNhRU2EAK1Iqs2nW8sqBcmHA8wWcaR5jzc8U6bZa8jbB+oF8/scL
         nu88vrseJBVfUyLJwG1HKjhkCczQBC9PA06DwOjhTybkwTeFnbFuhPoveCPnFeZc5y7n
         MWlgRB850B3oqL/4QBV/edVN8SWUyOirNAqNM/iC4ZlO7YAMeglm656Nbd/HH07ZA71N
         7sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857115; x=1784461915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Utm4P1WbP2lIpaXwLG1JxwvoUEmp6e9qMX5dfGldD8=;
        b=UC1zR7xZmuxMYw2fXtArH3r4Wwllo2QoczIAj5pdU6hDjVAmDbAg6qTBqcheR26EtN
         DyHKBfEa0kjRMw5ogLOTRPhkUbnZe9tFJ0Gj2U8QMD3wMz5f7Dc8w1aWFpwDnJfCyhXh
         Ji5osJA6lEcMiZ8LuRx3ua296zo0apwRdEk8SO+NTuq2+T+PewC/iC5xjYb5u79DfiMN
         YAj9PAkXMAB44WmU0YOeXLZhio0kQQE6GqjH10y9sEN3jo2mslbfLe0BORRaWfAKoVJ5
         8frHpt0kFt0okoHOeJQYOpdpM093CcfSNRnITLmeQ7MRU6b3r/pwpiGevErK38GAiBHG
         hRhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpU9PAhuDkiH8nvIEORIJjeJSOjBLkp69LOsya3BttN3ABBHYx7eAA51+22ocvgXNuZym1YTh25Ye2Rie+GQuSu@lists.infradead.org
X-Gm-Message-State: AOJu0YwqMX9zkepiQPGS5Mieuc4fKKRzTWCk1IKQ9iVRDK/p8u0FUmkZ
	2/KE+iOfpBE4Hl+I8y/FBwHYzxdLwj8H6lZHKMxauJGuX0HR+ypE0VxEanKDGI+oTho=
X-Gm-Gg: AfdE7cl6xeX7dXtOX+a6bF7+L5U9vNhjjs7jTcG2kh4FpyhNsdNx5fNCU3uZFzNRF10
	hf1q9bcVUsANet/6EKN2XrvRrFmN8rN/MEk6PO2mi8z4SI5ZJVmV4UO+bn/pbsz9V+IRP8Eezzf
	vjoGILWNCtpy9pTbQB+kFoSzghYn3SnEhvCoHhd8XYZrRq4fj2X65/quIQ78F1YcAj4sJNqtNPL
	D7iixP73jtwXZKoHdV/fv05etZuJTac/P1PajcaILlFLSumG/pX+FZk6nObzwko9QMr0Ab0tk85
	hhS8l1sHychP3WAcAW2n8t8erhqGkZF2/3bUFbLDEY+YoSw9qJmFOhLFeZ81GPta16h8I3W8Jmt
	RB5VgkN4CBgPr1rZHs9IhOufm4oHXUx3FJrOfcXMjeUwX6Wy/XjJZGiFcFPCGYSiMHKC8zo4qX7
	78uIlKSzI8dtb/w3zOJtAVtOSHkCrYVNZAOpoLPnmll2JTdsHKfw==
X-Received: by 2002:a17:903:4b47:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2ce9ee1890amr53777765ad.24.1783857115288;
        Sun, 12 Jul 2026 04:51:55 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:51:54 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v5 0/5] fix and improve for Hi846
Date: Sun, 12 Jul 2026 19:50:07 +0800
Message-ID: <20260712115012.91600-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_045156_839386_7CE60E3E 
X-CRM114-Status: GOOD (  10.11  )
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

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
- Drop line break (Sakari)
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
- Link to v4: https://lore.kernel.org/linux-media/20260511103927.279550-1-mitltlatltl@gmail.com

Changes in v4:
- Correct default lane cfg in commit for 'fix link frequency handling'
- Fix messed header (the Media CI robot)
- Move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- Fix modes handling for different lane cases (Sebastian)
- Fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- Remove uncessary `else` (Sakari)
- Fix link frequency (Sakari)
- Correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com


Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: Fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 296 +++++++++++++-----
 2 files changed, 227 insertions(+), 71 deletions(-)

-- 
2.54.0


