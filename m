Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3E9C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSdz9DMRQxNiBSfqN0mvebxTG96ZEiLFHUiBDiBY954=; b=VTb1nWJigdo6NPgKAJ29HbZXIU
	Le8bMzPPBxRVOm7denDXxdgomWt5kjohKSPi2TNgZLDh6LNGgzbzEwauABdC9V0Qb5gw9HM8YzrVq
	ELYIXJWRLz4t99nxG7H6cBrCwWr6xTy5gVTTZELBMsV2L1sEq7lDHItydzbClNYpN33enUjvB9vIQ
	jB6waBGLy+aR6xxL9DxSDJx+UcCbgrzCdDJ+OODEN7GMj0nGXJ0hOS+mhSQNJzrX81PoeMVzjLIgg
	vmHfKcm6W3J6hn2gR014ZdrorRciJ8J6Lo85dNwIRLR6MXQ814g2iLMSHiKH2//68YjNEAEXNm6ih
	VrQeGpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUjl-00000009E8r-3HxS;
	Wed, 26 Mar 2025 17:40:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUi3-00000009Dhb-0GaI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E7626116B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 17:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEEDC4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 17:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743010713;
	bh=ZyxutTsVh46fH3XEd2TbSh2/N648DOeEQ0+sSrSt2iU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NPPPKHpvMScAawhZFZxPvK70ghGCwsyUAv1LotKeBb8QUoW2ciW7az7DXaMmp3+d9
	 kAlgUZMPmLC3YydsQ3S0dv1wv7Ch6KK6fGWyPwmDFIYlsIWIOHXf3VZG8WmH44+TYF
	 oV7bOfcCOhQd8CdpTGmlyUGfqvYoBpeGwnGLOKGuP9zHiQSXfKdgPsX3y+Hi6aJt0L
	 YW9cjD4WR/HXmaEnK+mehIgqd/3mIsHhHxgoH44THspR69G8gWE65n2zriMTy2EGaY
	 arw1jtj2C32B0Y119q1LwfU/jv63ztRgOoEnt6x3nmYr2022+g/biwVRG4C0kGlEUH
	 vcntixkMz91Cw==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60219a77334so55884eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 10:38:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9LfMGtwlV2/dhdG6fP1ATU7CnQH0HRq3fKQjEtPoeKjDAOW4GiNX9EOpAU+htKXALWIvsimm8z3847qAXepxV@lists.infradead.org
X-Gm-Message-State: AOJu0YzA/A3mOI3u1EzFAjoJLdJYPD6KsEwLfdBHj0lLTjw3HNhpp22h
	0a1Z4EYrWyVjBH0ng4WlYUkmun+wI0siZzM+hpMLLul/nDR5J8nyaE7yTYmDa1dn6JWUt8Xiv0D
	VzTveCBNmGO+WyjwKs2ZhFXWVRHk=
X-Google-Smtp-Source: AGHT+IGg7eH9QWYfbDrBJ2FJDudyXDT9YK3hV3X5mb5l8doONA3okbIYrYqOJiry/b3Gtou6+i/QFZ04lWY33we4Jao=
X-Received: by 2002:a05:6870:5b9b:b0:2c1:3d93:c192 with SMTP id
 586e51a60fabf-2c848221302mr204027fac.37.1743010713193; Wed, 26 Mar 2025
 10:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250317093445.361821-1-csokas.bence@prolan.hu> <20250317093445.361821-2-csokas.bence@prolan.hu>
In-Reply-To: <20250317093445.361821-2-csokas.bence@prolan.hu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 26 Mar 2025 18:38:22 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hJZBxU6SSq9C8gp2peETFWu0jbhrM82B5GvQkVXPR+9Q@mail.gmail.com>
X-Gm-Features: AQ5f1JrcLyMXU0AXf56Zv0FLxsWH5M_UdoHXg48ickDdwk4WFSdM0LXMMkgNyG4
Message-ID: <CAJZ5v0hJZBxU6SSq9C8gp2peETFWu0jbhrM82B5GvQkVXPR+9Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pm: runtime: Add new devm functions
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

On Mon, Mar 17, 2025 at 10:35=E2=80=AFAM Bence Cs=C3=B3k=C3=A1s <csokas.ben=
ce@prolan.hu> wrote:
>
> Add `devm_pm_runtime_set_active()` and
> `devm_pm_runtime_get_noresume()` for
> simplifying common use cases in drivers.
>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>
> ---
>  drivers/base/power/runtime.c | 36 ++++++++++++++++++++++++++++++++++++
>  include/linux/pm_runtime.h   |  4 ++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 9589ccb0fda2..821a8b4961d4 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1568,6 +1568,24 @@ void pm_runtime_enable(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(pm_runtime_enable);
>
> +static void pm_runtime_set_suspended_action(void *data)
> +{
> +       pm_runtime_set_suspended(data);
> +}
> +
> +/**
> + * devm_pm_runtime_set_active - devres-enabled version of pm_runtime_set=
_active.
> + *
> + * @dev: Device to handle.
> + */
> +int devm_pm_runtime_set_active(struct device *dev)
> +{
> +       pm_runtime_set_active(dev);
> +
> +       return devm_add_action_or_reset(dev, pm_runtime_set_suspended_act=
ion, dev);
> +}
> +EXPORT_SYMBOL_GPL(devm_pm_runtime_set_active);

I said I didn't like it and I'm still not liking it.

The problem is that the primary role of pm_runtime_set_active() is to
prepare the device for enabling runtime PM, so in the majority of
cases it should be followed by pm_runtime_enable().  It is also not
always necessary to call pm_runtime_set_suspended() after disabling
runtime PM for a device, like when the device has been
runtime-suspended before disabling runtime PM for it.  This is not
like releasing a resource that has been allocated and using devm for
it in the above way is at least questionable.

Now, there is a reason why calling pm_runtime_set_suspended() on a
device after disabling runtime PM for it is a good idea at all.
Namely, disabling runtime PM alone does not release the device's
suppliers or its parent, so if you want to release them after
disabling runtime PM for the device, you need to do something more.
I'm thinking that this is a  mistake in the design of the runtime PM
core.

If there were functions like pm_runtime_enable_in_state() (taking an
additional state argument and acquiring all of the necessary
references on the parent and suppliers of the target device) and
pm_runtime_disable_and_forget() (that in addition to disabling runtime
PM would drop the references acquired by the former), then it would
make a perfect sense to provide a devm variant of
pm_runtime_enable_in_state() with the cleanup action pointing to
pm_runtime_disable_and_forget().

If this helps, I can do some work on providing
pm_runtime_enable_in_state() and pm_runtime_disable_and_forget() or
equivalent.

> +
>  static void pm_runtime_disable_action(void *data)
>  {
>         pm_runtime_dont_use_autosuspend(data);
> @@ -1590,6 +1608,24 @@ int devm_pm_runtime_enable(struct device *dev)
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
> index 7fb5a459847e..364355da349a 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -96,7 +96,9 @@ extern void pm_runtime_new_link(struct device *dev);
>  extern void pm_runtime_drop_link(struct device_link *link);
>  extern void pm_runtime_release_supplier(struct device_link *link);
>
> +int devm_pm_runtime_set_active(struct device *dev);
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
> +static inline int devm_pm_runtime_set_active(struct device *dev) { retur=
n 0; }
>  static inline int devm_pm_runtime_enable(struct device *dev) { return 0;=
 }
> +static inline int devm_pm_runtime_get_noresume(struct device *dev) { ret=
urn 0; }
>
>  static inline void pm_suspend_ignore_children(struct device *dev, bool e=
nable) {}
>  static inline void pm_runtime_get_noresume(struct device *dev) {}
> --
> 2.48.1
>
>
>

