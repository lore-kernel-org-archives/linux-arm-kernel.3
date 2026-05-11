Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E773CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XdyyhEj4/v2ra5ngAxTRu5GNOcioukMe9KhLVuT3bms=; b=tUYB/mKLHh0khFgHQW0xbr0P+R
	49zLay2yMKvKOgQVLUknsJlP0EEHev1L014IQj2+LZ9+PvkvAB8TtPyjdcBEwhbYgpL5C67E44808
	Ze6zCBTP8FFiVJvPsVGnA+raS4ByZufatZQgc3syJkLtTnscV7pJ9sVIf8T9dtIQwRhEtg0BAyQlt
	3Oi/ys4j3aY1hSd8ScW4jqDf+AUx6ivXvT0fNGApv3CIv5s24zR9eN77/6+mxnS7Le8YFt7mwxQ2l
	Nsvfw8EMFeRqGWZTiRzpp/do5y2TN2/xOTQ4LfQd5zitKpHRHg658quwYTw1nCRmEyj0kostaCt2R
	Zc2+maww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfj-0000000Cr5f-21qL;
	Mon, 11 May 2026 09:11:31 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfh-0000000Cr4v-0pQ3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:11:30 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-83659d38e38so1758113b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490688; x=1779095488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdyyhEj4/v2ra5ngAxTRu5GNOcioukMe9KhLVuT3bms=;
        b=Xuq/6PFLWl7SvU80CjQsONCc/2V6t/hI3sZpOkO29sewGJc+KmQxEyQbaayJIfvUIJ
         1CGfIGt+8OUuGOdAO2ABcG7AB5TfLlZKoC/YpH1Zco1oO11L3O61mjl7CqmoF4O5gq74
         q3+8mJzvMSN18Nrapdn65xqNF3QgffaBpNgewMNXPzZqAepq5MtIAf3yJ1rIXd9SEwqc
         X7EI9LcQ+9I7I4QGZFSFdmTpu1ZSLSHsFnD7nNVipqZb/9NmViFib/JzkJyDBifC74QY
         OaayhnNfSiWagvdj4LI573b53rOyWlUocNWNWkUNZuduG8QM/Kg1dLHKgKODJa9fH9pw
         FHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490688; x=1779095488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdyyhEj4/v2ra5ngAxTRu5GNOcioukMe9KhLVuT3bms=;
        b=ooPNKyenXSTqc5r+WMfOQy/NltJdXqe55NL5FH+GAk9ICJ/G+YIYtJ6H6Wqn7jXRmb
         WTEiTAGSwazXTNFKGpe4/22X/bwnaajG34PQxr/BphSAK/E084+AAbrMF7o1a3dT/vm2
         DAmMUlCRB6zfLjMVXIc8RcOMVMo4hT55EMNASiPRVPyODj0EM6BwymxqXwVVTMfCZ+Vy
         Yj4SMZVfqjgYVgO3POh/dWz95ae3eqlORm0/eiiL9sT4C0cmktcL8XZkw3+Bn1sFe6sc
         wmK1b9h9Y1NzSRs0ac3/fv00+/Wdgnv2b8HLgeKCoJbuUGiBYjKioFyJApXXNzA63DkO
         Ta0g==
X-Forwarded-Encrypted: i=1; AFNElJ80c8NoovGBjcWsuFpA5ldsE9KIFomVzJMMMUWMs2MjooVnIbQlW0gLdRnRCuapeMeS8OMc5a9US0S5O7KH/j5/@lists.infradead.org
X-Gm-Message-State: AOJu0YxPWBCGY6EjEzqHDP/fbiciXHSCxOzOCPAI5ZEObIRQ5fGt8bzg
	EZlQTziZmOcgZo2jRSE7aKdu6nxHI1OJ9nCfnYedwXrSdSAEQNXAgCCo
X-Gm-Gg: Acq92OHrU7aKqS2azKjyAAqzQ+fIz+8dH4kaIp/uqTdGEr/SAF9oaLBKQbj/eDqqSQW
	nksF27XaQ3HWmPBBZUgwknx4gOXJTtSS2u3wUWupIcb8mbDtgYGluq9UvUKd3A5UeAQOpgc6+7F
	kCDspeVK1MTiZaN9UxHZFf2whTqZv2ULhJhyZ4JSS8HHPX5uOParVt7Gs0Jx1x3EEJ69zCd1ZLR
	4FvU5Jn+un7lp7Jsud1PTcEHflyXrmdBlSG4CGDMsPT0TfivvSy0nQKAaXEB5lafluY4EOUqGPx
	x1j4ZFKLEgJkC79MNHUwA01GFT3BgFHAJWsb+fVt3XnxZrHXf5jZyl7LNmSD8AzJ+TM9ta+1dLe
	XCiAl9sixQ5ukQkz1UltW8TtoJ1gcWhaLgScXSYGLYjGY83np2FQiWoUjHFPKFa4QzUawtoVi2D
	2B/DM4iHUOIUQPaxGEXlLPszI=
X-Received: by 2002:a05:6a00:2d96:b0:837:acd7:a78 with SMTP id d2e1a72fcca58-83a5b9d8131mr21057954b3a.16.1778490687914;
        Mon, 11 May 2026 02:11:27 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:27 -0700 (PDT)
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
Subject: [PATCH v3 0/5] fix and improve for Hi846
Date: Mon, 11 May 2026 17:09:19 +0800
Message-ID: <20260511090924.269106-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_021129_239479_9D6BAC1E 
X-CRM114-Status: UNSURE (   8.82  )
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

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v3:
- fix modes handling for different lane cases (Sebastian)
- fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 251 +++++++++++++++---
 2 files changed, 210 insertions(+), 43 deletions(-)

-- 
2.54.0


