Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A5EFD4F19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYHwf92flHnUfSHhGWu39REnpB8D3KhXnDbPehoNQKQ=; b=hDBEslih09yTrcIo9zuZgZfzva
	cvLT4dEkTBsqOPQoIKelVjGmyUB9v+uD7LwFaSml4xPiIMHtx39dvTndGuVkTOKo8SLAI0U8M2AWA
	Mxd+xIMczntK4fu9sMj3VgKnWy2JCRbk7s4S8EDfA7lbD7pR0AvCGwzJpS6GigfPk/AthnA9Fxc25
	+M5gXs/KL2ZCn/lpaz2PXs3xR84F0TZRtlk34pJvs7yPTCzACu+6F1xlOrewOk9rGbaBj+Eo8bXnz
	gogvSwJLwkpZn9qvZA0QJ2ybZ591UO2jes9afODSpGuZHSbNDZUJ28TAlAl62e08SimVdGwgwOT68
	scyI7Rfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01ht-0000000A4HZ-0sCw;
	Tue, 10 Mar 2026 18:21:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01hr-0000000A4H7-2X06
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A662B60132
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 18:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57743C2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773166882;
	bh=RYHwf92flHnUfSHhGWu39REnpB8D3KhXnDbPehoNQKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VLp7+7J9llrwvCmETGQRw3htvlndh6m1nt/RRmA9Uxn1bhz+K/B+q6H0nosrrJG24
	 ualDb+AMHRYw11phgtZL8RQve4Fni7wZOk59ZLka5e+KPtlbhUxjNSzE/u7nYiB2MG
	 4bV3VcillBEcNpXDxDtrt3iOrWD9Xz8KTLy0tBBoJR7VPRwrGT4Bipusr7CoKRL2ml
	 l7zOALrl2J90A/S7t+sxsILHs96E/Odocww2PrRZOWkgKyzHu0R0BCxGsyhR7v+CIf
	 Ky6UMX9xuNxOpFUg5ny0u2vMeWHrFW3AaDx6+eRfY/UL0WbUJETU9XHUwMA1DbqaxY
	 zFxqVd4KpzOUg==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6611d20c026so10002109a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEajhIqpvNOR6xJGFW5MhaFzNQQqsoOfLvN9cVC8W1qlcv5gleHISZ3/eqtYmzqeUW9hk37Y1kXUA5awbQYNek@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk2nBDo+2hv4fy+WH68uWWDrFHW1Bbxg1GV9i00O56jvLRm9WF
	DEBKYgdqzu8OZ/133TjfTeOJxPAiiQe5j3dOD2S7LiOa3lw8/M5FWpkCBogHLqlNGsJguBtGC6r
	azBM+pnznXwn/J7mvCBkjnVy0ycTM1g==
X-Received: by 2002:a05:6402:a290:20b0:662:aa89:2ffd with SMTP id
 4fb4d7f45d1cf-662aa89325dmr2220648a12.18.1773166880808; Tue, 10 Mar 2026
 11:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
 <4089450.ElGaqSPkdT@workhorse> <yq14imrwp3z.fsf@ca-mkp.ca.oracle.com> <5973984.DvuYhMxLoT@workhorse>
In-Reply-To: <5973984.DvuYhMxLoT@workhorse>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Mar 2026 13:21:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKGxrNuaTb9+n3ZYjAdY=UHC6z-neXK-aieTXeROCN5og@mail.gmail.com>
X-Gm-Features: AaiRm53EXEYwn_27B-gILkkR9Yt_6ubl80Y5DTYqzcMmOl6Xp1DwezMjgTnFj3c
Message-ID: <CAL_JsqKGxrNuaTb9+n3ZYjAdY=UHC6z-neXK-aieTXeROCN5og@mail.gmail.com>
Subject: Re: [PATCH v9 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196 variant
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
	Stanley Jhu <chu.stanley@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, kernel@collabora.com, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
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

On Mon, Mar 9, 2026 at 5:04=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Saturday, 7 March 2026 19:01:17 Central European Standard Time Martin =
K. Petersen wrote:
> >
> > Nicolas,
> >
> > >> "ufs" is redundant as all the clocks are for UFS. Same comment on pr=
ior
> > >> patch.
> > >
> > > Is this naming a big enough concern to block this series with two
> > > explicit acks on this patch that fixes a wholly broken and useless
> > > binding?
> >
> > It is if it comes from one of the DT maintainers.
> >
> > > I am trying to put out this dumpster fire of a downstream turd that
> > > made its way into mainline as the review process has been completely
> > > subverted, and is only getting worse with each passing month
> >
> > This has to stop. Please read Documentation/process/code-of-conduct.rst=
.

I have little doubt that that is an accurate description of
downstream. And if properties are getting added without bindings, then
that is certainly a problem that should be complained about.

> >
> >
>
> I apologise for my tone, it's my frustration getting the better of me.
>
> I'll be handing off this series to someone else, so you won't have to
> deal with me anymore.
>
> I do ask however that you don't apply patches from MediaTek blindly;
> if there's code to read an OF property, and that OF property is not
> in the binding, then the patch should be rejected, even if there's an
> Ack from the MediaTek maintainer.

There's functionality to find undocumented compatibles in kernel code
(make dt_compatible_check), but not properties. Sounds like I need to
add that.

Rob

