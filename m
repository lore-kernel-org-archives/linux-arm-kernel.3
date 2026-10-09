Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AB9CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeBFVu7Fsst4uAOVgc6REmRpgUidwNjQW2vFog6mAN4=; b=hla4ci8AKyorWTQGIsf372MveP
	44EzQAe+nTpGFnzlOZYHhbXoD4k83aznZQA4Zw7NPGMhKrV8evFEesS15PqnFtOXAzxlNEsdeL831
	92C4vkl+1xS6tkvuwGCSWEiXfpeKE1nFJZpt08I2a7Wh0x9y20OBKRI5XVWQF/FnCO16RNQRwkoDs
	A3sUs+ajsuWT+huX2/5eo6zsCmGSOt29rSdPlIX7GV56oCggWHqcchg0nGR6aJnCx3bRO6qHfUs1y
	+jSzCpgTNApjBru8nv9Zml0Ecsw279U6g1CQmY34sCiOpmmn2Iy2QjQ/2m0kCKUY1drdcy2hw4OFp
	ztuJjN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Xt-00000006Hhn-1mog;
	Fri, 09 Oct 2026 12:17:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Xs-00000006HhU-3M6f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EEFA40E3C
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 12:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741B41F00898
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791548272;
	bh=ZeBFVu7Fsst4uAOVgc6REmRpgUidwNjQW2vFog6mAN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m0UfczYguNWEZKhK+J0FgXFZ8pA7496N2v45m1k+j6SlSFIYLSpGgTk19D0klfiHr
	 q7iK2U3LmuGgCS8Hw0F9bDjJG1BRXf8EfnyV6gwMMmRt062TzHyi7dtlvKFGuf6a3O
	 6wYP9ev/td38hqfz+ruqr8VYmMUs+XtwpXbOrLse+yvEF5Vrti+s7leAJb+r50XI6e
	 njr1o2Do4yv3a6MQH1xjxhpCWPorTQm7jrzqD6czYgUzdiR+hKq8oTYGHO0b2DsHja
	 nOaOR4MPwUkBE4tB5XWhdWhqUcO/7PhIKmV7AzN7X6cI001QrV92L8S/0WmjuSvb77
	 kG4p/X8/M91oA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba7ed32ccdso288327e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 05:17:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwT8ZI3UATxqCIg1YxI7MyJJG3FxZEnoxx1SnZ4iUjKWrt/mqynR6+2Q2RIu9826bno02VkIo/UMkkj6ANdwC//@lists.infradead.org
X-Gm-Message-State: AFq9FYI5EJTpsW7CDPbtkgaL1wxXcDeq7Fk9dvaXE9fjtGaAYgKHgmta
	g0+Br6b0c1pZP4vOfkjM6x1qWVc1wyRCOI5/JLGtm2DYtqpgUqGEbU/69TAXQRwLMkHNhEQE4jh
	WKiYe11LUTOvawzhHKXmOVheK9SsmWkI=
X-Received: by 2002:a05:6512:39c3:b0:5bc:44d5:89ce with SMTP id
 2adb3069b0e04-5bcde8dfb58mr708846e87.62.1791548271232; Fri, 09 Oct 2026
 05:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com> <CAPx+jO-wb6NLYjnn_k7xu=Wqq61+vop9o7UM=5Y47U-WiGFXBg@mail.gmail.com>
In-Reply-To: <CAPx+jO-wb6NLYjnn_k7xu=Wqq61+vop9o7UM=5Y47U-WiGFXBg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Oct 2026 14:17:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQET3CRONQbpqdt+Y9ts3wPHdNdYz8PvbaohSjm0JF6w@mail.gmail.com>
X-Gm-Features: AclHuK_UVxhW4eapDTA7jDAxjwJcfqkweBn8QG3EWf3yBuy98smFVfeDPpDUrY0
Message-ID: <CAD++jLkQET3CRONQbpqdt+Y9ts3wPHdNdYz8PvbaohSjm0JF6w@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] pmdomain: st: ux500: Implement ux500 power domains
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Frank Li <Frank.Li@nxp.com>, 
	Frank Li <Frank.li@oss.nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Frank Li <Frank.Li@kernel.org>, 
	Lee Jones <lee@kernel.org>
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

On Fri, Oct 9, 2026 at 12:04=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:

> > What do you think about applying these three patches to the
> > PM domain tree as a starter for v7.4 if it's not too late?
>
> Assuming we get an rc7 on Monday, it's still okay for me.
>
> Although, please re-submit these three separately in a v4 to address
> the comment on patch1 from Krzysztof, then I can apply them.

Ooopps what was I thinking... probably I thought I had already sent it.
https://lore.kernel.org/linux-pm/20261009-ux500-power-domains-v7-3-rc1-redu=
x-v1-1-5eb1b90bc35e@kernel.org/

Yours,
Linus Walleij

