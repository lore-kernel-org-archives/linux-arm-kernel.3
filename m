Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11067C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bktDzvvSDnTVQSEknn4n+r4fNa1uNeKA3U3mhbAncEQ=; b=KhL0EO/IR7PTv+VxM3rMpEJS0t
	AlBQqd12Qo3loFyk4u4kqWKyVk9PPVuQHIiOCHDqipNYkNpwGulB2wsB6wde9guwJdoC8QUc8mEA+
	u0I6k2CzZmSy9+Oca0dlmpxzmjvDrvbpdpeGAouGGTT456HgJuTfcdtgU8E6yeiXeJJThjQIerxOs
	vVJe2ZFZHX7DmDEkHXnd9OVyb0+orw3k76O88MUwyJxbe56c8W4ZPJoFKT6V1eahizdDqT1gvPmb7
	PoTd2v2iYLfOtEJO+V3L2Mzg+0SohrcoGIRdawxN4H2KIH4wbuR9hIRr+nT5lExt8/cRfnraIAOeb
	vjZ3MasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq0Y-00000002osg-2sNq;
	Thu, 09 Jul 2026 14:45:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq0U-00000002oqE-1Bk7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:45:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1147167f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783608340; x=1784213140; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bktDzvvSDnTVQSEknn4n+r4fNa1uNeKA3U3mhbAncEQ=;
        b=IVQgW9tk2hH65SHBbxTSNlNWJn0f0czKCwJJXQyhhDGAl0JNNiP75vIMWYXoqXKST6
         iJ5jwtTSUxxpl5te9Q8d02opv+hM2ldJm1tU7s5TMlRBEEEMgMTueicZNeNcinRILon1
         w6JUw7q4A17ULO/n9HXIQVywZG/EPxCwEl/UFGIW+4tEes875oVWP5T9QrJ68PewoEoy
         QWV+unfmNviZsI5OoikNJCzzo9HtRs6ELq1Zl504y89ZjWXE+EVpuZ90pTq9rXehEoef
         DR0CE+Wts5ArY9jDzHFp6Jc5k/I5sWmfHYODI/i7caY5wJKyXKTt2IDPfMsvKXff3W0X
         W+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608340; x=1784213140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bktDzvvSDnTVQSEknn4n+r4fNa1uNeKA3U3mhbAncEQ=;
        b=SQmks1yUl854booZDS3nCz+17pdqvQ4aM15S75Pe9d5CZRkt/fmGi8qfEkOUhg6yew
         ybK5pgNydN1QngAylPwq4sdjH2GREkISWBkI8nGeMlwu2KcqTi/zzVqRwSxUY/kyudP0
         fzrwf6A6Mb4QaEON4jKFApbCZONW7LNpPmL6ApTmDRfUcc2OkA9iXxAUxMKBuSEETIFF
         aMJXWATZbodoK5Y7Np/jExPpaEdOmvP55ETGAeyic76PvE6e3olMYbKi45GbZwzphd07
         /wCnOvP3mujLyjTSue0odwGv0c3VBwdRljpRSbHJ6t3caGJBZ20A33+MCV5FeV1PE8su
         kpUA==
X-Forwarded-Encrypted: i=1; AHgh+RojXwOx4u9wOf0VbQkWjXRnsDVU+XPMH4NR8ZQ42B9N9Wg4U4tjZ4VQTQFJrpY0ZMJKISw/JVLVruzjRZazWxi9@lists.infradead.org
X-Gm-Message-State: AOJu0YyEgHxbySYOLhX8ARtSSDhYR8OwNtJn8xpSqNuzP93gVKQOHD9D
	MNUVR6EocM+kLnb22FJmoxoN7aIOmix2Kzbs003kd+khcKELRX4BXu57knh+3fyxkbQ=
X-Gm-Gg: AfdE7cmX382Nr1n4k+GEl49MaGKypzHXMCGU80e61b9FiLub/Q1nGRD/peSEwLBUx1F
	hxOV9OO15ykLN3SZWEfnTvljhjysRqesiPZrgPQko7lYq8xrBt0YL8gYs7z61D0DZ2S/zZ8P0ri
	0de1OlXCPK2ECzCjdlMtXT3Uymc1K0EDNRr12ULJubFGRS3HSqD/bJdl75y20P/PhFJNCqmRSSw
	ZzApjPMi6do1IF34skkx3sW2sxGiKHFtL4Y6crh/N2ypoVMjhUT4b6ADJ48I4+CPyQVtQ51Oit2
	v7hMXq7+C29VIWKSGEovbjSoQV/ndPwA330cbs9PceElieQcclyMIJ9Ver2K0phCwYm7WEQkGgX
	EGQ4FT5fNyOI8tm5V/gCOurKG43hukrs6G3lnW71KLAD7rYJKiep9m1RKFPvB3+NMO3Cc+ps/wU
	QOei5mJDC7BT6bwrVy9+8ayCLE1qpeMcuSQnZToEdqZqqL9m84ZHd54iN6IsnoFfvQnvRFJe2+s
	JjW
X-Received: by 2002:a05:6000:2004:b0:47a:c103:8a2e with SMTP id ffacd0b85a97d-47df0808ff0mr8297411f8f.45.1783608340408;
        Thu, 09 Jul 2026 07:45:40 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm50995732f8f.28.2026.07.09.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:45:39 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 09 Jul 2026 15:45:36 +0100
Subject: [PATCH v4 1/2] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-exynos850-ap2apm-mailbox-v4-1-caf2fe9a237d@linaro.org>
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074542_339463_80921B02 
X-CRM114-Status: GOOD (  10.59  )
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

Document support for a mailbox present on Exynos850-based platforms.
The registers offsets are different from gs101 mailbox, but the
workflow is similar, hence new compatible.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
index e249db4c1fbc..c109c1f7af24 100644
--- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: google,gs101-mbox
+    enum:
+      - google,gs101-mbox
+      - samsung,exynos850-mbox
 
   reg:
     maxItems: 1

-- 
2.51.0


