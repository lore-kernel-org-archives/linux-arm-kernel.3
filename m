Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796E3C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v++WpEwEbf4EpZ34f/FFcUO3YM4jYeI19GmAxfUGHxk=; b=0g6uFZmYbAGDwipVwZ3X35WIW6
	7KCUhAH90u5QHB1UpEbsA++8yt0zh3xqZpCrHyC57aIzU7RgT+wecDG5ddG9JFm+33eFdyP43ABtn
	yNiy3K6NJ/WIKIsqbsTZAJlVus/c3+sbrlaW/Av0S46/BYtbuiU+FgyH5MswE6LasKlF6L7tZHsg6
	CiSVB6Mi5kw6iwtXEcgybpPC2RNQEbwpg4oEblwnWc7Ge07hfIhday6d8yhNpPGrbRjuTMe+bDsOH
	+YnNTXQcEynmICBoK9fvu71g5vUGMq6F1In1HQA9L/GTr1LaVVXjKOROdmilaZhxI25oBjc6+OPr4
	inrOOhWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbwP-00000004EvG-3hhl;
	Thu, 27 Aug 2026 15:23:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbwI-00000004Eu3-1VLY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:22:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABFE943F20;
	Thu, 27 Aug 2026 15:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5EA1F000E9;
	Thu, 27 Aug 2026 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787844169;
	bh=v++WpEwEbf4EpZ34f/FFcUO3YM4jYeI19GmAxfUGHxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VllPGGzArDP6/pmETstGz27ibL0nXuH/r1Udj5HTHTx06lntiCk6HX4/N1eWIo+CZ
	 aIa/FswvIcyvhffHlwAN6XBYVrsLhMhhnC4PnnibY27cOg+sUQcslSpHPFdkWwTXZ6
	 gMmC38TKOl3sxLUnOtxgKv7tEvULMtVDCLXV8dMgGPskzcRmzPOTG0RGk1ln2NX423
	 2IbJ13cA9a4b4poi+HBZYiGw+vpSNxfwTNPr5oSWVqjcTKxrv1/FA5J5w0wgzguVQa
	 eLXEAO3Obx2NUa4ZjlNvOEIIWJUIJShj1YZ9OuU7fYCEGKwAWcvDnstTRAqZTesx1e
	 ++YpLg0vPfS7w==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/4] selftests/arm64: Fix MTE test setup and TAP reporting
Date: Thu, 27 Aug 2026 16:22:38 +0100
Message-ID: <178784032021.66644.7509441879156473484.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825111929.2882324-1-usama.anjum@arm.com>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 25 Aug 2026 12:18:33 +0100, Muhammad Usama Anjum wrote:
> Running the mainline arm64 MTE selftests on a Pixel 8 exposed three
> independent reporting problems. Fix these reporting problems, then add
> an arm64 Kconfig fragment covering the facilities used by the MTE tests.
> 
> Testing was performed on a Pixel 8 with an Android 6.1 kernel built with
> the new configuration. All nine static MTE binaries returned success.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/4] selftests/arm64: Print missing MTE TAP headers
      https://git.kernel.org/arm64/c/8d2237e9d690
[2/4] selftests/arm64: Treat KSM merge_across_nodes as optional
      https://git.kernel.org/arm64/c/1a0dba077f34
[3/4] selftests/arm64: Fix MTE prctl TAP plan
      https://git.kernel.org/arm64/c/bb52892f9234
[4/4] selftests/arm64: Add MTE test config fragment
      https://git.kernel.org/arm64/c/2bd533739234

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

