Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0658CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1xaYOvgfuKPDqlqGi9mu0d7G4P5AdYn7w9BHWtqREA=; b=Z0sIZArc7yAh/BMXwgXkfUYk4A
	pNCliv59/uKyr5PAiIcQ79QXT570FdJpA5oi9wVHSmhtUiJm0VV7DmSRFzeFVcScKr8rRzDbtNsgX
	FhQcm3hyrBQ1lCYZAnzTZFnCQCstwUUzaKuO4n2VLdmLHOVK5pUHgUdLCUPmTJK01USMh0DVoGlH6
	ycTiIMT7pD8+OJfXRih29gy5F8sFY5IH5aYrHkleiDzktbZefGScriKBGaIkoXHZbrV02wPGoYCf7
	GnCMqWB+nH1q0Irltji7GrkkcRkLWn3s0pBw94NQkJDAeg+l9TAwD8dK1Y+E2HFK7KhcXXn24iCVB
	w0nMv/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Af-00000007dyj-3kIL;
	Thu, 01 Oct 2026 03:09:21 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7Ac-00000007dx8-283u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:09:19 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so33391455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824155; x=1791428955; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1xaYOvgfuKPDqlqGi9mu0d7G4P5AdYn7w9BHWtqREA=;
        b=oAAAWYvl/yvamTov+1NmRC/kJnKgGFLI3Mo86bvqPOMutrxOKA185I4cKUXpzTcOkJ
         hDxZbuBNZl4TbzATGkN2bLLfIWk+a0ysl0DmgA1doTxZVAftqtG0PNmk/MdFVvJ5dOp4
         NK9/9MpL0Axdx2uozfrZJtuaiiieJxl00FuAMKff5T2H3SkTkzNZ38OrcaPP6SJ9aT6Q
         spRXbAL8WIpQ0SYf9SHzWOpTwTZxIsy0GHY9/1dR24enq7TJPG08PMQ727pklZiMjXWF
         ImBukp4InFHzysORUAmB6+aclspt4+xrRaU/SpV/+JdfiM/bec8EBh+ov+xVgzUCpfPl
         p4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824155; x=1791428955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1xaYOvgfuKPDqlqGi9mu0d7G4P5AdYn7w9BHWtqREA=;
        b=shPs68l4uqx/QtWovR4lDZeOcGtBF9KoRuTZyuY0NhGiNQEb/uJwDaZWYWHgOwuNeK
         nKPntrc9Cw9VRs3vBLM3n5kcAZ163lA3JHAm5iQEalSOgN90Vjl9MEs5P1wW2v0FiDFP
         SBASzy7EFr7F2T+0eb0XX2GccuUksOTbrO3OmyLcuVDhwYP1DGhfcZRE1b/uVqtkIO90
         hV/bs7Cgghf7vSRmycGKPlJzoAUdIcdY+pD/grO+qV94mtPmOApR2GDqhRPnsNrsceLl
         9MS7dh7PEk3hUputBL5tJeZ6O4KAd0wZKg8iw+eoQ5sVbn9bOB0N27NLzVUtaCglC6Nz
         xthA==
X-Forwarded-Encrypted: i=1; AKwUvBxS/jr9ZQjjpCSF8UuJ8lar2Wffji6p2Eb25OkPBZJ1md/XQnZ1NCA7ra7C9GIBQNouxOz8UnzKSYoXEkflMX9a@lists.infradead.org
X-Gm-Message-State: AFuF++l7/VnPkA79mJpOQdRlCSSuuFT4etknhN1JHi35MKxcUmmC3gLA
	FVgYGIyrPdwgN8nMFB6V686wbBb8ZM8OuWZL2y91Ju8RClJuU3A5FRoPP1udLbj9px8=
X-Gm-Gg: AYBFou1xVJaUseFcnl+xv56zrAxnLxlRMgNnv5HbzX5u2V+wFSa8Hmkl+lslf26a9Nn
	+wo/AN7lMnhmlIiCQXjeR0Zyry5DOzaATeEEgHPho+H3x8noRRfRX02CYye+8B6RM2Azh8HmPFH
	MfajXRKghzNGNiejyXe6+YQ/4Rzfon8vHjJMYS8DQaZAhJICvhmG0KCoijTjFY1wKFSpHW5nlLu
	N4PgEB048NM5IA6/p/5y1Qkwu0pqKiWxhgF2m4/K5026A5QkMfvVYtdp3WX1i+IFaQNqJkc7CoA
	b+vpuA20GepAIQJFWkKPIDwz/SCxYdXTreEAvp+ECEFMaztWR3t7BbpGmoyRt7c1fMyOKWcijq4
	jxhZdldxhhvGf2eAk2fkLgRJ7j3UMu/jhMi1/vqLeuVnVvvF03vXrSRMGPXfvOBosKhlxNJjwiE
	cWDW88bbK2T7zRvNRT4zKc1b8R05tL1m3aLKgWOpo3ko4XcQyj8mag/cFNvRRzBU92VECZzYB46
	ODyfLzLNdB1eNFUtJAZ3LHW8aE4LccNej6qmzzfNfIn4TEACCGQctbAAhl1dw==
X-Received: by 2002:a05:600c:3548:b0:4a0:8f:7e42 with SMTP id 5b1f17b1804b1-4a01affad8amr46885985e9.13.1790824155497;
        Wed, 30 Sep 2026 20:09:15 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:12 +0100
Subject: [PATCH 1/4] dt-bindings: iio: adc: samsung,exynos: Add Exynos850
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-1-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_200918_593644_BD0110EA 
X-CRM114-Status: UNSURE (   9.68  )
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

The Exynos850 SoC contains an ADC block within the CMGP block.
While similar to existing Exynos ADC v2 blocks, its data register is
located at a different base offset (0x08) hence a new compatible.

Add "samsung,exynos850-adc" to the devicetree bindings to differentiate
it from existing Exynos ADC variants.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index def879f6ed20..90a220e3b78d 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -18,6 +18,7 @@ properties:
           - samsung,exynos3250-adc
           - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
           - samsung,exynos7-adc
+          - samsung,exynos850-adc
           - samsung,s3c6410-adc
           - samsung,s5pv210-adc
       - items:

-- 
2.51.0


