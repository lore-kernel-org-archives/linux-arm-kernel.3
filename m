Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27BBC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/VsZ6IE0jdOkCcZ5aD8yrns3Cyc4PjTDiK26k40UxU=; b=dTWUFHTqj/gK45kdQPtXoytlFX
	kZTR8fEl5r80/8l1s7NRSlcaWG+HP/s3hZQO4OajoHlSe9PgljkZRkwcv1BFz91O2uyTxc1KBp3xl
	gQvBJRlRZjItkFOhw9nk64YXCvgBWDNJ05KaZLufWDnmxIUl+LNBNGPiIZCA4dk/Jx++kzFKw0jLN
	o8sUg0v9ePyRzMuLHLjOKHBxChxOsUiC3Whs2Mp09fym6hVQafhkyYCoXLJlnSIcUhVdlPMOoHT1f
	CItGa1PIl3camxRUyszuewqe2hjIXurO3F9UV295pXMCQahNrfaA4oEzqzWtCZtte74+CV+36MFIL
	QcizsrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJexm-00000009Vjs-1x0n;
	Mon, 26 May 2025 21:02:26 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJevc-00000009Vc6-1tyw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 21:00:14 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-52eec011ff2so818705e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748293211; x=1748898011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/VsZ6IE0jdOkCcZ5aD8yrns3Cyc4PjTDiK26k40UxU=;
        b=aQo5lMhbHkBsu/L6bYdyKn2Ersp1hyAKLpye65jR101NPsxpruQwZncBK3s6VKrMge
         yvYJ8PZADiZZ5wtXgPp4IWDBbWITX/ht1N1P2iUN1dPdztx4+NZbT7b6HIWxVxGbyX4k
         t4KUtq8qtQXd42Y3/9JWah1PZnFH+ZdWiwmpxfk/4p/FgMfKey/0re/ooI65+roiulPA
         RjNkfwVFfnNjSE1dr6E1/jsxk7JVutrVJG/ALl88EOXFZ6XcM2onlvO1VUxZ1kRCDtBK
         67xgktgPz+DqODogCxynve93JlzvVYVVbYLIsNoDc1axh3VJhb9LRlg86Vzipe3YGopG
         9QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748293211; x=1748898011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/VsZ6IE0jdOkCcZ5aD8yrns3Cyc4PjTDiK26k40UxU=;
        b=IjwYvbCQnr+N8ThrASwqO5ALTYguv00Z730ob2r7sdVtjv3tK5YOh7IlZhY5MwQmvz
         CNOUif/GHwidrpS54ty6/YdvtXIYVBl/OAHtgPYeJd0w/Y3r4LMgnoruqwb/BNN224Fo
         qE3d0yLld1YyiR+2fcVu0FiGX444Ywu3+oGiT8U1BtXvctBJP9WuJh5/++DxsOm+E68k
         rrYaYyxS8yg0WDc6/VyFt+xTd7v3DCNQERNNMS1Bi6NCl6L6jDa6lPyivRqVEhPLxEpc
         sbe0P8NPxy+A2tZDkXF3XDzwUjt4qxVwOopOpeS714gyCJdhVfIKfoccRZDeJVO1U13s
         mO5A==
X-Forwarded-Encrypted: i=1; AJvYcCW80JZ6Op57I4+at3OHWYubk+RZ99Xg5tb9s3BAjB6IlYK7BT3S8j+gYNA/7XP+JJ6oKL7eO3LvpVoyRupY4HW9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Ww2SFMonxjdk703+cRck1Q4a8pFAhY6ipnhuZ/r5esyn3PA6
	siHjQ8P08m5z/nyn/hYwgGzAN0rgJlk5t8nOcdnm1I17PTy72SSkRVI8a7/leA6iUxyyfWLxORO
	o0V2TVwmLHNcd4L8fghT/Ax5lK7Ir4Iv/sC9+GZWZig==
X-Gm-Gg: ASbGncvemhySOV0hh9LNbBpFKgFoG1gbepJwIT4eflLduFcwoBpfgz1qvI4GyojJGaW
	E948l+Vky9Dh4daydT5a+1KdcMmWhJePZFeHSGMwTDE4LO9nHvwYKZhqC5LM/TxTKnJCPwaMtsa
	1BRyhZHR/5ZRUvCNdfeM4b1FLWLKgYTmyc0Q==
X-Google-Smtp-Source: AGHT+IH1F819UdbqKdjXVnrU+7ibb4kb7PWACyBEmwPcni1wlQBFRsB0+/IWFIf8hbs072AoO3ylAlqbgpDxsk8Lh1Y=
X-Received: by 2002:a05:6122:82a5:b0:50a:c70b:9453 with SMTP id
 71dfb90a1353d-52f2c5bf4admr7622487e0c.10.1748293211020; Mon, 26 May 2025
 14:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com> <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
 <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch> <CADvTj4qvu+FCP1AzMx6xFsFXVuo=6s0UBCLSt7_ok3War09BNA@mail.gmail.com>
 <a2538232-be98-42ed-ae82-45e2fcff3368@lunn.ch>
In-Reply-To: <a2538232-be98-42ed-ae82-45e2fcff3368@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 14:59:59 -0600
X-Gm-Features: AX0GCFtdyKxOISq6OJd3jmhemPTpifVHzFplXIgoyjcfXkmvrrAzTnbwIsfNJc4
Message-ID: <CADvTj4pCo=d8ehkz6JoPNYEGtUWsgmGCqT7vFEyHTtD7yF5ZAA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Feiyang Chen <chenfeiyang@loongson.cn>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_140012_497941_724D8699 
X-CRM114-Status: GOOD (  13.82  )
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

On Mon, May 26, 2025 at 1:58=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I'm currently doing most of the PHY initialization in u-boot to simplif=
y testing
> > of the efuse based PHY selection logic in the kernel. I'm sending this
> > separately as a number of subsequent drivers for kernel side PHY
> > initialization will be dependent upon specific PHY's being discovered a=
t
> > runtime via the ac300 efuse bit.
>
> Do the different PHYs have different ID values in register 2 and 3?

Well...for the primary phy address in the device tree, no:
AC300(does not appear to support address 1 unlike AC200):
PHY at address 0:
0 - 0x3100
1 - 0x79ed
2 - 0x44
3 - 0x1400

AC300 address used for PHY initialization sequence on address 16(0x10),
appears to be used as replacement for i2c init sequence on AC200:
PHY at address 10:
0 - 0x1f80
1 - 0x1084
2 - 0xc000
3 - 0x0

AC200:
PHY at address 0:
0 - 0x3000
1 - 0x79ed
2 - 0x44
3 - 0x1400

AC200:
PHY at address 1:
0 - 0x3000
1 - 0x79ed
2 - 0x44
3 - 0x1400

AC200 appears to support either address 0 or address 1.

>
>         Andrew
>

