Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03768C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1H/LJVni2QpyNRLeOu5Y609wueVH5cmiPU/fiF5jBo=; b=iVjFakoz2Am7sElpglb11UY+s3
	tK/q5Vfty1D283KbWEhHc4Qwc5uRRqy4eUM6kaLRB8O18YPUFY9GkE5Z5vwUBe0PPARIgc0Nc5tDT
	00lR/T29neN/JGx5UVgDmCcL5+Fn79+7FMnW4LsPdAAuIhaLnRgsusA9u7L10YF+O4NdP5//3oP2T
	YI+Z8nN82/cRY1J30Yuo9D9KFCPSfJWwLrpsApwRHBdlNaaR27YXmw4YFlZG2QI05u9hz9JHlJtt4
	LDpyZ9P7mIxpEmTSvG5NjdSv+Kbcky0w623Lke0f2q+7rk3lQyA9A1xwds/V4mVNuN3CR2vHs26j0
	vfxo/1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJB3-0000000BLsJ-0K1E;
	Thu, 03 Jul 2025 12:36:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHrh-0000000B7nc-1tfX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 11:12:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 868F8613B2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 11:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C2DC4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751541148;
	bh=x1H/LJVni2QpyNRLeOu5Y609wueVH5cmiPU/fiF5jBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k1Wd59UB0IZEA91+BHb7t63Nh1bSGOI5TPt0hkZVA8rgdqPS7X9Byv8PvHf9pEots
	 a0+mzYi9P2Jf8hg/ioX6teNAHw3G14IqJKKg4w829s+aJXFivMGOHo3fFcWFYxyDUD
	 ms8g1ZaQh79djWZ5HShUWrlVLOfUry2mArm016GlzYSPFsU3HwURM/nOjTrPyh8P36
	 sUs6qXloI1VNlAztagY698UYRqHZ1c5IBOiAznMmO6ZgQu5/TJHHUe1kNs2baON4ob
	 YuUq2EnwFDOrPXDeOuIE5CnN+UylxW30KA6HD6KNtcQCZk+NyplbuYFASkWs9A+qX/
	 /va9V0zUCq+Uw==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-611f48c6e30so1495152eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 04:12:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6eZKs2IXq3R5g4hg/3jzd3tKHbHwqbJvzrRmXn7FyGvS2gAA83jIN03ioRgbLWJfAOCFWlVu+EPTrGU9OiP4y@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpwpp08CJTSKm+fGYhu3YZmxmJEmGh8zUsIzwk0WC4AgoXctc2
	2UrfL2JJk/PCmTC1JW7KmRCHXEUqypWBgMYkrmDAfRnyTHBr0z2+Qz9ZQfY3OWoLU5AmPelqZun
	Xkgqxqkz2LL0eygQxEGvR+PGDQkmgJrA=
X-Google-Smtp-Source: AGHT+IEfdnhboU4n2/R077RhtD1Otv/SP8fZ3dMXlRneGldlg5mu/9PR8Jraj6CY4DRR0obpUxWAkOsMSMDyaRWTzKs=
X-Received: by 2002:a05:6820:2713:b0:611:bbad:7b62 with SMTP id
 006d021491bc7-6120112a218mr4411300eaf.3.1751541147647; Thu, 03 Jul 2025
 04:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook> <fbfc6bf9-d7c6-4df5-85d0-b1d357159d88@suse.com>
In-Reply-To: <fbfc6bf9-d7c6-4df5-85d0-b1d357159d88@suse.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Jul 2025 13:12:15 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hPh19h9uVRVHSXiLaHxm3PR9A3W5+j=2=-B-YCyBr=uw@mail.gmail.com>
X-Gm-Features: Ac12FXx58ZcYu75iGXYHPl0jrmN8qLhIg29N7RATyquq_k1ymybhva0tDayjTm4
Message-ID: <CAJZ5v0hPh19h9uVRVHSXiLaHxm3PR9A3W5+j=2=-B-YCyBr=uw@mail.gmail.com>
Subject: Re: Forcing devices into idle
To: Oliver Neukum <oneukum@suse.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org
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

On Thu, Jul 3, 2025 at 12:33=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wr=
ote:
>
> On 03.07.25 12:08, Thierry Reding wrote:
>
> > Any thoughts on how to solve this? Is the pm_runtime_{put,get}_sync()
> > method acceptable? If not, are there other alternatives to achieve the
> > same thing that I'm not aware of? Would it be useful to add a new set o=
f
> > APIs to force devices into an idle state (which could be semantically
> > different from runtime suspend)? Or is this all too specific for any
> > kind of generic API?
>
> Basically what you need is what happens when the system prepares to
> do a snapshot for S4. However, if you just perform FREEZE and then THAW,
> devices will assume that user space has been frozen. You need a way
> to substitute for that assumption.

Well, you just need to freeze user space beforehand.

> Runtime power management is unlikely to be a fruitful approach to your
> needs.

Agreed.

