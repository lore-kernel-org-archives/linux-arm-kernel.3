Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0A0CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gj+PEAhdIV/uFJgJbAghSUHPHdZ/2r0J4sOrBe2CBfI=; b=DXarHuC2Gm3RjPCA6yWcFB2L2c
	vs47cN/RlwJw0pRGS5xWMCCcA6jFB9LIOnAppqg/ytKEoli8E9pG0QLreYLw2oi+QtzhJrbwOQY45
	NckM+8QYRwJgpBV6hfNKq0Fox8gpp+PRxCTtnFWwLJSDKq0W7pU+7ZlQMS4npspLepyp6jI9TMdX8
	rUHmNwJrNhU+l3cePDJZCA3/Dd4/qg8G33Tzgxedsy7VIQfVHb5PgGcybl289rMnbq2uQWaMScnnu
	v+rap9rVjPd1wD+6QoI31CtPYrBb8jgIjGrTnHsdQseGf5F/vE0SVMiihwoZ81BX8FcTSLhC6TYjh
	ELfDVk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiyy-0000000CP90-01x3;
	Fri, 02 Oct 2026 19:31:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiyw-0000000CP8k-1g1e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:31:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDB2043611
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 19:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7751F000FF
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 19:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790969505;
	bh=Gj+PEAhdIV/uFJgJbAghSUHPHdZ/2r0J4sOrBe2CBfI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IZSEymhMRmymU/5mjnOE3y5B/8QhrXrNBFWEdRmLHSCXxuw/2tuSkkBpfxtDZ8C2+
	 6+a2iCX4rgvLAkGlUd/0DkXOY7QXWdSX7jD03TM6NgI5j3Rf7TEqOEwJAEChQGF2T6
	 YLoXKyiHiEW1/pRdMFRvXBhxISIxzxA04E+sed3xoqoInnXXzlVEPsSHZlK/PLQB/S
	 iuYH9efUKViXPqdL9P8iPCOsP6wiLSHDkirGQVmkWXAaJFc/R8bzy+A1QtyvhnKCYc
	 yz45RPWrNAX/CIVRFwrTN4C6g4N4AYN3aRmHOoettwByFFPh1Vk3zA1vHmXF1XpdCI
	 8JasszxgRAB+A==
Received: by mail-lr2-f32.google.com with SMTP id 38308e7fff4ca-3a96c77840eso2563521fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:31:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgWX6A3AT1nbxNR1RYCMJlSUC+s/FqzH85g7wNTtJtVqEATJ0LMl3Z7UFpiTUQHcC9kwCj8voZ8eQMOVSwER3I@lists.infradead.org
X-Gm-Message-State: AFq9FYIefmaxoEKTqLXls7J1YS1w6wl3P2WD4IDvrEIZmo9pyN1eVXuB
	nfZ3F+M+IQ08hCO637ltvi0upaEPq9pRe419TEWlKbZOkvRwyDu7LyfdKN+lP0h7LsB9kZ0Eeyn
	tYRMq1SJ8xgfHM8trwIFSB8SKEIrlpqoH+UgBZpbf5Q==
X-Received: by 2002:a05:651c:2121:b0:3a8:7b84:be9b with SMTP id
 38308e7fff4ca-3a8877b73a8mr9365471fa.5.1790969503992; Fri, 02 Oct 2026
 12:31:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 22:31:41 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 22:31:41 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ar9qNirrzOTDLipN@gondor.apana.org.au>
MIME-Version: 1.0
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com> <ar9qNirrzOTDLipN@gondor.apana.org.au>
Date: Fri, 2 Oct 2026 22:31:41 +0300
X-Gmail-Original-Message-ID: <CAMRc=MdRBu5gg7Q3pz8Wn9Da4RpmmiKLP2-LwiszKCd3o8jQdQ@mail.gmail.com>
X-Gm-Features: AclHuK8wQ6TwGfqRhG76u8I4Ivw1PHBRVeaKEhxJd2tlBCqG9_-Cl1JOHG4NPMU
Message-ID: <CAMRc=MdRBu5gg7Q3pz8Wn9Da4RpmmiKLP2-LwiszKCd3o8jQdQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/14] crypto: qce - Fix crypto self-test failures
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>, Eneas U de Queiroz <cotequeiroz@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Fri, 2 Oct 2026 10:24:22 +0200, Herbert Xu
<herbert@gondor.apana.org.au> said:
> On Tue, Sep 22, 2026 at 02:57:15PM +0200, Bartosz Golaszewski wrote:
>> This iteration - in addition to the previous fixes - proposes to split
>> the QCE driver into a core part necessary to bind to the QCE DT node and
>> enable runtime power management in order to allow to drop the
>> interconnect votes, and the crypto part registering the crypto
>> algorithms. The core module is then enabled in arm64 defconfig while the
>> crypto part stays disabled by default. In addition: the actual
>> registration of crypto algos is gated with a module parameter that
>> default to false.
>
> Please check the Sashiko comments:
>
> https://sashiko.dev/#/patchset/20260922-qce-fix-self-tests-v9-0-b1aa742e79af%40oss.qualcomm.com
>

I've gone through them. None of the issues were introduced by this series, all
are pre-existing. I've added them to my list and will fix them. Can we not
delay this series any longer and instead work in smaller steps since the crypto
algos will be disabled by default anyway?

Bartosz

