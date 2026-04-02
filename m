Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A0B1112275
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 02:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cd/iu/aYoTfiHEl0xBfUrFFloW9Th3t3xU+FRrPDwNE=; b=g92jm5uJFein7FGWQTzYT40OZ8
	JF9EMQOroVNbC8I+RLYamYcMkZjYaUxZlnHUYsRQSg3KQDzpjpwkttPz+c4fBL/B9gbkGCHBKiUhs
	MJRmnw+RvF1Bs6uz9V1A93PEaXr17gEPCX947iWeSroVzQbTEOnGNuM2kScYgrl18UJ/diJyjgqt0
	TisCpKGdCE1WJtz0enCZXbbbblJH4lvkyEqGO0ljZ/cJEX4oYEB21ZRbqtRazbxbasGK1f77QLqVn
	eeJ45ZLYKAaoAtytARsjFkNyf+Q2ZDT9sClfmzoATR6vKrr/ucB1LxgVxPmQIf1IRC/Gxy5m4aTD5
	PAvqUKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87fd-0000000Gb5W-49hY;
	Thu, 02 Apr 2026 02:20:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87fY-0000000Gb33-36xZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 02:20:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43cfa33a983so223477f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 19:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096426; x=1775701226; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd/iu/aYoTfiHEl0xBfUrFFloW9Th3t3xU+FRrPDwNE=;
        b=qaBPtu3zNb/lNevKNgJ2JevfO7r1WqSi8ncYea8egjDMjp8QeKn+RrirrmWqNXDULR
         qIR1nF/rJTCc6H0RGGqUg2zJYU2CS28pglWH8uBWuremlR3Fn4oDL1f2wf9mECM0QR6B
         63NxOPeGfzduUC/2D7FlZ8j3nQZ9GsV9Y2+6UhbQQ9WBxR4Glkagd6reU/e9Fq8Vf5Ft
         5/8XUc6DdSt+Pu2sfWT3k5jpdjXMDZX3v1BWxBRTXgU9Z51oZz6hAuPChwcBKVON5n3H
         J8UnKS70jHnY6YB2sIWvRVeRqaqprGJge6r8z5E2oQWGXlY7WV8wwUrDqa8KxvGsIeFR
         JHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096426; x=1775701226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cd/iu/aYoTfiHEl0xBfUrFFloW9Th3t3xU+FRrPDwNE=;
        b=qT6ZlTrFia+41ONojAGTF4LHn2SXty4vNGsBb433Goc5y5wKB4lLT9gFDP9ygbWjcr
         uP9WkHienEYkMyh5OznR+ua9u8uk6W43xVA/3XR4nZupHU5nCtw2/Vwk9v/bh9YpnxT8
         AvVaODb9Jyzp96QIDiqtSxHijeDMhBZYM+o+Kn+yyESY7AxPzUEKZdKqND2Qp0t3fvJ0
         RLNzfcCyuvYH93evHIjBdBzjS+bAmYiqsqSXfkxKLyMM6KHf0dCaIKzVqRTkLWqRka89
         /udQThMgXmwMEvMt5qMg+Yj1a2AELLf8i6aZFHihUVfzI8d7EHgX5pngyUAq4YLRqiJU
         LlCA==
X-Forwarded-Encrypted: i=1; AJvYcCWrcumSLYTleq/qz0QbFNgLECW7fVnKqboQAVQxcBM1qZcZuaBB6JamqkXthRDyod5pnYcITS8t8ETuDusVbMCk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8KxKUb7zue9zujl0CE4xN6eBv73EwOgRApuXVYDZM/cHPeI/S
	OuHL5pFbvYr1S9Malengtpf8fPPK9uZOibVcspRnqbPhojyMkpUedouzrbiwJYp1i3XAcDpoezD
	Y+Tdx3uM=
X-Gm-Gg: ATEYQzwxpYm+9+tzBNZwb2sd1MKHsyGBvXdtsR3wLrLjhx4EgvJpOVQtSRtP7ZHP0/0
	4VGkDIG3BWl9yTt0s0cefEt7uJAip1is4PXi38XZ3iGCIbWKtesaAqdthq9HykGwWGuBTsdEe0c
	hxV062dndcqk+8I1dIZocArE+51H3/NZ3abIdSz2bixQKb8MeyY42LAZ5dyQSZlpTM8GCBL9xs6
	7tcZ9q9MkB8QDSxK2zCY5l9Wux7zO0F9lWOgqnE2la7s4tkHSCsxKWksMyKsvuO3cTxRwbtesOy
	5u5OQT1yqyKVtdPEfrAUdkIzwIifnkxtFbgXRGvjb2bwkUWnqwxmLqkpD2HR+25ftkbSsalfChx
	M4slrZ5o770h/9MdJgxcHEgRhixeAuHE4H5A01qD4grVe3cY9MOr02f/y71qsUIAHqkdfsL4bFy
	qpm7nCQklgI1enWsFf64n8oyWpfJ9EgvxvlQ6goPuNcK8eKhGgugDLh7GOmJaiIzIujLXoIHPqs
	ngjze+reFjO8FNr
X-Received: by 2002:a05:600c:3421:b0:488:869c:eda1 with SMTP id 5b1f17b1804b1-488869cef18mr45133425e9.15.1775096426011;
        Wed, 01 Apr 2026 19:20:26 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:24 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 02 Apr 2026 03:20:14 +0100
Subject: [PATCH v2 1/3] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_192028_791915_27CCEFED 
X-CRM114-Status: GOOD (  11.19  )
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


