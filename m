Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7B5CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 23:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAFVp0sa+jSBvMKIktj8nBPRABJR9ywpSmKS0ZE52SQ=; b=cpM6GySunKOzBynyaL7QneVxko
	3FfuLNt0SfAMRurfkOXd+gp4W+KmcjKkRZPgH7ILADwx5tf5mudfMw6w+3vnePO8sxpa1WKEbjleE
	T7KpOoULEd91ZRXs7aNz6mhFbd/6C4AZjkyxfuqRA1g8kTh6fCEV0O+7nXpvaymXLhg277+QtfHgu
	TEt/MWEMSaaDLxU65EWyB0kvxviVH+sXAEBZkOFfDDYm7jR2/Adkz/7ye4etujMw/Na/Ba1WN8lUi
	SIxHlueifXH1+xOWH1BFNsxbKyM7d4C2xO90Ufh5tGAQZCQsWPgJi3ITT5swIZvVfjw+66ApwamEV
	b++pqX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl73-0000000DgQ3-2b5v;
	Sun, 17 May 2026 23:41:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl6x-0000000DgL5-2lAc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 23:41:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d7e23defbso783736f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 16:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061290; x=1779666090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAFVp0sa+jSBvMKIktj8nBPRABJR9ywpSmKS0ZE52SQ=;
        b=FdZnrT230dddeCub4AX6hR0hPKLB6LRNkJQahoGMeofLtby2H2MIN/H1MH/KMs1Six
         gep1yBwj/Pzn+TfFuYo2no7XSoeEYXU/GZYkc/J0tu5mmV1zR2gSLzV4s8dbFjxeWRUR
         vYrtE9Ai/6yZbBFHi7GRaevD3i2GO28xIwApPyt38Tw1GKV20WGZXaaiIQjvTMgI6yoR
         mqjFS2KQRavypoo1Ma4+8RurdN+IkyoKyQflPHA1M/3lIZygPSbHDcMvQGpiRCTn647U
         8ALkmLTWvXw8WaJ/ZgP9dRTWgMdekrk0kjY59A1xyLRreJs1ECKH1Xc7XhRatATigQo0
         QjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061290; x=1779666090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gAFVp0sa+jSBvMKIktj8nBPRABJR9ywpSmKS0ZE52SQ=;
        b=B/rt6xBYvFpXQIqBxpmoKoVR4YXEEPsWqo631Tk7LQ2tEsHEjjz7mJCmIIsubbwBvR
         qPx0aiE96/rsI9zrYYw++uwfx36u94CdxyGLEK9jZg/Evk27pJctgn08NWySOFExvZJE
         zzuDYYKgEa2famty1mDBTmTbIvPQ912zm7ghQzPzm8UcXBqsJIGPUUR67K2qIYJ+PWcC
         s0LsdwLN33Naj9VJEHKmuxCjke0kWKzG9TuCTiYzK1zsxg++ETozWLod5DGAhPy9ynby
         9B9qNrAPeXnz27kkgRuBrmk4otnTn7fFdldv0g9pP65NtrA+4BSXX185a4LobPdXk/Zh
         CgwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NTGu+m9c9LPY+G8obF6t2DHR2e6qWtHO5V1vZ/FjpLRmDtSavFS2O2hFZ7hQGZSzieNs8+QNm6zW8prjD1HRc@lists.infradead.org
X-Gm-Message-State: AOJu0YyyKHIo1L+Ij4+5DtLmVeYIEhaQXJIHr8YrBzz/xymzE4GyzMM5
	egQEfZKqgGuSxG6qCAa5LEtBMRJf4+dcWVakm+2jX9Uuxw6MGkpeIgJE
X-Gm-Gg: Acq92OEvdr8f5rnX6zxckcGMzP9Osa9Lf5lI3QGUPFQ/J3CRY3WWu2xumC04BFs+Bnu
	Znkm803XspFbQQwezBIRYrrtpGHXApqQ1QM/W0ckg1ZqIh2yB7upR3zF42dqVoVNssyYRAThI53
	enmytDBntdzqv2h8oN08zYXYeE98zzWA8tGM9aP6TIKpsnjbdZXRiTbSx0ZRHW/awFhRVIvsraq
	CZq1cplXQvjDqXvq3exryY+tKzTRoNzu+TGa3pQPl3QntZS+aYA7gc6nrcu3dwy7ct+n1nBt459
	2ldhT7u4Uqq7Cyd6zguhTwW3uYxb3Wst1CJ+N4gsqI8s6+zn+YvXZH2jC2zX6at6qCqqwxSbGA2
	9U2w/2T9U2ffcQcxfx1wTJlBwTo+ZmxfhkiW2vJ96uw4Jnc30SNgpsJv0GfbVih7CfOa/e6OfS/
	pwk9SyiZz0P6dKgxIK3S2EX+DVwZkrpzviDSNMOBKF0z6I/956eeqfNTDti0d+3qdgevff1xfgZ
	22lwowfJco=
X-Received: by 2002:a05:6000:2383:b0:43f:dbbf:6d93 with SMTP id ffacd0b85a97d-45e5c5f2032mr18741752f8f.27.1779061289760;
        Sun, 17 May 2026 16:41:29 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:29 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Mon, 18 May 2026 01:41:31 +0200
Message-ID: <20260517234134.2737320-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_164131_700509_52C83D6B 
X-CRM114-Status: GOOD (  10.04  )
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

Enable Allwinner LRADC input driver as module to support buttons on Baijie
HelperBoard A133.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 094bb9cd8764..570e84674029 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -524,6 +524,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
-- 
2.54.0


