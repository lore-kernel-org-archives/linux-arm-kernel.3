Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FF7CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JAhGZcmG5DTNoPpP7LuatJXcV6lbxNbVHpf0DkS0EQ=; b=AZ6SblQAyWdK+aj8KITB4H2Vxa
	beK7hNYJ6C10LRysWLQCZh8dCNVhNA1zVdU6nlR3eVUOmFJRZsoQHOgOHxc0fDSvd1zY5sAgVihwI
	luB6Zl2mcXalGa0IDoNcunVdNTOAJCt+2H3sghRkoazcuy2cdbzPzfIVJvAcQP72hAG2hzYKewIne
	aPgrDYeQtPD2ZdoGAXkq7Y0ftM1+/Ts8n5MizJ5+VAE8biqDgnQyVywLHTchON96zGPZwiYEwUUcD
	W10bGtTpbp+LoCsdRsvCqZngNN81U2qafQ6E2SGAzlwwAtMxgojfNgQJsNO63sQYga6PvJSKLOMXV
	i834bQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIA9J-000000046sj-23yo;
	Wed, 29 Apr 2026 19:00:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIA9A-000000046oD-1YQU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:00:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso449415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777489230; x=1778094030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JAhGZcmG5DTNoPpP7LuatJXcV6lbxNbVHpf0DkS0EQ=;
        b=tVNYlYEj0x9Q7UGMvFlGDrxYyoOT5n8rWiFLf5hBSioJ6K1AeHzYTKEdeZCQRI2yaa
         39l8hZ/3Jc+DusP58Kf19s+GEA3IaP3JfYZvbKEuDkYAMkyfNMSVmWiPrBS3DfXGyzP+
         qoB1GSK0z59MopCELY+5AeHgKESuvJ9hgpZtcBi6UCZtKDdhK+e2Mobrat+5jZAHE4NL
         4YUCgQDJ3yH/Uw3P8STe2JlbI7VrXNpCWavpTPMPXR1jr7IF2VAYIzSpGadHE8ioiVUg
         TC4a0rbPYZj9VoBjjmlnKOxYMcSJ6KsI2JAhO+y8ksRJH7xQXgjqvyBG3wjydZclxxS0
         nDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489230; x=1778094030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+JAhGZcmG5DTNoPpP7LuatJXcV6lbxNbVHpf0DkS0EQ=;
        b=IEjg23HEYiIpV8+MbHrrdbCh3MpTOH/cH+bGBA8DyI8ujCILzo3Ndwd8mDFL+YVvAR
         7npWzHij5aEy4gbd5qNA3C8QNXGTusFx8ui+NsTbfMw/QqipfTKv3GN+R5XhHwrPjY2N
         ZNR5umVSVaJ5qq5hdJNSN/yFi2XhyaKlmHyF7K8MUtvrkzja0aFRv+ffuYXqSIDnE5aw
         1CeqsivAyRZ3oJBB4EUf3HJnv9Z7olibBm7ryIcaeSII+aegO93/Q+HO/E0ubftPfKDy
         hzqhov/wLqe/+voPTP5o/nviu/OxOy41VwE9j9SXwWW/14Gkj2ojYsO4u+p2bO7d2nb3
         5vWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9odHeUU5zMrZ0+kWsooV2LrefDk13SS51XkVjTHV8zACjevXOG6ac86aC/oyfswA7TDsjXbHqWEKSlSSu7MiUg@lists.infradead.org
X-Gm-Message-State: AOJu0YwyonxefkoG51c57fVPZdaCp0erJtO3NzvEgZfc4r22v3o8R3zA
	YkdQ1JOZ8TEH+vBINyc6o+Hcg1hcDunU0Zjj3puKOn/Go7Z1BltvJJGLhUcGEyy4AwQ=
X-Gm-Gg: AeBDiesEQVYUAOabkEhaWvNEwn1k0F7nSvPjfcv6Tr/iJOK2AaTW51AXvcvSbfphr9i
	F/sDWgcEnszjpjq8cb2Cd6JdKNOnrSqMIHyWMc7FiwIEUH+RE7QelNI+AEvPZ428SpdagCms9Ar
	/OQG1h8ZOHi8Isxgl1NzZc4NctEntVo+z5+EYC18HsQP5Tg9CaPNHYBxQy9LtLPjfsAWHAUyfcv
	l6oxksyskF1p9ATUcUvTyApDXWKbNBnv6SwK6d4TkNsYM7BO7BybQN1KgjWptMXm8drnhrMnLqk
	5E7FVR7lLxi5vkJYi19omcKr2HbJyJTwHE3CdSmj2hyIo7sMHFE/eISK3f69eJ7JyuBiAJCpBLB
	h08TT2e4vLxFRA2bRjBQHS7uPyr9WV0Y6gUlBM210iKEKrTHq6dDMLIzUBzsVzaxEmdDLX16+IC
	swBUFQzpblcblfrmgvwZmacu2BY4+SyaSyAoyVk/SRktyLf0eZdd9w8M2EI+o9XLS4QC2g3KrXI
	rrUW+n01V3sGS5+UxxwUGl/xYg=
X-Received: by 2002:a05:600c:1396:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48a77b1b85fmr145395505e9.22.1777489230144;
        Wed, 29 Apr 2026 12:00:30 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900b40sm26187785e9.2.2026.04.29.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:00:29 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 29 Apr 2026 20:00:24 +0100
Subject: [PATCH v3 1/2] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_120032_429424_F13047F0 
X-CRM114-Status: GOOD (  10.92  )
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


