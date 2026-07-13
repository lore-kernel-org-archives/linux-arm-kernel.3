Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FCDC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nOkF62GGkmnVWUbbVUdf1e4ZunQyMCemxV0335qyJ0=; b=qRX5Dam4zJLKbCcWkv9EId5Ns2
	XmX1fqDCfDqsRIK1F9LCNwvJVTpvNytYkRD0qnCAZO3TZvIg+mgfy8EnSOxREaqj8vGTjFpmNaM4k
	u3G0+6RltDEueS7aJYarfWcwlWmE8p5NVOJFFlG8tlnwGLM7KHkdshazMeJ6CN5BK7jj38hq142jD
	Gvzw0UZqeCvldQlIRUOWVMXTPPeZkHGMvWMj/p2kKMlrD6AbPxmpz2j6ARxOofngvYUw18Vm1G4/H
	v3sIbWMv1evTrqbt4Md0pNpSIyNCpRGu/d8NafA/B0FX3lxMSSMGCmaC+DO2Z5tcOFCkdt5Je4Jq/
	zBrHAnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAyC-00000008NLu-1Cup;
	Mon, 13 Jul 2026 07:20:52 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAy8-00000008NIG-09fp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:20:49 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so2898564e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 00:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783927246; x=1784532046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3nOkF62GGkmnVWUbbVUdf1e4ZunQyMCemxV0335qyJ0=;
        b=LH4JRf1w7CjOmQ7yTcUmYx2O65V0irQSNU31nrkhHrqwYNlR+5OieTL7YESxe0b2Yu
         dw3+YaPF7Dbz4HW1muVSUFcyEjnyiRWOyIJoHHgekn0laRZXDNbcPI/0dQO/8aHiRt4q
         sZR/0HzWTE58mpPw1mNduKA7iuRSYmKXl/plzmS6ZKLjAndlruJkcYV5mTS5hWMpJ7a4
         HpFGpPPheVACDIwb36nIwK2FJCexRSSPhYUW78QUmO75suFgXKggWShke4CSur8DZWE2
         JSNpIua1T/IFXXvckUfbPVN/93LdkLHvxg/JI2zk9pmXK/sYroOFS/2DztzgUkzymeZ1
         sVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927246; x=1784532046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nOkF62GGkmnVWUbbVUdf1e4ZunQyMCemxV0335qyJ0=;
        b=UgWu7sBP6RF2eeJ3j+cc3PSPu4PlGoA+Qqh4S7LJMncsqhUnp40LqCUG6AfxSw2ITi
         FikRn0V131NfW8ONVmreVXnTwuETyZYK4ct2konX1b9j6ImVQz8TXBOatMR+6tbl7EBt
         n+MqZVNBnNbX4pniOwzjhWgL9D8PBbpkR+Dlj3t92WFABMU2lC55O4+5I8Dno8ukFTIf
         156DWZyKyEDC8bMEIbP9+nMrxytcCdNcWccpg5QTDp/rX+NnRBVqdNpYkXbLHGMhChZX
         xnAaKJdZRSUMjwFdmoxJkW5tRXC339jl5ZT7OHNsmLidChVo8Q2VHNgWZDuGuQ+eJniu
         /yMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRK3wQBhqjrQxLy+XyVDbDbM4G3q6H+ijjty184+ZhgIUsGEzuj/X81Nc7TJOwMpSvHfQ0+shFTlUIErAL7IMt@lists.infradead.org
X-Gm-Message-State: AOJu0YxZIK5jvQ8K4vT6NSoE1caRUGvVHnpYMqDtIOVviOapcF+lwKNa
	3sIJQk/cIWg6iRW1KizDbo+QVlqthcjV69IvbH2IPB4+ZkfGJhEEsCUn
X-Gm-Gg: AfdE7cn0+61+sRYV7FQ7otVo17zhw+1zus172E/tixQzYCGYsuOQ1rtQz6pG2gU7Fc2
	ppjtBJRX/TYR+kVAuV7An7WGX6uF25wdI8W5OnnvyU2f+Y2gjT8f3pXe7F2m+rfP1ZDsOZCnJKN
	TyYqCAJaso1nXLVxr4TxaacXPRiJmDwtQv187kmpFvASDQ3tKtFC0Tj/XLu2O9TH65bw6rqPhZM
	kBOh360MauhiSry18pCvSI12RqBf+Y7N8JEMOBeY1+ggJPhjFinpUGgpzQXDAFvdEci/HzMym46
	x3A0WT4WkFKSwVWsX9/VH8XaYxbb/QbcMd4qqUC9wtGIBVP+mPKHPCe0I/BlFLfPYVCkOYk+VcD
	0WqQAbGJujgRbz/5eR9FIrYNgfdBhqCQoFApyWnAu/MlnBJf6E5WDFE6KDKE9VspS1rUfxNXUfV
	RoDUNuaBM/iMw0IK9NOp7+3u11D+OW5bykrX6dQs6wXGOUEM9L8HHurCo/zA==
X-Received: by 2002:a05:6512:1448:10b0:5ae:c34c:aecb with SMTP id 2adb3069b0e04-5b0236c8074mr1227281e87.41.1783927246050;
        Mon, 13 Jul 2026 00:20:46 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca55723sm2625636e87.35.2026.07.13.00.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:20:45 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 13 Jul 2026 09:20:03 +0200
Subject: [PATCH v11 7/7] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-i2c-mux-v11-7-72bb8af8ee8c@gmail.com>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
In-Reply-To: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqVJHNuKyI0yNLKsQJG4GN5P1WhzEMYHleBlk62
 DTxJOazLuCJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalSRzQAKCRCIgE5vWV1S
 MrdWEADPLGXRkVU0zPINh6949Chkjripdi5y3umm5HOULOIHGi9eMA9pceYq+IigsxfwU5Df2XB
 HYQJKvnC+vzTxikIsDb+RFo+3rf+pqu+4kMr7HHFyMFQKNJYl0ThYKzFlLWlxlsptKphWzW6Rp5
 449ayJi00lXvdfzWd2VrjoMHk7s6eU4BMHmLwQMdEogZV8JaOT6ErelaJEBiCvvw2Sk49In9krp
 RFb/cnlAtRPO6zQ+emjgP80FUGfidG7RHk1aQnOJb55ZWLt03DpAiUtloywdLt0zLPoG010Drb9
 yCzjYQ+cHoqFP6wlzk05ygNI/w4Cqq5C0THvTj63HN9p7Mg+44iNx6DOfr8FQ79gifWEyFhlxEY
 huWjuIoAKZSxsdAXpoUMkQYiG+58w9sUKGXYjs030pHWZs0szCA/75vpXDl+IPrRasvh6XrpJju
 PWjCdpYhOfzJecVct8yn4QBlwrhVRsP/HcFvqjK8nZeCpSBdUd08A7TQT5fS7UnPNDJr48FmNJ9
 5JIb/Vt5jSko2iU0nTOQ3SSgGoZSJWoVfBFDKmQnrkvn617aOd11XbLBjacdTRZnjRRLIZvjs4x
 EgQjBdNn6o4h99xnEhdGhRxMIgRG/i3boiGDaZIqsPJXHjJvirwunqu1fnWEDTOFh7JRTHg0FRl
 7N6h4tdt15p9adQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_002048_142676_284844FB 
X-CRM114-Status: GOOD (  18.67  )
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


