Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97E6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmlpmnVcGL0avS3PpdVEZ5nI3yJOcG/fmYBWhlTK0Do=; b=IfC7sNlU+h28EUhTL7c3HH3GC3
	aGper/nroPLlcSJ8xWqN/oegGRzF4Fur3VA4LRJKe/R8l8JTZiSKhAXUeRZBy1FwmlHhyoXGdUjVG
	6tlSezJsQClpLIKp68EYf8Kfq1aI4Ql2f16LeEjlTaNj9VBNQ/Vq+288z11mZNMxPXhfIvFSR3Bhw
	4jT5Y0Ai86vCHoK0277gkPe51b/DC4lDX2K8sbaoK8/IV9IGsGtagJoCH8irYUpzKKcm8odLdyNzi
	aZ0Qq5eT7pTXh7PUI5hkuKVsxWtAwbd5blKckFfrkcp1xuE/t7LkraAg1cSgFvBPvrAGqKFOtqEvs
	dKTqtfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfo5-0000000BvjN-30yl;
	Fri, 18 Jul 2025 07:47:01 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucflb-0000000BvTG-3zBL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 07:44:29 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3df2dbe85d1so12977495ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752824667; x=1753429467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmlpmnVcGL0avS3PpdVEZ5nI3yJOcG/fmYBWhlTK0Do=;
        b=EZ1vz9S7pwi4CGPcq1P/zVYMYkQaxtKNeU2PTlws2MM1mJ7TsrzppEWE8WPgEJvjwJ
         Ui/12PZGCtPPt67zZ+Cw3VIP8bKvi5MPgH2w93SgfHoGfWaUOKWPdlJToo+9xe2QblUq
         YAyazHVnONRX10ErbxdOGg+oRpynEiSKCKjsSQE2SutiuPT1bWS7WKYNgHByxoeZiKWW
         /I7GnZW/BunHoR2DacUFN7mePzcCpG0vD5swb5jLpWzGH4fRMicf99lkK4wPIsaGaPpv
         SULR04X0EGvrZK7dRZDpZsBKbdHTS31IbP0XtoYVMg5jALlRiSLJkrqiXaddIdlV4dWJ
         hlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752824667; x=1753429467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmlpmnVcGL0avS3PpdVEZ5nI3yJOcG/fmYBWhlTK0Do=;
        b=LN7EeL+JH/XdHp9xEdTxS6hGR0JMTgd8kOR7DPPwz3Z2MvJXS9ORIdgKDISx3/6OBz
         I/4m5tw7QzaaeuSIomZ3bQEkJFtAMKJWuF4bZBmVe5U817GAHqFAw/mxJdQpqjIYMlb0
         aGHwTOiEGnmfpL03yejsTejZShmcSPTS/qt0aD4WOkPuB3eCuoT+ozJPTt7yG3vq71K3
         Z3BWmiX0GTRUAzjPNBY92cqb6GqJ41dXw0OXXnxtq5GERc0E97Msgc2LhMcq7GqGswYi
         fzgUr6GpgQbzI8eqQYCsK5sGpFasF8vYh+0NN74zX1h5vCpvCHlrjXXqZxKk+mex1oh4
         +cJA==
X-Forwarded-Encrypted: i=1; AJvYcCV+zuKhBIzCNQVpCryKCpZk6geQytIbRiqbryM2CNkIWR22rKtn7f1JO4pcfp9HhuL2y7tyLIfCSNnG4LUsgzoA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0NYvsgJVYrsSJYsPzdfTey5csBKVvOTYvUj/Mt3M34QYZZJxl
	Ut/lO8bA8+mcVTkQFGQVhxNJlVlQ1JeP9f956L5zFGboHXANMGzpvfKelCB7EXP/vf+d+USTEPi
	qsoGjNuhpiAJaYdiI7zcsoFTxMCiuY4k=
X-Gm-Gg: ASbGncsY8gmX6wh0ZSGzpacNJNKwTOAI7demrDEW99fmGdLB4jVayZvrEJRDdlAo1zA
	6fodH/MesnmkebSxvi2z0VynaPIp1/CyXIH0iUoJG09mtKHO/Uey30uv24N+Q23U4++lNS6gWtP
	dfVfyT4RAfkFIVbxd3hRMJ/RwjdcFYSRYZyebZ3HHOhyf/rUsKD+TQChVtEpedU/++tm1Uv/tVX
	Nov0T4=
X-Google-Smtp-Source: AGHT+IH/Caf1fGdiRCnZGzyv7uHAPCmM1WdkO9Z9jQd0Axtk4U1Tyu/Cj/IpUNTfhnOI1VU+WUcrVTv2SPAHM7ZXCgM=
X-Received: by 2002:a05:6e02:2188:b0:3de:14d4:a755 with SMTP id
 e9e14a558f8ab-3e282ed01dfmr112246985ab.21.1752824666722; Fri, 18 Jul 2025
 00:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250716061114.2405272-1-shengjiu.wang@nxp.com> <CAEnQRZC=qApo9C0zBDQoxpV56atLeXpoxZdyBuQ=o2y59YJEqA@mail.gmail.com>
In-Reply-To: <CAEnQRZC=qApo9C0zBDQoxpV56atLeXpoxZdyBuQ=o2y59YJEqA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 18 Jul 2025 15:44:14 +0800
X-Gm-Features: Ac12FXyAcDWebSNzkWDN6xJ8YvjSpNbbipIAuGrOnyFeWn6RtnLG3gfVuS2c34w
Message-ID: <CAA+D8ANSdiEqKwgyb8S18QcuZv58211nxn+cCnRcmovgtu8Yqw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: imx8m: support more sample rates
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_004427_986062_CA4EFBD1 
X-CRM114-Status: GOOD (  16.56  )
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

On Wed, Jul 16, 2025 at 3:53=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Wed, Jul 16, 2025 at 9:11=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > The wm8524 codec is connected to the SAI interface. There are two audio
> > plls on i.MX8MQ, i.MX8MM, i.MX8MN, one pll can be the clock source of
> > 44kHz series rates, another pll can be clock source of 48kHz series rat=
es.
> >
> > Shengjiu Wang (3):
> >   arm64: dts: imx8mm-evk: support more sample rates for wm8524 card
> >   arm64: dts: imx8mq-evk: support more sample rates for wm8524 card
> >   arm64: dts: imx8mn-evk: support more sample rates for wm8524 card
>
> Hi Shengjiu,
>
> I think it would be useful to specify which are the current supported rat=
es
> and which will be the ones supported after your patch  (in the commit mes=
sages).
>
yes, will update the commit message to make it more clear.

best regards
Shengjiu Wang

> On NXP BSP you can run:
>
> ../../unit_tests/Audio/mxc_alsa_hw_params.out hw:X,Y p r
>
> to get the rates.

