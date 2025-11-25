Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D86CFD37C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySvDsTYJvLgXmuHERNi3kLoFGjXTAaw/jQMLOzTg4ug=; b=Pg+LND4g4xHh6YrcdB4N4FqadQ
	nYW+yVEtgJ4ideeHLMGHIMqBqu+f4hUkOJWCWVZnwWu1YjKJ321FZrAi1ViSmNMxs6PqtuN3Ni478
	OOBeO1ecnjmv3a0u83QgJyQKcTkJ2xOfk407ISqKtdt+YkGCdWG5XzAVFoP4TB37mzc+TtIbhAfeA
	7kaXnD1+cxsLDhHf4oFnzauxeg+e48JmgshSehp1xBHOmDCApY5IKwyX3yOi7c/HCSRwr/beJlqij
	iADqgHHyLo/gyuPL8u71B+hg5/fUDRUlfXDlfn7C+HHtxC0HVvbpLkOrw6aIY4RmXKhkZpLD8JCWx
	u6VkN1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvp3-0000000DaZ9-1fJN;
	Tue, 25 Nov 2025 16:23:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvp0-0000000DaYm-0ZFv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 16:23:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F04643D64;
	Tue, 25 Nov 2025 16:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B29FC4CEF1;
	Tue, 25 Nov 2025 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764087797;
	bh=PcLADs44vvxztti6xA2k6nYOIqCl+7fL8uUhpgP/J9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmalkPb8fVz7b5+GlztZ5+HHHOuzrOl0RtAT8gFgVDBR/DLjIoQ2dcz3+1tKdVuVD
	 mqonXjkH0+ePWquB4TxGAnDv6nsCqDb4FwCl5a2geimEsyf5sWycoW0YOlitcd7x8Z
	 HQRFHr/okwp7v95ucCfUDrsdrh6Ji39Vz74W1mg+cbrFa5HY1Fyyk1B9EbaZ224ZJT
	 HCg5n6HBradD9l6Qh7wcO9ViElqp2j0WtU6jlkQJfkX9xBbog8jDnBNT1DuGLAC5ye
	 H6GAjD+6XbxDQlEJiBs5CTkUPiCxP/KqTWHrRpejVAlMziiJwdKjCZKIem4PwkBGLW
	 KcnsMhBp+nNlg==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] cpuidle: Warn instead of bailing out if target residency check
 fails
Date: Tue, 25 Nov 2025 17:23:12 +0100
Message-ID: <2808566.mvXUDI8C0e@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <CAJZ5v0h1VTozCKweKvma3dQiUCz8KkR88Hue1cL_jDaKiP+BEw@mail.gmail.com>
References: <20251121010756.6687-1-val@packett.cool>
 <CAJZ5v0h1VTozCKweKvma3dQiUCz8KkR88Hue1cL_jDaKiP+BEw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_082318_212498_21403811 
X-CRM114-Status: GOOD (  34.30  )
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

On Friday, November 21, 2025 2:10:57 PM CET Rafael J. Wysocki wrote:
> On Fri, Nov 21, 2025 at 2:08=E2=80=AFAM Val Packett <val@packett.cool> wr=
ote:
> >
> > On Device Tree platforms, the latency and target residency values come
> > directly from device trees, which are numerous and weren't all written
> > with cpuidle invariants in mind. For example, qcom/hamoa.dtsi currently
> > trips this check: exit latency 680000 > residency 600000.
>=20
> So this breaks cpuidle expectations and it doesn't work correctly on
> the affected platforms.
>=20
> > Instead of harshly rejecting the entire cpuidle driver with a mysterious
> > error message, print a warning and set the target residency value to be
> > equal to the exit latency.
>=20
> This generally doesn't work because the new target residency may be
> greater than the target residency of the next state.
>=20
> > Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and ta=
rget residency")
> > Signed-off-by: Val Packett <val@packett.cool>
> > ---
> >  drivers/cpuidle/driver.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
> > index 1c295a93d582..06aeb59c1017 100644
> > --- a/drivers/cpuidle/driver.c
> > +++ b/drivers/cpuidle/driver.c
> > @@ -199,8 +199,11 @@ static int __cpuidle_driver_init(struct cpuidle_dr=
iver *drv)
> >                  * exceed its target residency which is assumed in cpui=
dle in
> >                  * multiple places.
> >                  */
> > -               if (s->exit_latency_ns > s->target_residency_ns)
> > -                       return -EINVAL;
> > +               if (s->exit_latency_ns > s->target_residency_ns) {
> > +                       pr_warn("cpuidle: state %d: exit latency %lld >=
 residency %lld (fixing)\n",
> > +                               i, s->exit_latency_ns, s->target_reside=
ncy_ns);
> > +                       s->target_residency_ns =3D s->exit_latency_ns;
>=20
> And you also need to update s->target_residency.
>=20
> Moreover, that needs to be done when all of the target residency and
> exit latency values have been computed and full sanitization of all
> the states would need to be done (including the ordering checks), but
> the kernel has insufficient information to do that (for instance, if
> the ordering is not as expected, it is not clear how to fix it up).
> Even the above sanitization is unlikely to result in the intended
> behavior.
>=20
> So if returning the error code doesn't work, printing a warning is as
> much as can be done, like in the attached patch.
>=20
> If this works for you, I'll submit it properly later.
>=20

No response, so I assume no objections.

=2D--
=46rom: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

It turns out that the change in commit 76934e495cdc ("cpuidle: Add
sanity check for exit latency and target residency") goes too far
because there are systems in the field on which the check introduced
by that commit does not pass.

=46or this reason, change __cpuidle_driver_init() return type back to void
and make it print a warning when the check mentioned above does not
pass.

=46ixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and targ=
et residency")
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/linux-pm/20251121010756.6687-1-val@packett.=
cool/
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
=2D--
 drivers/cpuidle/driver.c |   18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

=2D-- a/drivers/cpuidle/driver.c
+++ b/drivers/cpuidle/driver.c
@@ -8,6 +8,8 @@
  * This code is licenced under the GPL.
  */
=20
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/mutex.h>
 #include <linux/module.h>
 #include <linux/sched.h>
@@ -152,7 +154,7 @@ static void cpuidle_setup_broadcast_time
  * __cpuidle_driver_init - initialize the driver's internal data
  * @drv: a valid pointer to a struct cpuidle_driver
  */
=2Dstatic int __cpuidle_driver_init(struct cpuidle_driver *drv)
+static void __cpuidle_driver_init(struct cpuidle_driver *drv)
 {
 	int i;
=20
@@ -195,15 +197,13 @@ static int __cpuidle_driver_init(struct
 			s->exit_latency =3D div_u64(s->exit_latency_ns, NSEC_PER_USEC);
=20
 		/*
=2D		 * Ensure that the exit latency of a CPU idle state does not
=2D		 * exceed its target residency which is assumed in cpuidle in
=2D		 * multiple places.
+		 * Warn if the exit latency of a CPU idle state exceeds its
+		 * target residency which is assumed to never happen in cpuidle
+		 * in multiple places.
 		 */
 		if (s->exit_latency_ns > s->target_residency_ns)
=2D			return -EINVAL;
+			pr_warn("Idle state %d target residency too low\n", i);
 	}
=2D
=2D	return 0;
 }
=20
 /**
@@ -233,9 +233,7 @@ static int __cpuidle_register_driver(str
 	if (cpuidle_disabled())
 		return -ENODEV;
=20
=2D	ret =3D __cpuidle_driver_init(drv);
=2D	if (ret)
=2D		return ret;
+	__cpuidle_driver_init(drv);
=20
 	ret =3D __cpuidle_set_driver(drv);
 	if (ret)





