Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EC6CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nqesmbadsL4TcQ6pyvWq3P8etXMU87cVhZImzGQo0w=; b=F49f7xSUJntthTf3ksiy1UXTMO
	zUVlucJcMjF2sgHMYAOq6ptYetjp9UPQ4MVvj3r+V2o5Mx679/grHQBUZloyBJthCv+pE63xnHlIh
	H0UxquRF0EWINMuPKLxMp6wrARASSRGRwuTq5LjqTjrvZCgRlYyLAU+vE0N9/m+Svgs5Q28URotVY
	9S7VZHgVLlQ9oxb/B0x12/JAK+BTwoAV8P5fez73fTgG8upUYMKo4mLAg2m5jZn8Wtp8ZGpfVKg0s
	bn7JBw/wPDZQEaLwjWJ32BSrhZaRKHUpVAjALVWkX5dKvmDcE9+V9EPEHC/fFzfCf5e9OjJDfDB5l
	sIjL6+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0TR-00000007Ips-1OR8;
	Thu, 23 Oct 2025 18:55:45 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0TO-00000007IpB-2csx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:55:43 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b6cf1a95274so912609a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 11:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761245742; x=1761850542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nqesmbadsL4TcQ6pyvWq3P8etXMU87cVhZImzGQo0w=;
        b=FqvxLNB1ShJWwDbioqwQjsuPBqosTl1pXRv+T6A04WNSfS4cqXaCq0bAff1KP7EFA6
         SpOInXPP34xCGuXtf+wSLBQ4gmNGZMGVSl1u4VkYIHpKYHxvXcut96krV4tLZS6Kva4l
         4Qo/PmcqxqMq5jhFgWhq24yhisRhNxCycGgUPMH9w4BvLorMqeTch6GuAQDATJkBhcKs
         aHhAak0mAd/ulObd+GD/rz9rM1POtIP0cAMQ5khXQ16YtLpiWq4mPz83YJAX9ZtZDJfA
         GbPLWeANPyCoY68UhLlHvPZKzIhdSD6xu5MvOKBKCAJII3GtV74av9Da5s9o4CWNCGTX
         9scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761245742; x=1761850542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nqesmbadsL4TcQ6pyvWq3P8etXMU87cVhZImzGQo0w=;
        b=JFOSxIKQlhnY6/HamNIu0Uu2syC1ZSzUVk6XvSG508sCn9EZ+KmUDAeogppHE/6JS7
         FW6HaljT3FL+CfwYB0vJBwRQdYrbRy4tIXE8K9KcozntJ/OE7VV6kmjsnbXyF+7frQT6
         7IH+gETLaEUw884DLywTpt97Yyo/+nBRhejrTHy46jkWWH9/Uv2xwzVb7ruoisAwEpFA
         oBBzodUvNeCIbFoJi6cODU7NKaxosLma7bsrXJdpHe//SZY5NTWhw8z4aLX2afYPfkJa
         i2XnBho6uuf0I2wDGbfBSSTo31RxJbsSr6phu2QiJw0ewjfK+iFYWAOC0k8LZ8IkT7Iq
         mAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDj7YK/2/Opwhwxknug7hT7tkTOaiDep6gWV3/glpNaK9gorBjzMaEk4Ah1RykfQs+Bzs1U5g1tge0TM5Xu9Mh@lists.infradead.org
X-Gm-Message-State: AOJu0YwyLQuyy1hzIQLZnuQKwO4XQ2xbR6up5yKkdYkIWRO6Is4UYjTV
	pQ88VeOG+cFAim8Ej2tm9NNA6ZidOFYgNZGx73cKP4rbWH6O3IUrkcc3Lv/xfGuS8ncosET/0gA
	1vs+Lf4xmr4vyynyrZ1+wsNEIkzhw0P6sYzybP+jT/g==
X-Gm-Gg: ASbGncsDi8aPdFQWxNe+nVVAQwAbhmUoxIIrCj+u/X81OPcgnM4QwVFzpdsl67RNOr4
	2f2aUz/u/hqQ1uV+tGXdO6QnTbjKXf+Sv1zApOrtlPS7IzJJQCGJls0nGcRHsNTLeOsmmV7G/P/
	eKAFeczyCfpcR7P/egD+par4KnHz1IDjGNZO2rYuZ1nrQGCLJql1lnDMQ4k1kuRoXOcDmmv1/vf
	OCShSTpNXbCULWxodixGTEy58w/8hAcKqm/u4PTmKMVEwMebKrbR9lrbQ7R+IRVcV7mHqCN+m2n
	hhI6gpa7Fu701hA=
X-Google-Smtp-Source: AGHT+IGxmBYon2RitVIqN2x+MkXSzGe0lcwNoOIre6xyOPwk6oa5iMaQ33lq9vtGEhqgaIyKokK/WKNyenpypK0wQKs=
X-Received: by 2002:a17:902:da88:b0:24c:9a51:9a33 with SMTP id
 d9443c01a7336-290c9cbc119mr319435045ad.22.1761245741736; Thu, 23 Oct 2025
 11:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-3-d34aa1fbdf06@linaro.org> <aPkVjoWkP04Q-2xP@smile.fi.intel.com>
In-Reply-To: <aPkVjoWkP04Q-2xP@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Oct 2025 20:55:27 +0200
X-Gm-Features: AS18NWDv3cyfZzHn3g6_AZq2diutRl3UpTCleLdYUvzFU1eXCFlVn9tXiFa-dw4
Message-ID: <CAMRc=Mc165HSLdug1F+t3qcOoE52mR1e_zEh=rSTUKN_-dB5NA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] gpiolib: implement low-level, shared GPIO support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_115542_673057_1718D167 
X-CRM114-Status: GOOD (  40.22  )
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

On Wed, Oct 22, 2025 at 7:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:42PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This module scans the device tree (for now only OF nodes are supported
> > but care is taken to make other fwnode implementations easy to
> > integrate) and determines which GPIO lines are shared by multiple users=
.
> > It stores that information in memory. When the GPIO chip exposing share=
d
> > lines is registered, the shared GPIO descriptors it exposes are marked
> > as shared and virtual "proxy" devices that mediate access to the shared
> > lines are created. When a consumer of a shared GPIO looks it up, its
> > fwnode lookup is redirected to a just-in-time machine lookup that point=
s
> > to this proxy device.
> >
> > This code can be compiled out on platforms which don't use shared GPIOs=
.
>
> ...
>
> > +             if (!strends(prop->name, "-gpios") &&
> > +                 !strends(prop->name, "-gpio") &&
>
> > +                 strcmp(prop->name, "gpios") !=3D 0 &&
> > +                 strcmp(prop->name, "gpio") !=3D 0)
>
> We have gpio_suffixes for a reason (also refer to for_each_gpio_property_=
name()
> implementation, and yes I understand the difference, this is just a refer=
ence
> for an example of use of the existing list of suffixes).
>

And how would you use them here - when you also need the hyphen -
without multiple dynamic allocations instead of static strings?

>
> > +     adev->dev.parent =3D gdev->dev.parent;
> > +     /* No need to dev->release() anything. */
>
> And is it okay?
>
> See drivers/base/core.c:2567
>
> WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is b=
roken and must be fixed. See Documentation/core-api/kobject.rst.\n",
>

Huh... you're not wrong but I haven't seen this warning. Do people
just use empty functions in this case?

> ...
>
> > +     pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n=
",
> > +              dev_name(&adev->dev), gpio_device_get_label(gdev));
>
> Are you expecting dev_name() to be NULL in some cases? Otherwise why is t=
his
> not a dev_dbg() call?
>

It's the low-level code saying: "I created device X for Y", not "Hey,
here's X, I'm here for Y".

>
> > +     return 0;
> > +}
>
> ...
>
> > +                     char *key __free(kfree) =3D
> > +                             kasprintf(GFP_KERNEL,
> > +                                       KBUILD_MODNAME ".proxy.%u",
> > +                                       ref->adev.id);
>
> This looks awful. Just allow a bit longer line
>

Ok

> > +                     if (!key)
> > +                             return -ENOMEM;
>
> ...
>
> > +static void gpio_shared_remove_adev(struct auxiliary_device *adev)
> > +{
> > +     lockdep_assert_held(&gpio_shared_lock);
> > +
> > +     auxiliary_device_uninit(adev);
> > +     auxiliary_device_delete(adev);
>
> _destroy() ? Esp. taking into account the (wrong?) ordering.
>

You're right about the order but if you _add() then you should
_delete(). You typically _destroy() if you earlier _create().

> > +}
>
> ...
>
> > +             set_bit(GPIOD_FLAG_SHARED, flags);
>
> Do you need this to be atomic?
>
> > +             /*
> > +              * Shared GPIOs are not requested via the normal path. Ma=
ke
> > +              * them inaccessible to anyone even before we register th=
e
> > +              * chip.
> > +              */
> > +             set_bit(GPIOD_FLAG_REQUESTED, flags);
>
> Ditto.
>

Ok

> ...
>
> > +struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev)
> > +{
> > +     struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> > +     struct gpio_shared_desc *shared_desc;
> > +     struct gpio_shared_entry *entry;
> > +     struct gpio_shared_ref *ref;
> > +     struct gpio_device *gdev;
> > +     int ret;
>
> > + +   scoped_guard(mutex, &gpio_shared_lock) {
>
> Much better to split the below to a helper and make it run under a
> scoped_guard() here or call a guard()() there.
>

I'm not following, please rephrase.

> > +             list_for_each_entry(entry, &gpio_shared_list, list) {
> > +                     list_for_each_entry(ref, &entry->refs, list) {
> > +                             if (adev !=3D &ref->adev)
> > +                                     continue;
> > +
> > +                             if (entry->shared_desc) {
> > +                                     kref_get(&entry->ref);
> > +                                     shared_desc =3D entry->shared_des=
c;
> > +                                     break;
> > +                             }
> > +
> > +                             shared_desc =3D kzalloc(sizeof(*shared_de=
sc), GFP_KERNEL);
> > +                             if (!shared_desc)
> > +                                     return ERR_PTR(-ENOMEM);
> > +
> > +                             gdev =3D gpio_device_find_by_fwnode(entry=
->fwnode);
> > +                             if (!gdev) {
> > +                                     kfree(shared_desc);
> > +                                     return ERR_PTR(-EPROBE_DEFER);
> > +                             }
> > +
> > +                             shared_desc->desc =3D &gdev->descs[entry-=
>offset];
> > +                             shared_desc->can_sleep =3D gpiod_cansleep=
(shared_desc->desc);
> > +                             if (shared_desc->can_sleep)
> > +                                     mutex_init(&shared_desc->mutex);
> > +                             else
> > +                                     spin_lock_init(&shared_desc->spin=
lock);
> > +
> > +                             kref_init(&entry->ref);
> > +                             entry->shared_desc =3D shared_desc;
> > +
> > +                             pr_debug("Device %s acquired a reference =
to the shared GPIO %u owned by %s\n",
> > +                                      dev_name(dev), desc_to_gpio(shar=
ed_desc->desc),
> > +                                      gpio_device_get_label(gdev));
> > +                             break;
> > +                     }
> > +             }
> > +     }
> > +
> > +     ret =3D devm_add_action_or_reset(dev, gpiod_shared_put, entry);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return shared_desc;
> > +}
>
> ...
>
> > +/*
> > + * This is only called if gpio_shared_init() fails so it's in fact __i=
nit and
> > + * not __exit.
> > + */
>
> Fine. Have you checked if there are any section mismatch warnings during =
kernel
> (post)build?
>

Yes, there are none.

Bartosz

