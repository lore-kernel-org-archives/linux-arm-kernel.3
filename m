Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D712C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=; b=3KZo8sAgyV6zd2sxEyzNjNoUQw
	iQTxbUww146/QY1CFw1AKPWWPoUjLXnSUqMn68w7ZFiF+hmH2E4T/S7Rqzi/rFYhxL1V3ysgHTMpK
	SG9/bndk9NivX5D5LHe/gGaDzZtF8t2vEF1QT7JcIXPTmOab5X7p8Debhd8j7PoTGPGWUdz2xwv8I
	7wRQIZrhQPD0ZHRnYf9dEmiOi79SusOeekKUm4522ekOYSmOYdaymUG8NiYrrzzHhBkH+wubQ0+kc
	S9wh8K+PIld3xM59Ut+yY8mUTxcx+qovFJoh2mJaKKvbjkvAkspFHligBdAzSIe1hef9IHGoq8Xs0
	3FssyKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90w0-00000005bft-3c4t;
	Tue, 22 Sep 2026 13:53:24 +0000
Received: from mail-ed2-f12.google.com ([74.125.228.76])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90vy-00000005bfH-2vHF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:53:24 +0000
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso7427989a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790085200; cv=none;
        d=google.com; s=arc-20260327;
        b=S/pdmop3SxiyR5UNWYpLYX45OOYtKbvgUkR8jZit1GGoMIyD7WAv+OxHHHU0d9qdQ9
         ytWC2gQRNKaXF6eyxuH0Os7juR5MZaxjoxt0fOdJuqHDv4aWOqY0RtIiI4R4RpzQhZQF
         nwco3NmNTyy9IcWQbfQ0gm2U16MKqHMK0ic/2PXlVkv2iW+8GrMZ1j2DMHYytCtImwFf
         VPer2znrT4fWwnvUNWPUQj8TJlXT/w5aIkZ6SlfyKD0Y5ex1HP2kPjV80TbwN+XVnM4D
         YRvUHWc9/lChmm6J/dDTlywzzmgqlObqBUaZwuPw4VfvpBwmGrFseRECKiSPuwDhLBLG
         I7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        fh=yucvavVz1pwwJYdW4pmwa4TzGlfLu0jR4k7D7At76QE=;
        b=p/Rd8SqdlzsRXvy4gqVcwqM37fHsRsItaOyaAPRYUdh2f16yYZ7OSKc0CWXc8LxkDF
         LBqq6gVb2dw24ww0u+ukKSWWlPWx2SZKALHHPAxD+CqbPehYfahTcy6uGRPnJdr6yW+0
         KOYX/Qb+Fjl5OwhJZQCE1k6//1bM2ye6GrwVBxr1Yrbt5gSAgqSd1qyvkKC9a20WKdqZ
         skVq/V8aid3OsHfeizynKN10/Q2XngFmPTUDRt7NjOQ02a8j8RiHNhE9opF4tZhHkWfM
         IxTiDMfcYS37iLlRfjiNNevmSRWS2nyXXpxgxVCkp0o5YpYMKywvV/Jc8CdAa5vA0v2l
         U/JQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790085200; x=1790690000; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=sbxWd312IkQATZ0Ns4w5tXeR86lM96FD+ku0J6QqR7qdOkLFHS/+1nl+760fI8wuOh
         jnRmxAvdXX2FNQKwZnNGFQyBvS6v3WYljT2UqHSSLXohUInqzbi6euICgqgwgFoyRu1k
         9YsPS8TT1mVsuIuhFwDbsjMC8iGXu5GH0Az4h1rKQC01GFMgfgCwXa/nzXgUJGc3rLCi
         8jKDWpt2igH8uUrwxRrBBDyfdxNNz+m4H4TrNFRW6L2RWIXzH6b3CuhvsDryaR750XpG
         /BYCngjjXDiGew1kod6wDR9WKp6mC+XfPsfqfUMKrNScsCxRKJEtygQdYMvEPjA8rvSN
         YtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085200; x=1790690000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=g6GtBvF4BckH/QSW0kxpE3CY+B+iiVPzkvW1cwm2Gak1qxxhtgS8v/fjtwFUPztopJ
         NSvrib4ntzVcR1T97OJPzFIqVc9HcBcqyley1WIdFS8W9YDsLcQDSYdr6YLubJXxE+kZ
         qSLezDwM7vKp6a2Qi0OnLOe6RrZXnfe071XWNBEg5gEXlf/Ci4bVhB301a7R7FLW9Au/
         kWdsG1dpI2Y6eN2Dqiqa1PD/zk09KtbZCiQoTQLksq8P1AP/ez8lZPPwjhxvCR4erhBg
         ZiCmCvUGCbnIDJll1yVAnSdYRQnUL58+YN7xefmiBOJH7emnkn+NadgbJ/zkTc4byETM
         WgyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUvP7k3+jHO+fpbcFOj485ix2obua/EhWrj5Rm4a0z+zKWlO38yXvsS4w+GiibEUfpQyW4aZjJGYfon+xkwWGU@lists.infradead.org
X-Gm-Message-State: AFuF++k8FhxW0TxkTQAJGrU3WD9k79S6GOC7agaL8ijY/KucGabPyZEi
	+8wH1qmIikH7iIH9EW3vJDna/YAJ6frHFT+ABxaR4+k0+b9Wxk7oJhlOTqtpIKxRDrkKApgd5LZ
	wVdtw2oJ/O4PnGWBcSnuqx7RawF9utwen6KojgrJYNw==
X-Gm-Gg: AYBFou3OqjGzv4iCR1QiVGcVI87exe97prT5VJ5NvDWpfBiMM5EHhPC2kMHgoeMZMj5
	gOTtuGYjZjfdNUpBRnpQ6UdL1NZnNEpMcuLxscElFbAwv71QaADv3Mx1Os1AnOYPIny7RMT8n58
	kh7WN9CqklbUCV4PmRiS0YV2kMI7n/hO5qCpGSYNZRoFdRwdkYGKjdT2pLj0RcRPxYRRUFD2qn/
	LRNftONjdj6TPw9XRhGVgLIY8cXiRl9NOcCP8xxJ3E4aRm8XPupNA8uCs6/AXWhqjWEsJ1l0DKN
	t2JRiMSHKjsSOM5bQqbbxIzprtkgd9uJRvCHaoVpaY6o/ZpjJlTudVNK58u4hzLB02LNiO0jH/+
	IXQoT7MwhOK2i
X-Received: by 2002:a05:6402:20c3:20b0:6aa:9210:262 with SMTP id
 4fb4d7f45d1cf-6aa92100342mr3351155a12.22.1790085199929; Tue, 22 Sep 2026
 06:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater> <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
 <arIfj-1Ji6HEBHLJ@bywater>
In-Reply-To: <arIfj-1Ji6HEBHLJ@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 22 Sep 2026 07:53:08 -0600
X-Gm-Features: AcwNN1V0zenE0U1QivuzVoqHQLJIIYIxl9SSuy2ocYOHZBqajP-1AfG4uh0OqKk
Message-ID: <CANLsYkzaxwx8NJAOki_wkzauL68ourd12qF8PzzVKW++PJXZfw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_065322_769892_2ECB1C34 
X-CRM114-Status: GOOD (  20.98  )
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

On Tue, 22 Sept 2026 at 00:29, Francesco Valla <francesco@valla.it> wrote:
>
> On Sun, Sep 20, 2026 at 09:31:11PM -0600, Mathieu Poirier wrote:
> > On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
> > >
> > > Hi Mathieu,
> > >
> > > On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > > > Hi Francesco,
> > > >
> > > > I have started reviewing this set but given the size and implications, it will
> > > > take me a few days to get through.
> > >
> > > I'm going through the review done by sashiko - would you prefer me
> > > sending a v2 with the trivial errors already ironed out before doing
> > > a complete review?
> > >
> >
> > We can wait if the errors are trivial.
> >
>
> Not all of them are. I have been a bit to naive about the bounce buffer
> management w.r.t. what can happen if a memory area is not specified and
> I will need to rethink/rework that part.
>

Ok, I'll keep an eye out for that.  I'm already halfway through your
work, so there's no need for a new version now.

> Regrads,
> Francesco
>

