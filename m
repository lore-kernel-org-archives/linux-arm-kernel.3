Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9F1CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lfBd0vWYoe+YKzMQaTP2OjTw96uBGDlz/jB7sdP/d5k=; b=t56VklzxXCseBR
	PDi00UibcP31nTzu3z+DfYyVtc/WQ9Dk1JoZX4xB9v7Lif0pA5EgI60OuMx2JFH2cYrdIv0qpViim
	czvMsGGxIBjx4q4tkb9jV51vzRVfIP+8+pUH411GCEAiqbpKU1LpKBdOvFLwPhSX1h+T7t6jH5mCh
	bYyTC8VD9cWTy8odtNVR3ABbPstlnDOyQCxnJ8yGU1Kd9fKJconptMeQw5Ft2WA/49LpmAhkMdzk1
	ZnnQ67QFTVn/R95T94JHkoCxBz0jCV5+vFMyLW9QFsfFqE36nIjLX8ek9XhpPxp0LvyJ2O/Xt7adU
	zn4QBzcBVd7BA9yWR2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKRu-00000009vnY-0dRI;
	Fri, 24 Oct 2025 16:15:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKRq-00000009vmv-3El4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1761322527; x=1792858527;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=e9gZeMGN3pLQbfkAI6g+chfPTIRCv+JSr9r7OpEpjuk=;
  b=008XaVnTtVP4qFuIcjXre+f2RZXDFc1BIGMpyP6neDd3Us/CXfMer3hx
   x7OT2B5MKTNTKibAMOim9Q+hb5+n5oF+SG5srPoh1N2ABY0E/YrxriN4s
   2SFAkmd5+zKDawSb8KNKeN8OaMKMgAY5TXtZ1taJTn1OWMWm27NfTIpEo
   S+/lobon71JPHOwjYD33s4cbY6jGVkcrd7B+Ghk4vRy4oOlqXIMSKN6Kg
   cc7DCWH89tdxuUod316woO6TcuklfiL1AeImPwF3C0nNSv0r/cDVIE3aG
   dMbJg0C5fEcyngezZrVjY1R1EU8l+3JVO6AsxN2hKGNAgidYk54XMgPu/
   w==;
X-CSE-ConnectionGUID: OZLbVyjtRe6JiCTkoaquJg==
X-CSE-MsgGUID: tWkYl6LlQYecV7NCWXBUjA==
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="48227183"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Oct 2025 09:15:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 24 Oct 2025 09:15:04 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 24 Oct 2025 09:15:01 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH 0/2] drm/atmel-hlcdc: fix memory bugs
Date: Fri, 24 Oct 2025 18:14:51 +0200
Message-ID: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPul+2gC/x3LWwqAIBBA0a3EfCeo2YO2EiGSkw3UFAoRhHtP+
 jxw7wsJI2GCsXoh4k2JTi5QdQXL5jigIF8MWupWSW3Evni70oPJHo54JyYOwindGD8o13cDlPW
 K+DflnOacP62Vzw1mAAAA
X-Change-ID: 20251024-lcd_fixes_mainlining-a1234d81a768
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=783;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=e9gZeMGN3pLQbfkAI6g+chfPTIRCv+JSr9r7OpEpjuk=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBo+6YFICrXySxOd9teoHGeB2+HmsYggPPyWFg9a
 3Nkv1Nq3VaJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaPumBQAKCRA+OeYT93tk
 LaL3D/kBHNZN3S0vO14Kj0FTERJ2sgFYLuy2xE2tfj6kKNq54iFnwGmqovofI4usMq7ZVoVuoaU
 /HAwVhYZiV6xUAfoLkhK7dKcNMFsLNk26H8I2h++xCthy2sXyfKKadipCX/00HjfUuuoseDO7Gi
 facNrCrQjES3HjO2c9dtEO+nAjGr1/eMQk+YD4PV4DYvrxKJnsoup6bqQWl1l6iPqZeetdLeutu
 8wG+bi5J7ZaFnLyC228aoLTQcID0oYDaRX2wcWXGN5baSHamPJY/pmr5A9QiB3ZwBRC+CJO4+3D
 vpP8SmIytiFIaMtyHp2+1a/JG3toz4zLIrqNwfH8QRkj8/Bep6UcrqxpH/Bcot+snlJnUOCJZVN
 Dd4GfOrkFXWODaQISEO5lC1VocEQ+gztwcAm5pjrVHPb2dOVGUakhcy/U90G04P12FWqwZFVPmR
 CgOuvEmzSulQxAqveUC6StIcGk4eNJah38C5L7suk4Mde+6KyeTveUVNR5I7hby0mEdbXyWx8ij
 4DuuktM/LUuDIRvYQfM5MOy7JVj0H97GUIEqF2eHGa3sQHtynOEQDXgv1+7tmefa6iDa8oPwEzO
 CFTBoMbTMbfcNFcFTYl/PMC7wXWrh5sfkRmHuBLnL0cxq0BH2JwTTDylY/8MbztCrcPvu8UqGCb
 qZsNnyKmfrt/4Xg==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_091527_004440_206C0B6B 
X-CRM114-Status: UNSURE (   7.65  )
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

These two patches fix a memory leak and a use after free bugs.

The memory leak bug had been reported by several users. There were some
attempts to fix it in the past, but the resolutions proposed caused
other breakages.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
Ludovic Desroches (2):
      drm/atmel-hlcdc: fix memory leak from the atomic_destroy_state callback
      drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit after release

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251024-lcd_fixes_mainlining-a1234d81a768

Best regards,
-- 
Ludovic Desroches <ludovic.desroches@microchip.com>


