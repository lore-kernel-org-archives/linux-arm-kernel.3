Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC9CCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbC49oHT8EOPgFnh+Zvmlc3sy+VsXibXhhbWKtG+dZI=; b=wTMdR3VeoKRdW2/rO79w9WZWwt
	gDtTUO/ZQfl/H7xZXqtQP4zpa4eQD51PadAwCIToRRKVXJabhPK1rd2i+DHQdS6oQSrWHWjejl6dp
	ObND+HR024a2/UsIFRLVUHXQ6aFGTOphCGsBrVs0tMT+W3+//uwOrOO7o6USQc/bQRT8VI1p3p12M
	f4Da0vRrVSRzxaCi69HaDPzPc4wK9OW6vqZj5gebSILxO5p98MLf2iDxrdahLMkti1o7v4rIXYd3i
	4nQFNeqK66mYJB0blVOXr8HZrxBjRjM/1ZBcvHj8QVF01VlDZEnqC6eldAXeRPTUUr/5pJJUUK46s
	MspS0BaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEe-0000000HVl9-47n1;
	Thu, 15 Oct 2026 11:02:57 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJET-0000000HVdy-3soH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:02:47 +0000
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a808f09021so14822921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062163; x=1792666963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbC49oHT8EOPgFnh+Zvmlc3sy+VsXibXhhbWKtG+dZI=;
        b=ovcWErFqUG9pmnGVbR6EFG9BuBQgj7O/BVcAvjih7SOJASFElG2DJkGYuXrXfFAhS8
         A1C6V4p7uySpeZS+JNhd7Uc9m8x4nVdFmLzpb9p70K8tMf860RdJBdCMmacfTMa7h5if
         qpnl8KJgvfrJj2vlj1oRdLtY6gjDh6VXINGHXrggxoaZXZQjMl1o7OHZOki7+NBzmJhR
         jx+eVevRmyvqP21I5ZlTDjKUlPZT21JCQF1Rm091GvYr6rBCbbZqqZyW4N3NfzAbeHdF
         NCC6bP8zAWFBkj+QtDIxstDM127fC8kMmVl88cge8IYHQP6v6Hh05/aMCyovkpGdAT2u
         B4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062163; x=1792666963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbC49oHT8EOPgFnh+Zvmlc3sy+VsXibXhhbWKtG+dZI=;
        b=FletPMXt+egpBc2tbfy58rxFHVeoACYrDPa404VMXDJBwpxRig5ERZFVq/GAmMJ4a6
         5kcmbF7w/e3bxBpuqJ2XnwJEb3iv223UOYtNqNN30H4skcQI4PKuz5d1JvVRSMZJPI2z
         mwhqaXxkA2RoU1mOABqKDOGrv/XIwVBafaTBY69cNyZiRo6LZ+yUZ+tf0meMzi5W1IBb
         JyDBXGHltV1zeot9nzA3AX6Pw5M7LRzf6rfdcWQ3XFM7fEMVxfasmIlN7rTA7VIQu4Jc
         k5owhMHZ5B+T9hJ4tyTkKJmyOSNdYv3o3qEgHlnWY2n/S5qnbdM0DERk2aty7RsjN2+3
         6nFw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ788f5OmDDkj7MNFwOGldTNblEzal8jXic125XC58cLcB1HNLLJBVOUSwhVYEsf6D1FzFhgkIOC2RsdntAEEI@lists.infradead.org
X-Gm-Message-State: AFq9FYInNqpk1mOkF+iVwby1lkopE3PpawCghjRcoLSv2LuodAEY9EGX
	kuv1xVwqS4IWMEoNzW/Q0K3VHCgtqMOYIuG2ykcsI22+Uy9a+/RRm9lJUsNHsUVz
X-Gm-Gg: AYBFou3ZQXjwc7ScOaEnjFd5a+PgWVNEE87jzlSFlWAV6QFIFLXsoZGQVmVdE69Bkzf
	W2d2BA+T52FBALnfzClqYau16dGhm3p2EDvuB89kRFPHm9+YwESJWqBetY8WJAfTKkWINhXhCxv
	36cZkJ/c747/CuhblKIkNj+IpS0I0zAtKvXf21WAeYEvhTqB3oCuTFvE2bnsueNBkp+umHFBiml
	KBdMkJ9suoXMb+G9yYBTedq62WZjE8+btnqRLHBRnyIrB2gWkOZuiuG/1d7BuylhRQijiia24z8
	KmBKscRiwItqLESi3qToj4kcCDWyfjkN8RMQufAt3ZmrdNoh4espFP4AEDWJGxYiWHI1fWyofLk
	iZrRZzweEyxhhJbzI0yK1IKf3+48XriMyrWaV033hyWIXujcL42RtCk0tqY2jsbpxN9k9eh7NPd
	2QpQiFWriFe856l+Fc6J48IGVHJCBf/vQ9/sCya47lEinKtAtEyZCu6h5QIFNqrwkUGE00tN9Pp
	FuEyxu/OArPGOR0tuc0Z9LdkAmLtf1mp4E2e8S7ioHiJrx6E4Q=
X-Received: by 2002:a05:6512:3b94:b0:5be:3f5c:36ae with SMTP id 2adb3069b0e04-5be3f5c3914mr517924e87.67.1792062162836;
        Thu, 15 Oct 2026 04:02:42 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:40 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:54 +0200
Subject: [PATCH v13 7/8] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-7-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8159;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=iKke+G/eNR2RT5FNmfua7QaFLxyZFtZs0AmBr8q2Caw=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LLBqnf4VadPYtQtNP1pSSr8b6jP2655lIqvm
 DrCtEdgtZGJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCywQAKCRCIgE5vWV1S
 MnTYEACRfhJUq7i1TSqeziWX5JnOdVDUWP1uiIGWv83igdN3aP7D3BlFRfepKEOHNr+7v2HJm+u
 0z99E47j7erdRXE4PoqFdzJSSzUuFbId2/JhGhlV/xHVQCCK0lD26ZQI7abF7GA4hnfIacdQ0eB
 gGduArrBgqZjhyUmzBGZZqrj6Pf/HTtqRMhimeT3ugbNUWnuEoDamBRil7OBj7BCpag+Ao1MEYt
 ULy4ja9anxWvv33wBfJqGgWo8fZdkGykxdKOgS4Qe1EBGBIeaPj23WnMI4nzqpiBKJg2/ze4Kh7
 dseSFMbgPjp6qv21L2Qn2P5bLpA9p3TnBbHcKu+V8j+gJIbKzgxO2ZLsqpI9UQqztEupuZr0365
 3CStZ/JNs/s6WK3G7s0n2Ozqizh8D8UNfyyie5eA3PLeQ9uaJdvQXYAvB7mj932LUeZ3jZLHNGD
 gFBRzE3j2lL5P0mIfoNuk6Oc/VPIV3u6eEUo4Hyppj6ogqfVFwlVESMFBdYwJUOiggCAWJDcNjM
 OEOI/WVFUnSAf+kU/jC5fNhhG/CDWzA6QIvde06QcU4sjmZ+DxQGVQBK9acnBhgEuHtWU3lonui
 f0opKfaY5sw5Xq9NUbrCWXgUxLJmTgPURYDK2yrRxxqQsol6uWA1iyoiygUNADNjVJg3hoa878w
 sYAyirGvo0SPFWA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_040246_024407_D0E69817 
X-CRM114-Status: GOOD (  19.00  )
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

Describe what needs to be considered and taken into account
when using different bus speeds for different mux channels.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/i2c/i2c-topology.rst | 180 +++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 48fce0f7491b..97fe0e34a7ba 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -367,6 +367,186 @@ When D1 or D2 are accessed, accesses to D3 and D4 are locked out while
 accesses to D5 may interleave. When D3 or D4 are accessed, accesses to
 all other devices are locked out.
 
+Bus Speed and I2C Multiplexers
+==============================
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
+---------
+
+Downstream channels of an I2C multiplexer can only operate at the same or
+lower bus speed as the upstream bus. This is because the upstream bus may
+have devices that cannot operate at higher speeds and those will be affected
+by the speed change.
+
+The example below illustrates the problem.
+The root adapter is operating at 100kHz. D2 can only operate with 100kHz,
+but D1 can operate at 400kHz. When D1 is selected, the bus speed of the
+root adapter would have been set to 400kHz, a speed that D2 may not
+support.
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
+------------------
+
+The preferred topology when using different bus speeds is to have the
+multiplexer connected directly to the root adapter without any devices as
+siblings. By this arrangement, the bus speed can be changed without
+affecting any other devices and many of the caveats are avoided.
+
+Other multiplexers in parallel are still okay as those are locked out
+during transfers.
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
+-------
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
+------------------------
+
+When multiple muxes are used in series the same rules apply.
+
+Transfers to D3 may interleave between select-transfer-deselect to D1, which
+results in that the bus speed to D2 or D3 will be at 100KHz.
+
+Transfers to D2 may interleave between select-transfer-deselect to D1,
+which may result in a bus speed to D1 at 400kHz as the transfer to D2 may
+clobber the bus speed before the transfer to D1 starts.
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
+--------------------------
+
+When multiple muxes are used in parallel all access to other muxes are
+locked out so this is not a problem.
+
+If the muxes are mux-locked, access to D3 may still interleave though.
+
+In the example below, D3 may not interleave between select-transfer-deselect
+for D1 or D2 as both muxes are parent-locked: ::
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
+----------
+
+Muxes have an idle state, which is the state the channels are put into when
+no channel is active. The state is typically one of the following:
+
+- All channels are disconnected
+- The last selected channel is left as-is
+- A predefined channel is selected
+
+Muxes that support an idle state where all channels are disconnected are
+preferred when using different bus speeds. Otherwise high bus speeds may
+"leak" through to devices that may not support that higher speed.
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
+- All channels disconnected: No problem, D1 and D2 are not affected by
+  communication to D3.
+- Last selected channel: Problem if D1 was the last selected channel. High
+  speed communication to D3 will be "leaked" to D1.
+- Predefined channel: Problem if the predefined channel is D1. Set the
+  predefined channel to D2 as D2 may handle 400kHz.
+
+Supported controllers
+---------------------
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
2.55.0


