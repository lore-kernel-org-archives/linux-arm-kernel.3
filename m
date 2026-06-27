Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF6BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 06:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0YInxvP9vIxrkKOfsq0a9A7RdBzE89fDRN/Cs8YIhM=; b=WUU0JaDaCOs/APx9nt1MfnRsJP
	kM5fgj5pAuvMkhvhcGvUR9QbbI8TAwm4yNufFvN8Q2u6fqlYgnW4eDEcKJA3bKrvNKwWl+5hREKpg
	/VQ8sbfcamyUnJWL3P07bTeTo4DKMUslJdGNgQ22i59B7rlgay8N79e8dGD23LaG9L4npN76Fu0OH
	jvaBaQe+EWuwBP7wMSrNs80fTP2D1qK4y0JaUKdXWSYhkhdTNkpfb0B8FcdqGUJ1NYO5HbrHZuMAI
	C2pIlRGrz042wAKiSLFej3xU2s/FdBra1sh2FRBiFOuW2M9vkqCG9uQDfFbWA1oUUTB+uo0mISgAt
	7Uvx8MYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMwa-0000000CEFE-196I;
	Sat, 27 Jun 2026 06:55:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMwX-0000000CEEn-38l9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 06:55:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49263703c6eso15848255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 23:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782543307; x=1783148107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0YInxvP9vIxrkKOfsq0a9A7RdBzE89fDRN/Cs8YIhM=;
        b=Qu3tDntTHzsNq60Ml9CsFEqHbrZ4nXIe09bxXou5+h3RTX+ffYAMZRC6nHR/75nEOo
         x7yQR46qg4/WOfOg7THEFt+RxQP7kySk3VJU6iGSYtw156usd4U5ibVUYG1A2Sh2S4wc
         LcJyRUXHyZl+lCqwUKF9BHxwY5z5eY9utNiih/SSzaf5eGsgR7qg9lPAJYWgoh8SCHbE
         HuLv48+QCTDwX2h2FUNMg5NfT8IoYFDXIuG44pQ7IqpeGUfTWOu8BJNloGwAUKzwUdpU
         Y469Bwg4XMWJNSHlSqK8cHMcU+puzSj7m+d/Z6FTavkcUJCeGXqtfQLm1d8OaHfDE1nj
         CRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543307; x=1783148107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0YInxvP9vIxrkKOfsq0a9A7RdBzE89fDRN/Cs8YIhM=;
        b=KWcobUYzyFHwzfA0hjeyTGDseAozR+If0dW84VfkToQZPf1TJ4wC+NccP5Hxx2IT9M
         FnOrHtf0ag35liGG3fTN56zmohF8KLL2xp4OAjkKXgWuLwGzURbLJgnO8juthbW5FCnL
         9YsXTo0w0lpvClfOc3/PqTsla+pcR+zGmgDm4NQP3Dnm1p9NLN6wwwxAzyFrI6Qkiii2
         t55ss+DtWrcT4Gp020gyxWRm6rBepyHmPzCFdKSwgv1yPtI+JPhiNSgj+JkAFMHG/X7z
         vYHTOM/hfYHOVLfBMxHkVO+IFINSEkXjVuRFNZ6KLLXsFigIehnV9YsZGPc/1RJ7nVuk
         BApw==
X-Forwarded-Encrypted: i=1; AFNElJ+iGzQcJTiQCEmW3iL3awsmUrGX9EWRcXh3JVGr/pmeUpxrbMHJWkZ2PgzjSWN3S6NIgnKjVPK05RJNnLvZarrl@lists.infradead.org
X-Gm-Message-State: AOJu0YzA8qthXYAQq1Yp57hho5yHrF2wgeCGgOYV/UWBEXkN85zjhEmx
	+Fep3hE4LhGTBH4ONBh5tOfsB5JUu7nfMFc+WJcfRCFyzhp+aeLArPS8
X-Gm-Gg: AfdE7cnaIvisOjaUlEHz1P95dPxuXQE+75XBA5Af1VUlT85Xabw9bPNxqvLhYsZnJ5C
	0/fFepUa5FmdjKBhex1bGb7k3PcEGxlTPeTZSWsRXkDjtW4HYjB9aksNGw16s7Hr50kZmd8JyIr
	JY/flcDnBEByXUMukl5eH35ZhxddPAQJsyD+WPuJHd5PwIR0gesz9BCxFEaiH1aW6UBjp2VOyfR
	D/q3iDKNz1nU2PHPWpUtVfiLoyVlopERFipOpTucljDTP0AGPRz7Dz2e4gx8xArCao1vPA1Nije
	K51ebenpj+Vam9ytOo98ja4WpKfaslMOTK2YZDSKu90OsjVJ+Io3mGOOvOF+87Pc7CQImdpzxx+
	bY2F0OpOwQpc9xQKRkEKCnOrxGwibBwuu/fNm8ANXF0QzPQVKmUjJKav45ifoMg21QZicHuSiC1
	O5NdfNAMiX400UwC7UBrOMDPxB+hD5+Q4mfXRNzvB5N3dQoHaxLZ0B5acv6nAAANY8Ng==
X-Received: by 2002:a05:600c:4f8f:b0:492:432b:d78b with SMTP id 5b1f17b1804b1-492668710e2mr151774915e9.15.1782543306582;
        Fri, 26 Jun 2026 23:55:06 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm69037185e9.4.2026.06.26.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:55:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, Diogo Silva <diogompaissilva@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Diogo Silva <diogompaissilva@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
Date: Sat, 27 Jun 2026 08:55:04 +0200
Message-ID: <PMdb9FVETQuPUnyh12NM2Q@gmail.com>
In-Reply-To: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
References: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_235509_820916_67AFA23D 
X-CRM114-Status: UNSURE (   8.56  )
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

Dne torek, 23. junij 2026 ob 22:34:40 Srednjeevropski poletni =C4=8Das je D=
iogo Silva napisal(a):
> Simple KMS helper are deprecated since they only add an intermediate
> layer between drivers and the atomic modesetting.
> This patch removes the dependency on drm simple helpers from sun4i
> DRM drivers.
>=20
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

This doesn't look as useful change. Is this tree-wide attempt? If so, it
should be done in one go in one patch series, coordinated with DRM
maintainers.

Best regards,
Jernej



