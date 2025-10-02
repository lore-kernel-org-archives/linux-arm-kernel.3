Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A37CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=; b=kP0kKDTI/t1FoS9huAw3bkTeIk
	scnZ3SzJ1vVy/A9KOhHa7jRUfGnp+62EzhRPixv8cvot2XilfN7drm7P6mayAxPEtgVXHGwgYSOaW
	d+taGXuW0rVPbxN8YMWIWZjdjZ4Cg6M4uKslG1US4ZgZ//UlyFliGCgcgmlDifsI0HBl0vyqhZkzk
	Wuf7Zv3t2pz+VUjN0QFvuSGMPO5shVs+kXx8yyWMJ4dG1zdn/X3lTGg3UvoDEIxvTVUK0Dvu3uEEQ
	yc9rEzwLassA6ZZyPP2TPXXJDQYVxGC3p5YIoCcTMlH+/bLKrHhMbiRoNIJvYy2N5WR3j3F17CdGB
	/1J3nCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVj-0000000Adv0-03KK;
	Thu, 02 Oct 2025 14:42:23 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KVg-0000000Adr7-1tsc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:42:21 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso1477062e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416138; x=1760020938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=;
        b=b+NcO89mpXktHAIT+iQfckAkucvMQL0JVlsrJfKjX4uee2ZWIAawyHgr4FYqy3gSs2
         QHNY4fPKqQQRRnXGo1ufksFy5RxUk4rEJK/068QaTBNZfY/tyHxrcf4zxBdB2GgTH6ab
         7l2rlELOgUZGPlwcxOjiHzx5l/4qLZ9julmlwbtOmssVLMquZG0hirzmxRlZlZVtzfsX
         Ri/AIYojl28uZ/W9xZZ2jOzFtWvJUL7s3r85HgzknOp7MlpkeU3FFlep3/J52FGU8xog
         pWCU/DePG1yy/NfhY9S/mbSPbAMXD3+1bCe6tiatN5ZgWwdgHv/0bAiC9aQ8OKFl0PWf
         hCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416138; x=1760020938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=;
        b=ocumnNDSCS3YyeryU7+t7aMuRXG3xViwjnCcZgGRScwpRpDQJlMOaCgYSfrYuGzUNO
         oY4WW0cgd0ZekOXryg3xX/lOvT3O0eK3ORML5kDHYrqpCHzluVwOE5qQ1VkrXp22AP4T
         l5co7e+HQvDFE84KgPV69jf5PbmioYJFSluA4Xi4ALyYTPweolGKCVr7JfTOZZR3VYqP
         5zptiaRXQpneWYOMzZdZitoAI7oSLmmD06mUEyMbvS0jyaBc6Aaf+OMhZEA4wYUkl4wv
         uwecEa3GvoGT7lOVe9G2IvILn6ygKwfh4BlgOHjqB3gIdBLywJFD0hwtrTjWOFgHCjYs
         AQFg==
X-Forwarded-Encrypted: i=1; AJvYcCWvAp4RVewYh6QFyNca4Ds/dC/PAWBwUjEtCuhQuxssZcxZBExJheoxJEuZnQxeAJ/+BxBkiwHMLNTc2MuoF+dW@lists.infradead.org
X-Gm-Message-State: AOJu0YwklQMX0kRIkJmY3U74OH6hpjlMnHbDde25SGv0DF60xs7GvjVo
	E31zLnhnoC8F7VNf2u4m6dknpNaqF1fbhAX29L7AfS3jlypK2C1NN7s0
X-Gm-Gg: ASbGncvCnVI+VfqkbuNXbkSsCjeKqDQj55vsC8DCuBdL4EzLvxiIfIk0/wW2mOre/++
	D5EzmmGcZhvBjdTYfdnO/C8bx6fTWPdGgDTDrMA6cabiFx3E3+CZ3mvLCEEM6WXc/dxvu+6EaRl
	Tog9QOL6mF3KPZIM2g+5yvjUuEhhU+H3RA766X4mQE2IWCDiMTxMDxa5MKuslR8GwW68kYjr9Oc
	AuFgSDN//grsWOFWvlPUORi8VxLonfbVdkBPzfDOlkDVlX2Hy1Rl78D2RajysDB2Y/aKcY709CE
	eqig67n/uDGYXXdMvdH2TfAuZDEB1V1UEIqYN6BWkRRZNkN1RIN5kaxlYYtZpnQM/Q5Gw4oMe5S
	4HZJdvWWc030U1JhJfsVedjhlab+iMZHf+KdxNvm7O/jAPHOnjuI/bzku4ArsOQxZVkOwFTi6z1
	KtfRccnEvyO0tPPTaPzn2dSqPLhA==
X-Google-Smtp-Source: AGHT+IGOtzlaSk4pcU9eh33X/Hi+M2goQksZbtKwAH/v2LSHcSlzpXGeAeOPN1PpfWcqe7I4kfeXnw==
X-Received: by 2002:a05:6512:2356:b0:55c:d62b:d0fc with SMTP id 2adb3069b0e04-58af9f0f3cfmr2665238e87.10.1759416138032;
        Thu, 02 Oct 2025 07:42:18 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:17 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:36 +0200
Subject: [PATCH v2 5/5] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-5-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8215;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=RcFIrKoSgnto39HXDCzkc41AKHrLdxTXBU7nIzeA4ck=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o89diRzxaElr4YwuimquAd0U3fRuYUfF6kui
 ED5Vph5J1CJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PPQAKCRCIgE5vWV1S
 MkfmD/92ZWCqZ+QbeUVymKqEGOTxJKzOoYBSjuURXjqmGPk0f0frTtk7kloYMLTIVVzB1zxwJh/
 vBq4l6zRtFShK/uC42KCcnZ7tKup/o9D9IJxO8KBECwFjn08HowEAP8+EsBP0LiL4qrMrcHjZSM
 qNJd+njT7tz+IOxrYeDxJyC4XYNcoagRR09VsoJGdBp0oKHNUr+fsqiUwLriErQrBbXN00xId4l
 9FQ7qiwiAuUSN8r/3EOMRUFKBJr7CJA0q2t6ImDhT5wGMCOkdt9xjrgXHd2EuG8NVayOtIVLJW+
 L1/99h62x3xYWbf806rrwdvzUBJ6XTGlSeAMOhNR08Uu15egDxcyU+f7x3+wDLd24HpTLqy/biK
 JJPwATk8+qUgJtOBve9DUG1ApYnk9vUnxwlcmpmeR5buV9uwaM9R1plIxEnAemVNADW0zIlweKN
 wwjJejhCDwmb+ztMoxZ4XN/R3kyqXXMJOftsFoN52ETBLHZDTtvlj2XzHWs/xmHZPsBqDKk5To+
 ZPEn/G3Yil9tf0QuQhMVXbWVx+jx/j9d+fEnwtsu/T6N17u9SMiPWBjHInSXfjBBalVEXYctDyM
 JX9htBROmH5/E/pgtErT+JcsmdshvrWE9TmP7M6SCA0ZDepW+trMReOwtdf7mcnfdXRkqDRwCj8
 OHStS1HZ5zBHzhg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_074220_561396_BD74EAEA 
X-CRM114-Status: GOOD (  18.72  )
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
index 48fce0f7491bf1bcd4a851f685b010386c9ce0d2..2c4a1364ce82e353f51608e60d08535f80523fea 100644
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
2.50.1


