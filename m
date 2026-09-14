Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D966CC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E60LrvOv4D6snvC45CyzXp/jFjIhoVrxockG8xseI20=; b=i3y8VwA8qI92qjG0V84uxRLmJp
	Z01tRE2ODt0oXxkbDazrG6xFBGXIhkD7XNrojhsH+8esksVVuMFfCcc/rdFjiQOhF4ytu4s/6W33k
	c6hfb830KnCP1ug4FULPWO7pMRGLC3YwZBOEo+v4TjjOuGDNMh4IbVFKeO+hmX8kl8x5Z3PGQlOSB
	ut8wJS+P5W25Mrce0PlusdSLEZIzN180f23zm1Q2uRgIVGSdu+sFgd79iBWziC2nb+2cgWxI+DYsT
	kZzCD98PmWUROIsBsvPmLsDqJQSO8+nX4K7eg/Xt/X01xATlbCgiSGWuCQWjHtv4t3jCTJEKAkwWs
	CIR9OmYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62lI-00000002sjt-007w;
	Mon, 14 Sep 2026 09:14:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62lH-00000002sj8-0KVP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:14:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A58F841E7F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A721F000FF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377242;
	bh=E60LrvOv4D6snvC45CyzXp/jFjIhoVrxockG8xseI20=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fm2MzbI8O1p1YDT3P0pO9ERFq9dng0XQGb1URkQIreCUz+GolSrzbqubj1wPAhYYQ
	 KCmLdva0sbLLsw2QTIc9UYRbzCBsZjFbb7ieHJO6YoEiznFrsBOR/lV7laaC/h7wNQ
	 iFRk9jAqSWA9ilZVtHJkG5Z94tgYd0KZhlqY8wxmjlemK4cw85ZeasApQ6AQRVO8+x
	 gI1lA70L0Jz+bfIGcaiWZREdzxcYnRog4cbFQmNV2qCO1vNQ8jl7biu7IRI1uC6ew7
	 7P+jWWvenF5dU5lghhzlbuVjEIWish3MJPbQG491CbVODTPinhVrAk0+6OgFHMblAn
	 BTp0ajrc95hAw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso1771744e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxw1gAC1/c0nC9n2QviTYFRBBRS+4Tv1IEbGbU5RAACJaa+NXFr1hGbfL2eXPYybA+TrQy9B+HaFRENjEaVvimc@lists.infradead.org
X-Gm-Message-State: AFuF++kbSDFGTiNKsOJBIzanzNM7DMHKq/FJjnuTtEMvngC9fvmyr9nc
	uTl+zne7KKUUyWd3oDvqOybLwSUGJr+cQ556ifq8Nm5w/uuBcmbkqo0m7UvuP59eIATdTnlFiEO
	0kv3jw4XcCgp1SeQM1v8E7P1LTdBx8SU=
X-Received: by 2002:a05:6512:3d0d:b0:5b6:1a7c:2c with SMTP id
 2adb3069b0e04-5b8ae6a0873mr414530e87.47.1789377241283; Mon, 14 Sep 2026
 02:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260831-rtc_s35390a_int1-v8-0-dac1dc86ce1f@posteo.de> <20260831-rtc_s35390a_int1-v8-5-dac1dc86ce1f@posteo.de>
In-Reply-To: <20260831-rtc_s35390a_int1-v8-5-dac1dc86ce1f@posteo.de>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:13:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBYVGL+oXXXMq+5F2WF31xiGD5FoxDGuNFgd5fawEQOA@mail.gmail.com>
X-Gm-Features: AcwNN1X_Dc3msIppmUpYmdtPkP3lWlbat9n-DuEEQJTnY1Fsv98a0DOXarp0_cs
Message-ID: <CAD++jLkBYVGL+oXXXMq+5F2WF31xiGD5FoxDGuNFgd5fawEQOA@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] rtc: s35390a: Add pinctrl
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Langer <michael.brainbug.langer@googlemail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Aug 31, 2026 at 7:42=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:

> Allow configuration of pin functions, including:
> - keeping the previous configured function
> - disabling output
> - waking up the system
> - minute periodical interrupt (1: 50% duty, 2: 7.81 ms)
>
> If no function has been configured, fallback to previous behaviour.
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

This looks fine to me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

