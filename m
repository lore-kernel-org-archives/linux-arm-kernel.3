Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13185CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9KkZzfP1kLG2HMgkFNClkewl28TK1t7uwDMPjFtuHg=; b=buJ3z8KFOCiRxphh4jHpQXslot
	BfwEp7IYep5d2AGWSX4kQ/96vnUyTzrJNBNpqGmORR/Hiw/bBCFhQ/nYQ1pPxzdZ7FDonI9y6jLH6
	j4Nci8PGbx4ZyFnp/nTzpB7Y0MIx8JWveTl9DhMunw8f3BRWV3ho5eVBdNN8/IJmZbRyfDdy1C8TR
	ZQPQcdxdVycR3yLQ7ivAJ1LHPgpVe2Qw7DPCBbWO9KEyFrwipSp1MPJ5KdUfDRNunNknRUtASMunN
	9MCCr8WX5GDACkPShoK7yv5b+yqsdugWXsFnJD4PTnhhFzljDXN4Z6CfsDXxNxrFf/HoRr5ewCZw3
	B2hMH+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd0D-0000000997h-2rbQ;
	Tue, 16 Sep 2025 21:14:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd0B-0000000995B-0ze9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC41243FE5;
	Tue, 16 Sep 2025 21:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC51C4CEEB;
	Tue, 16 Sep 2025 21:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758057254;
	bh=ZEX6epiYDS4/Irj1nhsUQcUfxGCRNCiyjKALsXvsM8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DAtbUKfwOJtwHY9Inm8sU+7/3dyYEgr0481WFZ5JSiVjt4/I+g8F/Kn2RK3sRoY2A
	 CRfLXiil0gr9O60TdrSaMX9lwMWDAIWZYWHa2lTPa7B+Vi049/RzylkHqlXUF8T9RE
	 ZqRXbsGPLBfL7xO4c7Jv+37uNfnDf5ZeadeM1RLEi+0W+0aGijhqBbhlqCPYoqJNdj
	 7+onD/uAtFZaHz0gRom30rU5it4jDyiGsJgyWgLXwpx2A+QYl7E3SZ4Ji3JEYnsj5q
	 V0YadLMsGhtO960hdQXShmdF4x92T2JuXJGr+K8aUMJn1qvPV4zJCFLve3Lt0GEBea
	 3Kt4YyInSviKg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64/fpsimd: simplify sme_setup()
Date: Tue, 16 Sep 2025 22:13:51 +0100
Message-Id: <175805314947.272606.2121581069783124442.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250913000906.67086-1-yury.norov@gmail.com>
References: <20250913000906.67086-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_141415_313532_DF1C499C 
X-CRM114-Status: UNSURE (   8.85  )
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

On Fri, 12 Sep 2025 20:09:05 -0400, Yury Norov (NVIDIA) wrote:
> The function checks info->vq_map for emptiness right before calling
> find_last_bit().
> 
> We can use the find_last_bit() output and save on bitmap_empty() call,
> which is O(N).
> 
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/fpsimd: simplify sme_setup()
      https://git.kernel.org/arm64/c/19dd484cd19c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

