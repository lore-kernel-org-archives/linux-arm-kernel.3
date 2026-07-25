Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA2BC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u1zr8HrJdV/Y3pfey2B5/XTcYM1ZBV0D6sRxUfn6RJ0=; b=4R/k4cNHsYIG5Z
	DKucZErUZ/QnMQZI6/H78PdE1WkywyMK/NkZZgUijo7mUvw1IfNG9HU+RX+cAkECcJV48/L7N5IRT
	uC7rvEG8OWQP3P8URsnBNm9GpL9CsCk7xgHXkoXpO+ICITn9xOi98l1JpjW0LjJTj9wkL8WWk7GfR
	dc6O0k+jFXe3zeiYHiW/QLClLhoe8XMlR/65w0HP6WI5Jv8mXdyJAvrArChDDimfh5G3H+/e8Dp79
	sGduzr+rrMRaqHDSFEuvJWnzGKHak5aYLspVhqj/2gMd183zkP0vffPgEsgjDZOT4+c2fXC9xaQej
	VIgp5rvYP2OyvFoO6kfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnf7f-00000000WOz-2YP0;
	Sat, 25 Jul 2026 16:21:11 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnf7c-00000000WNk-10rL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 16:21:10 +0000
Received: by chaosmail.tech (Postfix) id 6FF811C8684;
	Sat, 25 Jul 2026 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784996464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u1zr8HrJdV/Y3pfey2B5/XTcYM1ZBV0D6sRxUfn6RJ0=;
	b=rRepT9lL2ve9XWMdScLOYZz60oFQXgqWqByzHaGHplnW5vmOV63DpVJi3VmKd3T40xH4WM
	gkMi9CXhgZSN/DZvxmiID70iSDrcuZDxxcIRZ4doR8CGrj0FiLwGZRc3KROcYpmzCTgu91
	XNYVtvBsN5eWPYJb1NyjD0oSBnjic9U=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Sat, 25 Jul 2026 18:20:55 +0200
Message-Id: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDUZlRKuIhZVU8aimhaRiLsrl
 i/5+RdECkwR2uyCQAdHXl1CkWdgZu0mEjwmg0RZYS2V2NiPQhsqBTY4WFUjWdVA6n0gy+f36vr
 fcR8WMts7gPt+AE3TmJdtAAAA
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784996463; l=1521;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=GYWvY5URAkNkQ1kqNOw2smlI2JLCatnep+JhlX9A0gg=;
 b=YMosi9qQh+R/gX1yMPeFJxRyRY7C4hDqEbiw1DvZHWQ+b7nhU64ka/wrJ4M30rMCsdXj/uYry
 sHyhlyAf+j4BQRLV66+ITlol2pb5j4YPqexxKOEfCQDn1ViBJwLyDzr
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_092108_745454_007D849D 
X-CRM114-Status: UNSURE (   7.59  )
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

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 +++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/tipd/Kconfig                             |  14 ++++++
 drivers/usb/typec/tipd/Makefile                            |  12 +++--
 drivers/usb/typec/tipd/{core.c => core.h}                  | 119 +++++++++++++++--------------------------------
 drivers/usb/typec/tipd/i2c.c                               |  86 ++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 297 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 523 insertions(+), 85 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


