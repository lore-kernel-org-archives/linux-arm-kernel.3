Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FCCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3vCS5fEBZTrIlk0oaQTEp9kJKU7A5DiAAXFXV5fdVI=; b=FTK7HmLBAaqCxsZ9JZbRS8ESUu
	79fTCtso9ui7sWnbGczx0DqDg6vPaCiFGi1Vk8q8j4nad+AXneaeQLeiMeRKnlHKxSHFRDVG2R64x
	sQgRhWMWtqn8gLodVFfVMDGX3twJNqrZ2e6yJEOMl0RvM1/X1TOFyvAg7KkWOgajXYqZ0yg3qM5EH
	emD67fF27cXN1Mm8lLq/SOE0zNoyPJ8bhLLpDh9HPI04IDl4PkQEs1bVjToC3azjbLc09t/kc9Jba
	yK7cmQMR69Bfbtm/P7RYw2cjSfOAOpUEBRcE3xEgfd0fkXWaVHzYahEP65Dlf6y9KksOaLLFyES/I
	7bTxPC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHG4-0000000Goaj-3P4H;
	Fri, 07 Nov 2025 07:51:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHG0-0000000GoZb-3q0A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 07:51:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29470bc80ceso5049455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 23:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762501900; x=1763106700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3vCS5fEBZTrIlk0oaQTEp9kJKU7A5DiAAXFXV5fdVI=;
        b=Mj4myL5akshDxHcIdH0cjb9piWkAEZiTAse1fs0peVw/WLMavYHUvyd5E9QRift/vO
         EeEgcjF48LkyR4NDV9/D3zA9DF08btQqVXQUT1+/OvSN9xyQojwBGZ7lVSXJcJHw+Jsp
         Q3BlqUzWIfi5smi+psYZZkyOV2gBjmIGm8OARGBsyZ7RuxrBI2FQWvhfo4Fsh1dYu/sd
         PMH1zjC1EEMaU2sJmWMq1f9sRzs3V1UVFKsg9gejhdCM32/3gRhXBqBgsWqeieRhQ+kE
         gp5EsI/OpeqerSZY2u81Pues6gKzddDXfL3yCGyShrs970pkekx7U9KAoCWfxw9pyj1j
         OQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762501900; x=1763106700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m3vCS5fEBZTrIlk0oaQTEp9kJKU7A5DiAAXFXV5fdVI=;
        b=c6pebCdQIMQgvsxJvCUdROcm5LDacShwtKZBM3XaCLBAuqkb8Xy+OaepuiYl4+N+qY
         A/3gZ0tp4w4SWvCL7xr9mNbWTmx1Pgb+bt4XXsOQ6wEbQ0YK/xXZ78NcFCe21OOYWKdx
         YA1NTjbA9ffpOXrQRtBbfZGGt270lQskqon/8Qop/OLhaOvqQqOdmBlwuZi0wv40Ijgt
         +DM6Uwpp3xJxExLzvKgONNejTkdT1lGKrCnv3B9lcy54eNMu3FCoSu9mMuuBbzWaS20L
         tX7XZUvVt0nNSRuqLam5gNJ+ttAEa/+WRgBBx9sLEQWxut5FPR9wmUezLLKPcsGatnBp
         l8hA==
X-Forwarded-Encrypted: i=1; AJvYcCXoVFANGdvh6KipaKj1GWhdQrElNYUl1rzfW2qKVpBms2e4pRsPqF2kV2y0/4C2avfEgVHv7Mj1SGij6zbtnYAG@lists.infradead.org
X-Gm-Message-State: AOJu0YwstX+ILPG62k+eUAUxtcf9m4H81s9chUd4btDir4/2NR7vSVgX
	DMkLVgXsq+k9zFSE7odUxWZFWqmAeGWNtDS6M1VkyZjDuIiAsZ9C+m+WHCx8n0VhniGtUzh6+MG
	FkV+/3l6G7OITiM87AjgXA9rZ2I0Y3Ao=
X-Gm-Gg: ASbGnctsh0dpqmpXsbY0qLpOzZhGarsBLAF52V5coB70Bo1Dckfca2xNPKT6YttseWl
	MzOxGxg0pgVjekmq48kroa+zguAUgfUzE2gpUSD4zvtwVto+OWBueSP/9JRWjHGY5PCIU/KD1I/
	MQXtgy8Tm+eJfxz3py4eMQn6C0RXN6h7f8PMHefcNrAYGd95tTbgWupreCzW8yJKe1+od+EJBjR
	AgqM5cNbwXlYcSD1JBoMEHEgPjewXmcJwHqqFpixyOCP68QQXkRjAqohA==
X-Google-Smtp-Source: AGHT+IFkh8XME/XKdmm+TIe47BXYcMMyHnwgbqIA5X6bAhqAdmw5d+3JqyQ85nbSaeZPIXV7fRyM4oESPwNxWKjSk8M=
X-Received: by 2002:a17:902:e847:b0:292:9ac7:2608 with SMTP id
 d9443c01a7336-297c94b32a9mr11604375ad.8.1762501899726; Thu, 06 Nov 2025
 23:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com> <20251031-imx95-rproc-2025-10-31-v2-2-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-2-758b2e547a55@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 7 Nov 2025 09:54:06 +0200
X-Gm-Features: AWmQ_bnGeOFtoZrRWw9KhEpAzRXkaZJvKZO7s-geVquRIrpRxLbcQTb4ng5zby8
Message-ID: <CAEnQRZBJCZOO9yLr-T_DT_QYerKgRP9gdasmUK+WN+d8VJPV6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_235140_953336_C6F6BE37 
X-CRM114-Status: GOOD (  10.95  )
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

On Fri, Oct 31, 2025 at 4:27=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Structure imx_rproc_dcfg contains a const pointer to imx_rproc_plat_ops,
> which defines the start/stop/detect_mode operations for a remote processo=
r.
> To preserve the const correctness of the static configuration while
> allowing runtime modification of ops behavior, introduce a new
> imx_rproc_plat_ops member in struct imx_rproc named `ops`.
>
> During initialization, dcfg->ops is assigned to priv->ops.
> Enable the driver to safely override ops at runtime without affecting the
> original const configuration.
>
> Improve flexibility for platforms that require dynamic operation switchin=
g
> (e.g. i.MX95 Logical Machine ops and CPU ops).
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

