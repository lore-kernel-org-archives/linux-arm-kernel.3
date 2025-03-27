Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7807C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBjMIPbm34YhMtcHEbuTRJblo1v587ku20drBHEc6xE=; b=jyWfrLk101o6F7iQPQ7sirAqZv
	I38sVoU+vzkHRsB5gxLMU9mm1JoE0HXkyUF5A77lqLP4iK35lTsAtjWi5nHZenZpq4GrHEXxQvCLB
	39SV9XIyNBFmGPjRxHotcFLWz2wPCT8KML77yGE1YISH774WlAZs4mAG7pjEzqMieI2Sz91kU8Hto
	+qHtRN2jn87e4efxsy6dJA47q32jK9ajKhe4Jv81KUVIK2gLRgBmp2w38W9csl0QmA7qHfTpd4leQ
	49w2s2kdNQeheLTU73VvZ4SCOqKV3a9MsXKkIcYpdVS8kxgRDJ3fYNQ8VieP9ZlUCuc/1xhNqpLZe
	YaQHmJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpwf-0000000BUdS-1Pne;
	Thu, 27 Mar 2025 16:19:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpsw-0000000BTqm-05Tq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:15:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3011737dda0so1521078a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743092113; x=1743696913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBjMIPbm34YhMtcHEbuTRJblo1v587ku20drBHEc6xE=;
        b=L/TvWxs+BVAp+vHe5QtEEebnSdKvHd0qiaz/m012UzY/6OyW0BdPdCR8wrwUq1OFjX
         fSmBkYmLZZ4Cu1SlJV0qYaTHYa49+2K7qeoN9nUjLPGWUrd1uTZZRKviCF4CJCd0D3vm
         iTErHFmXst//wJiETmjIhYU7/dMZ0kUHhTvJ7L9s5g9PqXiisLSJME4zw9fZ5DKeuHRZ
         vnkkva1IsuSDH+rOg2hxjAJblbyai+/Om+4CKU9H0xaPU712XX6TdhNkmIAi5LuRsVoG
         gTm4uyZEIgPI09UD29GgzLWphbehp78ws3Nr1v4tXZsmef+GIJHg84cR4Fg+pMORr5Y1
         sM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092113; x=1743696913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBjMIPbm34YhMtcHEbuTRJblo1v587ku20drBHEc6xE=;
        b=qQXtVHg5QYJjlGMpL1fYGsB2h72P7cwavYf6sqKLpEie1C+Qb1T429cbfiXWmMOiQt
         dZtQzri51iGHvJF12egJahVyeireT8Q42i3vUWBBChk5+/opiY8ZEz6Qnx0qH4Y+GKkh
         c63qhBsW/QYFSxCL6XRFoR6xi7a7StaVLGB6bs94TZz+oFQnkQBlM8ITUjfExK7AmzDS
         RFh/EFQ2YfFUpkJs6HgpDTnq2awOws4fLnulXalrmyeSFcx4ep3VajXD02CSmr2tcIHv
         NSf3sp8HvUskA95jy31lFalw1HEUj021wMYa0MNL0v+3f/gZQAZW+f8HBgo4MtnGZNET
         lKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf9HDqqWE7vE2BWxcAoz3+angU34843BtEurZ/PW9JT3kqTltLD7B9AtqyM20WUDrQ+6CMbc9T7ZlLlBtqxg99@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+zcmwn9enkSIwaDwJqU1GIZICAl1yyozmKnih3Prg69A8U0/5
	KEbIORw+px5ktyZHaXPVHLKg3ORYLJ0SIScqYWevXnlwmO33QtEB67NxSv6j3XUfEFWh/vlla4o
	4SDlfya/sTzCSmuZF4reDqDzZOJYeSCxB4gg=
X-Gm-Gg: ASbGncuIkIg/ZmNGAc7Vi27UeD2qZqvH5MlXha483YfLmZJ6atgta+V5hs1ZXa5pQ4o
	3aVzLbadl+SenNQU2r8JtP75gvfaS+i/eMA1Fbwfdro5wtIMaKApw/LNKcr+mNDTKZtSaCVLtjq
	Gk/N3SkW9siGy479rEKJOZ91I=
X-Google-Smtp-Source: AGHT+IGxfLnA21DnRIbYYx8S6PoJ4aTz0uiokeIMBWjywJxr9DzgkdlxVh3T7ZtOpKy2EtNnbCJT4rNDAaVAjO4mHv8=
X-Received: by 2002:a17:90b:4c05:b0:2ee:9b09:7d3d with SMTP id
 98e67ed59e1d1-303a81651bcmr5489458a91.19.1743092113156; Thu, 27 Mar 2025
 09:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250326215214.1706887-1-Frank.Li@nxp.com>
In-Reply-To: <20250326215214.1706887-1-Frank.Li@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 27 Mar 2025 18:16:41 +0200
X-Gm-Features: AQ5f1JqSne5RAICGf_1pTfxM4Me80uo-4iPsnpzylek8szz9S9jRRSHS2H44qaY
Message-ID: <CAEnQRZD+OUSuysUBmReO0kwdZ61oDucXF7nNAuCYArxk0sRUwg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qm-mek: consolidate reserved-memory
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_091514_055590_884166DD 
X-CRM114-Status: UNSURE (   8.30  )
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

On Wed, Mar 26, 2025 at 11:52=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Move dsp_vdev* to under existed reserved-memory node to consolidate all
> reserved-memory together.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

