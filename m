Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B628C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y//cetMFcwsuu3mwt9B6lLort87uZa7mrI7Bl61wKAE=; b=PfXmaBI1TljqMhBDa/S2INV8aX
	xRsQAs+QPwPm0h5Mij3bUk+NV7PD68G3IBjs2HJZ8Lih8b9u+GbXA3uv8elDB7X4/wSfO/sw6WthV
	15HbRk1USsg+2k7DPeG4MVbfvXi9KbXnA6aEn+YLLDTbNG3Zt3cKPRsPFgcCQNZnksO0tu0SK+V33
	BCa/pg0Cw2gFgU7ThXErNyQa2tiT87IoasCrbkIYJvxzsisdqo/BC/tkr1Glzq2VvHEfvGDOv8fyf
	E2U70Zxh9ll2EvQR0EJgf9JWJfCZHNA2OtuvjXS8PIKhi/OE5/T3Qhac/4CtDouzAdbxpZfvvR4mA
	//CDFymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkil-0000000FAIK-0PpK;
	Fri, 04 Jul 2025 18:01:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSf-0000000F8Az-3i2F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 407ED46A4C;
	Fri,  4 Jul 2025 17:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B72C4CEE3;
	Fri,  4 Jul 2025 17:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651073;
	bh=t8gZ0I2H2j7NE5/aw95KdzO89PPAZr+qiLvmu9O/e1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DgfzOjS0Sb/X4u3b/U6E+zKnhYCm/h2cO5zpn5tE6juDMQnWnqzHR7DjAJAiPRpUA
	 A7V4btQreHo7Nkxw1/bprfqaT6mkS+m0zQ48KVbCkPp+x2tWE0gbdHvjqHIiViZ95v
	 9B+1qEEfbUffHbvL6xdegFbiF7d9/Spvo1peQVpYSerGSeV9T0QRxQc9xLCOrZhVQ2
	 19cHxYjY3Qy8a74ej54rNp+mT1N99nglX7Zdp4BuaI1BxSJQB6FWx+C/PB60XKEPrf
	 ownSO63aiPgkXEpW8O21MiZ5/xlDER5vMB2xv8FFZDdN5CXMqnhAMt9yxVwdhLzaJ+
	 i3sRE/Ohuw8nQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't try to access GCS registers if arm64.nogcs is enabled
Date: Fri,  4 Jul 2025 18:44:11 +0100
Message-Id: <175164295299.1186581.5911372267444093930.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619-arm64-fix-nogcs-v1-1-febf2973672e@kernel.org>
References: <20250619-arm64-fix-nogcs-v1-1-febf2973672e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_104434_258038_A16CB05B 
X-CRM114-Status: GOOD (  12.87  )
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

On Thu, 19 Jun 2025 22:15:41 +0100, Mark Brown wrote:
> During EL2 setup if GCS is advertised in the ID registers we will reset the
> GCS control registers GCSCR_EL1 and GCSCRE0_EL1 to known values in order to
> ensure it is disabled. This is done without taking into account overrides
> supplied on the command line, meaning that if the user has configured
> arm64.nogcs we will still access these GCS specific registers. If this was
> done because EL3 does not enable GCS this results in traps to EL3 and a
> failed boot which is not what users would expect from having set that
> parameter.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/gcs: Don't try to access GCS registers if arm64.nogcs is enabled
      https://git.kernel.org/arm64/c/0d1c86b84096

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

