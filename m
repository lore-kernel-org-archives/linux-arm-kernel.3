Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DB1F41808
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZaxe7E+Iri0Yj4ZeX/Y23Uobn7iJJUUZV9GAydph+U=; b=zx6XjnlzsVGggnmOg9Eyz6Pl7L
	O3i1CSDukyDLAxh84D/VWbkoezM5RqaDq8lmrqfoFsoZjXoSAWZN1wUnp9rIPoiV0scB8fW5mtWd3
	Zjudb9fp2/fp7CEGqLE5XQbkzhDJwUG+QTrq+GUTmf9xAnPpyK4FB4LEPPjFz6w7cVZ8RLaIacefE
	YRc4+vjlC9erfCiCSjosm55MIr9udINQACiJ30Dh0ACFlyLtA0Qw+fOrpGPxHZ3ct0JSlck4qqzxv
	2eE22l8OKI7B6QagmuZ2FPisSwXx4lxZDWiHTWvCLzvRvhx/TrZ/4BPwU+ctC2QrXnQ/am785dkL8
	TAFK9nHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztOe-000000095Zz-19Nc;
	Tue, 10 Mar 2026 09:29:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztOb-000000095Z3-3ghV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81BD1443DB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542DAC4AF11
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773134937;
	bh=sZaxe7E+Iri0Yj4ZeX/Y23Uobn7iJJUUZV9GAydph+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CuAdMO0TU2BREyIbTlTvzg12VlLDCz9aJVBV4hiOzhEr6oyGITm0UAXhO6ZwJQDM2
	 CUg7uUBNZ2MRGFJrTybiu73YNd46mkm8VYsEMXEvs5u6XWMkE6Y4KOT0fMvdw2xfc3
	 HbXsPbLrhCEQhMQBeyLs53m0XnDsRFUH1mw8VZCRaWlg7dJa8ch0sGyGdzQkBkxG1D
	 iN3pIW1O/et8eji8F2wQaQP7pTANcOOa4MXmxVWzIDWemUeEHopTOL5o7RLE/xPd0e
	 xoxUq0uBhn1Bi2uHco4A2szqDuQdF6ZLTLt5tEhjfrDUCL7mschCdLaO3CGeygg7Rn
	 ZD3DDD77mdf8A==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64caaacb9bcso12094362d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:28:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrWjY058eYkKqGWehnQXmr7ZqfArOtgKCImnHurCTyGDm0vNKZoCXpC6joPrrgGPN84HRNAw9+icfgId8B40wf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz08mBwNFvRKr6OWJLq6T2woL2nYXG3n6k3dKRhwWUJZ9eIA29m
	DMVNN6V5HiidtSO2b/vGd9+qgwouHUG6kQ6YzdPdZFx8yVoT842cJjVBshEvf0EKq+yBTZj+ReV
	QkZ2RR2ceuZ+X0/I60npwf3Klgs4iecE=
X-Received: by 2002:a05:690e:c44:b0:649:ca5c:5990 with SMTP id
 956f58d0204a3-64d14316d3dmr13079461d50.66.1773134936582; Tue, 10 Mar 2026
 02:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-10-eleanor.lin@realtek.com> <20260307-purring-kind-binturong-1fcb37@quoll>
 <1baf65a11c26482cae4f7b54df1521c5@realtek.com> <af8aa42e-8ef6-43c0-9a46-173420ffe49c@kernel.org>
 <0ed4a4e5e25e47ca8f040ff4632ae0c1@realtek.com>
In-Reply-To: <0ed4a4e5e25e47ca8f040ff4632ae0c1@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:28:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLn81uWf=3QchYHgfAqof9Wq_t8PEiKEJqezbYT0vCuEaA@mail.gmail.com>
X-Gm-Features: AaiRm53ys6zPtcAwL71zHshpZVqBa6i3gejjSIKMd2ptpnfhLQmIJqyYSNvWc2g
Message-ID: <CAD++jLn81uWf=3QchYHgfAqof9Wq_t8PEiKEJqezbYT0vCuEaA@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename
 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"bartosz.golaszewski@oss.qualcomm.com" <bartosz.golaszewski@oss.qualcomm.com>, 
	"afaerber@suse.com" <afaerber@suse.com>, =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022857_961303_A900DBC7 
X-CRM114-Status: GOOD (  16.52  )
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

On Mon, Mar 9, 2026 at 12:00=E2=80=AFPM Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B]
<eleanor.lin@realtek.com> wrote:

> > > Therefore, changing this property name will not break any existing
> > > device support in the mainline tree.
> >
> > Yeah, but will break all other users.
> >
> > Best regards,
> > Krzysztof
>
> I understand your concern. I will drop the property rename and keep
> realtek,duty-cycle, but I will update its description in v3 to make it cl=
earer.
>
> Hi Linus,
> Although you agreed with the rename to realtek,pulse-width-adjust in v1, =
I
> will revert to the original name realtek,duty-cycle to strictly respect t=
he
> DT backward compatibility rules. I hope this is fine with you.

Sure, it would also be possible to support both, but that is maybe
a bit messy. Let's go with the old.

Yours,
Linus Walleij

