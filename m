Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C721C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqzpN44guGdonZBxzCyAR5YSvJH+eiLOFsoMHP8Exug=; b=KPszf9kZX+Qesg04zVjZx7UJkP
	7l7uHiN5DETGKdSEN4StrpEz/waJY/kz9oR2xBrOEZzOfRwI+0GesJ7bwkgKSJJxwEiQOM9HpQL2t
	Y3kqigmuPvct2TibJj4fXeStk3eJKYNfD7bMyQvqzDout+c7ri1WYERCLzXaZr3CtEk2GtZ/1V4u6
	Vcmuw7uUSomolmncdFvaXnGi7W5dkcY7zmFTveSxypk8GjVboIj0simQldSlPKvZJCU8b1fGkO4oi
	U/i6fA/4LtfCfIiiJeNeESlaaq0jmEf/wdDp66aPdvrPqj1BmvIvp/uJM915NU1NlPD85nKhoYS8Z
	xjuezhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqJK-00000002rvR-3p1q;
	Thu, 09 Jul 2026 15:05:10 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqJH-00000002ruT-0y2z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:05:09 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-69532288224so1977899a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 08:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783609504; cv=none;
        d=google.com; s=arc-20260327;
        b=QMAQT41OA0N/YU58qswzPzV68O9Vrut+D6q04DlKnmwJow3fCweiM8+h9yMh5gT7Yo
         Xf/0rrj4U1zsv/gUl/JTF7ukQAnzWM1N41weYbS64vyA2zZ3DBStfPDvvsPG5T+vccPZ
         m5fg14fdoMRs+pSIykaMh0ZgvIF2nTWY+ybBzc9q+cs4Aj+s785rm3j8OlpERp6iURG/
         Tr1GU9vGjuAKmYm2AMqZQ+Cq5du6kWabcfV+JcxagHTZvLQZhx++SPZFdBX+SXIqMwD5
         e+6p0/os6wq3GZzb4Kng+H1Hjk35UY42HLG1oz1eDeA3oWT3TilGtkFp5csTXwk9xFAF
         LfsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZqzpN44guGdonZBxzCyAR5YSvJH+eiLOFsoMHP8Exug=;
        fh=z9qWJ+pkK1JHhIctnELtDpVduKxKSOYFhdkVYYZZGwA=;
        b=KdaB88rHmQv1SsZhglKurJh7oJgEhO9RvIkG7MqIh442SKc32x2MhAqw+BwcIc6yOj
         Zs4GVflHnJPGaPOY9jenWFLKwx8g7xerdTuiKONaavzPe9Nm2OHtIZwDTF6hiv/vaYAQ
         CZEaiRXKqRc5bLgsro7EkLnbr98Mv9F2gtKyR+cb2C1PPOx3TAzZKMT9CcvrCB2slgr/
         Wh96YQjogsh9FNc7WVUX2vLLN0L0EyFDG4dM4dh9fam14kFpLepmeEW+ll7Vpib88J6h
         cWxPhQmL/y/jdWNd0GDfIbdmMKv5NfhGh62kcQTeLO7Fcov/3nDsH1aBw5YwgZIzZtep
         ttGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783609504; x=1784214304; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqzpN44guGdonZBxzCyAR5YSvJH+eiLOFsoMHP8Exug=;
        b=T1PEEm9SjJR/uJvXT9E7hiosnKFp6pw9yOsW9F7FFnvVJJfArvZ3ZTG8Rsa7Rdp/aP
         uhGrq3cmtJLz9cr0C+97dzph68wgIKYfR+NARQA81swOKJeEserOdhzjBUw11gXpek6w
         7xNZOhkreyzrt0KJ4470a4QYnMUJih5F0uSxDyY47aFpA46XiAZPOqNR2ON6znWtNpof
         DYgi0V+u8v6nU3P+X4rsWhArfzfgrM08XEozssQ9TnlbAqU0j8IQWuJjRq8u4H9PfLJx
         dOkKJ+cZ6gwLTnhCQVHR1S24j5QmmUZtB3TzmHxlODrS1JmK30zvy2mtGOMf2wsn2gT3
         J4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609504; x=1784214304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqzpN44guGdonZBxzCyAR5YSvJH+eiLOFsoMHP8Exug=;
        b=IgI+rGn4p62e+v9iQJEHkcMxWMasal4IUnuBl2EFlTFImEVHMzVg963PaUuqLFa87o
         v6nH9d0GQBHfy1gVGxXAzc1MNGQ/tTfmuY6PJb3MCW8Rk3qG3/UCgwHX5akkH9Rm6LKg
         spyoDsAdQkxfpQECO9fNpGNC6OKDBGtPOzM0PZLfYJ02cfWqRZbT3D7DgdF7/snQ8CiY
         sWaffVM9ijNJEBYehoypx0O3r2fjFnB7wSa6rpxoonJ9CQ10mDEzOdGx+4nOh5gvR2h+
         8BekwDIKjqeBDAHN5VM6d2Hqab2TXroZI8o5AaR36/Bxisl/1Q/ut8LMq+mrrnBNEej8
         eeeA==
X-Forwarded-Encrypted: i=1; AHgh+RqK7GrKZKXIjX3S+0pGUfL4gBlOgWbTdSZ+sg+rsenBejPmHcFuvgDaoQF18IvWcNc2H7/Nkt+YzGYREdIu9BMz@lists.infradead.org
X-Gm-Message-State: AOJu0YxRRrV1TsfdKXt3rQ23A5LtaJwUWQqcCmD/+MyatcIu/zGXwstn
	qn2aKC2rAO/IURYqYoNeouqAhi9Ps9ICghqnsDwp5KTSTwvVTvNfcAqeteMxYbZ2TLb7PumxPon
	+CTM9SeQ9QaQnnn+I5wVAQPbaneReIETYkI5Y2Tl6Rw==
X-Gm-Gg: AfdE7cntsQODC7SIuU6o8UwZA3H8H09dw9E7pw2aHAYXSesoLUDck3u29aND7J2mxgR
	cTMpQFViCQo+n4E3KCmawz/P5dLKV4eJVrwmIXwlwOCWBORXksC39v+dmeafR5zyHWexmd8B3cU
	GVd1x1742VxZ1gVp8frAV3xYGI48Kac+DYYz+PU4AiBfcCSw7eNHF3y+snLCkhiiJ2D/gBtu0bH
	116HjAjg4EJGfDcrwMqOjyp5LSYPZGj1I0joloYEIzQzlf1gn6QeGlHtzURU+Lf75b0FHoe2kd9
	DiJeA5Pz5DvaTna8iIgSgccywQA7oYj34GkI
X-Received: by 2002:a05:6402:43c4:b0:698:af30:5dde with SMTP id
 4fb4d7f45d1cf-69ab44612bamr3206035a12.13.1783609504280; Thu, 09 Jul 2026
 08:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
In-Reply-To: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 9 Jul 2026 17:04:52 +0200
X-Gm-Features: AUfX_mxIBzHMPQNpSXnMtJ5nAckyvtqUZpsw3N-GZ2wcaGq2h6aw6oD6BWgvcxU
Message-ID: <CAKfTPtCQSjyGmqBOOV8BjqB5EEqjVjCQ8hihDFQ0umtaG1CWSg@mail.gmail.com>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, 
	Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <dlechner@baylibre.com>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_080507_538313_473F6E77 
X-CRM114-Status: GOOD (  19.57  )
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

On Thu, 9 Jul 2026 at 15:28, Michal Simek <michal.simek@amd.com> wrote:
>
> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
> SCMI server from different architectures than ARM that's why remove
> ARM/ARM64 Kconfig dependency with also remove ARM from description and
> rename folder to reflect it.
> From specification perspective only ARM specific transport layers should =
be
> available on ARM/ARM64 architectures.
>
> That's why get rid of ARM prefix and description from documentation, file
> names, folder names, MODULE description, module names, Kconfig and
> comments.
> But keep origin Kconfig symbols not to break existing users.
>
> Hwmon, pinctrl, powercap, regulator, reset, clk and cpufreq scmi drivers
> already miss arm prefix that's why synchronize all of them to be without
> arm prefix.
>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>
> Likely I missed other locations but I wanted to send this RFC to have a
> discussion about it.

FWIW, make sense to me
Acked-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  Documentation/power/energy-model.rst                  |  2 +-
>  .../translations/zh_CN/power/energy-model.rst         |  2 +-
>  MAINTAINERS                                           |  6 +++---
>  drivers/clk/clk-scmi.c                                |  2 +-
>  drivers/cpufreq/scmi-cpufreq.c                        |  2 +-
>  drivers/firmware/Kconfig                              |  2 +-
>  drivers/firmware/Makefile                             |  2 +-
>  drivers/firmware/{arm_scmi =3D> scmi}/Kconfig           | 11 +++++------
>  drivers/firmware/{arm_scmi =3D> scmi}/Makefile          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/base.c            |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/bus.c             |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/clock.c           |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/common.h          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/driver.c          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/msg.c             |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/notify.c          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/notify.h          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/perf.c            |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/pinctrl.c         |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/power.c           |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/powercap.c        |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/protocols.h       |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/quirks.c          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/quirks.h          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/raw_mode.c        |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/raw_mode.h        |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/reset.c           |  0
>  .../firmware/{arm_scmi =3D> scmi}/scmi_power_control.c  |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/sensors.c         |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/shmem.c           |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/system.c          |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/Kconfig    |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/Makefile   |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/mailbox.c  |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/optee.c    |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/transports/smc.c  |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/virtio.c   |  0
>  .../firmware/{arm_scmi =3D> scmi}/vendors/imx/Kconfig   |  0
>  .../firmware/{arm_scmi =3D> scmi}/vendors/imx/Makefile  |  0
>  .../{arm_scmi =3D> scmi}/vendors/imx/imx-sm-bbm.c       |  0
>  .../{arm_scmi =3D> scmi}/vendors/imx/imx-sm-cpu.c       |  0
>  .../{arm_scmi =3D> scmi}/vendors/imx/imx-sm-lmm.c       |  0
>  .../{arm_scmi =3D> scmi}/vendors/imx/imx-sm-misc.c      |  0
>  .../firmware/{arm_scmi =3D> scmi}/vendors/imx/imx95.rst |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/voltage.c         |  0
>  drivers/gpio/Kconfig                                  |  2 +-
>  drivers/hwmon/Kconfig                                 |  2 +-
>  drivers/iio/common/scmi_sensors/Kconfig               |  2 +-
>  drivers/pinctrl/pinctrl-scmi.c                        |  2 +-
>  drivers/pmdomain/arm/scmi_perf_domain.c               |  2 +-
>  drivers/pmdomain/arm/scmi_pm_domain.c                 |  2 +-
>  drivers/powercap/Kconfig                              |  4 ++--
>  drivers/powercap/Makefile                             |  2 +-
>  .../powercap/{arm_scmi_powercap.c =3D> scmi_powercap.c} |  2 +-
>  drivers/regulator/scmi-regulator.c                    |  2 +-
>  drivers/reset/Kconfig                                 |  2 +-
>  drivers/reset/reset-scmi.c                            |  4 ++--
>  57 files changed, 28 insertions(+), 29 deletions(-)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/Kconfig (91%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/Makefile (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/base.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/bus.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/clock.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/common.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/driver.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/msg.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/notify.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/notify.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/perf.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/pinctrl.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/power.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/powercap.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/protocols.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/quirks.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/quirks.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/raw_mode.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/raw_mode.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/reset.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/scmi_power_control.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/sensors.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/shmem.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/system.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/Kconfig (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/Makefile (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/mailbox.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/optee.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/smc.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/virtio.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/Kconfig (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/Makefile (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx-sm-bbm.c (1=
00%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx-sm-cpu.c (1=
00%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx-sm-lmm.c (1=
00%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx-sm-misc.c (=
100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx95.rst (100%=
)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/voltage.c (100%)
>  rename drivers/powercap/{arm_scmi_powercap.c =3D> scmi_powercap.c} (99%)
>
> diff --git a/Documentation/power/energy-model.rst b/Documentation/power/e=
nergy-model.rst
> index 0d4644d72767..ca147ea36232 100644
> --- a/Documentation/power/energy-model.rst
> +++ b/Documentation/power/energy-model.rst
> @@ -56,7 +56,7 @@ framework, and interested clients reading the data from=
 it::
>                  +----------+       |       +---------+
>                  |                  |                 |
>          +---------------+  +---------------+  +--------------+
> -        |  cpufreq-dt   |  |   arm_scmi    |  |    Other     |
> +        |  cpufreq-dt   |  |      scmi     |  |    Other     |
>          +---------------+  +---------------+  +--------------+
>                  ^                  ^                 ^
>                  |                  |                 |
> diff --git a/Documentation/translations/zh_CN/power/energy-model.rst b/Do=
cumentation/translations/zh_CN/power/energy-model.rst
> index 48849919d8aa..057c76a087cd 100644
> --- a/Documentation/translations/zh_CN/power/energy-model.rst
> +++ b/Documentation/translations/zh_CN/power/energy-model.rst
> @@ -54,7 +54,7 @@ Documentation/driver-api/thermal/power_allocator.rst=E6=
=96=87=E6=A1=A3=E4=B8=AD=E6=89=BE=E5=88=B0=E3=80=82
>                  +----------+       |       +---------+
>                  |                  |                 |
>          +---------------+  +---------------+  +--------------+
> -        |  cpufreq-dt   |  |   arm_scmi    |  |    Other     |
> +        |  cpufreq-dt   |  |      scmi     |  |    Other     |
>          +---------------+  +---------------+  +--------------+
>                  ^                  ^                 ^
>                  |                  |                 |
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f37a81950e25..a15909357b10 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26293,12 +26293,12 @@ S:    Maintained
>  F:     Documentation/devicetree/bindings/firmware/arm,sc[mp]i.yaml
>  F:     drivers/clk/clk-sc[mp]i.c
>  F:     drivers/cpufreq/sc[mp]i-cpufreq.c
> -F:     drivers/firmware/arm_scmi/
> +F:     drivers/firmware/scmi/
>  F:     drivers/firmware/arm_scpi.c
>  F:     drivers/hwmon/scmi-hwmon.c
>  F:     drivers/pinctrl/pinctrl-scmi.c
>  F:     drivers/pmdomain/arm/
> -F:     drivers/powercap/arm_scmi_powercap.c
> +F:     drivers/powercap/scmi_powercap.c
>  F:     drivers/regulator/scmi-regulator.c
>  F:     drivers/reset/reset-scmi.c
>  F:     include/linux/sc[mp]i_protocol.h
> @@ -26312,7 +26312,7 @@ L:      imx@lists.linux.dev
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/firmware/nxp,*scmi.yaml
> -F:     drivers/firmware/arm_scmi/vendors/imx/
> +F:     drivers/firmware/scmi/vendors/imx/
>
>  SYSTEM RESET/SHUTDOWN DRIVERS
>  M:     Sebastian Reichel <sre@kernel.org>
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 7c562559ad8b..d8736feb73fd 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -481,5 +481,5 @@ static struct scmi_driver scmi_clocks_driver =3D {
>  module_scmi_driver(scmi_clocks_driver);
>
>  MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI clock driver");
> +MODULE_DESCRIPTION("SCMI clock driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufre=
q.c
> index 4edb4f7a8aa9..51cff1838aca 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -493,5 +493,5 @@ static struct scmi_driver scmi_cpufreq_drv =3D {
>  module_scmi_driver(scmi_cpufreq_drv);
>
>  MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI CPUFreq interface driver");
> +MODULE_DESCRIPTION("SCMI CPUFreq interface driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 12dc70254842..79c2477b1a7a 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -6,7 +6,7 @@
>
>  menu "Firmware Drivers"
>
> -source "drivers/firmware/arm_scmi/Kconfig"
> +source "drivers/firmware/scmi/Kconfig"
>
>  config ARM_SCPI_PROTOCOL
>         tristate "ARM System Control and Power Interface (SCPI) Message P=
rotocol"
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 4ddec2820c96..0d4c2f29069a 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -24,7 +24,7 @@ obj-$(CONFIG_TRUSTED_FOUNDATIONS) +=3D trusted_foundati=
ons.o
>  obj-$(CONFIG_TURRIS_MOX_RWTM)  +=3D turris-mox-rwtm.o
>
>  obj-y                          +=3D arm_ffa/
> -obj-y                          +=3D arm_scmi/
> +obj-y                          +=3D scmi/
>  obj-y                          +=3D broadcom/
>  obj-y                          +=3D cirrus/
>  obj-y                          +=3D meson/
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/scmi/Kc=
onfig
> similarity index 91%
> rename from drivers/firmware/arm_scmi/Kconfig
> rename to drivers/firmware/scmi/Kconfig
> index e3fb36825978..167c22a788a8 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/scmi/Kconfig
> @@ -1,11 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -menu "ARM System Control and Management Interface Protocol"
> +menu "System Control and Management Interface Protocol"
>
>  config ARM_SCMI_PROTOCOL
> -       tristate "ARM System Control and Management Interface (SCMI) Mess=
age Protocol"
> -       depends on ARM || ARM64 || COMPILE_TEST
> +       tristate "System Control and Management Interface (SCMI) Message =
Protocol"
>         help
> -         ARM System Control and Management Interface (SCMI) protocol is =
a
> +         System Control and Management Interface (SCMI) protocol is a
>           set of operating system-independent software interfaces that ar=
e
>           used in system management. SCMI is extensible and currently pro=
vides
>           interfaces for: Discovery and self-description of the interface=
s
> @@ -82,8 +81,8 @@ config ARM_SCMI_QUIRKS
>           depending on the SCMI firmware advertised versions and/or machi=
ne
>           compatibles.
>
> -source "drivers/firmware/arm_scmi/transports/Kconfig"
> -source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
> +source "drivers/firmware/scmi/transports/Kconfig"
> +source "drivers/firmware/scmi/vendors/imx/Kconfig"
>
>  endif #ARM_SCMI_PROTOCOL
>
> diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/scmi/M=
akefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/Makefile
> rename to drivers/firmware/scmi/Makefile
> diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/scmi/bas=
e.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/base.c
> rename to drivers/firmware/scmi/base.c
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/scmi/bus.=
c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/bus.c
> rename to drivers/firmware/scmi/bus.c
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/scmi/cl=
ock.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/clock.c
> rename to drivers/firmware/scmi/clock.c
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/scmi/c=
ommon.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/common.h
> rename to drivers/firmware/scmi/common.h
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/scmi/d=
river.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/driver.c
> rename to drivers/firmware/scmi/driver.c
> diff --git a/drivers/firmware/arm_scmi/msg.c b/drivers/firmware/scmi/msg.=
c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/msg.c
> rename to drivers/firmware/scmi/msg.c
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/scmi/n=
otify.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/notify.c
> rename to drivers/firmware/scmi/notify.c
> diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/scmi/n=
otify.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/notify.h
> rename to drivers/firmware/scmi/notify.h
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/scmi/per=
f.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/perf.c
> rename to drivers/firmware/scmi/perf.c
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/scmi/=
pinctrl.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/pinctrl.c
> rename to drivers/firmware/scmi/pinctrl.c
> diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/scmi/po=
wer.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/power.c
> rename to drivers/firmware/scmi/power.c
> diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/scmi=
/powercap.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/powercap.c
> rename to drivers/firmware/scmi/powercap.c
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/scm=
i/protocols.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/protocols.h
> rename to drivers/firmware/scmi/protocols.h
> diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/scmi/q=
uirks.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/quirks.c
> rename to drivers/firmware/scmi/quirks.c
> diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/scmi/q=
uirks.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/quirks.h
> rename to drivers/firmware/scmi/quirks.h
> diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/scmi=
/raw_mode.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/raw_mode.c
> rename to drivers/firmware/scmi/raw_mode.c
> diff --git a/drivers/firmware/arm_scmi/raw_mode.h b/drivers/firmware/scmi=
/raw_mode.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/raw_mode.h
> rename to drivers/firmware/scmi/raw_mode.h
> diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/scmi/re=
set.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/reset.c
> rename to drivers/firmware/scmi/reset.c
> diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/fir=
mware/scmi/scmi_power_control.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/scmi_power_control.c
> rename to drivers/firmware/scmi/scmi_power_control.c
> diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/scmi/=
sensors.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/sensors.c
> rename to drivers/firmware/scmi/sensors.c
> diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/scmi/sh=
mem.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/shmem.c
> rename to drivers/firmware/scmi/shmem.c
> diff --git a/drivers/firmware/arm_scmi/system.c b/drivers/firmware/scmi/s=
ystem.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/system.c
> rename to drivers/firmware/scmi/system.c
> diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmw=
are/scmi/transports/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/Kconfig
> rename to drivers/firmware/scmi/transports/Kconfig
> diff --git a/drivers/firmware/arm_scmi/transports/Makefile b/drivers/firm=
ware/scmi/transports/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/Makefile
> rename to drivers/firmware/scmi/transports/Makefile
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/fir=
mware/scmi/transports/mailbox.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/mailbox.c
> rename to drivers/firmware/scmi/transports/mailbox.c
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmw=
are/scmi/transports/optee.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/optee.c
> rename to drivers/firmware/scmi/transports/optee.c
> diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmwar=
e/scmi/transports/smc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/smc.c
> rename to drivers/firmware/scmi/transports/smc.c
> diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firm=
ware/scmi/transports/virtio.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/virtio.c
> rename to drivers/firmware/scmi/transports/virtio.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firm=
ware/scmi/vendors/imx/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/Kconfig
> rename to drivers/firmware/scmi/vendors/imx/Kconfig
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/fir=
mware/scmi/vendors/imx/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/Makefile
> rename to drivers/firmware/scmi/vendors/imx/Makefile
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers=
/firmware/scmi/vendors/imx/imx-sm-bbm.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
> rename to drivers/firmware/scmi/vendors/imx/imx-sm-bbm.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers=
/firmware/scmi/vendors/imx/imx-sm-cpu.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> rename to drivers/firmware/scmi/vendors/imx/imx-sm-cpu.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers=
/firmware/scmi/vendors/imx/imx-sm-lmm.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
> rename to drivers/firmware/scmi/vendors/imx/imx-sm-lmm.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/driver=
s/firmware/scmi/vendors/imx/imx-sm-misc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> rename to drivers/firmware/scmi/vendors/imx/imx-sm-misc.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/fi=
rmware/scmi/vendors/imx/imx95.rst
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> rename to drivers/firmware/scmi/vendors/imx/imx95.rst
> diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/scmi/=
voltage.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/voltage.c
> rename to drivers/firmware/scmi/voltage.c
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 28cf6d2e83c2..1319c466ee87 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -262,7 +262,7 @@ config GPIO_BY_PINCTRL
>           create a simple GPIO device based on the pin control interface
>           without doing anything custom.
>
> -         This driver is used to access GPIOs over the ARM SCMI protocol.
> +         This driver is used to access GPIOs over the SCMI protocol.
>
>  config GPIO_CADENCE
>         tristate "Cadence GPIO support"
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d59..cda0aedb36ca 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -401,7 +401,7 @@ config SENSORS_ARCTIC_FAN_CONTROLLER
>           will be called arctic_fan_controller.
>
>  config SENSORS_ARM_SCMI
> -       tristate "ARM SCMI Sensors"
> +       tristate "SCMI Sensors"
>         depends on ARM_SCMI_PROTOCOL
>         depends on THERMAL || !THERMAL_OF
>         help
> diff --git a/drivers/iio/common/scmi_sensors/Kconfig b/drivers/iio/common=
/scmi_sensors/Kconfig
> index 67e084cbb1ab..5c152d9d30d2 100644
> --- a/drivers/iio/common/scmi_sensors/Kconfig
> +++ b/drivers/iio/common/scmi_sensors/Kconfig
> @@ -12,7 +12,7 @@ config IIO_SCMI
>          select IIO_KFIFO_BUF
>         help
>            Say yes here to build support for IIO SCMI Driver.
> -          This provides ARM SCMI Protocol based IIO device.
> +          This provides SCMI Protocol based IIO device.
>            This driver provides support for accelerometer and gyroscope
>            sensors available on SCMI based platforms.
>  endmenu
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scm=
i.c
> index 1bb36ca477b7..e6fb0699c0a2 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -595,5 +595,5 @@ module_scmi_driver(scmi_pinctrl_driver);
>
>  MODULE_AUTHOR("Oleksii Moisieiev <oleksii_moisieiev@epam.com>");
>  MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> -MODULE_DESCRIPTION("ARM SCMI pin controller driver");
> +MODULE_DESCRIPTION("SCMI pin controller driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/a=
rm/scmi_perf_domain.c
> index 3693423459c9..00bae4e04aaa 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -184,5 +184,5 @@ static struct scmi_driver scmi_perf_domain_driver =3D=
 {
>  module_scmi_driver(scmi_perf_domain_driver);
>
>  MODULE_AUTHOR("Ulf Hansson <ulf.hansson@linaro.org>");
> -MODULE_DESCRIPTION("ARM SCMI perf domain driver");
> +MODULE_DESCRIPTION("SCMI perf domain driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm=
/scmi_pm_domain.c
> index 3d73aef21d2f..64ac7566d943 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -168,5 +168,5 @@ static struct scmi_driver scmi_power_domain_driver =
=3D {
>  module_scmi_driver(scmi_power_domain_driver);
>
>  MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI power domain driver");
> +MODULE_DESCRIPTION("SCMI power domain driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/powercap/Kconfig b/drivers/powercap/Kconfig
> index 03c4c796d993..d3eda4a70978 100644
> --- a/drivers/powercap/Kconfig
> +++ b/drivers/powercap/Kconfig
> @@ -61,7 +61,7 @@ config IDLE_INJECT
>           on a per CPU basis.
>
>  config ARM_SCMI_POWERCAP
> -       tristate "ARM SCMI Powercap driver"
> +       tristate "SCMI Powercap driver"
>         depends on ARM_SCMI_PROTOCOL
>         help
>           This enables support for the ARM Powercap based on ARM SCMI
> @@ -71,7 +71,7 @@ config ARM_SCMI_POWERCAP
>           and monitored against the SCMI Powercap domains advertised as
>           available by the SCMI platform firmware.
>
> -         When compiled as module it will be called arm_scmi_powercap.ko.
> +         When compiled as module it will be called scmi_powercap.ko.
>
>  config DTPM
>         bool "Power capping for Dynamic Thermal Power Management (EXPERIM=
ENTAL)"
> diff --git a/drivers/powercap/Makefile b/drivers/powercap/Makefile
> index 5ab0dce565b9..b0d5d1e91d7e 100644
> --- a/drivers/powercap/Makefile
> +++ b/drivers/powercap/Makefile
> @@ -7,4 +7,4 @@ obj-$(CONFIG_INTEL_RAPL_CORE) +=3D intel_rapl_common.o
>  obj-$(CONFIG_INTEL_RAPL) +=3D intel_rapl_msr.o
>  obj-$(CONFIG_INTEL_RAPL_TPMI) +=3D intel_rapl_tpmi.o
>  obj-$(CONFIG_IDLE_INJECT) +=3D idle_inject.o
> -obj-$(CONFIG_ARM_SCMI_POWERCAP) +=3D arm_scmi_powercap.o
> +obj-$(CONFIG_ARM_SCMI_POWERCAP) +=3D scmi_powercap.o
> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/scmi=
_powercap.c
> similarity index 99%
> rename from drivers/powercap/arm_scmi_powercap.c
> rename to drivers/powercap/scmi_powercap.c
> index ab66e9a3b1e2..24eef8045e80 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/scmi_powercap.c
> @@ -546,5 +546,5 @@ static void __exit scmi_powercap_exit(void)
>  module_exit(scmi_powercap_exit);
>
>  MODULE_AUTHOR("Cristian Marussi <cristian.marussi@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI Powercap driver");
> +MODULE_DESCRIPTION("SCMI Powercap driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/regulator/scmi-regulator.c b/drivers/regulator/scmi-=
regulator.c
> index c005e65ba0ec..ffceaa66e257 100644
> --- a/drivers/regulator/scmi-regulator.c
> +++ b/drivers/regulator/scmi-regulator.c
> @@ -417,5 +417,5 @@ static struct scmi_driver scmi_drv =3D {
>  module_scmi_driver(scmi_drv);
>
>  MODULE_AUTHOR("Cristian Marussi <cristian.marussi@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI regulator driver");
> +MODULE_DESCRIPTION("SCMI regulator driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..f09d2107d158 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -264,7 +264,7 @@ config RESET_RZV2H_USB2PHY
>           (and similar SoCs).
>
>  config RESET_SCMI
> -       tristate "Reset driver controlled via ARM SCMI interface"
> +       tristate "Reset driver controlled via SCMI interface"
>         depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
>         default ARM_SCMI_PROTOCOL
>         help
> diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
> index 4335811e0cfa..a4f95a7fff87 100644
> --- a/drivers/reset/reset-scmi.c
> +++ b/drivers/reset/reset-scmi.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * ARM System Control and Management Interface (ARM SCMI) reset driver
> + * System Control and Management Interface (SCMI) reset driver
>   *
>   * Copyright (C) 2019-2021 ARM Ltd.
>   */
> @@ -128,5 +128,5 @@ static struct scmi_driver scmi_reset_driver =3D {
>  module_scmi_driver(scmi_reset_driver);
>
>  MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI reset controller driver");
> +MODULE_DESCRIPTION("SCMI reset controller driver");
>  MODULE_LICENSE("GPL v2");
> ---
> base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
> branch: xnext/scmi
>
> --
> 2.43.0
>

