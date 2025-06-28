Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C2EC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 22:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Kv/5FIXJr4w7f7JBuDHHoZ7UQF55jJFpe21AqRti80=; b=Ao9OEQ7IrKZS4mUdC9CopVVCtI
	mxIdZggr/zK2aIQuQ/yEO3X3+JcTYmobViFE3pt958ct1THPVVebk5kVkuX44b9q2BlYCm/opeC4d
	haCgq2gDfHwYlY8csJN7JWLl5oF1M1rqgXgZffcOrn69JLcBZTtpt7uSHlxOCDJP8eIesVTVdnds5
	4RWrlglhcnuCmMUe2QeST+Ru/4FR3Wb9+w4st7BBbnHry5de8U+RMAu3pugEks9tx6hcInf+FdV/H
	fYlRsgTqOFqgztdk55f4dA8dmUtDmMOm+U1SDvETKqwgDHWZRNnra9YZKXfgWFhoTk1g3B71wnfNs
	nK6sRaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVeER-0000000HMTT-43cD;
	Sat, 28 Jun 2025 22:41:11 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVeC8-0000000HMGE-3tDN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 22:38:50 +0000
Received: (wp-smtpd smtp.wp.pl 29690 invoked from network); 29 Jun 2025 00:38:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1751150319; bh=1Kv/5FIXJr4w7f7JBuDHHoZ7UQF55jJFpe21AqRti80=;
          h=From:To:Subject;
          b=K/FNRWU7zM9HVqBDxaqZKuZqrcf8NBx4gZQKCR1NaMbM3e8LVAYyZcT8SbFdmVOAF
           3MfJFhwI2Q6hQRIf43qP2SiZfhebNSe1BVjg8rW8v9NfsBmnnOK8MtoevrRM4Iff3E
           WJNIPjumyEPJ26UbmwVhk9tjQBUw+OW6vbE3lXxwzWynH9wuygI7DelNq7lmTraXVI
           HMJ4B0rwju5WHn41jls9oaPfv78qeVbfXokqCs85ufqLZkwcTZ7lxLQbE/2CT5lSa9
           9OZvSEkdqvI3YMiFDMYn2CN7g9xkTCgOH4Xqw+nR0U6Jb7CYNOeb+sqtwarsWD1yky
           3C9s35tSRffeg==
Received: from 83.24.145.121.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.145.121])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 29 Jun 2025 00:38:39 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	olek2@wp.pl,
	zhiyong.tao@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] Add thermal sensors support for MT7981
Date: Sun, 29 Jun 2025 00:38:34 +0200
Message-Id: <20250628223837.848244-1-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: b810258631e11cb24906138186427c35
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [4TMU]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_153849_427527_9F4F3602 
X-CRM114-Status: UNSURE (   8.56  )
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

This patch adds support for the temperature sensor in the MT7981 SoC.
This sensor is exactly the same as the one in the MT7986.

Aleksander Jan Bajkowski (3):
  arm64: dts: mediatek: add thermal sensor support on mt7981
  thermal/drivers/mediatek: Add support for MT7981 SoC
  dt-bindings: iio: adc: Add support for MT7981

 .../iio/adc/mediatek,mt2701-auxadc.yaml       |  1 +
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 29 ++++++++++++++++++-
 drivers/thermal/mediatek/auxadc_thermal.c     |  4 +++
 3 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.39.5


