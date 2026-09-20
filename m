Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE393C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 21:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5GVVx1LqA6B1jJlZmV64iP6HqsdwAzR/vY4RLJ8HlJI=; b=txaC1TKeFjVwIXJ2pDJA3ZmkjF
	CsUeNU2yKozrVtTIQhbKJgnEV8Z5WD9LtbjRnUE7GevPNd0Ujs3na/G+6EIawYGMRC65l5rtbviw3
	bV6gwJGDbFnehN2x4mRimxOsEaRa6fLoOTCcoNJj3GmWIQkU5eKmiyKPMH4AhPPjeFFGl0vL+x4ui
	3hLUjC3v0+nAm0lkO6CDN1R3EtXU9GhXeIUyq/4frk+msSYm+qCKXhit8XIYuomBWmltoJFNo2bt4
	5V14030gSuFbxGEGvKVOhcOlZ9RJtLsG4+pRwdZXX4DBcR2OrfQdMEIa4aLUp7XA+1w54WTdjYJMR
	+66NkVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OrM-00000000R3L-3btI;
	Sun, 20 Sep 2026 21:14:04 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OrJ-00000000R2f-2YnM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 21:14:02 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398beb616f5so1005419a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938840; x=1790543640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5GVVx1LqA6B1jJlZmV64iP6HqsdwAzR/vY4RLJ8HlJI=;
        b=OFnkIbreEGsOrE5mAXwgOCwinC2YhKOIcSYS85lffbGVKjhmJ9VQGwdbDVjGlPQ4T8
         WnXkfseEyU+0ZsUPtORW+0YVhPfre3PXTqCeQ8bsyNmPVoTYlTTRVIz8WAGEjxDUIS6t
         NIzKNHIkRyiRFxzzxE7w/hn00x954kL4JnF8iVbWI2H5Qe0XbXv4EjbarLa4T8b15hYo
         NOXeOZyLottvzpp/hOdHhe9TLcXtsE7YlUnXD7DsvL+bodjRvXKzmddaG5s7zq1zYkLi
         Hos6w2fYK1skRoATiXj7MPBw9aPFRB9PtF2lXhhahgmN4lQ68UIhPWM7ku8aVqgIY4Vd
         U8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938840; x=1790543640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GVVx1LqA6B1jJlZmV64iP6HqsdwAzR/vY4RLJ8HlJI=;
        b=HcmrGuKgHEvuLIbVWo5rNzJ7SnaSeBb3kj7btvBIFqoSNuD2yn51b9nUCImsyweDTf
         BHvfVpo3JF1rH8vmwT5ML4qGhUnUCR1AZ76ZWGf22k3fas6mgE3sNJhI7MIO8/ZNZfyI
         dvNCwrYlGg3EV8aiQVI0H7KeCbOwC7loSnyF3wuaNEhGVoJzUJxs6n0aT8+eUdxi4yMD
         jRNIdfc++JkhRjcR/f/Pz00b4k2/ySp3tqQ7dtO9gjbmS9tviTEPVKfwwdc51bJH5XlA
         aPbPcGei16k2uP8N2/dHWABnlZvvu9xnhl4KzGsKgcWTt5Tzk4LHAYW/jrl2J6+JH6DX
         b0vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt3vMt6dxi65KuB3eLmF45Ym2vTsOb+L9HadlkpwRRXqQyjpYg/h+AdeIdvsjoo2IhO9/VhdzGE8TcN5nu0Q/P@lists.infradead.org
X-Gm-Message-State: AFuF++luAZX6rCmFIZurQHeltJ+QssR1k2jskpQtL5ki77N0CPm9GOK9
	RgeO+zCz3aOdwC8m6cw09qKbuQAj3PQ2SD2j1sfoa0rt5DoyLFi6iOI6
X-Gm-Gg: AYBFou34D6uYMc/XfVH6H7Odr9uACeW9CwbLN4p1ubQ7/W2xqLUy8IrAC1XibpOLT2V
	rOEPaeyUhg+cDfhbQsYQmpiId1EJ4cNdl6Er2gFcuE9gi1Bk7S44XygdK/31TEhnRLqHSOYnfkk
	Zrh2V4BivpmbKvfiu6XLCoWjJsjQF0B+iHtbpG1H/FMY+6DQiqDYIHeX4mQAdlQW0JW6UEtzqdv
	tMftdKIP1FeujkA5Qi5kDK0sMhN/wxRexCPd75lXtG2YiVY/iEhtx53pejlVYBRz7HTPw6stQwK
	fDOT+bB7GUuYZT2Ih9Ia/JmRtM/g0M+oR5ON/RBAPxjwnRKh5waJ9bgcokCQ1wGHKDXuUTlZv5o
	bk4vDY+SaOjXUdhZBYnNT2J9eqATgn2M6mDDM9jOw28hI+nPQEj3kn6b0p3nP8igPCY6WfPXzmA
	5ZfNy/MW0XKz3FsHNOwbtmvL3yl+hPN7NtwVKua2rowKTXk2LyAUyLzEWVKtchhi+YiGjdC5+4S
	IrlI5kO46+6C3PQb+Z71GmYv+/SxUUQtUzqQyXa6tdi7QnzEsrpfYbTohaSe0bKmpf/WUCH0lJn
	2pkeA+j+Lnyr2t4p7x2hGjJv+rQohN7iijxAg9l5OYZnplPGwpG2bwwKhZk=
X-Received: by 2002:a17:90b:3a43:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-39e6c68fec5mr4752048a91.38.1789938839949;
        Sun, 20 Sep 2026 14:13:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10609743a91.4.2026.09.20.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:13:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 0/2] usb: bcma: control VBUS via a regulator
Date: Sun, 20 Sep 2026 14:13:54 -0700
Message-ID: <20260920211356.186967-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_141401_674336_B37F73E7 
X-CRM114-Status: UNSURE (   9.65  )
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

bcma-hcd currently drives the USB power line by grabbing the
undocumented "vcc-gpio" property from the controller node and poking
it through gpiolib. Besides relying on a non-standard binding, this
cannot work on boards such as the NETGEAR R7000 and R8000 where one
chipcommon GPIO powers both the USB2 and USB3 cores: the two
controllers each request that GPIO exclusively, so the second one
fails with -EBUSY and its port stays dead.

Instead, switch the driver to the standard regulator interface and
express the power rails as regulator-fixed nodes bound to the
chipcommon GPIOs. The regulator core reference-counts enable/disable
requests, letting both controllers share one GPIO without conflicts.

Rosen Penev (2):
  usb: bcma: control VBUS via a regulator instead of a GPIO
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 14 +++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 25 ++++++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 25 ++++++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 14 +++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 14 +++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 14 +++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 14 +++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 14 +++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 14 +++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 14 +++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 14 +++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 26 ++++++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 16 ++++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 16 ++++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 26 ++++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 14 +++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 26 ++++++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 26 ++++++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 14 +++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 14 +++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 14 +++++-
 drivers/usb/host/bcma-hcd.c                   | 45 +++++++++++++------
 26 files changed, 422 insertions(+), 47 deletions(-)

-- 
2.55.0


