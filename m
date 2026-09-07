Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CB4C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS5KVI+4yQZf58FrqRaCjURnmXDn+UkPbYquQY74jXw=; b=Tlb0Z/OPLiIk0EYnABIuEiidBC
	zjG4n+27AL1fi/f89yBaP97HRs1PL0nTzjZlz/+qwcbo1kG2QN6b0IQBGZ4TYD9rmtlLRLvmG9Xda
	r23xKvXAVWjhp+VHViLurLl9d1/Q0D+G9VNbpuv8J9Vwceeeyw1ymmcpXJoO47Bb9/ZfkBWiAIo4s
	bqWv5AOiyIQYxjPx1SyQONpT42I50ghSYuEPRoKgND/pXQk3Cvs9ld9kh8Hf1z86lkYp2yiqzhYLN
	yHYsGYt1NQKY3W/8bcqWNMFQcxAPWvtUrT0XKkmzB9pktB89162mOrpumZK4wUFRmkZdHCfNQPryE
	V8tjn3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zdg-00000006yDf-1VJv;
	Mon, 07 Sep 2026 13:44:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Zdd-00000006yDC-1bSo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:43:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC8E543C4C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 13:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8041F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 13:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788788636;
	bh=gS5KVI+4yQZf58FrqRaCjURnmXDn+UkPbYquQY74jXw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LIdB0hPr/C2wJVMOt5nJQYb9K60zCLRIDqqYKVE+No36zAB/v9XrWuRwWGHvj9KoG
	 Qmi+GA7d7b+c6nSxD7xdfc3BVs9f/ktXO6w/dH5tNCARrP6z6kLyZ1R8kTgS1ldJob
	 u7nBMgtUiRrP9SvnbI83Ugt+KrCZ3Z98LV0pb9/7x1O5D351Dj/rsekNRbYL9JAqSj
	 tDZ2c/Q+xmnlRrPxm57qWdqNoYWebuWtuDds1cpyb2t0UvEJuUnWObxrgJ/jXNgcxF
	 7iTLaXmiP9p1xD1OU75wU7Vh4BEN54MLWGVMvOuSe+HpHnzinhWsuJbyVzigw93s2h
	 8/EaP+21XjR4A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso5548188e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:43:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxCAZRfyDVQRqGPb5FpP0It0VXJs7ZksCz3b/ppen+Z3FXcB2ctZBTN8aAlODHUGn+/mLK2bjr8qLBYX8seaheD@lists.infradead.org
X-Gm-Message-State: AFuF++kAmBMXTHIUc2pz/miRI+wBqza0YSd2q0/p/V2opLklpaUOAutW
	jMjPqBmjune60dibRjY9FT68UW86IQzebpVrwsq6U/5Zode8UXJ+eF0dUxrfXfq37pxT42C5o32
	iC5Wef2CoQrMqI68ZGqHShyiJBFHY1weGBktaN1pywQ==
X-Received: by 2002:a05:6512:3f20:b0:5b6:10bc:dc4a with SMTP id
 2adb3069b0e04-5b610bcdda5mr4154057e87.33.1788788635406; Mon, 07 Sep 2026
 06:43:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 06:43:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 06:43:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260904114345.27509-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
References: <20260904114345.27509-1-hemanth.selam@gmail.com>
Date: Mon, 7 Sep 2026 06:43:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=McXzTWFc2KCoKoiXrjfJJC3e6ZRD67cRpBM1xR-GbzxOw@mail.gmail.com>
X-Gm-Features: AcwNN1WNfEGXDsyeIgZ-XbB4z1C5oh_dNjOjXAIjSW9W2zVJYyiLOhmf6dkuuZs
Message-ID: <CAMRc=McXzTWFc2KCoKoiXrjfJJC3e6ZRD67cRpBM1xR-GbzxOw@mail.gmail.com>
Subject: Re: [PATCH] crypto: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	George Cherian <gcherian@marvell.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Gilad Ben-Yossef <gilad@benyossef.com>, 
	Ayush Sawal <ayush.sawal@chelsio.com>, Srujana Challa <schalla@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 4 Sep 2026 13:43:39 +0200, Hemanth Selam <hemanth.selam@gmail.com> said:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/crypto/atmel-sha.c                       |  4 ++--
>  drivers/crypto/cavium/cpt/cptpf_main.c           | 12 ++++++------
>  drivers/crypto/cavium/cpt/cptvf_main.c           |  4 ++--
>  drivers/crypto/cavium/cpt/cptvf_mbox.c           |  4 ++--
>  drivers/crypto/cavium/nitrox/nitrox_main.c       |  2 +-
>  drivers/crypto/ccp/ccp-dev.c                     |  2 +-
>  drivers/crypto/ccree/cc_buffer_mgr.c             |  4 ++--
>  drivers/crypto/chelsio/chcr_algo.c               |  2 +-
>  drivers/crypto/hisilicon/sec/sec_algs.c          |  2 +-
>  drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c |  4 ++--
>  drivers/crypto/omap-sham.c                       |  4 ++--
>  drivers/crypto/qce/aead.c                        |  2 +-

For QCE:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

