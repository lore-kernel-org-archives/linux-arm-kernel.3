Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD18ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 05:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GeDSC6iDZRgDYmHR6t4TAJwQ3WTA5QzwDb/jb6aEs2I=; b=yadUmxe++xLVN8DrL/CzcJ0uT0
	SzRj4Fne8vSYN04/azNXDADWj+gNNuCkDTDQsxTRmvz1Gal56E7gZgHvesuDXakhRk78DY/eetnK6
	gh/WIx/JPDZ9eAQA2do5ZC6X1WclHlvMG5rxwCncAzq462GUV53H5Mm3xfdoFMzgBL/6WN/luSIqW
	aM7G56TLvq8H24aWEmw3OrvVJS7buRezXBDEe5M644YK01N5E9YeZMcH3x9jYJ2ChkXCfJJHozv3r
	wVqNV/Ed2Pu5wgMyBPWPyTg09K5Lg9+2HA7nh5EQzu7XqJdWpmi0tcRr4spmEms2yLGhepJPyNJLI
	V4SBsnNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7td-0000000ACgj-14CE;
	Sat, 16 May 2026 05:49:09 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7tZ-0000000ACfo-1K9z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 05:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GeDSC6iDZRgDYmHR6t4TAJwQ3WTA5QzwDb/jb6aEs2I=; b=ignd8rVGRQS2G1AixRPUaMK0MV
	/9QYtdHFRsbZ/YDr6TcTGkkroevffBEbYx5z8ABvqXo6XI6VfW3j4CtsRzUZi/wxwBXpMjHUdIu0P
	W8Bj1f6caxG5eqt9Z/cPH0fgttPfEwm2NDfD/prcD39XBJs88NxIuLh21HhGQvWVcKKCL1Dh57tgQ
	wfB1SW/+pc/FgrzET3TOlxwOPCtoJ166mKIW9x5dCz8mQ+xtyvnVGNpi4UEeogmnaugGKg8jUf2XX
	tqKkw2d62BPgC+IuIX28e92ZFhLI12DB/Px9iS+GCnVKToSJSGqSHoR+RpMbDtGA+8z9/57wooGpO
	Lzszt+Vw==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wO7tS-0000000H5s0-3zR1;
	Sat, 16 May 2026 07:48:59 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 16 May 2026 07:48:37 +0200
Subject: [PATCH v3] iio: adc: sun20i-gpadc: support non-contiguous channel
 lookups
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260516-fix-sunxi-gpadc-sparse-channels-v3-1-4d229d18ff3b@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIADQFCGoC/42OzQ7CIBAGX8Vwdg3QSlNPvofxwM+qmBYJW4nG9
 N0FvRgvepxkdr59MMLkkdhm8WAJsyd/CQWa5YLZkw5HBO8KM8ml4mvRwMHfgK7h5uEYtbNAUSd
 CqHLAgUAaZSRXjXFtz0olJiwnr4Xd/s10NWe0U81W4+RpuqT764Usqvf/WhYgQFkpUPbcWMTtO
 Ea604QjreLA6mKWn832d1OWpmu1UqbjttPdd3Oe5yfLtIJ9OAEAAA==
X-Change-ID: 20260513-fix-sunxi-gpadc-sparse-channels-2b6b2063bd49
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778910526; l=2985;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=kNt/Z4oKF9AixaAwpIu2Ml8Cbcb+f121JoIe7G1ZaY8=;
 b=bCBkkZO3AFDZx2E2f2OZ41t7+qc3Brbk3rwbgGezgw6GKjLXWyj7loNmA4mPZZw4yzhFl6g2h
 gHmxqt/MmOSAqtZbVd6vCN3MA0aENuDRZ6lsyv0hoYWoIPXwyXovAih
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_224905_692834_7A2264C5 
X-CRM114-Status: GOOD (  13.94  )
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

Using consumer driver like iio-hwmon which resolve channels through
io-channels phandles will fail for sparse channels because IIO core by
default treats phandle argument as index into channel array.
        eg. <&gpadc 1> will fail if there is only channel@1 specified

Add .fwnode_xlate() which maps DT phandle to the registered channel
whose chan->channel matches the hardware channel number. It allows
sparse channel maps to be consumed by drivers like iio-hwmon.

Tested on Radxa Cubie A5E.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Changes in v3:
- Add iiospec->nargs validation in sun20i_gpadc_fwnode_xlate()
- Keep Andy's Reviewed-by tag since change is narrow validation fix
- Fix spelling issues in commit message
- Link to v2: https://patch.msgid.link/20260514-fix-sunxi-gpadc-sparse-channels-v2-1-d4a66b70c7a7@mmpsystems.pl

Changes in v2:
- Move loop variable declaration into the for statement
- Fix indentation using clang-format
- Correct commit wording
- Link to v1: https://patch.msgid.link/20260513-fix-sunxi-gpadc-sparse-channels-v1-1-6c21e290bcee@mmpsystems.pl

To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-iio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
---
 drivers/iio/adc/sun20i-gpadc-iio.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
index 861c14da75ad..8a75498557ff 100644
--- a/drivers/iio/adc/sun20i-gpadc-iio.c
+++ b/drivers/iio/adc/sun20i-gpadc-iio.c
@@ -139,8 +139,23 @@ static irqreturn_t sun20i_gpadc_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int
+sun20i_gpadc_fwnode_xlate(struct iio_dev *indio_dev,
+			  const struct fwnode_reference_args *iiospec)
+{
+	if (iiospec->nargs != 1)
+		return -EINVAL;
+
+	for (unsigned int i = 0; i < indio_dev->num_channels; i++)
+		if (indio_dev->channels[i].channel == iiospec->args[0])
+			return i;
+
+	return -EINVAL;
+}
+
 static const struct iio_info sun20i_gpadc_iio_info = {
 	.read_raw = sun20i_gpadc_read_raw,
+	.fwnode_xlate = sun20i_gpadc_fwnode_xlate,
 };
 
 static void sun20i_gpadc_reset_assert(void *data)

---
base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
change-id: 20260513-fix-sunxi-gpadc-sparse-channels-2b6b2063bd49

Best regards,
--  
Michal Piekos <michal.piekos@mmpsystems.pl>


