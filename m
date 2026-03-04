Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F944EF8FF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIZO/5lsPSIcHqe7asXEzDOfnJIL+wJsaXc80F6ewqg=; b=YQ6J8fe/q6cEDWMbzPM6ix3Qn6
	T7qsZgQ5NurVjhLI5ckbRrZeA7ysQkHBPRbj3+cEYIgoSuGZynIJd7/LjgJsk3NvpVhL2e0061nba
	o+qlDwpOtG6PtpdlNVZkdHDKtCLV5yJEw2b6MsWEkYhL/mYZVQCcQSccTSQfhRHAb3MHwTvG+jAcV
	ITag4abbYEEiserHSNiVyWF9PYy58hoBqLynqLzakaZYzlvJ2BFSVuW5Lub1wJ/dAMDSNnNwI7eFI
	IEdMNb8gx3lffPqIyBLbM4NhjmnRI/HuOyBx//4UUDbrqfK//7OnP3Xvni2CDGTf/toV+pwMP1gc1
	5irNkq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnne-0000000HVhM-1Ton;
	Wed, 04 Mar 2026 15:06:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnnc-0000000HVhD-29M9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 15:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A557261118
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 15:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E1CC2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772636766;
	bh=gxAcEfjco4wGcd5mrryQitiaU7LNC8vhE9G14RTHDDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GXd9GKw66/RCES5/LDmh94gtKijy68iTiVF7ojlM67lcaT22ypzTDzXcxsFJblQ6l
	 W6ejBD0MtWbJIHL5/oXbb7GeyJdKsNkyOPuHJwq2LJWBUs9Z+ZZgAxTMGZXyWG/y41
	 nmPiyrTkAoeQqffmxjP9IU0KCXecY75c2KMtDeZa5F/iGV1/irZ6HW6hSq8TcPwNfu
	 onqJ7QVaCLjNZsk8hiP4+IP/yJjKDCos9GqzS1n6rIz9/zcxFW1aYFm+ZLJ4za9yVE
	 cl17M7asN0sOHqdfifMeQ+Ym00xoTvAUxYPaWQmwQcDru+jF34WmDDtgbZskwy1WZV
	 FdgyxnC6U9+9Q==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38700168abaso51703791fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 07:06:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSK+W+igQrOP9A9wVW5Q9krMMdkQoO9V2aknfy1EQZMb+csV4XNwwk6e+0huFe8HWryDxK0oImcylIo5E9gQSw@lists.infradead.org
X-Gm-Message-State: AOJu0YwXrIKVXfqZh8uWB6XA1JgZ3QF1XMFjpqmLzdSiGNz4+ce9qwDF
	80MWiZrQWvZEzIBG4fVufb5phC3tBaiF5yufz4bXuE2fQTPy+u2ALpI9Y/zDrKn7szB4a0l7PBi
	zTrQjPOMBG3v+Qs6fbqNQyHhrkeLMfZHKS7Zpyy2HNA==
X-Received: by 2002:a2e:8245:0:b0:386:1e28:4d72 with SMTP id
 38308e7fff4ca-38a2c7cf3f0mr16410411fa.30.1772636764859; Wed, 04 Mar 2026
 07:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <20260302-qcom-qce-cmd-descr-v11-7-4bf1f5db4802@oss.qualcomm.com> <aahEMjjBRINXL5zC@vaman>
In-Reply-To: <aahEMjjBRINXL5zC@vaman>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 4 Mar 2026 16:05:51 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md2G7k7DGMZv2Du75ososQtsAutw2WwwAQ3WL8pC_-LmQ@mail.gmail.com>
X-Gm-Features: AaiRm53H7_XeJS7KZNaUgV2GDd2SiLuqpmAUu8ZTp5xsf7mIRHhbSIEFXAiwXiE
Message-ID: <CAMRc=Md2G7k7DGMZv2Du75ososQtsAutw2WwwAQ3WL8pC_-LmQ@mail.gmail.com>
Subject: Re: [PATCH RFC v11 07/12] crypto: qce - Communicate the base physical
 address to the dmaengine
To: Vinod Koul <vkoul@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 4, 2026 at 3:39=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 02-03-26, 16:57, Bartosz Golaszewski wrote:
> > In order to let the BAM DMA engine know which address is used for
> > register I/O, call dmaengine_slave_config() after requesting the RX
> > channel and use the config structure to pass that information to the
> > dmaengine core. This is done ahead of extending the BAM driver with
> > support for pipe locking, which requires performing dummy writes when
> > passing the lock/unlock flags alongside the command descriptors.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >
> >       dma->txchan =3D devm_dma_request_chan(dev, "tx");
> >       if (IS_ERR(dma->txchan))
> > @@ -121,6 +123,12 @@ int devm_qce_dma_request(struct qce_device *qce)
> >               return dev_err_probe(dev, PTR_ERR(dma->rxchan),
> >                                    "Failed to get RX DMA channel\n");
> >
> > +     cfg.dst_addr =3D qce->base_phys;
> > +     cfg.direction =3D DMA_MEM_TO_DEV;
>
> So is this the address of crypto engine address where dma data is
> supposed to be pushed to..?
>

No. In case I wasn't clear enough in the cover letter: this is the
address of the *crypto engine* register which we use as a scratchpad
for the dummy write when issuing the lock/unlock command. Mani
suggested under the cover letter to use the descriptor metadata for
that.

Bart

