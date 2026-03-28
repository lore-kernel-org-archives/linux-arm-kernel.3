Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7061210F3DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 11:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=; b=zgZ7FnkxIBzAZ0YBc9eBO/43Qf
	QCrpVOlpAGcGhm4TkED+zX5nlT+AawWpvz8Ms092ak7o4vzFjiurH0X/8TJcbhRWWesomzDeoiZdf
	YtiOG8QcXTYGeAiHRl5Iy1UmLHRpCosfKPS/6NAfISiL/Lwkr+l8IpbQlpdzgZ/s7bQavZFlhI1Fv
	remFJK7ildlAsKWe48a66bocU1/VDzwbYvVjaZT21dwUUSM8urg633yImRD+SaXotRbhUAhInyShO
	wh17zGdNvKkZPDGOUIv2gZ5oKKyOw1uqjI3WqWCVx6uKLiRWLkELLGEaaF3X1y0dwN5fa3R/bDoWE
	6NgZJecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Rdd-00000008sHv-2lkz;
	Sat, 28 Mar 2026 11:15:33 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Rdb-00000008sHM-0WSZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 11:15:32 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-40efc77933fso1882374fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 04:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774696530; cv=none;
        d=google.com; s=arc-20240605;
        b=bv+TKXgFjFZY+OJ+Gi6pu+W+tlcNAVQKst7uETd4JELgYXlrORX+jyFdZRF2BM3mz9
         82Thf2wqT9U+UN92B+jV/gBdXKZNfjGkfdT1B/tVURnrgODGAID4CfJszhImMgPwsWv3
         iPCM4g3BdTlF9NuVCDhzlVvZtsAwsLB24meaeS9R+iUZqpGhGZtwxLnmvirMHYktsaT+
         pwJUsTdq13uxv6sYRTirf5Kt3IUbxJhR6dffW2iJcnYygX3nreXYuRGTTpG7RRg74wNc
         h/DF7Xjp42ElHibwhU+5RWbb4IiQQZyd+M4mK08Nfrwh+ztcrxcEOrPruqf+4u7aaoii
         ih1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=;
        fh=9WmgXLhgnxSXyH5Sf9VQVokxKN7bZeBtVZnefromiIE=;
        b=UPdowvswtkwkfZWdRImx310p3LC6GWUAa8QiILSoVRkD+4+R9/Y7/GiGr3++H7fVrb
         mEqImmulw5MT6DLdBCgT7QbW/8cDlGri2WFelyBaIl8lTRotm5T4S9a/CFGocfD3EKOH
         Dz2LGrf5GTX4djyDoi2s3ROjL+FoHt3n8n2EvVnPhsuR9flyfeb39tDDv9sDPsMPqEec
         0AylzE7PcKCcn0b11FnpLAYWEPtDvSwn1u/BkyWIeD/2hX/5Rdo3hVIDFU7ouITQ4xjY
         eTwL9ARd2zH62pVX0wRvsT4UhKf9DBKEotEwqJaC5vY9OZFpTPlg/vjfzZ6tGBAw/OBd
         uRSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774696530; x=1775301330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=;
        b=nGGa/I2RDXwzuYCBGC352dsbgfjVf3iDX4SqDcm2UWUNhkqr6LXHLI63+g6Xybkxrb
         BWN1Nd/+47grzXviMYkJxsMFDR3Knw4RfesIKjhA4GqtK469avWpWVfP4T4P0tmSoQo9
         vFPG7Rv/yuKuq7sckT5FhUxOL6mhA6XLnpfJW4B3Mf1bi3EUbSDmlJF40dg9UHlcl6GX
         GbH3vfsiTwaxilbSPD9ltM3OQKqVmtMzEqTW7bbnIMZgzuqV02sp1WyjvWMmkWNnq+og
         cNQKMxjvZsG/G9BNprz5fXn5Jfd/cuHRfkvEUzhYjmiZy/S8LOM1whHOTsVwuf7Jydh1
         VVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774696530; x=1775301330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=;
        b=a3+LeAnoBEYXEl3lwaCND7GC9Wt5UmvrcbZyNE/piCb+9DqfAeV+136KiVHsQIsqK6
         erN2C5ZIt5gwBfH4PmnboRjn+6Gbvr1yPOYDbjT4hGcqvYR8VuwUTt87btw8nvsxKo04
         sjtw6o0Y5DqXqvUVewkmUBp3Gydsx5GvlJci3tyfPnoB94TNStrHbZZcOev2UEFYRLoY
         yuI+C4lS6uddCigRcYzEKtkTCVImZNY+1uY49Io31xctFJu1cav3Q4VTBOyT4V7OOmVS
         ovYXmJi3lE215NN9LBNXrYK+ksy77R/K1KTUVRafHJoKqQDBAmzhsvK8u7nhnhLhi350
         EXVw==
X-Forwarded-Encrypted: i=1; AJvYcCXaC1tlJ1zz6v0NwrS6lzz0sjqlTrP/awjlO0XixZk/ZLMLMz0iotqpGyaZWRDuv6M8NiBHD1LH7+CGdOJyQAJe@lists.infradead.org
X-Gm-Message-State: AOJu0YyBwFvZtks2RhRDLnFyWzS3Pb9+Fb7UZC+TqMefOnHJef4t13aC
	rmnrnIddDsBiVhnargSPzsK4nX7ingncJjlk8VDPHj/7j9fzNZ2nYOsQOrANVzEsT15xTKCGMEZ
	lk5aaG2IUGcDnm1o9P+mmR20wkbuErXU=
X-Gm-Gg: ATEYQzw5p2UVginLzbhiTx+hwtFF7IbNeA2rGRbE+WatWdNXvCXGWR46mw0TWkxiqDM
	HSBfNoOGNeIk3clvF1Z3u68IFa53kHiImDnsuitUnw2+ZirPxvDZWtzetiMnrdPr2TP1XGM7C1b
	HDh/wA8mFwVwnSLgcGJyVDN7CDnSfxvBNLVanE9DNfk77mc3AtmcBn/PKjN3xrlK2nEyCssVI5B
	mV8rZQyAQUIU496OfpI3Zwy/ysZvWMjf2izW0vpZU0/BeUiaXrImunJa0+eIFlFEjZlwSqtij/u
	D6DVKOEZDlYOvDUiCzReXgJLPTp7D4/Yd+ftUw==
X-Received: by 2002:a05:6871:341b:b0:409:57ae:54e4 with SMTP id
 586e51a60fabf-41cec068104mr2925514fac.9.1774696529587; Sat, 28 Mar 2026
 04:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260327222711.268132-1-devnexen@gmail.com> <20260328100010.41236-1-devnexen@gmail.com>
 <2026032803-tree-stubbed-1e9b@gregkh>
In-Reply-To: <2026032803-tree-stubbed-1e9b@gregkh>
From: David CARLIER <devnexen@gmail.com>
Date: Sat, 28 Mar 2026 11:15:18 +0000
X-Gm-Features: AQROBzADIpiaAdAsSWDXr_2MGaRWWGqF3eyfR0B6mVPGw_ItYK7BztzM9d0l-jY
Message-ID: <CA+XhMqw+pR3fLGbysq3FnfpH+b2GtmdhSjjgCKhTwfZFrF0_0w@mail.gmail.com>
Subject: Re: [PATCH v2] media: nxp: imx8-isi: fix memory leaks in probe error
 paths and remove
To: Greg KH <greg@kroah.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	jacopo@jmondi.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_041531_178021_0A893F4F 
X-CRM114-Status: GOOD (  17.70  )
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

On Sat, 28 Mar 2026 at 10:21, Greg KH <greg@kroah.com> wrote:
>
> On Sat, Mar 28, 2026 at 10:00:10AM +0000, David Carlier wrote:
> > mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> > frees it on any probe failure path or in mxc_isi_remove(), leaking the
> > allocation on every failed probe and every normal unbind.
> >
> > Additionally, when mxc_isi_pipe_init() fails partway through the
> > channel loop or when mxc_isi_v4l2_init() fails, the already initialized
> > pipes are not cleaned up =E2=80=94 their media entities and mutexes are=
 leaked.
> >
> > Fix both by adding kfree(isi->pipes) to all probe error paths and to
> > mxc_isi_remove(), and cleaning up already-initialized pipes in the
> > err_xbar error path.
> >
> > Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml
> for how to do this properly.

Apologies for the confusion =E2=80=94 I wasn't submitting this for stable
inclusion directly. The Cc was added based on CI bot feedback since
the Fixes target is in the
  stable tree, but I understand the correct flow is to let it go
through the maintainer tree first and let the Fixes tag handle stable
backporting.

Cheers.

>
> </formletter>

