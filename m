Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98B6CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJ/LUwVD4cMnF3/D7za+W6saFQ2jiETM71jeGNmmf3I=; b=NBLzh+fMaKiKCkBEIaE1mpH+xR
	se4YOOrZEsP5OR0AAWkk8NlsDdFnNbmky+j9z8uwbROfp3rPMbGgoZrkwjOvcate9aaKsVVQvnZS2
	tbwtb6+SPH925e+RY6FN83Ifi9VzOIt8Y6mI4+dxC1Ev5GppwWmGmephgc88l3W4zLtNYCxMSnZDE
	fLz3MCUd3ZSFQ7Ka2zcoWU6HmS+vSrDDWrp3ivk+sW2mONqD6Z8q2TK6uJJpayqVaCwznxTMrRO0b
	UpFx9I989/1+OtYbYoObQaDddkwA+g6kbZeY9CNCrznPn0y2tfS/mT1CoEPTyRvmzX+vnrArt4apd
	KR9zqNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc837-00000006sJS-36AC;
	Tue, 23 Jun 2026 20:48:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc82y-00000006sG3-2Mnc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:48:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49222b6e871so1918665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247719; x=1782852519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ/LUwVD4cMnF3/D7za+W6saFQ2jiETM71jeGNmmf3I=;
        b=TwMMIPdF0bH45VW6JAEc0V0rXT/7N4j3GPCq4thDB/aKt5SNpfjv9tUg+i2Qz7KiWm
         4OzdlacCx8Z9hG0JVhsr9GAfSapeiu8Uj9IPKer9rciitTSI539a+o0aUtzxfZeXzJYe
         O/XSxZRXY7+0YXwfvuN7f+eSOL+Xm8tp5ah+lvWoxVHk1tvTfIXkCH6VoGWbb0uOcF80
         RwP7t4xszz0Q2HN9snbm+En73H4tzSqOK8xD5464msGmiu0ySaWbOdqc7nn3DcUe3EgG
         8VdpHjf3ueILd06/OqFk3Z6XgpjGfBjIOBbPuwvnj+mlcn4qmlkueFWJZNzymdFXCKs3
         G/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247719; x=1782852519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mJ/LUwVD4cMnF3/D7za+W6saFQ2jiETM71jeGNmmf3I=;
        b=qqkTVa5lxt70/CxU/NMi5TjJIInOpDcj9xW+3gCtprofiM5oBkCVl4nxysbs7bX9eF
         j0Gw5chFwiK8k09PQMkJD6GfsRqnVJr32tGydvI2U7MNAvl4hMmWe6hkjqtnnadKm3M1
         VMuJl9ymZCW3xhXcCmMbdKQTvKeKXA9je799wQXVwhyHKOCusJs31zb1LnczB8DDru8y
         q3Jg4QD5IJi9riIF6IHm/4uoOF8wB5i4oIbAJCER5claVl2IPxd6PgV2nfDM2DA/19Rb
         GZrdFu9giac0zInvZ9SVGbnb67muWvz3t9ia0AgZ35ilGnlCzHuOyUDgon3t371R3M62
         VYvQ==
X-Gm-Message-State: AOJu0Yzy0KpSu4SmOjXigp8HL/m1IKJdffKrDzctEZuMd6rklivkSngx
	aNkpfWhZZVJpIvHuMHgTCMDhE83vn36Bqf7jvrj+jJb4F8OVMGZDmBd0h4tiNW+mTvg=
X-Gm-Gg: AfdE7cnImGFgsnKpP6KX03IYqQADX+BJUeZoVfMjTgvuB7wje1uSawWdor7xSFnqZfA
	tahOrYz1kmeenrpNvIHPX9FV8UGCSsAc60vVJ9P/FT+SB8X9gzna8hXAt67NzrDjW9RuMXMSCjE
	w7TW4A6mPQTEbTHpS7ryRq4KCC5+ypGfC1+Ac5WU6+SYSGmcsiECjC7xpMHWV/W3GpxCrFDrTbS
	j0Extt5TgdZNIQWftbGGbn7sCjN0+A9f/qcZglHVwXe9Q869FX1YUJ/+ReP5E4a7bbva0+SBkHv
	KgmgxC0lM8zF7U+5EO0t9o0dCYEZEryl8JDc3FY68krCSlGZTUHZDwhAqJAF7y2W+P/DvQvJZYK
	h0NgA1VpipaxzMxLZm254LE8lozGnodp82j2flllmzczBY7ABzsB0ioSVFf2PMj4BsZ+VR+bhit
	3vyhd2/GWmaywFK1qIiabr4k9yJ/g0BigK4SNeTEC4Lw==
X-Received: by 2002:a05:600c:4453:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-4925b37973bmr71981035e9.19.1782247718492;
        Tue, 23 Jun 2026 13:48:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:38 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v5 2/6] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Tue, 23 Jun 2026 22:48:14 +0200
Message-ID: <20260623204824.691832-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_134840_616000_9A4D2BC9 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2-v5:
- no changes

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6b9fb6a6bf0b..88225786e216 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0


