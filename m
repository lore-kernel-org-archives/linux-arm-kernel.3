Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46589CEBF97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=; b=q+iY3KWVYGwNwiQcEXqCJ7Iue0
	QixvFwFRrTFJMHkxHeib27ebauS8b6OyqNyKYvRIxBqM81jObdc88ERiUyeKzcLuR+JftDfYqeRMW
	+8DzpAiyi2SDrLdlHSoGJO+aMlck8qbVfrxjmNa1gaMi4iAeM0H5MTHGHfKDnLRtU/R+lNaCQ7jJn
	c0QKf4zzFnrH1wegrl+BzN1GJd5iYs0K7Zpw1o2Hevneen6Huym0p5eWkFe9wvjCcCIS+AJSoUYHs
	j6AT1q+zHvpxnJpl4qQFblZj0U10yjChvxh7NCRveRt+cSM90Ir91cEHnvZjIkNAa7fomMamaFY8p
	uQ+WoGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvBF-0000000Fk2X-0ncn;
	Mon, 17 Nov 2025 09:05:49 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvBB-0000000Fk0A-1cOu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:05:46 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-595825c8eb3so3911254e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370343; x=1763975143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=;
        b=Csy0aeKRXMxXpkmKULKa4i/m4ljeovkLMprx42ZUQoWEhTEEmMBeFAmXmAd5wxnZLy
         lXNkAUx4IA3ME3r5747VHtMgA7Uv9tvIpChd9sWhEobmAXBBjEWKLAnudRrrEn57VO+P
         y4P2eGskM7PGBvxt/ycZ1OFG4zDxQnXYFTsyd1md7eKPQHZz1SwcGTQdX0gs5JXojOOn
         HCTrdtgPvEnyvqigCxjd4dveDxDhCMsR6BZnfzdfBH3DG7z07VSDBhrZEaqE0vvul1NV
         6+1c7oUM2rys27h7c3L1p3c66ppbuFsq4piDzTD9YHg+p8+u+gCgc6wYD8y/ZVrNIcDh
         O1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370343; x=1763975143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=;
        b=nuftSmYhZxkPBWLHJqvDjsPGw7t8O33n2+XGV1hoEzj+XMOpUDMk18HjSOX5W5TV5G
         0zRHYaTVul/FEMqZsEVaoSzwdCNnXCeiff8O3N31KWXmUQPKpVonYE5XpXJSxx40si+U
         hX/k99ZRRLQJi22Ij9jZecjQ1L2D8uQQPDMnpy9ACZcMWsQ6GL6jf4I3JRUth5x+dNP6
         E4OGImIPIOXX04hm90+JgAXX2/ZznRCjqUrY9gZvAb/kPkXMytyxgoElblq3do/VQtJR
         rf6b/EkqZG3INua1s+Q5kM9QovtgHHtW+XMq7oQEVA2DzBaBD/1NUJyTHuOC69SwfDzY
         4W1g==
X-Forwarded-Encrypted: i=1; AJvYcCUpE9upqldREG2fJcquPUCKf0jtOsxkadm41HhxZyJXRMhKa1hfwBDKyMnot1I2St8gMUSLUwUCbuBBZ90hrLei@lists.infradead.org
X-Gm-Message-State: AOJu0YxWrLdBDFpdhu66Mg8D3xyHxcoWn7gNWBNoE9aktKe475Ucmrr0
	ZxDp/EJLmhJ25WmELbhHX8jQIR76amtWY3XYt1HhBqIp2sXc4mHYLGON
X-Gm-Gg: ASbGncuZzMbm/tBn+ZAOC7dXQvOgT47hImfDQnKJZx/isvKb9NS1CQ3VSQZUUGOzXLs
	h4QSTO/wLFRWdtxLipwtX1AUnq7bWY9BIOfCzNj2FNLYetrAIE/ou2qPAJ0tGLBY52c9+D5eqjj
	LLxl7UVBju4Tyn5bIfWNPG1rjm9eYPmaU8hwb7Vtgcuh+6c93wpNAF1DDeeW7ur/ntVixdfzSV7
	x4ZexE9b+czgttsL7PGII5U1WEy3WN4hm5fPO4tRh82FbVKl4j9Tb7d6YmlwAfFEljc74Vv2YMG
	Qw8FzK4e4UB9yb+jSQhdLfeRloViNFf+L1Nnly/reRvaHocbvZRMpPTF6DkRH0xdzOq7LOKagTr
	L8zc3JZsUJjiMfYvdsugVu/BVaVkG9XGJ7+tzoP6zBKJ/6qIibfhGmzJ9Q22VT+5011clQACEkq
	9Y935Xd0xvB5iCvh72oWTOzz/kcDEtJb1EuPPiG55/9qD7Jg==
X-Google-Smtp-Source: AGHT+IH1QlOEMHn/T48dJG9KlH+9zufr1/cuKa9qEA/HpIN2fSwsKbCmNjV+s1Ae9oWDFiNXgn3XjQ==
X-Received: by 2002:a05:6512:3054:b0:595:7fed:aae9 with SMTP id 2adb3069b0e04-595841ee9d7mr3951060e87.12.1763370343041;
        Mon, 17 Nov 2025 01:05:43 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:42 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:05:02 +0100
Subject: [PATCH RESEND v3 5/5] docs: i2c: i2c-topology: add section about
 bus speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-i2c-mux-v3-5-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8159;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Pi8rg8aDh1DzKC60rhi2IjK0Atc4BXPx6hzEn3Z2p8o=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVYDNc2zbHJruLUp5iqBcRmx68oP2FwF21ZE
 olHkhj6ysaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlWAAKCRCIgE5vWV1S
 MnsMD/0dDrtOrZWY7f8n04gRG4qqZeolpcQCyrxdYCd88B8QfjW9T/eFOOEXL0dfOqGs6aTOZT4
 jEda0NvWG7OrdEvfHINxqTlEF8qAhrSrIInMMIphrfF45xdJYYXeaT11R7U4AXjvpuM2glCETAU
 FalnstcWYv2UypkNkJwqaQyB4Vu4PRbD+UiJAKDW+wkWnM26PJ8D0yDLzq58c00RSm2R7ARVWp4
 Nwr0wzUlw2x//y0JzCjF52yI5o6iPiAPMaa7XATtmZz5jR9mJaUQ2hZNtIWXZ2ZCtTjlFVfZEfB
 8HnnNi9qcZQm/usFqpgqgPywZyv6ClTFdiIW7FJJN6AdrpCOCm0kd5XfP9EC2Lkl2SGuAE0xfFo
 ThOizwU/S2lyQAPwSbdGFe2jrFohMUGwYf7lm08+jcc6wss4bRftPo1z5QbQAZoj0XEvIgTuTzo
 eb8UzVvIvJnPKWbo/1fTBF9VRSKMmWXHGsebm7Bm9WlED0Mfr5kVpRkDxKrL0twE33laabWsd/o
 O9ndpIq0JaxThshPaks6j5GixcvwmCJ6k/pfgKGCmqbiqlhrqbu1F5L8LA/lPQrqoZIZrw82irR
 /CkFgCmM3HN2CjGISZxTf5vn+uHSnlzxl42YGECS50F3tfywiZ68gXtsE/NaXcER3ybXx+mVaAV
 GvVa6kF1eJabsew==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010545_572672_58F0967D 
X-CRM114-Status: GOOD (  18.27  )
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
2.51.2


