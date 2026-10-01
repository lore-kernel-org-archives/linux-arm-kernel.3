Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFD8CA5FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEPgwh71d1iVR9H9iEIGJIPip2WRDUVsKKhB6kU6+tc=; b=BgbTcJArXlQHmfW14tfixUqgHQ
	DWi/xzUC1WalfTz5SQ7bHEP+x8B8WR1R3SQOmNXBWlCPtgtn3b37nr9zORdmtNolTd8QT49a0SiE/
	q2Sa99gswoKfh1KZS31fA46A389XUzTznNw4lYSIvxMONd5Cq/0E8ycvJOUETeBjqsv11J1KQMvQ9
	QqypAvbcnq3MFSjHj/tTh75PGJxiaUxZzrCqvFIZUlcH5WxCnZK3/Tna+5chEwpa59DYVtUg/Djv5
	dK/deQRigy7e6mlCG7xEU0M3NKYuxsEVYJ2EbkWwKd4e1IwVsAuM+XVmRzOJYfX+urVUNFL+GMP/2
	Dy8OsF7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFbB-00000008yq7-1GR4;
	Thu, 01 Oct 2026 12:09:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFZ4-00000008uKF-0gRe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:07:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E731941481
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 12:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3E81F0089D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856425;
	bh=TEPgwh71d1iVR9H9iEIGJIPip2WRDUVsKKhB6kU6+tc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LyoVUl4oK0D347ufMsJVmcxwA4UpVGeGcyVdP1JyYxT7ciqkJX/lPgmMlpuvvklNi
	 LMV4jt9XJmI9D+5AolrG3SOUikCd3Jdd/LrQlFcPhju1xMHjY6RHL5cuLLu2UEGJoz
	 2TQiZOaWKSLzacmKbz4ucxqDR99TuHSoXalnB5JaS1rGyZ8LiWLK6PbL7MR/Q7DArZ
	 yL7BTHeBVo0tKMZ2UQ2XxGmxv7m3iPZiDzSJ+oLS88O0xG5cHWwmOquhmqyboWTiB2
	 4poCkS8kLLTX1FfX8V+XrUOx0jUVwNPM4RDcNG0x3JxxnLD7qUJORFHKZDh15f/BDL
	 aEYfWLlEdXpFg==
Received: by mail-oa2-f15.google.com with SMTP id 586e51a60fabf-499c0f06935so2052642fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 05:07:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy5q26M0vrLn7K1MuruI3+U1T9YOO5F8e04ihg8Izm7U3ZJDquV3B2ynFYIh8vy15w4YkLZ4MO0wWtRpU+iPp/F@lists.infradead.org
X-Gm-Message-State: AFuF++mb2hAVPj58aX1bcGia1qgRRXgGGBLyb58eFhTsW866oRXY/i+a
	swFTFiqCq7Or645IebNaxdSSmsGLLoKmvqR4rEatUcs8a+QKDafCXJc6vLCNxv+7WcdKkSjnVWX
	GKZ3Qlstr5bXIVe2PXKH7KlzHpnwqnEs=
X-Received: by 2002:a05:6870:178a:b0:493:ab63:38b2 with SMTP id
 586e51a60fabf-49dddc1f962mr4370408fac.57.1790856425108; Thu, 01 Oct 2026
 05:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com> <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
In-Reply-To: <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 14:06:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
X-Gm-Features: AclHuK87xvSHhqipUtSb8ZJDrXVfGoCDfVEBsjNAbCB2k3nY-ppHcCl3E-2w_rs
Message-ID: <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Wed, Sep 30, 2026 at 5:27=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> Yes, this is a known issue, and I already provided a quite different fix
> for this[1]: the A523 manual actually lists a PortA GPIO interrupt, even
> though this is pretty likely not functional. But specifying this IRQ in
> the DT fixes the problem as well.
> The DT binding does not say how the IRQs are assigned to the GPIO ports,
> so from that point of view my solution is similarly usable as yours -
> though admittedly yours looks a little better and more future proof.
>
> I guess we now need to figure out how we want to handle this in the
> future, and add an explanation to the binding. The A733 has a similar
> problem: PortA does not exist. This time the manual does not explicitly
> specify a GPIO IRQ, but conspicuously leaves a gap before the PortB GPIO
> IRQ, so we can use that as well.
>
> Linus, Chen-Yu, Jernej: what do you think?

Can't we do both patches? Maybe there is something I don't get with this
code...

Yours,
Linus Walleij

