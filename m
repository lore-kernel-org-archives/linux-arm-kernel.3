Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AA0C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 18:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u97Ilxc+wS2K+t2W8mxBSQTwx/SU+RUBSrYOhBVp320=; b=LUBkHb2/sPdMQC0++hs7Zz9qY8
	sES3E+b9EKPeHyv691La+IkSKZjVA/UR+vf+VQP4JvGBY6vbNyPATWKVUiAbN8UkI8Yawca9ks7Cq
	GlAxK1lFhSBISenqFhWVNm9yi4BARsFBHIjW7KS/bC676U7e/Cs0auixrFaaRnS18NeeO5/Khulv1
	k9UHRioyh/jCmPA/ywN+8QKphlCm5E/B/rbJnYwvLpb8cInxSPTJIlKR4tHoqk35Sp5lTZBh2Dy4M
	sxw6tnBv66kI+UtNRbgshnIlKwlGJBfQQRHX6j31zRoIRe94xRm3+IPlh3toRINznG8V6trLSkQOG
	Q/AMVw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVu2-0000000BBTn-0IPP;
	Thu, 30 Jul 2026 18:54:46 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVu0-0000000BBTM-1qrc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 18:54:45 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso231149a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785437682; cv=none;
        d=google.com; s=arc-20260327;
        b=RKfLIQ8X5oc6+zxfWCfUodboswhbA6JoWjQy4HG2KHEODLCYeLq88mNx+Ui/RVkiCJ
         ywDSNBkzsnHmCiLfLJ2RKcEMIK8Fglmf+4Yc9Gt2nxCegSWJESIExCmsbGgGZEA9X4Bd
         PCONsV2d4nt68deVOy3uIyfBiG+peC22WJp43zmeKT6BYnWXMmscoX32gLqPLNhEJ2xh
         ys9kg9eu23BZR+rz/s5u4miEzUc1BsUEZFl68POFqulVWNYQPLdjaXH7tHRDKzF0it8r
         jDzFPRrSPvDlcqsUAa2rRJLfVT3DAqLlu9qJRJfs5zzezBspJtybZDpZjHmupejJf/qN
         Of4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u97Ilxc+wS2K+t2W8mxBSQTwx/SU+RUBSrYOhBVp320=;
        fh=cS5t0/qACwmb6uvOd/YIomssg013oJjKMrqRKQ3nQtg=;
        b=BRJplClDvO4xCec8L9FfJiyxDKrujjx/YvZ3mic8KpH9uadCwNJJIKSc8TgxKW2xzY
         cgcYWfoxPXs8mvQ+dxRa9PYeyRhxup3DeAVS/acIZUV5r+mnuBdsZPvVpYPHmL3c13gv
         uFTh0LzS0mr83PSqJ4kG1KHPYcAZF/B8Lex84e0N4qkk9Y6tSJl4bN3Fq87xv3Bkd2wh
         ccvsZjwaZFGXrvVpUh9h/pmT9IQVlIiohl/GWmMJH3cYpMl8FqU1CGRrAo8ZpAnLRqNs
         d8/8oep+W7YbT7er93/VA1RJ2GL+AZccqp3bQvBKQq42EMdaKHI4pGX69yQ0wt/ubeZl
         sRIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785437682; x=1786042482; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u97Ilxc+wS2K+t2W8mxBSQTwx/SU+RUBSrYOhBVp320=;
        b=caFSoVcj9tzhn9mu19hm7ghYu++jFhFBQBIgM6yqyhp2UIrqPLo2Mi88eNmjZ61aL1
         TZKSlUrUbepJfNg5lewx8UetrBrN9O3HynQciX5601SXccPNpmpFWKSkwNqkdfAJuLMP
         eiSxtOpldIp+6VYKBRjOQDmWkQTaiACw8iSSUfT9Ouz8eczhOj1qwSeoDW3+b549OOn9
         FA2hXCFUoCgNiA8nuOMnsIaIxsO6pH7D8KE0rYZQ+wm1N5CmlYrQT4rZXiIV/bR7TdMP
         0lD1oQ15JA6iaBG92QNvGnftVKY6EElUxe85G3RLZP5WDzD5JkTnjkYg45k00y38yPvX
         T24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785437682; x=1786042482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u97Ilxc+wS2K+t2W8mxBSQTwx/SU+RUBSrYOhBVp320=;
        b=fyqPjoakzc3d1jE68BSijUKpaMc7tybbZMibbVYTG58GLMXnCs3HHRA9jzi/ffSneS
         cpXEg/MpbCpk+xKbFrYD+uSt9Ho8ji7u4J2wBG+djuPt4pMBtDdyHN02vp3C0o5JCYKm
         AnmdrRsrXazz23wpUVZdoawBczyX/g6Yjky2Gw4bWVZPCF2Xg3Yc8afQY2JFlt4OuzOA
         FWwInfChZMujho3ZGx5FSF5By3iZvKoFVb0PsJ49PRKiKo1t6rMEFk/ZXHyqyXio6qCF
         JIzQXVxexiePqv35J0FwRlaE8qw1wCM2KvF8+hwqa9p92aQFsmgx6F1JAQg2TYk/0RSp
         m+gg==
X-Forwarded-Encrypted: i=1; AHgh+RpRG+u85RL5iqQDOcHqFx5f5s/8T6RXb5TGh09Fy/OG3IbKI4yEovbAsAdFGHKZvTvAHKvIcjDpxRbvzAwb2HGH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4iTjxY4Uet/lQ9pmZhawEydSy4/V/UyiQ9t/TnPdocf9yJug4
	mSvHTVDd5o63oaoPCRY5pt+Pxyk7P9xoR7R9BGJjZZPEqpk1R2A0rbueXdxgIuhBTwqNevWZDu2
	aLHeShyYM5/AKzTtw/v0sA6ysTBTAMow=
X-Gm-Gg: AR+sD11Um4BnTbHfmQEGNzK5eBfIsMgXZYZ/M7e1aCGv1s/AoAjgKeTGCvnve1ntNA5
	0TP/hQXk2vSRs2NCdQY2cphywbjJPI1+ZLOQdep/1oa4WJ7D7xB0IeLP6k2zyLz7dKyF6NirVwO
	bh32CMEkYFHjBIM2vDqD8Z71cramgvAlGi1t+8UBWwoBnk560tEof5Zb7pAuDd1AT1pQ1kWU/SG
	P/AUDl/s2spqZnwisM01OIW8akWKLfD3kIn0og3aS+w7BFKgXYDe2n92sJisPnJgfnCnuSBl2Oe
	18Ju4F1VUxtArAnw7HckN9mqplQnmSotYdY4nFoZ4NXbRKRYoMefcQw0xnppjpf8lZAu33pnrr3
	QXWUW7simrlNAQyJDqOXSTWAsnI749AnFx2dYt2VwLTdW7tgAs6gRPjA49/9Tg/3bbigkr6SPLK
	VgTg8Wy9hTLrBOj4IquqEAaLV+OVtUqxkUBn5HcQYL+6rEqIcIRTR+5+s4VViRffZLNw==
X-Received: by 2002:a17:907:3cc4:b0:c1a:5d49:f9d3 with SMTP id
 a640c23a62f3a-c1fa5845675mr174898466b.47.1785437681452; Thu, 30 Jul 2026
 11:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260716205811.800920-1-rosenp@gmail.com> <g3gtckpqgacw44jqqb5hb3oejpelxvbba47tdwsvksxbbskygp@mcwtsbypoyar>
 <CAKxU2N_f1nN4Oo94V9MY6Q-wp66j=3kodfMs0BeXVGB9XivvNA@mail.gmail.com> <5ea47pp3ctiieqahn3mkcg3dqrlmwdgdjyv6pa65qmjuqop4lb@tbax2lojuwkr>
In-Reply-To: <5ea47pp3ctiieqahn3mkcg3dqrlmwdgdjyv6pa65qmjuqop4lb@tbax2lojuwkr>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Jul 2026 11:54:29 -0700
X-Gm-Features: AUfX_mwQA3n8phj6W2IouoFwXDxL9pe2fUfCvfsSUCFuG6D4skJUDTBpP3OqTjk
Message-ID: <CAKxU2N-2Vj1pugC_L=jhMS06CA34_-a-txZCrAoUtrRwFQ1Stg@mail.gmail.com>
Subject: Re: [PATCHv2] PCI: xilinx: use fwnode_irq_get() for INTx IRQ lookup
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Michal Simek <michal.simek@amd.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_115444_518984_6A771892 
X-CRM114-Status: GOOD (  15.57  )
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

On Wed, Jul 29, 2026 at 8:48=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Jul 29, 2026 at 11:18:15AM -0700, Rosen Penev wrote:
> > On Wed, Jul 29, 2026 at 9:00=E2=80=AFAM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Thu, Jul 16, 2026 at 01:58:11PM -0700, Rosen Penev wrote:
> > > > Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev),=
 0)
> > > > in xilinx_pcie_parse_dt(). For an OF-backed device this is equivale=
nt to
> > > > the previous call, but uses the generic firmware-node API.
> > > >
> > >
> > > What is the benefit of using fwnode API for OF only driver?
> > I get conflicting information. Apparently of_irq_get needs a call to
> > irq_dispose_mapping but fwnode_irq_get does not.
>
> That's not true. fwnode_irq_get() becomes a wrapper to of_irq_get() if OF=
 is
> used. So both needs a call to irq_dispose_mapping() in the error path.
I don't see  irq_dispose_mapping() for fwnode_irq_get() in the codebase.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

