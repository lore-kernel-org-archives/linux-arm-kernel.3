Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C60DCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Qc4JRX4CtnEK9xKvde6W63LFABE82wXLRsYMp9oSo0=; b=SInANYvPPN7z8dYH0DErWqOfl7
	h4f0QedBaZ15dIYT+fOd2Q2tnewpT/7ZXLgDt88Mi1aNu+G2P3173TadaweTeAl7bA+70MDMYUasr
	SEZjI5azomWVhMtBZIAc6/WchezW9tzNqym1q0XU32guMp6x+ALkbVOKbgB9XqGeIzT+5pJV3BLUw
	L5g7zQBsMzAmZT5G5ADMuCz1BYs3v6BBU01KSXU2BiprMS5aYArqz6ZV3n9y3I9uOREV1ERx/q5N3
	XWgZ1eX5jk85z57Pwzr4GhMjBHlNHmWERtmmCKAR/cCNXqq8gXy/PfVga7QtN1L3oa+hw5hPxU6DJ
	u+pE+xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zw4-00000008x0W-3oFb;
	Mon, 22 Sep 2025 06:22:04 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zvu-00000008wsh-1DYL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:21:55 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-368348d30e0so10834841fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 23:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522112; x=1759126912; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Qc4JRX4CtnEK9xKvde6W63LFABE82wXLRsYMp9oSo0=;
        b=ZXXzt5iqQFzKPYxnHBKuWXtkHEWvnRELDSEupAD2DGwH+Lc7bw1k2LXbyxanxBvRXd
         oS6o1/lqhXvLfKRAKbYU/qYC2bWSW9zyjeG8rvmFvDvOaxHA79E0RkolkuGfLVPoSPhA
         L4MUNUu0UTiJzrlLpg3Rkzxoj/x/myZrDLQEQiJoqwuQ7HrQCVEtCTB7bykEvqvBIvnB
         aph4eVrnhQwdSqDfeoZ1LQAgXdXA+4ZhPQINHsA2Tq2Z5gUXgCj4Cm0zHMk/c+hhE2P7
         B1Ew9rwmn6wNt5CeuxQGOYBMIoPNMSNEl3+I88y96vuJse0aGtSsjcnKY4FwV4/wX2YD
         6oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522112; x=1759126912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Qc4JRX4CtnEK9xKvde6W63LFABE82wXLRsYMp9oSo0=;
        b=JlFt+VnDBGGjdRAV/DknMXDBwZaQ+UWJ1YA5XmcPwlo8IZpkYwm31itbYy/XAGRPlt
         ZQ9fkEvs4boCrdYsPC0IbMlYVgjPIpKgFQzvSwdj4eJ4y+dNT+H9CkGn9tU1Qh/WT3rx
         mcbKkgabO3SR6rKJM3X446Oniipo67JUi/n4fHOmQIrhdKb/4EnuEdyv+0q3e+anSJ1m
         PEuZ4KLqVo0niA2j5QLsN8iSKk90ujXRSRuOZ0W0B5RpZKYEgYsVIogzYBDqfsuB4Cmr
         CkFvYuCcnFeWvPca9hntIIiv1eAE/wP709vv+EDtw39WXr98/3Vy+p+4aXpaiDm4qMDR
         f4QA==
X-Forwarded-Encrypted: i=1; AJvYcCV5+0U3DhnAU2LQ5wX2OzEz5keATkK5hH9HyN11TRFQEyGYqJ6JnLCpxbYmtyJCWZzYTlwzFPgZB/pqW0THfHIG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/n5uaeRQ/IJkq2OxfJyKuASpAPwbmi/YHkmH9/QAr0KATvNug
	ZmCIqS7DFTWyhYV8Ld9i31sXC5BdXvMVZQf9AhNz/JVnex19wdbGj6Sf
X-Gm-Gg: ASbGncsxvrc9ugqWsJ/DO+It0GrUBYxHWmHDnx0QcsMhGFuqBQVF6WMz402N2dU8yMP
	Oh9dwo3FTGYyL9Ad3W0Ad1JTnZSBUs88YiGOnoXvG8stn0IpjuGBXUChgBBxgXGOAKP3eQ5tYp5
	v8LAnFGlqxCkPuo33y1huER/pNNgX2PK9b69jKCZImZidEs5Qfi56wisFri6rQv5qi9qu2KByXq
	ZH02q2c3r20QFjgKPnVRJ0weCfO8OXRlK8Vd3D3CHrR/lVPxf2xelVjcCtwGoh14+xXJ0EKRe9y
	NjrDvMDFM9Q1zhX07ASRK7w/8bzEKpwTy5odaLCuvG1n3ZgSFkCSxfvYI2SyOaBFndB/gz1+zzr
	WZ1LrMpC8HiG7Q+kEQiKAUUZdK0BsPV7YE6vX/Vt/qD0bUA/775iMdjX0e2XS3vuNwp0=
X-Google-Smtp-Source: AGHT+IE3BRCwhlaSY/yzdOewH/qgttb6VJWE4iIrGrjD9WPQORlK7oUt2XV9C7AMcbiiewXRLggrcg==
X-Received: by 2002:a2e:be24:0:b0:36b:2a0a:b906 with SMTP id 38308e7fff4ca-36b2a1a1125mr8259561fa.12.1758522112136;
        Sun, 21 Sep 2025 23:21:52 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:50 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:21:02 +0200
Subject: [PATCH RFC 7/7] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-7-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8207;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=S7HyOptvlFZG+2Q7UACyCuq7yJ1BzDh+UGhw42y2UVE=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OrsQeH/4jt8AADCJJyWsja9PeShuzxIPhK2N
 ReEuabziq6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq7AAKCRCIgE5vWV1S
 MrL8EAC71SR0gv0PMX2fkCz6yQlh2q10PmcUOvMym57YsKUaU6uYOnPodRtxThthpqvd0SLlPe5
 9JuEl0zRpP1S+J2Hx3Tc3KAEz/aki4zF+S4kEUlWn6cAsq73U5qHxhcbIGe2/d6wRR/0F6i9KWP
 x6a54MHoJeMWa9a+1xP2kPqqcTWyZMhfe7LYeci5eLqjplD99203lcCzbZYm2gtVXwyfikEHpin
 9RJrrJr8xv/a6LA/1soMj1u3mXbEnPP7hrDCQy3b3PjO2oX17LNulfi+Wh9AY62tITR9R9rOFQU
 P3hMEUnFPRJWU2UgQZ0c1P6Q1SqwsSRxncNf9edn+1gi9bnMMKTqUn5t6avCQyJhR9y7/W1oPq1
 jA4aewAG/TITkhKn0xBpfdA3MBiaPWR17McEEYGt1oZa7yKYWpmmVhbJWi+rRm4+Lfm605hPd2Q
 6CvIF3ejobCKXMagRW8SUO+hXaipbHKbjwi1E8iFFESRDH7Cx0ewM4N2YEi51w6EaWAd6LQZFLM
 87dLaMjehPMdEN9hLzAo78NRJiliy8AiQ1ze/bzehww5cozuRYgOpl9Xg885z5KKDX514HI+Os+
 cB40NlNalpBbn/hGVBX08Et23lJEUccmCpXvNbrYEhdGLghYEouK/fWtj64pxNmT6iukF1EX9iN
 1AlG9a3DvERIcIg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232154_396157_DE48D66D 
X-CRM114-Status: GOOD (  18.96  )
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
index 48fce0f7491bf1bcd4a851f685b010386c9ce0d2..362859b5de224272941576a9c82a04843e56f0d0 100644
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
+root adapter would have to be is set to 400kHz, a speed that D2 cannot support.
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
+can handle. This is usually not a problem.
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


