Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C325BE77361
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBil/1BlF+q4Dj/UPxj4gednLToiu7OKX6pIq/V68fU=; b=TwQ3A7vz/DFI6iYqypLGPLRMrp
	xHSa2kNjxYbSOhko0mdmf6Kp3s0LjbLvLKX9RybXCsdTTjzLkSy8PV8GtW+G7i7UFtglir373ohR0
	M3hDX8ufCndfsnkL826MgotSyjh8X4aa6YqCos/fzu2hnK5IrmzNGpJVWtkGy9koj6M8Q1Kvvi9rQ
	wuzmSv7uL1ex21m9h36rw+9pRC44Do0fsMWMeQGAIuSfJ3ZnZ9cSV4Y5UIo3bdz+NBkH0/C35XzZc
	9EUebF+VQVc6xSm8bmxMfsUz/J613M31pBjbzzcbUeGryf9Zv2ogFeHtdOh9LtG+6XK4PBWhmoIOY
	0h0SOKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQJI-0000000H2kp-0QVn;
	Wed, 24 Dec 2025 14:57:56 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQJF-0000000H2jY-1Ecj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 14:57:54 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59583505988so9073892e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 06:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766588270; x=1767193070; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBil/1BlF+q4Dj/UPxj4gednLToiu7OKX6pIq/V68fU=;
        b=Dr7ygBdytFLqesPok/ypkFVax7ZDvWIN2oA6SvXIQUe2/wa8P8S3sCnci+rvPMGG8I
         Rm+fXXbdn++hE2B1aD0VoSB6Ywo7cVlFi0nVdMbR0n1ZqKp1K50HOvt+oRRhHBLxK0QA
         2z/ikIy4mXKIL0TVctZrKb/AgHQvgcWLOe1n654YQUqGVoSpuRPOdYyuMsY+1IPHoXGV
         Mwn07ovH2gjrJuMJDHCjB1cuXlKIzow6J4VbKyh4Pi9DfRTIhXtvRDfh0to7XrFyn2Wt
         gQlMdYMAbRXP70AmZBg9LmmV1RjUl4itVTFZ05oD7wRJCof4r8o9f5IYTxXxEI3JlpjD
         OkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766588270; x=1767193070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IBil/1BlF+q4Dj/UPxj4gednLToiu7OKX6pIq/V68fU=;
        b=GpavA4Mo0gYYDs8he3HTBuAIt9fk9w97/ti+Bd8N3D4ZXzpsR7xt5U9qdDEKo+uNH5
         98VeLYFiePgMCLLjCFfXPTq27aLdgkDIxRrgnNzXiNOZ/+GSk32iPp22N7imEI4LkoJf
         Gu0Js2NUesP4XdHY8Hf8pBCf+0hGWYJsQiEj2vUZ/cYis+VVptcBP9jCORE2orii4saf
         VuVIzFFoOJ7t9qHCO9hMbBxoEJPfQkObJy9GtP/luA5FWcPliAAyn0ixOvJPSkTpHJNV
         +AfJ9jJA8p/gcM0kNt22hUCMx+rMtPaRSaZUJPIZI+VtMIM/s1pKWHX4ha/IksBTg4O3
         n+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrkRfGmFqGub21aD4N6SI5xNbN5uUZFUb9SzbOzeFjWPy5VRbB9muB5a/Gy/KAMvVCDjc8+2LwjKx9SSOjMG18@lists.infradead.org
X-Gm-Message-State: AOJu0YwfLWiB576h96yMjp2F/9OWKMY1tl0cmvrtm7M8SAW8f9DExVL5
	kjwea2dNL3elMeIHFbdUopJXPl+Tk56E6KOdZCbO2ijF2lvrvm7kwqd43C1ioGS1ZfEdytm4TfM
	FaTpoJRr0t/xqo9VcZobvY3r6D3tXLkmRVLN/atxDeA==
X-Gm-Gg: AY/fxX6DCOQyMDPK5mU9xJ6yF8FHWNobqJ+je19xs87sTy24XdxzrJ6wwc5DKmcihSD
	bLvqnJpcU1z3NLBE2U1jKOqLXfkI4yzByRuLxwwW3Fa8FiaqOE7NEd6+Zn/MWVd4CazwsHU12Sd
	nE1dPlZpLEUG3NQ8WW3tUjoEciAZnN16ap8v3FqyD7H1vHDczKloH5fw9GIFwLG0rVu2h3PhQF5
	nF6D7NgGkWCwhOMlNyMQIbVHY0OqUY28hpCglUac1rWuNXtRWXq4FPP/Eh9AucQPoHhCnYBPqz3
	EDbeEALRaVNc/3Bx0KaHKhW9wO+T
X-Google-Smtp-Source: AGHT+IEgJ4DvJza6f8nrVt6smijc7MYv+2jVVc9Xk7eZ3JyUwizr2J95vVnjlu+rq1GIIpvWYrI9MO3mpcNk8k5Vwhg=
X-Received: by 2002:a05:6512:130f:b0:59a:1482:16a8 with SMTP id
 2adb3069b0e04-59a1482170amr6611182e87.24.1766588270392; Wed, 24 Dec 2025
 06:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20251104112923.143408-1-marco.crivellari@suse.com>
In-Reply-To: <20251104112923.143408-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 15:57:38 +0100
X-Gm-Features: AQt7F2p4_5Om9G-3ifUhTGyCvRSOPvuJvIr3ZkpzQW5Po9fMVvAd8RkxxHIjK_8
Message-ID: <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: replace use of system_wq with system_percpu_wq
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_065753_334678_2C316282 
X-CRM114-Status: UNSURE (   9.62  )
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

On Tue, Nov 4, 2025 at 12:29=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

