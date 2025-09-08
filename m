Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1055ECAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1A242F6LfkMbc7L4IW0Lla+LHdWaqDIFPQEBb+TOmAo=; b=405hjAP4uDQNhEbgnyhZ5HzUHw
	/Frkp8Ah7uCBJ7kR2X2zUDbUx022fdyFNLFJ1BxI2P7JU6sMUIokU1EsPRkxP3aFM4Xtyls+ddu7g
	OdNcaslrsifwqQLurvjTMGcS4an3jmiT/2XslyFaVI61tmwuvVIKBnkj0+mE7jnAplpg7u6vryaQH
	uC9pYEcXS7lwNomV/s9J4t/6Khn2yfukltUW8g6HENn3UnmVAXD1D6GP3VoUX5QP9Y+J+4XYVLo0K
	GU2l10T/SunjZSAa27gjwmkxcdp/mukfDJuZEhLks4ZRvFa3/QVUi84pvP1uCbDy+sAacyH9vrsz1
	kWaA+GhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhFz-00000001nYK-1hw2;
	Mon, 08 Sep 2025 19:10:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uveDa-00000000am7-0seF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE8BB449C5;
	Mon,  8 Sep 2025 15:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A34C4CEF9;
	Mon,  8 Sep 2025 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757346945;
	bh=TrbhHDclZj61VL4BpfvLM7YtJx5kSeqUFFlWu2MxTDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pI+TL0QoFGcDCtPXmvuSrq4sPxGAinw8UCXjrNFhdGOSTL7UO3B8NulAQgg2t4FSn
	 WmqPrgz5Yag7/O3hIxk6dsuZH07Y2YoQDX67q9LbKaHzAn2Ky3lQrX/XyqeswF88vv
	 lbTuo1DiglMRV9fMFBMY2rtJLgkdeZUAVlEm/9DvHVOqeyMHN2yZNhbjl83mLD9E+6
	 0Akfzmz82TPFwQpLZvwoxg5zSQ76nEa6xuiE5sKsa4Rt9wWDdee5ue1DO2uxgbG3iY
	 hUhpeB6vezPyeQ9ZPHKLly9vvdjABBZuYZCxxXRIevBsuvaAQ76ZzOzt1yBlehhdk6
	 exy0dXqsYyoLA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] kselftest/arm64/gcs: Cleanups for basic-gcs.c
Date: Mon,  8 Sep 2025 16:55:29 +0100
Message-Id: <175734328051.148062.3197193591970753500.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821-nolibc-gcs-fixes-v1-0-88519836c915@weissschuh.net>
References: <20250821-nolibc-gcs-fixes-v1-0-88519836c915@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_085546_285886_E6B0A191 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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

On Thu, 21 Aug 2025 17:13:01 +0200, Thomas Weißschuh wrote:
> Two small cleanups.
> 
> 

Applied to arm64 (for-next/selftests), thanks!

[1/2] kselftest/arm64/gcs: Correctly check return value when disabling GCS
      https://git.kernel.org/arm64/c/740cdafd0d99
[2/2] kselftest/arm64/gcs: Use nolibc's getauxval()
      https://git.kernel.org/arm64/c/a985fe638344

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

