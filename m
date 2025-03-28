Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39357C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 12:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o8yZxDWKVuGdJufLroOp7bVTav6VTJyysxYI8wso148=; b=Okj5o4wSOk1ASGxzxbvvXCJb/7
	dGHZgxYI22hz5NSodH8vukNW2cdgxTVkzAPjkESz11BERfusBhFgWToIxPQN/AZlza7eBFdCRc5Hg
	p3X4wGWPmiwP5QwoD9El+GnOXIW5krOfkV5tVhSf+alw36wrWmmFhn8HK3YhlJ4LYyjuNZ1C/8hao
	qdEyuDh4p1PtYDABNhtISpjLs0R+DZYVrENVvD/ADNw5FCbIf5WQbWyd3erFihn4ry4lOQuRSxjC+
	PPlrBxq3P4xyUQInu2Ab8YKR21h5n07jLa4io/jznS9LDnZDioIGzJHrrselt1rF0ySfFZo0JUL7r
	re9S9v9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8bs-0000000DIGt-44bv;
	Fri, 28 Mar 2025 12:14:52 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8a9-0000000DI7o-2MSL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 12:13:06 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5ed2a1bfec7so1745914a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743163983; x=1743768783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8yZxDWKVuGdJufLroOp7bVTav6VTJyysxYI8wso148=;
        b=S0V0F0VgIM82A7PZqsgQ92xFdSxumMkFddEuZz/0bqs5xBLd+AlYYKvZAH/zuGScHX
         6GeJll/7ePH1HdNV1c7Iz55iOWk9pTWIu/smIBQTZXBXxSqLKrqUO+3XY5BUmn9Q5G6J
         v6FExmSd3VoRz+TfgSxZESvJ4CYYqhLTeVQXkxAiWlluX8zO30Dnl4X7j6bUqYQjzPsl
         aveE5NnxBo/G544fpIYQy8gkU4eo6JSbhn0+0wDwOV/tdkQgkq1F8FVFpn+9kNJLGoFW
         SXLGKwY8h+noSo40UNgOUJUjlbPYQWTB4UzKgq60nHE3QnSbeGzxundoRAAuhR3bLrMX
         KkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743163983; x=1743768783;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8yZxDWKVuGdJufLroOp7bVTav6VTJyysxYI8wso148=;
        b=aMKApX6n9K0cflWNChxqvXhneAoFT1AaoUpHLOSww9krueLA4dddCZp9B7z22MABwT
         +dhzdA/4b9+oa6OCrfoNaDfRCROjUO8UPdoftO3E5VdCjgKdsAEkVNCIV7kzYwUXcI8/
         n+Yg1co+s9YOGTFHggQwCDbiwxsb2/Q4/6l6kJLy3TTXx5/cOYnPlV3rCMaywCO01Tc/
         P8Czpv68wyHxbCvklSU5rasY8ZW/zWtJ0rABZXF3ggSVkz3Hc56mmA5HgETsYNLsJAvC
         LZSG1WWxfWN3mOkHTmX/PJXulfXSRSHWkY0+kQo5ONvQ1NCTGbgq6q/PUV2qzyV4ZdKD
         +dHw==
X-Forwarded-Encrypted: i=1; AJvYcCWOh+RtFiiji8OhwhbkynRi/uUz6kLfMERiZk+FtwxVWWLeOqrN+saZQQZGZErPe/lVcOzbXzbGn59DHEvWDBVm@lists.infradead.org
X-Gm-Message-State: AOJu0YzAmJT7sJMCdR3OfTSE6mdFczLgyPQWx1f8g1fzaJSOKt+8Gi4e
	zQ/BcRTf627P8H9Kka1KnjYHFZO7qShtpWRsDoo/Z++JSs9GGHvfT0zQCzQTKXTa+P43A9PITIQ
	g8iCLSFnVQg==
X-Google-Smtp-Source: AGHT+IH+URE2JNYwtr+vzakMr5FIwnaziOhvei4JU7ZPSwNs2+pFJiuJvdGrEEam/bZoSIkKiBoQnrek1y96ng==
X-Received: from edrc15.prod.google.com ([2002:aa7:d60f:0:b0:5e6:510c:9f00])
 (user=lmajczak job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:34d4:b0:5ec:8ef1:35c4 with SMTP id 4fb4d7f45d1cf-5ed8e4957d7mr7600952a12.13.1743163983409;
 Fri, 28 Mar 2025 05:13:03 -0700 (PDT)
Date: Fri, 28 Mar 2025 12:13:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328121300.2612942-1-lmajczak@google.com>
Subject: [PATCH] arm64: dts: mediatek: mt8186: starmie: Fix external display
From: "=?UTF-8?q?=C5=81ukasz=20Majczak?=" <lmajczak@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"=?UTF-8?q?=C5=81ukasz=20Majczak?=" <lmajczak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_051305_596111_41E324BC 
X-CRM114-Status: UNSURE (   9.96  )
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

The dpi-default-pins overwrittes the same called node, defined in
mt8186-corsola.dtsi with the wrong set of pins, so remove
it from mt8186-corsola-starmie.dtsi as the first one is correct and
sufficient.
In addition, remove dpi-func-pins node from mt8186-corsola-starmie.dtsi,
as it is not used anywhere and also defines the same set of pins as
dpi-default-pins node already present in mt8186-corsola.dtsi.

Verifeid above with Corsola/Starmie device, by connecting external screen
with usb-c -> hdmi adapter.

Signed-off-by: =C5=81ukasz Majczak <lmajczak@google.com>
---
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 45 -------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
index 5ea8bdc00e81..a8e79c2791ba 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
@@ -375,51 +375,6 @@ &pio {
 			  "TP",
 			  "TP";
=20
-	dpi_default_pins: dpi-default-pins {
-		pins-cmd-dat {
-			pinmux =3D <PINMUX_GPIO103__FUNC_GPIO103>,
-				 <PINMUX_GPIO104__FUNC_GPIO104>,
-				 <PINMUX_GPIO105__FUNC_GPIO105>,
-				 <PINMUX_GPIO106__FUNC_GPIO106>,
-				 <PINMUX_GPIO107__FUNC_GPIO107>,
-				 <PINMUX_GPIO108__FUNC_GPIO108>,
-				 <PINMUX_GPIO109__FUNC_GPIO109>,
-				 <PINMUX_GPIO110__FUNC_GPIO110>,
-				 <PINMUX_GPIO111__FUNC_GPIO111>,
-				 <PINMUX_GPIO112__FUNC_GPIO112>,
-				 <PINMUX_GPIO113__FUNC_GPIO113>,
-				 <PINMUX_GPIO114__FUNC_GPIO114>,
-				 <PINMUX_GPIO101__FUNC_GPIO101>,
-				 <PINMUX_GPIO100__FUNC_GPIO100>,
-				 <PINMUX_GPIO102__FUNC_GPIO102>,
-				 <PINMUX_GPIO99__FUNC_GPIO99>;
-			drive-strength =3D <10>;
-			output-low;
-		};
-	};
-
-	dpi_func_pins: dpi-func-pins {
-		pins-cmd-dat {
-			pinmux =3D <PINMUX_GPIO103__FUNC_DPI_DATA0>,
-				 <PINMUX_GPIO104__FUNC_DPI_DATA1>,
-				 <PINMUX_GPIO105__FUNC_DPI_DATA2>,
-				 <PINMUX_GPIO106__FUNC_DPI_DATA3>,
-				 <PINMUX_GPIO107__FUNC_DPI_DATA4>,
-				 <PINMUX_GPIO108__FUNC_DPI_DATA5>,
-				 <PINMUX_GPIO109__FUNC_DPI_DATA6>,
-				 <PINMUX_GPIO110__FUNC_DPI_DATA7>,
-				 <PINMUX_GPIO111__FUNC_DPI_DATA8>,
-				 <PINMUX_GPIO112__FUNC_DPI_DATA9>,
-				 <PINMUX_GPIO113__FUNC_DPI_DATA10>,
-				 <PINMUX_GPIO114__FUNC_DPI_DATA11>,
-				 <PINMUX_GPIO101__FUNC_DPI_HSYNC>,
-				 <PINMUX_GPIO100__FUNC_DPI_VSYNC>,
-				 <PINMUX_GPIO102__FUNC_DPI_DE>,
-				 <PINMUX_GPIO99__FUNC_DPI_PCLK>;
-			drive-strength =3D <10>;
-		};
-	};
-
 	en_pp6000_mipi_disp_150ma_fixed_pins: en_pp6000-mipi-disp-150ma-fixed-pin=
s {
 		pins-en {
 			pinmux =3D <PINMUX_GPIO154__FUNC_GPIO154>;
--=20
2.49.0.472.ge94155a9ec-goog


