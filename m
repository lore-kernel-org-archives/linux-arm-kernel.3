Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15293C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nOkF62GGkmnVWUbbVUdf1e4ZunQyMCemxV0335qyJ0=; b=YsPwThkgB4dbwlvLESMDv2dJuR
	kBVQPsaLg2c9vxn8ZHgvCsdEBrmMYvLLIprNHsoOpg7fq9Tj7KSqES7rezicRfa6q5jiEN7ECTFkz
	1vxMZY1juwE499lL+0yogXrqyyoaK3zk3TGQWrKD47+1PQqlhebnEwoOhR7MuqyrggSSv8Vikr0aU
	8Ep2jyC+OggYBbIgv80WbxjdjcLsef3ii2icS/d3Q61M594bzW/5cmKxaE9LPtnruFBYh4WrJqQRQ
	xsKqXtfBKI6c5JsIWfinEeDlzSoAS5Xt6F/mqK3DiPipsSRupUVndmcwxGR/yZQtkojUZEOLN0PT9
	ixqHHvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRD1-0000000H5R6-1aux;
	Wed, 08 Jul 2026 12:16:59 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRCz-0000000H5Md-0rVK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 12:16:58 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5aec139da7eso854310e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513015; x=1784117815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nOkF62GGkmnVWUbbVUdf1e4ZunQyMCemxV0335qyJ0=;
        b=q0KDiSUMbCh0My997v3g3HZacSlBxmqZ7c1ThskYvtKtQL1l2O9Vhtsu8NM+LjuVyA
         V9xsJGAdmFOTyLJAY7K2WrGez1Ym4N6yI8SbcWxklOfPKySDYETQEq3Pf0YZ2pHWP6zH
         n4mNljE9Wmy5QDmZfMtDup1bo9Q6iSmByBQe2uuK7XCXkBVaLtqN90TCEamh1EGaIRQL
         p3+JJrbCx8yIgv3WYAPkmTGhc1T2XgnwYA+Rpb/9KR7scrCbRJtEa4FjWfouZDG9XZ47
         KflZovWPyD5evKlH7H6hxNWYiDHQ2i2RriB5rFs4YBu/4qNnCzSC656Nck7d88Vq3E9i
         l8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513015; x=1784117815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nOkF62GGkmnVWUbbVUdf1e4ZunQyMCemxV0335qyJ0=;
        b=g28z2pVvBRxsssgSUtsMM5pqlYc6IsbwrjYrtK6O0S8M2nxk4pu+VN1xJWME029wcl
         ap1RcocVuLhSN5l2rzo0+N567L5/Hx1N0+uyU7We15ZhGP4nEHOKIAkXD12hmtUt5FTx
         Se2zGlkcZOMJDhiIMutBucu+Oqf8s0QAeQBNp7YhpyzZpd1Rxq33fTB4xjw0y+JkUhNd
         3gijcky/cgX6UfasNJ8FMrQeNruR5BWX3Ooxl5goOQg9l4yaBIR/Jw40zJjrDW8jA9k9
         ldLSVFBk2QUiA+anlOn+7+1QVU/Re182IMr8wb0XNyVwR2LnmdwYAGtzLWhCEHC9DuaI
         KTkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRj/fBFRXDxcdKy5S5dHRYaR89cwTZNn8pe/3EQfM0+1F9F1Fgil6ml4hCQMBo8rm+YTz9VpNciGK8DcViKxx0@lists.infradead.org
X-Gm-Message-State: AOJu0YzHMTwMmbJHzN+HaT4JG4C7834dJQ/Ywug15+jBiR/cQM9Ulfu3
	33fOG7OJBCnwW1JO2sLFPqFrxZWRendzZEpqeRiv6gzNqspjPZ3knj2wR1AeVhd5QKA=
X-Gm-Gg: AfdE7cl/xOLzcZT1cNgqAzV9sYRvmr4Oy+LSmLB+Udg5goVclzulj6XQWoXFpaPQc7T
	AZjD7x+8B4LLaN25FSFg+pkucaW1XmKy48Z+0Dp13+V4YQO0jTaUaX6w0uLhiNXLTz1vRhHIl2i
	ss7un38v2WN5s8B9snVpvjqAXzvnFeS+upDoLm21GwTBRudk1rD8jq/POa2xmUX4B4LJm2AdeBi
	Vaz18Cw8/9H3XohPH83BMPLWgqGn8tfLIkeOocgSJO1xu3mV//+xYgHSBq+kcJnYlP23CiGR1bw
	8/GkAU/So4C5hMYYd/p42Iv/KzFq6GuBHHv3M7CA8HatAnhA6NsHSozfYeAabxE0gUBUxJJeHaj
	ravP/qcewcGfQObVltoU3nmzz8DDVOrWzP8s7+x8f6X3UWDGxQC31KkuhbJ2ktH56sYpDOJamV2
	nmkmhiWVza0oUGyBVe2XAE60HXH3o/sQYksQfpmXT9skvIvvXhAd8FOhwmRQ==
X-Received: by 2002:ac2:5683:0:b0:5b0:1186:fdf with SMTP id 2adb3069b0e04-5b0118611f4mr492063e87.11.1783513014814;
        Wed, 08 Jul 2026 05:16:54 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm4471459e87.41.2026.07.08.05.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:16:54 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 08 Jul 2026 14:16:19 +0200
Subject: [PATCH v10 7/7] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-i2c-mux-v10-7-09dca03c8a15@gmail.com>
References: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
In-Reply-To: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqTj+yr2pwt5lVtroAp8VDBRH+NqX49PDfsesyg
 0Wh/Blhy2yJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCak4/sgAKCRCIgE5vWV1S
 Mg8wD/9ABbtsHUAOFktSFiaBdhhQAAVcESIYxsb+v6Njqy8dAHR+ruwntlOOlqtYh9++TrZB/RV
 NmWUf/GklA80YVa38NVOrIVMnj2G1GMPVRWxtCgiJ4l1JyGlsdc/0o2xhBn0rLbEawQGkNNv9Us
 k3D+creFYhcDe+CDC/cBlzI5oRKM5mEEJd7vc0joRHqvHl/PWSKl+3oXmDS4zieAD+jOmsm9kcT
 7/EpO8UQ+zNkyNesCQg542zfUdbmCZhi01Rz190WtTBo9W8p9uJxxJ5YSpoJvybwXVu71z9O03x
 tG/EGUnk2BfMq91n6leisUR0lvS7SQHiDv9ndVyYgBiwoH0QQ+5KFeIEwJslweUlZHrqS+ddOtR
 DUVjdsM01EVErte9AyYIaon/N1Kr9JezkcVV2Nieu7h/TMvClKRMcmTEx8ubinNiYy8rOulYDFg
 eEKY8pGfNFCJgqCsiskGusai+sW4xJDgFhhcjREbHkCzEITUDDhS9Pogs/g6x2/zlN5wNPkN1ih
 pjqDFW4qdeS2Putl61+amGIqjmqSOZgRJxlZ2LPJ/nZB63Le2U3b4SB0TI/n6CXkptjfiwltd5h
 pJeNF4EYMR8AWZJZ/ehc231EOvBwp2e/eT9K3TXTdS2O5+C0dvdDNSyrUR0hCynv2BmxryxUGjb
 zHcAfC2GKvOucOQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051657_311661_F0131859 
X-CRM114-Status: GOOD (  18.94  )
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


