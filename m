Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE71FCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 01:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWnUSCLzGExhpc14PQ8sxyjjtdqvZUyY+G0CrAnF3jo=; b=Bd9Kl2C2fVnlRIWWURmrwjkGKG
	uI/FL6ym1UDW6fAEM/BEc8mA52xWsWlpgHkTbtEP80NmQXFEgIa36UaVrbLBr0rkxhen3VXsfGqZw
	EYFGBlsx56jdssJ29pxsRiSfH+0cWHP2G/YBICn3DCEgDPo89bcUGnt6PyOHHm99hjTiAYEzmyiTY
	RmjYnlDVOplZLLbBWt1sUmCqBt4qSE5hNlwIYNLCytEYM8q/WESB6g0xx2Vt08YCBFQhy3NzUIZiB
	hIEml8/gmOVR8tPq+cwGOJxeMrWs/HIAwNizi9C3Trubv4CYgktVhC0EAySOHtWpZYQ0pikitipc1
	P487I2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utch9-000000038SL-2PcT;
	Wed, 03 Sep 2025 01:53:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utceN-000000037tg-0dF1;
	Wed, 03 Sep 2025 01:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7CD7446A8;
	Wed,  3 Sep 2025 01:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA498C4CEFB;
	Wed,  3 Sep 2025 01:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756864262;
	bh=UWnUSCLzGExhpc14PQ8sxyjjtdqvZUyY+G0CrAnF3jo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ijt8rJvF4WQP1+v1wZZCA8bj4GDhjxHSbP8OuvuI9PveJWCSmnTHhaL3YwOvd7VTT
	 JW24AefzUoFrivSPVVHmYlmrAQ+mDMThV/slNJfdsmVnB1ciQzCzOtvJsmY4dLiAtd
	 EZ9LEXzrqGRVb+CpdcyxH6IAs0NgDqTPJGkrBoFDZH2XHxOvXBXIWw9c1aK27GrB2q
	 6iLyK91xmux2NxQU2LH0RWdK0pdRjfPKrPerrabLNKumenFaDCSM2Otv2HnwA5d0hg
	 KKqKdjadEpGtUw2QSijmjhK1mc4kw7VMcIZmuwIMSaTLnJQ/1RDA0kATl2Gs+LUfLp
	 6S8ZyAc2aUaWA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61cb4370e7bso9083370a12.3;
        Tue, 02 Sep 2025 18:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6DqU0H1lNoLRZMLCmw+aAGxVYbh2AYGK3iykV9zDcyZxyn2cBG9LDKekeimZE3wlcTNaHng/FhzXPDduxY+SM@lists.infradead.org, AJvYcCWDbvslWR1K2o4727pPe5I0FNjr1F4CNjnM3ZOz88W59toc3XPYtNBgesTgT0u2EvXMncJRATc1dgJGhC6YJow=@lists.infradead.org
X-Gm-Message-State: AOJu0YwD+iBwB3gGsmV84tDOWHqEr7+LK8QPzWZw3nYeE5krcXYC7Y9D
	5SOFOqmKyUXGxHTpnWZnTArh05DEwvNyT9OtxO6K3J1CNcUb2in9MBQygonusjxgfsscmRLiGM9
	E0O9Hz0qv0nig0bkPYIwtuqiA6nwMVw==
X-Google-Smtp-Source: AGHT+IFEzOKJp3CdAUlVBLekgFAfgyITfS2lG4F4nPimPGJmbDDqsnOTPnHiFjXPE6SnZ13guf6LeeqRUKJ4FkGPDkY=
X-Received: by 2002:a05:6402:268e:b0:61c:9193:a4c with SMTP id
 4fb4d7f45d1cf-61d26987b9dmr10334427a12.1.1756864261267; Tue, 02 Sep 2025
 18:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250722171152.58923-2-robh@kernel.org> <5d7557f0-841b-45ea-901c-5b595ac8bde3@collabora.com>
In-Reply-To: <5d7557f0-841b-45ea-901c-5b595ac8bde3@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Sep 2025 20:50:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJaC47zFY7zvTVFum9oMiV87dgo49a9e3HW1T5_vQtAzA@mail.gmail.com>
X-Gm-Features: Ac12FXzJRn6b-R8EkQgO1Kk-9Ab88p5fsgS_P7zt_q8WWK__4HS50sDm1CK_f1E
Message-ID: <CAL_JsqJaC47zFY7zvTVFum9oMiV87dgo49a9e3HW1T5_vQtAzA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Fix out of range pull values
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo i Serra <eballetbo@kernel.org>, 
	Ben Ho <Ben.Ho@mediatek.com>, Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_185103_226066_E2BCBE56 
X-CRM114-Status: GOOD (  20.61  )
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

On Wed, Jul 23, 2025 at 3:16=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 22/07/25 19:11, Rob Herring (Arm) ha scritto:
> > A value of 10 is not valid for "mediatek,pull-down-adv" and
> > "mediatek,pull-up-adv" properties which have defined values of 0-3. It
> > appears the "10" was written as a binary value. The driver only looks a=
t
> > the lowest 2 bits, so the value "10" decimal works out the same as if
> > "2" was used.
> >
> > Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> > Fixes: 19b6403f1e2a ("arm64: dts: mt8183: add mt8183 pumpkin board")
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > This is just a few of the warnings related to mt8183-pinctrl... Mediate=
k
> > is #1 for DT warnings on arm64. And by #1, I mean worst. :( It would be
> > nice to see some progress on fixing them. Otherwise, seeing new Mediate=
k
> > bindings rather than fixing the existing stuff makes me grumpy.
> >
>
> Thanks for this fix.
>
> You're absolutely right about this, let me check what I can do (and if I =
can get
> some colleague(s) of mine to look at that while I'm away in August).
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Is this going to get applied and into linux-next sometime soon? Only
been like 6 weeks...

Rob

