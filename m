Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492E7CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Sl3VeOxmIWc0/FHhtBrqHO4LTDod/shA0uGQ9sZEHg=; b=Z/NN9n5ue+00ZMkvj2U9mYIk3u
	4mDehlehj3lGRTEV9YQh1cLWfIWCEPVbRH1AVwE8/rshXiXpHDAFdFea9TEyeTWssqn2VSgYohMBb
	WfdcSpyuC1Cb0Mh4u2ErrHFCcvaXfD1O3meOSjnenRjucYZL0hCibxf+aWaS+hfRCW8wnT97KB00r
	9gMLA5kud/qv0WzqFfp7n/36Oa6Pt5wUUweh9pXfcwr6SVtkiUNI7juRL/omprDVHNTpbyYQhq2BE
	7b+x8YYQyXc3SNUZOgYj4SyjrEugVVRFmQu69Tc5RvlOB9i20YC2gL4xhDEjc3dFrr7g0i2C7J4Ft
	iSPLh4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr4t-00000005dYV-1G8Q;
	Wed, 30 Sep 2026 09:58:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr4s-00000005dYE-1Pqh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:58:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B741643915
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 09:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993761F0089C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762297;
	bh=0Sl3VeOxmIWc0/FHhtBrqHO4LTDod/shA0uGQ9sZEHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TUbFv6BYy0BYMPu/2dRG2IrRhyfl3Nmw8iP7m1nV10kOAaPSktEYYPGygLJw5W1XP
	 OgGNPbzjXf9WccmE7X/e65tRYtaozqybLJQqi92F2G7aULuMwSaggsqoF6VzknLN3v
	 j/119SKQJkNVyoYXyVi+ZU8t+oSCh0sgipwkVqLv7gmECa/zwIBUzBnRuwSmZUlhSS
	 2hOWz51MljSyTsLRkEULmI7TSwJgpOYDyzQVYzd/6AYyqBSjLDzMP8sLNgvwwtPOq/
	 uhKNcavvziezdqSJlcJVlJzw+wUyZfpQ1fDKNtQd3pgr2+ysvKE1r8rErIkAOsM4bp
	 SZ+wjeZHW+fcA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d90ac37so526943e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:58:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx7wpF26XgDTmNiXe6H0MnpMBue8gcrFucE8uMDK549QEYGr0GYKrceb9k7N+DLKULFpGzn2HXJiOpeng8Mkl64@lists.infradead.org
X-Gm-Message-State: AFq9FYIAaGGspzMB6eEDouOOdnrcgruc5oeHsVWJP0jEwLMdN/Ssv7Wr
	wGVYyoiZlcrZO/vd0MT59dcoBC7EWGpGEwKh2Ni5BUPZ9R5Ah51ZJYHwa105Q6NaOKZNZVX/4Yp
	Tzf2YbafcHSXucxVUaFUTycWbcUZgswM=
X-Received: by 2002:a05:6512:124c:b0:5b8:f4d4:8004 with SMTP id
 2adb3069b0e04-5ba403e9adcmr391243e87.15.1790762296323; Wed, 30 Sep 2026
 02:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com> <20260930-b4-cs75xx-v1-1-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-1-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 11:58:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLnAY5xh-jrCboLBNh95sMD4jo3+eD3r4nmGgOt07uSJwQ@mail.gmail.com>
X-Gm-Features: AclHuK-sK780whOzNFOmVs_mSNYseiLByWBvfxCT8N9Rk8B9pxQ3jl9L_xIBQyE
Message-ID: <CAD++jLnAY5xh-jrCboLBNh95sMD4jo3+eD3r4nmGgOt07uSJwQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/10] dt-bindings: vendor-prefixes: Add Securifi
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
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

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Securifi Ltd. makes the Almond series of touchscreen Wi-Fi routers.
> Add a vendor prefix for it.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

