Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C31AD185F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXQz2rsVUCTFDHKFBQRt202TfAKpQJw5L1CIs2YJR+k=; b=hP1t3Ynv99ALkdkKiBMPGRllQs
	wopCzWv74XcbKC5gUo10VKqVODJ2WDMG+bvjn4MOBvaQp9NFBTsq/msibRkoCYu54u6uskvdDLno1
	gWgMtFXAqu4CzXTwWJCBhRP0HGiRqhVACFQCRNVi7IzYOtz+N1h6yceHiy2KSfDPs0qUgRBxy+VRR
	CxUIFApSn7wQVmpzaDsCHF3MAnOWuc4aqebErs3U8MILVcY7u3z8DR18Mj5Y11tv59IYddQ5iRkmI
	HtpFrxuicjrBv5uXmCmMhgjBFDAFERkbkKk9nTvmYUt/tXGIS3iDgE3V6JvozBJkBTxT9HJjcRtT5
	pN5eEgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqEt-0000000HCAy-30Fz;
	Thu, 08 Jan 2026 13:39:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqEq-0000000HC9k-3Vg0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:39:46 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso29016175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 05:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767879582; x=1768484382; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qXQz2rsVUCTFDHKFBQRt202TfAKpQJw5L1CIs2YJR+k=;
        b=ME/kiXYkW1/rqsetylBlqzx21Uw6R8X70Mlr7nn8AQUWJ/ZOOUXSBEqwnXMMI69tJS
         LrC4eXbn2K8niKJ/o64spJPFrQz9UxJxrmFGZ0bFyhFkFmgjeek7CxnvO+d5UycxP78L
         FsbJ/g9sIqteZi/OWVmG8mWefB9P3dvtELPfIF6ShO9yb0IvmJZgR3Zcv5zCCCqHIG5A
         pfwDf8mafm8dLQyG5Nu1J5iQ8s1O+dVh0DTm1a4bbInX4NNnTHib2a+pfARYSRTO7VT4
         8AGEn635MsMsyTkyigViGxT5RNB/iFoo7DiHdpXgNJk2d6/TFq04qYNyblJeyBa3aG/l
         aWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879582; x=1768484382;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXQz2rsVUCTFDHKFBQRt202TfAKpQJw5L1CIs2YJR+k=;
        b=gCUUOs+Och6KrclRuD01hir7YusWzUKA+3EUeEjJjNGUoEMLj3AZkVPqGHnzN/iP+t
         MBw0AyZTlj7XCIQLJNqhL7pcwp9cGp2KNCwVbMyF705w0gn/8AeumzVf46h+XxvYW8V5
         Rnmm6M7BqNFaQKXlaPsM/uYIAmPg7HBkLyTamoOt5KagHoanrpvvVDtVUG2xg6yRbsn0
         qV5PWnwqP5YGcJl5JDf9ezHM/L5DK7mnSuJQs00Vb5i5jnsY8pLr3zAX80rmVikwVw3b
         ahyxCmZM9NDUgqh+ZMmHhWwZsmM434e4oIvP358dK+0u3fdFP1Ls+LA7HgTuuDPsT2ju
         XyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuPf5/Jkn4CDtaHJBAn85Q/QmqI9tpO/OBJ64OenNOcwnkiutS+cZdLHlbVKh3M5F+xBSxF8c0jyfzeZZCvqrN@lists.infradead.org
X-Gm-Message-State: AOJu0YzEGNcEXRtqkAJTHAdrvPZCDdiTQFx/x7WHM3GCW264xTsoL6uc
	L23XC3GNRNI17OYEc0bngaTp0PTDhvhGLagSUH0HvfdwSY15SN/S2lHu
X-Gm-Gg: AY/fxX6NGROGOL5578OC3g4Q9SHARBYcU7jpdDMzLThxsFFD/fS3ZfTpdbp8OmCXkgV
	u3u6rRyGkAtt6LG79VTCmOtzUqbR7dP/wgzcfHKbV4/X/fZ/QRbN6SIDu11IOdeWws/82KoFLVk
	JD00uIURiU/6OGrdUCTqdj9DMGLQcXkNrEGzbXfCNxN9pr91LVIoMzCtzxqcYKZVfXG3SsjM81X
	oIPi+iWcTuietW38rYu78RfPZScXFEj7xJj9UYJEo//lghp19YDBrBE9c1iU7vGBkxW0VimwnGB
	F+3iRJM5OtM968u1QAlmOEhKKwNyHtxkNvPrhL0NYu4HGg+NmSrzPT3/Ei2tThn9wUl+tGp6B3w
	t/g1ZYSFnaNRyuoNqUIJIrjUhJT0Ypn2vx34SAVEko32kF5ik9hZZ7aglZHgJMGacVYtj7q15iL
	GIb9RiB9A5e8VMh1pWeKY=
X-Google-Smtp-Source: AGHT+IEX9m28A1mhHxExSBVLDLm4HTtI1a7RzBU+5k4F+/tjYzMhXRZ6k4rk+t6E+by8bAuxtzTq+g==
X-Received: by 2002:a05:600c:8b58:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47d84b4079fmr79676385e9.35.1767879582169;
        Thu, 08 Jan 2026 05:39:42 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f620ac8sm148629245e9.0.2026.01.08.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 05:39:41 -0800 (PST)
Message-ID: <b2713df7f8cb520f3ffbc783a9166499db13bb15.camel@gmail.com>
Subject: Re: [PATCH v5 03/13] dmaengine: axi-dmac: use sg_nents_for_dma()
 helper
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson	
 <andersson@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, 
 Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Thomas Andreatta	 <thomasandreatta2000@gmail.com>, Caleb Sander Mateos
 <csander@purestorage.com>, 	dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-arm-msm@vger.kernel.org
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>, Stefan Roese	
 <sr@denx.de>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray
 Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,  Lars-Peter
 Clausen	 <lars@metafoo.de>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Mack	 <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik	 <robert.jarzmik@free.fr>, Lizhi
 Hou <lizhi.hou@amd.com>, Brian Xu	 <brian.xu@amd.com>, Raj Kumar Rampelli
 <raj.kumar.rampelli@amd.com>, Michal Simek <michal.simek@amd.com>, Andrew
 Morton <akpm@linux-foundation.org>
Date: Thu, 08 Jan 2026 13:40:18 +0000
In-Reply-To: <20260108105619.3513561-4-andriy.shevchenko@linux.intel.com>
References: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
	 <20260108105619.3513561-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_053944_891320_FCBB211A 
X-CRM114-Status: GOOD (  12.88  )
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

On Thu, 2026-01-08 at 11:50 +0100, Andy Shevchenko wrote:
> Instead of open coded variant let's use recently introduced helper.
>=20
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/dma/dma-axi-dmac.c | 5 +----
> =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index 045e9b9a90df..f5caf75dc0e7 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -677,10 +677,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep=
_slave_sg(
> =C2=A0	if (direction !=3D chan->direction)
> =C2=A0		return NULL;
> =C2=A0
> -	num_sgs =3D 0;
> -	for_each_sg(sgl, sg, sg_len, i)
> -		num_sgs +=3D DIV_ROUND_UP(sg_dma_len(sg), chan->max_length);
> -
> +	num_sgs =3D sg_nents_for_dma(sgl, sg_len, chan->max_length);
> =C2=A0	desc =3D axi_dmac_alloc_desc(chan, num_sgs);
> =C2=A0	if (!desc)
> =C2=A0		return NULL;

