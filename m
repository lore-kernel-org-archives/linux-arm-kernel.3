Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1616C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ep8pWuTGdd57kw8khC2EvLH50zr6Nz4uqutJaSY52R0=; b=kkOBcE+r8waJroHGOO5/jxxwtb
	9MOcp3LHoOr4Mc8na0TYY6ijyMHrgfgygxDmM4nJIXzFXXlI2IV1hGIVbHQK7sIRJZC8BColg477U
	y7JPRfB4SYtVn8u0apoGP/10bvys6nnZ5zPD+bg57S2TIjWrKIu7r6sHsqvpT+qPPWBeD9uO+/MgN
	Cjc6cE6aKIY6yCgiBCedOO981PlbQNrifbCOvRkpP3ZGPuVOH0KmR6u0XYFVRabZDxSSvjTnOitR7
	oVjGAEjVyW6RCLnvLe4ONXGiQsAri+oc5WwCS+t/YbkCl++O59F+tkIuw7YX3OXWQHzlF9GFJ1qDe
	kx1XJCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJRzj-00000008Fwp-3zLz;
	Mon, 26 May 2025 07:11:36 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJRxW-00000008FoL-2sca
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 07:09:19 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so855350a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748243357; x=1748848157; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep8pWuTGdd57kw8khC2EvLH50zr6Nz4uqutJaSY52R0=;
        b=iVhnvKf/3Dy2T2jvkwiCHbXcbNNYAbIIiUnBdrLB+hsPY0mOoRLYVBz35SpUq2On2e
         hNA7bGQhLd8eG8PXHJeD8awcW6DeiTPFLq5jFamhlh2ZFmFmZHhg+Vetc/gQqULAXcFv
         9X1J7tIU6/Oojr/GKHiS7QhbsDzoaazgdTqB3lBCmQttR1FccyC7fZc2HSC/RN/5Wpq4
         2LF6XM6e+2gr1YzSL/gSCm6MPJFVuLRxlLh8QhGIXLYhhrdzIvPwdHl38yy/onYHzi9h
         HHYxt/F9zmr0/bVL6DQh50c6vV+2GNaJDUPGqv97Z7jJIg11Ei2+GoKAPC3DyjroHs1z
         5Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748243357; x=1748848157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep8pWuTGdd57kw8khC2EvLH50zr6Nz4uqutJaSY52R0=;
        b=ILoNxUqD/0cTbI1rwHXRNPda5QKBt0+zOejxZMHiubmI7K2/xd3AMYBHLF3jLuRROY
         JjpaymyTJgoMhvh1YSaeDmd66h1Z1H7r8qQDvyVWidn0m5k6lUATqt/F5OguzBcbN/px
         D+ow2Rqf0l+4OV7TKHQHX3sM32xikI8eZ3S4sI8ESQrK8iNLUyu2PWnEoDfzLzd3aR8i
         bl0o1kmZ5xSnMMUpkqHxFss35oD5s36HiE3U1gsRodFKRcw+rwBDcvNM9ExxlsxOL8dQ
         IDix9xmqcdSl8qTNCAPQS7wwjCtd6tfZcxvNwBuR/rm/YiGw1M8kzFbfsq0RUmTKBogP
         b88A==
X-Forwarded-Encrypted: i=1; AJvYcCWsIylJ6H/trdwNh2jWtQ59SnsOpT7wjlFJAwgzxWRdwOZa2YPTcKocUusnKUeBzN0CkjgOSi5dnamChirV+SIZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwgKoqRUig79vruPTofpTp0yG1Fl5zYfsjqje3gH9E/AnYl4qDa
	8iz8/emrJ16fCKsSYk+4dN793Pr42vA//vg4OCKYpBvfzqn1rTAzQQVrCYjfyVjG2ZMoYICeyyw
	TTWrqNmpkMP9rky7evYta3j5HBsGukH4=
X-Gm-Gg: ASbGnctftsFeAM9QY4KkSlyEq1EJeLxow1QssF3qwLQd5mZ9rEpyUDEJm1KinX2G68t
	0Q/qqWhPWv3K6wk8CDnGMr0HwZRIh3BLmiWpYxng9dE3eboJTlcEZadYs5InHDHqn563cyyGhjC
	J9YX3NB0SnnZDjmxGMSrSAgN3CUSnO0A==
X-Google-Smtp-Source: AGHT+IGDBhEGxaTSbxJX/MclhB7uE2CthxbT/tmia39DeSZa/GGYPMt39TPrTSYqE/n/l5Ew/IWxpQUxNJkM2ryQllI=
X-Received: by 2002:a17:90a:ec8b:b0:30c:52c5:3dc5 with SMTP id
 98e67ed59e1d1-3111108e58fmr10342094a91.26.1748243357211; Mon, 26 May 2025
 00:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de> <20250523-fpg-nxp-imx93-frdm-v1-2-546b2d342855@pengutronix.de>
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-2-546b2d342855@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 May 2025 10:11:00 +0300
X-Gm-Features: AX0GCFvGtjeGuTsvrA5ltKe4oercB6wbJNzfoRXxRx6ArLhn3Fe7vBf3doOq90o
Message-ID: <CAEnQRZD+P0PhZe2snV33mvT2=2E_zHEPfkxBASVRtESDziw3-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_000918_723020_6D53DE29 
X-CRM114-Status: UNSURE (   7.46  )
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

On Fri, May 23, 2025 at 9:18=E2=80=AFPM Fabian Pflug <f.pflug@pengutronix.d=
e> wrote:
>
> Add DT compatible string for NXP i.MX93 11x11 FRDM board.
>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

