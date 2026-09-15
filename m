Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4DBC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=; b=0BkRI/jyUEY1LV43LDT8ADOF5j
	6i0AFE2ldnkVyPQx0DkWtUlpqZFCSOI3Pvo7WgvPttHPToXBzIl+9iyVdozTJL3kqMzDsqBZOyh0y
	DZ/RgQmNw1agQpo4qncQz8qv28b8KcMUKoP37zreM5exlip/7bmefYDw3cqT37jHPohxHcXgsehaP
	W+W64SK7lUQFBhdhi/hGaDOuLs1a3EMkRcpxI/fGJJT6w8Lf3LNn4uTrdo/yQ1yss7rnQI0qeZaOx
	z5YTCryF23pVo4Zv0767okUBxPK99Qwstbkicu3InBYlWEPvl93giSpG2GooDwjWe4wbo64YZoNLU
	FaQpRtew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L0s-00000005CYk-3xZ3;
	Tue, 15 Sep 2026 04:43:22 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L0p-00000005CWm-1CNW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 04:43:21 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f55efe5so410947966b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447397; cv=none;
        d=google.com; s=arc-20260327;
        b=eNWo1OJh1Eb+hZJ9Lua7QHaz4t5wpi5VrHFgZ5kEbc6QRWczebilR7IkJQYRY6qZ/Q
         uKu2fv0kKdGy5CXfnw8x/azI3mOHUP+WULXZA8CHm93niOlm6xwRGbehIbnXjB03w/Qs
         r4lw9KzE/LoENylv/u0pI+nQKsqoHcuB8AlpWB7z969JkEnzn0x7pq7n1fL2uIgRV6pR
         q68gcKA+T0VRyWB6gVj3dwsT96xAhjnHbVwC3K4ALOu+U8rtBdm3wjehAgqSMYoG4cW7
         rpd7GCKmkygaTwJ4nyWkOEX2qc8uwYe11+/RPlF9+oSVWw0X8HT6yotsP30vxCN3+gXJ
         kDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
        fh=qsPLqLm44kx5Api3BvKc9e+v/BzPorahfIpevYYma/0=;
        b=aC2x7oOc9EtpFScZoddxjJi7PVKUUjYYhOV69BIYkBJDJonjSvK5/+pClIB72abi7C
         RCLPSDWMntqPhmGpMbkRO8h0sWsdcCDzavdkU6hRN8Yy5Hwn85I6guCjxMPIvQp2aish
         VStw2s3fzWyBFMz2ylQAMTHfyckF5Xmdez+bOfcrZboMiFFCfXC4ime/JyNJNqCRvUhZ
         3MdXlLcMzYQvlxs4gpBn41Z+FZbRe0vUrGAQL3ZcLRNd7Jb93NnKVN2lYeDDWe8IFHda
         Vlf82fRvMjG6+nudOzzyzOffoGaU35s+JMSU9hzKHybMc136yM6Brb4gQH7ViNPf0eyl
         zbcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447397; x=1790052197; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
        b=B6EOoKxYTCoOE/SqEpxC2dZX+wMDjg9mxOwq5MAfu9z3z+Xg0id5gu8znW6g12jJwt
         lZAqapVM18ws+DNXUp+a+fYGaN7v7ifQJdU4eXJCJyjG9v49ES7UlVYcWsJMbRcBlJye
         vUWxiXBhBlTYglxjMf3Bdf9V628GMEiAVm9UrhXfZr8xKFaVVhEI88r8e0ENKd7ZlojL
         Om1334bnc4K+3yjsklPeag+vze7/FN0oeFeCgS9NeLrWQqlRX+T/U0+yUcAHfYNLD/Vr
         Z6StcYPwlkEfAHucNHQoffs9EiRFkZ11WaxLpAfgO1uDAytIcPA5Ec24UySnR8NWdrmU
         dmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447397; x=1790052197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UoOAQKGYJOU9cLqt1H/9UiJiW7vYwYjslaP7yC1APho=;
        b=1wxADzzv53QO+TkAU0fw5j1Pklh6BYc0td1stV5JuWHTtnbT90PEwRIJwOvPDRY7zm
         7Tj9FHCp+tff4LFPJzTD+dmbk50BgIKkdvxFMaJC6ng/DcBwhE+8AKod/TVG/sck4Tbf
         6BewsYRmEd5MbwtozJQoHXj6iLQugdX1mxFY1I/30JL0IDhsxEeYcM47nTRy7JC4usfY
         zy1g7W8l87ttsmlhh/5VN/9gCLTJrNJFVUVrHkHvo9X6oZELzPQQesQocmlZrc7IqQLC
         rfKozoWz2QKJ53JVBJcVwD6J4G07XFjaam4sbB3FByc6uyv3zbgSyDS0jWY3avkmraIH
         qkLQ==
X-Forwarded-Encrypted: i=1; AKwUvByVqyHGxW+em6JzJhRtA8dnh3ci0cyLwyB3F9w3lPM/XyRR33d3flRiSICIshYs7pu5twq1CPfkDoHZw2oziFlK@lists.infradead.org
X-Gm-Message-State: AFuF++m7gQIFS4TxRLo267rI3jQZmtHdoMkoeVo1q87h5H0SMfQD9jxy
	IdFl9w9/XhgYEO1OdyVR7DRy39iPY6IABezcToDiGsbtQyVm7kHi7xVtpPvJBMFz1hDJRl/zt+A
	YUc4VpOFhwsKw8M228RpRjFcxNgvnjMA=
X-Gm-Gg: AYBFou1tfGcuvdfees7IIv+wM5W70xh0PWOIun7dxi1mQ68O65cX7RaKe/Ussv3ztSe
	4MCjNbDjxYmEqFbSG28NWxdgoG/ALt7RrWy+AHH2f5waOKYGm4Ab0P7Ev6v/4UI8qYxQRSvE7V1
	mdlUo9vanl42PDej1gPQK1jieRYUZJ83sIZk8YZNxWasEMrR/NQRZ9V55pjrDwC0iyiROGsycZI
	ji4qEDHoPoxP1Ebz03uMREg1IVCK2jo7CRN/J/OxUQPgx45pOmBzm5yIDiosLik39w81WkEwxk/
	vFF4tVJlD2OInqtvv8iVLL0BTIXAj97tG86eXSFZy9IXSITiymVh3Q==
X-Received: by 2002:a17:907:1ca7:b0:c24:87e3:b8b8 with SMTP id
 a640c23a62f3a-c29b85faa3bmr342332266b.17.1789447396541; Mon, 14 Sep 2026
 21:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-6-linux.amoon@gmail.com>
 <5c24248e-bee2-4256-af8f-a80be6744431@kernel.org>
In-Reply-To: <5c24248e-bee2-4256-af8f-a80be6744431@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:13:00 +0530
X-Gm-Features: AcwNN1URmaKTajm5R0ygh2EGOJeV70g6e6uI0S2uQ6QQ5XvRrWbqrXu2Cftp_OY
Message-ID: <CANAwSgR6sEz8am8Vd_32EhnNjfybZAr=JR1MUjLHidZ+5mdTww@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] thermal/drivers/exynos: Remove redundant
 base_second register resource
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_214319_349207_323ABE1C 
X-CRM114-Status: GOOD (  15.88  )
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

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > The Exynos5420 TRIMINFO register can be accessed through the main TMU
> > register space, so a separate register mapping is not required.
>
> No, the address is misplaced. You completely ignored entire point for
> second base, without any arguments, any data, anything, and just drop it
> completely.
>
> NAK
I removed base_second based on the observation that it is only used to access
EXYNOS_TMU_REG_TRIMINFO for the CPU and GPU instances.
It is not used for any other TMU register accesses in the driver.

>
> Best regards,
> Krzysztof

Thanks
-Anand

