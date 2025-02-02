Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAF4C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 19:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74S6QaM0lCmQ470kb1LNMTZQl5oOdCXgmqMgGywN+hY=; b=gvbw9Iw9QQJukik6G5uClI46SO
	QdPbLSDg7uILOWAj6Gz3gM1tixkJZHuXN8TxCaLYwFi6K3tB3yItsK/8kevq7Gb4+ys0k31RhgIiD
	z8379QbNO6SAGBqD7cBWYOEIwZRJVDSBGEkENmP/CXBtjcjXGuYIBHD6IdqQQqHXO/2wFfYNuw0gr
	r9+5Z+g06F3dRy/syV2K4YaGMSLbcN7XkIizuqDuuS3VjIGqCTvdN6qJTAjoeXQy3rm6bOKQnvsfK
	55KfzXaysD2mDOIXYCZoyga2eaLfRcim//JBQWzBDEeG5l1m29KYyUT/hspgrTp8W+SvpzhbHCp8y
	6Bd07ZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tefI3-0000000E4z1-10fR;
	Sun, 02 Feb 2025 19:05:55 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tefGi-0000000E4oz-3eWW;
	Sun, 02 Feb 2025 19:04:34 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4DA1525CCA;
	Sun,  2 Feb 2025 20:04:31 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Db-aZXRw_ZiT; Sun,  2 Feb 2025 20:04:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738523067; bh=F4FuSZEEnarvkc31jb8uMNPiHsq/gfamu55FjiS1n68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TOl1V4XsmZI+wikIirjbtvdnrQmN6PQN7tL9Wr7eHHIudgwrU6ywDOwSKNtFcEgYd
	 7FY94g24U0/SzKoTsx2nnGKnytBvFybeQTMccKf8G+xf1zOKbXWD9ZrhFCqJveloFT
	 0i5tH9fc1wQjuNoeWpmtk0o3DEl/Q6sycoav6wDlWU9AuatHQ7QrKTBxZOMApBUcEM
	 CL1Z9iWLgUd1lLfC12UqSRkV8bkqpGtHsJ9rWjMiUyos7B3P4QDllhkWBZYFg6DTCn
	 XJPfF7ZZQtjwqlSv+FoZJxaZO+7hzbXgn/VwI/U5YCFAazuL1Ldreya/Xe4v3qeJ4C
	 HT3W0q7LY4xIA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Vivek Gautam <gautam.vivek@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 02/34] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
Date: Mon,  3 Feb 2025 00:33:53 +0530
Message-ID: <20250202190353.14572-1-kauschluss@disroot.org>
In-Reply-To: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_110433_050029_C269A082 
X-CRM114-Status: UNSURE (   9.61  )
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

Add the compatible string "samsung,exynos7870-chipid" to the documentation,
with a fallback to "samsung,exynos4210-chipid".

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 385aac7161a0..9105ad48563a 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - samsung,exynos5433-chipid
               - samsung,exynos7-chipid
+              - samsung,exynos7870-chipid
           - const: samsung,exynos4210-chipid
       - items:
           - enum:
-- 
2.48.1


