Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C0ACAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfAVQsJMCa+08II6sZx8nLAvAG7+m2m1wBLI5CKcaxE=; b=lK4KJWmCt6JnFLwFQhIsf3e+6w
	N3IPWha8G1Qw8Lpv8CdOf99n4OZUXFNldYeNEzVItgssaMlrv5O3vdBq84cl2I0GfNzoBQtMsXElW
	vcZNl+sX1sAX+ELQ9F2IDQ3vproDgJk3G9FQlJL3Gp2IE+4lJbsSb7OWZXU33ccBh/eVDKydcZVD2
	6+bsVOgvDK5BtjfO6aFitIxzdYVBGApCUI16t5yIOG7Ckie5ec+6IW0MHho/pCae2f2bsRHA7+AZ7
	6b8NvYOYYq1m8SWvODYvaTTo5UZ4MYC5SdYY27e+p0T2ByB8ChAIw3xmvP4bp8tAiPexFIxOM+xK8
	qxMlnwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nqh-0000000AbZv-1ySp;
	Thu, 25 Sep 2025 15:25:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nqe-0000000AbZ9-31bf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:25:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-26e68904f0eso12336175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 08:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758813932; x=1759418732; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfAVQsJMCa+08II6sZx8nLAvAG7+m2m1wBLI5CKcaxE=;
        b=oSpujWRJbiVo2/pgvKrSEkDCRrD53pLp6jhYb+hKHz9zJA7pjYb1ZXUMnSWIyP+GaR
         ew3BJMYxR/qE7RWdo7kOKnbLdcYmMoYRUf03JB9z1pIT3aBaG3qN6yxqrOU1XTEpLBLr
         RRSE+LTxHRDyBZnCnOlA6/i7VbQEYBTD3aYqYX6I/UjyBVQNDQRiDF9dHU0HAxpazRvZ
         ds6MvWwtYP2qNmSo5Mow53Q8NSb3/JIFjmYJb7YYuLrhCMPkMpbTdN0GWA9Mygkb34Yg
         oXR3awvPeHilszpzSZcDJg1GxNHRlG96mTdlh9xcNE6Tg0MrwfKRIsKiqt2dVHdl+Ojh
         UFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813932; x=1759418732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfAVQsJMCa+08II6sZx8nLAvAG7+m2m1wBLI5CKcaxE=;
        b=dfDJ2z5nU82m0GDuNzyDx9Jf4TKAOfqQMs5sb9l2mbri/3kWUmCp6LrpEG5M9OoiZp
         nQ4q6+gQQpfP/0SUpRBnS0mb/vrZwjSSuXl6zfeHzVL9g/WZS8JpbFgBZTuizwZFHiIp
         0yWIKOp1ujgIMJ1sWLap6XG90pnLIk7UrAntDCOPwPEBBqtvop0tQHIk0YuFCTxCsjLF
         nnAfvXincRF3ZX71sjIaX3wSqYlpfpgQ1smeTXO46j9QHFZDyaW82Pv1fjXeR3uePwuv
         VUlzO2fzSqXJoZZRC4zjNhZbJgSNqsXv35JLmY7vm5AWAuFuDgUghILMAxiKxk16ZgWl
         OudQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1DBz24jGi2KXBVJb0Dob7IoTb01+TTagxCJKW6OZXefhY+GZcQCdc/BUYp3aFqG35PtffF68qmxVfopEj3Dq8@lists.infradead.org
X-Gm-Message-State: AOJu0YwofnbMY0u4BMHzmn3MVIM6bxZlluojuan4WV0sksBkW1gljoh6
	puIb0NNIVk/z8IMsGFBWA8HhilKunO8A7XBYXQM2VHAndgOM/wK1cmtLpeQqpJkaz04=
X-Gm-Gg: ASbGncv/Ax680AQObhz/DNTHIqIRe/RWuT1hDiRYO4TKQQDjUQrj2wgr1esgUfH9XMY
	+h6PfW8HT2552NzPr71o8RNYds1mT0ATWaPjcwLGtPwKCI24ZeUpyi7J4QRw6xuscgRIGWj66T7
	V+OHK45/EsIcue8UfcfdCB0HIHX0pJM/jBeclsIvvosQ+ttCOSjtgLzbkakWZfW6kX0dhxkftUq
	yhFDE+LhCtduhUiZ/34ZhO0bkihys1xeT//gEraKJ0vIjlGugyqEfGCbCUI+pki4w1UbRBdH1ur
	ryQKU47Ki0FKorJ5y6JKiJ1XqDoXt0pYi9SxS2FFxYjhm4XVBvj9bl5iaHVFFxT536cNCIY6qNK
	cJnNqEhHdU7j9YA0zAgORmJPcpd7XtrMA9jSBGaLXW418evlTVbRAzkR/g3Mzpkm2bQpq7VlwOO
	2iG10q1LVGP1nm6WW7gNvmeM0=
X-Google-Smtp-Source: AGHT+IFaUWm0IMFuhwxwZ6ZVuoRzGDUplyarDIAkk4+v9ajtIq9wSLIjRgUT3UbBtMTnindWS3TDDQ==
X-Received: by 2002:a17:903:19ef:b0:274:3db8:e755 with SMTP id d9443c01a7336-27ed4a7ec49mr43070925ad.30.1758813931703;
        Thu, 25 Sep 2025 08:25:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:491a:5e5:2a2d:1b96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d37casm28336435ad.8.2025.09.25.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:25:31 -0700 (PDT)
Date: Thu, 25 Sep 2025 09:25:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <aNVe6MG2HiWNJZQP@p14s>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
 <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
 <CANLsYkzWQEWKM-_iff7wY-sk_OERFiAMSrXP6Cyf8vJfXqunjg@mail.gmail.com>
 <20250924203115.GB2711@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924203115.GB2711@nxa18884-linux.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_082532_766627_BBE75D09 
X-CRM114-Status: GOOD (  37.99  )
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

On Thu, Sep 25, 2025 at 04:31:15AM +0800, Peng Fan wrote:
> On Wed, Sep 24, 2025 at 11:10:33AM -0600, Mathieu Poirier wrote:
> >On Wed, 24 Sept 2025 at 09:35, Peng Fan <peng.fan@oss.nxp.com> wrote:
> >>
> ...
> >> Sorry for early ping - I just wanted to check if there's any chance for this
> >> patchset to be included in 6.18, along with the other cleanup patchset [1].
> >
> >It seems very unlikely.  I am currently looking into how the PM
> >runtime framework behaves to address my own questions about this patch
> >[1].  Furthermore, I am worried about the usage of the device
> >management framework when it comes to freeing memory.  I will get back
> >to you with comments on that front when I know we are doing the right
> >thing with the PM runtime framework.
> 
> I see. Not sure Ulf could help clarify or review, then you might take less
> time.
>

It is fortunate that time was taken to understand the problem and fix it
correctly.  Otherwise we'd still have a problem and more patches, possibly
wrong as well, would have been needed.
 
> >
> >I dropped the 3rd cleanup patchset.  More than once I asked you to
> >submit only one patchset at a time and you still refuse to take notice
> >of my request.
> 
> I apologize - I now recall your earlier request to hold off on submitting
> further patches until the table_sz clearing patch was clarified. I
> misunderstood and appreciate your patience.
> 
> Could you please clarify whether there's a general rule in remoteproc that
> developers should only have one patchset or patch under review at a time? If
> so, would it be possible to document this guideline in the kernel documentation?
> That would help avoid confusion for contributors.
>

Most people tend to address one problem at a time, especially when subsequent
patchsets have dependencies on the previous ones.  I'm not sure there is a need
to document something like that.
 
> I ask because I have other patches queued that are independent of the current
> series, such as:
>  - Reintroducing the table_sz clearing
>  - Misc cleanup in remoteproc core

I'm fine with those, as long as you address just one proble at any given time.

> 
> I understand you may be busy and have limited bandwidth. Would it be feasible
> to offload part of the review work to Bjorn? I rarely see Bjorn reviewing i.MX
> patches. Alternatively, could we consider bringing in a third maintainer to
> help accelerate the review process?
>

How fast do you want to go?  By and large, I reply to patchsets within a week,
sometimes two when things are busy.  And when I can't meet those standards, I
send out an email to the mailing list with the review order of the patches in
my queue.  What else are you expecting?

Bjorn is maintaining over a dozen subsystems - I stepped forward to maintain
remoteproc/rpmsg to help with the volume.

 
> Thanks again for your time and guidance.
> 
> Thanks,
> Peng
> 
> >
> >Mathieu
> >
> >[1]. "remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling"
> >
> >>
> >> Both patchsets have received Reviewed-by tags, have been tested, and
> >> successfully passed builds (arm64 gcc) with each patch applied incrementally.
> >>
> >> [1] https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/T/#ma16bb8a38300f6eb333ee04f00d57805aee3c114
> >>
> >> Thanks
> >> Peng
> >>
> >> >
> >> > drivers/remoteproc/imx_rproc.c | 128 ++++++++++++++++++-----------------------
> >> > 1 file changed, 57 insertions(+), 71 deletions(-)
> >> >---
> >> >base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> >> >change-id: 20250916-imx_rproc_c2-2b9ad7882f4d
> >> >
> >> >Best regards,
> >> >--
> >> >Peng Fan <peng.fan@nxp.com>
> >> >
> >

