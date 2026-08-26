Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FADFC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E527r35PH3U3M7/ba4/IfQXpLEJINpkZTHz2CHClcLI=; b=2dxQi91fNyQ0adc3/jAKhv/eqr
	jlvKL8CP1h31/63oeiafsaoY/224PssO/DX4xzJoUF96aOZqbNDfu4xktjNOLZJSZwe8zDioeI1/u
	moN1pTZlgmARj2hrUxUemfLwBQQQwPup1P2bgG2RnkMxRVlAWEJmQ5rPCimdZ+giEE/E5J2ugxAA3
	2Ma9kn4qzQCGd9IPHqipjWZdEO8KuaunJQhoPvOAm+3FXRp80u5LTWDXX/DCbskbi1hc07QaxMPLp
	1+8FYja9+rSPEBItIdVHqUc/dWGQSVTxeRYGG3NthKNZZ88olKLTBTlnsBUoSAw+jnttRLDf5wP/r
	LunaoiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8cE-000000022xL-0fUO;
	Wed, 26 Aug 2026 08:04:10 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8c0-000000022vP-38hH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:03:58 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-66d1663c00dso553270d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731435; cv=none;
        d=google.com; s=arc-20260327;
        b=mtKkra1++jGEjRIdSx09IgCd4vBHwEP1t738a5r2j+lmwczHYG0dagfF39rar8KIZJ
         WdWlawSuM0TkSENmgv69yNUlOdMA5794o2OwGnZEFGHBSNwNteuIkBOF3zPzYYSpmdtT
         V2cRb+4Hbrw+uLVSZSrImwO4RhHau19z6zvZ2CxQt/HzNDKH0JPhRftOTMUe3/Z2x7xx
         aNdjNtXyc1AAFGWMCQ0uGZlDuYdazHv7Q0xkKr1EwHH8sbH0fNfHCX7SIN9MFu/A6GqH
         6EuPVjMF9qncFaJWjKZuLNTyluaPuruUSqdgCXd+1qP+QQrdPiuAfOHr2/W/nrdVXOvG
         3QCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E527r35PH3U3M7/ba4/IfQXpLEJINpkZTHz2CHClcLI=;
        fh=qMYOZbPRfXf+t2Tq6cLuA+S2WbcruJEAilN3f9KZ5hE=;
        b=JShgj4J8nDu7svTU1Qp7QHn4CGKqhv8lMhYpzxKn9Kj+LPE9GsAcRk+sTufq5FcWGb
         3iT+0efNyOObQCPxzUiuIjYzaSATYcKRAJlEw8H0RGAfX45tEdwnWJM5lkK/rPW76ofm
         DhOcGnZrIan04qTCyerHttL/LLCWiq9yPPJVcgPoZbLJ4G0rzbyjIM1x97efcCwtMwHn
         zRBpbd3O8G7BsZbMR0oFDmbSOgRPX4Fcgm6jgxQF+2rZNIvAJS7Dla1a26SIJntLFXwQ
         TcDDgNn7sry1pcHCrz939Kh/R7uwikgayd/ykdvq9QHDgQ7rw9kkcMinvW4vtMApivQF
         o/LA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731435; x=1788336235; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E527r35PH3U3M7/ba4/IfQXpLEJINpkZTHz2CHClcLI=;
        b=mOFXcN5V3OYTBGaVevwn5P+UbL5vtvWanz+0ECulDqHBQW8hDK9MS9MbsPk/6YPpCs
         pMUHTGQzdz/M5pMc2pGgWv05VT8DoqsseSUfw01sH3TNNzFQwa5w4HspGm/8Eqee4Z6k
         E2hc491iHyBH2Ndd78hyWWmzqjwikgN3AtJmvCziSbsLqIUG4bYx1pbGPmb98lb+h2Vp
         q+lVlM0q/SB76v9YPzFxd+u20+7ct3CZAIccElMIBGRYxXRTi2fyPu3V0npWkINCo4Ms
         oi56YJr79VoZCBygHVL78S5aXP2DbbQv5LoOr5f+eWkonBOH0jsW6mn9Br1BNjGxRtSp
         iQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731435; x=1788336235;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E527r35PH3U3M7/ba4/IfQXpLEJINpkZTHz2CHClcLI=;
        b=kmnoEW+Z6CNSl1KhhmkxJ6IoVeKfNhOO+o6Q8TXKr7n/GOmFbefKW18w+fMW15fyOc
         1J8K6eMOSPvWKqN3mhMPn/Z2lhZxhZMjB8KLNi248aQ6xkBfMY9JN+cev5J4K3NnbMHj
         ZIs83W0F/x8VNyRKlPHBmW9lJ98G3SQ7JIMQx8kTCl7uToim8WiiABQdSkOjfohr5Xfx
         /dMa8bSPIQXLSbGhtYOUceXbseNdDD0Vv51S2VAroO3s9qpuVlhLZp9sOIMX5lf0n30y
         EuLbmKpBHYAI9Csq3o9CVa91manTRLq7VALWOwIh4zYQ8v6oGY1VfIEGt/1/VLfRfqbE
         z88A==
X-Forwarded-Encrypted: i=1; AHgh+RpOsAD+Q3hgkOTwWOE4vbygMeWJCsAwF0CXcHMZE794zr6BIK0v2CH+7Y4beWQlbt4Db6SWZiKb5OVWsEbZ4Dml@lists.infradead.org
X-Gm-Message-State: AFuF++minJuuMZuNv8nokgiCiMdAxsr1kBpSfdDGklXAHNMWslcFqxPY
	W4gBa4XpBv/qDCDQT1DL4eYCY4aILnheD8moPgO08vgkgxH4zdYFVRUjEGyfCNQHcm1puRz7NiF
	r+jiXLpVI+YAhht0Er1Vh1MdmstYefpk=
X-Gm-Gg: AR+sD13raKeIBpO/gMhSv4yMSPKdqZN4YLd38gF2wroU8I+3Nis565GOXJwyfZQ+GaQ
	8xYlPBUX6l9HwrVoE70KvPfs5nFAEez1a2Km9j8y7qJlZqwwuX8Zls0Dy23yqi8RWRXfJgfShDf
	nXgzLfeX+w27zBdqfMATAoql60W5oo8tW0CCrUgPw5uKMF+BPTrK5btw0Z4dSsZr2WEg5tSm/k+
	fR2U914p7cptgGqhhcFka+Iz4MbTz6TN++pjmpONPYfWf4gPq3/gFBXOUCQ0dUQvaSP8KFXayCa
	y6Q5XcH2aSrJvY21dx5UJ0UjTW/J+40rD72zYQI7PyFd4kk=
X-Received: by 2002:a05:690e:2455:b0:667:f3d7:eb35 with SMTP id
 956f58d0204a3-66d257691abmr1344105d50.6.1787731435407; Wed, 26 Aug 2026
 01:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260808121752.2819486-1-lgs201920130244@gmail.com> <626c4fa0-8e7f-4ef5-a027-b6ae2aa36099@kernel.org>
In-Reply-To: <626c4fa0-8e7f-4ef5-a027-b6ae2aa36099@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:03:42 +0800
X-Gm-Features: AcwNN1Vol6DpYyKDV-cri24sXXF_Z7PWR_q7g87D7ApkpF8hGkZUW9sBryzNqjI
Message-ID: <CANUHTR8KWSjBgV0QSAeitKKoLL==fMkpmcrZV6Zv-LBYNz-vew@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: g2d: fix autosuspend cleanup on probe failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_010357_482179_99BA191A 
X-CRM114-Status: GOOD (  21.31  )
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

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:49, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 14:17, Guangshuo Li wrote:
> > g2d_probe() calls pm_runtime_use_autosuspend(), but its failure path
> > does not call the matching pm_runtime_dont_use_autosuspend() before
> > disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during cleanup, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > The documentation for pm_runtime_use_autosuspend() also notes that it
> > is important to undo it with pm_runtime_dont_use_autosuspend() at
> > driver exit time, unless runtime PM was initially enabled with
> > devm_pm_runtime_enable().
> >
> > Add the missing pm_runtime_dont_use_autosuspend() call to the probe
> > failure path before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: d7f1642c90ab ("drm/exynos: add G2D driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo

