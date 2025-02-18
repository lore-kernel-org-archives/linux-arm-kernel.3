Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D972C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBbaYx5bwE9IOAEZWIDKHEwtgeV9Ij/a7vKEkP0AMRU=; b=FOMzO2VlNI6IYo3nMq2TMRb3Mz
	VMgL9lNmv8fD4VeeDqI4iVasCTB5IwuGtFOc/0Xwi7wvUDemd6ag2e/Qpxw9pNqB0jylHsrKh5RA6
	lDQIENB9lSiGqK9+0ymJohYqu2LFGgUTcjJ0OPmM3YUtNEsMXxncW5ZSIwM3Vy5BSHlt0jPf+f0cd
	HIfjn3YE2U4UKRRVG9fvQ+InbTiEKjE/hEdphStxLP+LZNnDhaFz95OJbbc9uFWrd0UzS030g0TjQ
	oODbegXzI5fbXBsjCFwL/cp6Egl2rE40T3wNRQVIcJP9OuLZ2NQvGCvFF0sJ158/1EFUuh706Cnza
	3W7/TFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkN34-00000008ChX-1tt2;
	Tue, 18 Feb 2025 12:50:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkN1c-00000008CWV-0V1k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 12:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2ADBA40BA0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 12:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648D2C4CEE6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739882910;
	bh=4Wajts5C4DVOytCToa0HcW4DaOFuKIZvesYTgTXzOSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eDihVnEx3HUauYFMprB5jlADzXlQRCUGDy1BUcFFKDVNIqNny1SZcqHR2rcj3c+t9
	 Gaz3dKRzirmUQBOcHnk9B6raRd1XJ9uGJSTwBxR8sBI6laRYaAfik0K8gS3oyvfa3J
	 sXhGqShfZP9LX8GHJmQ8az7qpzHAIENKhIlOA0Szn+/NuAq/RTqmNZ+MDB0oyyvv1S
	 t3W3JJhre0ATwOo05Qv95PINUv2wPFJ+vLvwPywz2obPTXV3GNz7gyi88+XrfwAV5s
	 egr7cpGFbw/VLoSA17NCMb3YBC1mMa+21iMPAJbQ7DTC0Pt/R+6Ii0g8XR3KEeoNX0
	 MJ58OCkpM8Jew==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f37207259bso1283238b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 04:48:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbPdnRBh3vBJYcMjQyOtj3pfy+C3bfugVnBVLjTnHEwrcIJZi3OAYGsUVM7IEdONkNuzg8WEJcXkYH+vC0658Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxfqEQqqFEQ8naZDYtS1vQv4iK9nSdtXBNU6Bli/wFq8ovH/pYq
	kMamuBUpK4CAavNVra5t3hm5VbEgDyLqTK8pQ+PxQYV6PHKUFiOChV3bBk/avSaUR76lzq5RH//
	w88b8ANY5mLWOsVnwzVwcEj2TtoQ=
X-Google-Smtp-Source: AGHT+IFAYYdRnV3mctnMWkpa/mSLAZA9eUJ1KqvAVCirPkNMGgK5Hg7hNNr+eFEwkqTEOOzk7sp2eQjor9qoX5WgBUk=
X-Received: by 2002:a05:6808:108:b0:3f3:f90b:f1b3 with SMTP id
 5614622812f47-3f3f90bf3cdmr5389012b6e.5.1739882909678; Tue, 18 Feb 2025
 04:48:29 -0800 (PST)
MIME-Version: 1.0
References: <20250217140145.117086-1-ulf.hansson@linaro.org>
In-Reply-To: <20250217140145.117086-1-ulf.hansson@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 18 Feb 2025 13:48:18 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hi=zCuhmVRf2HVRWkR53U7xqxC3oQDs8-JN-cyQ+ZX1w@mail.gmail.com>
X-Gm-Features: AWEUYZnnvYFMyqphU69gZtzfxM7ILKlQw4ij5EP7oNNdsC9rL2vp247xH18uGKk
Message-ID: <CAJZ5v0hi=zCuhmVRf2HVRWkR53U7xqxC3oQDs8-JN-cyQ+ZX1w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update section for cpuidle-psci
To: Ulf Hansson <ulf.hansson@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_044832_223267_AEFD2D87 
X-CRM114-Status: GOOD (  16.40  )
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

On Mon, Feb 17, 2025 at 3:01=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> Add myself as a co-maintainer for the cpuidle-psci driver and the
> corresponding git-tree, which I am already using for this.

Lorenzo, Sudeep, any objections?

Ulf, do you want me to pick this up?

> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 25c86f47353d..f2be70dec4ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6087,9 +6087,11 @@ F:       include/linux/platform_data/cpuidle-exyno=
s.h
>  CPUIDLE DRIVER - ARM PSCI
>  M:     Lorenzo Pieralisi <lpieralisi@kernel.org>
>  M:     Sudeep Holla <sudeep.holla@arm.com>
> +M:     Ulf Hansson <ulf.hansson@linaro.org>
>  L:     linux-pm@vger.kernel.org
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  S:     Supported
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.g=
it
>  F:     drivers/cpuidle/cpuidle-psci.c
>
>  CPUIDLE DRIVER - ARM PSCI PM DOMAIN
> --
> 2.43.0
>

