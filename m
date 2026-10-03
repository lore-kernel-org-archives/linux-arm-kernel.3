Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02008CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=; b=tQGQ/LqcTjliB/8iMVB5Aacr7H
	9tR4r/Anq2aiOtQcXtasZmAhdEXU4jM1OguUZzVyiVxqgQg2JnN5CI9hVxI/34e6tzNXeEO+fwTx6
	CPjIoKPFZd0Z4GRpxMddqGxFDaUCzwAI6Ur0xdiCSyucLUz/D/BaK9/tIiL4goQHBDsbMsZbk7QiX
	Q/zrhsWuZln0IEMHoBudvQ70QeZk+FoxDVheM+D8BbxtTZQz4on2TwGqRA4pCSxodVqwAwFrG/xxQ
	BiMbutp56cHvD8gKJtnY/O6Xta3iBF55taUvmlG9f+JIESo+K+bv+kkDMg1jtJ0r7bPOMyyLnGWFt
	b7sWwMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3rQ-0000000DsT7-1qQu;
	Sat, 03 Oct 2026 17:49:24 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3rM-0000000DsSf-499A
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 17:49:22 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2e3dcfe205so108482666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 10:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049759; cv=none;
        d=google.com; s=arc-20260327;
        b=mgNg2L+bsEoJIbJXuocBMmH5WiqE8XdcpQgGJwso3i83hoJ5jLBP1s4syStCi7tprX
         sP2FTcpko2kyMvNbuR9i6dLFsxlmpSBHnE0h9MWLrhZazgeJRIHcSfjZ1El8eCtr+Fz1
         E7qACInwqaSXWk3fN5eFTUDAolHAqRoaPkQHc3+fORLj2k9suB7nHtK3ygltCdWegEsP
         fqwnEorKxwz1QGZvlyX+JJzkO9Vyx7SMKX9peCsqBU+E/wf/SmwWZf2V7uKS07n7Mto4
         hFPYEC7gixH4T41L0IchrIIJeAk2y9jjF9HxCs0EQv5vmEItq8G6W9jo1NYIdYZTPWMQ
         e3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        fh=aQfbi1bzSZRTGJCaEF7E1U1nQYx6F8EKkgsYfCeIpPk=;
        b=neje9hbUR1D+iOajWqCK47mHiJHzb7t7q84N/Yn47Y6IISL5rU8HdIu3BukkMJkKUf
         gfTxhswnwv0Ewpjje27zzV/Eern7zd0fgbnFXibriAYmwTEyyr/L0ZV/FcWTPd2M3Wy7
         +ozBJtP3uFZvELWTon2H8MMkCymcEuxn6ZE8QP1Ror0e257FK7C9Sk/nQ5aHtxH0zZX+
         a2Xj7cO3+ID6sNuFlzxof6I40V2GKVJst5AOr9UQKPNp1EagLnVvnzqZnBSSYq39TYA7
         w3vWRNNlvbmGB47CGcswVXdRdQj2VJaX8w7EfDQBzlGjiX91Z4a/gTpHedi7D10WKszA
         TfaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049759; x=1791654559; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        b=ACMkmgx2vfsG6T1+co4KszpiwsTkmYirBReH9ELkxHvd5ZfKfRz6AKTUVOyKcCdaIv
         TEgFs3Gigh0vgv+MXBB7C/fKhTQWwtqN8edlGpDkRLkuGJIF//heHXGEDuwGrvQNeVF2
         XwY8fiduJCAa4hUbcnGLf/fBc0Mp0zIpYYRJRYN/PzVaHyNdtJlICu0Uy2hbZCcJK6bp
         uxjyQ6iIZlAlZ6PSIz/EDZr7cMkHbftlyRLB8Idb+BJx0IMu06pEgcA6yFmbYe842ZyK
         MaZxo74oz7L6YsMvAMx547iDEgi9znze3UrCcC0D6cedWcRNYn3zQAVi91P4KrbY7/U6
         uBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049759; x=1791654559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        b=gatVOiuebqlAdZv7Ec9r5IkFGVdsiHvoW61bD2w93aQKS9DCbnhaggfvqJWSyHPlkk
         XR0v8crpSn68seCnp58mvjQiShUQTvbc7OCKwvgDRMbzmfrKtF1AtUZfcMJLFfGUx8wz
         OgVQCfIpOfvR/qH/VTEjDf6A2iWexiZX6e2Ddj/LNUwWPPBC3osaxD/mDvbeItwE+9j2
         tJ0W/d6Esbcaq/f+rIeM9d/J3679pqohwmGOotU1k9Lj/oRJfTaBmf0eIMDa/ZN7dfgx
         8bZHi5pUPOBf9Z6XbxHUMF4XvZrGKXRv6h1rBQt4pvYfYRuc+mh2VdlLZjD0NW8cwpc9
         0nRw==
X-Forwarded-Encrypted: i=1; AKwUvBxhuINSHecRNnqSKzRvZgK7OM0CHwVPD3pzSPwiyz5o++Yk+7PHzKsdukxnmTKJd3Z6i76zQKogiO55tx+W8Q9t@lists.infradead.org
X-Gm-Message-State: AFq9FYIjvQgQnINzS/ctDk55+9YFKa2HxjmqZDJvtuqtrtT0sfID2/LL
	6H36B18pFyqTaOhgCN3jQEEC9HpJl/fUa+QHZlI+hVLYpA6n+QCkwFR56nJbaD1aN9VUkQHfAis
	u78UldkBZGh2z6MWmsHoAWcw7MmYC99E=
X-Gm-Gg: AYBFou0v1Gmr3QnDTpApRCRFxRH0HWHQKPPRz1qJQW3O/JPbTMM6NssQFiRGHCbsTtP
	ulhO2gRtn4hEzTxnZ6UzI7OhQdIAuDO3FIBoiL7wBTn5gx6ZVPDI/2G5+MpBY1qwNOcQZ3TA5lA
	Q6WbT7B172PUGp21z9dcJyAh8GMwp5fxniL0wdpib5RQn9CxFsr+vP5/nUcLxycKa1AkBd6tAMU
	BZTdTEtwND9hNmQ6+9cZNbKX+x14nUfM4F0UYQAahkiXewjQgvqveET3mO9WoSLAbjiwj9rKDD+
	navs7BmWoLPi5BLpzaWjxrqSryS0WZOM/qXbDvHqfDzTFGyE8wkSnVVASUEYcULLlhuMMAMl6Ad
	NsRlMa5v67niTrPFqTlwZwEiBvq5a0kSpmIwUEOgBUxIdcHMWwGDFTJaptYAnWzdjpDLki5ms16
	ZtIBwxEFiUyi3gbOAVGnN01CAXKy6IHTbGNroEnvMK
X-Received: by 2002:a17:907:3e8d:b0:c2e:7da8:f7b0 with SMTP id
 a640c23a62f3a-c2e7da94cddmr75113166b.30.1791049759013; Sat, 03 Oct 2026
 10:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:48:42 +0300
X-Gm-Features: AclHuK9Bi3Crqpp_pF3AiMgGWXYXjjoKWwAR4Jh6xG5aSPocrJMAmDcagVfOoRQ
Message-ID: <CAHp75Vfy7pbHaANK2pv6TSWctn9phVwby1vMjY7akeFPaKn2-A@mail.gmail.com>
Subject: Re: [PATCH 4/9] gpio: mxc: use devm action for irq_domain cleanup
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_104921_042227_DA48D8E7 
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

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Replace the manual irq_domain_remove() error path with
> devm_add_action_or_reset(), so the IRQ domain is cleaned up
> automatically on both probe failure to eliminate the
> out_irqdomain_remove goto label.

...

> +       err =3D devm_add_action_or_reset(&pdev->dev, mxc_gpio_irq_domain_=
remove, port->domain);
> +       if (err)
> +               goto out_bgio;
> +

We have devm_irq_domain_instantiate() and the respective wrappers.

...

>         /* gpio-mxc can be a generic irq chip */
>         err =3D mxc_gpio_init_gc(port, irq_base);
>         if (err < 0)
> -               goto out_irqdomain_remove;
> +               goto out_bgio;

This is simply wrong. No devm_*() call should be followed by goto.

--=20
With Best Regards,
Andy Shevchenko

