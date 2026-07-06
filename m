Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B56C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=; b=3Ql2rKUSmhrUPkMh+hvekWL9QR
	0XxS5REUGHbM68/upzB8Xt8Txmfpp3QIrBcUjlra4nSd/alOXgUad6WoVCS4MMm/7ZFhpDseryxhs
	+66P2oDa0fEzC79mcgBW24XKIvFWTG95VNN0r7IpO2CY2GrfvnVArXcjeU09fWd6VMHaXF01Ge1Ri
	8zTy3lkf10P3Nd7sP6Ehh1YfR/Ik6UtyTLZuvz2JsV+KJjSRDG5eM2RhfLkhs5JX9ZoJM61/MIBgf
	SYzvFMFVwgm/BjycKNQ6jIiY2/H4KQq6cJjU0jawex+M1rKA6z+NvF4SsSHNDP8+8W73Vs0PI0Dfe
	FlnlNMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglhq-0000000CyCa-1l08;
	Mon, 06 Jul 2026 15:58:02 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglho-0000000CyB1-1sQx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:58:01 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c1274bedebfso350156766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783353478; cv=none;
        d=google.com; s=arc-20260327;
        b=SngpRp1CltwfKIjxHACbWHQGqWde7QdImXaTat22hqLSspCFk+wxwIpLxB+9MnyOz+
         WlOCmF7O3wHVrHyaZZwQzhpIMhFwkgqi1u/5wUH18keWkmicooR8soRBKXTnFghbW/BK
         4Hb8S1UVdRMRMnueqE8P5IW4yzzcWhyFwghEPGZc9Hdzs8szrA1+n1qU3CYEbMmSyHrf
         hTdHdVB9zNBej06viktybUQLB6mWrBpDUWRhty1DMoCkzxaWHDu58JpajOYYsQl6e5+l
         RcvSA0NrN4Eb9BYe+RAurUFn8gpAS0NqPGJxpf2KPFJmXIA4ij9lh5A6tbYSjdsiwz9x
         4Kfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        fh=vscIvLtYTL2d1kEPjgfGVBa1zhzs5HmxhkpV8u9ijgA=;
        b=iQDN8U9TqCycNPTa7ZsYluUyLdYwvRDcYNiGRHg6dWY2Qk2IsjkVnI1yj8m1zJzE88
         6cdgoKOG9AEJ0sM860m92b23mEIR2gIs/dhV0i/uNJo8D5dQ87hFJN9QZPdAMArBt0Qi
         ILlfCz4ffvbCtGeLNderHM11VkswJ9xCZ+4VlDM+XIexu9pHAnAtE8P2/J8N38Xqa6N8
         TCU6kwfmAYD+W4ZiAEhlqj0LROPExzePWsn/Sdj6nDF0gZT6i5ww9M8a9n1MFS1DwHv8
         PL7PagxJ+FC+TI2wJS++/o/zYLg05A9+cAxe7xaAKnVIbU/F/ePK5bra+TgmK/KB5XPo
         TQ9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783353478; x=1783958278; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=ip/T64y9CLFkqlNEvuT0oklBVa8+t0xsJrSbrr4vmRlwFRcSuRjuwNhLSSWCX2Xz2y
         tcuaoH+Phh3hPT1oX884myA1sulZlBorTxDgCnvXY06wBUu0BJkSHNBP+2qE0JgvvOo4
         M1vVjulJK4UXsfmDXNNb41108KSrwXciNXDRMO+2fjRgf9b/5svZmJPu/Zla2I/7S7zB
         7cAJR50JYOKJJR8vvKrWCQyjqC1DNplykntje+3qN4JWyUeyGDzle2MsplQRO/C8bNz7
         gH8kd24pxJA43I0TJGKnuDdhB1q/xKbVQktNvmwI/+ROuWMNkYXrfsTDEVjFG+piK9/L
         agAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353478; x=1783958278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=cuOyEsjXEliI1irtQORoHNWQsPvJVeVIJ8QVN8b05TTgvu/yLiH1DI0c0ffVV6rR33
         ENNLKIv8mO/vVgFKwpPs/tX4b8/Tnq3Qv3gniWNoiPgWiK02E+997DGGy58qto2/RU4B
         aCiLI/dkP8PlnsH8cme5N9U2DR73yLwbRcD4poQpqqe4wR0h8aWLMqMVJkJ53O4Qzagw
         lssez66jSnRUtVrslJ3Mzi0jGLg8gEBOFEA4/BaQKJQ2sRNDv+4B1p93JeWOfi9H1a/g
         ZtLSM9uJbEEmOmchTi4yxEoHon03csC4WvvKPeCiokbPpP0QQ0jYepXNbnkALXmdogH8
         PgGg==
X-Forwarded-Encrypted: i=1; AHgh+Rop9q2/X4S77zvDzCqU0ngWz/JMvBMMU2/jnV18JCOOBgFLDyU2TNQkYJWde0EFkfhwyYfOxRF/y7fEYK+Qi/VF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1vbLwXl9ukN+BPqdQFumJqKV59YAQqQxkhMj0z1SW6TbgGE03
	xgXdmutKR4IQ78LCew12Sbx6guslhKSR3KuTVF7y0cPhuzV4bzLo/XhurS/4vzmQVQxcGTO+3L5
	8uFpgPoGvWEPHrCl251PdRZuNMfDljggv2G/0infzjw==
X-Gm-Gg: AfdE7cm7E/sQ6v8nTd98kQRmLTkfhicQfbgZ7sMzltiSKHUzR11RYF6rfQdAkIY+KtM
	GE29eSw+9HLY8uuQDM5q29v7zHn2+Yw9kq4VbR9fVfYXb+P1iCiMTBkdhCVkZUlC3l4kclReMZf
	ByZzjl7nc1sbadyoxJXZYwrvxwfne54CsgqKh0eCEXkug2cY31RcemX8Uh/ZHK5PnsdwNykj2//
	bRXwDZ9nSt03yEoGKoRy5IJn1e/OuSUcGkm/f3LfXQod7aN+G30pBrCF+QxRqNI/Y3AIfATiFZw
	03qF51uXI1mhh+bTe+Wt1eaGGDk3
X-Received: by 2002:a17:906:3ce:b0:c12:992b:16d4 with SMTP id
 a640c23a62f3a-c15a68cf56fmr47982566b.41.1783353478105; Mon, 06 Jul 2026
 08:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com> <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 6 Jul 2026 09:57:47 -0600
X-Gm-Features: AVVi8CfCK8RZVsOnom89zz62dC_eh8WB0dnPwnnTYPsAfwJakdAft3ffWaiSkNg
Message-ID: <CANLsYkxmf=QfNUe=BLrrP7kBtZKq2Z1BkQDLnzmcQsW-kYzTPQ@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com" <b-padhi@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_085800_535418_AA1FA419 
X-CRM114-Status: GOOD (  17.73  )
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

On Mon, 6 Jul 2026 at 09:40, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Shenwei Wang (OSS)
> > Sent: Thursday, June 25, 2026 10:55 AM
> > To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel=
.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysz=
tof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjo=
rn
> > Andersson <andersson@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>
> > Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org;=
 linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx=
 <linux-
> > imx@nxp.com>; Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; b-
> > padhi@ti.com; Andrew Lunn <andrew@lunn.ch>
> > Subject: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
> >
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Support the remote devices on the remote processor via the RPMSG bus on=
 i.MX
> > platform.
> >
> > Changes in v14:
> >  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>
> Hi Mathieu,
>
> Could you please let me know if you have any further comments on this ver=
sion?

I intend to review your patches but other people's work is ahead of yours.

>
> Thanks,
> Shenwei
>
> >  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
> >  - Modify rpmsg-core to enable prefix-based matching of RPMSG device ID=
s.
> >
> > Changes in v13:
> >  - drop the support for legacy NXP firmware.
> >  - remove the fixed_up hooks from the rpmsg gpio driver.
> >  - code cleanup.
> >
>

