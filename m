Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5426CCCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 19:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=br2GX12R/HfpiLwzsj1/S/8DyFMuLHUl83yTUA1p69k=; b=NRDq9ErSlGMi2gkrZoPFPnHdSr
	t7sOwjHTPFdBZXc0299Wq/KAel44yD5YqGw6VOJ/PtzZgrMqqOamIo/JN8LSkgOCEJnjKvHlgMQU3
	d963s6li5x1Rg7amRDLsTLixddSvs/sHj4LWMC2BUn1HW6f79WUviq97fCd5fdDOqnhCchi8Albqe
	BNmygxZwZufcQwnNrWCejE+waATcZSrbVaVyDw08reeb9Fw+aksw5wOsGOJuJabt9BVbpRtEdU+n9
	pNOkuPAKrwqFHsbYvmPtfCpRujN5WeEgA5JrwsfG3vnIw4UMUYJ91qbRqJS6Qi5jb/GuNmC6owci9
	bTq+tgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnfU-00000003uBI-1ddG;
	Fri, 16 Oct 2026 19:32:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnfS-00000003uAp-27vu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 19:32:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41806437FC
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 19:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2916E1F000CF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 19:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792179157;
	bh=br2GX12R/HfpiLwzsj1/S/8DyFMuLHUl83yTUA1p69k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aReIlCrf8fopyF3ChiCIeEC1hCVb1THWDlgJCVjWvzHnaPg3t3MAIyhg8Fr1qc9/g
	 bAFQSCdM5MdEygdgrMT8ldLha9m7P76w8w6j/7Xw2O2MUqWQ6S1ORocCep7vvCWVnv
	 6hN0Z+UiwikKN26uxBoYDhnDL75AwoLrOZrzm4Wl/DB//rug2d1E8QgBEjZqYKxW3W
	 5tky7SVtLE2Zvp2ombz8vwf/m0T1ZSSfLSpKAT5HChrlAldlFv5MPjciI1qM4I3hEq
	 xfKCn0ertUbTqq5kBKCae86MJZ9OOf7Y0gtSgJIidcPulfTy0uOrszZtTvLLlEs46h
	 k+Gm5MHX5lKIg==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3fd91337baso36439866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 12:32:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBFcnniUrME8F8xsTyGv80hcTL5eC+uITOnp8n63EPtDVmQHxQB8PFwfxBlgMCj6CSQa1hLl/zNkpPhO2LYEkf@lists.infradead.org
X-Gm-Message-State: AFq9FYKEQQuNdOKiNLKSItJYN9EpLhrUfMfkxC/SsYvMOteHJH6NciJ9
	FKca9HS36AfaydE+2qiU4jnPxu0sKq3G/WdlMdjMKwiRjCKjQKFXqA8S5mbmJ6Cpky14hslZOze
	7Wnuah41oa1OuHUh7Z+tKtGRWDc00BA==
X-Received: by 2002:a17:907:3f95:b0:c34:c5e8:1dc5 with SMTP id
 a640c23a62f3a-c419da41344mr62932166b.20.1792179155493; Fri, 16 Oct 2026
 12:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790606188.git.andrea.porta@suse.com> <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
 <7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com>
In-Reply-To: <7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Oct 2026 14:32:24 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+rjfk-EGKy+sf-S7QRpGy_7SC38ZUASs28gWm_PuNDvQ@mail.gmail.com>
X-Gm-Features: AclHuK-3lCKkhjPmvIybYNhFqPMhoSBVuchxzZzjM1TnQd3DNXu0J5TqQN1c3O4
Message-ID: <CAL_Jsq+rjfk-EGKy+sf-S7QRpGy_7SC38ZUASs28gWm_PuNDvQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-pwm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>, 
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com, Sean Young <sean@mess.org>, 
	Julian Braha <julianbraha@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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

On Mon, Sep 28, 2026 at 1:26=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/28/26 07:42, Andrea della Porta wrote:
> > From: Stanimir Varbanov <svarbanov@suse.de>
> >
> > The RP1 chipset used on the Raspberry Pi 5 features an integrated
> > PWM controller to drive the cooling fan.
> >
> > Add the corresponding DT node for this PWM controller.
> >
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>
> Applied to devicetre-arm64/next, thanks!

And that introduces warnings because the PWM binding is not applied.
Either wait for the binding to be applied or apply the binding with
the .dts change. IOW, Broadcom is warning free (you're welcome), don't
introduce warnings.

Rob

