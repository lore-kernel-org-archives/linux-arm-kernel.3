Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4448E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvT4Ol6LWgtQGudtR8JS5Kiqa3g5hVBenlZHdPhwQQQ=; b=n5wBLszIhFjJl3gFVAd9MkBkSg
	ZGkPzfw2yLADSAMKR0x3EN3Xqu2fp9OOc8qiSd55GGpT1czEVQDTdbi7CoSWk/i5/gfAoeodUnlC2
	t826EF4cM7EnYC1p2Q7fnbYTopphRKp5ieiGxj1KECoE/hvCpl+0FT615r2pb5LCohqNZRVb9ZukL
	O6qMWzXihx6pgbrf92QMU0MFIvq943PaP2K4ot8TUurPCQHGpLFcpS65OSqvTRRYw6E10X02EukwV
	B16IxyVOVnJVXeQVzt28WVIPKacCDQdqJFPWzm8xsIfm8XP1RS5emiTYbtpMFy821DA9XyVfumJdh
	u2/Ko5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZLg-00000009HHL-05QB;
	Wed, 08 Jan 2025 16:56:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ5F-00000009DEv-3RbS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:39:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 476925C0EFA;
	Wed,  8 Jan 2025 16:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416E7C4CED3;
	Wed,  8 Jan 2025 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736354345;
	bh=nTSyBvaMVjZf52BGKN+460afWPfPdOp76qHxnO5KwHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fc4ubRi/TWYlxlcFHtwMt5gAp4ge5V+dbb4w4ZYGLihjO/+LMdfP+38zHJc9ev5om
	 PqGWcMYd577Kv7yl53NczQRoOXG1xDt5OW2TRjX/4JHNyRn3dhhNACTJajN5NcK8I3
	 T0HHL5/MW2ZSkXckgOhR7YwLW4UuQYYMDa0cOysjQH0DXUwH+Y2cRuogvSzoCw2u2I
	 gsgqnomZCv1KixRddaSUx3j4k6lbvQJTfBszbQKu+rF2ThBCYb9Tn4fkINM/a0Ph8t
	 7YDvmNLGWFkJI+YdTguu2HRAgfqYAFZ3SohXV8bbaO+5oCZkJ1hBWKnPZxJciOp8oW
	 ENIj8acUg06XA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Replace open encodings with PXD_TABLE_BIT
Date: Wed,  8 Jan 2025 16:38:51 +0000
Message-Id: <173626846561.286210.8659662596503724045.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250107015529.798319-1-anshuman.khandual@arm.com>
References: <20250107015529.798319-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_083905_903164_3E7D5BD5 
X-CRM114-Status: UNSURE (   6.55  )
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

On Tue, 07 Jan 2025 07:25:29 +0530, Anshuman Khandual wrote:
> [pgd|p4d]_bad() helpers have open encodings for their respective table bits
> which can be replaced with corresponding macros. This makes things clearer,
> thus improving their readability as well.
> 
> 

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/mm: Replace open encodings with PXD_TABLE_BIT
      https://git.kernel.org/arm64/c/fe2169f556a1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

