Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C5C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilKX7Il+DunehSs0PgYZ+c0ZXQPXZ0OuFyKYyrPOm7c=; b=eZMkfCP67U9nC5buOoF/kC5rsh
	FjnyW2YFLWD8uvR5Dt4ALMBLOEnumyE3zfyKIQujJMPYVifeX2xszT6pg2RrJOktUJl62MnJ6Oz+h
	FVqd9NSlhb+2xyvi/xVLQE7w3hfV7x3Y0riH9/p1BTUi1gUp1SHcOrRPOnQ50MWzEUumo8fL237aG
	XX84sqIvvLBdeCMb/qIIVpk4jk0w/8Pj7gt/DfZv90+B7kkAzJ1aNGZ6jVVuR0fxCxDFTJO6HiMWb
	47MeU2l5L10y0voT3+k6656qtUTsaaea2cFyE+T6wAAkGXyHham0EzX8VztYpTnG33rEYd66QvLvm
	t3CON4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBA9r-00000003lAt-2USF;
	Sat, 03 May 2025 10:31:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9uv-00000003jyV-1fba
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 10:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E49F44A047;
	Sat,  3 May 2025 10:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE61C4CEE3;
	Sat,  3 May 2025 10:16:14 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	broonie@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	ardb@kernel.org,
	ryan.roberts@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
Date: Sat,  3 May 2025 11:16:12 +0100
Message-Id: <174626735218.2189871.10298017577558632540.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502180412.3774883-1-yeoreum.yun@arm.com>
References: <20250502180412.3774883-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_031621_466536_F8C5CD0A 
X-CRM114-Status: UNSURE (   8.46  )
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

On Fri, 02 May 2025 19:04:12 +0100, Yeoreum Yun wrote:
> create_init_idmap() could be called before .bss section initialization
> which is done in early_map_kernel().
> Therefore, data/test_prot could be set incorrectly by PTE_MAYBE_NG macro.
> 
> PTE_MAYBE_NG macro set NG bit according to value of "arm64_use_ng_mappings".
> and this variable places in .bss section.
> 
> [...]

Applied to arm64 (for-next/fixes), with some slight tweaking of the
comment, thanks!

[1/1] arm64/cpufeature: annotate arm64_use_ng_mappings with ro_after_init to prevent wrong idmap generation
      https://git.kernel.org/arm64/c/12657bcd1835

-- 
Catalin


