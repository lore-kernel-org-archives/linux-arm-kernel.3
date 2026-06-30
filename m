Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A47C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2tQoFP/3mK7wnbIpYFRSkYpoksOckdle3t5G8xRcShM=; b=PhF41fPES4EWj2V1udFJtOWQVG
	/2t4vBracZ0NpE12zhGzehzc5D55vUjA2cATpNNFHgvYpxxOkPMamWEfDSLFb93JVu16ZyJs8AA6Y
	IPk/fa/zRwVGXLdCRrnRiNTY4NJVZXhyo0uCavQ2kNziQngX+bHbPyxKJI85Ku5iTvMjlA6a0j1+3
	jMQf0Vl3hYrjLfp7VEQxeZFA01TsPKbH5j4zoHhTImNyrc/vPEQfjTDqycoQbwU6/8atPIpGnwBzA
	7x9q3etSDYvYLyB+kCN+UqhntUx5/GzxCX+Qz8yla2jB6jbdCoeZY9o/hpGqrTcAxIRWqtHrts7ba
	GTtz7srw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ4F-0000000HF9B-1hvu;
	Tue, 30 Jun 2026 14:04:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ45-0000000HF6J-3WPh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:03:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4939a809b24so29949705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782828232; x=1783433032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tQoFP/3mK7wnbIpYFRSkYpoksOckdle3t5G8xRcShM=;
        b=SNSkuQKlBmvlK1pMAuHg2vLDFzytjWL2QHdRikbMMgxvGBqeOARtgBiamiCGAmeupf
         vWcM2q/01g4Bn3pJjXIdy5KKJKPZuzJROOrQ6WxiDZft0SXzpIqBafwEgqPjignlhadt
         ctrRmVRBM7Fbfiw2z9A01JcEnVsDQnUZT0I3j+rgRg2heskGvJVOGpg1RNbHdA4v8s87
         ZXCCIzocsEKbLLUAmOe1gWl3xJrnS7WMR83cqsXKO6CjyagJiiBPNoDmabGSLe1Mgtrb
         F4YRMEYGQNcv0IUIzE/VTrOdORW2WMOcIk+b0/dO2isD0ME0ACrlbedFEwNZSexYZnNY
         1L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828232; x=1783433032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tQoFP/3mK7wnbIpYFRSkYpoksOckdle3t5G8xRcShM=;
        b=aXcIkA+dx0ow6+uDJRdSHL6kuyCHtkIcVoy97z1n5w2+ZRIINnzNHh/XdSPQXPH+fT
         +7yv8H2yPU8/F0/EAtuNAXX1KJO8dMJzxDo5OhBMrC7rvtExbLIYvCZlpjuxjUJe3PXN
         wSDsuhQ7Adsb6/7/7e5e1pWV8JjyOcStXldNaEPHvVxZ4VCoIX1c9s9GDXoKfifRFtZf
         xc5RR1AaP6K38dkF39hzTSMRVHidyk1gc7dS4q3jgj25j6fPeMD4X50idarJSO/OsbRt
         OHX7t3F78yGCJ4yBn7rndegmQLfGFr52bLLKoKrw5myfGN5wh3GFQOBjJtocWb0GEnNf
         Cyug==
X-Forwarded-Encrypted: i=1; AFNElJ8IcnOvmWTIoMIIvigjOPDHPpuv/Z5LhcUmucOfI3hs68gDC9RTJNIbJltj9JXxMxC4y0NiXNcUQr5wLppgyL0w@lists.infradead.org
X-Gm-Message-State: AOJu0YxG75yR1d0Fm7f/+W1IXjc7PZNQj1RVzNa9QgoxXrgLTc+ENGA6
	BO5LjCYg2SWRgGqW+97Wja2qLJIZvCAyd1akRVd1WmWt6UyuWPAjKR9dlmK6T88W3CA=
X-Gm-Gg: AfdE7ck+2MscrRajcdeRCGz4nG6WiMyAfg9vSoYJtFtm8zDUon9g8cB3xhrCPkf0qbp
	W97F8MKKRa4WxBXwvfnn2W7TlETBc/uiqnAZeckN5i6Vhy9u2yOK52nFPZdJ34ZVMtx2eQGZ+LR
	RR3VoJ4hF4NUAcQMbThJdOCN7BsqWIzWITNtGk27Q9kKtP1DcF/QyelE8M2oiUfKNN5tINQVFAG
	Wn05zKB7KRjL82nzbVL1XT6lyVk4n3sYoRBGz4Y65G1C+jl86fmTyOeoGlNAKMKyCfDdgxhZ9yY
	6RKSEtNp4yrdZjzYYCFquwgTyQq5xZVKFeiMvKlfWIG2QePaQtT7cZJfq1n88ZyRtG/+HsYDPrP
	pdM4k66zLhBWqXcFB/hZNNyK6wjc+w7Irax2WCPw+EVYS1y2OevbrgFhTLB8dAmIaHUXiMjLO81
	9R6efXYrnWP7+oFm2JadwqVFxZv75+151SnzZkf/IyFEsEqjosF1JByZOfJoXDTPMEMnbTvU24G
	o2wKCZpVfUNLSM=
X-Received: by 2002:a05:600c:8b34:b0:492:4668:27b5 with SMTP id 5b1f17b1804b1-493bda58201mr11176775e9.6.1782828231880;
        Tue, 30 Jun 2026 07:03:51 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b8cd2a3esm78215815e9.4.2026.06.30.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:03:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Woodrow Douglass <wdouglass@carnegierobotics.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/3] regulator: Rework i2c_device_id initialisation
Date: Tue, 30 Jun 2026 16:01:06 +0200
Message-ID: <cover.1782827697.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3273; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=83a/MkmrHfjorOirVbbU46DfC5PP/+YNhl2WVzEkxQ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ8wjXh28OkIBNlK6ESzk2ZoTzd35sqKX8watZ MSYmkn2SfOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakPMIwAKCRCPgPtYfRL+ ToTTCACDMq56H2QnBMfIjJOf2V1bMX/QO2ByPArT7OXAoncqtKRUaoMDJK1mqI7rZHtX/9TVDkR sJ35SMm8o//R2DLkrZlc7xpH+bZi18AMQUXuwz8q+vApGRZ89XY7T8fCjSuGvhkoIX+W/ji6n2f 2LNs9hBn0ZRmNzZleHoI0k7m/yxzw+s/9xNbg3dDMgcu4Gf+XNWGYjXeVTvxPGMJGqqxC4vgVmS IvTOvkQ4tjL69LLf+KbRcgFUj672h3H/Z0x3mPH7uQmjHnhFsqPifW4VYKvpFEbnRJjXOJN3WHM CZX67q/+j9SASP6N2/yB3rTltWrEg+cdUg5WFyzHBiYV5gyX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_070354_025285_721CFA0F 
X-CRM114-Status: GOOD (  11.91  )
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

changes since v2
(https://lore.kernel.org/lkml/cover.1781888370.git.u.kleine-koenig@baylibre.com):

 - rebase to next/master
   This fixes a merge conflict and also shifts a bit which drivers are
   adapted in the different patches
 - patch #3 is new

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  regulator: Drop unused i2c driver data
  regulator: Use named initializers for arrays of i2c_device_data
  regulator: Improve style of i2c_device_id arrays

 drivers/regulator/88pg86x.c            |  4 ++--
 drivers/regulator/act8865-regulator.c  |  2 +-
 drivers/regulator/ad5398.c             |  4 ++--
 drivers/regulator/adp5055-regulator.c  |  4 ++--
 drivers/regulator/aw37503-regulator.c  |  4 ++--
 drivers/regulator/da9121-regulator.c   | 20 ++++++++++----------
 drivers/regulator/da9210-regulator.c   |  4 ++--
 drivers/regulator/da9211-regulator.c   | 18 +++++++++---------
 drivers/regulator/fan53880.c           |  4 ++--
 drivers/regulator/isl6271a-regulator.c |  2 +-
 drivers/regulator/isl9305.c            |  4 ++--
 drivers/regulator/lp3971.c             |  2 +-
 drivers/regulator/lp3972.c             |  2 +-
 drivers/regulator/lp872x.c             |  4 ++--
 drivers/regulator/lp8755.c             |  4 ++--
 drivers/regulator/ltc3589.c            |  6 +++---
 drivers/regulator/ltc3676.c            |  2 +-
 drivers/regulator/max1586.c            |  2 +-
 drivers/regulator/max20086-regulator.c |  8 ++++----
 drivers/regulator/max20411-regulator.c |  2 +-
 drivers/regulator/max77503-regulator.c |  2 +-
 drivers/regulator/max77675-regulator.c |  2 +-
 drivers/regulator/max77826-regulator.c |  2 +-
 drivers/regulator/max77838-regulator.c |  2 +-
 drivers/regulator/max77857-regulator.c |  8 ++++----
 drivers/regulator/max8649.c            |  2 +-
 drivers/regulator/max8893.c            |  2 +-
 drivers/regulator/max8952.c            |  2 +-
 drivers/regulator/max8973-regulator.c  |  6 +++---
 drivers/regulator/mcp16502.c           |  2 +-
 drivers/regulator/mp5416.c             |  6 +++---
 drivers/regulator/mp8859.c             |  4 ++--
 drivers/regulator/mp886x.c             |  6 +++---
 drivers/regulator/mpq7920.c            |  4 ++--
 drivers/regulator/mt6311-regulator.c   |  4 ++--
 drivers/regulator/pf530x-regulator.c   |  8 ++++----
 drivers/regulator/pf8x00-regulator.c   |  8 ++++----
 drivers/regulator/pv88060-regulator.c  |  4 ++--
 drivers/regulator/pv88080-regulator.c  |  8 ++++----
 drivers/regulator/pv88090-regulator.c  |  4 ++--
 drivers/regulator/sgm3804-regulator.c  |  2 +-
 drivers/regulator/slg51000-regulator.c |  4 ++--
 drivers/regulator/sy8106a-regulator.c  |  2 +-
 drivers/regulator/sy8824x.c            |  8 ++++----
 drivers/regulator/sy8827n.c            |  4 ++--
 drivers/regulator/tps51632-regulator.c |  4 ++--
 drivers/regulator/tps62360-regulator.c | 10 +++++-----
 drivers/regulator/tps6286x-regulator.c | 10 +++++-----
 drivers/regulator/tps6287x-regulator.c | 10 +++++-----
 drivers/regulator/tps65023-regulator.c |  6 +++---
 drivers/regulator/tps65132-regulator.c |  4 ++--
 51 files changed, 126 insertions(+), 126 deletions(-)


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.47.3


