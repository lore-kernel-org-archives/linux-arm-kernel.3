Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561ECC531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvvA47yK9RFkS+3kJ0N4nXWgy3089ah7H4jN9EcLvHQ=; b=PBdfkpo67M/ETyg8uavaCWURDe
	7ZlcqhJaTsqLNJIRUCeUDaid8q+YkSVNhhVFmZVvuEPpAV7o5XaXsSyZAgc+AIzrvwDsp1zVj93pf
	sPKknzJ9dIq1AyXWR1bG8CoevUToxEIJgUm1pYUjjtj+7LBtpDyFHA2UWdiawAI4PTd7FD/pY6hGy
	ajnhyTR6w6VR2kGwdrGelcyyno3bELQckLRoyCQ1Unlsuk7YV3AXfKQd3TglFbSnCht4GKzW56t3h
	xHDtwc12emYK1Lz/LI6Wp1zl5aWos02y0s7el3m/2Zh2DFaSGtr9ev+d0SPhuPqmkccwXwB3ByzYG
	7ebXJE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvN3-0000000Ebkt-3W1i;
	Thu, 23 Jul 2026 15:30:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvMy-0000000Ebib-207f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:29:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4954df200ddso5039625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784820594; x=1785425394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvvA47yK9RFkS+3kJ0N4nXWgy3089ah7H4jN9EcLvHQ=;
        b=OswPGR5S8gFjSNkUfXNVy+4EZMY6pkyE75qN2BfWnw8F/DmCTtoMiKz/pGzkuL3Wtk
         jvXNk+sIzuPfpA8uQSuNnik08XISZzoTqO+6U5u6E1gverk151tb3LMMdT7YTtp6r7Vh
         ubYM2H7GleU16NQniOpUGGkNBRVYlSRe2pCAIqcCfakghu8his6d3SH2lMlW4VwCOEz/
         6XUe6bHVDhBSA/FiYkM10PCR2vY6jeyXg55UaIzWcJ5xA61XYF2h4V4BVCr3pquzstVN
         sgUyzyLj9+HxjXvnnmx6FS1P3VhS0d3GjkMNcux2zLnegOcqKcTqu1FPAiw98ijder9n
         AZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820594; x=1785425394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvvA47yK9RFkS+3kJ0N4nXWgy3089ah7H4jN9EcLvHQ=;
        b=tGNfVUl7XEh7dbJDQgIMuSrKKV7xObjk3g+mBPbvH10rObKXBd5vEVylWosybsRGfq
         itBgIi+OOivWoeP6DqGtDTH0hxGoGxeqzsTAym5k/3wThQeY9w2pOrxaYoYDWPhh9xp9
         5n9ufAKgP7WQxwqYWwancRGW8p8u2xQfSkQTjsTZXXK7Lw3D87f6yYyCm9nh4NgfdQGW
         ExiX4ECEhx2bhca5q5IBvdDf65dEsYQGfOdbP6dmE5mJCQaCKs2Fefvm/OLV35KUD6WD
         Ud5cum9yUMPT0/tHGK8g+N7N39VGcQBzgWJRgwVeDDfXQLW97kC5PRcKSd/oe7yhb+fj
         G3ig==
X-Forwarded-Encrypted: i=1; AHgh+RrOYsNxHfY4UUpeSV5voxnzqzhL7Pxsakn6YMMPuTDzqwFe+8laanV8PfLm5T5dS83JBpQH9h3rDiEfHMu8ZCov@lists.infradead.org
X-Gm-Message-State: AOJu0YzIzPZHyqoOvBwkaZwqMYVfkS/z8IXOePyvTQtRMib4ZNkcW5vO
	UKdcat2JsPtL8/yH9cbeH/1CKH3M9FwRu6fL5EBV8vOyN1hUYbtMnio5oAx/vEH1QHo=
X-Gm-Gg: AR+sD10y6ChM50WW28sBf7ase0hWRFkzkc6Grk0759waKgdcEunMdLXPxHGPqekhUU9
	RxPjVnMy5o2Sj3v9I+Vl77tAsflQjZVz3dQcNBUFeHKKfr/we+rqB6STdOf8njnR0OyzoGvdtq+
	+kdYGbpejCb05LEG1l/87DHwEVpqsBj8dl/xOY8aHzsROL60EEX5Rn3cdlKKaBPqTjfvZepxXM7
	qxCAxB7Zif73cAYZId8QRFgwsH6IdaU+Fs3w4iEiyZ7olgres5SjwDqAtfkpxqVNlLPexJPG/qZ
	3up0PkJI7g1jJ5Oc3XLwMpf3V4ES1Y72ueF1F3b/1NQwho7tIHXvDnPJxoZe5JHVZE1ZAjMyB/w
	LmJpVQ5uQWmfy/fsnicBkqVTbjXKSOMtTAXvM90uWppa7+lFSS0U5XoEs1fir5fofuf8d5JIJfM
	CGUk2eQ6LY858RveAxiVyhNxM8dhx1YpmLQYIcGTsBWV02059oSNncxg03smdUEAHkoQ==
X-Received: by 2002:a05:600c:654b:b0:495:5375:2510 with SMTP id 5b1f17b1804b1-49573cff63dmr26167785e9.24.1784820594260;
        Thu, 23 Jul 2026 08:29:54 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49574653f83sm36952525e9.0.2026.07.23.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 23 Jul 2026 16:29:47 +0100
Subject: [PATCH v2 2/2] arm64: dts: exynos850: Add acpm SRAM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
In-Reply-To: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_082956_541570_D965E043 
X-CRM114-Status: UNSURE (   9.76  )
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

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..9a8d92aae9a8 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -917,6 +917,11 @@ spi_2: spi@11d20000 {
 			};
 		};
 	};
+
+	apm_sram: sram@2039000 {
+		compatible = "samsung,exynos850-acpm-sram";
+		reg = <0x0 0x2039000 0x40000>;
+	};
 };
 
 #include "exynos850-pinctrl.dtsi"

-- 
2.51.0


