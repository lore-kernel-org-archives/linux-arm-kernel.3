Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71973CDC198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzcLdE5lW6KjrMioL4MVcYHG8ltNGC1zHqzO2YGzVIs=; b=o/QXc04hlmy0Lu3HCS73niOMi5
	X2jtAJ/QcV60ZmnzkuwYvC5EmU4p99nUxJq1RydfOuIG9GNe/7VOXrFB3rXRGOFgK+fL/VfZRN4xn
	JKnn7TORsgb7NpnyWiJJsVOsAABM851jGdAf3vhLlaOQaTUhPnKZ3cud5QGey/eUoB95nXw7N5iYb
	Xmo+sgl92WBrOJlgvyWY2BykL6OsEAJwxHiZHLnbjPGHYhCLiX4PzlJma5DjPf1iyJtlE7XwGEbf8
	QWTwe6+NHARjl+CU6AfsAwcVFMMXA675mq+0U/4NjpDnHAdu7Z/Rb1LCkCZVyog/8BJLBAPoa46DI
	4GL4RP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPzu-0000000EYPu-0oQV;
	Wed, 07 Jan 2026 09:38:34 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPzr-0000000EYOo-3KsJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:38:33 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-657490df6f3so923585eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767778710; x=1768383510; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzcLdE5lW6KjrMioL4MVcYHG8ltNGC1zHqzO2YGzVIs=;
        b=rdKsBT7yaUp/VLMtJ9J1TqeIrkt7cNL/dq0rLiu9U4vA6zrV/w7AB8JqAxrb7L4mc9
         ERJFupxbQhLGXkzX3kv2KlMTeYvGWcXK0uhTT02ZEwNIM1VoN7n11b1QC05Nas/7x6lP
         N6DxzcW2fezyimaz4CiTizphB6OZ5+uQxwv4altWzlfQYFqODMwV0TsIkzpLw0uP+2Hz
         LsVvEe/BkDg2MArjIsWD+EUBAhXZZIu6UE87MzsWK2D26nhIbOlBXsxcTWEdLC4DMSyv
         mPjgmwn1AGUzHFcyej4PJwNv6UwiO6NPbGq2rcVQV1yj/6/24CPklVkRyi119Nvvzeyb
         L8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778710; x=1768383510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lzcLdE5lW6KjrMioL4MVcYHG8ltNGC1zHqzO2YGzVIs=;
        b=u6hV1LtElmFatKUbMHgLoUrJie3BBovXJGdwBmfIkgTSzWidGqGLyix++Ue4K+Yosm
         86+W8+CAm4L2Q8M4Rs1i+miDITcnER1NZKylbSnGbX8D4p2dK74xM5Gb4dJU+8NaAxX6
         OiWhmr5sIS4DlEwuMc1YXAGJYFgZ6owvazeVSgbeIA/AxeUuYMKVvM1hzVPmFW4yjZkH
         RD9ZCczUbLKPPPGJCz9vrbkVuALU7LVj+8MS7n9x9tmdTGOL8FNGS8d73FL+myiO/QZM
         HUBc6JzYktL+koNgjQJ20haz+VpRN9YIDuey6qiP6JGKnS9Cw1xgknXYojDbyQuPNIOt
         IbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyORkjXSLhq4CyxhqzbWxeOgDukYBRAdVm+ofH1zgItnMa3lRuc1hL+77R1GugqbacxLolQR7DeHJ6DDC/aXQf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+FLnlTBvcQFiMNtVRI8k+t/ScVPXPZCJCAt2rx61Gu8RN4los
	4cYhDawMiXhGonAdJr2cNldqrlcuvSindzADk4n+xsqWgpBaMKGO1k8AadU8kVkZFiM5E92WqgV
	PtY22p6bbcJOjG7rtvjRmjaJeyy6jxMYvRZEuQ2e+kw==
X-Gm-Gg: AY/fxX7RCtJbQr7mplzjefHL2NAdyCZyLPAkqdPSU/73e689mXgwjw0oVz3IOZI+H5p
	uX4xXe7ZpX3wAPVIgzAydF4N1g1/MM5BJR504v2+N31Ib1aj1Q5yZ6bOwv2vsmpynsgBZ6rggRy
	x4uA3b/PdZRXosG+kJCGhiiS1BnlB4zgep6vnTLssqq84yt7RTcJb1pbIDUuaUZGvQl+Rx6lxva
	yEnMpF0TXGNQbZl35KsHa8GFjimDVpXiy55EHljlXRvDEqXYEAa1b6kWQ9R9whFFUIT5hFp5wKW
	q40VljTK70GAGJdDhMmxF6GoTg==
X-Google-Smtp-Source: AGHT+IHSj3fyWcR8PeI71mFrFGfZpz1gtYlT37IzGcQAYuwipaKr7ifaf9acDpnsMoegGnuUM/krqm4/4tHZyu+YBdY=
X-Received: by 2002:a05:6820:f02e:b0:659:9a49:8ff0 with SMTP id
 006d021491bc7-65f54ef5252mr794898eaf.29.1767778710402; Wed, 07 Jan 2026
 01:38:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
 <20251218135332f323fa91@mail.local> <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
 <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com> <aV0Qx5BOso5co3tm@bogus>
In-Reply-To: <aV0Qx5BOso5co3tm@bogus>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 7 Jan 2026 10:38:19 +0100
X-Gm-Features: AQt7F2rcNsjXN7djR70fxjzIrnv1VtdzPp10juTq1vFrm5vuVSwDuqGbqR3kJLk
Message-ID: <CAHUa44FhRO0AO3nDXSoZ7O_9T3EFB47D34zRooCTd6fhXFzxXw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] tee: Use bus callbacks instead of driver callbacks
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Corbet <corbet@lwn.net>, Sumit Garg <sumit.garg@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_013831_846980_1AB5153D 
X-CRM114-Status: GOOD (  45.49  )
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

On Tue, Jan 6, 2026 at 2:40=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com> =
wrote:
>
> On Mon, Jan 05, 2026 at 10:16:09AM +0100, Jens Wiklander wrote:
> > Hi,
> >
> > On Thu, Dec 18, 2025 at 5:29=E2=80=AFPM Jens Wiklander
> > <jens.wiklander@linaro.org> wrote:
> > >
> > > On Thu, Dec 18, 2025 at 2:53=E2=80=AFPM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > On 18/12/2025 08:21:27+0100, Jens Wiklander wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Dec 15, 2025 at 3:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > > > > <u.kleine-koenig@baylibre.com> wrote:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > the objective of this series is to make tee driver stop using c=
allbacks
> > > > > > in struct device_driver. These were superseded by bus methods i=
n 2006
> > > > > > (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shut=
down
> > > > > > methods.")) but nobody cared to convert all subsystems accordin=
gly.
> > > > > >
> > > > > > Here the tee drivers are converted. The first commit is somewha=
t
> > > > > > unrelated, but simplifies the conversion (and the drivers). It
> > > > > > introduces driver registration helpers that care about setting =
the bus
> > > > > > and owner. (The latter is missing in all drivers, so by using t=
hese
> > > > > > helpers the drivers become more correct.)
> > > > > >
> > > > > > v1 of this series is available at
> > > > > > https://lore.kernel.org/all/cover.1765472125.git.u.kleine-koeni=
g@baylibre.com
> > > > > >
> > > > > > Changes since v1:
> > > > > >
> > > > > >  - rebase to v6.19-rc1 (no conflicts)
> > > > > >  - add tags received so far
> > > > > >  - fix whitespace issues pointed out by Sumit Garg
> > > > > >  - fix shutdown callback to shutdown and not remove
> > > > > >
> > > > > > As already noted in v1's cover letter, this series should go in=
 during a
> > > > > > single merge window as there are runtime warnings when the seri=
es is
> > > > > > only applied partially. Sumit Garg suggested to apply the whole=
 series
> > > > > > via Jens Wiklander's tree.
> > > > > > If this is done the dependencies in this series are honored, in=
 case the
> > > > > > plan changes: Patches #4 - #17 depend on the first two.
> > > > > >
> > > > > > Note this series is only build tested.
> > > > > >
> > > > > > Uwe Kleine-K=C3=B6nig (17):
> > > > > >   tee: Add some helpers to reduce boilerplate for tee client dr=
ivers
> > > > > >   tee: Add probe, remove and shutdown bus callbacks to tee_clie=
nt_driver
> > > > > >   tee: Adapt documentation to cover recent additions
> > > > > >   hwrng: optee - Make use of module_tee_client_driver()
> > > > > >   hwrng: optee - Make use of tee bus methods
> > > > > >   rtc: optee: Migrate to use tee specific driver registration f=
unction
> > > > > >   rtc: optee: Make use of tee bus methods
> > > > > >   efi: stmm: Make use of module_tee_client_driver()
> > > > > >   efi: stmm: Make use of tee bus methods
> > > > > >   firmware: arm_scmi: optee: Make use of module_tee_client_driv=
er()
> > > > > >   firmware: arm_scmi: Make use of tee bus methods
> > > > > >   firmware: tee_bnxt: Make use of module_tee_client_driver()
> > > > > >   firmware: tee_bnxt: Make use of tee bus methods
> > > > > >   KEYS: trusted: Migrate to use tee specific driver registratio=
n
> > > > > >     function
> > > > > >   KEYS: trusted: Make use of tee bus methods
> > > > > >   tpm/tpm_ftpm_tee: Make use of tee specific driver registratio=
n
> > > > > >   tpm/tpm_ftpm_tee: Make use of tee bus methods
> > > > > >
> > > > > >  Documentation/driver-api/tee.rst             | 18 +----
> > > > > >  drivers/char/hw_random/optee-rng.c           | 26 ++----
> > > > > >  drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
> > > > > >  drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
> > > > > >  drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
> > > > > >  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
> > > > > >  drivers/rtc/rtc-optee.c                      | 27 ++-----
> > > > > >  drivers/tee/tee_core.c                       | 84 ++++++++++++=
++++++++
> > > > > >  include/linux/tee_drv.h                      | 12 +++
> > > > > >  security/keys/trusted-keys/trusted_tee.c     | 17 ++--
> > > > > >  10 files changed, 164 insertions(+), 138 deletions(-)
> > > > > >
> > > > > > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > > > > > --
> > > > > > 2.47.3
> > > > > >
> > > > >
> > > > > Thank you for the nice cleanup, Uwe.
> > > > >
> > > > > I've applied patch 1-3 to the branch tee_bus_callback_for_6.20 in=
 my
> > > > > tree at https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/li=
nux-tee.git/
> > > > >
> > > > > The branch is based on v6.19-rc1, and I'll try to keep it stable =
for
> > > > > others to depend on, if needed. Let's see if we can agree on taki=
ng
> > > > > the remaining patches via that branch.
> > > >
> > > > 6 and 7 can go through your branch.
> > >
> > > Good, I've added them to my branch now.
> >
> > This entire patch set should go in during a single merge window. I
> > will not send any pull request until I'm sure all patches will be
> > merged.
> >
> > So far (if I'm not mistaken), only the patches I've already added to
> > next have appeared next. I can take the rest of the patches, too, but
> > I need OK for the following:
> >
>
> [...]
>
> >
> > Sudeep, you seem happy with the following patches
> > - firmware: arm_scmi: optee: Make use of module_tee_client_driver()
> > - firmware: arm_scmi: Make use of tee bus methods
> > OK if I take them via my tree, or would you rather take them yourself?
> >
>
> I am happy if you want to take all of them in one go. I think I have
> already acked it. Please shout if you need anything else from me, happy t=
o
> help in anyway to make it easier to handle this change set.

Thanks, I've applied all the patches in the series now, since it
otherwise causes warnings during boot.

/Jens

