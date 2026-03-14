Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB48E105F7B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eVM5njdwmLVkvkbsPkw/voN/xq5dei4oewrLsHcno0=; b=NVOQO6qXrDQO3RFocb1woxjarA
	5T0d7ZmXE01uRe2ZkzoLdPt2Ev7BBE0YMS/TO5TFLcAeA7ciVl1Z5aedy0DE3b1lFrP41GjeV/EUh
	xHVa4hirIHh8rWlMOuqgntYEdiE7SLp+Pva6ErhJIiJ7Q8+BJfSa+5JfgYhu9/nahhF9DdjmXkgRd
	u1JQFnZvcAuBzynoLasX3FDSUGX9mT5uKZ76knUrtbBKYTJpDOE5OCVEJPLgetkoHpR9jJicoOcrc
	PfGfldz0DM/OxcQee+sbfltp1xehjcXLgbnsyqqGIhXo1+kbA8J/IgVRVwVf8PXo9VWOYtcAYnVkc
	d/LhsFhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCo-00000001fsZ-2cd0;
	Sat, 14 Mar 2026 09:22:46 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCe-00000001flc-1L7g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:22:37 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-38a3066b68bso27631321fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 02:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773480154; x=1774084954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eVM5njdwmLVkvkbsPkw/voN/xq5dei4oewrLsHcno0=;
        b=EtM6QYilOctWuhxiL5LrxpoE0Cm0CPy+Z14EfxiF7GvVEMetO+nqXEyRwPcxVlCJLr
         Go+ZxXk0/UdG+6lVqRIPIxsYebfDjLhjQ68zcQjcEwLTWUE0TqDXQlfYECdqp+nGvUe6
         0FkF+uU/tk2cly2lHtOPxaJfRUcGTs8Xm9cUHB2kJwOcQ88WVEJSuIzlpNMXgKxvZ15r
         MptIXBMOeukSEsQWYpbWvJGJCjVQh9LPVtWSYlYFcdhmB6zi201MPGgtQVbUxeDZYcTW
         +J1zjTrHp+QcUBSscT8PdDpH+RFAY1UaH8P606WctBoxhTD2I2VqAy8cjP037Xk/FLGr
         r8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773480154; x=1774084954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4eVM5njdwmLVkvkbsPkw/voN/xq5dei4oewrLsHcno0=;
        b=dVdWHsBqIFp6TTCOI3Q9xkSyLfzjZ7U1wmXa3JK+eMyq66RehTrGbJQSLpbubID34l
         8CtIg6bqIAlWzysZqmQx7qmLVhbmzwpJ3LSzyhkPUISrVYmAoJnfx3dpEQTjmOVrKytC
         ja0yTyfGqP3CJ2hSAYw6+UNYKMoh407lTZQeWIJ10lUrfIKxdojUoU5n50rQV5H8BDqm
         iuw/xLwSqVpTsZjOIfVuUsHdl7ZbNe39hy48qHUwZNW8txZ8prQQOt46wSFAdsrRHmGA
         zIOay5/gdrv1b29DSiob1r7hvhuUw5V81io9aMRsVRwvVtLtnGcGgVgiC8c5HZ8yJ7km
         V9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUK5NHeP50vcuNggaHA9pZlCYGtwZxC8/Blu/zUfx7NzATXSP/0Oz9Kwcnym6M4Qlxa2sUFDnU7+XpvYR9k1Ajl@lists.infradead.org
X-Gm-Message-State: AOJu0YwEem67Ny+TEvQgKxEIEpEqMlsMQJWjmHwYvczhAtlu+QkUfqNE
	M3BWoWuKXevgh2IpEBmlWEvPAU9/4natDF1FpZNO4iyvJCb4r4mKTZaR
X-Gm-Gg: ATEYQzw5C4uRViCmsAJ1cYX+l4mlrcacdqyofPN6tLzD7PdmroXEOGFFgSd0w8UPKxx
	vke/4+P91dADC5hD8GftMYn2Tz5Hc9F9iVHCdDF7kInivXE26NdtZVfYuWpQ2P1avj07VV9pNcC
	SMNb1Rzf3qplROqKzVo8w/GB5CQDHXsfycsKcy4C98KEp1mgcKRtQyavmAwc35WiwYYan/SVaG4
	N/dqF/6/HaRshkYNVotyiH4p36O5l0o8RmFyI8uIltqdclve0xDEi1rXJNkq2Gv7frhniDfHzNi
	lfG6X7h5wEWMVhppV4YnOsBIdkDg+2M5zETvI8AZiZLQ5ywuiMqJhvJEMP+WgSxG27tiI6BeyVU
	2H31m0CX14MckPIkI/WhK/fSVDz0ByQ/FxJwvLt2TR2PqvE0JE8lAUJFWMIBH4Xl3gsn5tNKsyX
	nf7MFQ9Tn+6U2YnBJlMdgjs8vHZewfrnFPW8qSNVZZnARhyTsgG74n+O+KIf4BGIzcBgAp
X-Received: by 2002:a05:651c:f02:b0:389:ef35:fb9e with SMTP id 38308e7fff4ca-38a897a7cc8mr18764551fa.24.1773480153671;
        Sat, 14 Mar 2026 02:22:33 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm18454261fa.22.2026.03.14.02.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:22:33 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 14 Mar 2026 10:22:44 +0100
Subject: [PATCH v8 5/5] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-i2c-mux-v8-5-fb1738a4df0a@gmail.com>
References: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
In-Reply-To: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8169;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=GuWaYKwfMV3ENq2uAbPKaKDYJ6qhLIPVj7+qDo+zpgI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBptSkCCHSLTykCPceE5Eh2DSOK2JRFSqcc28ugL
 D1Q4S3H19+JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCabUpAgAKCRCIgE5vWV1S
 MvRLEADX64l8m4MrCjBOkqP74r/edbqERiO45KRk1Ys+KSZoaN2SvKxB46dBr/dSuUeKKkIeU2E
 UbZAKVHN/c4O9KQqee3KSOIN06U2LIbsuezGj4/mNhX/tLn7YfGen7Lb1ckfU8eAU98ftJfoAmE
 WqyI+JIQCPnjWzl4TC/9Y9lFn3w0/KoklRItTV31ZErmKZ3csGChr31ilNJM6x1g0ujwYVt+jkB
 XaFthkJXDsci7GhfNYHJOUtpAOBRmP1KbTZARcmab0KAb+INqFEDvjIbSY/l04jQ8U58jHfRBA4
 vDe850K0z3e9/2hAe/bZpN02pLTFb1i9BOj+8KvPHm6YefCPttwILp5XU15FwykJfxsi9fk61v6
 takavO43LHlMu/zm4QhGSdhZ3FAdrJSf/2EBF3V+iAXNib77Nfq6MIR5Qr2WLArVdYNS2fnyeB9
 8HPLFDfb6gw6DMbnQbSY41boEjXUcGhMsbcOeTrv2hnUGGSZuKmuVQazZqJWN587FxB/irpe6vc
 yMaIXe8JaFq9Dcish2BkXMgyf1hkwS50yMAQDJPu92x4PkbncY/o5jA0K2TmaE/mFqd5ZDyfbBv
 1FjOSXeFmWNQ1jxTcmKwJHpBBaWVJbN/kZeYyf0TbyoXZ9c9IuB+vNA8VsTYkeEiD8kKwEJ4hwR
 jjMF3TSIXEobSZA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_022236_420864_42D7DFCB 
X-CRM114-Status: GOOD (  18.00  )
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
index 48fce0f7491b..24df553ca8c7 100644
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
+The multiplexer itself cannot change the bus speed as it use the upstream
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
+Other multiplexers in parallel is still okay as those are locked out during transfers.
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
+- Predefined channel: Problem if the predefined channel D1. Set predefined channel
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
2.53.0


