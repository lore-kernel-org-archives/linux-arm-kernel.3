Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE58C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVbVRFQUAznwYxpCtzkO4d0c66o8bC/lMZQmfZTPce8=; b=3YYUm1Z98YvlMPvi49Pw+7Qv7A
	6MHG3m+BDjpuzqlFAxATNvAPlP5NtkE/9Q2haWOI0EbVdEI2HW6sA8Y4MFr7VT6mXVeIM3w4ivwOk
	ED4RIAH49OddMzyRczDy1ugrjzXNE617JGlBYHKeGcOlzycHCDXUA3Ev3E8G/+bM0IxvZOvpDVf52
	8b/5mbh4trMhiJcFQQEL1AloNWREM0UPhhomW2ihWdogtYR/FdLFsYBQfD/lrMvjmfcWvy3Iw5gjO
	Z6kEMy8IM05O2QC1V3qf+bZZYykmeSuLXAGPdaSed7l8wR7XF+6hdEEBr2vQK5Imfuj2k1acFeYrU
	dQ82wjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyU-0000000FkF4-3K2a;
	Fri, 20 Jun 2025 13:40:10 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbhy-0000000FiCm-11S0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:23:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so1460850a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750425785; x=1751030585; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVbVRFQUAznwYxpCtzkO4d0c66o8bC/lMZQmfZTPce8=;
        b=f6l/cILz4qBIw2GIPR7Tm4zSb9OxAHGhyCNFvPdy0zqrIapiDzPAd4N87a9VLyeMRv
         T8xqvabIIfMq2Tg4Z3to2TF5PEWHXV1BQjF5A3N0fcsnYBNv5IYkaVPg0km7SE6h/lca
         0BgR9/INdpRFKPnIjBXWvuQZWyBzvOjM0VOq2605tWYCZzQqdBsTlm/XIfm2wQ5gdpIa
         tcJ53i2GQj3gIUCXQbYpRvHY4pZri62FAHwepc8Z+Ai3X0BKF1Rnfy2hWq48nnMyg6J/
         NIvP8E/VPbBA4dwUPBP4iayw4RYBBSQxLVs8PBDKv5lUohchDWjSR0D0efQBIqOjVPtp
         GSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425785; x=1751030585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVbVRFQUAznwYxpCtzkO4d0c66o8bC/lMZQmfZTPce8=;
        b=uoHKjdFcRyuebv4ORi5cl0xg0Kz4XdGR6dwD/+Wj8S1AvlWx3ifPQW39CNWEPoFNjg
         jnlv7bbks5IYZKoUAhDzS1tgJiyzDA4bduwtL3SVjSsa5as99v5uDEPAdlNbXG4m71MY
         XnxYp4UZNZIUw88DaRndbqM1jd+Qm4H/QmyyiCbJGI6j1YgeEdZLHi+z6JEsAA/OpE8A
         nrL96TD8SfCkNCHF4Zqsq4na1YtYnaW5tzjeQp1b4UnUbDcflYRwYDxoYPUi2RwaSZ6+
         EFgviQuNhO09dLVcAlIuie06pVzvLwc+vkpVZP9iUjZeQv+vNQQ6kigB4Ofv1zAXY3pP
         5naw==
X-Forwarded-Encrypted: i=1; AJvYcCWSD6FQog4Yrv5ahnxFSMpmmvcqDd1UAO1UgG0LN7TI5ncb6s8ZJcyq3eGcEA39fQPqdlv7BhNFnI+ZrEg5h3Hy@lists.infradead.org
X-Gm-Message-State: AOJu0YxECIOBE4b8vwGWubHvawS88agXgVj3C9p6swUKmuMii1DvDibv
	o/Y02H9H3q1IPW4VHBkzxSWkOCneymfHZrN3/8aEBdQpHW6uIIyShYcV4F7/BCeBVIvavMk65oj
	pEqoatePmVUf+lnttvWgM4/joNp5qp+RXs6B1
X-Gm-Gg: ASbGncth1MdO+NTDALqMxgsZazXSsfoKHrcGwSzcMLGEIw1t1hf0drMjWr6DOirywey
	UllvIbwxLEf24NHC4kA+reopaUaZzQ8NT8RYQ94OiU2NLaoHZ3QzvV4VWsV7cMwkDtWcSx5Fmzg
	ov2zOJxSxKCyUuSV7oV9sdC2WyFXw3VFYMJAWiDvRC
X-Google-Smtp-Source: AGHT+IE1J/3agy2pvlBUpx5CZrzP7qFSI3FtPdha4ZfRPlkfSyGlRzieK+BAcz2I5VxrRAtzHU31ktVhErvAuBdqNfo=
X-Received: by 2002:a17:90b:288f:b0:310:8d4a:4a97 with SMTP id
 98e67ed59e1d1-3159f518ab7mr3470283a91.15.1750425785075; Fri, 20 Jun 2025
 06:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com> <20250610160152.1113930-7-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250610160152.1113930-7-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 20 Jun 2025 16:25:04 +0300
X-Gm-Features: AX0GCFu22qEJwTwiXYLJyDUpuSZfvl_dtoxWhsBOKOtPed2Sd_Y2mWRPu5m8p4M
Message-ID: <CAEnQRZAhsCc==X1At+s5pb1bocnVmb2sFKmzNo+gqkiWAqFHag@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_062306_280739_34605F68 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, Jun 10, 2025 at 7:04=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The DSP needs to access peripherals on AIPSTZ5 (to communicate with
> the AP using AUDIOMIX MU, for instance). To do so, the security-related
> registers of the bridge have to be configured before the DSP is started.
> Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
> property to the 'dsp' node.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

