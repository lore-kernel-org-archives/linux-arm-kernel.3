Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BF0CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TvXG+VkHFlrKrY1aigBwFXeBnhJbLQwBFHnHT3TI1U=; b=k/jJSUUYVe0YYvWU7u1WpPsEhR
	9pfm1wEFIbBBKWfdK2TAo4YBRjk66y9c/QiNnYm8i8GIBSLdB12fQG8/TaAW5O1l1gXtjnEjxAzcw
	iIaoN/3Lct4g7FpQDKm8YZxeFajeD2J39c7HUHKjG/7kgUKI0F1NlRKo/lmrLv0qi9E9m5FXviVGv
	+BbXMaCF3OBWrjbyWTfNk9+PKrxMUHTvhmtIMX7gpRxkE5NhZDIdCoAEyTlRjHfOAeiqRjgDZ5sx2
	xDEW6irBSlwO40OPD99YIL8RCtTq59/4XWvbNIhY0k+Yd71yczjX7Hrfqwc1+mVNb+lNL1JXTr/Qj
	UUwAxo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8zY-00000004GAR-1kHR;
	Mon, 15 Sep 2025 13:11:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8zX-00000004GAE-1ZTh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C075360231
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 13:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7DBC4CEF9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757941894;
	bh=6TvXG+VkHFlrKrY1aigBwFXeBnhJbLQwBFHnHT3TI1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HB20rFO7vM7DFelqeDNx5jYRc5ACpsTLVey6S+aR4ISl3L/aV/mBkPOx5ZhciGlDs
	 Bvo+yWlrxMC0W3VJPV0fW5kRKePJmCKG4dvRzRS+GM4EHvTIPYsJgYTMAyycYkkrNN
	 4BMr4qqpy6WVk8Af3KObM8JHMN3wbtI/7ztSc4Fyp2t/9N7Ao+iUL0T/ECZ+H0aRKr
	 SihwJNxhpvb6rwDe8XBV+JZVICTZO/oy/nul+hwXtM2NiQZ2/DspqwhA/95JekY3Uz
	 9mQrc+D9SRxMh9I3d04LEBhN+qjuCJ64K3YwH2kpcYH1Lo1A2by2VXoFqpte0Ilj8P
	 4G+O5l7h+aMkQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso7192935a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 06:11:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgp4jjEYQ8xgFV/wvm3NVmmClB9Ntx+WYTz2bjU3/+/zmaVkix9NO1FazvXRhCkTGVMfceS+unUXt90fXk7fri@lists.infradead.org
X-Gm-Message-State: AOJu0YzErznCx6MORKiDV74XzP+9DRxH9dTiPvVQhYT1D0TktiarC/Eu
	gjnURztaiYqDY2KRW3jb12ncSWBEDdZB94GMvO3vw6ily/vRNThlBugri178WQii+8nnpSYAFGb
	uRZvtZAeTEiuIwBaW82Sj/kUAI09ORA==
X-Google-Smtp-Source: AGHT+IHbTvPNLInOtW4HN/h5+fp04ki+WFQjYW3WLecUiIdLce17SmTc98UVjCuJ7zaa8MZv3KzUwrv+Zyf/hjwsiew=
X-Received: by 2002:a05:6402:42d4:b0:627:8d60:ca57 with SMTP id
 4fb4d7f45d1cf-62ed861ab2amr11761043a12.33.1757941892960; Mon, 15 Sep 2025
 06:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250805232502.2827725-1-robh@kernel.org> <87wm63on6e.fsf@BLaptop.bootlin.com>
In-Reply-To: <87wm63on6e.fsf@BLaptop.bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Sep 2025 08:11:20 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+A204rqNzqB=0tw-HHQPBdSomECoRfrwGEGOGioBYCgg@mail.gmail.com>
X-Gm-Features: AS18NWC8W2tfzXZWBP7WhUF55A16dIRiLZt7d8ihEkwdhuj29x4PSq0cBjI1X90
Message-ID: <CAL_Jsq+A204rqNzqB=0tw-HHQPBdSomECoRfrwGEGOGioBYCgg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: marvell: Convert marvell,armada-370-xp
 boards to DT schema
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
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

On Fri, Sep 12, 2025 at 7:44=E2=80=AFAM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> "Rob Herring (Arm)" <robh@kernel.org> writes:
>
> > Convert Marvell Armada 370/XP based boards to DT schema format.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
>
> Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

This (and the other conversions) should be applied to the Marvell tree.

Rob

