Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C57E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4ORUpe0pVZmQmvkw1nu+aTOjOaP1O5zfh0k3pgSPzo=; b=afnuU5cvJLYYJjdu9TjHHnQ+Tf
	pMnIJCujwR5Aogotd4GojfxrUPeWzLP2ZZEpdFhuUUHIM+A3zn3wd2U/50+1Qb9lQnEPZEUCOLxv7
	uizD5eapaASOHS+xLWpspa4w/mI0OFtguU4Mchnk5pI3KQk0evp5geDRKRJAGSLIwJBfl46mnJmSy
	3xd5bhPv+UEWAQjItO7yxWq6IJKKYqXSi7aRIA2t2Bbe/QUFZV0te75pdGALYJvpHKz4JuqEseurE
	EBuWrBuSI+Bq2P/m13tjhk6HKHqLlAWZMqwzynTjxveb0QYk+E3cHXMBO9R2YKsaXc7KxbEFcYGj8
	EZ9iAjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqPW-0000000CqGv-2MxG;
	Wed, 04 Dec 2024 14:31:26 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqOL-0000000Cq6d-1tKO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:30:14 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-466a0ac9211so62849041cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733322611; x=1733927411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4ORUpe0pVZmQmvkw1nu+aTOjOaP1O5zfh0k3pgSPzo=;
        b=LsaqJ3l1o/wjKQyHxqlb6Kr51HVbkAmwtLMicUQ65CZEPlXDYqmLFlyy5oo0zFkAvN
         i5H0HrLl+SHAzKd2XOSUMFpsTCr8u1RpMjfJ3G1Hs/t+pUihqsW9CS0HM6EDIgtkjzoQ
         k4kk2lNSiO2peNMFDxduV9dadZ/KuC5EJ5Rke/lqipGul4fO8+C5nYagLLVcScEt4onl
         UUGM1hZ3S77S80vwaaHNBG7wLZxERMCHZ6jAaE8UtXkkcOkYaoJqeFrjKbGvAOaW/QAu
         xQMDvEYtp/WOmsiR/a6XQtQDRIbPl/RAUJejmwuZBn+3dlS7BHuN1j6vFnJ1QEboVbR9
         UDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733322611; x=1733927411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4ORUpe0pVZmQmvkw1nu+aTOjOaP1O5zfh0k3pgSPzo=;
        b=ZCkejqSjU12kfPfjalbi9JN7YRZM5gSpFx59IzZs6uw8ZNUNMjW9NzD/z+WkfU99y2
         u4qVN89ny/HMXsBGl2dnKQi86PMCj06zYTxSBLdx6bnpEic+CUX6zHBOP9isF6eqSXYz
         FWZImfkHcxs8lUEnM94HB5w/FGzaywNso4eCt9p5bklcD9tlGaK4rC91LOeBHBVwFeXg
         wYyUCdpWXnAnr9SncgU0aVq80zkRJz7yj2Cb9lqjOU0lEV5cTADfpC4ETbZhwHMg20oZ
         N9Q3IdRiWOlcAUrDPH90EsJOZJ5GPCNaovrIiswWRQAuVti6G7SZkGmul7kB80fHCx9r
         rs7g==
X-Forwarded-Encrypted: i=1; AJvYcCUOSxAz4u5q+wcoCwgTxlN0UFJmlY6/AIDIiFv3Xfuw2mbtfhmz5AjIXTg163UZiXAmRobOLr2TTHG+KG4E/FOp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeq2TK8txBaGBUeNMGdDkQgny5TtiCDRUPzbUuhUVTBFz+aor1
	HUKhP9BUGF5QEwyxfoxKTfYj7z85bSYqJfUAPEavufD+hVMe4SsovAzkvmneluRqu0BDVr4HZPz
	Rg4oE5jw7eBiDsbX3OKAfWpPz6jM=
X-Gm-Gg: ASbGncs1a6frQmgMhQ9eUFAuqU4dK1d2G1nQwr6PS5a3C+fFrN4K5NfpEG2M+tW6F7M
	YXnIsbputpYY2zLS74FDOh8VOpMBvhTc=
X-Google-Smtp-Source: AGHT+IFz9AqjuEgEtpGhSGQOZnrxRUdrncSun9IdkUiaSxXNrzlUhCJKBQf8IWnzX9RSbBxpI0ATkHRWJCCRT5JjEU8=
X-Received: by 2002:a05:622a:1801:b0:463:60a9:74c0 with SMTP id
 d75a77b69052e-4670c09df44mr91467951cf.14.1733322611045; Wed, 04 Dec 2024
 06:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20241202194107.105119-1-afd@ti.com> <20241202194107.105119-5-afd@ti.com>
In-Reply-To: <20241202194107.105119-5-afd@ti.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Dec 2024 17:30:00 +0300
Message-ID: <CABjd4YxYjX2bHSBMmPxH-5muQL5TG_ATS8B0+vCdNKJARke6BQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] ARM: vt8500: Switch to new sys-off handler API
To: Andrew Davis <afd@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andre Przywara <andre.przywara@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_063013_488391_E0DD4766 
X-CRM114-Status: GOOD (  18.72  )
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

Hi Andrew,

On Mon, Dec 2, 2024 at 10:41=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> Kernel now supports chained power-off handlers. Use
> register_platform_power_off() that registers a platform level power-off
> handler. Legacy pm_power_off() will be removed once all drivers and archs
> are converted to the new sys-off API.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  arch/arm/mach-vt8500/vt8500.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-vt8500/vt8500.c b/arch/arm/mach-vt8500/vt8500.=
c
> index 0ab40087ae1cc..1d294255d7083 100644
> --- a/arch/arm/mach-vt8500/vt8500.c
> +++ b/arch/arm/mach-vt8500/vt8500.c
> @@ -141,7 +141,7 @@ static void __init vt8500_init(void)
>                         pr_err("%s:ioremap(power_off) failed\n", __func__=
);
>         }
>         if (pmc_base)
> -               pm_power_off =3D &vt8500_power_off;
> +               register_platform_power_off(vt8500_power_off);

This really calls for a separate tiny driver under drivers/power to
remove the legacy single-register remapping higher up in this
function... Pending that:

Acked-by: Alexey Charkov <alchark@gmail.com>

Best regards,
Alexey

