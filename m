Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD7FCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=; b=BatdI45y8uaFEQF0kYUPooUq39
	1xNV/yyzSi8wjURakF7qjXEXle0VepRyzg7HDUGJ3wZptKg+uTMOZC4kaTp0B5Dw9GnNRdqxtPZuU
	FvA3VgYg7f6MzmZHBaaMcZzsLqyTX/jpUGUwwH/yqxfnlOxDYiO93u87wTX9gBrXOvbbSV5kHaul6
	QDdiMtiV66gcLFaHqojBCvTSYnFwbr35nbEcGTDd+xtKDHkrn5RzNOGNPXKLx8xucCpidFXv6EwVW
	zqaYcPu5GJSc1f6GYpSabhyOPj+p5tZFFH+7klXwjQc4YgnWeqUGoPXzM33QVH3HIxAKZuHKqZolG
	7aUZkliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5hi-00000000v2j-39hY;
	Tue, 06 Oct 2026 13:59:38 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5hg-00000000v22-2Xb1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:59:37 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5bcbeafb07dso530087e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 06:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791295174; cv=none;
        d=google.com; s=arc-20260327;
        b=GEbQiSTEVMae9YtxLWKeUuXailjg5WWhhwu9dP/2LkQhJC0TEbjYkqyi7J1ha8YY6l
         Ep7NXd2C0whHFFNYGO8XWYZzZQYMj2kJmtYwLN/fYJ/Rmzyo4Fl0xmfX2LB4zMcgmF99
         TJmtGE+XAdSHtQ0Phtb1iA1iUwMBBiXRhhesadCmGhDpucgmmfPf6wd9MBSsprJb9MBl
         arhG3VFSA5Zept/zDbWWfMCiggsAE4RjXkxTU0ITN8OxVncD12rtmK1zj15VEYg0VDC2
         kyez+ppCHvvn308QSMRrQuY4FL8dmbCpLDLE9B8Q2jtBsuvA0VxP/aLZb4LaOEj8qjDW
         ZnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        fh=Q+j65Erz5uMQqYa03+VXqR5ywq+66V0TM8XNistGXeY=;
        b=M5OuDcAYnKHdwcQIaRWsee++aOemOaE9GgQzDu8amNdsaTfSiL0cn4yvhUEI84iRlO
         x0/si+6//8BS2cei3OQyJVyQVabUiDLxT8lFuCt3i1KM8zXuSI9/kTgsoJ8yYXz9dGCu
         1RrN4hPXUdO3Kl3LSA/nr0/NxDqbBZNyK2bo5cQAhvkTlQ36owOmCTPDUAwPnM76w7mi
         KnDgO25qs27GJgDL1B0oYWvSTQU70nWdyZURZr/dCMCLv3Xf+RmeKUXprMEvuv8keJWQ
         7uEYIfTz5hv0+rP4p9Pz2/wDWoAt1XPBzT3vvPAmEnOL3jCMjPMxODwhG8e/jUYSAnIo
         J76w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295174; x=1791899974; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        b=CazQSsQprRxIKBLnML2BD6Vllg1JcTGd0dOu3N7/znX2EnYCbXTZXTyJBpzaAhGZkc
         7R3Xv2792CvTl4E8RgbLVqopcL6kDrY/v/Ic4Mf6yb1lo89WigpQup3acQ/Q7TAkfuVe
         EQGXjW8ZDlJ7nZpnyuyXdPmUPRCH6Gw4fuB0+EprxHJC90WR3R7nUnOxHm0K8m5qRY7h
         6YRrsyBhuu9RX1X/azjpb1TF841cvhe9J6bF+UXj4ISwFr003zob6MMS8pPP06WxTwzV
         7NvOfiITko08rcUQY6RKlSt4ryQSO1h3MsBIoTdPdNFXaZcUcWdtH8RP4mpAxzhLnLvv
         W9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295174; x=1791899974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        b=xZ5HYGIyES7shON+ZuJxJDFAEjA3yQ+5I8GiBO4/wz9hHhAj66R88r+qVDT5P14rGI
         gCNTP7lJHFUElXFtuoKSQjQxFP5SryuqAehULBI+B8q5UbHSqCmjS8NfYu3RcgLRh3Bh
         boO/QJiCGsXwCd2KlSVuVvv1F+o54PP68gNN1to13LAMzRHLrniwizRCSE8EXpWDFQ4X
         J8moYHno/7HUXMUy83YN/aHahIcQbbGJd8ZQHxqclLoDQjfJjLto6a+rq2XlA6P0t5Wx
         TeQXI9I6xQfspjUQU+zVx15kEn5eO46Leukzj7sk09SBG1erEAV4n97QoyZy1MFRGf7i
         dPrQ==
X-Forwarded-Encrypted: i=1; AKwUvBziIisysbEhpoy+kNW2Ch0iI8yHQocknv639v+fEgKNfUj0Yk/wEXGg6nVv65f/Ni6cmUYPKG/37fpccCONe0yr@lists.infradead.org
X-Gm-Message-State: AFq9FYIHuPbODtnoQj2K+x4QnftgEOWI+Sud+C26v/Gbh0Jyl6ZqRGBv
	QMhiCjpimCbTnW3ZXTw1VOIuEt7u0GNhM2xyEJzWnq11dcuK6kMqxUlJBdCpA4/Gu/E/uLhHmj/
	HXeT0EtaqrDeUEdbnS0WBB10HlSrcNMc=
X-Gm-Gg: AYBFou2qhVTfs7EzfDElQHmzjSGIlwJc4yrPcVNTGysypkYeRsH/YOc//UZ0NAqogIR
	rddpBGJnBXyTPhnkokjsrVusMsgAlsLTzQeYhN/wyITwwy2RUkvy20VvFT8MgYBcdEM/ix79wLx
	2i73Isi4VeZlwgi63Suy4nehp4kry3U4ucGGIbwcIa3QgBhf5ztWjj4BG/GdiMquaQNt8H8DyW1
	Q8yPpAnxvsEr6iPvuMyEmSNiCNJbCMpcBXxJsptHrs82BdfLwy2zNiF3rpLpVwQqgcC/RSACwmj
	r9e6Qb8PVE1tgkmRJNhtYPz7pN90jwWg2LpbiN28TFYQgcbWgGbpSJxgaYWCkVhHLhuGxYP5vPW
	i8XjHNzEkkeY3LM2iP32JYEnONF2421PR6W8Z7I3X+Gw=
X-Received: by 2002:a05:6512:3b14:b0:5bc:b659:2d99 with SMTP id
 2adb3069b0e04-5bccc6b4c21mr705952e87.1.1791295173932; Tue, 06 Oct 2026
 06:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
 <20261006132512.2246196-2-alexander.stein@ew.tq-group.com>
 <asT7yvlCeQl1rfrS@SMW015318> <5021357.mvXUDI8C0e@steina-w>
In-Reply-To: <5021357.mvXUDI8C0e@steina-w>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Oct 2026 10:59:22 -0300
X-Gm-Features: AclHuK-G83UF_cmuikg5GvtRML0WChn-CSBfbzHsfZjgKlTszPVDr547oglwPQQ
Message-ID: <CAOMZO5AJiSoFb5Fy-LR4=MDqQqhJPvtzLT+-18es8j_HvYqt6w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for
 SPI-NOR flash
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_065936_670069_8B7B5FE3 
X-CRM114-Status: GOOD (  13.60  )
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

Hi Alexander,

On Tue, Oct 6, 2026 at 10:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Dienstag, 6. Oktober 2026, 15:46:50 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Frank Li:
> > On Tue, Oct 06, 2026 at 03:25:10PM +0200, Alexander Stein wrote:
> > > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > >
> > > The FlexSPI controller uses quad SPI with internal clock recovery.
> > > The clock is therefore restricted to 66.666666 MHz according to
> > > data sheet.
> >
> > Which datasheet? I suppose NOR flash datasheet, can you provide link
> > here.
>
> The i.MX8M Nano data sheet Rev 5 09/2022 section 3.9.1.1 "SDR mode with
> FlexSPIn_MCR0[RXCLKSRC] =3D 0x0, 0x1, 0x2" Table 55. "FlexSPI input timin=
g
> in SDR mode where FlexSPIn_MCR0[RXCLKSRC] =3D 0x0" lists 66 Mhz maximum f=
or
> "Frequency of operation".

From the commit log, I also got the impression you were referring to
the SPI NOR datasheet.

Please clarify that in v2.

Also, shouldn't all patches in the series contain a Fixes: tag?

