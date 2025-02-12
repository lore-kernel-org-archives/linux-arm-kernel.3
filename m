Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E8C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnO9e/u0soM6zfm7iXTquiJqIoHFdkct1rIsAUq8Ilw=; b=GoEgC8JivtshqusNI6k+q1ybVG
	n9ydAmjctQs3d+/z5piuCaeIdju+T81lzQ8Phre/DNGhkiluvHERqYKNP9bin3D9gwWW5SONxQc4I
	eBFI53IJsTB8Vv+dXkyYnz6MWaeSAxaAYEz86C0HDvDY2LkIyYsCoQZdxoPoxP3FB1zK46YKCBf5H
	P5WBaLhBK1xerukfdwKZ7+utW6wQzJBS74r3LjkGP15Z7cDKdXx4UNLOpgSjUO4rBT+bNCJKdCb0u
	j9TdQqNeRaFXH7UY1bB53ZHzDVtOiD9iJJIYCe2YAi1vEZjlsxm6/tIAGCNA4cX8dLH8gStHiENY1
	id4cCDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti10w-00000005lac-2D1I;
	Wed, 12 Feb 2025 00:54:06 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0vy-00000005kYh-15dD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:48:59 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4bbeb009101so335140137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 16:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739321337; x=1739926137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnO9e/u0soM6zfm7iXTquiJqIoHFdkct1rIsAUq8Ilw=;
        b=cDfLwnj7iDmG/X3M+ab6uzyKhZK3QLk2Lc1dmnGIKZAXDsJKgJop+PzaTPi+xCDHAZ
         UAGXyJe5h1LLCnZKKxRUvx0S1ZHnm0dbS7yP1eIQwHiRb1i0gr6hEwec8bLAiwnyltEN
         lK4kkZhlVUPxJoCTcdRXpZ8UyVK9w8NUPxJM2iFfqzD6hei8uUHtt/Y17+Gx++Sj+y3a
         bTrs2M2nytAEhPDViLQlUg/KD+cYb0gbMi7ClK+MtaZznfjoAZiIzSN5lKSc8qRSLo60
         zLNhjSjVK/eZZewekJ5hJAvS9J35lQDIzXcLCsw+T1dPXXL+bFzDXcDSN8chFI+QMrth
         ++IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321337; x=1739926137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnO9e/u0soM6zfm7iXTquiJqIoHFdkct1rIsAUq8Ilw=;
        b=D2THxzySRIVs0JkbIuJkFODEzr5kYg67m4yrY3lMc9uQ9a1aWG6Pv1fcYtBFXSbFEn
         rnkrf4G8uIq/unu+9x7EkJgWkbkKljiaVTv9QFd7jPh59NQOi66pFujHiNhhs7Q+oQRn
         KavEQLF+mxRJ9u0fKfHHpOOjaOY+jqU9sBFuXHW6xc8hFs+YUPctIW0c53Gc11MUiOiA
         /0rzXNMuIw1McSjh2ueQXg87AiNV7BLnuc26D0Ayjegbypx0jR1DJZiBzUSQCl28LWn0
         EPKYM++oXF4Z+D0dQb/fp3fuBVicHQJv8HaNWL0i0r+1nag/1L/x9ZWH6VA0+CqjsR1e
         a89Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzathqcADvbUgRH6aTrvbygD73fIbint0BiHgiXsvAoghXFFZwGcid/qgw/Q+m1zSowF8y2Kumvm0HXk3XbmY7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4tFeI6YMAhkHdo126gBn4CO+wof/53Cm6zvYLcTjVSZNFa76X
	8EHYdufzBW1hCIQu6CxjXK12VffAsL0K/7wPKpfFj1qGG4GYdg/s
X-Gm-Gg: ASbGncv8gqzIIp2IPNFqa1s3pCmw63FgpjoY/b6A+5e6lTqGtNAKpFIpMynUbbb48uZ
	SCYYkvQVsbMunvgKUxQDQ2EsXvWIo65VmG95mPOFx5FY/nTUvWgMCkEmG/xZXf5Cc0jq0knH3B7
	5cqpYDHSY43Ag4RvTOe0KqW4AWrJ7oFODwHIck8vaDgfft58sZxDGuwiBrXJriPJO0IvRXsyrQK
	SpFUuyCn3RVSJKsxM+5V+jVEGchpnSaBf5emq6KuZfOqzefpzrJcB5i2i1sU+nJs55v5Fzk+q7r
	0tN3WmYcbY6NJ5L7zpGyjIs5CbY8P72ppUEE3Bnuj73LWZbd/Qctgw1AUqWfzs6+F549kauc4aj
	nWw==
X-Google-Smtp-Source: AGHT+IFrSRvTw7mvQhgJfawsqBloDC+lGaYWgkWYTPrS+C60KihHhrrLCY+PMmPP9OPsJfxtuui3Vw==
X-Received: by 2002:a05:6102:3751:b0:4bb:e14a:944b with SMTP id ada2fe7eead31-4bbf22dbd9cmr1369181137.20.1739321336924;
        Tue, 11 Feb 2025 16:48:56 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbce4c6fcfsm823832137.23.2025.02.11.16.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:48:56 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
Date: Wed, 12 Feb 2025 00:48:22 +0000
Message-Id: <20250212004824.1011-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212004824.1011-1-wachiturroxd150@gmail.com>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_164858_295722_7F3675B8 
X-CRM114-Status: UNSURE (   9.08  )
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

Add samsung,exynos990-hsi2c dedicated compatible
for representing I2C of Exynos990 SoC.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 70cc2ee9e..b05d1e9e2 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - google,gs101-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
-- 
2.48.1


