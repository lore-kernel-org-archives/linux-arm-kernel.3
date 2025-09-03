Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C702CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvv5D8mnkMTlnoYs3i3HuxRJ3lgI3ZhGxgUn/QmY3UM=; b=VMWifc8lvFfrNqXXHNggC7G2ei
	+I5/TQdPXrx1vl3bBgsL15UVbGmyPad9GCiRs3FGyHqWqTMwe0QeJmJghHpWaFdtyL+sTHcO/qiZe
	dDRe2E8JZvO0Bj4kqnLplURGpz1zDBx5yu2O2JCY8MaTYPbIMHwoIedIeCuh8Mbl5hzH2wM7GrfUs
	ydvieu2mPbwtyr6rox8oJDk6bYRyv8UCONEAv5tOQu2r+X46y+piH8HkwxyMCI3zAHjIjWDzre4+y
	tnAePDYMSJXO1b8Pp4ryiMTilhFeVAcQxVrI0c1XoBB/V9AtDJqzaVIChiaGPhDiGnHO+RJ2ao1Hx
	P2bENGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrG6-00000007BgU-2WIm;
	Wed, 03 Sep 2025 17:26:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnim-00000006d5m-2SZg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:40:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C70C60249
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 13:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FACC4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756906819;
	bh=lvv5D8mnkMTlnoYs3i3HuxRJ3lgI3ZhGxgUn/QmY3UM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fGnE1oZ+39/GuuoRDaaTkt8MY88oEZU5KWK1TUP3Wr1jdXKmEgQIkCCuj+DkbZZLJ
	 85aUZR0NHrhz3PIWsZTLVJiIFkYbd53gnDJmFxm/bObU3P2udHHEbRa0tztPuSdNKu
	 ew1FDTCuquP/YVUMFlzLHuYnTaxYOcbz5pHm6O+zCGMhZ9WdU/9Nn40wP1Y/PjWfSq
	 FbIg9+gIJdb4zfVUU1kHSu6fuYjcS8TPsnWGMQ10yoWh0blkYIyayjZO8QZqIlAbk6
	 8a1D5zZubfGAeEYGozDY8IyEXKEaBDz2+TIdhlW2XPassEPrCXyH51+mCmy9PXwmzn
	 E4dcNNhICy7Hw==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so7157734a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:40:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUM3QxF+5va6koOtY9v6EgUMoyMdOSv01bGK7PCkDRG9AAHhbZgHK3GUw15UUaQrWncnr+4/x5f/JEcxZDpiq1t@lists.infradead.org
X-Gm-Message-State: AOJu0YwXbEAxhct8/j35qFp8qLvtkrabvIPh1XnKRz8klKizfCufj3ZM
	5h5JNa4VA6tkwpsI9ZbonEdMY79MJ3BIb+k8IZlkrJt8qZs2WOazmfFBxF6mzROUi+vLHRb5hhd
	zrtOczbjuvSbqZZzCFcpvFLEKknDWyg==
X-Google-Smtp-Source: AGHT+IEI5rONWAGmUuQ0T6juo/pf8XchiICM5ct7ySlMdcsLqlsl5dtas428fYuAutHdVTYx18c+P5yWiK2OhZsk7uQ=
X-Received: by 2002:a05:6402:2547:b0:61a:7e43:662b with SMTP id
 4fb4d7f45d1cf-61d26d78762mr15929022a12.27.1756906818326; Wed, 03 Sep 2025
 06:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250829211330.1336274-1-robh@kernel.org> <0c815a7562551caf3960cd38b5d867c80747de4b.camel@codeconstruct.com.au>
In-Reply-To: <0c815a7562551caf3960cd38b5d867c80747de4b.camel@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Sep 2025 08:40:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmTmb3GF+CvidWhzgoDP60tb=BtggMcyEP_Ev9dNtjAQ@mail.gmail.com>
X-Gm-Features: Ac12FXwNsWO5DYzNPykwatojxDlJys_qPpKp_KZ_wSvZHEoXKmrvoXoQmYLtNWw
Message-ID: <CAL_JsqJmTmb3GF+CvidWhzgoDP60tb=BtggMcyEP_Ev9dNtjAQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Drop syscon "reg-io-width" properties
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
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

On Wed, Sep 3, 2025 at 2:18=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Fri, 2025-08-29 at 16:13 -0500, Rob Herring (Arm) wrote:
> > The default width is 4 bytes for "syscon" devices, so "reg-io-width" is
> > redundant and can be dropped.
>
> I had a quick look in the syscon bindings and can't see that this is
> documented? The driver implementation behaves this way though.

It's not. I suppose we could add that to syscon-common.yaml, but
that's only documentation. It has 0 effect on the schema validation. I
would guess we have hundreds of syscon's that rely on the default.

Rob

