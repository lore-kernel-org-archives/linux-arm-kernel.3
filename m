Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D06BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 03:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V8Zv1XxU0NXRkczbbte8VINxmUP6BumFNP4JQShgmbg=; b=cJ8NyozZtG0Jh2jtEMmH9nyGtE
	lNclxXfeUMotslCz95mWublauSWhEHATPeMzTHPBfVLURU3NczC3/Dh+MZuyvzVDSw2RScixcA8NN
	otJUi5J/Owmoc0gZh58aAMzk4y1+9DrywZvL1nskVpLwutocP+6Nv3I7LyJB0kPAGrnN7jO8U/cGE
	UQFJ0DkEfvEWIZu8mej8GbWgThpK0gUPwO4K9NbQCXFbGbjH4+Bc/+gZgNNQtnz7VaLvu+UfyYv4j
	84O+/pnTul8w3Z3u1Hoy4tZIJcpm/o6x3QNaxQKeOV823U0hExGArUwmw+AMfO4I6TBzMMroYPCWe
	toD6ICUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMcP-00000004RCy-22H8;
	Thu, 14 May 2026 03:20:13 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMcK-00000004RC7-3qGe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 03:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V8Zv1XxU0NXRkczbbte8VINxmUP6BumFNP4JQShgmbg=; b=QYij6wexY6658C8GQB+Ud1GMHS
	UexeAtIdV4B5jonQ3oMluQfemg78ENfSZp7IWxTW2ohf83AwadBuA6hoI/Gjz7W6jgvVo5U39RtrT
	U6vHE0YbnzgzQtUoK3h4OZLc2YA74CM0L0Gly5RhPk2x9l1BR67iZhRUg4w6+HzrI2ekkoRC123Y1
	ICxbqKyo1qJriSlFf9dvFHW73Uz0ZYiezUn/FeWy0bc5y5HiFcpbdUhCZlRP2cfa7Ef23FPK15v9X
	Cn1xO56b2RgSt3vG2hhCbgYlCBwN8TAJ1zkIYU+gLB7eSCKb+U5ubZahS8TzVeqSdqMbTRIpMuX41
	YIheyFzg==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wNMc8-0000000H9MG-1Eyv;
	Thu, 14 May 2026 05:19:56 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Thu, 14 May 2026 05:19:34 +0200
Subject: [PATCH v2] iio: adc: sun20i-gpadc: support non-contiguous channel
 lookups
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-fix-sunxi-gpadc-sparse-channels-v2-1-d4a66b70c7a7@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAEU/BWoC/42OTQ6DIBBGr2JYdxrAlsSueo/GheBUaRQJg0Zjv
 HvBXqDLl7zvZ2eEwSKxR7GzgIslO7kE8lIw0zeuQ7BtYia5VPwuSnjbFWh2q4XON60B8k0ghCw
 7HAikVlpyVer2VrHU4gOmyLnwqn9Ms/6gibk2G72lOIXtvLCI7P2/tggQoIwUKCuuDeJzHD1tF
 HGkqx9YfRzHF6qVKH3kAAAA
X-Change-ID: 20260513-fix-sunxi-gpadc-sparse-channels-2b6b2063bd49
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778728785; l=2567;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=mAW9smyP3Y9zNh0IDxgH/7BBIen5KUX/2eJMMof12rc=;
 b=IzE2aCtNGPDvgiHxMVpRWxq6l4Hz7kBMcZiHPIsDF1KFpqFB8KN5/bGtIJbN82SZJaMKOPjtR
 AyNgm7Y1d/EClBYHORnzkw4FSpaGRdXUTikaUr9cxnFtfZu18gfBWjD
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_202009_459580_FB10F279 
X-CRM114-Status: GOOD (  13.19  )
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

Using consumer driver like iio-hwmon which resolve channels thorugh
io-channels phandles will fail for sparse channels because IIO core by
default threats phandle argument as index into channel array.
        eg. <&gpadc 1> will fail if there is only channel@1 specified

Add .fwnode_xlate() which maps DT phandle to the registered channel
whose chan->channel matches the hardware channel number. It allows
sparse channel maps to be consumed by drivers like iio-hwmon.

Tested on Radxa Cubie A5E.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
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
 drivers/iio/adc/sun20i-gpadc-iio.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
index 861c14da75ad..78c9a52f38df 100644
--- a/drivers/iio/adc/sun20i-gpadc-iio.c
+++ b/drivers/iio/adc/sun20i-gpadc-iio.c
@@ -139,8 +139,20 @@ static irqreturn_t sun20i_gpadc_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int
+sun20i_gpadc_fwnode_xlate(struct iio_dev *indio_dev,
+			  const struct fwnode_reference_args *iiospec)
+{
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
base-commit: 1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
change-id: 20260513-fix-sunxi-gpadc-sparse-channels-2b6b2063bd49

Best regards,
--  
Michal Piekos <michal.piekos@mmpsystems.pl>


