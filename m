Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0B8D5C0D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5F4wlcwkKM4ZsDp4M7/ym0Q5pX/4cuTWDGPdhRorxqs=; b=H+m9Duna6lNNlt/dK/UB2reB5l
	2AfAtKv+kcOrlTq59hZAQMLSnvcpDd8OmcXbqALHYZ9E2ZQt5r4frLiyecRvl5gZdOU38e5ReT+/+
	+bYRer+chJlB+QJFrCmrprCqcvIlngDJl2GI8XLXpyeYdgZ1CN3yk7iCKLtqif/XuSRp0Pd+H+Z95
	17N+boQdXhvTbcGsTZM59MaCncLkeEL5TwS6Fd1foLMxXavIR3UF4WihXkIJ3s0Zra1eVHEAe481r
	Subm6YvSNST0M7Jcu3MhsY2QLlDDYYebBgnIS+jx1OWuRfKYzxdySTrkK9OmbhNJveFai/MjXjw0J
	vRsii3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QFY-0000000AtmZ-0gAl;
	Fri, 08 Nov 2024 14:46:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pl2-0000000Aoat-2ZkQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 335D9A43B9E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Nov 2024 14:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7A0C4CECD
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Nov 2024 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731075278;
	bh=5F4wlcwkKM4ZsDp4M7/ym0Q5pX/4cuTWDGPdhRorxqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uzM9D02hTZAQeqJuWTqvam3TSjky+J4Pqwjct3I6ZiHPwSHtrabT4+uWDwHAS3jr9
	 9+6yli0W2eM/bduLRJHqG6SCYBeFCgfhCTGJ19bXTebXilUZb64Fq1VgQZ+GKR6OrN
	 CeCyfpB5aQFASZBKZAK2GAQUpB+ssRjq4FXKs+gh+3xR9WgWznfM33mMWeCMkEiIty
	 7PN0CWJ6BDXYLheqwqfz1IChQ4VjMoCky2/R2x2/SpsYH02yLDAVvIi6oOLjRWlu93
	 0GEk1TFNcBObtTYXkqQJeabDjAuMsKpIJXHtERvaopTAYbnG8/HGF036cYM3U008+w
	 vM09D7qySttuw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539fe02c386so3003194e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 06:14:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0JDNKLWL0hpDh2SMGfENlswhA87AfCiJghefIdzK7xbLIHxE2C1Yu2jKHDBcui14zWk8n4pXAZp7KKF+Rkm+u@lists.infradead.org
X-Gm-Message-State: AOJu0YxJw69xH7QG9Gv6Hb8EVcAmRBj9DkLv5U/dfO4oUZ9knWJGgFjB
	KrPRZaC9hso1fIeyvwVerpqkAdwTSdOS7RUDue4cTUzfKI/MblpZDtdGMp6zHOrzcoTkUEEoScB
	xgqnPuWpOJx06SD9yM8Xc0XwpkCA=
X-Google-Smtp-Source: AGHT+IEGuZhtyF0OVnuF4K3LhNl1VRlq1P5zRIfYj0hx46inp1F7NtSmeNupW27UGVXucQd5C3GNB/guTF1xE4rHAP8=
X-Received: by 2002:a2e:a9a0:0:b0:2f7:9e1d:f6e7 with SMTP id
 38308e7fff4ca-2ff1f446f72mr13098871fa.9.1731075276916; Fri, 08 Nov 2024
 06:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20241106185513.3096442-5-ardb+git@google.com> <20241106185513.3096442-6-ardb+git@google.com>
 <CABCJKudxN=5Op96567rti9fYZXHWVLoWzGA8rJr8Y=t+8X9TNg@mail.gmail.com>
In-Reply-To: <CABCJKudxN=5Op96567rti9fYZXHWVLoWzGA8rJr8Y=t+8X9TNg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 8 Nov 2024 15:14:25 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGqZC+rYMsEXCkfPWN2gdqkgaXnsvKXa8ganCZfWDkkmA@mail.gmail.com>
Message-ID: <CAMj1kXGqZC+rYMsEXCkfPWN2gdqkgaXnsvKXa8ganCZfWDkkmA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64/scs: Fix handling of DWARF augmentation data in
 CIE/FDE frames
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_061440_891707_8605B18F 
X-CRM114-Status: GOOD (  14.32  )
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

On Wed, 6 Nov 2024 at 23:13, Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Wed, Nov 6, 2024 at 6:55=E2=80=AFPM Ard Biesheuvel <ardb+git@google.co=
m> wrote:
> >
> > Also introduce some error codes to specify why the patching failed, and
> > log it to the kernel console on failure when this happens when loading =
a
> > module. (Doing so for vmlinux is infeasible, as the patching is done
> > extremely early in the boot.)
>
> It's a bit unfortunate that we might fail quietly for vmlinux. Could
> we store scs_patch() return value somewhere and print out a warning in
> dynamic_scs_init() if something went wrong, for example?
>

Yeah good point.

