Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD982CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeSu5vXHqb71o22YIPhuKqfuuWJdDM3QspOOXY1c9ps=; b=Juc02Hbnx3/COjBpYqDBIcu2Jq
	Z9tMc8Ysk2nloBYkLuAv81sIlKTonQ+Z9hTrw0t/RCbJ/b+n4V8NB6M5HAqPN3DQk0vlqCUKJDkDt
	WVnX1Y2lbSa/lpKAqVxbPUeyaAT5IE9wy2ykDrMRZpbLtEJMgv+lTb0J3id7fe0UkKTkxqpyl7aaE
	OQgwfPbjdBRHRHAJjpW91vlkrYFG7ly7rxyvU24bSFotZOC8BoWhh4GVEE0zZKAm7UWptvk9W/VWx
	ZfYpB93XBlHhuwt/TJ+DjxpazwqiV40DGALK65ZDlxkPNPHFVJRLtU2tEH/2wXoYVk9lnmqltQcnr
	D6mjhd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNl-0000000AS7v-3eL2;
	Mon, 22 Sep 2025 13:15:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNk-0000000AS77-0UWu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61C6B601B5;
	Mon, 22 Sep 2025 13:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28763C4CEF7;
	Mon, 22 Sep 2025 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758546903;
	bh=qjcfXLp3AdjFsxFqfhoPlQvU2ruch20geThD74U3Oxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQXzfxqEBkXsvV/5O9r23tMytKaOJxHZ9tJbVyrTZa6N5VhughdZFdPTfLTeQR2Vs
	 mXhVeMM69afE1M9rFlpV/6JZ0b1zGkkwNSkka2Zbeb1JBh+uht96wXvy9XHO40BtRO
	 /6H0yOn1KngO7a5PTnPJxFw9eo5z7n2Zx7XEHZITNi8uxBOaivePpwP5cO49JGFmQ2
	 NemIirxWtiqPKZ1qmkQQvSte2vlGwdMHhex887ZISrpRc6BIaIP1WIX4PEe6y4GJTX
	 9VYUZCwr6nTKjvbz1iwhCs/c35Xxni1B14bN+9DkEPjwHAzxe2hzKDiTYAZZVz6viY
	 v+7UUtRFx/aUA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Dev Jain <dev.jain@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com,
	kevin.brodsky@arm.com,
	yangyicong@hisilicon.com,
	joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	mark.rutland@arm.com,
	urezki@gmail.com,
	jthoughton@google.com
Subject: Re: [PATCH v6] arm64: Enable vmalloc-huge with ptdump
Date: Mon, 22 Sep 2025 14:14:46 +0100
Message-Id: <175853832495.3123711.10100627692023962115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250922064126.63016-1-dev.jain@arm.com>
References: <20250922064126.63016-1-dev.jain@arm.com>
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

On Mon, 22 Sep 2025 12:11:26 +0530, Dev Jain wrote:
> Our goal is to move towards enabling vmalloc-huge by default on arm64 so
> as to reduce TLB pressure. Therefore, we need a way to analyze the portion
> of block mappings in vmalloc space we can get on a production system; this
> can be done through ptdump, but currently we disable vmalloc-huge if
> CONFIG_PTDUMP_DEBUGFS is on. The reason is that lazy freeing of kernel
> pagetables via vmap_try_huge_pxd() may race with ptdump, so ptdump
> may dereference a bogus address.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: Enable vmalloc-huge with ptdump
      https://git.kernel.org/arm64/c/fa93b45fd397

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

