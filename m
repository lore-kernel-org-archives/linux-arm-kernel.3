Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D42C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YNzmqgx2JrhC19R2F03I2usSj37mqXg2pKwRXbSer70=; b=MFDTQ3MmIzhkYVJoIzdFyWDwZO
	xfq/XZzNDEr+FLjzzgSaLPn2h36+NvVyblaO55q7TtrOrwOSBUATuzXDnwLKR6pwbfBTJAeHYpw61
	JYFOd4RF3GwBwnVKqpTfw2oxukkLSbUwdZseGGHAG5V6VYd/DvyUGUXI57GsCPaqS06/Qs/0CkUXl
	bSujNMuKTv60Wh2caHXgmlMvq3HkxG87E9JLinrP+RcbI+NxsQZrzS90BV4GeJsjE5+DgB2elEYRn
	Xdxgh7gfANm/2GNC6XBu3XBcBC5X3WrPwQimG5RPPhwGf0Ho3C363CbyEMNMkws0PzEi3m1KJXPox
	wC8VxXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7Hs-0000000FKzN-06py;
	Sun, 23 Aug 2026 12:26:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7Hq-0000000FKyz-3PMo;
	Sun, 23 Aug 2026 12:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YNzmqgx2JrhC19R2F03I2usSj37mqXg2pKwRXbSer70=; b=SJY9QqMRpzfc1qgI37V9kmroJc
	3dCyYAe4JwIIRXvyMan8grZO6OW+wS1Wb3Q94AH6uHvIaWG+ZpNFEOAjDATrlYWjwHOrtSoN67XLq
	MPXfcqJNWsA6Z9m8Xz8DogFOhKhbL3VGKVh9WNOw5ZJiEsdk1ZYMXli6G0aPUQRj3EvtRKBKxO48l
	dlol+MWTytKVIQDCF3N7GfkXK+aVeSbj13gQ/Z9aRSUrU4bCoIhtb9SpoMLxnsGn7hJsNzNKdhBkV
	jnSxW6KiZ0Z94uCTUIStSdY884JY7v71FIzsPdbi3VTcTZ58FnZz4Gs55/DKb625BtPJV14X+lKVv
	v22/vtow==;
Received: from mail.zlab.su ([109.73.193.145])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7Hm-00000002tCV-22Ie;
	Sun, 23 Aug 2026 12:26:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C87C4BFA3E;
	Sun, 23 Aug 2026 15:20:48 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1787487683; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=YNzmqgx2JrhC19R2F03I2usSj37mqXg2pKwRXbSer70=;
	b=DAlm8cdYB1Z9nEhom9POOic5Kscz/H9yGWX8k5rCpjvkcfbQn/VOqPvQV8S7R5FEGJStcj
	LwhaOgVM/cyaQRNTXZALH1C2qVrg4o0dU9vB9xjnpnBk211ybFKT5ttb1VDylm/MQze5+Y
	YTWIaxUFrowr2xgd8ocfxBh6bcIoK00WBSfaRyIKglorxEtdQk/r36DZQq5TtMULL5Q+B0
	iyKCRGQkHEEc1zbRiJukyZWjL9r8kHBxGjZ6k984VqeFkwZVU7S+yyLoedXUymYdG81GDB
	iwcGZnd01VMphRCYCTaCPeqBZ7aQfOxJ0IITSlBBmWRS/FpdkIBl8ZlILUYJKw==
From: Vladislav Leonov <vlad@zlab.su>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Vladislav Leonov <vlad@zlab.su>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Simon Glass <sjg@chromium.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Fix RV1106 SAR-ADC support
Date: Sun, 23 Aug 2026 15:20:31 +0300
Message-ID: <20260823122039.20831-1-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_132650_639048_3E3A3EE4 
X-CRM114-Status: GOOD (  10.52  )
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

This series fixes the support for the RV1106 SAR-ADC in the
rockchip_saradc driver and its device tree bindings.

Changes in v2:
- Combined the driver patch and the dt-binding fix into a series, as
  requested by Jonathan.
- Introduced a new patch (2/3) to group single-entries into an enum list,
  as suggested by Krzysztof.
- Added missing Suggested-by tag to the patch 3/3
- rockchip,rv1106-saradc compatible moved from the
  single-entry to enum list in the patch 3/3

Vladislav Leonov (3):
  iio: adc: rockchip_saradc: Add support for RV1106
  dt-bindings: iio: adc: rockchip-saradc: Group single-entries into an
    enum list
  dt-bindings: iio: adc: rockchip-saradc: Fix RV1106 compatible

 .../bindings/iio/adc/rockchip-saradc.yaml      | 18 +++++++++---------
 drivers/iio/adc/rockchip_saradc.c              | 16 ++++++++++++++++
 2 files changed, 25 insertions(+), 9 deletions(-)

-- 
2.47.3


