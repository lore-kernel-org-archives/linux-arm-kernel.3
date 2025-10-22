Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3240FCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEmnc5vMpi6b1OrbGAVQUc2U3zcPJKxRDOHC8XlWCio=; b=epNzAY8lcaFzV2sYd31QaiwMlu
	mhL9riXJQ8a9k6GwiBv0DyviwyACctkUIzp+2mZMTyTvSNYUMqtGP7WGehg7ARK3PAXXWzlhUH3Lc
	holPda48TK1bUMOOxYzrUMStl9EGYv7N8PgJxZ4OJfPVLpBQJTdoXe5MgYDv2UIbumjqtj4DVUimU
	+rebjyO08RBW2x9gTDR9aXeK4S+l1bAo2BC2LP+1elWyiqFech2NuleUO3HyXZ0OAy3Ev7u9/alB0
	U2b502vTQkIx1lIEMOxRyhP4EfBPEbl5WI9g4n0Qt3MF8kvQtjFFIi9fzpreb5u3OJgSVqsl6pL40
	RxFTIl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTv6-000000021Nk-0WRD;
	Wed, 22 Oct 2025 08:10:08 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTv3-000000021MZ-3M7Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:10:06 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-33bda2306c5so5259375a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 01:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761120605; x=1761725405; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEmnc5vMpi6b1OrbGAVQUc2U3zcPJKxRDOHC8XlWCio=;
        b=TdUIhZ3dYapKnFY2NGz+Z2XRRVLx35tFUxlV1t7x0/DmTzb8B+yT/S7enhFGWljQrP
         Fe/kwkgtThlf3RZzt2K/7TBT/QDQB1XzVZXods34suNdJypBPfY+L1Iz8hnnN0twaZ3s
         HPn6dbaAZHKi/1H1DxKqhiOQK9mU2fc2D35L80I5i71vEKS6lPpMAHWWnFBDQMrK3dl8
         Vj5g6YacrUdRXspol0p/G7Yo9JqLz/1GKxI4zhX1cxUzBq3evErKuLmjU9nqttetEKiV
         tzQhTkQbSdhWJaNDHwL0etgx9GmUSn82nMO59smsRIr5iRyY69kDVslWGpJc53XawGnI
         mIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120605; x=1761725405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEmnc5vMpi6b1OrbGAVQUc2U3zcPJKxRDOHC8XlWCio=;
        b=OCN+YisBSFTGodhpbYoQ4Z8C0U72Gax4yjoGFdNc1JkkYDvn9EO2V/0ggP9lw90G2m
         6iVbM9IxeZcvDMVh/Oc/O+ozfRHOkoViYiJuUX+LaW28q+VAXo8NRqzOQ41ZuRIKsCPs
         yfsIOJGPEgvfv1zb4EppxNnPDTSvxt1weCLrTw374EQ3rpbukImZbZlk3ejEY0ncMr6Y
         wr9yN2ZbnnxtSUGs1RyAQC1rE2xi3ZMGKntAfJAev2/ki7qLahsAIxTzkD4Ifjuz8HRn
         aVcwmbdEEOvW3wAulgSefGdiYP5pzzvxdOGMSsGse1gpt9He0sZDHVaN0Ax4wn6vzEjH
         yUfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjzKjCyyzYButSflziCzdTdnkXPrYJcWAluZi+46HyC6TfbzYFDwSOptQTuuUgPwiFhGGEa0Jc0Jxm3aS8nv/H@lists.infradead.org
X-Gm-Message-State: AOJu0YydimKIKdqxrXKVtQB57SnxFq+Eedm5Ez3vM+Q8MECBomjsLiXn
	QI1AfwdoHiRWh5rLxbouopWzIkfujlnzTp3oZg+/hnpQxvo9ToVEKCjnZ5+SZiGs/DxYgKBEF97
	3qcIWMTqSksIOoUvbBO++VG+VpCgYOl0=
X-Gm-Gg: ASbGncuOC/ChkECKRGhtdDpsgJgp7pwwxPgctuEppFJDyJBjt7sCy/588+OfDTErDLa
	UHhu4u9GVcd23FC7F5vEFR0uiNXniZ+JaEQr4qKBuUZP3qcNhCeAK/xMe3LhzwvK0L0dPREgTDl
	99/x2c6Ly7umJYjq06dV+Vt2XYSL31kyWxFaHMJ38MLxm2Xq1GivR883GoKXQPeWdAT9jiNEpFn
	PxePXCPP03LThcLN+lFMwNGz3RNRs7/jeSSosmJC9fCeZkboQgG6IIVYpokslYfLwJWNSzMenLE
	tsO6UOIHSUqpMg==
X-Google-Smtp-Source: AGHT+IFsRa3NbzwE1QRZLbALMdXqpaiYhoZrvFInF0ZoI78jJyRZgIJgbztvKnV2w5sJzHcRyU/kiI/2UoR7hH/UHaU=
X-Received: by 2002:a17:90a:ec8b:b0:32e:d011:ea0f with SMTP id
 98e67ed59e1d1-33bcf8f7280mr23198312a91.25.1761120604592; Wed, 22 Oct 2025
 01:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com> <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
In-Reply-To: <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 22 Oct 2025 11:12:23 +0300
X-Gm-Features: AS18NWCHR6zWPh0Lhyj7NW_5VyV1sIwtSk-03hUxmGwwLIGzWZKXfT3yeFbQvzs
Message-ID: <CAEnQRZCtffKGvAUdB4T4RdRDP7VBV3Nt=xWZBXNtRzxedd73Hw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support unconditionally
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_011005_843626_8ACB2A7C 
X-CRM114-Status: UNSURE (   9.79  )
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

On Wed, Oct 15, 2025 at 4:54=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks Peng. Makes sense.

