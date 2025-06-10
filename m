Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE93C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=; b=aMJrU8Pu36zrAnElROB6YCpkur
	7/DiPbxyrI0JqxE6spNNzv6UISTSNw/GNm6CiYp2fja6ixXvG94LB9U0QqlYw+SOJ3prZy3z0sqER
	yhB4pF4zapamaEfMg6eAYqBuxcV/MZW1A/e6hlcsYRUlraE1vgriniQ4LSMCEM385c3QwVNQCgjdG
	zAu3jxNd8igwDmgLKrGQlo5x0kaL0TrGPIDmd6eCy64JJ3cOzj/4DOqyB+It94ijJu+Rw5gN826JX
	Tiv7ZkkUSt23avjz8tGQkuKGWjm0/23k5bZ2U/zHwgj2UmRXdREoS8i+hIt01I0h5ZgX6eoAnwO3T
	X9iSNvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOysH-00000006vxW-0VD3;
	Tue, 10 Jun 2025 13:18:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxuo-00000006kMG-1SR2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=; b=Qao200OxDhtSK3b9rPzmxEmSnv
	O8hRmhaKYShD3RlmzIH318a0l6ZjkUOucB5Tq0/1UJ79A8AY/Tzrmb3NmZENE9BYzw644CI+zDGus
	vKWaukmirVgr0QDS8P1N8KJGG/gpW5XgxUy5dhyQaiY9bTmPSAJm5/R/dEc/80B5OwZUB9jqdaZmD
	hs4Nhu+oMUFNT6IOx/EUx3NaxApZneyPkxqfZ46wKA51Bdj7xS6kHLuGKuURQu+Hit0PA6GjC4aZj
	QmHKPUAcNPE5BYc6rBg39E+7hxN8QIuoIuaAnF071dc+kKj2oRPouRncaAjdXOR2RpFhscZgYhieO
	GRSh8iZA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxum-00000001nqn-1K3c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:17:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so65585515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557834; x=1750162634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=;
        b=kN+Qc7XkKPQVwosw5fAP8SO91tluas08p689DCCM2WHtL4IPuCBJRBpZAO+meSFoWE
         CLHFv6v0QzXKUjvy7HlEUS2ZjFCKDPtsWhapDHoQwdrGI5aP+/cTCUs1gn/fgL5Ade9P
         l9vrvS9wucZP4GyBhEffqXvKhxbkyPG63cMMCIxrkSW7p3cjVP3biuWkAvnZAot3adSZ
         CUh/VHzCeegEO8Tq3eGv28OGdO++Ci3h3A05cmuzOxsqcZ7gP0IJqGMhMz4Ze5MSkJnO
         nXN3N+xZF/qd9QUIgM+YOFfiX1LM7wmefgTE3K8qiBwozX2gZKpcWZGu8Rb7z14KZq9+
         +ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557834; x=1750162634;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XF/JYDT+HfRIqV19ilVNVcOBNpam0ApFQn/xVxr2toE=;
        b=X9z2mnjecAOvCRXGO1QnwF1GqisSFnYWhc/ntWlAi6wRnezFTuXd9FcPF54oR/TSsH
         jpj9wbTq9MbcNxGk9WxuQaRoH4ZznPX5ZHcoHFa//YtFI20ivkVowQwAPZbSP9ZDihZV
         oi0CbcXbsiuO2eUZH/Gue54Vdap5/1s45JgyzQh5XnffLVGzcWz6hmbaNkWgBUcoJw6L
         M7vFKrVAESugVBgHZCXQy123nlmcdtZ/6n8mnkpKVpTQ8Xouv7vabfAmGghETeqPYhZP
         nBpttrpmP+q/NlZ66PbAh2rwNbjxtF7Cc9q+ZA7oALCuFzPmvBDZL/ctyooi+bMQcd0d
         TJDA==
X-Gm-Message-State: AOJu0YzR2yMF7c2jLZi6qe0/8m+w4SL2+LMWSld1A5ATZMqcl7tmQJsd
	O5CghL030GIxuqUTHjQEH0Cdw629xtwvImEXMlh/i9GuJLYkxs9JhSgE9BM8Nahm0xo=
X-Gm-Gg: ASbGncvDiaPdWg02z0XsO8V+7q3BhOk7uE8pxnLqRZuealVaXRkw4kTQpzuysYxm8HV
	jDHoTVrEwjkR6qMvCIoahWoRuR+Ig5VHS+ahmr+WRipafP/uveHawckJbAD+wFZJ8jG/hS2aanx
	uElUtDxVJ2M/RyPY2adco446EFM3jPLSJmCKUnZUrl6zCe5VsZ0ZobYUmzkNiNuKZBbbV2nhctc
	8cPQ3p5kSMGqEEvRHkhHXa+39gf7iTaBaxMol1CEyJS1PYp6//FEwlBbVvLfmhzBbHx0RfWYGOL
	RJwy5L/oJ8nrltT72tuTa4WFJ1hfYTYZhj3fZVxZ2erN1trKjCF3Kf/3cia+CT1yeEd8Rizfl3I
	zEz3bnd4=
X-Google-Smtp-Source: AGHT+IHQU4XWWHJiWTg8y6CtfrBTe2VJBO0sJZQtUeiV78bAOi8lkD0/5F86KXtfRgGuN6NBeD7Q2g==
X-Received: by 2002:a05:600c:54e6:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-452015feff0mr108984005e9.4.1749557833882;
        Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
References: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in
 debug print
Message-Id: <174955783340.1721274.6476762839589523329.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131716_429319_A131E274 
X-CRM114-Status: UNSURE (   8.86  )
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

Hi,

On Sat, 07 Jun 2025 00:10:31 +0200, Martin Blumenstingl wrote:
> meson_vclk_vic_supported_freq() has a debug print which includes the
> pixel freq. However, within the whole function the pixel freq is
> irrelevant, other than checking the end of the params array. Switch to
> printing the vclk_freq which is being compared / matched against the
> inputs to the function to avoid confusion when analyzing error reports
> from users.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: use vclk_freq instead of pixel_freq in debug print
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/faf2f8382088e8c74bd6eeb236c8c9190e61615e

-- 
Neil


