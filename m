Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96C6C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0ynFZEEXAjIagoyl65aQJ9Sy+zKGYCNgLUwmb5k0MA=; b=ChW/hg4ezxzZ0pLihdLw+1lxti
	jU01cJITsuEr7RY0AtxMJUvkrTCliOXAsiKdPmxNoa8vytyZ3sn2J6aK3iK/6VDfKAQYnsS//vQtQ
	hTqEaZcFhazNwKTlh+sHE7okAc+K1cPBz1L/6hqvS6H0wJy5tzNh38Eil0x+yId15LyvESPmtDG5v
	6VAo+/ZwjiDmpITrUdXcvoLJ6KjHbq08JC+z612WR6hGQB8oWfB6Juf7GnE0v9bPuwfQgTF8PWdAD
	7opLJ8GX+k+ieNfIO5Z33H2L2YiK1RMa9VTsfFRPnuVX9YXuWkfaqKk58D1/rrHwDc4aXgTkciM69
	b5//QEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD23C-00000000sqJ-00Fs;
	Thu, 08 May 2025 14:16:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD14q-00000000j1M-0ZDt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 13:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W0ynFZEEXAjIagoyl65aQJ9Sy+zKGYCNgLUwmb5k0MA=; b=U9c/qjN13mj0TTaX6lU0Ag5vCv
	+nYuSpXvgSn2IYIHwhZQqMdlKUNjtG0gvc7o3omgPZ1MPkx5IhWD212C+pQCqSGkdjxrRpJAcoYvp
	OvdMecFHn5HUKAkLIyG/1IAtrSQE6o83Kosk7WCHWRqgSA/a6hrm9bG0M+8M3/FGNLRJUgGwFSrPc
	gK1GOPDgV92U5CMmqQykNec/7/BmydCzuOURIW34oxZp7KTYOf15VP3j9Eiz+g7Gk20Hmag09OQcG
	/+wC4kfDMhq41wjZOj6tySkLDoFegJ/N8XG5JAE0CmBEgs4jORDl8oKncnE/kU/2b9Gc4ny7lCAbY
	R2DyEKAw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD14l-0000000G3Yl-3h4O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:14:15 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-736e52948ebso1174689b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746710049; x=1747314849; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W0ynFZEEXAjIagoyl65aQJ9Sy+zKGYCNgLUwmb5k0MA=;
        b=DtL2Dj4NvxP88Pvr3iEzasv0aRdQGN5RbD48DxH2bdZvbF4pwZ/B5werdVkckFdcwH
         cUFR4ikA8mDqcmj4anSCl7ISp2V75/05+xs8s/gKlPDLVbMaocVfvQA7/01Qprj5CAV4
         3n/6aEg27npIu5+4mQLvNKbSsTDNPgQzB5kLZ90zmtENJNgUKtQFkX33Rad3imhQ57dY
         p6Gpwd6NpqEMY7l1s+zHsI/0rsPiUMfG8ygXyX4MXT74HTwfCQQuobxgMGYz/O8ov4cN
         lkBNcMEdSQ95F9TkJBuk/GT4oJoaPtfXUwZh1EMVuDBCZD0czdagqQY+qusNQ4B3a/9q
         1jBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710049; x=1747314849;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0ynFZEEXAjIagoyl65aQJ9Sy+zKGYCNgLUwmb5k0MA=;
        b=HnNSnECUV/uouN2f3TI2Pvl3gTkNb1wOW9/2lQvtv0Ub+2hW4RYv/nxjnIX6CxbxQC
         4GCOFV7RgnMNgfCpB2InNxsTZdVB28N3PCK3HUBlSFcaERegZC1ZfsjHPcUHLo+9Tw5P
         ZbOJJrQwroFsPzl3oA0Bgyc20+YVJK9iWUbwPzMzpwd/JfJGKxm8YYwXkSzniJpeLEjQ
         PcOTt55bL9odH6V5B2/840E3HwL3RvMaynr4aBa/9Tf3FPac1KDzCbtXHgo/6PQ5upxt
         7WyklbAfkR/vW2D5zTMo0kkSbok12UshdssFwUUWHqT4JcFmEiBvMChvCFCGbKIQII7g
         VLcA==
X-Forwarded-Encrypted: i=1; AJvYcCUT4oMSfsqwf8pKdEavJxnxAms/qnkm8ec65zvpB0AUIGN3qKhqEvGHOSbbJvnFw3IMvJKzXoZldM7l4+lWjXaU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/r3fOQXsCOYGJgEyuVdo/1Em6r8uWzNaVwQOz/JzkdCTahY2h
	1vCWJXxk8j+t3LEcAsZGZ6+u+0+ZUwSdIDJ20H6OqJ+2fCP4qP2ywM4KHeiCD2I=
X-Gm-Gg: ASbGncsCiCeC/OzHC5Zf1Ijo1vZkv7DJ3LrLPejPvHjhOPfb/FEhcs58EEpD5H79/9o
	A/ARusWmhUYc+va3AyR3CUNgV4IfTmPZRLQyBR3i9sfYRLmAmd8etWYkFB5bvRj/UQxwriK/3NX
	koZO6GEpZTujFWddHWrJKBAnCcKl9lW+thnktRxvwwq4TB+A5gywHmgLPA6lqSN9pCTByN3Bo5U
	Pw1tLqm/3g+JB4B9959xw92oNIEzcez8wguuNTMdWsq+HAn55g5TNrkKtOGgRMhXX7D1e2J0ex7
	6GcsVxLbSY/i+i//o2S31hTnjbanY6A3jm9Zl7k=
X-Google-Smtp-Source: AGHT+IFA5bdAR+g+8jas/pp/moZKFd/5kEN1qQAf++05eckooX+tTxGDVWyNcpdJrbek7kiTWc5H5g==
X-Received: by 2002:a05:6a00:2887:b0:736:73ad:365b with SMTP id d2e1a72fcca58-740a99b3b98mr5056194b3a.14.1746710048945;
        Thu, 08 May 2025 06:14:08 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905d067sm13158112b3a.126.2025.05.08.06.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:14:08 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Sukrut Bellary <sbellary@baylibre.com>, Russell King
 <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>,
 Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/4] pmdomain: ti: Fix STANDBY handling of PER power domain
In-Reply-To: <20250318230042.3138542-3-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
 <20250318230042.3138542-3-sbellary@baylibre.com>
Date: Thu, 08 May 2025 06:14:07 -0700
Message-ID: <7hjz6rtfc0.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_141412_110102_5D4CA7A9 
X-CRM114-Status: GOOD (  17.43  )
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

Sukrut Bellary <sbellary@baylibre.com> writes:

> Per AM335x TRM[1](section 8.1.4.3 Power mode), in case of STANDBY,
> PER domain should be ON. So, fix the PER power domain handling on standby.
>
> [1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Ulf, this series has been tested now.  Go ahead and take this patch.

Thanks,

Kevin


> ---
>  drivers/pmdomain/ti/omap_prm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
> index b8ceb3c2b81c..7e36e675a8c6 100644
> --- a/drivers/pmdomain/ti/omap_prm.c
> +++ b/drivers/pmdomain/ti/omap_prm.c
> @@ -18,7 +18,9 @@
>  #include <linux/pm_domain.h>
>  #include <linux/reset-controller.h>
>  #include <linux/delay.h>
> -
> +#if IS_ENABLED(CONFIG_SUSPEND)
> +#include <linux/suspend.h>
> +#endif
>  #include <linux/platform_data/ti-prm.h>
>  
>  enum omap_prm_domain_mode {
> @@ -88,6 +90,7 @@ struct omap_reset_data {
>  #define OMAP_PRM_HAS_RSTST	BIT(1)
>  #define OMAP_PRM_HAS_NO_CLKDM	BIT(2)
>  #define OMAP_PRM_RET_WHEN_IDLE	BIT(3)
> +#define OMAP_PRM_ON_WHEN_STANDBY	BIT(4)
>  
>  #define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
>  
> @@ -404,7 +407,8 @@ static const struct omap_prm_data am3_prm_data[] = {
>  		.name = "per", .base = 0x44e00c00,
>  		.pwrstctrl = 0xc, .pwrstst = 0x8, .dmap = &omap_prm_noinact,
>  		.rstctrl = 0x0, .rstmap = am3_per_rst_map,
> -		.flags = OMAP_PRM_HAS_RSTCTRL, .clkdm_name = "pruss_ocp"
> +		.flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_ON_WHEN_STANDBY,
> +		.clkdm_name = "pruss_ocp",
>  	},
>  	{
>  		.name = "wkup", .base = 0x44e00d00,
> -- 
> 2.34.1

