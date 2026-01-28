Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA110D35698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk3clnWFlbrxfg7hPFpqEEazCewYQ0BYconZLXp7/hE=; b=oC2zcGS0VPzRVssPIVUPYhprHf
	GAKw8BYJPWjKwPAxvA77coJlslu+eA9BaaTaoEEEH8Z00DzMMfZDZTzP71Csx5NjXniHBbow0mLMA
	hsEdaCx8f0tKIkHemgvnKj9Jfo9wxQJroOEf5PG2b+J84SWOXMdUjQSwaUtVEfUVcHGGNSZ6yvByP
	kM0Qbgp/7eKHGhQOL6qtVJ4kunBMhy2wW1x3ncyGlS0lKnT3o4xZHLM/HYE/aI8/BnKyE+t0JXBt/
	4+cXt6koRuE0Lqh5R9QMg/PsUYWtfUj97dgMfqxiRdjv872QZL2pH3jo3V4xH0J7gbV3aVkaGXry8
	HXQ4xwkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Gn-0000000Fmre-0nyB;
	Wed, 28 Jan 2026 09:55:29 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GY-0000000FmiU-33eb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:55:15 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59dd7bfeb8aso8215893e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769594112; x=1770198912; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk3clnWFlbrxfg7hPFpqEEazCewYQ0BYconZLXp7/hE=;
        b=ebSrn+YgvBfkgHWppW+bCEw6R5K8S1As2mq+ZLxnj1KB/LAdHD1aBOTQAwBV6oR/t9
         VhSP17LS+rmA6FK6TD0eujl605WqZYaSVC8xRTNbvwK1zTRo9qfMJiaglNB8t8CwdNup
         34L7pQ1oa4jJTN2SWmFUcWYbJcUaIjMyBRWmUEVp0I/PznCSGqD6nBM155CQEKyLQ/ZV
         Z6+C3vDPOhu1T3RxWNYdowXNLhCCGGFR46P+pZJHa85nbpmx3lzYdHrGsa4BQY5wfanm
         qj+rALTs+qmHp4ZKrN15PVe+0uby3uM3PUiP1LiGQkLbMtnAdgFAxmYMaE3PHqoiP+EU
         d99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594112; x=1770198912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xk3clnWFlbrxfg7hPFpqEEazCewYQ0BYconZLXp7/hE=;
        b=VS0mRlverYQI1r4XFTVtb+vXW3LVRX2AEFWslN5XlD9SXOPmzCnzB3sqGvRfOStjsU
         +olygjrF2SWMeMqJTYv9LlzPtZOPyA9ruRnfW6zu5JH1oaWA2QyNUE8PVLb1x50SZzm4
         bP+w8eWbv34ioONxf8X6BYiTSDt+tyU6YJrD1kj8ekRzRWKJC2nWIDtPbA8/MSjtHOif
         p9v1nFdBJHIjq4ZaFa7SCKtTUJgrJEjcDYEE30DPXDI+HRrtuMl+2cf/IArReg2rX9Lc
         oz4qTtZgpIsgFukbunOsdzp+wf0064O//LkQhgXEQn8TifeHfQbqGiu2/FzMP4pfxUU4
         KHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj2ewQzpX/oJTlLVJNK0Q2ICFSrertxFjig1w6woc6Ai91/waA6cbIbnTHf+Agea4CyyqdU5yS6upRbbZ17Jbm@lists.infradead.org
X-Gm-Message-State: AOJu0YxP1zZX8wdzLukFdKfOhxoSKPOxOh7bVwHFOmNdZ57e2Y3gY+Hi
	6hq3jxK07Z7X9wk6xpKswq0Wmo3b9O2vc95nORvsXb1a+XznFoovuogM
X-Gm-Gg: AZuq6aL4eI4iaooUPHPc9TRY3NFnkihZ6nrMniZLGGfqstTOZIHUkjbK6ckVHnBK3fo
	lV2LVWIeugsgr3hoJb2rv8swzNTiOTMtcoeEhO2Xbajz2xVxHq91656POwiUTTYXjDFOm3xdQ2D
	irHzE9sM4PFkGCGx3NT0He8UeyOX1LCxEvvNMeB6fETHJPXI0U3BqIF3BWDgAwn23LZ8tseZt9u
	rQsjoG3rmEVmxpkHE1lmFH7PROrdyAw51dfmVK19jmAyBwEaViZRO6wU+1LflksbAAu+xLTaZSa
	bInxzVccIGuuPbKvM5YwtkjvgAhaH3AXWVkQZ680EdErmrupxEuBBEgx87fsRjWIRPBgvfyoPKb
	dzMWhC+c9o/xK9mjswP2oGUQ3mJtyMv+ub4rvX0irmFWOwZiBrsF/63x2yVmUu5ozvrtYgnq8yT
	G6j4UlD/98eVeDgopHw4FaAjl+1PTIczMpowWbKSQEJcX7MXnLOrfDqjKT
X-Received: by 2002:ac2:4e08:0:b0:59d:e351:57e8 with SMTP id 2adb3069b0e04-59e0401d12amr1955642e87.10.1769594112259;
        Wed, 28 Jan 2026 01:55:12 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bfe83sm459483e87.97.2026.01.28.01.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:55:11 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 28 Jan 2026 10:54:31 +0100
Subject: [PATCH v4 5/5] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-i2c-mux-v4-5-dee49ce276c0@gmail.com>
References: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
In-Reply-To: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8159;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=G8r8z7mFndx6RhNUdA+WKfKocioUhRmN3d9RveqxuFs=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpedz3ayCz4hIuoaAf9as6dbL/CguP9iycbTa1a
 HYpkfvi2+SJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaXnc9wAKCRCIgE5vWV1S
 MhLyD/9g6rixHuYEpXz2umKPHT07E4y/jjWHMeiM0NQi12GeE79wmvswD6wNcNyWN4mi7AGKf3i
 cQd3TtbCh/lXw1CY5ezARXKRG9UfTkbHh3npBOdQb7Qag3iyp92/sIZXi5j6RnypZM2nGxc3WxM
 3hIMXf2Q3CFfkAgNOKNS2MbGATdu2ZeFRBqQ+B4LVpI3a8J0SDsVLbKjZ14MnMD/b5upaJe9w/E
 ikU+yDvHi2OAdHjW9dXGGoQEN/7eOX91RJ780aX5f0OUo1THZjHAxFpZYoKkVa1r3hZ2BcuYSn2
 3SNiALo14Rf3pQcmLXZEBjTix8IMdSWBWHy2wHxHjt6PvAD3XI4GlsFNvOsfBaJlioHoevg/KnB
 0sgX08+LiPwxw87nu7Q+UnGDmVDATZ5PV+Md3mHNzNFgVasZ99vO37/bMAR1O9IoXhGD6Gek9Oa
 2OCV/F5j51SBXQpziKzO8F0Ys0u2QfFu6KbstEvpUoLlc+le0ta57RqRUoWxYeY9FH8dPZarScf
 Nc2Rx43D1M2s6/Owp16pVmYBDh6SV5tnushh9gNcGDdT3IT6ghGOI+BmGG+MdbNbbJq4xiRGfye
 t34VVOCnQ2vkN2mTIsLPyQY2O0dOjwbBbLWAIicC4sdo+FU4zXhYoeHqp3ouiVscOl37rd80O8/
 5sGfADmexTHd5wA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015514_857066_50F1F59E 
X-CRM114-Status: GOOD (  18.21  )
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

Describe what needs to be consideraed and taken into account
when using different bus speeds for different mux channels.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 48fce0f7491b..2c4a1364ce82 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -367,6 +367,182 @@ When D1 or D2 are accessed, accesses to D3 and D4 are locked out while
 accesses to D5 may interleave. When D3 or D4 are accessed, accesses to
 all other devices are locked out.
 
+Bus Speed and I2C Multiplexers
+================================
+
+I2C bus multiplexers allows multiple downstream channels to be exposed
+as separate I2C adapters which also could set their own bus speed.
+
+The multiplexer itself cannot change the bus speed as it use the upstream
+clock and data lines to communicate with the downstream devices. The speed
+is therfor changed in the root adapter resulting in that the whole bus is
+affected.
+
+This increases the complexity of the topology and some considerations must
+be taken into.
+
+Bus speed
+----------
+
+Downstream channels of an I2C multiplexer can only operate at the same or
+lower bus speed as the upstream bus. This is because the upstream bus may
+have devices that cannot operate at higher speeds and those will be affected
+by the speed change.
+
+The example below illustrates the problem.
+The root adapter is operating at 100kHz. D2 can only operate with 100kHz,
+but D2 can operate at 400kHz. When D1 is selected, the bus speed of the
+root adapter would have to be is set to 400kHz, a speed that D2 may not support.
+
+This topology is therefor not allowed: ::
+
+                          .----------. 400kHz .--------.
+        .--------. 100kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |
+                    |     '----------'
+                    |  .--------.
+                    '--| dev D2 |
+                       '--------'
+
+
+This topology is allowed: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D2 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'        |  mux M1  |--. 400kHz .--------.
+                          '----------'  '--------| dev D1 |
+                                                 '--------'
+
+Preferred topology
+-------------------
+
+The preferred topology when using different bus speeds is to have the multiplexer
+connected directly to the root adapter without any devices as siblings.
+By this arrangement, the bus speed can be changed without affecting any other devices
+and many of the caveats are avoided.
+
+Other multiplexers in parallell is still okay as those are locked out during transfers.
+
+This is the preferred topology: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D2 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'        |  mux M1  |--. 400kHz .--------.
+                          '----------'  '--------| dev D1 |
+                                                 '--------'
+Locking
+--------
+
+If the multiplexer is mux-locked, transfers to D3 may interleave between the
+select-transfer-deselect to D1 or D2.
+This results in a situation where the bus speed to D3 may be lower than it
+is supposed to be. This is usually not a problem.
+
+This topology is allowed but some transfers to D3 may be at 100kHz: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |--. 400kHz .--------.
+                    |     '----------'  '--------| dev D2 |
+                    |  .--------.                '--------'
+                    '--| dev D3 |
+                       '--------'
+
+Multiple muxes in series
+--------------------------
+
+When multiple muxes are used in series the same rules applies.
+
+Transfers to D3 may interleave between select-transfer-deselect to D1, which
+results that the bus speed to D2 or D3 will be at 100KHz.
+
+Transfers to D2 may interleave between select-transfer-deselect to D1, which
+results in that the bus speed to D1 may be at 400kHz as the transfer to D2
+will set the bus speed to before the transfer to D1 starts.
+
+This is probably a bad topology ::
+
+                     .----------. 400kHz .----------. 100kHz .--------.
+    .--------.400kHz |   mux-   |--------|   mux-   |--------| dev D1 |
+    |  root  |--+----|  locked  | 400kHz |  locked  |        '--------'
+    '--------'  |    |  mux M1  |--.     |  mux M2  |
+                |    '----------'  |     '----------'
+                |  .--------.      |  .--------.
+                '--| dev D3 |      '--| dev D2 |
+                   '--------'         '--------'
+
+Multiple muxes in parallell
+----------------------------
+
+When multiple muxes are used in parallell all access to other muxes are locked out
+so this is not a problem.
+
+If the muxes are mux-locked, access to D3 may still interleave though.
+
+In the example below, D3 may not interleave between select-transfer-deselect for D1
+or D2 as both muxes are parent-locked: ::
+
+
+                   .----------. 100kHz   .--------.
+                   |  parent- |----------| dev D1 |
+                .--|  locked  |          '--------'
+                |  |  mux M1  |
+                |  '----------'
+                |      .----------. 400KHz  .--------.
+    .--------. 400kHz  |  parent- |---------| dev D2 |
+    |  root  |--+------|  locked  |         '--------'
+    '--------'  |      |  mux M2  |
+                |      '----------'
+                |  .--------.
+                '--| dev D3 |
+                   '--------'
+
+Idle state
+-----------
+
+Muxes have an idle state, which is the state the channels is put into when no channel
+is active. The state is typically one of the following:
+
+- All channels are disconnected
+- The last selected channel is left as-is
+- A predefined channel is selected
+
+Muxes that support an idle state where all channels are disconnected are preferred when using
+different bus speeds. Otherwise high bus speeds may "leak" through to devices that
+may not support that higher speed.
+
+Consider the following example: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |--. 400kHz .--------.
+                    |     '----------'  '--------| dev D2 |
+                    |  .--------.                '--------'
+                    '--| dev D3 |
+                       '--------'
+
+If the idle state of M1 is:
+- All channels disconnected: No problem, D1 and D2 are not affected by communication
+  to D3.
+- Last selected channel: Problem if D1 was the last selected channel. High speed
+  communication to D3 will be "leaked" to D1.
+- Predefined channel: Problem, if the predefined channel D1. Set predefined channel
+  to D2 as D2 may handle 400kHz.
+
+Supported controllers
+-----------------------
+
+Not all I2C controllers support setting the bus speed dynamically.
+At the time of writint, the following controllers has support:
+
+============================   =============================================
+i2c-davinci                    Supports dynamic bus speed
+============================   =============================================
 
 Mux type of existing device drivers
 ===================================

-- 
2.52.0


