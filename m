Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28A71098784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSdC6nRI2uCqIhg1u1XGagrxET9dRdNdAdm1QiCl1eI=; b=R8ERpvI+5DRFHX4JKpgjdH8/R4
	IlAUkDc0QQwt4IaT+DV5ddGoacGIt+Pad1XuWaiMWCTOKm0R98l5xuoWAlHCd1KVTv1DgJ39lIptz
	lipuN4U3Pn9onqIFVkOfX5zDlC1rL2ICthQ0Bl9Bsr7bPXq4APgiteatZBcFtN/vzTTSYn/5gfYOl
	SzSghC9LqACdiLRriZiPNuQizh+nAzEPbl7IJByKprMMhXXb2VDwG4ZxfnwPft8QQ7eh0PX09BFfx
	uGJR155wTWp+5RVq3xyWS0LSVCTDuN8QDAwRCJy9BxLfTXQQ5sG+Vjrz9knw69EaF1pqVmIHyMkdb
	sFzcs+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Zt3-0000000Cr2m-38Wt;
	Fri, 20 Mar 2026 13:27:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Zt0-0000000Cr2P-1Lf0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 999DB4332C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794C6C2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013253;
	bh=fSdC6nRI2uCqIhg1u1XGagrxET9dRdNdAdm1QiCl1eI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sCVjZ5hE48RUAtyuqBoHt3kBIF383Naz5B11gttywCAe5Bm2+UdC7ha6oZ/Tb97i0
	 7aq5D/5cPrDQcaz9290jfUlHPIpmVi4KKf5XAtmOAxa56YOungAWI1b91XDCkEhqv3
	 t626heyEM+j4UmLfmAw0ITqz7/l8k3VpUQgbEfnOqWQHHnT0QyR+GBauEHhApeHFxY
	 Ymo6xEVkSLJtHjpaX0o7lP00L+NXKZjlKJmsmmdLQm2Bzu9pQC+AsFy7dehCYwAPCq
	 5iAqMHc7fn2/H5gaZN62ugi8VK2RcNVgHSAaTU3gkBhpqyscEZRdeSS+3ZGSWGWwd1
	 qAB3o8eqOjOPg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79a535e7c00so5937717b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 06:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnmhxZSrWkq8SBSSETSTeIwoNHW4RIO16lM098YRrxPZWyoUgQOGzmr4LgjxlsDnIho6Dxk8o+slBVID4Ujuab@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc6hQ3ze+Waz5Htjab/GIgceAxoa8hbCIc9k85Oc0oaqGsE6JM
	2trZCfBoG0kNSN++2G0xNsYpwH4UgGzNdIucFCtCYmztG/m+KfiwdR90zFU+GqJpTSoCxHTnvve
	BUE29TFJNMfMcwqivIVXtI1FvtaKwM34=
X-Received: by 2002:a05:690c:b05:b0:79a:51df:6a0a with SMTP id
 00721157ae682-79a90c39a45mr28260187b3.60.1774013252835; Fri, 20 Mar 2026
 06:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com> <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
 <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
In-Reply-To: <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:27:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
X-Gm-Features: AaiRm51PUQY-ru1LXvqRM-CPXfn2OmCbeRvVURB1M-6XemqxSCR95oLy4VR6qXM
Message-ID: <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add __pinctrl_generic_pins_function_dt_node_to_map()
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_062734_382446_91D5FB1C 
X-CRM114-Status: GOOD (  11.05  )
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

On Thu, Mar 19, 2026 at 12:04=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
> On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:

> > That said: in this case you're just adding a parameter, just add
> > the parameter and change all of the in-tree users to pass false
> > or whatever you need, these is just one (1) in-tree user anyway.
>
> pinctrl_generic_pins_function_dt_node_to_map() directly feed to
> .dt_node_to_map() callback, add parameter will impact too much.

Why do you say that. It already has many parameters, one more
or less doesn't matter. It's not like this call is performance-critical.
Just change the users.

Yours,
Linus Walleij

