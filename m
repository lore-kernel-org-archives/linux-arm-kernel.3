Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8E4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gM/OFnB/;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AQp92ShW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEhsrPmovlqFhqyaT3oTm4Fh1ZVngCl2/NoPnSq3l5A=; b=gM/OFnB/3sM/YrIggRytyhrmZw
	Z0kN96YdHvCXCCRWIiRX00+GkmLtfo7EUO8+IFV02zUHNLqJbh2vtqdIorcGNjE4w9fi66Bq5X4bv
	mQCLW9XqHhFWGADUkJjbwnILDOAuWVO6LuoQqAYXsuoiEGx9+ww7nRG3G+2fZfh77Fl4/tWZ3CgOW
	qL+F94LTx6xs/wJR5R2dmlN1fs1KtXNSXVwDgwrKikC2VizpyH964nA7TWTTOzCSvGbFGvE2ugsxZ
	UjyKvN3JVsKm9dtq6PaRQJfmEYB3qfzs+h6F9y2gAE8nW720CSzOYh7KP38u20tPneQJgoIAoJ4VT
	2pCAMqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuh-0000000A4QV-0tPn;
	Tue, 20 Oct 2026 15:38:07 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuO-0000000A4KB-1EZR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:37:53 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-353804b591eso6371356eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510668; x=1793115468; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEhsrPmovlqFhqyaT3oTm4Fh1ZVngCl2/NoPnSq3l5A=;
        b=AQp92ShW/FKz6ZhDjR2e5LS6SYf9TD8KmrHYvXltadW6hMSEkGBxEbg4Ktx1dZ7ko9
         2ISvZsmooF4q1AgHG4N7p9HbOuZFJvs19zmZqYzNDwfNWuBV9vrs8EIJ7vHE69b/vKhx
         5/MB83FEO1HK7EMnSgye6IRRlusmS/bX+M0FQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510668; x=1793115468;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEhsrPmovlqFhqyaT3oTm4Fh1ZVngCl2/NoPnSq3l5A=;
        b=JS8/oOcKIKqyv+gKTBL9cmx5LT8b3//NXjfxES4+UXhd9hBwQH0J2J6nURXXpaYq+v
         8u8wym0+pUgJ/eqNP/k0Nqw7aS95xsALDHCVkmJkIyFRtUz5kc9xMHiqZZuMRXDOwkZi
         jtbLxX/Uuxyd298Ayn1dklY6J4kgO4UAvAKyeZexxsO70dohEwXKSMwcELoOdMDeV2EN
         Szud539wLKqDgw5Lu89M8MArdOe5qEj1x2+r40SW1HpzU6K+8weu1upkmnNwUunfEQtB
         8BbopAmLX+LrYmgL2GJkAhwOjND38FcF1rL0gD5TVeeei+8PgOmA9GNAIwCtFS89Sg8w
         50Lg==
X-Forwarded-Encrypted: i=1; AKwUvBz5fI8wuCemd4OB5s+79KDyoDeUpwSVOuyRFsMaFEq9glHEiaWI3pgb7Pn8QJbV9v+xfHGvdHexwTJlIhXK4kyS@lists.infradead.org
X-Gm-Message-State: AFq9FYIrt1N7Wa85SeiWTE2TTiZrEM34mSpXz03dIaTGUy2h6XtbCe1h
	/UXf9p1fPcpizpFg3ZM3QKt91JYji2dLSA3PVT4eEUEqbA9sG/m3uXS88ivGaeHepQ==
X-Gm-Gg: AYBFou0KnDssyLWcodlMv/gGWrXwNKIG/pPI6UDX2AYjkk6KAXUu04GPWT30iV6aSv4
	pi7BLoNH0Oo7nYZ5LI+OIFv4lgc7x/VIDBcEGQlj2Y5CtlX1DvTLd0nYu8LjIGKlt9rmOpIddIB
	cDjlRsMDaOSMqc27NtAeFol+sQf0vO3k8BD4VSZqjL0VGwbtKJxgyJBGNg4Pm/7lVOzFAm/2Ykw
	+ukAVWVvckiHfLum+MSRsM+541XDUyhKvb/+jWebkXRQ+ZemeS5CvKQ8gFyyKY93H28sk348xu3
	9L6UUZ9LRcUKJvM2+LazrVUS0NVmFykgBhQ3WdlgFBS5lJbnc9A5E4UNHQQDhk21RJfdBh5TPHh
	izX1YLM1nnhSIJaMnKXBGXXKbF35daF25cO0El7D0UxAPypiYoaRb6IF6y+DGeSKoVvaN3rafYQ
	rzOZPKTtvOiJRBSbZdnDPF/Iuau/OkYVMDfg0DXN59lk9wFStJqfusKbyEaJUeJ4bV6XlPRA8gq
	5Vq1mYRi6s3KmUvkHvOiIIB/y8AqJU63a6MXJHvVe8dswOX0PNmyAesmwYa8dEUO5TE1zfM6L/I
	ujasuMmphVam4s6ycda5MuWyD4MCffMOrZJkIxQT
X-Received: by 2002:a05:7300:10d:b0:351:1e89:66ab with SMTP id 5a478bee46e88-361a0e85fc5mr16049994eec.7.1792510667340;
        Tue, 20 Oct 2026 08:37:47 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
Date: Tue, 20 Oct 2026 08:35:24 -0700
Message-ID: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083748_339259_7873998A 
X-CRM114-Status: GOOD (  19.16  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an Image Tree Source (`lga.its`) describing the FIT image for Google
Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
`lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
metadata in the configuration descriptions, allowing the LGA FIT image
to be built with:

  make \
    FIT_ITS=google/lga.its \
    FIT_FACTOR_DTBS=1 \
    FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
    image.fit

NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
image. However, packaging scripts will be able to take an image as
built above and convert it into a format that the bootloader can
handle.

It should also be noted that the "description" of the various
configurations here is expected to be parsed to help figure out which
configuration to use on which board. This idea came out of discussions
at Linux Plumbers Conference 2026 and means we don't need "loader"
info polluting device trees. Having a structured (and upstream) place
to store this data is part of the motivation for landing this FIT
image.

Side note: at the moment, the Pixel bootloader can't handle picking
overlays based on the soc_id and soc_rev (it only uses those to pick
base dtb files), so for now we won't be able to support boards that
might have different SoCs. I've included the soc_id and soc_rev in
this FIT image in the hopes that we can improve the bootloader in the
future, though.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Note that building `image.fit` with `lga.its` requires the Pixel 10
(`lga-blazer.dtb`, `lga-frankel.dtb`, and `lga-mustang.dtb`) device
trees, which are currently in linux-next and not yet in mainline.

 arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga.its

diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
new file mode 100644
index 000000000000..5ba19c0b5411
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.its
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/dts-v1/;
+
+/ {
+	description = "Google Tensor G5 (LGA) kernel and device trees";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			description = "Linux kernel";
+			data = /incbin/("arch/arm64/boot/Image");
+			type = "kernel_noload";
+			arch = "arm64";
+			os = "linux";
+			compression = "none";
+			load = <0>;
+			entry = <0>;
+		};
+		fdt-1 {
+			description = "lga-blazer.dtb";
+			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-2 {
+			description = "lga-frankel.dtb";
+			data = /incbin/("arch/arm64/boot/dts/google/lga-frankel.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-3 {
+			description = "lga-mustang.dtb";
+			data = /incbin/("arch/arm64/boot/dts/google/lga-mustang.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		conf-1 {
+			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";
+			kernel = "kernel-1";
+			fdt = "fdt-1";
+		};
+		conf-2 {
+			description = "Frankel (board_id=0x070306,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";
+			kernel = "kernel-1";
+			fdt = "fdt-2";
+		};
+		conf-3 {
+			description = "Mustang (board_id=0x070506,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";
+			kernel = "kernel-1";
+			fdt = "fdt-3";
+		};
+	};
+};
-- 
2.56.0.212.g129ede20d9-goog


