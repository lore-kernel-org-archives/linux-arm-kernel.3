Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D556C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=627XJD1AIOkdu1IaSFI3jHdwZHn7kpCZzRQmqFo9zDQ=; b=MKEqI066d/4FZREuy+ulo9qm0l
	6zOGCC8718gyXHDow6EDrKBGv6+AkqCKUPS0fFtR940G8BgJdeEFG1BIIGwMjmxFHynbESUK6CVzH
	67i9IsiMhLnw/0PM4xhNI0Y1OCnMWeV+3UMrWGoI9KAVbYSAi9+KmdoHjXxgEO6z3JIB5q21WwNue
	gQoJhrJRcSzEkryNAusPWH0D0x4JUYAbmC1qqSg0xgKILCLUK8rkycvqigZcXI5LJ0MfmJfryTi/H
	pOTCsvP7huguyvtqg/R5zY2x4XpTOL0CeGe7pewDXvGkwpIlWFvdxKVXZuGLPG05QDFhcd9EZoQuw
	M6JF9bmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuZR-0000000ArCF-08Fh;
	Tue, 27 May 2025 13:42:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuLb-0000000Ap6o-1PUd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:28:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CCE743722
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 13:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB13C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748352482;
	bh=6n+ZjVHYJRruRP6QhiS37RnfCFSoYNr/NDgvQBN9BNE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kPL1+zNzo8eovVYJnZOxmhDr7c+ycetyKLvdsuHP2z27c5e9hktGSZxRbhN37wd5H
	 cSpcqe4MO/tXOQ/po6PSOoQ60Pb54GKunFW0kq+jyt0ckRC952ybdi06MSbUNQknVc
	 Cy2EwTIRQuhpDHnwPhSuikSzuMz6UWTbUKRJla3oohNL+/5XTgBSpbFuMuMMx5OgYf
	 kJFizpgXTDo34u2aiSla+rEPWGBWJMd0170QM7vBMSRFLVVRI/b+o7animPG1JYtGD
	 7Hbk7nr6fJtUCneLiDJ22cpxhvBUrsZHppE74oK9fVeFSuoQDDzG4RcM9gztacZ3X3
	 Fg/bcae0SpVEQ==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6021e3daeabso1380489eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 06:28:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6XENFJggPnERvkPuTfKcN0YgUAaiefjvhGhQPLORG2xz5o31sOWUhF5SLcjId9HrHG6ybMrrMEHgk7d7Tjq/G@lists.infradead.org
X-Gm-Message-State: AOJu0YwLLD/4H6QVwoXusUXPLxwgoO91m9pvnNJDo7e6n45X5j9Bco63
	5zwjOU8msIZbI7YYUSfL1p2xMVFZuLO1OWemxRdV59Sij7yw0E7iTCliRwHNdrxG4xoSFuY/CvS
	Qb/bBs3U5svhTm1CaGBpuEeXIjZ2TZRg=
X-Google-Smtp-Source: AGHT+IFSAqGTRonCyHdzPHXzUnwF15GbCmScNUgBEQdqAtxS6EgzRVvQOgQAmShq5ZmtIno7kTA0NkVHIzzSEu9IsCQ=
X-Received: by 2002:a05:6820:270c:b0:60b:c7bf:5ff4 with SMTP id
 006d021491bc7-60bc7bf6141mr2188782eaf.2.1748352481726; Tue, 27 May 2025
 06:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <aDVRcfU8O8sez1x7@stanley.mountain>
In-Reply-To: <aDVRcfU8O8sez1x7@stanley.mountain>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 May 2025 15:27:50 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jAJN0dAHyUcpD1QvqZO36OmpGS2HpoRNkgG_-vNhO6tw@mail.gmail.com>
X-Gm-Features: AX0GCFvDe7KgMteLqE5TkkcwRDYFaq8UOCj-peIRP-B2k_1-cXP7CZdFbN1z-YU
Message-ID: <CAJZ5v0jAJN0dAHyUcpD1QvqZO36OmpGS2HpoRNkgG_-vNhO6tw@mail.gmail.com>
Subject: Re: [PATCH next] cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_062803_414960_E463A56C 
X-CRM114-Status: GOOD (  18.56  )
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

On Tue, May 27, 2025 at 7:45=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> If the first cpu_node =3D of_cpu_device_node_get() fails then the cleanup=
.h
> code will try to free "state_node" but it hasn't been initialized yet.
> Declare the device_nodes where they are initialized to fix this.
>
> Fixes: 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no=
 DT idle states are present")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/cpuidle/cpuidle-psci.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psc=
i.c
> index 3c2756a539c4..4e1ba35deda9 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -456,14 +456,13 @@ static struct faux_device_ops psci_cpuidle_ops =3D =
{
>
>  static bool __init dt_idle_state_present(void)
>  {
> -       struct device_node *cpu_node __free(device_node);
> -       struct device_node *state_node __free(device_node);
> -
> -       cpu_node =3D of_cpu_device_node_get(cpumask_first(cpu_possible_ma=
sk));
> +       struct device_node *cpu_node __free(device_node) =3D
> +                       of_cpu_device_node_get(cpumask_first(cpu_possible=
_mask));
>         if (!cpu_node)
>                 return false;
>
> -       state_node =3D of_get_cpu_state_node(cpu_node, 0);
> +       struct device_node *state_node __free(device_node) =3D
> +                       of_get_cpu_state_node(cpu_node, 0);
>         if (!state_node)
>                 return false;
>
> --

Applied, thanks!

