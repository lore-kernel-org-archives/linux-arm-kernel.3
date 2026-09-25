Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22781C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJxMO3M40di0AO23KdpByzlm/CRDJOu5GRiy0q3Q0zc=; b=D2DZQOlgt4RGCYbi3UoICQReVw
	aVpnhzhtJblDABHA4Efmt8SiqtwdZujif8bxRnica4oI7DH0WhxJk/uQ6opXlrIU8qtZeUh0Q+zvS
	exuCAArjjcaGY265XjQ8QHvyAl7xf5DzzgwdHRuDsFHbFzpIv18LRx9GYnPYCEcsCAJi9b5BMgl6V
	ra/w+y1KWxGMAhTGidhomkJBJdecfUg1o/fazX1hlmuE+ZzWfaP6L99phZ/IzUVAQy0zmOBSyyhUN
	3x5TYKpuMfiLWr2S5xwViRO7vsHE75vrrjoNJ4h5Ph7gHnpsZxHe4rBigIrnOTViHhSUDHpWKQHwo
	MmFjrgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4eT-0000000DH0r-1G1J;
	Fri, 25 Sep 2026 12:03:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4eS-0000000DH0l-1ta9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 12:03:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3620141613
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 12:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB931F000FF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 12:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790337820;
	bh=lJxMO3M40di0AO23KdpByzlm/CRDJOu5GRiy0q3Q0zc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XoJDs9c6I6CbS9hMnzvNqyM/ZAlY3tbU6iefHUnmTigvbrhgh+Fdah3UNFwb9aBwO
	 JtSpyNWiGxJhRaOdq76FU6pglX7yUtjGby+xKfRu5Yi2MgXnl80ne789zcJ6nUJgm7
	 q8QIChnD02GO4SDcFBkz/+UzW0EeEl5K504BlJm9qSJ4i99LsRmWH2gh/E2mRss0Ub
	 HUYR1Hs0Pk3JiDvNbjZJCYBcqNJaN/nmQEBa0Fl7UFhHMQfbN4k1HEAso3FY0UaQNk
	 TAKvoctKR8JgvDdh6foaimZGRvy35Z7fDxp5/1v1aW0De3Lf1ltRyje3agmL8KLe1B
	 WhBkNX5BySFZg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so910996e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 05:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzqY6g5ppc+NMg5gTcot+BJ+9LneQG78lcWn5sg+S4HRoVpazUGpIp+6MRqCggYAPKvhREwjvTJkMgT240Tpt0j@lists.infradead.org
X-Gm-Message-State: AFuF++maH8f8m8/8O+ZOcv3lx7EoqS1G4LlJ0lB2CpxMBFP8DFCTosxi
	TxhAtr8GR7kFHNevFLO5/iKAZtjjlfLPBS4i0DbUcaYS6KgQF1unaRWhSE/DZFGH6CU8amoun4i
	uaT2l4oLZN+Y+p1kEi+Wy22mudgpB+u8=
X-Received: by 2002:a05:6512:668e:20b0:5b6:1a7c:3b with SMTP id
 2adb3069b0e04-5b8e6decc04mr445082e87.62.1790337818793; Fri, 25 Sep 2026
 05:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
 <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
 <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com> <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
In-Reply-To: <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 14:03:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=pAN9pb3z7JtqMdXePe8f8=9CQKsE=Rm1_Vgv7ja9nLQ@mail.gmail.com>
X-Gm-Features: AclHuK_cojpfqn9CdY3sbAIoHIC6GK9YpMDVlN2Zl6sCiirs4lAdRcsP0Dp2udU
Message-ID: <CAD++jL=pAN9pb3z7JtqMdXePe8f8=9CQKsE=Rm1_Vgv7ja9nLQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Dan,

On Fri, Sep 25, 2026 at 11:48=E2=80=AFAM Dan Scally <dan.scally@ideasonboar=
d.com> wrote:

> > I'll address the comments and send a v2.
>
> Huh; not sure why I never followed up on this. I haven't touched the boar=
d in some time, so it must
> have slipped my mind. I can pick it back up and address the comments, inc=
luding adding the other
> interrupts.

Don't worry, I got you covered here. I had to fix it anyway.

Yours,
Linus Walleij

