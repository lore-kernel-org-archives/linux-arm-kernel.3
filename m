Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48038CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2K0ZIDmDouzIYjOgQrDHa+obDFg7JDm6ArC3vxrn58=; b=veZZ45ALAg+bzq2s3GtuXEpSn5
	kSRK0rVtL+tIbambaHKKkffGoxWIiNcbOuTQrwZgjBPf7mYcTUyF2YYeDQNPMU384K5EbxyiSN9P0
	SaHUuGwIIEmeif6DDNaaHSobxMDyKjoc1cZ3SgQWx4JVKi2DPQ6faNMXOToRqeH3TKZfBwuSoTxF7
	FT1nnYEgtg7P/MWZaX8Klo0HeelDLYhRf5g3xOCKymxVeToGKxPr15iUGrk8inKkzZBeyzTeRoxr7
	jX6doTSvkiEr92+vqCj25WaHDWqYQkGVAM4VIlCMSE9Iew5Tcx8ekPVpuYPFimJtNUM9Ntou2wQuv
	lSgvQsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9m9-00000002mp7-1NpI;
	Wed, 13 May 2026 13:37:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9m5-00000002mna-1AH3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46124442DF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 13:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FB8C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778679440;
	bh=K2K0ZIDmDouzIYjOgQrDHa+obDFg7JDm6ArC3vxrn58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1mkykF10sGMcnkI4zGd8+MrvAv07Rpfsg7wnzLYvADPoJxCSZcVKZ9hfsZPAbdOp
	 aOaS0+HYEjjm72bGvt/08o4tg553smMoX86Y4IvYRTHuZ/waEgOET7tXGYrim4xjGF
	 UJ9OYJBBNoiA7jvVe0ToHrH+vm3y4zcYzu6Z3EweI/SQ40ntFkFWgfZ1Pkhf/2anmw
	 BNJR2+sA/h4iaJximBT7QNEOJcIsxDk3/MH0EIM1Uyu1dTSTb4V55q070M/zmHtXPE
	 ncEgoJAMZLZu4Zlv8tSxCDfDOJP4NFgrYEug+dUn/HiK8HAynR4zVOxmGaR4p/exiW
	 hvrfa13vSpqBQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a87edf88b3so5302388e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:37:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ99C0nVHxymcyQ/X008+ePsFMilWCvxZcCZLft6+AugFNWqPVsGEVn4sFMIJ50S7+ZCk2cUyYkcm5xzv9V9BH0V@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8DHKNh9zZS22fxqSSBYCrtDeIpcqziVIR9TSWxY4HA3RbAo0N
	zNR/iB2idyoPcccs/iKRaCFp/GTpQF8MjZmoF8XdWrO3Dvn6Y+YhZde3Aj5G7oseN7mp2o1yhWJ
	mc5lP1Y3+XLKXVt73HikJU/dnEysURa4Y+aVLZGcMig==
X-Received: by 2002:a05:6512:224b:b0:5a8:b8bf:f742 with SMTP id
 2adb3069b0e04-5a8ef987a62mr1294266e87.20.1778679438834; Wed, 13 May 2026
 06:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260513123758.4955-1-chaitanya.msabnis@gmail.com>
In-Reply-To: <20260513123758.4955-1-chaitanya.msabnis@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 13 May 2026 15:37:06 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mc=kcWv1Eo=Z5j8C+O49skeLfsBOB+rEZBF=Gy-VwLC4w@mail.gmail.com>
X-Gm-Features: AVHnY4IFyN40KMvyDcVQAeiIe3pL67V2UuNqra_cNWQHkSdc-tBvVbPq0awIgIc
Message-ID: <CAMRc=Mc=kcWv1Eo=Z5j8C+O49skeLfsBOB+rEZBF=Gy-VwLC4w@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: i2c: convert davinci i2c to dt-schema
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bartosz.golaszewski@oss.qualcomm.com, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_063721_332220_F449CC2F 
X-CRM114-Status: GOOD (  10.01  )
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

On Wed, May 13, 2026 at 2:38=E2=80=AFPM Chaitanya Sabnis
<chaitanya.msabnis@gmail.com> wrote:
>
> Convert the Texas Instruments DaVinci and Keystone I2C controller
> bindings from legacy text format to modern dt-schema (YAML).
>
> During the conversion, the `interrupts` property was made required
> to match the strict requirement in the driver probe function. The
> custom `ti,has-pfunc` and `power-domains` properties were also
> properly defined to match SoC-specific hardware features.
>
> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---

I left my Ack under v3. Please keep tags when resending.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

