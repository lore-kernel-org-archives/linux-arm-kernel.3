Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F49DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjJ5yefLO5Lv7O368+n/XQBys5bCKstA5+2Lfq1JqAE=; b=vZJ2q+WShgxeSp5AGdntNLysCI
	bqus0BsBffmBt3uZ5Q6C2j71+632OeAz1Q+4tfSg830tba5OKI4qlVa2ANZ4U6fR9N74sURscfGfY
	SgVTpVnbuhofQfiIPGjNEi76FfnqeRgHaxEhSfOcOCT3A3DUcGzHcs1yPkcJabk4DhGxKDwrNpSK0
	1mU84VRRHPFsm4xQF0oPB7Vd9zkmLu4eE353MLz7MbhbuVL6PdMYIWdNUOrECoZf+A9p9elyh7kV7
	Q+hL94/MIh48d5ppjXz+oGNRBSWwDtS+7y+7I29HhuNsy5IBPBNu3OC5GW40ydGlEXZSdP6rZ8OiP
	GB2p1HUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUa-0000000DTTZ-2YVg;
	Sun, 28 Jun 2026 23:00:48 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUY-0000000DTSw-1tCd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 23:00:47 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-139a5f4ca15so3142497c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 16:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782687646; x=1783292446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjJ5yefLO5Lv7O368+n/XQBys5bCKstA5+2Lfq1JqAE=;
        b=WwyaJG44YU8fusoxCyaJPbLZVGK1z8+h/AMLnBe7HAKTiawlP14qkhqkPpqofmZKOH
         IIZQq7qrEbv4auTQollMCQRFTZmejcVKj/1IvNx2AqPOw/S6D/GO495c/gA3y+wcH9Xq
         NQChSok+/zQUJEvQA4CCZ2gnpDK4OJcC6EFpJCxLRnVe0WGOU6OkLbQEl/J+XCbDA6nA
         wy30MxtRGmmNRnmagteXT5+OvL/PswLGMs72PpXpyXKXiQ6FirGlYhUUASPH786THsJ6
         XXOQx1oTBO+ulLgyFNc7GwqfshRlyHjHLR5T20Vgf6LJh2Buaz9srqWlXCfVUmogJs2M
         bFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687646; x=1783292446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjJ5yefLO5Lv7O368+n/XQBys5bCKstA5+2Lfq1JqAE=;
        b=fXrLuR61F53Y7NBQbDdxaRrRsYQfDpgoXhUzAjlMDKoFtwdP8e/nqfjpB1TYNzlIlg
         MywKRIh+tDkR5j7KsoNh8T/AOkuD/4rX8gBtux6s4U62NlLMHrYjiGxt3uOmix1fZOwJ
         kPLc0wvEdeA2q4ilopFB/rPw5Rrr+0RLKbF4EdZR0gsVHzlBTftHJo371w8jOOtNgF1G
         l+raZ8FnDC4VH9WGPHu44UBYBZ7U/i1b1Jybq750qmkLlrjSyjvWA4D8aV8y9+4bn/AP
         2Nl+ZZ9aa2bqo783NLUFKpx3KvSgHh13nJgTA3LbYwZmlEEtky+Q/UQrQIpTYt4e/IqU
         /ROQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2yk5+gcAmsmO4zNLDzXzTtvb4Z1yzCvi94cdW7c9qfLvrrfJnc02k+8umix35qO/zmgSs4stgnQAKpLR0uYlj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5KSgrAowjfv56V49prxjDXdxM1HVjkzTRQ8AKF0iaMJ8ooKdJ
	t7E5XbWP6FL2UXvAyvrU+ZzDTMlgVbpRAIIf6CPOe77/ADF181Hd/jhs
X-Gm-Gg: AfdE7clLb1oRP5vaAkmDVI8ksDuN7VilRGp2QCPI8mW700dU9sTPVdjTlOR8gpAlwm3
	KaMfJu6+FxuUvOtEOqkPrkkdgTkBxtwcdnjdt/9esB4DN8Ooj/tTRHWLBFWXkFueHRp5Zgz0uFU
	LJjgPuCDCRc0cUw4G7xMXTx0nyc4acXCL80ZWc4wPtKwu8KnVtXkTiFa4hr3HV9q+RYDSsKCd6I
	iogo6pzXLN9Ikn2oMyNdACRW+w1bJ6cCkxJuhSn9jcAQP4ursrACLDRsHb4MdvUi8N6n+k+UnZe
	vMwcbAThBOK/i0fWu0OYAfLpn6IoEY4YgsLQyIhDPFuXq9qEO+HQ/AZidDAp6d7qk78FkZ0BwgV
	2Ll0JRCuYZBlRFm1vfO2HdW/GLopUgLPv6w4ScngH25aZIzAFSaroNBttlaXiwLHLC5CRtMIikw
	lKZfoGCz531/fUk7GRBdD7Ri6ke+TzGjvtWOQMgiH8xpZeDbYcYTzXQtZWzNFCwOJEiQe8EVo5P
	42Ag7EKew==
X-Received: by 2002:a05:7022:1e05:b0:139:ed59:4b86 with SMTP id a92af1059eb24-139ed594c61mr6552255c88.42.1782687645642;
        Sun, 28 Jun 2026 16:00:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm41359030c88.3.2026.06.28.16.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:00:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] ARM: dts: helios4: add vcc-supply to EEPROM
Date: Sun, 28 Jun 2026 16:00:39 -0700
Message-ID: <20260628230042.1204293-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628230042.1204293-1-rosenp@gmail.com>
References: <20260628230042.1204293-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_160046_485377_F477CFD3 
X-CRM114-Status: GOOD (  12.05  )
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

The at24 driver requests a 'vcc' supply for the EEPROM, producing
'supply vcc not found, using dummy regulator' at boot when the
property is missing.

The EEPROM sits on the Helios 4 and is powered by the
same always-on 3.3V rail used by other on-board I2C devices.
Add vcc-supply = <&reg_3p3v> to silence the warning.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 390e98df49c9..05540b8012c2 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -201,6 +201,10 @@ temp_sensor: temp@4c {
 					reg = <0x4c>;
 					vcc-supply = <&reg_3p3v>;
 				};
+
+				eeprom@53 {
+					vcc-supply = <&reg_3p3v>;
+				};
 			};
 
 			i2c@11100 {
-- 
2.54.0


