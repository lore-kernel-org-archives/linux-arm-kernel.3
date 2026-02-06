Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3E7EE208C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hffRbNLZFl9uDUo0y6gSrfmxCTFy3pQga3bjflSdj4s=; b=CUB2pRibRsFJXJ8Skk6YZQI9le
	NwSOa+88SCmSzI2GyYUkSONDd+KfBi2PgsPygIuronSp2Cr0slQ3CiQzeveZMDhNjfUtmLSfgKRY1
	HeyttzcmWNGagx1/L+LVLB0zgKT8OD0jz4HHcXiAtcEA/m5Nb3S5jwxMlfAaCXRwIHpRhlP54QvBb
	pnlxoq5jq2rdsllwGavNpKulbDz/ek5iNt1xD02tRiJDZ1qDffPmDXPOkKc9R9ZtDcDlbv5+RWDlw
	knt4DFJUIeXvI3rfp8jVKY157a8znTd/b+fYilzVKSvQAp4ctCfrut6aSN1fBC47TONwzizgIS8l5
	hTkUFEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJdY-0000000BDMe-0Kny;
	Fri, 06 Feb 2026 11:04:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJdV-0000000BDMX-2Q2F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 11:04:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A719460051
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Feb 2026 11:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62069C19423
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Feb 2026 11:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770375868;
	bh=hffRbNLZFl9uDUo0y6gSrfmxCTFy3pQga3bjflSdj4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o0ZR2OZ8ET+okN4dF12G54Fgx+7fWpcGE7D1bsf3+A0RUl9owzQXS5zpp3kKfDY/A
	 D+2N5HirxoonxTHayAVJ2tlbvIikf40jJam3Z0318URN7KDOx3U/IcFMUKIHL7ok8S
	 dWj7iO+PLNVEaxPxsE6+4a3rsUgInQDmXnxqaf1NnsNWg7or5MRcp2+BYI6v3bMYX1
	 +OvWuvfNBr3VBWC+xo1ZtlKpQ3s0m69RvOSTVZikqlMC+DdnD3Fit7TLyLKGoOGFdv
	 7c0YeTbv2ItXrzfavxUX7dXVAujAgfF5IOshhroNX6b6fjDpq3hE+8D2Smb3wPJh84
	 wQQV8OIa0s1mg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649e97f1e99so1717236d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 03:04:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkzZ2exX4y/huVGJFIRYc98+6LsEyI9sMnOnhfLgIdGvxchB8A7YSMOuZJMDjSGlD2u4x2QFcNVw+zFBxYfjYL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/y0/wXpjOVs8mx8mIwByAegZyLaKb6OjTMiqJmrzAM7/OP4i4
	rlZKOCNILiQhcjImu+8fh6hBVavFbBzjpSYaSK6GESQQ5kvYgT0DHzBFIF4p5LQgOoKLE3Sbhk9
	QR7GpNyYXGc4XTgmJFxV6OOysRfBEeYs=
X-Received: by 2002:a05:690e:191e:b0:649:df3b:318b with SMTP id
 956f58d0204a3-64a0b8e072fmr1616388d50.7.1770375867660; Fri, 06 Feb 2026
 03:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com> <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Feb 2026 12:04:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
X-Gm-Features: AZwV_QjiR7EqiS7wfW4pJq3UdcwSHA9nPaSiBx_Jimt1qmxk2Cn1f0Eh_W2TsUs
Message-ID: <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, BMC-SW <BMC-SW@aspeedtech.com>
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

On Fri, Feb 6, 2026 at 8:24=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:

> I understand the preference is to keep pinctrl-single minimal and move
> the bit-per-mux handling into a separate, more targeted driver built on
> top of the GENERIC_PINMUX/GENERIC_PINCONF helpers, rather than extending
> pinctrl-single itself.
>
> Based on that, I=E2=80=99ll look into refactoring this into a
> pinctrl-single-bit style driver that covers bit-per-mux / bit-per-pin
> layouts generically (including AST2700), while keeping pinctrl-single
> focused on the simpler register models.
>
> One additional point I=E2=80=99d like to raise is the handling of pre-res=
erved
> MMIO regions.
>
> On AST2700 systems, the SCU register range containing the pinctrl
> registers is commonly reserved by a top-level syscon node or by firmware.
> In this setup, devm_request_mem_region() can return -EBUSY even though th=
e
> registers are valid and intended to be shared, which currently causes the
> driver to fail probing and leaves pinmux unconfigured.
>
> When moving to a separate targeted driver, would the preferred approach
> be to treat this condition as a warning and continue probing, or is there
> an alternative pattern you=E2=80=99d recommend for handling shared SCU-st=
yle
> register blocks in pinctrl drivers?

Can't you just base this entire driver on syscon which uses regmap-mmio
to abstract and solve this problem?

The syscon is entirely designed as a singleton owning all registers
and handing them out to subdrivers.

Yours,
Linus Walleij

