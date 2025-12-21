Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BDAE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrMOQdDsAyBJL5Fgn/G2OhbffuTYYry72mzdpWhvbCI=; b=OmAR6VvRQ2bjYq3h0fDAl9XfZ6
	inpVWVxq/o/qxSsOOB9r/O/9J7LRx4J4UqEnSZtWShg6Xpmk1Sd6ti6xlEzYmCnv+2wd5ShUx4njx
	S2+9zvB4hTjWgQ0tFPhhjCyHW1KihT5Eyz9Twp5vS/8t2SeFKygdQjXeGj6LiUHFeH3EqxK6PiG23
	XZzvufVtXqbwHv3xB16uB5L26s0GIit3xLGg9N/uJNfoOdtjJl/fcSm2J8sGEKg8MkaKg+Es+PYrr
	flkQ+ZZ0woEyBMG9iAAa6DZCx6FP4G9IDs1npHBGM7VFKIuIMEsj0dBRVqh3Pse38IBt7kl/qr7iv
	9Zako3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLo1-0000000CZEm-1Ohv;
	Sun, 21 Dec 2025 15:57:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXLny-0000000CZEN-2u6c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 15:57:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47789cd2083so17067855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766332629; x=1766937429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrMOQdDsAyBJL5Fgn/G2OhbffuTYYry72mzdpWhvbCI=;
        b=AtQYjB1IcgaU0p2B8Zq1634GGCgLWgoaDav9xrKyhq/1WzjZKmvoEVwxvTbJozJORA
         hbUP4RIameyd50aXtoYnNneQSN+6J5zOzztBIhrxSftOo1mcmlzx5qR4IRET0Pr45zrU
         YsdmYcLrEtNGLZR+p1E09iBxF4ZZv3uXUTcGbTyXU3zua6KOtXcnNRaO0pMKa7rhraqj
         LKnvVOvHWJ5HdkyBb0fClZD+9dWHQsomekJzeWI/5bHd438bgTq4x9UUag6YOGLVsRdA
         hms3x/RGbBCnONcBZHZzvWLHv/QxJxD/m+mqOso5o6zoVOPDuIY/BG+b6/a0lOfNtrvR
         dEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766332629; x=1766937429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrMOQdDsAyBJL5Fgn/G2OhbffuTYYry72mzdpWhvbCI=;
        b=aq9ZGXhXjLIoS0U/nu9ltHvXY3SSDNF/QUKFt9ITSygKysKARvHGpx0YBYUcWxSCEK
         D965IvBxcUaMVQfYJ0aM7DWvBGJmhTjHDQJgssiyyEslix953OiB0Yy6vG2oTxBRFr5w
         qUokIn+lybEecMxp6NA5wDUbYKwPbEYeeBN3qOdl792e/uf8SH74ZsrFSVTAk1d10OzH
         MU41noJRVmPCiaAM9hh6UyjffZWHpbfYjSq4WkYbsF5byAIuLH0sJgd+F4NUb4CO7qoE
         2414bACGlyzZCd6fNRYza2kyQTuwf+Cvr8qTNSKL1PDrdBvc5n7LAdYpDVMhCyMYIDZv
         rqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5jd0DbXXF7WIcOIyFKy4nJW1Xsq624hmEIxYJ7vXAinEtrvuamYVkLEbbTcMrgJ/4eMHeAUwAsJOm3fzcOk6v@lists.infradead.org
X-Gm-Message-State: AOJu0YyQyA/2k0joTLF4YG3yHBQw8rLslEhny7JEl43yWksOR6ptLbRL
	22h41KRZK6gCGx+wuOtUsrNQxD/wKX4k/+H95Qa5egbJW/U3PAeVcwFC
X-Gm-Gg: AY/fxX4tXdjQSEzNK7P2KH+yZOJ5g5hSSkF466mrXd/HFYB+2Su7cga2UEglhbKL1MK
	sL3wdpT2evkEpHmrDMBDkJ8+xHclVTHYlOr4YCC6kt43dE0iXnjvXiTsdpQz5iNDeY7L34gfsxT
	+ttSKetu3uicQdQtXETga2Q65C6ajght8JziHezMwds2Zz0MIkbYAmArjY4bbYDNO0USLdV+x2Q
	636PrQML6ySX7jLq7KdnBEzWnW2RmmJwhjPsoORpGVizk6DcNNjX5JutDZpK4Mi+NyRQlfbNJmd
	J51v7l9mm3bB6H5aCoBmol14bq2aRa1G/Y85cvWImitK/K0zJdwBKra3a+3kM93RxGhMDdwf5tP
	X2wr+dO67U4L6BlxJReH3wsYroOmIFBFe+166pWj8m+alNCqjbetI9pMcYeF4dIzHpvFNcTwDa4
	TGo752qtLm4S9qS+1kEBWjU4NUdOd4uTo5DhUu9wW6vdYJC5KvNGsdKnClZORt3v16fDg8
X-Google-Smtp-Source: AGHT+IExEA0mdDUqUtqXOeUL++O53ldVOc/C42cZHo7ZCg0+/iRgPqjs3JCL6tqxJgQuhZDXsn6nRw==
X-Received: by 2002:a05:600c:6388:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-47d19557cd2mr82943635e9.16.1766332628749;
        Sun, 21 Dec 2025 07:57:08 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm75866275e9.15.2025.12.21.07.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:57:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, dmaengine@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: Choose appropriate burst length under maxburst
Date: Sun, 21 Dec 2025 16:57:07 +0100
Message-ID: <3385264.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20251221080450.1813479-1-wens@kernel.org>
References: <20251221080450.1813479-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_075710_760028_CED11F9A 
X-CRM114-Status: GOOD (  11.48  )
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

Dne nedelja, 21. december 2025 ob 09:04:48 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> maxburst, as provided by the client, specifies the largest amount of
> data that is allowed to be transferred in one burst. This limit is
> normally provided to avoid a data burst overflowing the target FIFO.
> It does not mean that the DMA engine can only do bursts in that size.
>=20
> Let the driver pick the largest supported burst length within the
> given limit. This lets the driver work correctly with some clients that
> give a large maxburst value. In particular, the 8250_dw driver will give
> a quarter of the UART's FIFO size as maxburst. On some systems the FIFO
> size is 256 bytes, giving a maxburst of 64 bytes, while the hardware
> only supports bursts of up to 16 bytes.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



