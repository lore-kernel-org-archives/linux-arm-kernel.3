Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F24C44525
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nOkF62GGkmnVWUbbVUdf1e4ZunQyMCemxV0335qyJ0=; b=rPK7B6KRUKLDLu0WzOA2YQPeFC
	7TqmkU9K/tRxuCq0v1Kujnwxge+eDOEmZfAsbcaECmqbYyQoSH+eN9B8SDSyeMwxDRztiIcPBPrs2
	6WvVOFMJ0n2VhuGC430Yerv8J6xZQvPUlLcivFHFkngTXtFXZL0k+F3Sso212t5I/6pWCV95QLAJp
	ElvvkUxsgVy9BsVTfs5dhbBF5f5ybzt13pz7J62DIGwBT2MyyyAw6wgrJHDy59hNrsWCnBWD/KgRK
	g/P7pk+N2ibNZ0RDIf1662OfdDkZpDLDhWgur6XuuqdYieG30c+NMZUjZvELx6gfCVtexUBVtkKzJ
	9Z4/5DKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGs-000000056QS-0U2a;
	Sun, 19 Jul 2026 15:17:38 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGp-000000056Ns-3Rn5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:17:36 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so5773487e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784474254; x=1785079054; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3nOkF62GGkmnVWUbbVUdf1e4ZunQyMCemxV0335qyJ0=;
        b=oE99xFKxd4y5AT3RFddtpQCkfRYJYKpKf42CBuoACzOo2K+jk5U/LdzNHcz08mR36f
         vZRlc/cY4EGnakqdXw7KVhin9yRhjyKJYyeuwFHfzQtdxguQKQZhoPQxoldurk4K186J
         n8cID6RFcCg9RyCQ3T4tFOLHOwGHR++DQ/KfLQUpVQ/k/q7deTNNFOQmEMVlnGCMWSox
         CCyP1pHscQdQLUqC4+g/RdOVInThFS61G69hEYsqZg+M7GJs9ixTaIhNVet9OZX/3EUd
         GupEszOI75qjVEhKg5TWyG8k686ogqvse9c91y7CyUhDoZaVPUEu4Z7UUtidR2zxMGA1
         D92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784474254; x=1785079054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nOkF62GGkmnVWUbbVUdf1e4ZunQyMCemxV0335qyJ0=;
        b=od+h2qNLJQCjiu7RsyhiKi+HRB8XOEs2VcJJacQ+hsrCwMyu1eUdDn7Zmjep7UUTPy
         6N3yPJXP6fIy/NBqYIl3WDOB0AdRdq8lAnc9eDZzAPTzsjO4d4GSLQq69/PllEl+BMsl
         GFL1Kc9ZUaJ0eIIovv2k0sd4yfyz8kJbfRYpUWHMonPDnB+mpTc0RT1muRvads2aRLJ5
         m5hPotvJI/RBjhe3cPm1FQQ8mV2DVYo91hZxNvjndNCKjZaQt0q1OegYaEbuIXe0TiA8
         bbnXdnKqq3i4h1Q4fMVU96cg75RXdmFVEk3g37+2HbR5weaY6VydRdJILz3rtIF5VkkA
         ty9A==
X-Forwarded-Encrypted: i=1; AHgh+RoJvHHzSpXi0u1hjxj583pUAeYNgqVT2yXv6ANjxlDeAvS+BRW27teC2MvUhEO3DXg+9Wg7XQ68bDPLA7QLsgNT@lists.infradead.org
X-Gm-Message-State: AOJu0YzVoOeN6nBQpvnoE3z05SAZfcgHYoAxzrd9J9CaL+uUsu5VPsUb
	TzYUakIU0TWiDrf3yQii3Gh9psXIAFUQ6H23wgXMK/EuTgGK/gBDClMWARRsAmNBw5k=
X-Gm-Gg: AfdE7cnuS/pwhjzyNdJJf7XzBPOBGS7+9pCge5Jldks/HH1tDHNhy0M9NKNxL/Ca3/F
	f7E3+6sZiwr6XGnCm4BGmGYMSgNdB32LKLWlvN+/7GWpN5A9eYp7QVK0lJltHMspqwA7C4usGwP
	8WyX0elkQ0iE2FRuAUnVZKGAArdb3iHTjFG/s8dkx29ta1bO61bVa+kBU6+gvxPeigbYKrXZH/0
	8aMkiCy4cTIJE0pssWuyuW2xTCMUNbSgfYWspBDyjCavzz9Bxy/xjlGhyhmvpSZP2TtQdEunawb
	ehj9j+9HCMcabbPu3mUATlKouD9/gOSiy/19XfHGUVSEnRPr/NH2FmsFg5HbMGMNhbfCfsGSSvv
	5rg5JmpJmt8wAmPIkfNt/EAS0BvzmSLvA5MyFB57oUM/aS7zVH+h5BOFe+qEdzvf/NsqjJsCbOL
	PvHfARjdgxUGHYS+qeZHrbVtAOwyIl0wy460GtyWV5tzcyt2g=
X-Received: by 2002:a05:6512:2c8c:b0:5b0:17c9:a504 with SMTP id 2adb3069b0e04-5b28f9b7c01mr2056967e87.30.1784474253752;
        Sun, 19 Jul 2026 08:17:33 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e26e5fsm1835096e87.80.2026.07.19.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:17:32 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 19 Jul 2026 16:59:50 +0200
Subject: [PATCH v12 7/7] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-i2c-mux-v12-7-a5010d623a57@gmail.com>
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
In-Reply-To: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8176;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=B2YqMrgTja5ulsdupqJSWKQwHmegjD8Hbyvf0CUQZgg=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqXOqRbAOdx8k6mO8EKTe7IxMU4ceiT+Ms2L82E
 3oxUNolewuJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalzqkQAKCRCIgE5vWV1S
 MkchEADG8OL2vD6lnKA5DGjIFgLDPQ75GC9MK5kZUG0dM3y7SaWnxnOqoGfLiqF1DUuPXmhybjM
 pWj/7Zi0NI4IQym5hsKQZQzLcYNN88SxjQ4iCn9rmc/z/bZd1HSTZICb0/eVQJEu5wOeavXa74b
 h0itQXalii90dRPmsYOmZ4pqBXkfw5B0JsbijVhDa/CZfMjZkWVYS7c5ruYC5pb48tCK+vz4oLf
 1ZMfyNGt23LNjBVobXi4veOoVIagw3WT0De0TlObuZlsVNwLtm3P6PtGgch/Z2vAK6XvAsO4gWq
 s5rCzUnqeAZUWJhY91vg68aPZYPo55vBeMW9uTfWHyOMdBKw+Qpgp2FP7wKDe+CMDAC/nyzMoDT
 kXQ8GUHHGpIUNfkLzxzPQLWZf+PY+GvOV+Fp4diJVF7c1C1E+g5J/rlgDsfukOF3f2kiKFvRwlJ
 8wV92RFTD3zwad8bq92cL3YeNez7RF29ZEgbWSN/55cXhvGUOsW0Q2Myc1cNdS41RdqZuhsj1LE
 3GBqCLVNUQqTPukkJMx6+kfL3MXmbGpQ5ehmIbwHcDYV407WbwRMSYpUujbPrY+HheWNCC53axZ
 oZT/5L3VVXY43UbLgjT+1hBpKE3S2iW3qB/51rIVc/urIrpteZ+EvG1iHXkVgKGFLi/pE7Z9SS3
 sZZtDv9tq3/MjtQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_081735_918387_A197A97E 
X-CRM114-Status: GOOD (  18.73  )
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
 Documentation/i2c/i2c-topology.rst | 178 +++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 48fce0f7491b..1ee0de6dbcb4 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -367,6 +367,184 @@ When D1 or D2 are accessed, accesses to D3 and D4 are locked out while
 accesses to D5 may interleave. When D3 or D4 are accessed, accesses to
 all other devices are locked out.
 
+Bus Speed and I2C Multiplexers
+================================
+
+I2C bus multiplexers allow multiple downstream channels to be exposed
+as separate I2C adapters which also could set their own bus speed.
+
+The multiplexer itself cannot change the bus speed as it uses the upstream
+clock and data lines to communicate with the downstream devices. The speed
+is therefore changed in the root adapter resulting in that the whole bus is
+affected.
+
+This increases the complexity of the topology and some considerations must
+be taken into account.
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
+but D1 can operate at 400kHz. When D1 is selected, the bus speed of the
+root adapter would have to be set to 400kHz, a speed that D2 may not support.
+
+This topology is therefore not allowed: ::
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
+Other multiplexers in parallel are still okay as those are locked out during transfers.
+
+This is the preferred topology: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D2 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'        |  mux M1  |--. 400kHz .--------.
+                          '----------'  '--------| dev D1 |
+                                                 '--------'
+
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
+When multiple muxes are used in series the same rules apply.
+
+Transfers to D3 may interleave between select-transfer-deselect to D1, which
+results in that the bus speed to D2 or D3 will be at 100KHz.
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
+Multiple muxes in parallel
+----------------------------
+
+When multiple muxes are used in parallel all access to other muxes are locked out
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
+Muxes have an idle state, which is the state the channels are put into when no channel
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
+
+- All channels disconnected: No problem, D1 and D2 are not affected by communication
+  to D3.
+- Last selected channel: Problem if D1 was the last selected channel. High speed
+  communication to D3 will be "leaked" to D1.
+- Predefined channel: Problem if the predefined channel is D1. Set predefined channel
+  to D2 as D2 may handle 400kHz.
+
+Supported controllers
+-----------------------
+
+Not all I2C controllers support setting the bus speed dynamically.
+At the time of writing, the following controllers have support:
+
+============================   =============================================
+i2c-davinci                    Supports dynamic bus speed
+============================   =============================================
 
 Mux type of existing device drivers
 ===================================

-- 
2.54.0


