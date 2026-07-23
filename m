Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0221FC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MUe6DM8qKQE5dxOolqQrw2XXKMs3Lh0VGlvHRgfEXo8=; b=O46fvYMtaTT2xq
	An6pBaD4t4sIZBoaZAgbTBeG2wdwbMZ1yR326BYibg4YEfIFI8RA4xl26zJXFu9ndMpEQuC3fOkM8
	mHzQ4obmJUs+8WfjR5etpld4cNQp8/fPUE37I2oCGZ+I+jWnZytXUu/AYTbv/IljtgzEnwharsBwP
	nt5odis8Ez9xUnL6esJKa01O/19abgWlA8ASJu4OHU6yPMqToH/RTRkwqggBeBUUzMznADjqgITtm
	x5jKemOZwShLXsRaS/8glrbqWCsrz4rbkMZkdbu33CB7HcPLIOOp9Hkhm63gORpCLt9ZgNRUkDYl5
	bg9xCi51lIVTP9uoMAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvN3-0000000EbkL-2OIH;
	Thu, 23 Jul 2026 15:30:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvMw-0000000Ebhy-2LFF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:29:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so6143725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784820592; x=1785425392; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MUe6DM8qKQE5dxOolqQrw2XXKMs3Lh0VGlvHRgfEXo8=;
        b=dzKRs189Eu8aoj+y/lh5MwSG4do/XeM1QyYQr6TKDZaZdl3gnvip+DM8501i7u2f4d
         B0SmAXAiI6j57WJATNv8LxxNY8n8EqqLQtLhkJYtfPwdyq+DbXqmtsYvXTuMA9tcMEM/
         Mh8dbLPiDNmcFmmdMU8EhQF6bfHQygDNr5wEbcOKdRbi7pXL2Ye/LeEaRzGsHhst7Xk1
         Fx2+5Gaf8vBX6Av/UqxsgfQB2W/Pz0dyH3V3m99QqE++HhO5sTtC3DffEDHR4zOYAVv3
         9PPKF/xfT67mmzMJ1dtUe7hpsGGUq48JAxyW7oIyF3gS17uMseYs9+elFsqJslBTE4ng
         aA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820592; x=1785425392;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MUe6DM8qKQE5dxOolqQrw2XXKMs3Lh0VGlvHRgfEXo8=;
        b=MtcR2fh03jjDt91r4UbTngCrX+NXqWTfyo5a0nFvuZ7dn8+i64wMnO/BC1kmn0zsDh
         osh4ieGqNVIbz3yvzOLojD2E87lL6/TodD3GrSyc7hnxUOBz9rXUmCfAHH8FkECpVuf4
         QoHF0XEYlWBIbSstGHvQF+xYwpkmlTa3oX0T/1q8tUZbUeYwAzRUiYVddghR3AhuOXuj
         VyJQwZLlVewDzyhTsYCmvIL5XIbJhVjmPV6R8XDP54w6m3sKnkHHtCClqELU7MovVdUg
         KluGLfRJVbwT97n6BCy0A2YqrhOhh+CqxQQYgdmX8vwS6+oHSlUefGBQi2OrvxFvQkML
         i/Og==
X-Forwarded-Encrypted: i=1; AHgh+RrFPger0Z7bgtZWqmdnruhO2wErJkBrlT7fF69ukDMfUai9TjlBXH3CnP2ki21/RhucZjWZK8SDGzVe5q+LxAPm@lists.infradead.org
X-Gm-Message-State: AOJu0YxPNlK/yj+hgkWBMW1Lkk3TRr3MhBam6BulFjYzPCxLf33gn8pc
	clWecGHssYs7cLmNkA6bUa2nXh+uiWeimnR5imgwr3Rlj6KqEhJcHBt9b1ujd8w4LuM=
X-Gm-Gg: AR+sD134oR9EYkBNDHu8+yK8C5rOf4i1K1j3cyfs4Up0LEnDvCSV+NER0uUlti41XDC
	0eaKr2KAlaA+rgFGt4wxQlOX7ty/Qt3ZDfCjibMvuF2mxIVjYj3qAUIlZx/8ssJrVAWbVFQm8nm
	WthGC+E15Y+LFvoVF42tIPdp9pIS06Enac6unv5f56GR//utMOEa/y+ZF47IY5csPlLIaZndSRz
	qorll7mLzgsuJTh1kho1p0WWHOqUvv3emD7Jj9ZYbyObvVulTIw7CaKZEIV0isQBsQ92yStz0SQ
	ppSBs4i5MP3jKcDsdaJxF5AMJH+gOXolS10fCmwRiliSvRAmWaGcMq9+H6e65WM1pHaeLlca6aV
	DPCgCAoO9+faQZlzuw7tN3NtjIBYN5n/JEmAON8Li0TC23YzW2y2S2Szp/YEb8FAnQa6Z0cVFEI
	N4b5nQ4KO0za9D5Ja/6QKqi02S8bvpFfgVu1uIBvVTLGevU+W8XG3L+z5MCs+ODiNSMw==
X-Received: by 2002:a05:600c:1897:b0:495:3f28:3f19 with SMTP id 5b1f17b1804b1-49573d21a4fmr26094335e9.37.1784820592056;
        Thu, 23 Jul 2026 08:29:52 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49574653f83sm36952525e9.0.2026.07.23.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Exynos850 ACPM SRAM devicetree node
Date: Thu, 23 Jul 2026 16:29:45 +0100
Message-Id: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGkzYmoC/3XMywrCMBCF4VcpszaSxNZeVr6HFEmbSTugiUykt
 JS8u7F7l/+B8+0QkQkjdMUOjAtFCj6HPhUwzsZPKMjmBi31VZbqInDdfIhNJR+RzUuMRmkph7b
 FRkM+vRkdrQd473PPFD+Bt8Nf1G/9Sy1KKFE7a6qhdkNty9uTvOFwDjxBn1L6AoW9qw2tAAAA
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_082954_669693_9851ACA5 
X-CRM114-Status: GOOD (  10.05  )
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

Hi all,
this is a small series that tries to address comments provided here:
https://lore.kernel.org/linux-samsung-soc/DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org/

Due to lack of responses I went with an idea to update sram
bindings to add new compatible "samsung,exynos850-acpm-sram" there and
exclude it from having child nodes and not required properties.
With this the node becomes a simple one:

apm_sram: sram@2039000 {
	compatible = "samsung,exynos850-acpm-sram";
	reg = <0x0 0x2039000 0x40000>;
}

The ACPM driver will just continue to parse shmem phandle, so
as far as I can see no updates there are required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- small update of the initial commit message
  "Add SRAM node" -> "Add acpm SRAM node"
- new commit, updates dt bindings to exclude sram node to have child nodes
  and related properties, this adds new compatible
  samsung,exynos850-acpm-sram
- Link to v1: https://lore.kernel.org/r/20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org

---
Alexey Klimov (2):
      dt-bindings: sram: Document samsung,exynos850-acpm-sram
      arm64: dts: exynos850: Add acpm SRAM node

 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
 2 files changed, 7 insertions(+)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260413-exynos850_sram-ca1200b99e82

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


