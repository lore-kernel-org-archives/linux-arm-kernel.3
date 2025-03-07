Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E88C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yl6f/SodGGeAxz+5H/l72NErMjz9ym9/w2AhCrQGKKY=; b=EfVG+gzvSdQ9Uu
	RI1s6jrhmmg9d9FdLDjnvzd5mW33KUesFkzn6C4+wCjL2yKLvTJ+nPYeTA6xsv0/cKJ73bY+3KR+C
	crjDw2T5rWDJcRSa/8R9zxlLA7BIsppM2DH1a1sGBvHIwEwbcr+X3DtYCOtYXg5mIlCX97Y6Weq6Q
	EW5Xnb8ZJ63NSFKs+BIw1OlOnOyohf9ylG8XWIw7Spb47rWqX7M+E3oyd2rvIb9XLdgW/MNPzf7aS
	FTt2jKq2DkaWl+6QEH+2WwnBpfdKDvGd9xWd80zgLuFfpWpys5devoEQJuaKGUUCRZwmiDdJTX/Sp
	Dk/N4zjM3ySPNKvhmb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVmz-0000000E1mc-3hNd;
	Fri, 07 Mar 2025 11:22:49 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVjj-0000000E1FR-2Btp;
	Fri, 07 Mar 2025 11:19:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98BBF443A6;
	Fri,  7 Mar 2025 11:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741346364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yl6f/SodGGeAxz+5H/l72NErMjz9ym9/w2AhCrQGKKY=;
	b=eCFsKVKARYrnL/zAS2YX34+Rl56pcOrOvoAXI9lYg7dMcmLKh4yqOq133wU9e1qMoZO8Tu
	WhTKuiggcabdIRA7tJU77YD6PPNL0f6iqSce2nCSe0NYWV4DkGxhHnua9W/bzAqkcQYZom
	RrGbfY4wA/kiAIRJMQQZF1qjWT0ufhnkTL3t0iKlOiMQ0m8/d7G73M9Pn5QcvCtB5eG7ei
	pEpMIC26i7VQAGN4CLowA+VmaYwPuwX1VUFLpVa3HeU3Qj0aju9JXzEXWFiL49DzD9SkS2
	D9VV0ryc4l9vK69HvKhvA1XcX/OI5ynMNgFQHeRnTMA0egR3Ylufwa5E17eBXQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] vsprintf: remove redundant %pCn format specifier
Date: Fri, 07 Mar 2025 12:19:06 +0100
Message-Id: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACrWymcC/x2MQQqAIBAAvyJ7TjAtir4SHUzX2ovJGhJIf086D
 XOYqZCRCTMsogJjoUxXbNJ3Atxp44GSfHPQSo/KqEmWnJjiHWRyUc52MGh25RugJYkx0PPv1u1
 9P0rCgtteAAAA
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
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddthedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgieetkeekgfdtudevueffueffveekheeiudfhfedvhfeukeeuhffhtddtvdekfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdejpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehssghrrghnuggvnhessghrohgruggtohhmrdgtohhmpdhrtghpthhto
 heplhhinhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepshgvnhhoiihhrghtshhkhiestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepphhmlhgruggvkhesshhushgvrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_031928_229485_CEBEF7D8 
X-CRM114-Status: UNSURE (   8.66  )
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
print exactly the same string. The reason for having two is not totally
clear (see discussion in patch 2), but there seem to be no advantage in
having two instead of one.

Definitely having two without properly documenting they do the same creates
misunderstandings [0].

Since %pCn is used in a single place, replace it with %pC and remove %pCn
to simplify such format specifiers implementation and avoid
misunderstandings.

[0] https://lore.kernel.org/dri-devel/71c44221-b18b-4928-8faf-00893ec4a109@nxp.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      thermal: bcm2835: use %pC instead of %pCn
      vsprintf: remove redundant and unused %pCn format specifier

 Documentation/core-api/printk-formats.rst  |  3 +--
 drivers/thermal/broadcom/bcm2835_thermal.c |  2 +-
 lib/vsprintf.c                             | 10 ++--------
 3 files changed, 4 insertions(+), 11 deletions(-)
---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20250307-vsprintf-pcn-8a43e3b0d43e

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


