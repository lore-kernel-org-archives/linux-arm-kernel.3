Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA4CE95A8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tyh9F0v/N7VJ73nDMsYJeC2X1fSpa5QMqgohH2jcBGI=; b=TSfzgbW5Ez+zQN9YDlnrnOIS7E
	0JAMhDtZI+RWzlttwe5MxLgp4qbG4fp23VTrDCiErRw0rjDvhaJWa8hyCWNeDMEdBnSiCtutiWBjU
	X7e5jwNEbW4KluSROy1Cd07yCjT6mwjyRQp5MPclmHiUj6/ElyOSRhNSyGeg5rS0H4xA6u1lHP0PW
	DTKlodYqx2pVHprVdSe+nKN7Vzjr2mCrRN8PUjqjAses2KMxl+1lhc4uE2KxkcATl/V7ku0YTD6z9
	1g3ZQhkXKvnXEUPmwJipuupl4mOhdCTeoyMd/m1kiG82OBnvV8JeF/xP1Fyq7EfyHtIdQmix4k7N0
	Y4MTJ9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaa04-00000004sVl-2yEo;
	Tue, 30 Dec 2025 13:43:00 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaa02-00000004sVL-08wh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 13:42:59 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-37a415a22ecso54078281fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 05:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767102176; x=1767706976; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tyh9F0v/N7VJ73nDMsYJeC2X1fSpa5QMqgohH2jcBGI=;
        b=OCy86d10vOKbSWPmXtMyfXICsh7JPY25WGuFfdlc8e67QUVQvkHBxGzf2vW8YXylS6
         UBJ/fE3SsKT3iR2pSzKhHjp4HuCjliykrQ4lYs28GtJVA01zLIX+QuDbQL/ew0KgJDS/
         2K/1cUxFFGpcJJN7omgOqh30dENV3/UIr8Bz3WDFK4MohpeC3xztSrALrSZD+pv/v5PS
         w0FkD/E+sQPd2KJkQj1jNZ4n+M3AfinFEzUxu+khiNk+HXakNznMheURnXoMvJDkfDVR
         RaXBVNg8bnnmeVFx4LQ+QZZkuyQmCZEO6u3nHVFnwXhoCuiPr5NFCbvkVmPPvd96MsgH
         1/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102176; x=1767706976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tyh9F0v/N7VJ73nDMsYJeC2X1fSpa5QMqgohH2jcBGI=;
        b=BBuC0rkgzuA0+KsLru2GzYbayQ0ypJVaQzgnPol/E3Lx7wNmQgU9yyJq8b8TUxtQ8o
         jgPwPnK8C4mVzBjYLY0J5a99P+RlmZWXReV+No2kt1oxr9H8aHXzPOh5hqouQbbAoBri
         KoRARz0NYuL02jVm1W3TnzXOfo2vViophEyg2pmYCntKSizjXuxgoho4hQjWf22qPXJp
         XTp6cThdNVseaV3MELx5owIzuZFdgyJXxamZQDmPn6JwQF6ra20tb6kdPfOp/QWC4TkD
         VnicZ2F6iegzJUaViUOKmh9o1xEpmq6bHcSnSfzttho7nnE9wTO2FG8fQq4UFOYNZzIN
         zNWA==
X-Forwarded-Encrypted: i=1; AJvYcCW7AW01mQgFjywE94lcAoJiOaK8yzlOqoggoUNsy3zqCcydheweWhFMzf9Q86kXJjoV/UKT+nf7Qe4CRdmTe4Id@lists.infradead.org
X-Gm-Message-State: AOJu0YxIPbZJJ+HZ0bnENBEbXVev09tAhtJsDDVgMtJ4v/rgGqJtZQpj
	YKjAeK9EO7jFyLxx8Nl8/z0rkDOAsiemOirYSktudlK/MFXd+2ry84lPS5nbRryI4OZU5DvaEKh
	OWifLR9G+f2fA7+wtR8Y7YGdKjabqEe4fikahIEtEzw==
X-Gm-Gg: AY/fxX55LVkwuE4J2z2TZqVBXinmYiKtco7MUF38mEaSDoBV57E73uosvkAUplCrUqj
	IoeTNEez4/SCzSSL8bANpjGWLyNdR4dnAP0LJNdagUuDy7yfthf+sHeEyXYNMxslzZnH0AeBoO/
	GeZeQsfjxSLC/4c9Vx/0k3WVGBCthAknujj19Zl1zwQVma4puRcXses0yLvveBaafBeCUUhz0eB
	a3GzPFM8fopr9Dfc8Qf1wpH0JAcvPz7Ebk0fFegkjrpv7UbUSyoSGWNf6sWE1JzmJmQH3h91AN8
	xmmWA+M=
X-Google-Smtp-Source: AGHT+IGnsU8hNigKaB6hVKDS7nf4goo4fbF6JJBGTSO/BU8M8fMqqI2YvS58YCByHu7aYQAfLz1NJS8b8AXypc1f7ZM=
X-Received: by 2002:a2e:9a09:0:b0:37e:7a16:38fd with SMTP id
 38308e7fff4ca-3811319d043mr116531121fa.6.1767102175653; Tue, 30 Dec 2025
 05:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com>
In-Reply-To: <20251205015428.643-1-ming.qian@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 14:42:18 +0100
X-Gm-Features: AQt7F2rVMfuvBZZs-hEcQQIpTtPZbAaFhZv2Z89dF-6-qgfGMGI_jCUJA6HlFl4
Message-ID: <CAPDyKFpFm9kCSNbALJTqeyzFdg3OoooE2gUOXJcjv=WgQeZ84Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Fix concurrency issues between G1 and G2 on
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_054258_104964_FE711931 
X-CRM114-Status: GOOD (  14.68  )
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

On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
>
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> On the i.MX8MQ, we encountered some concurrency issues with H264 and HEVC
> decoding.
>
> There are two main reasons:
> 1. The vpu blk-ctrl don't have separate reset and clock enable bits.
> 2. The g1 VPU and g2 VPU cannot decode simultaneously.
>
> We attempted to make corresponding fix to address these two issues.
>
> Ming Qian (2):
>   pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8mq vpu
>   media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC
>
> Nicolas Dufresne (1):
>   media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure
>
>  drivers/media/platform/verisilicon/hantro.h   |  2 +
>  .../media/platform/verisilicon/hantro_drv.c   | 42 +++++++++++++++++--
>  .../media/platform/verisilicon/imx8m_vpu_hw.c |  8 ++++
>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 23 ++++++++++
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c         | 11 +++--
>  include/media/v4l2-mem2mem.h                  | 21 ++++++++++
>  6 files changed, 100 insertions(+), 7 deletions(-)
>

Can I pick the pmdomain patch separately from the others? Or does this
need to go together?

Kind regards
Uffe

