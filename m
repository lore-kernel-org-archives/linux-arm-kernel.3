Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50382C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRbXwJ4vnB/zDj0rM1xWnMPZ+mVdznTRW5M3IQISchU=; b=lcX2/foCHSJy9SeAgagopoyp0Q
	txYRVJ5B2g1TRGagKPVU+fuKZvbtWQxqKcu/rSi6hzc9ve+dOib+fOjjEfzIvsop1fuF8pkQgx70U
	r20eYfWXQRgNkZ7jop+kuPvVn7t1uHgXsveKJ38EtSqXiyj6hTT08sLJ0UUiZCVxGP1uJbtXPKPiS
	+IKFyol3/Jj39cTgTPLv/cvpeJRjBJ4ny8rBT6GkZyODNYfVJX1G9h64+CDSWkPTwdZ7oji9jPTb4
	URJU03sx47JXE2rRf6EhWGSRh0v7WJzFRIewVgtyb07ztrTvnlW0qDTfCHO5ixgWqpCRV9dJaBULa
	iRml8+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBTA-000000060gn-3ilB;
	Tue, 08 Jul 2025 16:47:00 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAbt-00000005siy-3R0g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:51:59 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2e9a38d2a3aso4425749fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751989917; x=1752594717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRbXwJ4vnB/zDj0rM1xWnMPZ+mVdznTRW5M3IQISchU=;
        b=qUQko08Mbyey2yol6Rbmc5Lhps9JG9EeDDGrZz7ssJybk1vwvxVdw7tJ9MzSFx41sv
         oDoQTg8fa/IM0eZNUBFrGnaRwy9rp3GzA2zv6ruAQAHLrmb4LyUIlDJozWSVEyCPJ0SB
         O9NNi5nJut8F3NG2I06kJN4T/oN5Lj0lcYi0zmGk8+geEL3dqZcFu7z/LPOmymFIjdbh
         F2Yf1ad0doInlpObxWl2BgODNdaHFlA5fgQ6OtVMHrp9NrUMoi6rRqKJLikcS+pLWWTZ
         BdY5dioB8/X2WiCXqShrkAly5vtMwQMhaNQL8KvBiskhnS9wvZ6bhMm4ZwcJdVxtEBI3
         DN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751989917; x=1752594717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRbXwJ4vnB/zDj0rM1xWnMPZ+mVdznTRW5M3IQISchU=;
        b=DaRhlq58rtCD0jXoFip9bKHnDxurjx+uD+xbstX30n6H9TyAAG4cOO+Z9cHC/MxoY4
         x1XQS+M/aqa1y27W1YwYgPmCqqw+XRjeK4YPp/zIght/w0FhjzEpvXAlspH4KGzq9uHu
         kI8cHbXD7oq3/n1GfaZbJdKNk5/KZL7sJbMB2M1/68SodABgT+OZYwL9yYnHAUzwkOQO
         Mdz9TOrg+yBQuqOI5BpMqR14gBknSxh/Ud+/vfD7fNu4bJh9bEJ0vDGAx5aYZnWuuiNO
         RzlnB89GvWsoA/ZBsCwezy05cLkFGiH4/4U0L95PyVa9bdLFQtjdgIymjoAmNST+SWie
         oTpw==
X-Forwarded-Encrypted: i=1; AJvYcCXQpHDSDdsipcVlrd6uRCiWqwjAvWP2JVlc6PyXmWrefPLZO1MQdtqmJ7BapH5igOflv8Aj9EEWMobhIjC7H7YW@lists.infradead.org
X-Gm-Message-State: AOJu0YwEmyKUyal2J41sM3HXHEfhUD+pgs88FjT7OPDwlCynbMjFj5n2
	iGv2tIGzYDbAzemLIIZduL7rRAyCNTY8/12XxDSAaL2EMnWDKihZh3f/MC5GOO0bt3PWWzs7fpK
	WC4ncFUF/TiaivXJg0erNPraxmwzrl3BGlxzvBm6Iqw==
X-Gm-Gg: ASbGnctKn8Go/MQ1o/eLpaSRuUOuDaebmYtsoH7n1wYWnr8PRBxkPHijqZ+2cEajWtc
	S3DgI1T4AHE1lDll9/QyP02DdUVxmJzky5o2d6YLyBibUTujQuL5voJNoAtYmb+jwy/lqU17syU
	fnPUmsgnvImNUjaCIgMidP06w/oVIYFvEaz3FU5EO9gR/w
X-Google-Smtp-Source: AGHT+IGayKsL09US/aG4BWXfDqvwdj7IbiR5yylTrdq3b4SPkY53vMlQ75BaToWu3g2R7Y7GTXTocA55aVVbeeWQnIw=
X-Received: by 2002:a05:6870:85cd:b0:2ea:7101:7dc1 with SMTP id
 586e51a60fabf-2f796d387ddmr13310705fac.33.1751989916214; Tue, 08 Jul 2025
 08:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-gs101-cpuidle-v3-1-0200452dfe60@linaro.org>
 <91a9d4dbe5504c493856ef81b30d98e7da925ac0.camel@linaro.org> <232267bf-d226-43df-bd4f-5977706176a2@kernel.org>
In-Reply-To: <232267bf-d226-43df-bd4f-5977706176a2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 8 Jul 2025 16:51:43 +0100
X-Gm-Features: Ac12FXyQtnEeVlAK_PBT_PKHrE4fR7brNoVWCLA4QssHna082hO6RsgDRrOaQo8
Message-ID: <CADrjBPp5ndaEs=s-bZOyYnH21r=b2BoROC7+zV=dH_O2Pwxvmw@mail.gmail.com>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_085157_868343_2DA18C11 
X-CRM114-Status: GOOD (  22.70  )
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

On Thu, 3 Jul 2025 at 11:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 03/07/2025 12:12, Andr=C3=A9 Draszik wrote:
> > Thanks Pete for your patch!
> >
> > On Fri, 2025-06-27 at 14:08 +0100, Peter Griffin wrote:
> >> Register cpu pm notifiers for gs101 which call the
> >> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> >> hint. This is required to actually enter the C2 idle state.
> >>
> >> A couple of corner cases are handled, namely when the system is reboot=
ing
> >> or suspending we ignore the request. Additionally the request is ignor=
ed if
> >> the CPU is in CPU hot plug. Some common code is refactored so that it =
can
> >> be called from both the CPU hot plug callback and CPU PM notifier taki=
ng
> >> into account that CPU PM notifiers are called with IRQs disabled where=
as
> >> CPU hotplug callbacks aren't.
> >>
> >> Note: this patch has a runtime dependency on adding 'local-timer-stop'=
 dt
> >> property to the CPU nodes. This informs the time framework to switch t=
o a
> >> broadcast timer as the local timer will be shutdown. Without that DT
> >> property specified the system hangs in early boot with this patch appl=
ied.
> >>
> >> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >
> > With this applied, I see the following during boot:
> >
> > [    1.841304][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    1.841422][    T0] [ BUG: Invalid wait context ]
> > [    1.841550][    T0] 6.16.0-rc4-next-20250702+ #54 Tainted: G     U  =
        T
> > [    1.841727][    T0] -----------------------------
> > [    1.841844][    T0] swapper/0/0 is trying to lock:
> > [    1.841965][    T0] ffff000800ee84b8 (&pmu_context->cpupm_lock){....=
}-{3:3}
> > [    1.842001][    T0] , at: gs101_cpu_pm_notify_callback+0x48/0x100
> > [    1.842309][    T0] other info that might help us debug this:
> > [    1.842613][    T0] context-{5:5}
> > [    1.842987][    T0] 1 lock held by swapper/0/0:
> > [    1.843442][    T0]  #0:
> > [    1.843859][    T0] ffffafe9d8f1f100
> > [    1.844282][    T0]  (
> > [    1.844618][    T0] cpu_pm_notifier.lock
> > [    1.844980][    T0] ){....}-{2:2}, at: cpu_pm_enter+0x30/0x88
> > [    1.845340][    T0] stack backtrace:
> > [    1.845855][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G =
    U          T   6.16.0-rc4-next-20250702+ #54 PREEMPT
> > [    1.845878][    T0] Tainted: [U]=3DUSER, [T]=3DRANDSTRUCT
> > [    1.845884][    T0] Hardware name: Oriole (DT)
> > [    1.845897][    T0] Call trace:
> > [    1.845909][    T0]  show_stack+0x24/0x38 (C)
> > [    1.845934][    T0]  dump_stack_lvl+0x40/0xc0
> > [    1.845949][    T0]  dump_stack+0x18/0x24
> > [    1.845956][    T0]  __lock_acquire+0xc68/0xd90
> > [    1.845976][    T0]  lock_acquire+0x14c/0x2b8
> > [    1.845985][    T0]  _raw_spin_lock+0x54/0x78
> > [    1.846011][    T0]  gs101_cpu_pm_notify_callback+0x48/0x100
> > [    1.846021][    T0]  notifier_call_chain+0xb0/0x198
> > [    1.846046][    T0]  raw_notifier_call_chain_robust+0x50/0xb0
> > [    1.846053][    T0]  cpu_pm_enter+0x4c/0x88
> > [    1.846063][    T0]  psci_enter_idle_state+0x2c/0x70
> > [    1.846078][    T0]  cpuidle_enter_state+0x14c/0x4c0
> > [    1.846097][    T0]  cpuidle_enter+0x44/0x68
> > [    1.846121][    T0]  do_idle+0x1f0/0x2a8
> > [    1.846142][    T0]  cpu_startup_entry+0x40/0x50
> > [    1.846152][    T0]  rest_init+0x1c4/0x1d0
> > [    1.846161][    T0]  start_kernel+0x358/0x438
> > [    1.846181][    T0]  __primary_switched+0x88/0x98
>
> Thanks for the report. Probably such code should be always tested with
> lock debugging options enabled, e.g.:
> https://github.com/krzk/tools/blob/master/linux/build.sh#L845

Thanks for the tip, I will do it for future versions.

Peter

