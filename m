Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E38AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=493enOlPSgfL8Xi3QDIl1rddbYGRJGRVQ1cUt/F2sHc=; b=k3wo80LHsxLIL0eQfBCQHP4Mcu
	8nE1uAHsrXX3XJv6GOVjMAdQoRf7CkUwHFj+AxpxeTfqugWeY+p/nFet3WBg511jo42wNg9VAckas
	X64QQOdhH58//ExGjC/Nhr6VRiSpJhw2uQOByTxPpkmrLVNX1i5rMAhTQO2KZ6Vt8jprJVfIB2IAW
	95psFCBKezt4i9OyijC876wVts4m1uzimh83y4k+scvLuBa1MZtKLYdmJMDRToJ/LunGh6kED2BMm
	Nfeuam/N1gzrHyPF8JblMfAv6o0ZmaJOP1FNxEMplMguv8xJpHwXWDNx3R17FrDzcQb2TqEeDlnxg
	fjFx3bTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weX1V-0000000GtHk-3sio;
	Tue, 30 Jun 2026 11:53:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weX1U-0000000GtHR-2uaW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:53:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A3C643E33
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6071F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782820384;
	bh=493enOlPSgfL8Xi3QDIl1rddbYGRJGRVQ1cUt/F2sHc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lrlJJAyQZ3DwijrvkQSaLW/aK3tq35nYYm/c5Fotxi0Uq/sxm/MTtkXjQNgg0Fgxp
	 KeYk1xrd8xyH45/0n3famjiuhyGtB6ePQFrOG+P4ANJc9Ou8bDFFyq+PNnitfddnlu
	 nn8vBTyx8KO13fiCz1xG/2id40eL/RmVJCjK3vGEmGii8y2HbrdEeYthuisNvkEIXh
	 CCCVjANnb6ziEZe65ted0H7vtlp+DAVwnUfFYjeCgc3a3U6n7+/78RExC2z3Wm3HG3
	 7kx01Gi09g0a+U5y8Tp+vSCr7ClStQFBUwDMXbdFuGNBF84FtfwlnzLaY2irwtKLJ8
	 R7rE517rnSYuw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b26e2ad5eso2436871fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 04:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoW4k+WV34M93XaiyiPiwDZcJSoILBRbOSRfQYlKi9nZT9wcZ83JFN0B0E5EKzlh+xOGSTWtvz5TRUeJR3x/FLk@lists.infradead.org
X-Gm-Message-State: AOJu0YydU48QnmCSz/odNurXec5odCMAOnXyPZfOtZnTnVBznnB9YN/0
	vOYiw/W4XxBTynZunbxFSHZGd7/iQ71m8gh3SFVcqbErRux26XiohmRaR9898CuNYqNyqNdOQ9b
	OREMmy+03CrVC5I1CcbS6sgPiI6MJDgo=
X-Received: by 2002:a05:6512:15a3:b0:5ae:afec:8afb with SMTP id
 2adb3069b0e04-5aebdbdd0bfmr741396e87.48.1782820382868; Tue, 30 Jun 2026
 04:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
In-Reply-To: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:52:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLm3-5BP+1E_DLTZvEPd1ugMZrXiOjM+Gqnn9Ri+uNWuPw@mail.gmail.com>
X-Gm-Features: AVVi8Ccukh9jeKMJzDntWFmdET_gKKyPu4vZydSTvGPFTsmFqpaNo79r5YLA3x4
Message-ID: <CAD++jLm3-5BP+1E_DLTZvEPd1ugMZrXiOjM+Gqnn9Ri+uNWuPw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: aspeed: Make AST2700 SoC1 JTAG master TRST optional
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Jun 16, 2026 at 4:30=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> The JTAGM1 pin group of the AST2700 SoC1 includes ball D12, which
> carries the TRST signal. TRST is an optional signal for a JTAG master:
> designs that do not wire it may need the D12 ball for other functions,
> but with TRST embedded in the group they cannot use the JTAG master at
> all.
>
> Split D12 into a new JTAGM1TRST group under the existing JTAGM1
> function, so TRST is only muxed when a board explicitly requests it.
> Patch 1 adds the new group to the device tree binding and patch 2
> splits the group in the driver.
>
> Note that this changes the meaning of the existing JTAGM1 group: boards
> that do use TRST now need to select both the JTAGM1 and JTAGM1TRST
> groups.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patches applied!

Yours,
Linus Walleij

