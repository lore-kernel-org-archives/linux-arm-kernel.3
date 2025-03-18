Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B82C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgOWX/caTQEpSy74g7C3irmu+Wx+6MgnIj1smWvtFLQ=; b=YoOBxAZ6RBqlbUFHTfdhdXostE
	exaqd8pzVn5B+XSE3aeCvwHi5WXZKEHc1QdnH5fKeLHu4ChCjx5UHHL08yYF1CJ5cdo/gGd7d+zwB
	8v6iRCQ6EeZbPzYXVBT5+J49Wtc9NnxpxL05Q1P3ZFDiTvJHFAumy1dh+261zLp5mAEt+3sLeyKtz
	VXLw+o78z18QVpjDI80h9WeY3xFU7vxsbdx8kHkn0dB6inZbmF8oH17LizvpYvJu4bSawaXO+qZC6
	SrxvHZZLZkVE/qkycE4f5Wm8dpxZOE3dKSNGf1mf/Hb/GcqrSHwXZhVw7wiu4/Jqpk2cUtccQV0cL
	kUlLpl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tueEg-000000076BS-3kcb;
	Tue, 18 Mar 2025 21:12:30 +0000
Received: from algol.kleine-koenig.org ([162.55.41.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tueBK-000000075sd-2rdp;
	Tue, 18 Mar 2025 21:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
	s=2022; t=1742332140;
	bh=cyacAfqmvzmGifPcVn2et0hLqOF5XeQd/o4G2u+UMsQ=;
	h=From:To:Cc:Subject:Date:From;
	b=APKiW5A9lGSxNcsdXVAfFOBYot3HPfcuoaaiNjWd5MGPO0rke82qbMypVck8PkZY9
	 te8BGIP4aeX5xFLeOxq3Ej+6VbQIvEc9t1+qoV6FyUcSltc6AoWxRowHOn5Da6Hf4g
	 /GmTG9jKqfT+/5QdlyRQh7T+8GyeVroFQP5dyB5YXDZCSyxb6DyTmOB9IWrJoaRBRh
	 RFjOqUTL+xPWVROJs722gICHnb4siyRGbn4TO50ljBfgmkJ4I/KOWJgrUdTYBzLVVU
	 LK9w0ua0u0bQYPjSMQNDWNBNAwIn8t3Q9bs3uQv9L4IGDoN9YbU/Bc+Oeegi0LblgS
	 Vk3VKSyoBivCQ==
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
	id BD9B5FC59B1; Tue, 18 Mar 2025 22:09:00 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Improve gmac phy setup for QNAP-TS433
Date: Tue, 18 Mar 2025 22:08:44 +0100
Message-ID: <cover.1742331667.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; i=uwe@kleine-koenig.org; h=from:subject:message-id; bh=cyacAfqmvzmGifPcVn2et0hLqOF5XeQd/o4G2u+UMsQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn2eDdq5Iz2G8UD63/OAkq+umAAF9HZzcChXowU cLacVz3FLWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ9ng3QAKCRCPgPtYfRL+ TuQqB/9XcEvLaGuEWwkeXwRmPJCJKZvGpIH5H2iA0BwBrmxDBTTS4agp7DhRy/sUpzFLyZOj66D brfnZj7Sj7cLzC5Z1qa3dEpz3evfUAA9opEGEP6OotAwXS/wppIa3m/iZ8pBxoMVRYIRAD7A759 IwnjN6ThSd+5XvogjhBfA/Qv670pxh+iP3rlZ+1frTNW57n/0CnwLCF2HhfkVVCL5kglrT3FZQ/ KpyZLp0hVzYvhT4mpOJ6vgwtZjKP2BLEJtHhgWZumOEsfvmC4IP6LhDWy0vAp48SmK1jpHvi3Js hhTqEUJ5tf7Jpd/18zHPW2aH4SsJjTJKQwZEguYl/m4HuyAu
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_140902_864820_456EDEBA 
X-CRM114-Status: UNSURE (   9.09  )
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

Hello,

as suggested by Heiko I split the patch to improve the phy setup of the
gmac ethernet into two patches. The initial patch can be found at
https://lore.kernel.org/linux-arm-kernel/20250318184550.47642-2-uwe@kleine-koenig.org/ .

Heiko also suggested to add Fixes tags. I'm unsure these are justified
because while these patches are an improvement the old devicetree is
working fine. I suggest Heiko to add the tags if he feels strongly
enough about these.

Best regards
Uwe

Uwe Kleine-König (2):
  arm64: dts: rockchip: Correct gmac phy address
  arm64: dts: rockchip: Add gmac phy reset GPIO

 .../arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.47.1


