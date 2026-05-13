Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4159CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DS0g+WzS3g2M0/j/m+F0Qa2UfQ6sl/lz9rspC9dIQ0I=; b=fjO+Tfi/T5O3k1tzRoXwtF7rgw
	v3obJmoKRhQiVyAOb03rMWzdK3GfOiZKWZSNzh3BBGODCaQD/FY/Cpl4lEDuQ3uhjydXXeCuTxLYP
	/9gH181x4f65gVSXPqJdnxMTkD1lymCvPvCKAV9KyKGXIMyJIBsDiw6TWZv6XTH0Zkr4a6sztY4dO
	d9+QH92u55F7sun8lzf0Lzi7toEjw1own8+49z1CxnXtuIej/tHdjc+wmV6TY9M0LDD4v3bes22IE
	qEDbz2117Ws7PyrqgH7Na39bYshyzcw8VMtYaoBUtnd6vRzIAoKIc7t16ktF6JKFmXbVjRx3CaPVs
	MgIyCIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA5E-00000002qKH-1TdG;
	Wed, 13 May 2026 13:57:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA5C-00000002qJM-2Etg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B82660120;
	Wed, 13 May 2026 13:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD7EC19425;
	Wed, 13 May 2026 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778680625;
	bh=c3xbwWqqAIvE4mFdSGwWCaxg5weV3pobvcOvTfppfOY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tHPV0IIoVwgq4OahstojtJftBNYZDnoZ8z41Mtw0fxKp2vq7RuOwFxgyV9IUMDWDI
	 dPa/3VejRvkmgNKNmquEFJ8Pq+fETlSSA5pH/dJfEwvx8Xu9ybSKa+BB43lSFYoidj
	 tHi1MkGub/nDdZNUPKKyjKRPrZB3D9mgr1WPA+5f3Bdoo0Ye/NN5Kh8UsnWCel78kx
	 oaAaQ+XE2gdznN3R6LIYNek+qWgpVufWR9q1hrTpfXutPGF6ZZ0AyWtVc0cT+5yJYo
	 lEwj6/F9fsNHVAlgHBcacbMlfh78h8tg1ECq37q/zXMdAeCFBUzPsrhnVYqETuh7bY
	 /xDwGWHtKPRGQ==
Date: Wed, 13 May 2026 14:56:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 10/11] m68k: stmark2: enable DACs outputs
Message-ID: <20260513145652.7db72ad2@jic23-huawei>
In-Reply-To: <20260513-wip-stmark2-dac-v2-10-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
	<20260513-wip-stmark2-dac-v2-10-fcdae50cf51a@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 13 May 2026 11:14:34 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
Subject to me knowing nothing at all about coldfire.
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

