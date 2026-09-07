Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E34C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FL1mL1XVE71/okiZ+ZMIYLV77/ov3lC/JuTKkmsqmjo=; b=fXAm+lYRCLLWP8
	P6K+a0vbsftOXblvNGU0oXcmsZac7iW3Phkg3gjwK8h02n8XMGa34ZULmXd0BaOVtUde3wSmxNKGp
	aLoyPazBtCMunKrVR7lVIdQVsnq43qVDe/dJXe37JsnMSSuyUi481lXXzvvld9BIv1praWrt3NaW3
	x29NlTg5f/DTzJMxrZ4jtqqGCsgORdzfnTuHowFQ6lZCBGik/355Sji/rLLSCc8gEZvo0tH11o9eB
	yC1AaViC2C968YSuvSm8wmjoIEAw0DTn1CcZiOuxU1zt5JFfzo0lIGUeCdBDypJ8Ribcp9QVuQxrZ
	/nQ/Y6lfJCkKQ/ymMbwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjO-00000006geF-1pUg;
	Mon, 07 Sep 2026 11:41:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjJ-00000006gaX-2lsR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:41:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso30696005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781300; x=1789386100; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FL1mL1XVE71/okiZ+ZMIYLV77/ov3lC/JuTKkmsqmjo=;
        b=TKEmQKZCvcLssM3bRkFjJUteVP9XEXBJTU6z0mKs6NcbUAXNwyGafrFp4VZDjPwpws
         0XQ/pqzoFt14XPnsFnmgk8MSuPxmbgQJuK1GeP/S/4AEK/s1D2E31d/ekwV5UXv87Awt
         7v2Ut7a/i4fiyqo3SuYNC43gdzee+7TCZ4HMduEi+ljmQ3NcWAzitcpoFcYxG5Hz0BVR
         nBmEjiuPH3oJgcmtsxcwBNP2M4dB3pFKCT2qYsgCI/D0dAlOCbW/NH3hMbnWy3ZZ8w94
         WyDQUevCeWyGjHZXQm7SIsud43a8S+5EbgAIqWKCKSwwpd5OYrMMdw+Yk6mlxyBQV6Yt
         Mu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781300; x=1789386100;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FL1mL1XVE71/okiZ+ZMIYLV77/ov3lC/JuTKkmsqmjo=;
        b=EnckFnmOZk7GUwQfhD5GW9j2iJm6E44R1JpMCD5nZupYDcKuYPeRLv29/I8YE4XJOT
         Y4Y8C321eOkdHL5/rqS6AYlRvk01Rj7iL/WxlidVsnQfag85zFN8QigOSPsd+wTS6qph
         0fj/igJtvB1+9dD5nittKfhPaBii7gfFGysYrQHrFikC/3ZmvwZ1TnlAhBpjVbtppn3v
         52ZqC27h+9oaFxi5kzBSSb3BCjTWsIuOGGI/sxNRbvqMabgtxfqhlYIPzdpnPEuc+ytr
         niS+TMzlrmWm0paawD5Uge90wFlXdT1Y/WGUz9sirKnZT+QwblE4K7xVFJWLkmLNKoUC
         3Q3g==
X-Forwarded-Encrypted: i=1; AKwUvBxIfjYL3yKvARJbtGYE+4O3tiypH4yxv+kMvHM/w1pjUpOm+N+S1EQKcZo6doedslNxHoUQn9OxDpXricSksl26@lists.infradead.org
X-Gm-Message-State: AFuF++l6DCTRQWh5boRBF+Ik1cydUL6gvdX7szgAJnDxD+42jwDogO/9
	1w2SfPJ8A0/WPiuiGT+HHKUCp/frnPnVu36i+cmzEpiVoUqtSgKIvyJW
X-Gm-Gg: AYBFou3KvwV7moD5TYS06efVgSn6UsEwIFShHCcLwuURufpjOWHQYQqnZSF8la7nhW2
	7ZTpm6esji9CSKD6mhz0u1RNKaDG8h7sUw2myULe0lKB61e32SJdjQWblkYYAsOEA479xDVUWqZ
	5HLvxZfrzNuexZxWG9WRrUjKX814nRr9Tob9q7aGi6+t1+tb7wqy2LfLBXwVwcTxUbMKfIxTsav
	AYWRLveH5RNKpXW43U2+HOeWZJ3RRK1GxMlB+s/P2NgTmtKrigE9YOrQaYErfxngDHbUttp7mmr
	xuj29USWthfuITjdRKeMTGo/2yw95gYVF5WVfA1lMbCTxAIcYBmX2KlMVhwituC/kH2PCgM/acp
	61/3Lz3Qa7Q5upooL+LzKF5hu0PB2KMbbLoCUFuOUvjW6D+aIyaD7lqLdFr+0y3Gg0a+ihYjzfz
	ZRn/cEdU5MqvC+3zULKF8Zf4zt54PzI+EIwzYw3Xg3SyJDiT83aUQmghbZFWn0q1B82NgOIVeNK
	YD71annY+vDkTGCIhzy07TaxtD5x7ruLpqjgW4Ktm6374YDVEh3okybTxj7abQ=
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr202658655e9.10.1788781296694;
        Mon, 07 Sep 2026 04:41:36 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:36 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/4] arm64: dts: freescale: Add Verdin iMX8M Plus overlays
Date: Mon, 07 Sep 2026 13:41:29 +0200
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOminmoC/x2NQQqEMAwAvyI5G6h1EfUr4iG0cTewTSUFUcS/b
 9njMDBzQ2ETLjA3NxgfUiRrha5tIHxI34wSK4N3fnCT6/Fgi6Io6RzTjpoVAyU2wlzNl66CxhQ
 vDNPwclsMvht7qLXdeJPzf1rW5/kBxWHdJXkAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044141_716814_435D7763 
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

This series adds device tree overlays for the Toradex Verdin iMX8M Plus
SoM. The overlays cover audio configuration, a display adapter, and DSI
displays.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for selected carrier board and accessory
combinations.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (4):
      arm64: dts: freescale: imx8mp-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mp-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 7" DSI

 arch/arm64/boot/dts/freescale/Makefile             |  28 +++++
 .../freescale/imx8mp-verdin-dev-nau8822-btl.dtso   |  14 +++
 .../dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso   | 102 ++++++++++++++++
 .../imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso  | 132 ++++++++++++++++++++
 .../imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso   | 133 +++++++++++++++++++++
 5 files changed, 409 insertions(+)
---
base-commit: 26835cf70bbb6207214af55495ea8bed9ea96775
change-id: 20260903-verdin-imx8mp-non-camera-overlays-ready-c9640fdc2183

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


