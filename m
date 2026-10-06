Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D54CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 22:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCuQaoXj0hcWw23Lh2oI//3+ZLscBQiubkOExb+nDsc=; b=TiEht2LEK/y0Hg4LnO5PNwM8lv
	HBP3WFkhWRnS0X7zBXjxRwyIw+7D7aWyU0TXZtM1+SghuXWMnZqznfj0Ij8+kKv0mKMVTy6R1UfQw
	WDml6BLlfL9vMdFAz6vnksjdabt67eT5BuYdNGiKgjV8SKlBE+IDSkmt3I+LeyeRqwJNNR6e7Qa45
	hsHgnKbGc9SDf7QhaTeS1rtPI7G6UlcuuZ6i3OXXzxUlegtQkjal8+vLKq98C/Zh3WtqPZDWN8tFs
	X3LyY6A3t8UTemRm752efycB7P/qmbMqta2sazx9v5m4+p59sdxXNuADoMmzf1PEkxsS5OVMjhukI
	QkVZvZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEE52-00000001TI3-2PSJ;
	Tue, 06 Oct 2026 22:56:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEE4v-00000001THa-2jpM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 22:56:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 065872F;
	Tue,  6 Oct 2026 15:56:04 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF9E03F86F;
	Tue,  6 Oct 2026 15:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791327367; bh=7UBz5hm4+Ztn+y6F1mrEQVJwXm2+jD7d0OgQGQel3M8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vie5/HRmRA7/bz1eVq6A8FpUOLkGx7RZCPjAi/sam0LddUZSWyN4eDFryxqzKTmbu
	 QpXtBAzHViyWNBe86qrVv1W86tePrHZGPsdU6IR4byDvf3sO98OW66uvGeAeiG+xVn
	 qZFJHpwjhxlc/yCO/pEu959K1pttkZElAO+X3T40=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Bill Roberts <bill.roberts@foss.arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Extend gcs-locking to cover cases where enable is unlocked
Date: Tue,  6 Oct 2026 23:56:00 +0100
Message-ID: <179132735991.1339931.2590712297330967589.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901-arm64-test-gcs-locking-no-enable-v1-1-8335dacb1587@kernel.org>
References: <20260901-arm64-test-gcs-locking-no-enable-v1-1-8335dacb1587@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_155609_755239_3B3BDB36 
X-CRM114-Status: GOOD (  10.85  )
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

On Tue, 01 Sep 2026 18:27:06 +0100, Mark Brown wrote:
> The gcs-locking test case currently only covers locking combinations of
> the various flags that can be set for GCS (enable, write and push) where
> enable is included in the locked bits. Since it is valid to only lock a
> combination of write and push while leaving enable user controllable we
> should also cover those cases, add coverage for them. The new cases pass
> as expected.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Extend gcs-locking to cover cases where enable is unlocked
      https://git.kernel.org/arm64/c/a3fcb14f5673

