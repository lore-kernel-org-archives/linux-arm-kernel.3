Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB61DC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uf2R5y6Fxk2ATvMgWSnfDriG/hCrxIHMSdfuHilVYAc=; b=EU6R6YBfyqN8MOMZLF0hWGWbn/
	SQXPvZM9Tpq3vneZzQWgWDe5loJvczihP+5FtW4HT7KsVLKNJ55KOQkQWUY43A/jw34Uyi5z7UeLv
	2csBkaRZUFYe1ObesOHO33u/KsAkn/5iGwJ9H56sAoWEU0N9tyC57R0HKfPm5FNp2FX8D15rUqaz1
	riuTPAOnokmxhHrPXibZTKJjqwerXWqBi8mjVoG0pm4qf5/aOyk1scdWCsRaMMuvbsWwBIQmJxX5w
	wfzTyPjnlwi/4qg6SOdqqWqxhqi7dhO59wBo+/bXEpuFrAkWqakOLezaDY8FgRbogtkdIk14FjWSU
	EG9c++8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8bL-000000022oc-1rd9;
	Wed, 26 Aug 2026 08:03:15 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8bJ-000000022oF-43QU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:03:15 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-66d1663c00dso552357d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731392; cv=none;
        d=google.com; s=arc-20260327;
        b=fVMyrmSc1wAByhJ0A7D9RGAjt1BKT6XKE5xI58kZUuc9m0JGYMFUCvMP0rIl+0lO52
         mBJLuJeaNzhV95OJVuM7Va9Z8t+4zThbRRYIDJqSHpy2j+OYyZCc/TbM4ii/byGUNmqH
         EUS0fZUlaY4kv1fQBQH+oxwif7Qnlrd8M1UdtzZeNANI8UCKWfxJi1/DMtArptzXyNgV
         T9r5ca7ewQyuybJuNsZak54YYT8ZBDlFKC0sfB8bTxbHdLI6HFiRd9QQS1zaeG+tkhq9
         JjzS7UHYLzRwUrzFlvx7AcMoNodfo49dSnFCLvNxvMJHeN2Y/gXKj9OWFO92Tkx+JnnY
         LOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uf2R5y6Fxk2ATvMgWSnfDriG/hCrxIHMSdfuHilVYAc=;
        fh=jjpAbA40Yt+Gb+MkZwU6H5Sxw4E0TBgpx7G8qDWSdLk=;
        b=OwhcVMifWcFlTkyU7ov454XqKRoIl6U8dADcqOndvcQH3b2/3Wd9vkmelNDjRz38fs
         vOiSp1PTSWHgQB0uKMdPyNXEgRFWuMMdYQWO7+OThSWtjT34HM2FGWNbm9/n++qUjDYO
         acikjtu9Hinek52t2vLVUWzqJS6Mm94QMrfNv6u/mjS+x/sg9qVG7PX0zQjUjw89w5UX
         fvNBlVvtVEIJDJSVT7SO4l0wmfctMXOkg+etd9jfpxJNjTYXTWRMAv1/0Ca1GY9Uzl26
         LkkRHDDAVYpX39oM3kmFPikOZOrfYBLPFOQNq1PP1TnDp9mWve+Tu+zDJ57SE9ScZpHK
         Ba1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731392; x=1788336192; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf2R5y6Fxk2ATvMgWSnfDriG/hCrxIHMSdfuHilVYAc=;
        b=MVmlx5GBhNg47y2kTwieF48QgougFggwIE3zcbfilsIrd/TclXCoMWJY+6vw+zRcU8
         EN8MCkJDs1mND11KwCNngNoYUlWOpE0DdoOQ46xZICWdk/peNp9R42ZqUTDmoTiTaRNZ
         aXk1wjT05oWkKW6udkS8teCDsBbUtMEMxssAIrPSdiINg3S5/4UoRi96qgtl2J8xYJzo
         gFHYc86894pKu4m/qGz6bffTVhE6QP40uIj373Tuq0BK7XNFFOVrmjxOJGjURe0+8Uo2
         1go7hSy7ylxiOurAEOXOzzfvlYJZze7QljpsUhg4aAyLwdL2V9O8dIDIvAIx/Q7aB+fg
         aaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731392; x=1788336192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uf2R5y6Fxk2ATvMgWSnfDriG/hCrxIHMSdfuHilVYAc=;
        b=nzzYvoxBb17r5h6TBrvhhyeRpVvDoEBDsSuVCjK8Fvw5+p1KEyypD+9EaLj5uWyXEU
         W/sOAehPQazmcOxLIzo6Lrr2tlDWXlfRryY75eelYsxb59OAYwBdi1+FKW1+JNciPDSe
         Wf26Csxq9w2VNJaXnoHVhl0Elgj33ptibkBnbNL59EbBveCTB88A2HECc+k2Db/GztaY
         NR6GBEKP18kOJPMJSzwAX4WJlr5PV+FFUU7FkP+tR6Wh0htMZLoiAajtbGT7bSTuwKgG
         lC1Fm0Ek+Uu1OaKYqJ/J2yy7uNqb3AiVCN4/4nU7soG+aJP3s6pJ/jTm+zfnbstm3RZ3
         KGOw==
X-Forwarded-Encrypted: i=1; AHgh+RrXS05/JJDVWZUeJJbbq3uqhxwvPFu8BL4oXyINmClRvPhvfDTb0s+U9zwpapfCpM5ZGKloIAYwqDOgtYI3R0xg@lists.infradead.org
X-Gm-Message-State: AFuF++kC2kNXcncc4h7lREgRxEWmaouyOTg8TD+Q4dbTwYMuoFyvgOa9
	0hFFG7Z/jS9gC1hiYCeJp9DjzEarEXXcSihYE/aihvMgLxGPe542QSQch6XvPg0+af8o6oRQeqR
	Kd3F+GHVThq79prvHGOGshXtuHdBtOyE=
X-Gm-Gg: AR+sD12ZPjIkawUvV3F315cZdwpa8KdwPPJ8NpSm6cObLzsuHUlZyBzAL/gsCkyvf8V
	17V09sfCLPpvZjeEoAMwqVcSuGDaUjv609JVEZNkMq+UKWX/HPhklAv9D0kEqRBoN5GjwZzO3zH
	d8yLOolIIiBGM0RMHybNhFJaNvNr4ibGCWZfLjoKrQ2gRgkn5ppHP7KlZLgVUnE7BdjKo57rPH7
	9CSLbJA+GlzeEK5yugrX1y/cutb088act7zxPx7DlRxWJy+YxtB5FJYlsD/s870llr0Pv0652aO
	p3NecZ6L/RcrluBjQG3WStB7w+3iGPnPBYnAkO45Yay3tN4=
X-Received: by 2002:a05:690e:708:b0:66d:fa2:63d0 with SMTP id
 956f58d0204a3-66d2580ca29mr1093286d50.50.1787731392131; Wed, 26 Aug 2026
 01:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260808094114.2750088-1-lgs201920130244@gmail.com> <822e98eb-8e08-499d-a48e-bf39f985c524@kernel.org>
In-Reply-To: <822e98eb-8e08-499d-a48e-bf39f985c524@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:02:59 +0800
X-Gm-Features: AcwNN1UyKWn6NmN_t45sTti2vw38ypw6BLs-mDluZkOKLJ35A28L82oBP9VRI-M
Message-ID: <CANUHTR-UfWT4gw2EZZrYOrOjdwzpcJVnUM1WbkZa=MyR2yDfaw@mail.gmail.com>
Subject: Re: [PATCH] crypto: stm32/hash: fix autosuspend cleanup during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, "lionel.debieve@st.com" <lionel.debieve@st.com>, 
	linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_010314_052280_EB242F8E 
X-CRM114-Status: GOOD (  18.83  )
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

On Thu, 20 Aug 2026 at 22:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 11:41, Guangshuo Li wrote:
> > stm32_hash_probe() calls pm_runtime_use_autosuspend(), but neither the
> > probe failure path nor stm32_hash_remove() calls the matching
> > pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() calls to both the
> > probe failure and remove paths before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 8b4d566de6a5 ("crypto: stm32/hash - Add power management support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
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

