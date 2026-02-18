Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51C8E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIJ4sJBvPTCTKAiqjqkQeomyIzptNmJbKLz8jcJSeeQ=; b=vPHuaIH3iFGuDJQmKZJ85GDW2/
	1bGRFR2gGpMg6zS0wxI71gV8SZdcT3M+YPdhLIkuHo717kP5glki6TXS14l2eqwraZ+1r/9qwQ6dz
	TmoxevP5zAvQAwkXcQuv++F4wHKfkWDO8JPJuxYox8mYBpTwhg9vWIghNA7gwctO0S7UtmOrPwE6Y
	QwxAI15T0p3xMs2r40enOXck476gEDjixuVTk+Ny6XO6e7pIzJzAm8TajX/fKl6fqbTnXlk0xLxRs
	eD4U2UYwgBxOMuTJqJ8q608gtF6hitXyn0CkIry1t4++6nnwtHnKMFo31Ytergf0B7SJYjjigzXEt
	zZSEtfWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfkG-00000009iZc-2GvL;
	Wed, 18 Feb 2026 11:29:28 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfkA-00000009iYK-2dPq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 11:29:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59e4993e00aso4779020e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 03:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771414160; cv=none;
        d=google.com; s=arc-20240605;
        b=DjIcJXLh05JJcvlcAwaZn2O3JRRCNGpogjtZikJpng3+MXNzPjGHEqiZqjNGXxb6FB
         z3awSs0jSvTm5vGzIm0MxfDDXMkdFuEpOrqtIn4kypz130y3I3oaK3HlFGdkhMmc6Rt3
         jUQX/wv7VkPylQnaa+vWe4r5RB4kGua1PF62XMF1SjcrSngEyJGGswmGhWLBziNadlIN
         54VVhnaay33Tx/4fbpyPPUHlWooH2JD9M7mQ6YGtEX8grvUdRwMrtKA6G26giP4Qu0nI
         D4GcolFiT2j16lGLPHQxCkC6vLptWE5fYorCvV3/9d8pE94J3r+u2bPrctHXTjKRRARQ
         KY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IIJ4sJBvPTCTKAiqjqkQeomyIzptNmJbKLz8jcJSeeQ=;
        fh=TCJWS7mbEMi+M2c0CA3iOt1r9uhwGDntwSWgUQE6QC4=;
        b=Cg8tf00bMc7YZvKDRXMYY2VI99/Gph8mgnUScRIdO/izVBfJkywLbTppR1QLv4SiNP
         kukHh3a0ncV+sL+RVPHAeKCiIB2zu5qAkdyXHaCYlchZ48F/NHhwjZ7ITUDuzdK3+2UX
         BNIk+JHMQderdvGxJDV8NpIAXLW3X6DvHDHTyRBvEGE2Gs8P3TmcU16aOdHRncP/QLqI
         lkfRqb2b9Ff7+NpPdbXhO/J49+6OYvkmINpmFflSl4YPFlE+Q3wzVi+oRfQuXODvyLpQ
         TJwVkercdfCGkawshIryIl0a37/7ASnDGzP3l2eUP+4oFlyzfjj5YEsl3YGWnFnL9BNb
         +eYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771414160; x=1772018960; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIJ4sJBvPTCTKAiqjqkQeomyIzptNmJbKLz8jcJSeeQ=;
        b=B3Q7tqhppORts9QogHHv34a0rWGlH4/UYs+03s/+zFd2EVzE86r98y/xZ944/gwKgz
         ylCWyGhfWnw+943TCvpWUBLAOl23LMZgojvzXtPIyvXKQ7UU5poJc9rEvOZJ2wpt7RGh
         GTjU22f1nShV+gUd7i3T/E4LvXuyLbAXKoOXuCFRvlUgCS345IyGNvb0hj+D/sscivSh
         RR5ZSTk5tv5B5P41/hnYrGTfyhe7ccL7knMxIy4qX1OHPlt2BLASshPk9gG4o5vrpb7l
         gcAHXeq1aGvjWAy9LGnkE9Fp696xPDIVG9OAozWgXFs7oQa93/if04VXE7ctmZvEWnNP
         3ZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771414160; x=1772018960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIJ4sJBvPTCTKAiqjqkQeomyIzptNmJbKLz8jcJSeeQ=;
        b=oWSSzfLc3zlQKZeUCOAc2oRx/1S0ZXkvgaZDqSXUcP+u4oL2VVD7lNd3x3PM+1VQkX
         cJMSD63nz1TgWweqd4yPHsjieXuR+XlCn3PQNK2Xvn+CCJq80PEnhmLGzcs4o00GtKwN
         tWKVkAPuyyhHQ5ybG5MLjfuWaqtBFZ2oGpHjIvzECwza0GTsoWB68TY3sU15LgC4MExt
         wZ4P9sxU1V28U0GzJkAbYs0yoC2FC+0Rz1P2DZE2CIHul85OPP31/tPg1naM6dWDNzIA
         wPFXZtXULn4HGF2mJoqZ2O5b8D2qMhySXwLJ+VEceMnWLdphEQ4gY8izHg9oRmKyo3dE
         1Qeg==
X-Forwarded-Encrypted: i=1; AJvYcCVLWVUFdMvsSJ6V493G/t5BtPhi7/pvAOvMfk9Ldij0gpH2ketKdQB5PPbb4DfT9M/8v3pmYxxGVdNqmnU8FZNh@lists.infradead.org
X-Gm-Message-State: AOJu0YxlAeuME9TfKpd+Dv+ByIKFusfPqXAd4j1ru3JM4LRaPyqtXMKt
	Dtwmm5FXWtZh4CKwxA3S/wbFka2CK9tXoGul8HSfJm6socm7E9dXAXDVlkmFcaoLPmFX7dbc2uz
	liNVQiY2M38uaWSOJew0Emn6vDATyMRlqrX+fQE1kSw==
X-Gm-Gg: AZuq6aK6sZ1LRQgs8SxbpXuy6s0lM4+CzuZ8PUv5aqo8DhCS+WQ3ePbw8/8FkaK8CeF
	+KJZGLDTQesuG6CDxIVleaYhDYylvDrv7Le7ZwXnfmJcl90E+JhAbLYrMYSQ3xdCwJaFVKTaKKz
	TVMfHvUSmb1vBT6Lw2a+t7QMv6r8ga3lD3U0wSVYsMlNaNTdNmhmFOteFvN/6iFev8o798qNcFl
	i8vZ6mXiya+tVL747CKMy/4Xen2pnc592szCV+4hYyJq13pntS4PTMkvfVSiBCBGeYU/bkUQLaN
	gmo5GMKC
X-Received: by 2002:a05:6512:3f07:b0:59e:5d0c:ce with SMTP id
 2adb3069b0e04-59f83bbad80mr515595e87.30.1771414160049; Wed, 18 Feb 2026
 03:29:20 -0800 (PST)
MIME-Version: 1.0
References: <20260216191543.2514647-1-kamal.dasu@broadcom.com> <dd8c6277-9ca0-4d9f-88bb-362c5b96843b@broadcom.com>
In-Reply-To: <dd8c6277-9ca0-4d9f-88bb-362c5b96843b@broadcom.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Feb 2026 12:28:42 +0100
X-Gm-Features: AaiRm53qSojgtbY0tqDCYOXdN2UAIV1pZkOA_ObLi5mp1xNnSnfgnFwgFfwwVvI
Message-ID: <CAPDyKFprVGSu9DQAC=8d9sOCVQPuLFQmfeP9M8osxwijO3t5rQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-brcmstb: use correct register offset for V1
 pin_sel restore
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>, adrian.hunter@intel.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_032922_715160_EB9813C6 
X-CRM114-Status: GOOD (  12.37  )
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

On Tue, 17 Feb 2026 at 19:47, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 2/16/26 11:15, Kamal Dasu wrote:
> > The restore path for SDIO_CFG_CORE_V1 was incorrectly using
> > SDIO_CFG_SD_PIN_SEL (offset 0x44) instead of SDIO_CFG_V1_SD_PIN_SEL
> > (offset 0x54), causing the wrong register to be written on resume.
> > The save path already uses the correct V1-specific offset. This
> > affects BCM7445 and BCM72116 platforms which use the V1 config core.
> >
> > Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers during PM")
> > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
>
> Late to the party but:

No worries!

>
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

The tags added to the commit and thanks for testing/reviewing!

Kind regards
Uffe

