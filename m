Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7B7EDF152
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk3clnWFlbrxfg7hPFpqEEazCewYQ0BYconZLXp7/hE=; b=KZD78phibZMmL3bS3GMte5niRj
	mO53kuGareBGI0W8FocgIiq2SEw8y97uXtypmKrV2Cat8+WDNG+JxugFdLi4C8aZ+KJXa0MwGnyG8
	yAt2HwexiaHpq0nIGHkXBHeMEb9Hl+deinqdNd6vsoSEdcg20YZm3lNjhBn+EZaiFNQ21FP+0t+qJ
	b2/Kxq1nKkKqVbH8gmjgOU/oaFdb5SDsNHtfLmu8FBNpxethaKAkVekjgkiZ5zpJfqn+zWELI67co
	66tsXerh2I2du5z5lrorTeJRce6uqW6NI91w9FQqonhwQlKltMBE+nhPg1GEj10IEDiq6UtIbm0lT
	a4LigjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1s-00000003Mvg-4C4H;
	Fri, 13 Feb 2026 11:08:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1n-00000003Mqv-4BkB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:08:05 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59dd54b1073so927313e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 03:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770980882; x=1771585682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk3clnWFlbrxfg7hPFpqEEazCewYQ0BYconZLXp7/hE=;
        b=nIs0qQp21ME3uIqzoewJpw1bEljdklpo4I88SsnqsdVuk86fB77bwVVfQtGVfqWzye
         0zx7NfkUqTOFNxWE5aVoqoWI7/fA0xigyeL/Molki01fzG/FzOQQkHFvDcdnTN5za1Fr
         hYtXzQh6sIcjzpSGzsvgnrukCWBG71GbZMrI4PNgcVCaB9D/wXMNt65dBxPIIXa8NM2U
         qQfl9NZCZVUDmQ7mPdEDB4pjuqe5rU1vJxa07EHLgOCMWJgQgx+UcYfrorNvkCfoaikf
         gx+bOyxIpglqJ91a5jW0xKKFq84N5rU52CLdfCUe4iqY/ZImqyPb99Y+NjZjeD8olfcT
         xSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980882; x=1771585682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xk3clnWFlbrxfg7hPFpqEEazCewYQ0BYconZLXp7/hE=;
        b=Dbn8nmYC4ZXX1aZSaLhNMTiFaHKqvI7deYcEqCaiR0a52Wyd/slibL3PrfdGm+tFjc
         ir4a+yQFj3zqdMYOLicCbKF3gdOuFfVEAFtycnBKvMFNVfey6p7IpmqdckC1yESMskTj
         5tTwQfIW0P950ovQr834WePLf+XOz1fmyaHIGWO13WuUiWQvw7UyT50aT1DsoW/83dvu
         9fnJK9pS5T26hibuqw0m7dKwq6i8NjGnDpZ3kYDuoPw6Q8FqM2JerJpC2GpzeBkD3XTf
         8UWjucjfqZsHI7Zyta6Y40CMH9iTW3VH64bYXQfMzAy7i+RxP2fMQcgGkVR7gKpSSec7
         u0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWNppiz10P5+j5m70U7qBhNuPJFlQhMEp6DhTWklzWy+gqTFwbACh+qgufgNE8u/oruJLVrtHUfBFcz9TBJSaHp@lists.infradead.org
X-Gm-Message-State: AOJu0YzEH/R2DVW0PbmOtN86Sl5CATpG+rA2pdLm6pu7yBsbUC0Uo5uk
	+mEqDBGeFUjD0GwKtLDsA+H1KzuSQ6p1IzG4i5FvErYt6kjI1DWCEiEh
X-Gm-Gg: AZuq6aIk3n2hCWTgaUzTrPzwWaBq8dqPsk43lQXIJ75vHSXBqqAcve6MPa3jZcdZET5
	pl3shwtCbB+dhBPhtGtU652VZWJx5NsNqrGtY0unAbI+v1p6KzD1pb8gSpiMblGuXydMyJctp2I
	i2CesXfk5M+Srd8xsUBR77WW/iw9koHdzhJJeX54ANeKgzl5y/Io92l5zcLYRgHjdhT6nu8FtQ9
	kll5b8C7j8+ag+PijMU/DQehsBzO26E6hei/O3ZLZcS/wGZQpOVJlkcNPM6mSCYJQAO3qeJMaUV
	XfVycnGOmnZn1ZITYqnRDY56sBfnI1qfaA6yCnBMICo+Bd783zDab8pSbWWbEXLRD8Lef2sU6Ue
	c05XfYGYbvKUAIjwq8FysrRI2P1xpbXs0IMM1WUqknOfgK3tXBqLXsXQHBRRw0VsH0noY8oEs17
	VUYksgK8ENHtdTRXevZ+HSFBptzq79qRe5mgisDFKEzqcIfT6BM+w6LT8upYMXFdE2EVGl
X-Received: by 2002:a05:6512:3e0e:b0:59d:fb43:5474 with SMTP id 2adb3069b0e04-59f69c0e3cdmr497918e87.7.1770980881611;
        Fri, 13 Feb 2026 03:08:01 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068924c3sm13635831fa.1.2026.02.13.03.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:08:01 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 13 Feb 2026 12:06:54 +0100
Subject: [PATCH v5 5/5] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-mux-v5-5-fb2cbf9979b3@gmail.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
In-Reply-To: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpjwYULntuXqppCKAp6MHQLjAs03e3JoMx/lAL1
 tbwKPGiJwyJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaY8GFAAKCRCIgE5vWV1S
 MpsND/4kSp3FQNG2wRur+bl+h5XFJUP4SFef4onkUAsftA/Z4zisGI5ysGEOpwFB86rerq5Hc34
 rjeoM6nfEDWOLlRvwraAl1NeeuN7Z1XbwEOWYpp+aF+QUC4y8F0xqAcgsdljehfBOKkpdLh8mpQ
 lVBwoUWN6dFozHJZk+Ry9qY3f47n6A7MDGrgWW57xuxnGz2/617YRfgmcllA2u8Af4Ln32V65JM
 wvBOgUm0lnUJWln2xjIycdxHLRGGCcKv97MzChmtPFjFKoX5sFjfkTuXKT1/Zxb2ejFExtChQH5
 UxVppsMYDiOI8nQ+DxmYejfRcL9ACM2dQDlvx28WxHEZCv7PL33Ve33hXIfR+75eOIXLzFIYwMg
 z5LQLVQTeDlFSGpDGsRJ2yZNhurziRy/0u6LN3x2TKri3U2j6TUXjSLrOhVuS4aAIiwkzmq4uN7
 SdGZwI4hpsKXvnCC+RNi3x8XkVoUP+DWe3wKK6ZUNhrqBEC5jO5fn2lyipL1pGM+IKacKBEd9eA
 N4NhOMgKHwPEDVnT3SLUDIdpYHPyaqL5ZLkBcttD0YNXgHXjymo9hRLwMFuNLDlt91kVr4cgQCP
 M2mGFO+g16ANe5RThYamHGhfFx3M9RMh0bJqcmy00jlZBo5yRKx/8mDzDmvIojkWIo7tr+7aKXr
 Nl2YZh8LYcPQb/Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030804_126487_B71FD525 
X-CRM114-Status: GOOD (  18.07  )
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


