Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52765C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eC4zQahnbIG0zimMI3qqobsDEY2WS5TdQDTeDCRi8Wg=; b=lTDz6bwPXL0KSTXId6MwLuHI4A
	EzfX5+2CFXPM1/W+NlRbB7ysPlEfbhwDTDLtfjWUmIkw2aiWK9bwALjpnVfkhQm/bvhKeYppqvufd
	wz75S0KQix55vU0H1PV77qkUpRaUgAY5MwR+6m28HI+2A6CaPljDzr/AQ1km5ZYgGQ498pddGjuiC
	ZT6bhj5KQ7NFqBSnWZbk752ZYICNjX9tMdCdaTHpJEkbEO1QoPYbUWDKUrTLU4gENL72z/JYdLLKp
	6OwqUik3bGoNA8ItxyNPT4qCo4FdIv8H4IqsbRtXPKrkrIFfZtzvmq/zm247SpvdkMjYyYLxSVBPA
	wZsItiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmQq-0000000DDqo-18du;
	Wed, 04 Jun 2025 11:37:20 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmOj-0000000DDg6-1iS3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:35:10 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3115a6db4d6so5171701a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749036908; x=1749641708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC4zQahnbIG0zimMI3qqobsDEY2WS5TdQDTeDCRi8Wg=;
        b=Sb5+UdBBHvlwdM5HfEvWR20ay86spq+UPvMBAFOQ0K5kdwSuYEUtwZqWxq3dodge0c
         +bS9Th16wHQG0GVE/lMiOCxqkPzNIVSMbQx7/oxD1UEWtj9WZVhcUbxRmUNi5aM88HMs
         7aDqFomaGlfATr3DGu+VRthYd3gpR5M68iKGIvisGzXJN++Zi0Klhu/SNjbIcKK7XRCe
         KlANgyOvf0cuEN9BXZNSR1Zg08gg+V4gVR2D0kRTNrGqB5R187IpXc97v1hlTujXV/Mv
         BFI2ADwI9lt349DHM88lVO5bRTo86SP7de+Z4IrKZ/l8XbO3Xw2XyFlXMt6e5QTTkXpY
         96GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749036908; x=1749641708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC4zQahnbIG0zimMI3qqobsDEY2WS5TdQDTeDCRi8Wg=;
        b=hWmuCwGJb9Fklym5Hw7e0Dsw5I7bkajGM6JAj2777uvtah1W+h8qAgjRmI6/OwEUPo
         KA6dPaAdjsRfx+0phSyV2Mtbehc7sHq+o5Pats5dbqVCazdtNaSNumtkiNaHIMoF2OZc
         Z+CJmGBqpLlySEihcXq7tsXfl9BfImxioCaWzt4BG7W23f7IR0FiouwdL+hWKLMP3XQj
         OoDkFn0YSII/rzzYOT5SPyrtQ6i/kG1QxjHwl5bOa5qaH2nkyXwJzn/ZSZIqSz052r+m
         fGzTkmY2YH6q/Qqs07NI6vgBADiAlsfScEzGNukJBUi0RDh487KcCpvgv04p/wnTD3/F
         /USg==
X-Forwarded-Encrypted: i=1; AJvYcCVXHZZkRoZQzX9w4w9rUggwy7U+W6y0hViXGhMPq8mrt9xGv0aHgMuR5dY3kPIRXjZCjjF2JwUz20znt+rgtJrp@lists.infradead.org
X-Gm-Message-State: AOJu0YwWnrA4NSKi8ctrvcTKSkVBdU8DvdaBw1fOH4Cb5Ba2CHjU5cGI
	e5KrqYOWBilrXNDpbzwsmtj8NaYXrKnIccLTPlSXIIy5Y3y/E4XGH5qSdGseRqKsEdRifKFHWHS
	SHf2cDWKMRxxUs/G7jnKHP8sD1Fe2uc0=
X-Gm-Gg: ASbGncsaKm+69L+B80qn0/OWFoZQGV6AG1E0SzsGIym8jR3KsmiXQTz8afsDqTGiok/
	z1CeF8YbNhF+IQ02/tZNDzoZHx+nG3Mc0cPsoT8qVwgYRHbvTzkAXWvwP7VTbJGOUp7/zg8Q15d
	qzJsxyoXVZ/uwP8gFI8NhvoTsyofdNQg==
X-Google-Smtp-Source: AGHT+IGwIGTmxieNXznAoBW8LEiVl/ryKLqB13xhYIunkErEyJpECY1o6OzL5PMiS9fUTOhNK6TrQ2RtqRozCxKlADg=
X-Received: by 2002:a17:90b:390c:b0:311:a561:86f3 with SMTP id
 98e67ed59e1d1-3130ccf65dcmr3679787a91.6.1749036908156; Wed, 04 Jun 2025
 04:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com> <20250604-imx95-rproc-1-v1-3-a6e5f512731c@nxp.com>
In-Reply-To: <20250604-imx95-rproc-1-v1-3-a6e5f512731c@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 4 Jun 2025 14:37:04 +0300
X-Gm-Features: AX0GCFuTyob7yQ_CjnB1akDwMMdIK7thx9Xx1AgvnXPVg4AWe6fnJ67XkMM0Idc
Message-ID: <CAEnQRZAm_-zr6W4KffXCjzWqBZ2G8TYmMvgF_ABPWhTZNNZGbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: imx_rproc: Add support for i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_043509_447794_4100D23D 
X-CRM114-Status: UNSURE (   8.57  )
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

On Wed, Jun 4, 2025 at 5:37=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping
> Add i.MX95 of_device_id entry
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

