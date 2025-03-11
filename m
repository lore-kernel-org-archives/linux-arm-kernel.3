Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E45FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6VTqHFVqHMv5npZuUyKgDinGie6VAE2hr7CtUFwYLSY=; b=PslTuDwaIC54No
	BhTVbxUAWw1bx+3texq1slLyqinXxV83tuwYAl5+3ZpEhiJx2jE6iux+8NZ7x3M5NXClmHVegi2db
	RqZn/vvG9zN8z2tKwoHn/rkB/yhGmJx7XST2Xq4980b8EQ6w4zI+rwALD5lNFzbKiXthKH7bYSETm
	RXqouOE7rH0xVhes9ri3OH/BFls13MkGJe89ym+bBoQtpjJb8smNgfRmXt/LEnueJnD1As+rD2M2N
	qqIXsxukJ97Ob4rriHmvhMKCm9oVYoRuiOJ7n37QAYm+LaAhm5A2yy4lM5wzM0Df3BxxCUnvrlvD6
	CDxYV6SAevb8vzWugQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvrY-000000058el-28Rp;
	Tue, 11 Mar 2025 09:25:24 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvnq-000000057zQ-37Rg;
	Tue, 11 Mar 2025 09:21:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D8E3432FA;
	Tue, 11 Mar 2025 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741684892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6VTqHFVqHMv5npZuUyKgDinGie6VAE2hr7CtUFwYLSY=;
	b=o9p83flXRMrRQuTLg6n/HGont2VUgB6/lw/4w2fAvirJUilLCqThl8RIPLmtWw9vEW95eX
	envhk4s2MbLlzGsQ27DidxfRYMN44+3RIPG6IjBlPdfTXNQOOivGfzTqKEm6d9e+tL6QUp
	dtDRYnr3/mG9lUC2rJD/UMAfkIh6l/+H9vQhU3fyvb4zD2QkhuytKMs3Nq2/wnfcbWBuZJ
	SsRtZocmVaX+Juk8O43qF2q6E+QMN3fbet6gpazai6Dc4JcUXZ90pZioTpeucWr/sYw9MJ
	LBNJAENxwSNN4bTC7qANAYjPilyUpYrUUyAvCtwKLM5hvCJ6vxwl5hU2Hh1Zfg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/2] vsprintf: remove redundant %pCn format specifier
Date: Tue, 11 Mar 2025 10:21:21 +0100
Message-Id: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJEA0GcC/3WMywrCMBBFf6XM2pFJ4gtX/od00bzsgCYlCUEp+
 Xdj964u58I5K2SX2GW4DiskVzlzDB3kbgAzT+HhkG1nkCSPpOiMNS+JQ/G4mICX6aCc0mT7QFe
 W5Dy/t9x97DxzLjF9tnoVv/dPqAoktJ60NMafBPmbjrE8OexNfMHYWvsC41q6JaoAAAA=
X-Change-ID: 20250307-vsprintf-pcn-8a43e3b0d43e
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Liu Ying <victor.liu@nxp.com>, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddukeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgieetkeekgfdtudevueffueffveekheeiudfhfedvhfeukeeuhffhtddtvdekfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhpihdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggur
 dhorhhgpdhrtghpthhtohepiihhohhusghinhgsihhnsehlohhonhhgshhonhdrtghnpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphhmlhgruggvkhesshhushgvrdgtohhmpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_022135_392968_B7B341CE 
X-CRM114-Status: UNSURE (   8.39  )
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

There are two printk format specifiers for clocks: %pC and %pCn, and they
print exactly the same string. Geert confirmed the intended reason for
having two was that %pC would act as a default, like some (but not all)
formats do. However there seem to be no advantage in having two instead of
one, especially now that there is no other %pC specifier since commit
666902e42fd8 ("lib/vsprintf: Remove atomic-unsafe support for %pCr").

Definitely having two without properly documenting they do the same creates
misunderstandings [0].

Since %pCn is used in a single place, replace it with %pC and remove %pCn
to simplify such format specifiers implementation and avoid
misunderstandings.

[0] https://lore.kernel.org/dri-devel/f8df2b5e-b005-4ada-8108-159b2b94a72e@nxp.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Add Chinese translation
- Link to v1: https://lore.kernel.org/r/20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com

---
Luca Ceresoli (2):
      thermal: bcm2835: use %pC instead of %pCn
      vsprintf: remove redundant and unused %pCn format specifier

 Documentation/core-api/printk-formats.rst                    |  3 +--
 Documentation/translations/zh_CN/core-api/printk-formats.rst |  3 +--
 drivers/thermal/broadcom/bcm2835_thermal.c                   |  2 +-
 lib/vsprintf.c                                               | 10 ++--------
 4 files changed, 5 insertions(+), 13 deletions(-)
---
base-commit: 4d872d51bc9d7b899c1f61534e3dbde72613f627
change-id: 20250307-vsprintf-pcn-8a43e3b0d43e

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


