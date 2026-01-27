Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9A7CA6CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeqVQloYBUgHFacGrCxsF/LQzrrfHdlNQ+KOGNUpnDY=; b=j5kxPL1ua0cZX3cE0saX98fZRZ
	5Lvb4kjhurzw76nJcqJdmXjZ0nPCPCLb5d2DTUdx4Aiwbng7yQYZzmas31sOsgbtnue4/MVwWwj+X
	qHpvFVjYyOLYw1a+xM977UR2aUCNm8L13YoDiq+8PZWLvFu/tF6C26/nuH0A7NRPCoWSqHMZXdCQk
	vepxSr+0kqra9GZ9+SBE8fA9Fn8O0MY1oQJagds2AepkdNyim7FXEg2fkRswG2Xdgrl+y5TU4TcS2
	cRYVjE65klX7hvHK0LCypVazX5hIVt+tORtb1wGLZvOoLOZIIP9zuw08rRgQKL7NxS0d2wbFHH1gI
	MpU8epzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeyi-0000000DtjO-1EWA;
	Tue, 27 Jan 2026 09:03:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeyg-0000000Dtj4-3fKa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00401600AA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF47C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769504593;
	bh=MeqVQloYBUgHFacGrCxsF/LQzrrfHdlNQ+KOGNUpnDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pPV4DL7m/gJvEHlaiCbGnx+4lsWCYgMcLWzvj+ZC6g2LZ8/ujtsYjQZwM8+zNeHr+
	 lbl0L29BFzybBu0YzW/P8gDh1fhHNrahKL0lP0C8pUEl8A/ud0jLY8XTPG34BV/YCX
	 fHaC1vSf7nRAEdZB+Rg6Fzuu+NGqNjpv/e7le0Hk7ElHPjkArc7MnW04pKzkxEYSds
	 8XBwpoyMTZog+4Y9LHtO9ATOcA1rVBOh4xADhxtlP+mpKgR23jsWPnxO8ywxGK5TTX
	 aGQovehOrhQZm6Rv9M6L7IqWMWq02SoJ7UG1EAhciLIgsWYG9lnDxayANpZ1P2nzcT
	 WRhDrQFDoDtcw==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-648ff033fb2so4996348d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:03:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2YZNcueLl/6fHV0uw3uY9ZuJf2ABE5k1pIkjMeDwRt3fC5c8byql5qViisa7MpefIP+SQrQPUrMZEdg/Tng8j@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/S4A913TVAH8ss7wIWj3W/LD70Uh3Kn6KElFWr9eFiaCvZ/AI
	RmWAbFK/MKgtR4FRu+zUKckLcRJn3036XYY0pxx3frnIAMUCaQ0YkPmLZb0xvxy0fpP7S+puu4J
	aw9HrvYmAm77I8aOWOmkVM+C0sWBd7X0=
X-Received: by 2002:a05:690e:b4d:b0:649:6581:a68f with SMTP id
 956f58d0204a3-6498fc15729mr549082d50.19.1769504592911; Tue, 27 Jan 2026
 01:03:12 -0800 (PST)
MIME-Version: 1.0
References: <OS7PR01MB13834D5838A90C138C62CD817BC8AA@OS7PR01MB13834.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB13834D5838A90C138C62CD817BC8AA@OS7PR01MB13834.jpnprd01.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:03:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLmx_kdVF9HuOt35EEtFVBYnaRrDYBkTfU4AyaaKeBPdVA@mail.gmail.com>
X-Gm-Features: AZwV_QhrL_MsPD_jNlzFPukjH1u2v412Vs0zwRaVna-VU9spr3ixByrU9UpuLWU
Message-ID: <CAD++jLmx_kdVF9HuOt35EEtFVBYnaRrDYBkTfU4AyaaKeBPdVA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: enable ies_present flag for MT798x
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Shih <sam.shih@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

On Sat, Jan 17, 2026 at 4:05=E2=80=AFAM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> The MT798x series SoCs have IES regiter definitions. I think we
> must enable the ies_present flag to correctly configure the pin
> input mode.
>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>

No one said anything so patch applied!

Yours,
Linus Walleij

