Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95901CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gu9c7lWkxgnzHfgy0KZY7zp67ms1gfmmcEaQ5l83Deg=; b=Bolz2zQBG71Z7DnFzHJiTGFEN/
	zJRaw3cfGI9yRlZ3bH9VC/AZw1XFcFpq95txJrf5Gz16+pXXXKjiU26C8Vlpx9I4I94rhT3F+BXwa
	TdVkKkA2j4vK+uBDRW3Uk/7QZSd4Cbz7FsqCHZcpkLCT2nZqtGtxxx0dyHUBhOLTENuSELNvmrOlJ
	0CZ+rvb0uELa9YDUQkXxz9WUVTxnpJXT5N5M0lWawCqeloR6aN9k70A13xQZdhAZsE5Aa0rUjMQ4+
	y9wNCrqFZtZaRAKeJFpOJk1rOSdEYMiHEzJqMfNTV/9QHKAJ/SM18ThKbEjSvFnXAeQlL9lr0n7ka
	P6ZkL+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVWw-0000000Eqsn-2Rqo;
	Mon, 27 Oct 2025 22:17:34 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVWt-0000000Eqs6-3uCZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:17:33 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-37902f130e1so12179091fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603450; x=1762208250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu9c7lWkxgnzHfgy0KZY7zp67ms1gfmmcEaQ5l83Deg=;
        b=doEXCtCAo12wBvL/NtWUreRUQTNFqCWtYtRQlBi+3s+jYw5XCTaLvxEd2BgU5oT53v
         16wQ6L2JUTXs0SOkzKNR9Uz65I4CP4E8wacZ03nLO4G1f/mFuAtYl40nCz7sGGnyyAPb
         /QsavmFHZdiC/Rm4gflxtQfiuebPOlBM/Ah3YjgoY8ZKa8xIrh09PJRhLZOmX0WWqytd
         ecIDQSnTWoSZPAmcEby4+fuRHcjlEj2LeB3HjwTYDGjBz8dgLjQ4MoU+/iDWwyIY8QXu
         M66hUps+37QVj0Z3P0KQAD5aoS5JgSWSV2e6qf7b7qN4dx0ihBK96o0/y2ewwlASvHI3
         bsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603450; x=1762208250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gu9c7lWkxgnzHfgy0KZY7zp67ms1gfmmcEaQ5l83Deg=;
        b=Eu1DjJtO42UtMGbjQgnsDTgdpm9wZNYQbMwhQybz7w/lRj4TywQ0WxDw6DSorOPfQS
         6KINYG/qnMSThXK6YhFNNeixYEIdnkYArWgzHPls7xESdKzib1OafWDwHyZQusiUjbot
         ctJWeV2HHTVN31Xb8WfBvmtY/FQ4lpOBZeKooL0sUOgJPf/tGsDszjBHw7Hbln8cXnE1
         ln1yTIQaDLIyc0mCHMHne0eRbOxTsEYyvlMZJ9vbP2loCDzmpWMWWpIUWXiHirqbTWpH
         fSLNUEWW2d0MgCsw5JLRtngyWcqiyJ2Cv/eLJ6TEN2J7OmouYTM26S1+wyMXy7NPp8kO
         jINg==
X-Forwarded-Encrypted: i=1; AJvYcCXbDEnodIx1A5NfJslVn+Bg/o5AMlMWpmiCeTAq0IvWWhO1Vii9ZppvZWn02xeT5DevmTvXv16Kb7sBpEQfnGuH@lists.infradead.org
X-Gm-Message-State: AOJu0YxfnBqy/MRB/LawiCgyYX8pb8xH/Lbm+aj+nP25/MvrOZlLibWN
	9PCAZZ9ObSDE0AZr5vWNiZuDaEK2CgUD1yNwZmIMbn6d4axN905ugyC5baumdNkeSmzTrmi/m9H
	Q1x/+34h3CacAO4R8JSgPgKjvfEwqj9R2s1jeqiYoVg==
X-Gm-Gg: ASbGncv0aY6fKQ+mJUXcxI6Kn93JjFQkkT0xIQ3B9CZ2sJHCgWMmJeG29ZpyrJ1gHWi
	TQtEhw5/DeFyUQtHbI3wEVYKwsrn/vx2JBk1UyTOULPh4yQ1LxjOv6Q2Zff7PpDwXYGN4XvzzEV
	L9q0PYM+zTKra5iMFEXQ8sqP31QZH7+LZ54BMgmsPdpOYENayKTlphE7nvbXDK+CilKYlQQcKTN
	eMsdS9JFp2GNlVcWUFfX+dpLK501e2TKNYhtIRC6rF2+zBZjQRyN7OFIc3u
X-Google-Smtp-Source: AGHT+IHJkZ6eE1AkncVU3lyfeHAfgwuxN0K4vqQ9jMi+HxWP78OGiBunIzAgT3y/91LM4yJ4y7mIdTa25YZ1xkf/4xk=
X-Received: by 2002:a2e:9395:0:b0:36d:860c:d98c with SMTP id
 38308e7fff4ca-379077ad874mr2869931fa.45.1761603449931; Mon, 27 Oct 2025
 15:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-13-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-13-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:17:19 +0100
X-Gm-Features: AWmQ_bmnRcLAntimuZ53EMjWeghfhO7r4GpgnvkhG3-R4hWIysmsmbmnWQXNJ4M
Message-ID: <CACRpkdbGjsGwvJ5gA-HhUQ4_XrQJAaMa0pdzHS19sgLXv0XUag@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] arm64: dts: st: Add I/O sync to eth pinctrl in stm32mp25-pinctrl.dtsi
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151731_974955_D089555E 
X-CRM114-Status: GOOD (  10.30  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> On board stm32mp257f-ev1, the propagation delay between eth1/eth2
> and the external PHY requires a compensation to guarantee that no
> packet get lost in all the working conditions.
>
> Add I/O synchronization properties in pinctrl on all the RGMII
> data pins, activating re-sampling on both edges of the clock.
>
> Co-developed-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Please merge this last patch through the ARM SoC tree!
FWIW:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

