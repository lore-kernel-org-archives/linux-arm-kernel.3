Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576AAC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uELk3IX0KmAe3gKWKpct9PqfIxioiMahM8zzKV5oTM=; b=PbV6EmmcqVKOlUbMkDGI4OyKR/
	i2FvzPpG+XXzCLlpBXqMSBVSH8akIEUChjTfPZniiFDxAyWtgPzQhBer04m6LfohIwdemqAqGmeA6
	3qv6G1jr6uXl79betDlX8bQxhzSIGxKHOap9WprAVW4In0atqC3ehZ6pfYx+9XOWFoLJG1fjntB4d
	9QOhbJU5xAqz0XJYbfmfgZjBjO3xzDEGAVR7Ty4mKd2FNHHhwPYZvaFt/SIq0Ccj1UnIndXE1BVBD
	JzWydev1BUPbNdLt0e9KFjGaHFnqeSy7rspND3+HTOrtvq0g7/9LcDcQFnPeZVS+/E40ZPWB6+PAm
	5aNZOcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eUV-00000008Zyp-05AH;
	Tue, 29 Apr 2025 06:30:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eJp-00000008XR4-1Tov
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:19:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3645419f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 23:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907585; x=1746512385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uELk3IX0KmAe3gKWKpct9PqfIxioiMahM8zzKV5oTM=;
        b=dG7k6UJrNp2+W2UsARYc1xgTUxtlgkX0+eq+COjhVwCk2dvxQhyPGsk/xed6Id+VT/
         rRvbXYEME1F/wHQQYMu3HcWZJ4QjyngKxFMAIHwJ4vRSjvvQ814JpXws70LJsgLenWEQ
         o6DB8PVC3MiNsz3qAf31ckp3kyDYEdtS5mnwULvXvOBxEaRRWkJfyJIQFAcOOLW9hVcc
         MJJ37Yf9IjEh9Kw79EGlW8vDp7hNC/Te7hg0h4z+pnpfPi/jZKvF2N6pwJF6ftH3G03o
         X4a14NnZRcm6sqP1PlNv16NwBcKPsrZl3Z88xO8nhZn8LTlSeG2movEf8lh8ctegO2jg
         6+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907585; x=1746512385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uELk3IX0KmAe3gKWKpct9PqfIxioiMahM8zzKV5oTM=;
        b=LY6TOlK4Qty6+geXhQ5rP2BfajoyvEWuyBIEhFeZKu4WvxePT9krzJ9Iz33DzE8WoX
         FDcXrvpjuM6jNIs7Id2nV1iFXK0M/xXrmSGEPL9nIQw06djbhyvS/iJfPje8o+a+KZ8j
         /5yjSH2Gu4nmgAVJKHNt/EV01bbPqzcvuF4cJ7oSCBvfIb6iYipBtZc1pQ9UhygEgNRm
         5goHAdlA4YIOF3fIcLEzyGHK0P2qImLsILrpCVXGEVRA3Kf7ubD01d4KYQ7lMjHy8jIJ
         EdZNv2SS297k2nUPnD/0iUbEAkrru37qkwqVUd45BuRfEcCZhcuPcgdd6LydRV5OqF4w
         sARw==
X-Forwarded-Encrypted: i=1; AJvYcCVJpJkTEaOGApPrWjFoa8B5BPA0n6i1K0NFBOmXpn+iudQ6Weyk1AD65ZmUpR7EV5w03G25XbZq4BnlgBZxfj7R@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzq0AG2Ptx5/BZN5GvA16h1VcmDe84PumJ1nDLbmB6iEWIdB/a
	9q6mljFqG/wR2iwMSD7Lt4BRUIba8o5CgeUpm8huFDby9aUDqXjrFP87WlAlMGg=
X-Gm-Gg: ASbGncup/9MwkrbtS6DcEICpFQl51TeWHlGg1FvtxZdAStU+EZMXWqZ1n40ywyfIB0N
	+/jPOdDReEGMW6OpvvQ0DIymJSa6v6skAqe/nsvYjz+PbGGbCxX87aHD1GwE86MN17UhskWnkBR
	L/mFfgkcn427gmhtePu1B/QYt6yNR61HVAhemVdHiKZmOV3MFrbKM7l+glqedIwK+45kgBAbS+M
	I9ECWCbQJGoONZ1/hDQIaoBs8HriVsZ4LOCE6wUNa2+YlNstE1UXDvVHpcNA001YrWK5aJKxrpC
	+5wI4wrPNM8UyO2UHW0xiCbJKhrWZGsk1AFvYcomgP35DXelkgEAJPPIR9cIGlnQPkr7ENE=
X-Google-Smtp-Source: AGHT+IFThpMV/Hn8fv8bhLUDnjAre1JV27A3D8kJIgvlJw9xTbB+HJubAdPKRGlV07vzAa+DCEfhUA==
X-Received: by 2002:adf:f989:0:b0:39c:2678:302b with SMTP id ffacd0b85a97d-3a07ab9be39mr7770595f8f.45.1745907585666;
        Mon, 28 Apr 2025 23:19:45 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:45 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Apr 2025 07:19:39 +0100
Subject: [PATCH v3 3/5] MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml
 binding file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-3-1bcc44fb1d55@linaro.org>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=j1cZ/ama4pXQcm0lNYjPZ0pmuSUHD0UY9XZIX1D92as=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG98RkuoPV0ry3Z4PLypiABZHhICoNaJvJmzl
 VrD7t2Hx4iJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvfAAKCRDO6LjWAjRy
 uhJND/9CiA4POIsZpZfYrYWxI1RtoQfz0bxdT4Ik7cUrXlCIPZUvjwpWr8qmHvQTE9Pg7lWfxgj
 qVRVNh5pAxiIfudy10QlHmK4JNGcCOazysndlC6MDImVhynvgt27JL9OKS06+DfT6sRE0emLUul
 9bvFPilY6FxzCFL2CzIfKKUuGoFPB1zxwiEqooCK6IrB3TlP4kR0nqFVdO4aZOGRSJSPmspBIKt
 24bWWDgnAD5X5gr7lrF3lD50YgRTj8bzQ+yHtwc0fIQ/cQM+KpvwHnHOg5wUCuxllkYtqkz2UAJ
 fCII3zQzY5RwF5sFrEREDuxiu7ZtVE9PSBlYOzM4NudnuLYM+Z8wMoDC0R9vfeun3s0gqYftcB7
 gGJ3HQzEa5sqQcb5hqyVO6Bos+bgP2UgiYAazLouAvijAHa2Qisq8up9U6AmF19nnBDLO/GMovU
 cO8RuQysMeQV4NY9BWJLLr/azwnN0yC8Q0uVPGZAILidzoZ+rhLbAkCmFFf8PtRvvoby9ENIYo8
 uwCUQqie6oN/8FyNwIIN/HmOqszXQ21rFyKwbtG67tAqE7EbgLcaBC2YLn0uoSjN7PAx99F9319
 ETHgGVv12CAvIpqiUJtKp63+gWxVmqhpZYr/qWiv1OZC/dl9QLcQGd9SzUNauJktEt1LxA8eN10
 XWjSXrReQ3prmUA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_231949_394744_FD456A32 
X-CRM114-Status: GOOD (  10.94  )
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

Add the newly added google,gs101-pmu-intr-gen.yaml file to the
Tensor section.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..5b2ec4c2023f39a3dd532ac61f0075a0a1555411 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10118,6 +10118,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c

-- 
2.49.0.901.g37484f566f-goog


