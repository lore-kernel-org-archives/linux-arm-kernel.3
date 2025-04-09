Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A64C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QXeQKoWD337e/nouOHgabSLB0OQA0uz2aXtJZhqcCY=; b=wHRiQ/EMTbASMCiePmjIaWTjuq
	byNJeoeJ57PqYTzxv3/n5dhzC+dBKugv5wI3mbnm1rk4i6maRPNXNlHfnERqkQqoGTyma2I1bhPZ5
	SlFxJxwhNHHHuxLOqvWVphysHnYEshfZcH/kxV/1fHSIHlAzqK3HDFxrpMfF+qF2tgMOmx0kAt6vo
	d7nHb8hr+rIiGuwW1UME3DZTSbs02iGqKgxwvbT3v+iUuoSR+rLOtqnb626UMPIpJdoel+jyY29Ar
	m0MFvYI1bfvJtVVzJvy+kL+P2YfNSka+Ubbpoku4iKM6Wi76JP5IoMLoDZDEAIlmihCO75N71AHWp
	Ohd/G6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZUa-000000084lS-2cM0;
	Wed, 09 Apr 2025 17:45:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZSp-000000084f8-0CZ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:43:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C325B5C012D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Apr 2025 17:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AEDC4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Apr 2025 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744220629;
	bh=MtID83NVzrryWVOVO0Svs05fGH/vIbBHq9cB2N/UeCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TSEa44w6B7unc/ZsNLKHX4+rhG7W+tF6t+sZbTP1gjyf+JQEmSksFeTUOp9VMkB6j
	 V5X0zENSlMCQheEBAEUkbxrwXKtQGWb6ABZmClMHbBrSR99YjvBzu/al/A8iIKyRn4
	 9g2VSHATuMz0Od+w+5uocSuDSGCczE+ktkRfXA49xHmU4jt9ibT1BIBRB2uIMZoNaO
	 2dB22BmtMmFEjCYGUpvwc7ldxg5n1+1axR2mFMGLqERXWz/PpXdRARizR1pF22CK11
	 DqtaFEY60CI0rdCfuvTzUQBQ+XwSfTXNnMCypgRxbFJcKHSen+yH+IPQ7oIOyaAmOP
	 FsMCUqCAhYdcw==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so592468fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 10:43:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjYHOo2soX9LytjcI/fV+ONhYXm2CUy4avGWnTl31VEx56SPHa2M9zuTeOGU6hvSfSqBW+VPn45/LYDpSTFajh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4k13JbRL+4AK0DqR/4SgJt0fZWJaThPw1Zg4HOnXdKrmDsQqf
	3tr3Dzr6X4SdrTEeYRrO07JvN1BjCn2g3vWay+r+UpuV9lswtHHRQZelCzVqWEowGXPxBd0SYUt
	BmocT4Kt4wH4JMekzzMUXBvHEcXw=
X-Google-Smtp-Source: AGHT+IEPa25BLLz45O3A0aw2iD4LjOUUKGFiVDtx9bT0W1iV2DAm1cz3hWJk/Q9WFcb6+s9b/jRDJAaSzvz/wnM7boI=
X-Received: by 2002:a05:6871:50c3:b0:29e:3d2a:a4a9 with SMTP id
 586e51a60fabf-2d0ad00e7d7mr261368fac.5.1744220628802; Wed, 09 Apr 2025
 10:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250327195928.680771-2-csokas.bence@prolan.hu> <20250327195928.680771-3-csokas.bence@prolan.hu>
In-Reply-To: <20250327195928.680771-3-csokas.bence@prolan.hu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Apr 2025 19:43:37 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jmuzvo-xzGBDhGVBbY7svbrqEdi-SeJrx5BG=qtN6ZiQ@mail.gmail.com>
X-Gm-Features: ATxdqUGGv3EHTXO2Nz1qHrCletcbUOdpHS7e7KIVtcT50Kb-Q5VhiMdKVyPZvbU
Message-ID: <CAJZ5v0jmuzvo-xzGBDhGVBbY7svbrqEdi-SeJrx5BG=qtN6ZiQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] pm: runtime: Add new devm functions
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexander Dahl <ada@thorsis.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Pavel Machek <pavel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_104351_175257_9885D0E6 
X-CRM114-Status: GOOD (  21.49  )
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

On Thu, Mar 27, 2025 at 8:59=E2=80=AFPM Bence Cs=C3=B3k=C3=A1s <csokas.benc=
e@prolan.hu> wrote:
>
> Add `devm_pm_runtime_set_active_enabled()` and
> `devm_pm_runtime_get_noresume()` for simplifying common cases in drivers.
>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>

I can apply this one alone if you want me to do that, but I could also
apply the other patch in the series if it got an ACK from the driver
maintainer.

> ---
>  drivers/base/power/runtime.c | 44 ++++++++++++++++++++++++++++++++++++
>  include/linux/pm_runtime.h   |  4 ++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 0e127b0329c0..205a4f8828b0 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1568,6 +1568,32 @@ void pm_runtime_enable(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(pm_runtime_enable);
>
> +static void pm_runtime_set_suspended_action(void *data)
> +{
> +       pm_runtime_set_suspended(data);
> +}
> +
> +/**
> + * devm_pm_runtime_set_active_enabled - set_active version of devm_pm_ru=
ntime_enable.
> + *
> + * @dev: Device to handle.
> + */
> +int devm_pm_runtime_set_active_enabled(struct device *dev)
> +{
> +       int err;
> +
> +       err =3D pm_runtime_set_active(dev);
> +       if (err)
> +               return err;
> +
> +       err =3D devm_add_action_or_reset(dev, pm_runtime_set_suspended_ac=
tion, dev);
> +       if (err)
> +               return err;
> +
> +       return devm_pm_runtime_enable(dev);
> +}
> +EXPORT_SYMBOL_GPL(devm_pm_runtime_set_active_enabled);
> +
>  static void pm_runtime_disable_action(void *data)
>  {
>         pm_runtime_dont_use_autosuspend(data);
> @@ -1590,6 +1616,24 @@ int devm_pm_runtime_enable(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_pm_runtime_enable);
>
> +static void pm_runtime_put_noidle_action(void *data)
> +{
> +       pm_runtime_put_noidle(data);
> +}
> +
> +/**
> + * devm_pm_runtime_get_noresume - devres-enabled version of pm_runtime_g=
et_noresume.
> + *
> + * @dev: Device to handle.
> + */
> +int devm_pm_runtime_get_noresume(struct device *dev)
> +{
> +       pm_runtime_get_noresume(dev);
> +
> +       return devm_add_action_or_reset(dev, pm_runtime_put_noidle_action=
, dev);
> +}
> +EXPORT_SYMBOL_GPL(devm_pm_runtime_get_noresume);
> +
>  /**
>   * pm_runtime_forbid - Block runtime PM of a device.
>   * @dev: Device to handle.
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 7fb5a459847e..756b842dcd30 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -96,7 +96,9 @@ extern void pm_runtime_new_link(struct device *dev);
>  extern void pm_runtime_drop_link(struct device_link *link);
>  extern void pm_runtime_release_supplier(struct device_link *link);
>
> +int devm_pm_runtime_set_active_enabled(struct device *dev);
>  extern int devm_pm_runtime_enable(struct device *dev);
> +int devm_pm_runtime_get_noresume(struct device *dev);
>
>  /**
>   * pm_suspend_ignore_children - Set runtime PM behavior regarding childr=
en.
> @@ -294,7 +296,9 @@ static inline bool pm_runtime_blocked(struct device *=
dev) { return true; }
>  static inline void pm_runtime_allow(struct device *dev) {}
>  static inline void pm_runtime_forbid(struct device *dev) {}
>
> +static inline int devm_pm_runtime_set_active_enabled(struct device *dev)=
 { return 0; }
>  static inline int devm_pm_runtime_enable(struct device *dev) { return 0;=
 }
> +static inline int devm_pm_runtime_get_noresume(struct device *dev) { ret=
urn 0; }
>
>  static inline void pm_suspend_ignore_children(struct device *dev, bool e=
nable) {}
>  static inline void pm_runtime_get_noresume(struct device *dev) {}
> --
> 2.49.0
>
>

