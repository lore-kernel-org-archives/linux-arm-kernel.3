Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38085CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5doOeAnSYSQI+MnlDBwnrzy87dYaAS/wZNmV4aDiaM=; b=luK0ETaUShxbKNOcBGThIM/wzN
	v2IvE2b1NXu9T1D8Xj1cMHLTbB9mK7L0N23MHmGv9B1kohxRW6+WyXkj2HfsAwDKKrG0kED5978eU
	j39x3iiEicEbicLiGpVjZygW1x3Bc3y/jRLDJlSd4jovkWyhp2QvIJI2h1fW8rNg1VlDUHJbRVBOc
	B93H0ZoIWZQDTrUuIl4Fmrj3+IBOL1DHW8XbzDz7j7EfVpqq3yddFdME0OknH30IiRpULOs+IgqNr
	Ceuto9eK/s+xmLjeV42c3nj5KJEgvxQhi8Se+UpzqfbAE6PBjRgKMc6uK7GBjhymupGiLmFtLfY/O
	NFRraZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDK7W-0000000Dcf2-3hVL;
	Mon, 27 Oct 2025 10:06:34 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDK7U-0000000DceX-1QPg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 10:06:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7a4176547bfso1501112b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761559591; x=1762164391; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5doOeAnSYSQI+MnlDBwnrzy87dYaAS/wZNmV4aDiaM=;
        b=Uws6+F/XupwDtHn70bpjcMEj+//CXC/LKaUfGEiCh3QIGipLjvTMTs97ZvPYjxFl5p
         vFY6DikQ39ykjoQS7EPGBdwe82T1TUdTpY+jTgWcj1uWz4XxDTOAmJNkV2PG+Mf0Kk+W
         8x1VYgQx8IHvB0x+06L1wMue0HLoMJKC+5PxccRCpcHDu6Rkp6xWPKOZP9SXL4EEdXwJ
         Pxy9aXdJ1qZaMWVd8a6sj2ez47RpnwHhhVjsgNDC/SfHD6BsbIWCkoC1JMmwTn9eXWHB
         WidIdyc1mZFjN9EMd2qh3Q/C09ERvbY4LwmxVVK1+2R9Bq6UqXkYhB/km1+OZZS8a+7u
         Frmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761559591; x=1762164391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5doOeAnSYSQI+MnlDBwnrzy87dYaAS/wZNmV4aDiaM=;
        b=py1grpLnfq13loev5zIl0a3VtvySvaSAUN1/wguAxqr4uMje2g4TwIYnjHs1q+QGNW
         hn+NUeWNaC5XdeiRIBDAT7FJfQ76QMkmqGWmkZsVB6icoEn8cEi8chYuaQFV4wjurtVR
         z5TntQz6zd2aJxhiXG1FaHsB5aWr8BfMvwdQPm3QlVeVFQda2luN2p2GC5mz8yjFgr5c
         Ghbl/x8E4HGEnPQWG0V5B1RzHYNO2wXLxcrpFGdukmFm7nNk89S6IDAK8w0WJ1ex383R
         it7gC8EWKLtwIiHYeRT4tZ+OvBUpggL8kSdEBzBKMu9ZOmcXDfBEML9RDChF0bh4sfBZ
         N4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWA4RnBz7F10B/PT9YIWOcyayacyI3l33CitW+YI/hzsYeWkLvBHE6d4e45D7r/zTCMXhhvqd+lm0LFMCFMdzrh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6CpzsvcUr7SSYJZ8jYVGGEuP9Hme1u5rS/6jKDmIH8WltLKRy
	fKmbs8yGI1Vq6hd4RJsh5Vth+BfDR9ScdBAhav9dPnJBQQBZxuUzqXJJF46pxsURwyzCvyT8rKq
	H9pcAYHzU3Oo8EMocv3w/zKPlCOZZok0=
X-Gm-Gg: ASbGncv0la97wxpp2Q26BQDTyFQtIsr+hvFa1rfb9qOEp5nwjyd4A/RlNyka7nEr59l
	7rHW20N24P6ChTcndWJUlHf7mOx+cYRVmcA6dMg9xLzHDEgYK80qY4wpUmR6e88pZR7fZgHLMzh
	QCfh/3raHMkAGcIsqT8EFFAYJmnLx6BHMpChhQPkdzZQiSPLcpJAhNWIbo6zh7SKjjlsJY6Z7d6
	uMfz04d80lO1C9AAYDIvmNUWqC9fww5apOrkxBy0YP4qa3UYj9mZcpXROn+mAeUyWAksyAZSk6p
	0WHp3ZekYMlWiA==
X-Google-Smtp-Source: AGHT+IHRpB86RXroRDzzRdYSB7oYFAv4dqfXwWvXOZ++yIISCsXtN6hFohYhh9Tmy4ZRUzQ+j+Lng2VlTrE5kMPFzuc=
X-Received: by 2002:a17:902:e5cc:b0:270:4964:ad82 with SMTP id
 d9443c01a7336-2948ba0d9a1mr120199225ad.38.1761559591357; Mon, 27 Oct 2025
 03:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251027093133.2344267-1-max.oss.09@gmail.com> <20251027093133.2344267-2-max.oss.09@gmail.com>
In-Reply-To: <20251027093133.2344267-2-max.oss.09@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 12:08:57 +0200
X-Gm-Features: AWmQ_bmTfGXGF5x3XTOBQj8jm2eoTyHs4EQJMNTtCvVM7Dk1SHwZVtKvKWhTgLA
Message-ID: <CAEnQRZDrqKFmenTiNi4U==X-xE0pv0Qt=qpXJAVi4sGvnBL4cg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] arm64: dts: imx8-apalis: cleanup todo
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_030632_381198_CD3F9B52 
X-CRM114-Status: UNSURE (   9.67  )
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

On Mon, Oct 27, 2025 at 11:32=E2=80=AFAM <max.oss.09@gmail.com> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Functionality has been added without removing the associated TODO
> comments.
> Clean that up by removing TODOs no longer applicable.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

