Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D64DCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=; b=hUNlJeyNh+D1TIR8rb6BEYyDLQ
	6i5a/RilW2b1YLaq3BJRBp5B44AEi6fPX5d1lx5md4mJOZDPfXJvEk3VQcwprv2DvUFq7ZMeW3OyO
	96ABVdCHRaLjVOhvZQ0GgNPIcouTiounisyMxpTUCQmen2X+yBET44JFOJMxQbKVQJ8Zzi3vlx8D5
	3P2BELBvWu1PikjPrfICMFYKi7/WRb9MMJoTPV0u9QNpDGmUgKESX/vP+DK1W+hzvfIaFvmorLOZR
	J/oFYpecRUTULPndxb6dOC6RkS/D8uiwwDSxv3sj7I8DEsC4e3Q6UGOVUhn5jZcL+LFOVCu1wZtoE
	yF9W2jyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9i-0000000CB9M-2XTZ;
	Mon, 20 Oct 2025 07:18:10 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAk9e-0000000CB66-1bAw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:18:07 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-36527ac0750so42281661fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944684; x=1761549484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=;
        b=jEEI35etii2R9eEWGUXYygAjzuPZ/2pIlV4MMYxBDlHqcijqqnukUM9j9WyXJjOQbB
         Qkvta2Ld4woGXEYoUq5p1vLaoNi4mmyczfFnSx1wstmjjTw1NzT8OWCaDRf+fHrfcKoX
         CniTTnwVNIsi2OkaNSjE+HYazPH4rO6ZLoRqxWQe1llstOENPHiC7tnQwW9BMstiepcA
         L3gHecIJDhrYfWwQzUSwXloY1XFfcdwsvJCN2yhJnB3cZI/E44EnxJMOTGoft0+aeM+J
         yC6U99c3fsAbR4J5xUYl0qxyTpVGEDw9yEmdbCxd55YQhePIzD0J+r/q5rPHarU/hZMJ
         8CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944684; x=1761549484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=;
        b=TEoilcxKp+dsMaaGDztT3skQpPXZSOz7tYM++ILAmgnoCny13x9oR30Fx9l5vPhkQg
         U6Vsbz2kAMGdlZXkDZPJEZAALJzCJQ4A6emIScgeGebuzfFh+KmMu7CTj/W211nPAGXX
         EdmhHq1Gvvrb+6rRN2MzbjtOBVrnFqAfAKl+D+WfWgtThIY7PohB2onQWhLN0FjdIHst
         Opp07WX38FNRtUBqiZ2FGyU4szBzjKie3hernAg8RUTDrhFDb9uQrihi7rlry0cx74BI
         JgyhaxafADWUCour+/MEYRc6vzJH1XY2SwNp/ptSv6wvaV5q6d0cdDacZPcmDpi4sqw8
         27eA==
X-Forwarded-Encrypted: i=1; AJvYcCXtJrGha2aTGPqxK1aKt0EcV3C8s+QLtk+lb1UoKQjBxS2EIsRhJN5N2WAxJlHpWJ3mf9HQpupeX0NMbq9YDYyE@lists.infradead.org
X-Gm-Message-State: AOJu0YwUwxfTHfBsoKyTmsMGSjk3eush0CAI2h6s3IIXv6VrwXzbev8L
	CZSwnxfZod/zkpU6OQWs1dUr37Zvnb2cbtGUk6/NnKtteQCQD3zUuEku
X-Gm-Gg: ASbGncvzzqLkOP5L9CPQ3f3JKpY0HEdhh1ceJMaI5ywLP6SaW/SDDf3sXAyd2An8U9i
	mqbri+MQrHtlEtySKW0Byr7BEda5dCklyvRWvQqoYHK7pBwB0GPG/3wNwqxzBlbrn62ul21Z8kf
	0kkrJRLc99ZVgFHAruLYO7DSxSq0Vn37d3MeNoRbfsByCAm8isd3Ht2+yf+4DO3tsSmDNHsT13e
	etW7QqzvZPuJOdtx58e/q1eW8BM3/HsaeMW9PMh740G0I3uBHiYFpTlT1pgdnrTETttN+jGtDex
	eRz6pUk0L9f8jPv8+bWIexm2MuUnKoXfLk/35jT5fxmBh+Gz0MbCsE59m0rAK8J8LV/7971JOHG
	XTV6RbBiophaagwzUdhIIMwqDrh0cLSI+iAdU89SsQ3h8nYqd2w+DJQcjwJZXhvB909LZlMnojJ
	5auORHcWddvj9ccqdzu/AKANN6gSBZbe0p6fK8pV31JqY0mFhIOOeyExA=
X-Google-Smtp-Source: AGHT+IHh2wqGu0ExNrwddXEATOjNKtBcULAJBbJEFjC5sgHg1pbE/2OBk6y9xSUU1xLzPcNt/U/tew==
X-Received: by 2002:a05:651c:1595:b0:372:17eb:1191 with SMTP id 38308e7fff4ca-3779793eaedmr35769721fa.18.1760944683996;
        Mon, 20 Oct 2025 00:18:03 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:18:03 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 20 Oct 2025 09:17:28 +0200
Subject: [PATCH v3 5/5] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-i2c-mux-v3-5-908ac5cf9223@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eIeQlAhgS2qIv+uQnFVrYg/iCLMq0RlKE/4e
 wSYKwI9FQ2JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiHgAKCRCIgE5vWV1S
 MldtEADRexPNmR5XRZqMic/rZNCi1v0rUBibNGFESL5UgamBrAak845xal3CxyKG3m3SI5rVXvI
 DS//zyQyKLg+R8KWvq6LG+z4Vp/tTlhaNmlgDd0hlepqQzWdREmNbyFI+p0ojE8mu55ZO1zzBr2
 6/2bt3n17WgXeijZ1cVb7cetWzCo9Ffx3sKinanq2TDwong0mdUHBWjBCS2xZIJl5d1Q3nbYnPb
 CYCpPI2KRIRPyWpkbOjY+pBUMvnZ0BPgge7LX2TCaz40T+JAcEcDnQP+MW5QmMpW10hd6SX9Tc3
 B5j3hpY+TQU09HrtkLNctxszOMW/sEhIst9Oo8WFaA0vMTVvHhyVIkOvvvpmB68y4TPtNzy74PP
 lElqXlf0pinALTB5BNoaUEKiTn9BfwAUPgLGQn+eySwdGy/EYrXNkffQLUOFi+jljALZvHKrUeR
 CCG3rp94cCFRNLONejMXKqXRPHpg5uM1lwHYOeY2Jj1ukfB+IhiT2VL+Mj9RWI1JmWg/kyJ6w1G
 Ygvrvr0Nj/KyMKZ5YeruFfpdjraUviQLJ3t1aVAnhiiJVFnq3uDgrb1A5pizhP0l0S4mHwuT3aN
 nsO12bVYq7N9qFtKObkYoz0jk62YMGiQGKi5JPu3Cz9bFWfzmWCeHEsuHZmPdRyIWjGS++LuMTR
 BQIJ+K7E9T7mj+g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_001806_846979_0EB7104E 
X-CRM114-Status: GOOD (  18.42  )
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


