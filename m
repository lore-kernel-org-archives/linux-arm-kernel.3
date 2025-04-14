Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2DFC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RK1FjQCAv98Eay4SPuOitMP3sY6he/myS3klmD5dY54=; b=I8dFOatRhOT9OaeToizbeVYYRb
	wClHmlBsehpS6847XGViPmUzi7B+F+2B96cx2q3VZR8W0/Wtc6D5wupwS7oif9IcDNLvOOc3nYmFQ
	L2HwA75vKuXeyC5cu9nMeTvB2T5SjpdzUImNLuQI/Rv616NL6Xti4kynYsHFWW+b7mIQyAnafQdtW
	b9SaVTVgRqYSIxvDIZRL/Wqywvs2yaYe2h70we4pgTPttjN6fHtlib5TkjflGld9k1UYx/rKL9VC6
	eQWIObaxbY6OWdp3agqs+hcKZuNbBW3xOya1cNM1c1fLF1XG1C87MQcZq+Bx+qMz2mIZueF+PmIVr
	JwTKlUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Fza-00000001G0A-0dar;
	Mon, 14 Apr 2025 09:20:38 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FYN-00000001B2Y-0liq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 08:52:32 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1180800e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744620749; x=1745225549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK1FjQCAv98Eay4SPuOitMP3sY6he/myS3klmD5dY54=;
        b=TLBHQMRDEUc+LgLDmOTuRHlSaxMhsCvszjhbMCTcAc4NISAbM6U8uchPSA2OjczLhQ
         w673JWGHsMDcNqipRkAwSeEOVXXDbbIFWzo4OJfUa//ZJzd6W96IgDKmiz2BGgM1my8+
         BKX4jg9zaflPiOZROIZY01ff7wCptKA+1ocK6Dwh3P/BECPUptffGcE72F/UOoD0o/xC
         m5ILPVzcIXM775OFidJSKgY720OV4FQ5cxDo2KzZ9nEt1eD4rwlquZhE7A68aGdyLwLV
         2IirFmuTUirfc1J7QEmwBUwCADJule0y6WePTqcAzJz1jHd2qESnbWNonUT/gL7+3PNd
         VRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620749; x=1745225549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK1FjQCAv98Eay4SPuOitMP3sY6he/myS3klmD5dY54=;
        b=DUV9lo5SA/gZo7bTNRwVdYn6KscCDosGtAW7SMwbfWJXl0jtqJQ0q0D9NxAu1X4lP5
         vKPEMwWjILTTc/jsCblWnpXUwCGbA4ReEGyoqpXOKLw1zGuZl2rMQxZwiMnHclyuNK9d
         jfgX6OJt7AIDY5jhktoRQswBczIdM8by9mxGtxWLd71uh8lLhCUkb3E/7sWCYVazmN5v
         Oz2wmzMG/pAdFBMY4u0mASUxN8v8o7+ECZW2QwcwEdqdPMOq7XnqaQWhK1qTe3vD1G/0
         ChP6KwPq//k1Vd9jlYn8n7+qVaqqZ58xCC0NgymlVi9ndHVdOjKnGoa9hnOSp7+PJ7yz
         J+3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWB1qkhTSM0hnQpnTm3OhWF5KUAZ7sFjAxtA+azeR6KA6kIYIFvWkH9663dUo8MUIBAvzr946l8zWmY28itNyOs@lists.infradead.org
X-Gm-Message-State: AOJu0Yyupzlaz3Bqalbr/M0287hcfmvySLklubizEB/70gHDah+1Q897
	UTmW2TdwrJfAbRnbcoyuHwRO8v36SxjwXVYKk7SbsFt46Fyz7QJm3xvzXuHCbbE+S1NvrNoD4GQ
	d3FBv+wgvbPH7Wv2vNNklssdozMQ=
X-Gm-Gg: ASbGncsc43SGGcI6rw1UQk9MCyLETS0Fr3neNrySxZHimT72nk6FBcO3SwXGkvvxgde
	CiIndtHkPpcdezCQjCH9VhiYVgThJ6VXA8oUWuRWIsBbbyD0T6pv/5Xixy/xpwRWCu+vRxiq1oJ
	x2nOd7serwWNzT8DSkmcN3CQ==
X-Google-Smtp-Source: AGHT+IHDQYAJXdFj/iNG0npq557KpIZpBxXkLL2l+9hPwfBOs75fehWJLdCe6um+3vhYJFwWD4BbKD7nZni0VXc/gQE=
X-Received: by 2002:a05:6122:319d:b0:527:67da:74ee with SMTP id
 71dfb90a1353d-527c34d1fd1mr7094050e0c.5.1744620749318; Mon, 14 Apr 2025
 01:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407104447.072449cd@kernel.org>
In-Reply-To: <20250407104447.072449cd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 09:52:03 +0100
X-Gm-Features: ATxdqUEHxcklYN6PVPbrfMER-iWYYX-JiIMzDYloXSJi2mPCrezqGIzibq2L6CY
Message-ID: <CA+V-a8uqkG+u_ZXztPe7R0BNV6BA46KgGRHRW-G3axBt566pEQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/3] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_015231_221965_B509AD96 
X-CRM114-Status: GOOD (  14.58  )
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

Hi Jakub,

On Mon, Apr 7, 2025 at 6:44=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon,  7 Apr 2025 13:03:14 +0100 Prabhakar wrote:
> > This patch series adds support for the GBETH (Gigabit Ethernet) glue la=
yer
> > driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> > the Synopsys DesignWare MAC (version 5.20). The changes include updatin=
g
> > the device tree bindings, documenting the GBETH bindings, and adding th=
e
> > DWMAC glue layer for the Renesas GBETH.
>
> This was posted prior to the "net-next is OPEN" announcement:
> https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/
>
> In the interest of fairness towards those who correctly wait
> for the tree to be open I will ask you to repost this again,
> in a couple of days.
>
Are you ok for me to now respin this series?

Cheers,
Prabhakar

