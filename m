Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4163F3027F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 18:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=; b=pudlp0R++FNtP9MkZS5/MjACEE
	Up5/iAF20M5iAyyflej2T3x9xJeynrPivVxo83ygE9dZaHhNzFY1No7FN0kv5M/AqBT/Sjry8jnxv
	r8PC4RCtu56DvAz8MrBwX2oS1HhTb368zemZc7+pV0ReAcdIgopa6deDAKYzZuQDbRkb0rUN/Cw/J
	yK2EeD6PKWLiEZS9dJhbOiZMlQMrAAZMD89+6goBpdXHvpm4tGVDHGXh4vPcxu363eqBjzit8LeRS
	WjHfZ57CERBr+xk+D7ff5mzhvTEo5s1u2sHjmcRz9cGt4TV+7nnMHPDraVHQmVk592x9UgrH1ugAW
	oMjJe8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1q67-00000002o9f-3BtS;
	Sun, 15 Mar 2026 18:21:55 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1q64-00000002o9J-1zdW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 18:21:54 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2c0bf0a0236so18718eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 11:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773598910; cv=none;
        d=google.com; s=arc-20240605;
        b=ZxeY6Ocu/JPG30aUIg9i/5mHygwSf5NURJfn941aTWKnJHkz1+HKOtBx0CM56Q9Cbp
         bv2OqqjR6ButDOeJoOOl7C4q4MlMpxm6OxHjYuGS9dvp3N8k7+QmkFChzKUpBLPjksyQ
         zaH5JLUms1dlt67JqBUOw/5tYrWXFg47RHi/bWXCS0BmQZFzVjw7l+m+YNriIM4UxzsZ
         Vkt8lecWwgpkz8N++jl3ZevhwslbH2SXTOO55LDWBLEaF1X4Ia3ji+PHFvbIPHgHwFJB
         XceghJEBf8mQ7a/LpW2lM3rX5oF0FHg7FdJT05nrjcmu/D0MREYOWlx/1PtnIUn5cqoY
         xOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
        fh=qey5goDyzOAofOzGoWSSvILazmnPg3A1Q1dQqoRqPg4=;
        b=dkQ0gmzjKKagR3PVmTwjuSympI4eD0Evpr/IS0x+0p5ebRL5oFWD31E+TZyXwc+9af
         3RN+3Ocgn7+e/s62xpsAg6vGvMiDXwR1q0KIaiYbUXAMNanq5oMIQg18K2MWPvuf/StH
         /6jiGpS/yhr4smCdG8XjGkq4GApTxUqyIzhHe+2Am8KzGQzD4oKanSaUySTN5ITDJV6W
         I5oGxnNTTgh3sAE7LUqGIGtEIJA3iJogjyuu4YcTOTNw+8fZFEKuNPJxw8nBQSgX2c5j
         Zm3+f2gy1e0+5Bp5MCC0WHybThn49GfcEdPUU07PniqZGt/lP7LbvIzNixjKRUMu5MBS
         K5LA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773598910; x=1774203710; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
        b=JjVwRdMu4PurweqVjzL+lQM6YjRKxmXXn5u3hoQObT7m93KD/5WELZ9dYRyXpgt7fO
         OTzpBbhYcmcocuPaXJ/WzCOV32PEu9DrIkbc/UFiS7njiNmFlYD0Oay+TSigsuJUKSn6
         gzlSIS+GbizUzoKA9QVx+ZBWgvxrAizEsPhZzRj7G45qHz4Aa44WftlprwZtLVcFcaii
         2K6CstEvJmlU51W3bidvGwyxaRd3F7tTcbZl7OH5qkS4QuG70vSNdBs2nJVMDd7PPhnQ
         RT6dgbV8kiY6NHN5f+P9MjBgWbwPg5G6mq1gd4yEIEcKYluEIvm8Bye/5v1hFJU4qNRU
         7Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773598910; x=1774203710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
        b=mmmZ0CyzPhanS13oGyaPXluJFJE9lShLWRc7yX0x/aajp2ie+1ukh7HHSh4kQ6PLCj
         UY6947/PWMQFs5OhO2ziRe+meRILeZ9yP+bFIOA/P+nLfl4LK/NET1w8eprdsryqenSC
         5raaufY7WHup3DHQPTGyGoVn0Vgg4mEhjFJaeG0ixed0D13GJ++nX/NsGDz8LlfT9Nfm
         3a5OlxG66jgT4Av/VueZDrnt/zGJB8AkDotxGOkgKpxGnkm0zt9Sf9nFJS9JX4XOkh5i
         +Hx/CupbDSoTSJDqIjf0X8WbRDM7vj/ZIbFZcH6tY99qOxytzZ8jD5CkvlRCPYJSPvwv
         sR8w==
X-Forwarded-Encrypted: i=1; AJvYcCW+mMEIw0Su9ZcYApyh1Oa4SxDAbTa6XbBIaedAwpAtB3uxCtlCYYonbEALpjGv1omnLicEErHesO3JOcrK3IwN@lists.infradead.org
X-Gm-Message-State: AOJu0YyfyAgQRFf5q+R9bvRQfVfXyNRdo3e9o+Ha2kY3p5dqSnVTjCaY
	sVf/jsCykVq7YcfceYPVIJPK6m85S0O1dU3fFOUUyThp6jMmltYi30U4h36K9pwcHkBB9A31haR
	eB+exkjdfMQvfZ2G9tTSrGxnzyyusvMg=
X-Gm-Gg: ATEYQzwp4kdrdkJYvpApzsgKtjfgcsHuSY1yPAEVrBM+4l4bwLHWtyLEOokDOtITKUl
	6NyU0M6s10+RSo3bSLl4IjCLtwQuVAaW1Dnv5uYjg8CEnuj03T0mOv/bFCacazCa2zF6eebJpha
	DhcUwckArU4zXeZFH73EuIHIAN0rqwUsjZp7bcfmgWb4KYV5i8rrXLyPqu84MxUYdIb0qStHjHu
	8LNXgadiDG1hm4RqF4FKoBegbehTFPgXjUqd4EyDeyYiDbFTjSRKBi637bhr0258B1NB+pz3hUA
	WVhLjcMnZGP3O3eeA1XH4XA5BHKkVDiTwrruQMp+dl4r25MnGqpnr22/GnoBxq8JO59e8/Bfk85
	x5+C4phm+mu2qCfWXqg8NjY4=
X-Received: by 2002:a05:7300:4313:b0:2c0:bcca:e9ae with SMTP id
 5a478bee46e88-2c0bccaed2cmr503104eec.7.1773598909944; Sun, 15 Mar 2026
 11:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Mar 2026 19:21:37 +0100
X-Gm-Features: AaiRm504huR_jEPQjv25PhnCGlqvxnPL_8XhiojOoKqXdkJjPbWUaTm98aG9g50
Message-ID: <CANiq72kdfYLmhojMo=vOAc5tULjjB9V4bM=iUmm5cLGpF-zj=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Optimization and alignment for MMC, Rust and iwlwifi
To: =?UTF-8?Q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Boqun Feng <boqun@kernel.org>, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_112152_519390_F50FBA91 
X-CRM114-Status: GOOD (  13.87  )
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

On Sun, Mar 15, 2026 at 6:27=E2=80=AFPM Adri=C3=A1n Garc=C3=ADa Casado
<adriangarciacasado42@gmail.com> wrote:
>
> These changes were previously submitted as a single monolithic patch
> but have now been split into logical, atomic commits as requested.
> The code style has been verified against checkpatch.pl.

Thanks for splitting it and fixing the diff, this is way better.

However, it seems you sent v2 three times. Was that intentional?

In addition, it seems the patches here are independent from each
other, right? Patches that go together in the same series are supposed
to be related in some way and/or they need to be applied together, so
I would suggest sending them separately.

Splitting them into separate patches also means you will have a
smaller list of maintainers to Cc, since here everyone is Cc'd for
things that are unrelated to them.

By the way, I would suggest using the `--base-commit` Git option when
generating the patches (optional, but useful) and also Cc'ing
reviewers as well since that will increase the chances people will see
your patches (you may want to use `scripts/get_maintainer.pl`).

I hope that helps!

Cheers,
Miguel

