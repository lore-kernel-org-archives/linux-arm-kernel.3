Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699DCD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 06:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJRypWbeH0Jlh+o3d5o6Use7WuuDSYprm2fFxG0iDUA=; b=KTY/zxu/kFdH2nl2LLmeZzeBjN
	uEOU8ig398hsW3Jzw8PFd0qwkoD7cqwCMFcbxFqCxBB8nJjNkHPYAMJSRrKPaSTCnYmDTFuHgRF5k
	olzo5Jz+sGSX/tPv1H8GlV/wu8L7H4CrcVaR0rs1dnw0RUjEW2HcZfbra/s2c7kli+6LHa/TNeI6k
	0X12g1B3LG628pA//4f0f/5AHMTlLBYTCaQ307iWOg/wD/yGXpaBjsMzrBMRTbZywRnk/8IGrk8px
	qSVecVMXTKNLPY4mzrqrk412EkEGzR17Cz/+S9CtoiRHzDovZw5xDRBGT3qPU2VWonkoW2x9NRwPX
	gpBhg1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrdw-0000000Duux-325F;
	Tue, 09 Dec 2025 06:56:16 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSrdt-0000000DuuD-3geY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 06:56:15 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-78c33d0df85so27991447b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 22:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1765263372; x=1765868172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJRypWbeH0Jlh+o3d5o6Use7WuuDSYprm2fFxG0iDUA=;
        b=dudgU+rcfmXpVrhlyvX1O1/QpNhBG7thuhVIMDoo6IRWnlI8lT8ems+8J8MJj8DHcl
         36qhtlBK7qMGQFSORi1VNJ6HK/lobONOOWtriolV5/bD1IPr5yS7sUBRILk6ktK1yupA
         xfJadXEJArR6As3nOTCvW8Qwh38W3kDRvSi/wTObubEJs8sPGYcWEm0wOFmXTdKFnuBJ
         6vSii/8/1J508fLu/DKpm309fwT69dB3orqSrmA86LwQ0Bg8rSMuKsIoVpKIl4vvL1ar
         FT7gVAo7IeZO6VOa/tuyD514Ee8wZiuYkNn/q9GL/PJ8DEI5gQko3EcPLZZkYqOmgVaj
         MSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765263372; x=1765868172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jJRypWbeH0Jlh+o3d5o6Use7WuuDSYprm2fFxG0iDUA=;
        b=MeMyBWYUlZwLdKySEbkBL7G6JIiYmYztpnFDXeB6rwDWhhkk7W/uo+3LwvvynkqZJC
         jYBNDSpnBOrN72eYhPL5vzwxc5FH7Fy0I6lCgPgUeC4Fk/w62lLMicTzNUdseMlSLjE8
         aPtKIjMqEusEWjjDCMsebNvgHG/wnqJBtIFZWHuerGHte26o3a58pOVhDeEcIO1kxgX/
         bq50Ilw+jSpkEchNyOp2C+rHctmss+kx4diaKCzw5dy4CNpxp1pBbbQ0/KgiW7Oi+N85
         c/REni0uvP4wnwGooD1u8lzUSPhf+u4FP7+idg6bb8/7G2nJ5jPJj6cqi6CiHc4tEhgS
         09PA==
X-Forwarded-Encrypted: i=1; AJvYcCU3KaSFPMNi/bejXzMH7lvfeqC5yF9k9QqaewAlWlABTm/wAOV2t8FdNyyB6Yk+YaWyu2tM+2rFGFGOWGIKnwNj@lists.infradead.org
X-Gm-Message-State: AOJu0YwXFOllFQf1HrrqmehGMFpZy7FBtpyBcJMckYHqIl977mXuq9Pv
	BNL0HqLD40m3+uB4JuQLQXDeQAmxCVGvppmR8I8OHKaTdz+WQtjuRsij9X441lodHUcNPPkm4L3
	vVPSNrpc=
X-Gm-Gg: AY/fxX5myOTHP4vUIDKTs0SGiJ/68k5h999cjQuBQDxFNa6VQv8xOkBceOUCW4wtS2r
	hubdFR4V6Ote4smkQ/cPLI+yDN7w8O9RKYkm0Lw4+mjykvNAm0xAYMpf8errrjxqq+GX/icQzAr
	6Nv/stf940gQwjNLHq7fL4kr5ly1IL9Te5UXKchrb0BB2z25NpQpPWXGZ5AB6y/VOoSltkuLzGj
	2NAIQmj7aVnO9s9d/CBjB4qkIjdw2hJOnRoSs7bhAl+jipu84JqpYKXEEcyiQch4jx9jQ2QFJoU
	MfnTh4pD5Fr8jvCq2XsPEu2KfQjnqBGtd2D/OPf7ekm4phPuEk+hnpyhyiY7eJ2myx1gua2J7CZ
	gu6InjuXo2nldMxuH/LjB8b+xqgcOr85DrGJj7sQ+4GRxQcjtj3GNwEbUhNaKre45cRPRCy0XRA
	ZDFDbuIYly5YQ0V4N9V5/geJUfPYa+Tkr3canBI71vY325/mktEQ==
X-Google-Smtp-Source: AGHT+IFFp902J6LO8l+69PvsaSKXNvvVB16TYtWKNdYCMZr+5uER4sjISsJPxFGlxNzrJBGr81LfOQ==
X-Received: by 2002:a05:690c:2501:b0:787:d2d1:af50 with SMTP id 00721157ae682-78c33c995ffmr94232947b3.64.1765263372132;
        Mon, 08 Dec 2025 22:56:12 -0800 (PST)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com. [74.125.224.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b77944bsm56152797b3.37.2025.12.08.22.56.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 22:56:11 -0800 (PST)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6443b62daf6so4501725d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 22:56:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWd80hdn+MYIKzGUzhoRmJMpREtKLiMopKTPQkFp7BBxad+Jw/rSmM2yujw2qfL77GQgfVXGRn+zG/ehbmRTWvJ@lists.infradead.org
X-Received: by 2002:a05:690e:408b:b0:644:477a:92b9 with SMTP id
 956f58d0204a3-6444e7c6b69mr8452913d50.63.1765263370781; Mon, 08 Dec 2025
 22:56:10 -0800 (PST)
MIME-Version: 1.0
References: <0b20d760-ad4f-41c0-b733-39db10d6cc41@cherry.de>
 <77685900-2c34-49b8-8c7e-14718841ef17@rock-chips.com> <fa82d11f-ce11-4feb-bdb4-c31d360a2a62@rock-chips.com>
In-Reply-To: <fa82d11f-ce11-4feb-bdb4-c31d360a2a62@rock-chips.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 9 Dec 2025 07:55:59 +0100
X-Gmail-Original-Message-ID: <CAAObsKDYLXVf1GdYUNeaOya+pWD4jTOEf55ouXAL9iM_kWCcMw@mail.gmail.com>
X-Gm-Features: AQt7F2pApKoA0CxuEDIlo_or-l4o2lVBApVFqX7KB8JXuBuMEZYSJcDkxkVuIlA
Message-ID: <CAAObsKDYLXVf1GdYUNeaOya+pWD4jTOEf55ouXAL9iM_kWCcMw@mail.gmail.com>
Subject: Re: Issues with DRM_ACCEL_ROCKET (Oops, power-domain, probe-ordering)
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_225614_076106_F182D556 
X-CRM114-Status: GOOD (  62.43  )
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

On Tue, Dec 2, 2025 at 8:00=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips.=
com> wrote:
>
> Hi Quentin,
>
> I finally had time to look into this today, and I think I've run into
> the same issue you did. Please see the comment below :)
>
> On 12/1/2025 2:24 PM, Chaoyi Chen wrote:
> > Hi Quentin,
> >
> > On 11/29/2025 2:41 AM, Quentin Schulz wrote:
> >> Hi all,
> >>
> >> I've finally found the time to test the RK3588 NPU (aka Rocket, upstre=
am) on our products and I've been hit with Oopses when loosely following th=
e instructions from https://docs.mesa3d.org/teflon.html. After debugging fo=
r a while this is often (not always!) reproducible when DRM_ACCEL_ROCKET=3D=
y (but not when built as a module!). The fact it's "not always" is a dead g=
iveaway timing or probe order is involved, more later on that.
> >>
> >
> > This looks like a power domain problem. What would happen if you tried
> > enabling the regulator for the NPU power domain in U-Boot?
> >
> > Or did you properly configure the corresponding regulator supply in
> > the power domain?
> >
> >
> >> I don't think the Oops is important as I believe it's a symptom of oth=
er issues, so I won't post it.
> >>
> >> I'll list the issue I've identified so far, some seem easier to fix th=
an others (the biggest issue of course being the hardest to fix).
> >>
> >> 1. https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/accel/roc=
ket/rocket_core.c#L79
> >>
> >> The error path after a failed pm_runtime_resume_and_get() probably sho=
uld be calling rocket_core_fini(core) and not rocket_job_fini() (the former=
 calls the latter) as to unwind everything that's been done in rocket_core_=
init() before this failed.
> >>
> >> The PM core complains about unbalanced something when the core fails t=
o init and is retried later.
> >>
> >> I suggest the following:
> >>
> >> """
> >> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket=
/rocket_core.c
> >> index abe7719c1db46..95a732ab418c3 100644
> >> --- a/drivers/accel/rocket/rocket_core.c
> >> +++ b/drivers/accel/rocket/rocket_core.c
> >> @@ -76,7 +76,7 @@ int rocket_core_init(struct rocket_core *core)
> >>
> >>      err =3D pm_runtime_resume_and_get(dev);
> >>      if (err) {
> >> -        rocket_job_fini(core);
> >> +        rocket_core_fini(core);
> >>          return err;
> >>      }
> >>
>
> pm_runtime_resume_and_get() will fail here because the pmdomain
> isn't ready yet.
>
> I think we should return -EPROBE_DEFER in this case.
>
> >> """
> >>
> >> I can send a patch for that.
> >>
> >> 2. rocket_probe() (https://elixir.bootlin.com/linux/v6.18-rc7/source/d=
rivers/accel/rocket/rocket_drv.c#L159) can result in out-of-bounds access w=
hen rocket_core_init() fails as rdev is a global variable (so rdev->num_cor=
es persists between tries). Considering rdev->cores is allocated based on t=
he number of available nodes in the DTB with the rknn compatible, if rocket=
_probe() is called more than the number of available nodes, rdev->cores[cor=
e] will result in out-of-bounds access.
> >>
> >> I believe we could do:
> >>
> >> """
> >> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/=
rocket_drv.c
> >> index 5c0b63f0a8f00..ad602ebd17c44 100644
> >> --- a/drivers/accel/rocket/rocket_drv.c
> >> +++ b/drivers/accel/rocket/rocket_drv.c
> >> @@ -158,6 +158,8 @@ static const struct drm_driver rocket_drm_driver =
=3D {
> >>
> >>  static int rocket_probe(struct platform_device *pdev)
> >>  {
> >> +    int ret;
> >> +
> >>      if (rdev =3D=3D NULL) {
> >>          /* First core probing, initialize DRM device. */
> >>          rdev =3D rocket_device_init(drm_dev, &rocket_drm_driver);
> >> @@ -177,7 +179,15 @@ static int rocket_probe(struct platform_device *p=
dev)
> >>
> >>      rdev->num_cores++;
> >>
> >> -    return rocket_core_init(&rdev->cores[core]);
> >> +    ret =3D rocket_core_init(&rdev->cores[core]);
> >> +    if (ret) {
> >> +        rdev->num_cores--;
> >> +        if (rdev->num_cores =3D=3D 0) {
> >> +            rocket_device_fini(rdev);
> >> +        }
> >> +    }
> >> +
> >> +    return ret;
> >>  }
> >>
> >>  static void rocket_remove(struct platform_device *pdev)
> >>
> >> """
> >>
> >
> > It seems hacky. I'm not sure whether this would be better
> > implemented as a component driver.
> >
>
> When I was looking at this code, it hadn't been merged yet,
> and there is a core0 device called "rknn_top". Likewise, there's
> a component over there. But in the latest version, it's gone :(
>
> And yes, core 0 is special [0]. So I think this change is make sense.
> But that's still not enough, because we may need to defer the probe.
> We have to make sure that when we probe next time, core 0 still gets
> index 0 here.
>
> [0] https://lore.kernel.org/all/20250721-6-10-rocket-v9-8-77ebd484941e@to=
meuvizoso.net/
>
> >> I can send a patch for that.
> >>
> >> 3. I believe (but I may be wrong) that core 0 is special (do we need t=
o schedule through core 0 maybe?). There's a hardcoded fetch of the device =
associated with core 0 via rocket_iommu_domain_create(rdev->cores[0].dev); =
(https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/accel/rocket/roc=
ket_drv.c#L88). The issue is that this assumes that core 0 is always rdev->=
cores[0], which may not be true as it depends on the probe order (which is =
not guaranteed), which can be exacerbated by core 0 (HW index) probe being =
deferred for some reason. Is it necessary for core 0 to be the one initiali=
zing the DRM device or could we simply use any core for that (just the firs=
t to probe, whichever it actually is HW-wise)?
>
> I agree with you about the probe order problem. As I mentioned,
> in earlier versions core 0 was still "rknn_top". It looks like this
> would address many of the problem you raised. I don't know why
> that was dropped in the merged version.

This need was questioned during the review process, and during my
stress testing I didn't find a need for core 0 to be treated
specially. So it was considered unneeded complexity and the code was
dropped.

My testing involves running the supported models as a whole, and also
their individual operations as individual tests. I run them in 8
parallel processes, in batches so we have continuous bring up and down
of clients.

I'm a bit surprised that that testing worked stably but we have still
failures in some setups.

Regards,

Tomeu



> >
> > I think this is because multiple cores share the same IOMMU device.
> >
> >>
> >> If there's a need to know which of the three cores is core 0, we can h=
ave a vendor property for it or maybe aliases for the cores? We can also do=
 a check on the base register address of the core in DT and then do a mappi=
ng in the driver. Any other suggestion?
> >>
> >> 4. The actual issue I'm unable to suggest something for comes now. The=
 following is all happening in the context of DRM_ACCEL_ROCKET being built-=
in (that is DRM_ACCEL_ROCKET=3Dy). You can use aarch64's default defconfig,=
 then DRM=3Dy, DRM_ACCEL=3Dy and DRM_ACCEL_ROCKET=3Dy via menuconfig. Remem=
ber that this is not 100% reproducible (more often happening than not).
> >>
> >> Points 1, 2 and 3 only are an issue if you hit some error-path during =
the probe of one of the cores, which is triggered by this point 4 here.
> >>
> >> rknn_core_0 depends on rknn_mmu_0 as highlighted by the iommus phandle=
 property. rknn_mmu_0 depends on RK3588_PD_NPUTOP power-domain. The parent =
domain (RK3588_PD_NPU) of RK3588_PD_NPUTOP power-domain has a domain-supply=
 on a regulator on i2c (i2c0@42 for Jaguar, patches on the ML at https://lo=
re.kernel.org/linux-rockchip/20250812085213.1071106-2-heiko@sntech.de/). Wh=
en the rocket driver calls platform_driver_register() in its module_init() =
function, the kernel core will try to probe the associated device, via driv=
er_probe_device(), then __driver_probe_device() and more specifically pm_ru=
ntime_get_suppliers(dev) in there (https://elixir.bootlin.com/linux/v6.18-r=
c7/source/drivers/base/dd.c#L793). Then this calls pm_runtime_get_sync() on=
 all links, c.f. https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/=
base/power/runtime.c#L1914. Note that pm_runtime_get_suppliers() returns vo=
id. One of the links is the rknn_mmu_0.
> >>
> >> Follow the next series of function calls, pm_runtime_get_sync() on rkn=
n_mmu_0, rpm_resume(), rpm_callback(), __rpm_callback(). This then calls cb=
(). cb() is set via RPM_GET_CALLBACK(dev, runtime_resume). Due to rknn_mmu_=
0 device being probed with dev_pm_domain_attach() attaching the power-domai=
n device to iommu via the pm_domain member, genpd_runtime_resume() (which g=
oes to rockchip_pd_power_on()) is actually called. This then calls rockchip=
_pd_regulator_enable() which returns -EPROBE_DEFER. Going up in the call st=
ack up to rpm_callback() you can see that retval =3D __rpm_callback(cb, dev=
); now is EPROBE_DEFER and thus, dev->power.runtime_error =3D EPROBE_DEFER =
at the end of the function.
> >>
> >> Then once pm_runtime_resume_and_get(dev); is called in rocket_core_ini=
t() during probe of the rocket device, it'll call into rpm_get_suppliers() =
in __rpm_callback() which in turn will call pm_runtime_get_sync() on rknn_m=
mu_0 which will go up to rpm_resume() where dev->power.runtime_error will b=
e checked and if non-zero will return -EINVAL, effectively eating -EPROBE_D=
EFER and failing the probe of the rocket device instead of deferring the pr=
obe.
> >>
> >> Applying the below patch:
> >>
> >> """
> >> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket=
/rocket_core.c
> >> index abe7719c1db46..c4692189bbfc6 100644
> >> --- a/drivers/accel/rocket/rocket_core.c
> >> +++ b/drivers/accel/rocket/rocket_core.c
> >> @@ -72,22 +72,9 @@ int rocket_core_init(struct rocket_core *core)
> >>       */
> >>      pm_runtime_set_autosuspend_delay(dev, 50);
> >>
> >> +    pm_runtime_set_suspended(dev);
> >>      pm_runtime_enable(dev);
> >>
> >> -    err =3D pm_runtime_resume_and_get(dev);
> >> -    if (err) {
> >> -        rocket_job_fini(core);
> >> -        return err;
> >> -    }
> >> -
> >> -    version =3D rocket_pc_readl(core, VERSION);
> >> -    version +=3D rocket_pc_readl(core, VERSION_NUM) & 0xffff;
> >> -
> >> -    pm_runtime_mark_last_busy(dev);
> >> -    pm_runtime_put_autosuspend(dev);
> >> -
> >> -    dev_info(dev, "Rockchip NPU core %d version: %d\n", core->index, =
version);
> >> -
> >>      return 0;
> >>  }
> >>
> >> """
> >>
>
> I believe that once the problems above are resolved, the complexity
> around point 4 will disappear as well.
>
> >> seems to make it possible to run mesa's example. If pm_runtime_set_sus=
pended(dev); isn't added, we'll only ever get job timeouts.
> >>
> >> Note that I'm pretty sure this isn't the proper way to do it but wante=
d to give some of my debugging attempts at that.
> >>
> >> I'm not sure how much further I can go and specifically I have no clue=
 how to handle that properly. Please also verify all the claims I'm making,=
 I'm not entirely sure I got every call stack right, it is quite convoluted=
 and I don't have experience with those frameworks.
> >>
> >> Does anyone have a clue how we can deal with that?
> >>
> >> The driver built as a module doesn't have this issue because the regul=
ator has enough time to probe so that PD doesn't return EPROBE_DEFER when t=
he rocket device gets probed once reaching userspace (where the module is).=
 I'm not entirely sure if this could be reproduced by having the regulator =
driver as a module too for example?
> >>
> >> Cheers,
> >> Quentin
> >>
> >> _______________________________________________
> >> Linux-rockchip mailing list
> >> Linux-rockchip@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> >
>
> --
> Best,
> Chaoyi

