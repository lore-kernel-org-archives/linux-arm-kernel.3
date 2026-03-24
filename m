Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44A0F54ABC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eVM5njdwmLVkvkbsPkw/voN/xq5dei4oewrLsHcno0=; b=NDtwrS+aKPc9sgr84/+MDrchja
	vPb1k8nf8wjhOnfhva/CAeYYxnza1L3i9+e2zp7gVTo1cazjIH65Nlb4xnzQCGXaE7NyRZbboON8A
	Iys9Z1Hi07mCBC4OIyeshHKbWhv8I7vVNaT4HQM/x5v03ZgUBciYY8gsf5RYFQ1HuzhBA2hdV/UxS
	oU8BvCQ+3AUARR3T+Qy8IAE4X5ZM4EUeBjOJiAe8IzSkrrivO6yu6yMpeKyZR+iCkOXF9ojxif4hz
	uZGcFgM7tbWa5uYujUFmEBDGc+aUfY5mESVt8+FD0G68quILoTMajQylvIxDwPu5gWUyRav65WT3M
	SqecJLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Dh-00000001aPo-3YLj;
	Tue, 24 Mar 2026 13:54:57 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Dc-00000001aLh-30fg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:54:53 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a27dddecb0so7409795e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360490; x=1774965290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eVM5njdwmLVkvkbsPkw/voN/xq5dei4oewrLsHcno0=;
        b=Y8ZT/y5HRJgvacJ990f2jDRkMvjFkc2uN2Z0eCtoqsNuPbC5WIsTiXEoi8TIPqAxeq
         Wlgtq+qtKPyvjuWozefy53zjVYjNs9yO0ejVDujwCOtlDHwGL5VbVsgymUL544oP+9nw
         DaZhUIRvjXBN8RavUI5tzL8DjKCEODr2fI+w0jKYTLvU1cu6LP/t98gtaR2QcSCYPUlh
         cogAp/pJwcynfG8chFmrE9aNn+nSCgl4B6+nCF2laa3CbufvVE3FJ8DuqLZyx/1yPYDX
         m/3NxpYaVQYdPwv2b78aXbRokXuMXdECWiTtONvAaR292+XQB6MQadIEthkPgxDmztdl
         o7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360491; x=1774965291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4eVM5njdwmLVkvkbsPkw/voN/xq5dei4oewrLsHcno0=;
        b=FduT3sa7DHK0SRmjYgaWYyFZyIQzyOTzu+k+yCEWrdGMuk+oDvfxMSszx2y7y5l7vn
         5BTgNBymGHoAn1hj4PInt0MnBFtw1EKx1UUmAsCXYcSc1bGryiCyQ2qz/R3n0TFQ2/xr
         YVo3IgV3E1yLFYYCWEYyD1HRIYevJfrR1yvmpT5b6wgShhdFSo66+dBQIqaTo6Q2sFSj
         jygWFt4X2qe8l72EXWyqNcFxAX38eMPoUXYjQtSS6NhuTBG0TVav3cPP/sWpkT8sPNgL
         daFTi7gGHKqeDaL+pTY5h5DkWIvV3QMUFoS64Xi4/6/YieqzJd2k6q3ijG0oDLxngNed
         lpMA==
X-Forwarded-Encrypted: i=1; AJvYcCVIc+UojP6OXx+mB5EufWFK1enV4vottVGtBF3/dMH9yMka3CZFWojePmvqkkdEtdxVsbhD0k7tYX8Y81+fqFto@lists.infradead.org
X-Gm-Message-State: AOJu0YxbGEiouC0RPKMPWOOqg5g0Mi9yzFrdUP5KBukFtoC5SYh630El
	VCtRqX82xLLFFLAaQp4AqvY8/sWkaIcw8V4AcgvSWVLqmuQ4hP1lgoEV
X-Gm-Gg: ATEYQzwqtPfnMMKWmTo5KpbwGQRHOICm+UwC3/FyreN6y4oHF1m0lIyEXIRsh7PtTBY
	gGq5qfpeSlj/KEYsLnUPSdmhJw9wswLuJW9w2vS1tmGqfw/oeryzFwMMrHyJ/P74wh5gRVBGpKK
	P/OYI89poVTW3EXsf8JBD0UXeBVgxpAJ3VgJgJD9hW4KP3fDSixxoPKKaoy5l7FarDkFeqjYEKx
	2Aj4XGjS0RGjePZOY/mTjhLplPBD0MAS8tKfgZzcW7OsUFwuUOBdAE1hBsRzxHMDuJBJ5Djt4hC
	ikYIgvC+L85Ko7eIkPS2CcgWFUZxTIpuM45wRiXo5OMH0h7yInDxXtbPTpr0Ta5xTsmv6uu1A8t
	frz607h4mmDpGBaw7ujoXiextvSkq9yg+P5GurG8bdhwtURjTYvSORYbhEDA7A6pZvHK5fPtLg8
	IQA8mRaVAS3US5/1gC4aCicVuQf2vJ8YJXB4xv67mQcxRBRD/WREuvPB2Isop95wTeJWLk
X-Received: by 2002:a05:6512:2244:b0:5a1:58d3:a78e with SMTP id 2adb3069b0e04-5a285afe997mr5521719e87.16.1774360490303;
        Tue, 24 Mar 2026 06:54:50 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207454sm3162823e87.48.2026.03.24.06.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:54:49 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 24 Mar 2026 14:54:19 +0100
Subject: [PATCH v9 5/5] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-i2c-mux-v9-5-5292b0608243@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
In-Reply-To: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpwpegtwHxJOynPPBbWU/7VFhGEIzuMIL/Aqc6/
 e2v/aBzLS2JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCacKXoAAKCRCIgE5vWV1S
 MiWLEADcTDlo96dNktCHucsX4wxFTvWqQz+/jzYJ6A7WebX+7gMIKlNQyN2TRdddkrastNt2Ffm
 9tgBWrvkpMDAld2okAN+w92oVXZx6mc/41A4hSycbKrW5rcySOYAVo9ZHi1dv33aAWOd5U97+ui
 ffW+uOlg9dbYZOYS1lbuLelB62NUMBaC8uooCCsx3elqhfQ206jf8y7xZbI14s+1TmT9D+fJ7PK
 WHh5WUbHhcrZbjhTK3R6QsZOoTZkL0JfFaKfx8fKgRWGwgLdYwuLPDQOe7zIl+NbXfe5PeaT1eh
 /JiTPrdpVaNvsx0fizNN/rkq6bAqZ4C65GvW6+J/Rm7fS4/rVIbGIbU3WMKrgWbaRrUYX3o1sqb
 70vtE4xp8jilCU9pcMgnDuzfqjZYCHkb+0wziEFNlP5A6awv5CX3qIUne4c0bUCEQtsxruNiAg0
 3vJAHXabmAtLTa2jqXXAXahgF9hYXRENdV3lKStlYvAoj4+GUyTxQYwmHTHBC4ISh7w4CMuBrJD
 qIMY7rQlp4DSX3UVrAs4ccSUzLdJwyy5RbupsNjCoolq88j1Y2pEA5YDrjelOEW7nuUX2NHXcJK
 UWqYqbwYrvO6E8ppxkkqUgeIIGoISAwfsoUjJLA0FdCc6Wpvcb91GFODHosoMQM74uPHEpVre+C
 +4A7DBoe9ZCyUwQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_065452_814107_593FF484 
X-CRM114-Status: GOOD (  18.44  )
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


