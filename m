Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AB8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 08:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3611FmTv5jNEdQnwU/9bSnhY3z68ox4B9EQSb7IO08=; b=Ybyz8NFx9v2qu/XyS+IhP8EAZh
	MjcC8PAtDe8XjSQFXdwFt4WfqT8+imogUmDufwdb3CWL6MWhP4gylvqlN2081LjQ/7ys3ko1soQnq
	W2bNk0Bk0OME/KPXGdjYKtSdsc+YDcH1dnoMzEVv4OYD5o32FKgDfkYuuoMMInnp4pkSkrPhj60/U
	7RfUlLKnxW6a3oM+SB0qXl2ShEpM1HnwnllWO5oLESSzLRQtEOkws3UHUDEiWqbK90lmODr/wRrZf
	iF6YqAsPo+lJP6XzDanxPxdEfsJiPM3VMAe8Wmaa/xzk8FmRHNtsK+5k7z4Tle/rcHIDUHDptL4Vj
	GvILXBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdkpj-0000000CzE6-25nK;
	Sun, 28 Jun 2026 08:25:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdkpg-0000000CzDl-3nMH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 08:25:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso12227335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 01:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782635139; cv=none;
        d=google.com; s=arc-20260327;
        b=m6+HFrZz+3aeRvnVWV7bGEC7HWL/xTzF56L0ugzhTJlWGhZS8ZyXSuy/Fv+WSXx8m0
         XEzsJPs0Udta6bopy9IxIq0JX9Kc4Gh8Q9Zo0ZM7g+gE6ucUwypZ9HVst1yTdKW9/Nnr
         9T3uPhyEt3W4mPhJZGhgBOj9RaPBqBlP6pSqHvN4++C3LMDxrNRXQH8jlpMVw153Rh5k
         TPdx3oGlwOLdmVEq+FUCf79MtkxBe7CSkCRsOFcs5Y/3wayRPOmxjpfsy+ZB/7ceV7tF
         aQNzVWEvARRlTE0//HrSjKgj7sFkLnqHtrq5lfc7qa6KCvP+0k7d63xpp6ozKtRQgr77
         wdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y3611FmTv5jNEdQnwU/9bSnhY3z68ox4B9EQSb7IO08=;
        fh=VYlEXrODZHn+WikiM802jkWvvL573BHNk6UWY1FOj7M=;
        b=I8STvVjFenLaArTdIX9fCifj1d3L/GP6Jx9FJ9GeF/0UnYZiv/QxijCQKSCOOk5GXN
         HTZgWcay+W6ahnojbi3fdOBLTfPhrnYl42mfFslQIkgXUrp5H5TmTjfxEYW3s+UtRY8l
         bGo0lr3i2vAjCMP4EcSXu1yq3eCtNDT3+c5SiUcJIuDJMGzumyJoTvNEUQs4thcTVPWG
         YWYOk/R+PNv3eDlEc9d4dxKEZ6FKonkID/wKrfo2dOqEzjTlQTmn5J+W2Ba04CK0YOIM
         4Zi59uuXvI2m0zrODU3Un6h5xSTx8fYDQTfgtUb3ULynNWhmOVesnYMcWIhMqHIv64JI
         tDXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782635139; x=1783239939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3611FmTv5jNEdQnwU/9bSnhY3z68ox4B9EQSb7IO08=;
        b=TlzwyxTDsrvAkMnn6TSlq2n+Fp1Y7MkKySLg+fK7b1vKYdgag0l6cnRVEQe5FjJx8A
         739UNMX1q6MCpv/TNrmNlHY1nou4Zs94ToD9px5+5zC0EVYLJmaVaJ41oM3Of8gLPFJU
         SWFqO/5vUSguWMjQD7TOG8E3vJLRxjGWmkM7TorNocN8Zd79ef3RCHCjeMMnVdR9ZV5W
         tOM24vJm6ie7b4nS0BTmP72MRL2wWCFz+M1k4mUfsmU24GemFe5Cd/SWfZZsn52b8NAk
         FJcB1bKs+v5imIH5cMZrBtLvJpyF2913/nlwgLBp8Fu61kW3i3Wcxg1N+cTXJ88XUfFc
         EKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782635139; x=1783239939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y3611FmTv5jNEdQnwU/9bSnhY3z68ox4B9EQSb7IO08=;
        b=iubKwWZcSvT1BIdRj8EhOrxMT4eQWcsK/RIZ1OwOVNHkeIJTRFKE24m0zcg9Pd/8ZD
         HKVNWX+iHUNr5/93iRtS4vyXfqdKaqRNQDITiC66lIoX6aKueC5CRUB9WSLdT7QV4UAo
         Zl+ecHzVGbZKsoPQxfCbuXjCYn5o2Ft6wu2QnYDJH7r+07eBNffZnQP9n4Z12BJUq9iy
         ako6JJbN22gfCW/lCjmYXq++uovSEaK8yI7AHWosh/k5iWkmd1iOKkj0JvNDCGh0i97s
         IQdPHlbMij/KQGq78Bm+v0mkJPxEDTJ5RqH0ENtPdSgavkiBRDntxUeeNHNv0DF1iBux
         QWXw==
X-Forwarded-Encrypted: i=1; AFNElJ+pXm7HvtUsB5cP3PpNFjm9oMXcBf3OrxSpbmNY0ZemqSRJ+UWBEKJrSTSbLkML9nTR8fuFWUguf7qyr6P5ACkd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/JWtVNpgoiKVy6HThvlc63NKnCJ/5jO8MvWlTrdecfOvrWmL6
	fmD5Azy1xSiGd7YFO+7Rp3QjuT2+GdwHSkiecdWCklImk4HGxWuSMUVDZqRZTLZbQsy3LpCe93d
	czLChUApTG4LkLZFEdT1gSawYxQUUOa8=
X-Gm-Gg: AfdE7cm9YrzAdIr2GIiQJdEeFMROsDcK1KGKeNb2rKkkxCucuSc/qbY6L5rZhtvbcfh
	lSUl2YeS7fM8fZe+gwnfidxX2gFR2Z4b2z8Lx1r1NM2Mo4ze6I+a3QYjL0SamueyiBblN2WByBl
	4OiBJT/pcbGTYWZUFEV9wt9ySSpOWCZy7XuyKxWLArjp5CzOCZoEtejSrDoez7xL+hxMvJVlESx
	5CAsorr/wA6VrGsaMur3cMl1Dw4xhAwhM0NA+dFeZ3Kn2y9gon9GercreKUaZKmxih+RhI8Fqm+
	eKx6HM+cu+77Hmp9C7ISvdABtVjyKyxvZa0s2/xz0eJSePSgdbtB
X-Received: by 2002:a05:6a20:d530:b0:3bf:90ba:52cd with SMTP id
 adf61e73a8af0-3bf90ba55e7mr772607637.11.1782635139074; Sun, 28 Jun 2026
 01:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com> <aj6l_eMFLvQVq2md@SMW015318>
In-Reply-To: <aj6l_eMFLvQVq2md@SMW015318>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 28 Jun 2026 16:25:28 +0800
X-Gm-Features: AVVi8CfsyW0fJ7FrAIo4YFoZKQX_l9mugHxBLeemo8-ZqsMdLUudTpptA2bn4QE
Message-ID: <CAN4SLj2eStTLmu=vbN2ekAV3n0D8E5HUFwh31AjqYz=0GVsFeg@mail.gmail.com>
Subject: Re: [PATCH] soc: imx8m: fix clock reference leak in imx8m_soc_prepare()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_012541_130454_E2CCEDAC 
X-CRM114-Status: GOOD (  12.49  )
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

Hi Frank,
On Sat, Jun 27, 2026 at 12:17=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
> > ---
>
> Thanks for your fix
>
>
> imx8m_soc_prepare() call be from probe(), can your use
> devm_clk_get_enabled() to combine clk get and enable together.
>
> And use new patch change ioremap() to devm_ioremap().
>
Those resources are only used in the probe time, it may not necessary
to use devm here.

Best regards,
Felix
> Frank
> >
> >       return 0;
> >

