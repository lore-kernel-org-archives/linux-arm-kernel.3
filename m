Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677D7CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=; b=ADYLgkYZA/ndzdPonqczopnIkv
	KypVfKssUTphp5Z7gqHWo+BYtaDM7vwx0idxuvZPTraYFTfZfv2/IookluD6OAR9NwUIO0M9osRD6
	5geDVb9qTqvi0i5s/BNkUjS9YPE3n9MCsZyyW89WSSHGdNMScsr7Z/fXiEgR+XHaqRY8xRTgK07xV
	/QHe8MggJYwdW6iaUfQ4sR/7gyo1f5Vluus6WFDoGihz+fhYD0/jYV2t9m4AzCsogkJ7geYnH/LtE
	ZyjFT2MAam2oOGMy997861E+R4ddtgFtx6PIOwlNC96Rmi7p7cU9ApmfNV7iSFNnVmBDuW7Jw0h98
	WsNEngvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDSB-0000000AGag-2dOX;
	Mon, 12 Oct 2026 10:40:23 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDS9-0000000AGaE-0RA2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:40:22 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3a1eb6fa0f4so18808571fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801619; cv=none;
        d=google.com; s=arc-20260327;
        b=RxmpZoaUNr8YV5zodDNOQ6ONsI7f3NAP2LXuBH6lYYlgtyjqJZR9tCrjKKmzAxGubU
         9AwOe+KbMw4et5pfYyFKgQ9y7gD+5HehnEnquH2cb2cbMiF2x76YLB+f6MLpYEMlyEd7
         wyprQlHzf/d4x4b1SfPysK77jWYdcj8OCfCq7JFTDJXQJYZt0wXjdQL3tzmrua8oNqwf
         DK51YwC1SdlL9GsxaouVeo5QdQBwCrAcfPmaVk7jhf5ZIzYHGiwMSmWiQVyyxoBh7j8h
         +fpkeos2DHdBpnqLxabXj6ocVPie5xR9cUXJ0zmi1997nV9M1hc4+xHGQVWO+GDPuFbR
         3g3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        fh=R+xHS5cqf3wiWwb+I/co/6w97Jr4demrLi2dPA3JE9g=;
        b=suIPkbu4eirW3q5TqhGnj6+P/rOJv8ATxZT3dOGcmy/LZV7sZsXKWdnDXhWhBdlMHt
         9Kx+XDl/y+maBip/kJt2Va6LCfFx5x02JbeBPb0ztvdaw+wEUW+l/1WE45Ut+p/nI+nM
         Zeuf2n13ON/XQK2zxaspHnYew9EYCYGl3AHhBykn+mZpliF0dI09VfPjfLOyS1XclyeK
         9r/G6W43HNgYCEDppFdYUrshvlX8pJctq8FdjdY/eYDbhFb8wlutAUIKkCjXbrmu6DZ9
         cGhC7yJ1S0+fQAZmSifXOY+jdNDmUHKO+1jZrW1RXybOW3p+HhcmoTGClWP8xhzE4Xp+
         srMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801619; x=1792406419; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        b=PDstBGWzX/aFmSitjNhH5RYMs+G3AjZtEJHf43REyzinLC69GseyuENld+vD8IEqFg
         +qZRI2dvC2bt2MnNWWxFSNyHrLOZkTHpqj1Sz/CjOaOXD7408J9nUK4E9LeKR+MRrNyY
         LeZgLiyQ1tPGlOPUM5NlMAV4ow/Mo8NdmlYPyKIL+n+ac2/5pFvlf/R8iumauL1AghWm
         x85DJJw+kSJ4BsrBxlZm9Xdb8MsC1A8VW3mB3nAA12xUTv6BW9P66ZyXwPdDA/r3UJt1
         EC679NlYfwG2D9MmeV70/PpFujFK3f7vxueREfbqfj9+d7K9k+oI2U2I85lDxE4KX2p9
         L6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801619; x=1792406419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        b=SFdRYCRcQkUKnsQuaV7C0un7fhtQIpw2uS+tVqQsn6AoylS1mSHqiPnR4dHLYlbLCI
         TOspOXYiPUiOF+EVYtI2TatzMRL0GIJ1xvWyqWDGsfO7062kBbev8rI33QVGTl8tZvI7
         GVaDpnJJurvcZDYw4CkZiL1gmMNWgyM2lm4SzjhWOD2fFRtzfj6wSCN4EL+QOwqxaUS0
         xu9NFNMWvu4d9/BjZdEFPGIJ2aB+6tyIvz4Sj61y2yZEYUtrzBeEQZTL7t8aSqoTkWfY
         9McmlHvpoHWuib20e98Yl4kgd+nTExEY7CE0GOR5kTorzHAiRUU9JMLwZuvZdHsHsUO9
         t2+w==
X-Forwarded-Encrypted: i=1; AKwUvBz6NU3JRL2XvgzGZ2MSG9hyCuiRiqSBQOWytRYZXsfawXMPMCmLt/p9ifi6mVMyTYEi6w8Q1OlVpMNbnkMTx5Pl@lists.infradead.org
X-Gm-Message-State: AFq9FYIpHzsrRencH8qOnxW0ikZEyM4qVfOi3K8RQVxi2ATzckSwKuYW
	CEAZv9HgPRBKL6L8uW7DmYc9P5SPKlYpGg/4zzJyXlDTECb6dV407SUFO1MlbZPFCYI/lo8MbXR
	9WHpkP2C/Voo5Xqc/+6PEveMrMbLsLd0=
X-Gm-Gg: AYBFou11+GaO5jVQ+brY6Nz5snt6UTh77BZO1wCDy2rk12cAKSZPEQVsZBR9wGAYTRS
	Ng+zxlQLrjA27610XsElq8Fzt0fLPd5S7xJBW/Cho1dHJOqD2qllo+1bKyQk1u0rvM6YcZmkuJ2
	BmlekMSKq54elz7u+u4AgbEj8UPlfAedFx5mVk8YYh6pYBbnTBCS7DAdZ6i5qoaiO08apkdLfVd
	Db6QYFtub+88svVMLN3JCmMJZ+PsUBDhFSzmHkiE0TV/MiRZOy9cT9YOdoyI0Yxjncxbiwc2cm2
	aPatoZrII301ovCAMWycJDZgUDWvc8Zu3yeOJxKttelc8zYPyr1uk/dobUMqpOqEW4VEx84dnD1
	Zu9edlmfP5bCfh7bMSe2aL/YyE6jlmDx3rq5oiVSHLfMu1bwZjWhBpTf35U9eQ09HiENQXEe2+4
	gS86GZk23BKTFz1+PrG41Yt9YJapPlDfnxZ+a3/7/f
X-Received: by 2002:a2e:bc18:0:b0:3a7:5ff2:576 with SMTP id
 38308e7fff4ca-3a9c4eb3dadmr26987981fa.1.1791801618912; Mon, 12 Oct 2026
 03:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com> <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
 <asyw9ns870F0g7UD@shlinux89>
In-Reply-To: <asyw9ns870F0g7UD@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:39:41 +0300
X-Gm-Features: AclHuK8j5vu_bU9arYI-L7AJUk-wyVDtV4Vr4-xee8wNlRYyo0Qc1_7I9JALruk
Message-ID: <CAHp75VcO8YEBbt--P8WO-_Vu1O0mR2nsdqeBSG=JgavCEoR3Dg@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_034021_160644_BC3CE72B 
X-CRM114-Status: GOOD (  17.49  )
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

On Mon, Oct 12, 2026 at 1:01=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 12:30:07PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:

...

> >>         struct device_node *np =3D pdev->dev.of_node;
> >
> >Why not this one? Is it even used? Perhaps you want to have
>
> of_alias_get_id() is used, there is no counterpart in fwnode api for it.
>
> >  struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> >
> >here?

What about using to_of_node() for that one and fwnode for IRQ APIs?

> >> +       struct device *dev =3D &pdev->dev;

...

> >> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, er=
r);
> >> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);
> >
> >This message simply needs to be killed, with initcall_debug in the
> >kernel command line you will get something similar from driver core.
>
> ok. Let me fold the change in this patch, I would not introduce
> another patch to just drop this line.

Why not? This is a logically different change. Since the driver was
not touched for a long time there is a technical debt, you can first
send fixes separately, followed by a number of the drops like this one
(remove a noisy line), followed by new features. Make it three patch
series.

--=20
With Best Regards,
Andy Shevchenko

