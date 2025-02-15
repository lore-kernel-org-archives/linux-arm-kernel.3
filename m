Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D18C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwU+wFyXJQi0hqoJaIM7r6tnW9Ar6H8YYGxOtFUe+P0=; b=ZfdhKFBynAs4KASqovy8E5Y0i3
	heITYNd7tDFWoy4egYmJ1/6tTu1WPZ78yTd+NDRsM0PUI0Xnz3TSxOZTZDGEGwxGwqQlieXyn2a/x
	hdq7tErFDycOZh/9+8MCtVYHGRiSQwbvaLlqua4CPtuV+wSFbnxj2M0JJz2mEGGFnj/4fz9gbEhpi
	l7guIVAobvhBN7CLKrVdOMJ7hzQm1UxvIHYxg+bXlNUCCXNz2ou9zGZVPWeNj9OV8Y0QFD6SbfULf
	FUDqLhNcRcGOATjNfM4OT8FyZz+GQkfsEZZSwh6ohl2k/zLuAUCwO0D+DGXoG/i/7W4YIo6CqxCMk
	kFaLFDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGQG-0000000HYdl-0z1V;
	Sat, 15 Feb 2025 11:33:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGKZ-0000000HXHz-0F3E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:27:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43964e79314so23929305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618849; x=1740223649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwU+wFyXJQi0hqoJaIM7r6tnW9Ar6H8YYGxOtFUe+P0=;
        b=g+YYPSztuY0mUZF/oOdDvKagNisKmCczXMCFp4idvV2H76CXU1wya+fqPUzKZE8qZI
         XdGcBNmLpulTIR3PQuWZW/etHmPW+Xe4ZrP/VUJd1SoLuC8HtH/qx08B3vyb6T39kIFE
         nWiedB2XU/Fhx8rxKFrN00C7wm9liZ8rMkqXMKAYIZjqDTmnvy7DfWtBuur5/Ri/R6LJ
         Mdh4CgVto/MjBKZ968960heXE1FGLkZmo+aXvD5ZGGVm5G7uRFKbqQKxJhqzaAT3PBNO
         zPrWUl01BvAM8301GoxQJ00vBqf41J0afVor4pPsrH7O0JrKJvTU1qUiWHtEarwl3kIz
         OZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618849; x=1740223649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwU+wFyXJQi0hqoJaIM7r6tnW9Ar6H8YYGxOtFUe+P0=;
        b=PBmz6Up6Fu7iiojdbGO9l45NnS9kRxAJumRcOHNxwA4GuB2US677rXApqvjOFIr8B/
         Yp3iY3AdrYMnqZTHu0ZRPv1qThXfQyb4sh5+qL2cnq/q/Cjoc9sdr2WW3JIb2oZCrafx
         cN8Bbf+8IpLTV+1STERmrvQD7gVcDXT8Px1DwXBHWqo8hDJx3gXES1dHu8BkrHzVT+gy
         tjxv5S8QcDxvqkaJHjgMXJoxWNy9B4ScOU1GOitSy/yg+MLyPbIUD8egQLznstwGItvZ
         adJkD5cB6ls105D1OeM5lckj8OJP3fbYmjy+EcKk+DIzALTbueZ1hoDYq5GQAHqOdvwh
         4LAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvue805efH4ehD2uQwwQBQ1XALeOWExZJvD9hUMWwyWdveFCbe4DB50dhwDBGuzJWlxcsx6tDHvFTqcxwHIwpO@lists.infradead.org
X-Gm-Message-State: AOJu0YyZGH+r6Zm1Vj+sBpZqcpHzopEGpp/T0fC+rdGCyt22mry06xiJ
	ZfQdYS3YIvjkhUnvR4nrPDa5qayCWDmaHSgvzxNlEiPEfPeEE3DmVtkfYw==
X-Gm-Gg: ASbGncs4xuIGpaAxlClqX6AqIjOMlYTsCWj1a0mi4iehWNNvGrcP+uvLWR2vjcu6pul
	UE6xjuYVsb0kQxd863wrYLnJrq+gmlpfmJhPSyY9dDLgOTO67XPEhDmVjiDiD8sOdV4SMT35kpG
	0r9839LpfQom+RblVZBvU7RyHizfPkBcBdoKmUuVl8iir7H5ng5Qj4uwn0UBetcskmNz5vVfFdC
	XNqLtpzrcB30nENMUZvWTSkFsagWakoEzFH/7L9YBoUEncuxxkzCldCdBjquMR0VZPH5jnavtw1
	F4CDvvTjSbeYfiNdUtLVEZBRkio8KNzH+cX/1ck7Qvmm/zTf6WC05t7ENX8T70dlWxA=
X-Google-Smtp-Source: AGHT+IF4n8AmOTtj+1S5OjZ4itompRP3wfOgr7Fs28mEciaJBF8YijODsGkRdhjtKcnPESQs3h3Wjg==
X-Received: by 2002:a05:600c:4f51:b0:439:66ae:ed0c with SMTP id 5b1f17b1804b1-4396e6d7b5dmr25896605e9.1.1739618849145;
        Sat, 15 Feb 2025 03:27:29 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:28 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos2200 compatible
Date: Sat, 15 Feb 2025 13:27:15 +0200
Message-ID: <20250215112716.159110-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_032731_096425_8BE55FAB 
X-CRM114-Status: UNSURE (   9.29  )
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

Add "samsung,exynos2200-chipid" compatible string to binding document.
Since Samsung, as usual, likes reusing devices from older designs, use
the samsung,exynos850-chipid compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 385aac716..2a7ba3bc1 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -22,6 +22,7 @@ properties:
           - const: samsung,exynos4210-chipid
       - items:
           - enum:
+              - samsung,exynos2200-chipid
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
               - samsung,exynos9810-chipid
-- 
2.43.0


