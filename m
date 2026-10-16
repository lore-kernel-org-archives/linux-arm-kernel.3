Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BAACCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nKpbbRcagz/95Xy3I3HJP6MXZuF969V/i+8+al+dGw=; b=RvvnKMYc0OOU9Qhg7RWPaYBllP
	6xsGed+ht8z515A+cjf1b6T+OBmA+zSlkhp2VNUp0Q8xsse2gnXsMB39fCi01j+fXNDG2xk4ybway
	0Lv/gb1wo4C0166P3OiwYxtFv3L0eZEmNbKKdnYLRix7iauZT5ZfKO8g4RBZoOxqA0m3VM9soObHl
	e5wOTlM2S9nF3KLgR3a2z1sHeOage8Avx88vfGkOyBIopKq+XnaNeHen/GHX7FB6vbq5ixozn6nvG
	/uT3GpsxzspnpM6SKIFkl/MWlffpzi5mWyTShb28mB4kEdoIdgSw9FcDvf1RS8p6AdcB+/ArYaqNo
	+jMjYgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7n-00000003Aki-0iTK;
	Fri, 16 Oct 2026 14:41:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7g-00000003Ag6-0gbX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-487049569b6so4561043f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161686; x=1792766486; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nKpbbRcagz/95Xy3I3HJP6MXZuF969V/i+8+al+dGw=;
        b=TmXsu/V/EOh8Nmidisf+elo4z5jP0rvYpGSmhfIFqYW+MyoGBKNCPsL+yNHjCvi1YB
         2kHBavTkXploVvA6ek7hGexxA5rQ3zwuWimmQlXeXZbe9BcXd5fXVsFNm4Gb1hFFi3FK
         RLoKKe7vrCgLmLCk0fGnBqS/AqU8tse1Z9xT90dPZnqi20IuqAwPwInQxP9+zRrjXaPV
         IpKuU0PqkDNFm/I0u+WhMnp2GyEmgk5rQaJcTcPXG6TeT/ZpHXSHGoKaOqT2uSzph/q5
         H0NizM1fc+VELcKAsalR70ALgODhB4KEqIaxtz07NkRPW6bAgJrnqf2urENOyDygr1Cm
         ynSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161686; x=1792766486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nKpbbRcagz/95Xy3I3HJP6MXZuF969V/i+8+al+dGw=;
        b=G/WPAEGTVIQJk8ovgI8+RXT4zdC9WshxARQXgugGOAyakAhU5C5+EBbpYTVec6u4Wq
         bgoDR2HNIJcEyXPC76OYqj3ohNXD95JByp2csVK4KWJ271dRkR+aLJPOKj1uy6JPqLs0
         bFWBKXyA2X1J7p6WiY/tAc68HHyQpMS9sHt4/O8eKYt7CjKTVMZQLg3g6UxGTKDDKXb2
         dOofdSRzz4/Jr+ULFI4cb/GElHUd/s7o+ZTPyxlLfqkMlqfLjjlC9ssz4wA2ru+DooAH
         O50p6qkSV4rcL1stMkkhtsPtsNKVCnjCtdZWeUMaRWtzxIioqdcEw9OC+U2F2DHLaJaq
         fXRA==
X-Forwarded-Encrypted: i=1; AKwUvBwJDtp747npW8rs4qdw+PgS4g1932jwVZFf3imEACm2Qq9mlt65h6at4sJLrunAFpxxDHZdiezlvoFgrtlcqcSi@lists.infradead.org
X-Gm-Message-State: AFq9FYJetDEvBlQRhTH5cVn52AV0ItYmSfVPfI85DVcCs62gL9/w/sbp
	Bav1pUolKvO7329GXefPMjJoRU5FStlkx+ozEtpxFBhgjjURewO2PbSx+zP+HUP9QtU=
X-Gm-Gg: AYBFou1mktUulYP5+2ee5LHqHEdWQu8MwHIXYEpt7Sdm4GGxrYsWA0nEOvwhkDASutb
	5ft2WEbIr5hIa5YBHtBIhPFOUDv93xt6zbrBIwrRbFpb5YjDkh2vmfknAeinbiuWcLGq0kzJIei
	6CyYsOkBDmYv6zFZ3UZTwY2CO3eR4BLWSKNJdRBJuFfz+nfrmEEcbuRuP1yRBYnKYYM48fSOvNA
	1L+ejTdnD34f57OBnJ9EBQnsZ9R3eZqOyi9L+cWIcC13ahCkDQHOfXmbwBnQoRS+7G548wvtWfl
	SYx9VvFSIt0xzw9RjqC7KPRJxhrKUhzazBEjaUF9Y3TNgl3j+7ArN7af2YnTQwzEPCkGJd4ES5+
	l1cjnHofT7rP5f63w33/mSpFpBpgcXou4lw2e5FTn7nIN8a5NQG4jqSvYMf4Zg3VbLfabtgUfBd
	D73ZJQ7NsFrwFNNvjGybM0zp6SsiEK3QAL7OvxSZOcoMBkgCP6nVyUmuiU9XFTa92g4bm7uOrrI
	y4tKSpK8HRcTDl/k82DwpYvfjORzd0/w+/Wbe0fbdvonQdOYDFG9O2Hcd7dGuEYqhd21d7//7dy
	iklY
X-Received: by 2002:a05:6000:4310:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-48def7ae6d3mr16320685f8f.17.1792161686279;
        Fri, 16 Oct 2026 07:41:26 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:25 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:19 +0200
Subject: [PATCH 04/10] ARM: dts: omap: dm816x: Fix pinctrl range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-4-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1218;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=v9YLfutCH496XMWZUUrGKakURi5WnlthJdHwA43Dlyc=;
 b=KmXjd5n+++ZyEda3KXujKTa1Z83U7uC/nkp9jH+tQZUgpwg9nc1vAtNIf1S5HgiRFvr4E1LHP
 r93ByMs+fqZAzTXD5QsHto+lcEIDxIip0Y7/KMFlxK6N+53Zi7rMIRQ
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074128_232237_2A5BBD5E 
X-CRM114-Status: GOOD (  14.58  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The range of addresses accessed for the pinctrl module needs to be
extended to take account of the fixing of the size of the pinctrl
register to be 32 bits instead of 16 bits. So in order to allow the
final pin control register the address range must end on a 32 bit
boundary, not a 16 bit one.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index de4d48babf77..9c9d5e296e90 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -90,7 +90,7 @@ scrm: scrm@48140000 {
 
 			dm816x_pinmux: pinmux@800 {
 				compatible = "pinctrl-single";
-				reg = <0x800 0x50a>;
+				reg = <0x800 0x50c>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				#pinctrl-cells = <1>;

-- 
2.56.0


