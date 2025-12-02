Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A15BCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=; b=4LCOBCPTpLQBUmbtRkvTwiAHxi
	/2Z0PzHU3ll/gDR5bwCEVhCGRsl8E5/OlbMKifNrxLflYh2IWhhgYPDtXLy/7FG0SqzHhpyuf6slG
	VO6zYHnv71z2AzR3UmbXqTlY7fr9t9tPqBQeB/4tjznSB98uLEV6RzK+Aao1BWNZmJE27W5iRMPyF
	0EybhOZqQwR8QIzb5diWYmJZbpQnFwGLya6zmONC9m7XxoVRD8GIWOUE6mqaSlU4B3OdOmKWrhc16
	3hnTHKXVvBnHxpKHvux3e5vMBPP552tMIb6cKwG+VM6nKTwuJx47D/gSJJTrM+kWTQvkaRAhw54nW
	7ghnSD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTk-000000051zZ-2NuQ;
	Tue, 02 Dec 2025 08:11:22 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTi-000000051w6-0CV4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:11:19 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-596ba07504dso4116054e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663076; x=1765267876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=;
        b=ketlzJi6vRC5DAMAl8kN8h+b3Ld7yuPuC+v5vXRAte+/wtI+1NQ5hKF3ct4lFq2U3W
         UT6xKMREjjTdh6GxB1Yd9H+4ic7Gk9idvDN43mp2SEYQyLZVFazhX7XZyp+NoC3PBQdg
         LE8W9qHEcnOUiEYatwHxWkFO8qj+Hk7vmLChz16dq9SJ8VtjkJgagL1/U++ZpwJ/kQQA
         hFaa+p4m4i5tAOGF3l4HnBDYJcVu9ouhVsET//fBC0BAQS7nXdXTMdvaN/jjrZZwaWJU
         IEXQpdlAWkannfVSIQZlJZtrSAgxDCXKl/cdWHKGWUoyERjatgG+RHyXwtHYhk/xY0Zo
         2Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663076; x=1765267876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=;
        b=OWy/zIG1LZU3GlMCjgu5fJZ8ymY/AmvkNMn5+uzlA5YIoPUcVHRzKkykVJ0f60Ekf+
         z8dZCqqlRRd2/g71lpf4kpOEKrfybAQgwsR8FI4Cp35zbcnFUq9kqyFQXpU3Qm08tPEK
         Gw5l0PB0sj0Bc1lR2QLP8HCK0QLsmA7HCH7IiprZS7NnboVGJOFiHrbGErCmJYieHyk5
         3/jgoK1B0mO8qVlcceNekA+oWelDWOUsjl+PiD/u+tIYzn6Qnma0alV+SbXZ6kdZ2aVX
         4o0eDRWWk4p7Dj9df8ndCvRuOWxmgTV+ylRybkwtgrjXrE/M8a0IZD24rshp3cQ8j6wh
         nVaA==
X-Forwarded-Encrypted: i=1; AJvYcCWBYfnPzcvRWCfnyNSEwQ9kXuFwFSas9KZkxOuEBUscJ3ZqxTA1Q+C/kLzdJbgkBliWwmhW4i88kz77x+dT02b+@lists.infradead.org
X-Gm-Message-State: AOJu0YxerNB/Sw3Cs0zdnQVN4EyKO2iDFqCnmbmUiybCdBtfL/bYj4zE
	XqUd0MV7QVBNG/OaosFzDq+R7zzzR1o6wmmMe3h3zp6NthUiPfmwWd5f
X-Gm-Gg: ASbGncs0vLO+wLulQUMMqbDz21AqGZosvVpaJG+DX9JCsbqmvTyYCr/94Ua05b9GnPZ
	Sff50mT+kZu3FS5qOHCZ9xbvtaCN/v9t0g/t7K0Z60dX5C2dTjLuXgjBSvkMHrQg2sntti54MIZ
	RKaX6ihChClMrWFxkkBM17w4L97GWwiE5Otve0/It6LHz1bJed0jb5w06KbX93Hx+qR6G/rJoIA
	al64v5PTHqPUt74OEgfuUrHtSonpmhNlD1K7gguga8IuufQrz6pROE5QVu48ub1P+Z3iw4sAdio
	ySUCbnDS40z3Rw/Uu+yuoWp1/jlhzwDP62pLTSltCrs+BVPJx7o1zyqWMaK0/HvVYNkjjOxGB34
	2IVmswyCo6/gzAdkwT1cDo74GUzZ5g08wSzDb5GYR2D4g3nmnZZqJn9vtb62/siOTmdA/8jZxxR
	LqanCjyZsZSXWTgsPye4MjiTPBP3Zl80Q5fN5WoKfs8sRymfCApqxk1AA7
X-Google-Smtp-Source: AGHT+IEb+VBCVNyagDT5gPRiB5WmDm7HGOACR9Uni4jwKE/gsWWylWuJbEZZd03WMkUc4VFrHJiujA==
X-Received: by 2002:a05:6512:b05:b0:595:7fa2:acf with SMTP id 2adb3069b0e04-596a3ec5f2dmr14180182e87.31.1764663075934;
        Tue, 02 Dec 2025 00:11:15 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:15 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:52 +0100
Subject: [PATCH RESEND v3 5/5] docs: i2c: i2c-topology: add section about
 bus speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-5-877dcf478a9f@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8VLTl5xCyf2EQf7wT9s/dzhWz/rFWA8dubB
 OV3UgpqHRqJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fFQAKCRCIgE5vWV1S
 MkUVEAChVEaAjhda0fCwByquOerUJWkhKRl4FGW3qXonGb3Ma7D4RdRzBLV93voH998w5p/MqTs
 lYhAPv2qInDSlEBmMVsR96vh1dv5gTW7yi8R+ti2X5za1pfp5nTVgYixDAsqsBa3oNyjAGCTkcz
 qstgqqCFe+/7Ya6pMq9QkyhufY5oi5yU6Ag69RNlhc+NHRq5m3E/Ay+wiTqrxxQGRBImQOS562P
 MuHX/W/OmtmVUA1U5sfr4bKBHgo5UnNsYBIUFLXOV0lrGsqIRWHE4kWxfP1l1AfBXVjUxHTWYwr
 n9+nZg74gQ0Xvr6Dz5VTNGKfsEJYO+/4EOx55Bl8fYeIDVzyjHTjONSZkdh/Zw5RQLupBzIudov
 KFqdUq7VUK53B4AbufrtYN5sF8om0HqSuqMFoBrNTDjBrUKOoFyRLU2hfrS5C9rWb0Ibdm0Ufah
 1ym7vrKv325JS3g28QuNQTWWfbjSgKi7YCfM0pd8c0xYGdfnsUgN1gXBWahGz6QSS+8dLyHF5dQ
 mSyuDYziGbAxw8SDCDwgoWsBH+by9XfM//CHpvGNgw6ps7HVlRcRGVmhlI5shgyUXC/9QCu3kXT
 rY6lFqOtgBwZibw0nPHJvvxj1cyof4If/1e34OetFiY3h3Nj/x85DsEis4QI5v6UyK5tXMKPcN7
 EYvlva3XGyvKwmQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_001118_154027_EADC38AC 
X-CRM114-Status: GOOD (  18.23  )
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


