Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A63CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 23:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTzG2AG2lQdERz5R0R9LywAO1UeZk+G4W/mfALEjtno=; b=IgAEQ20sh+nkzpoRYxM1VOCPlH
	nR7upUtc5OCOHQ8V3Z8Wzl97QL9OhEKU735Ns3mmDiowTcc4DnAt4ryhwGrafGW5cVpB0eDetPDKR
	sKcZcw3IKD8CTLGkhPCrTAeJK91lybXkzw2CulRAquH6+AfUH0exMLW9JztZj4cMIcWx/wJui7oZo
	rV8PRe9orgGzL51qtb6AGiCjn7aO9edGLE1dcwjHIhpBtEgKxhhrRs7bpF3+OZ031PQBEMxw+72m/
	X3DhmO2jLZceVRTFfOy67INKKCNwZnao0FMXvYUK3u1Qu+pmRO+7zYuqLAJ8OOeFhVjGcABQtpd4F
	CS31cyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKaL-00000001qlU-19uw;
	Mon, 28 Sep 2026 23:16:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKaI-00000001qkF-1khU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 23:16:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2db33db4de9so22665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790637393; x=1791242193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YTzG2AG2lQdERz5R0R9LywAO1UeZk+G4W/mfALEjtno=;
        b=K7U6g8BVwyB7uypD04XrIuyQiqwL59vmnUl9JTeKLvNOhWVaw5oKRWZp5iscXFI11l
         vtqvI77Yv+ndLSDHwzCkyWEnqv+r91K4Jz46XblUoLfAJVQ0Yp6otnwfiKig0DuBeRCk
         h37ioHVb1VM1Z5GCcS+kRjtGvAYI12bnIDAk0eC10NQTBJ7ues2x9mLiOaVO4kPexm8j
         EjjxeGCCYJu4UBFOufYXS5+zIaNPbL8EaTJkVLT8obe7RO4ozuQZD8fpSkOAQZrmfSvq
         3vaaIuqWMteDB01/c1Hz417k89sa5L5+XIrTY/r6JpavSSOE+ZBP/eScjltTDxqUhw4E
         8jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637393; x=1791242193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTzG2AG2lQdERz5R0R9LywAO1UeZk+G4W/mfALEjtno=;
        b=FE3w2+QA/J2swQDx+V/C2lG7de3z4f/bBK6zsIxG0+8+HytmITv7PdJ57LD14O6Uh/
         ixUWkS8QXMeVpO3mCkggXFZPsLWG0POrvRSAbbYOHEhUllkus/TYPrCSv1W4l5/8x36V
         UpNOTfRCbDSpiJNh4H+K9prXjV4PrEctulCbRRF9apwYAaOtGPsS7V6rjCV0k3JZY0nc
         qRTmJbaZfrkytToIDPjwnED5KSOdj19YchmskFJbt/iHuGI8CAhvsOtAp8EwyxRdgUvR
         n/71vjuBqoUyGL3ixOYCaVOu2sWgK7NrVuf7Qqy/6la7su04bWrMxPHv3d7Ip9bzJt+6
         DfrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYrurBh4syI9gep/SfdNBnModdy8jbNXm7F4ib10MNRSRp2NWCgZSm1Ys/TzZF61ZEIF6ZB6wM4Si6IB5PrDDu@lists.infradead.org
X-Gm-Message-State: AFq9FYLRlgcSHyXQZG1LJZ6Iqyjrhy5OKdGQRr6NfknVYxn+DSAHwieB
	uAJ/4w7zN3h/bIMdRcIAulssEeN02/oMDKg+siksZLgucz9HBgGDlzSQS5Tj/GbDfA==
X-Gm-Gg: AYBFou1WSXvuGZou6u66WcfY9cdbbeLuqygjrUdr4D7uuvcGZFgsryEhF2cFA6KZgNZ
	Aays1cgp9i4dj0k7de0MPoB/KgqVcoIef2psZax25JO9ihfrN1xsGivJaq/i6kRUGLuI3c9XKFH
	Q3xUvHbpx2Eh6BRguT9JHvZNudpLu/Ebuwe9m4YhFXPy3W1m+nwGxhzWZsHKy+xe295QJ2cjEWn
	8oBMSJoKkBzRm0lcEucn27k9CeBfHCmfZCLSE2DcelCXyyPaZ361bDAUw+g5eMYh+T4cGePWMRl
	z2q6r/nP15Vz8f0ipLXVVLE9ULxjTbqgJhDe6JVwmD0GoGxurD7XlloX2h625HeDf9lSuwoZGRf
	WxalcpGec6CpwrNaM0Mw1vLqYm46mpAHl92KHW0cMnz2PeZquNs5s5FKhXvTi5ouN1tzTukTlam
	l+zbDU3Ez8g+IpT7AVaGszmNIAGPCO7+Yr+WoUtORqDqZalGdRKq5Lhg22jCStfT4F/GAgkqnm0
	zkOvxCpCkEH+m0hbdNEJ7t8xHy5UKA3KdfMZG/yJpk/oWA=
X-Received: by 2002:a17:903:244a:b0:2cf:4353:f117 with SMTP id d9443c01a7336-2e2c5a8e99fmr1398225ad.0.1790637392723;
        Mon, 28 Sep 2026 16:16:32 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm1582327a91.17.2026.09.28.16.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:16:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:16:25 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 2/9] iommupt/kunit: Skip test configs without
 supported features
Message-ID: <arr1SdQI-s46qG20@google.com>
References: <0-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
 <2-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_161634_466458_9A34FAEA 
X-CRM114-Status: GOOD (  20.92  )
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

On Wed, Aug 12, 2026 at 05:09:18PM -0300, Jason Gunthorpe wrote:
> Some of the tests configs can test features we don't currently enable,
> like TTBR1 on ARMv8. Instead of blowing up, skip the test. When
> CONFIG_DEBUG_GENERIC_PT is set all features are force enabled during
> the build so everything can be tested. That is the normal mode for the
> kunit.py runner.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/generic_pt/kunit_iommu.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/generic_pt/kunit_iommu.h b/drivers/iommu/generic_pt/kunit_iommu.h
> index 79d7f9c8e7868f..558e161eacb05f 100644
> --- a/drivers/iommu/generic_pt/kunit_iommu.h
> +++ b/drivers/iommu/generic_pt/kunit_iommu.h
> @@ -134,6 +134,16 @@ static int pt_kunit_priv_init(struct kunit *test, struct kunit_iommu_priv *priv)
>  
>  #ifdef kunit_fmt_cfgs
>  	priv->cfg = kunit_fmt_cfgs[((uintptr_t)test->param_value) - 1];
> +	/*
> +	 * Without CONFIG_DEBUG_GENERIC_PT only the format's compiled-in
> +	 * PT_SUPPORTED_FEATURES are available, so cfgs requesting bits outside
> +	 * that set cannot be tested.
> +	 */
> +	if (priv->cfg.common.features & ~KUNIT_PT_SUPPORTED_FEATURES)
> +		kunit_skip(
> +			test,
> +			"cfg requires features not built into this format (enable CONFIG_DEBUG_GENERIC_PT)");
> +

I can't quite build this as I can't find this macro:

drivers/iommu/generic_pt/fmt/../kunit_iommu.h:129:35: error: use of undeclared identifier 'KUNIT_PT_SUPPORTED_FEATURES'
  129 |         if (priv->cfg.common.features & ~KUNIT_PT_SUPPORTED_FEATURES)
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC      drivers/tty/tty_port.o
  CC      drivers/clk/clk-fixed-factor.o
  AS      arch/arm64/lib/strrchr.o
1 error generated.
make[5]: *** [drivers/iommu/generic_pt/fmt/Makefile:30: drivers/iommu/generic_pt/fmt/kunit_iommu_armv8.o] Error 1
make[4]: *** [scripts/Makefile.build:551: drivers/iommu/generic_pt/fmt] Error 2

Am I missing a series it was defined in? Can't find anything on lore,
but I did find a commit on your github [1] that is supposed to preclude
this, I guess?

With that dependence defined/linked in the cover letter:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

