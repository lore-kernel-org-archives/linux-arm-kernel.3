Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CB7CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VxnEHAFTLBwJjm9p2k/uUVQ9xHF6FgWwcXARdXtVLE=; b=HZ4Ak+tb+PG2RKpZ4O/b5y3hf3
	b3/8p+pgj6Ua9TJYF6hKEO7UR2UqKh7akOPiR6apgrAUcDZwzv69E4vxxjPJLGNDR/H0qrouC/sdG
	ZGr7lmuVfMCuNvEw4clXbJE/XZYj+Xby2FPgfkp3OyiGL/4rWJKAdOSRxuFbhvWpX3MeUDVKJl0mC
	rA/j5MJMKr6Qcob2mrRqqBQfVad7sQcETLOzRu151AUXVfmNwrkD9sw2/CXrxblVRji3nYnbGibnM
	Rnzbr3pp+7Po/2msxF5vloB2OWTLkxglPr3hmukw5v8NLrwGD/ym4zxAQ1bvSBAEGzPCTyaKPXTJu
	9FBO6K7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAbI-0000000ADDf-1nJi;
	Sat, 18 Oct 2025 17:20:16 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAbF-0000000ADBg-20R6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 17:20:14 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b3c82276592so54564966b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 10:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760808011; x=1761412811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VxnEHAFTLBwJjm9p2k/uUVQ9xHF6FgWwcXARdXtVLE=;
        b=dq5G2QJhmvRYh9OiD6DKZfr2wEXwj00MJe1cplddDvzA9zpG3tUanCX7hqbS2Slvtj
         cw8ewEQBFY7JqjjcSos/UK8r4nd/8itnTR8g6a/TvOtaLLWKo6Grn/fgBrCmxTMQOQNe
         e1UiyKlLobWPFSULCCm7236Zy6rGTNbFfQiSb+ba4+f8J6QeY0IpuaCE+wh7xnY0KbCt
         ceYXgtFnyBHnyU/+SqV0c+22IbgKgnhLzwV4WbiORZtPgzTRfEk3pWtyRG639fSlDfUq
         +ruQYoHg+IiKtp6PvqVZLT6+DjU56FCsG+Gcvle+MvhQDbA4k5eVmrKKNBZA6otPK8LC
         00GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760808011; x=1761412811;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VxnEHAFTLBwJjm9p2k/uUVQ9xHF6FgWwcXARdXtVLE=;
        b=Z9JV/s2F4w+K7kR4BsnJjgel3Bpjx+Atlk68C+vXcFaQUSuOXfOiyBIfGPJU8J1PFH
         88Gh6lhsxufrWop9aV+Ylv66Wx+73mFORqltCF10Gs43276U+ICRR4e7bkz4pMAtHKvk
         1JYMjTOJwFpK/VsCXLScvQIRFUkkW4ofK/lDPOlA9/AMxVwYjmgHCWb/z9cLoZt3LVNO
         eEVOTcVooQSDJpyyxZMpTjMuwAmY9F25Mro6EB1rmwacjAuxLaUiapvnvDqwp+lOmS7K
         n+WnDcv9g42/x6vLGDai6d3upCZ0iuIcq7TaiTj0nur0/AYeyUNBA/MExIGrW2Qg7qQ+
         bxHg==
X-Forwarded-Encrypted: i=1; AJvYcCVC+ouzUqb0DJs+10IAScuQzBNeitMdKpuIT/X7ny7Iktk+T+f6xe0MSDfVXq8MnFz7meNgCU4opSTBIjxEDuCi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/eR43aavpHDzyTj6RxDiNNEfZ7QholnmWuVg4gtoCwlRedzLT
	3FUe81kiEB4jozt/GVL++AvBZyrqR2k/8v9/zeZqdniwMe46RxL26g8Uir07Zvz3fJ0=
X-Gm-Gg: ASbGncvRnhvjEfO+BGI9zVecV5HdyajGThBbl9BZRqRflxIlX/ynjCVdS+iCPfbhKRy
	PLlv/KRGofgF+9iAOyduoweRFcrU7GCytggfmkKWj3K9EkDp7A/lUDht8iNt3Pg+EOoOTAwxpz7
	XhPuOkvIyWd/wU9+CapFAzvZPNHSTyDe/E3YnZnZ04IYM3wrl9J5Rbe2vIEjHF4mcKoq4b6Zf/Q
	q+OdIlG1yijIwvPOySuykRSyzJz9NA3ByQb0fWSwDrD0tXsrt/USN1YP+4ZyRErVMd7J9Ar5wRJ
	ZExaPxuQuYccrLZV/zgih1LyNrhZ7Z1j5Ah+9FMWF7T/BmygPXtKltzXHkYbrZpzPazVu1Hr0qS
	rqX7RZQCgsXStF+gjSTAEguPd6moY09QY8G3t3akaDGp2O4ifzMNv6zVbJxTlg7s5fKei15yj9F
	6cajY67oRSwqFYi+uSmD4qAiD+y0c=
X-Google-Smtp-Source: AGHT+IGzjn00W+axM7EzxH6402VlIDI5GyxjkBOsZamKlExZQPJ2gmUxiR9RMhBcQN+CgJFX6XHGnQ==
X-Received: by 2002:a17:907:9407:b0:b63:561c:aa28 with SMTP id a640c23a62f3a-b6474b36a30mr495141766b.4.1760808011555;
        Sat, 18 Oct 2025 10:20:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bc7sm280666466b.16.2025.10.18.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:20:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>
In-Reply-To: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
References: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
Subject: Re: [PATCH v2 0/3] soc: samsung: exynos-pmu: gs101: avoid SError
 for inaccessible registers
Message-Id: <176080801030.47136.7288147057248506381.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 19:20:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_102013_540547_F29E6A59 
X-CRM114-Status: UNSURE (   9.37  )
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


On Thu, 09 Oct 2025 10:31:24 +0100, André Draszik wrote:
> Accessing non-existent PMU registers causes an SError, halting the
> system and rendering it unuseable.
> 
> For gs101, we can avoid that by creating the underlying PMU regmap with
> the read- and writable register ranges in place, because on gs101 this
> driver controls creation of the regmap.
> 
> [...]

Applied, thanks!

[1/3] soc: samsung: exynos-pmu: allow specifying read & write access tables for secure regmap
      https://git.kernel.org/krzk/linux/c/1fce7e4d6c42c8164e6e36d8600e16663066c1b2
[2/3] soc: samsung: exynos-pmu: move some gs101 related code into new file
      https://git.kernel.org/krzk/linux/c/b320711e4c377b0e2ce0b296ba9485cf3f9eb10d
[3/3] soc: samsung: gs101-pmu: implement access tables for read and write
      https://git.kernel.org/krzk/linux/c/8b9cd112f1ac8d72244b189654e693012ea8dfe0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


