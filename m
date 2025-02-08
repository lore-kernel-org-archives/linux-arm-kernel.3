Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEC2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHlCTa++JQNY5yLxRtdf8QoMcBzRNGTE2Vwy5/XMOCY=; b=YEpXR/3WVyk/Im+9nf0SG1vSmw
	X3Ez7e3pMxjP2HwjMOEXpcvSbV5bomfwrc/7NralQRnKyb+wSvfGbiJjBNRGmcw6yQKinE2YRmI7b
	vi9GB7zGnuyABKQWS4U8NqxBYxm2YxXyYg+zozSUT84Z27e8iX5DytMWTVfzFFC7ySnr2wMoIRfPN
	rztFWjhmWYZzyPuHkbJ6eOfrh5rhWnO6U+1VAabphRq1lKA2BxX8XsEftqdGBOaGB09mMAb/IuFYk
	54OylMql1xvPIoGi6CvGxUQPPSdSFM9WhG2OK0JGMVoMTOLAxtdkwlVO0aOlQ5pjO04RTj4S7SsY2
	tpuN7vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tghsK-0000000Ciom-32Fc;
	Sat, 08 Feb 2025 10:15:48 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tghqw-0000000Cido-2x2y;
	Sat, 08 Feb 2025 10:14:24 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so2212911276.2;
        Sat, 08 Feb 2025 02:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739009661; x=1739614461; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHlCTa++JQNY5yLxRtdf8QoMcBzRNGTE2Vwy5/XMOCY=;
        b=Pgrf+n1bmsd2uMxhS2rPbU+lsT2JewYYX915q3BCtxcj49QKZ+jm+upO60Yk3HYsR6
         crqkd3Nc3K6cyBrgoaaazv0cg6+yMTqyW7RLneNH7yM9579v/eV+6J5skmWslfnoR609
         uxgWJ8mKZuFbS/YnlTq0IqEtyzXcK6lxJGSLxXqfctzKZYSpHuXaxuGmdfN3Q1M5nHin
         F6DwKqNUzUUiTbh/tQpoSPiH0wsZSlgBmJ1iz52LS5P4rw1/WrftEgcHPQH3lRqrJRfa
         QBIZk7AetFW+ad/opcLEvukqaR+lEcAlNl4MEW2xwmEC8cB0bVfHp3e5ozNuEPdyOLHQ
         1kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739009661; x=1739614461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHlCTa++JQNY5yLxRtdf8QoMcBzRNGTE2Vwy5/XMOCY=;
        b=FJcYnj8YlRzkWYjZzxbh2a3M3XOMkG0Ty4rGWMZjYC1UMIO/l41CYKF+F2CjF7hcpw
         FSXsntnkX45H64YjKZNbtzevltwtDkbafj/RD/VZ6Iv/FTkdZb4VSZCRB8tjvx+h1hhW
         GbDfuBP06EWWez5fateSApZvJS4JwddIKyoopuCKRGlPCakFIFjI6LCTyMvurJQUe80z
         WpGQmk716TzvTSsxI1wCASM9vb7yFo0S+b3dPho32RgVXuVdogZmhAYjvXySs9exuan1
         vnCoTIslVlA0yL1/5jSf5XwXl8s0YhVVWEjpUe5iJMZxGkWX8tgwk574rYgGldGLie3U
         4GmA==
X-Forwarded-Encrypted: i=1; AJvYcCUsmytyAyHZZFmQhPgTksIN6OGvbZZxUrnKzl5QYS4PTBGtsS30sAKbBkMK8rIIuh2WQhwC23CbzfzsBpHH1loc@lists.infradead.org, AJvYcCWB5zIL+NHdxWUiL/Sq6bvTTDgdDAtCyMpN/dIV7RbPgi83SQfHsNg8xo7XP991QyaKn55Mepk6Kh0mnbdlNlU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0042vgRuGdVdrBd5IhZIuoesfkj3CGsCLbvAiFW4DTb2lqAAy
	q8YDz6ji974epe4Wt3MYLhuYmzLu+ykYsQE3D995ZyBcyw9xQRyKnOhkz2bETMdJb1vrvK/4FPz
	cxGcZ/73irgIrfD8WmGGZNTio4o4=
X-Gm-Gg: ASbGnctvk7q0t4nmafFQ/5xilUe+caSznDk74wb0kA0w3Cvvt/qFOM8OiosXpmE/r2f
	LWY9gOh6w0g3tyN/AdA2o52YbLUs0VvM2qeMshstTQuvIjXDkyg9Gd5uwRq22OI1KncyHbzg=
X-Google-Smtp-Source: AGHT+IGJTnv0Jv1zGgHunoHT2gol4/G0RMD4RSz3LklZiU8Fl/L4w4+Hl+f6eU1srrJYqwe1I2fUwS7Kk/Ykj0OnFyM=
X-Received: by 2002:a05:6902:188d:b0:e5b:1858:9f34 with SMTP id
 3f1490d57ef6-e5b4619f369mr5462498276.16.1739009661634; Sat, 08 Feb 2025
 02:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20250208092732.3136629-1-dqfext@gmail.com> <Z6ckCZpOo1_rvmh6@shell.armlinux.org.uk>
 <CALW65jYG3vv9aCY_HDU4Wyij1kqfiOVOsZ3YnvioUf4AgSbnaw@mail.gmail.com> <Z6cp-TCckCNReUPd@shell.armlinux.org.uk>
In-Reply-To: <Z6cp-TCckCNReUPd@shell.armlinux.org.uk>
From: Qingfang Deng <dqfext@gmail.com>
Date: Sat, 8 Feb 2025 18:14:07 +0800
X-Gm-Features: AWEUYZmoA4XiGxbkn50VzS3TXo8SJfjOy3CnNZmFpsB8QTfYUzOVzyDXS0kfqNU
Message-ID: <CALW65jY1kzcJT6sxvko5GMC3P4odon=ZvKn+ZfufAZR9jqb1Hg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: mediatek: add ethtool EEE callbacks
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_021422_742745_60E78C01 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

On Sat, Feb 8, 2025 at 5:55=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> Doesn't it need a bit more code to configure the MAC?

I think you're right. The MT7622 reference manual does not mention the
EEE configuration register so I assumed it would be automatically
enabled.
I just checked the mtk_eth_soc.h and found two unused defs
"MAC_MSR_EEE1G" and "MAC_MSR_EEE100M". I will use those to enable EEE.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

