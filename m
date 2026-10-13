Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E6FCC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztRaXqyrR56+w7RPpAUjPbdPnFFHy5MV1wBOVJnx6ys=; b=MFikqbF/ekuqwPGCA1z16N4Hd/
	014aVU2jn8jehfLen9xiqYPIRXz9dIJP8kXrM05rpNAZ9iEhTfd46To4PnzGc0Do8y9mrDbGj6M+Z
	I2cF0rStIIncjWSXf7eTw6J4FCk1yQzLpbXDj8MnkqSSi5y1m12VEdbv4gltBOfV/hzITxvObWjnD
	GqfLHcWMPQEIYWbgVhvORwNrvnzO0Lo6C8jFT+3ms3GgG/zmzAhbK+Ed0MjeWUTEBeAavhStp+vWG
	MlU2775MaF6CRs7YO8fzI55fOGbkjG+8A7OYfC1Hyn2oMUyWU/wJUIRwDwZ0+Mdl1O+GNDCLLCcdQ
	eU598RzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfwV-0000000Dcwj-0MQm;
	Tue, 13 Oct 2026 17:05:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfwT-0000000DcwV-3nlf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 17:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ztRaXqyrR56+w7RPpAUjPbdPnFFHy5MV1wBOVJnx6ys=; b=FHS2wLFGwCVUE8w6igdzPOvv+p
	cKVs+xJVjNlkS60ryUp2AcQJvNLoIlAp2NWdCAxfCZQ3pTEacHUdzahEm1yPfykV/Wnlw6m+5Vf8j
	jiddBUQCD8K7gD9gEBoFx9y5Q/fHKfGmzz147O9EQXMkhKsJOx7Impx55IyLVseoNj369kSG4uMVN
	XUvqemYIlVWW3NZkp7CiGR3SK7hz+myz1XP6xBLECZGmeqUBrDUindkcOwf7FjB6Gq8uuvFqfUxN9
	0zHTBA0w6myPyIg0+ERtyInQ7VEVC+7+epbVFMEhr51brI2yS0hTKs6o58v3KVpa7bODMJ6hLwSKK
	WOGKdQ4Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGfwQ-0000000Fpbd-3Qp9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:05:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69DFF169E;
	Tue, 13 Oct 2026 10:05:23 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3940B3F673;
	Tue, 13 Oct 2026 10:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791911126; bh=dg4lya1wOIsNzz5d1Y0U13u79sEKc0xrgX1PBOPZf7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UPpqgxcst0jCWD5I79N5/ZWmUnUZu8LqfLsnqqFOuKwnPlLGedZYHw488LxQU3qlv
	 uKhsgnFTvxXP25VFYW2R8Gg3HpQvubQZpQhLhycMqmTF0DkvmSss3GH/XCYQMkw89b
	 kUV1mHtu5+vBcOEpyy/dka5f7aVb041RGnjMmZOk=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Usama Anjum <usama.anjum@arm.com>
Subject: Re: [PATCH v2] arm64: clear_page[s] using memset
Date: Tue, 13 Oct 2026 18:05:20 +0100
Message-ID: <179191112050.1981689.18384332389486467892.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916-aarch64-clear-pages-c-v2-1-0393769f7912@kernel.org>
References: <20260916-aarch64-clear-pages-c-v2-1-0393769f7912@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_180531_033277_7A5648BB 
X-CRM114-Status: UNSURE (   9.43  )
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

On Wed, 16 Sep 2026 12:03:56 +0200, Linus Walleij wrote:
> There is no need to try to second-guess the compiler when
> clearing memory. Just call memset() like everyone else.
> 
> Since memset() already has an architecture-local MOPS
> optimization, we do not need to do anything else to preserve
> the MOPS optimization.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: clear_page[s] using memset
      https://git.kernel.org/arm64/c/7fa0d9b2ec07

