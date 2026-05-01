Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9821ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rd+tBZg/upA74PKqLvyrmHhNC7+Sod5FXnEOnXaCsOc=; b=HB+ui2+orpsTxppYZUcu8XOCNq
	sBXORYyrnwt5Zm8zx9pqInSt5+GT8Ftnloujgy2q8Uhcy0DNrsM83CHd2Dqmc2QqFC1Yh6Vyq61lU
	0XfrdqSelBxxJAxGIqpnn9c+IsfUe6PEJerspG3xQFtUkQeqwE0y78KiAXqW87Lr4j0DmktoGRaJ/
	lAkKvE+FmpkgoU09o51FUONQ0epBkwRtu1OE20WswybiEPIF4NYxKvsyiWZjn7Wwk5ii5ulCmXWfh
	6+HqHhBOor+v12fsv8rbyv20X/mXx9VPFpEzOkhRV3Z11gl2PJ6WM8TaAdDWa1ocKvAU/qkUSoX69
	rdL34O+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqTb-00000007ObO-38BL;
	Fri, 01 May 2026 16:12:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqTY-00000007Oas-1o78
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:12:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16641691;
	Fri,  1 May 2026 09:12:14 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D55653F7B4;
	Fri,  1 May 2026 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777651940; bh=FtBtOxZvtGvKVPXrUeKJbvmPCYJAAULmrd5Bql1Cxps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WGrCZJb26uUArH9CX2HyLE4lekYG9COjNhDSiOtGW+CDCTeS3tRDOwbt0/FE2CkFl
	 nuY/hSjv5WlgoKtQJLxdNY1BlyoZb7RC9dj4Uzl+v3KY525NJ1NRnIZwvULoF06Ryk
	 GrEnyAktiVbDd6TGrqqj8J2VG8TllC8GMtHLkMBA=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kselftest/arm64: Include <asm/ptrace.h> for user_gcs definition
Date: Fri,  1 May 2026 17:12:12 +0100
Message-ID: <177765193276.1028853.10273937865638236209.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
References: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_091224_598176_64BCAD3E 
X-CRM114-Status: UNSURE (   7.82  )
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

On Wed, 29 Apr 2026 15:30:10 +0100, Leo Yan wrote:
> kselftest includes kernel uAPI headers with option:
> 
>   -isystem $(top_srcdir)/usr/include
> 
> Include <asm/ptrace.h> in libc-gcs.c for the definition of struct
> user_gcs from the uAPI headers, and remove the redundant
> definition in gcs-util.h.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] kselftest/arm64: Include <asm/ptrace.h> for user_gcs definition
      https://git.kernel.org/arm64/c/bb7235e22688

