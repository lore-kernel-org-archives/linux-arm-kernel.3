Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E52CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 19:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XW42vwKLChbNF71aOFGMawBS7Zlt0NIDDIyieH7+ks=; b=hi8EQQ7urh+Nop8GmCi0o1MBlP
	5mRLVUV1BBac2TpSZRJNusXSouBFFHG7yAM7QXXkqUcHSbFOv9Gs0KnyFXOvLXUVWGZARm8CxhC0B
	Nj7c/xWNasqAucNWFbbzspmL38uVmB/4CFbEpl39ksjNmMUYe9vtxnXkYmcOqnaRaIe1zbx5181Sp
	B0/01mL2UIgmC/iUrrWArP8Z2T5RoCVqFHCsXhfB+AD0PIdwd5kCC784wZy8ft4QZYoJft+r1zufi
	gHursLf2BNrt3Ja/0lKbiIXcpV5knrSkt8VpGWEgNA53qRt0KQ+WGQ4wScJPSKr5/B/izL26Ln0OP
	pQ8dGykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL49G-00000004gEt-0lEE;
	Thu, 07 May 2026 19:12:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL49C-00000004gBj-4BO7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 19:12:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D35F22C8;
	Thu,  7 May 2026 12:12:26 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0268F3F836;
	Thu,  7 May 2026 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778181151; bh=cfClvva1H8wBL+qP3cgiBoKoaQ1cmVKJ6MuppMVABH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iODh3OCri73q7byVsg4AbUqY2CtLPbsKOaBDmfkk1C8OlVXUZK0tdulBji57sKkFI
	 0MA8pNtnW5UtNQogvAHdTGvA3hqmIKrFx5curGjRiC/iRTKs9wRikxxVlrDBwVa0vN
	 jGWE8XnKHLx8E7d5KTkTMsFlJr+CqKkf6S+APyFU=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Junhao He <hejunhao3@h-partners.com>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michiel van Tol <michiel.vantol@arm.com>
Subject: Re: [PATCH] coresight: tmc: Fix overflow when calculating is bigger than 2GiB
Date: Thu,  7 May 2026 20:12:17 +0100
Message-ID: <177818106097.834828.15241493422637939738.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217-arm_coresight_fix_big_buffer_size-v1-1-774e893d8e3f@arm.com>
References: <20260217-arm_coresight_fix_big_buffer_size-v1-1-774e893d8e3f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_121235_358009_635A348C 
X-CRM114-Status: UNSURE (   6.79  )
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


On Tue, 17 Feb 2026 13:19:43 +0000, Leo Yan wrote:
> When specifying a 2GB AUX buffer, the ETR driver ends up allocating only
> a 1MB buffer instead:
> 
>   # echo 'file coresight-tmc-etr.c +p' > \
> 	/sys/kernel/debug/dynamic_debug/control
>   # perf record -e cs_etm/@tmc_etr0,timestamp=0/u -C 0 -m ,2G -- test
>   coresight tmc_etr0: allocated buffer of size 1024KB in mode 0
> 
> [...]

Applied, thanks!

[1/1] coresight: tmc: Fix overflow when calculating is bigger than 2GiB
      https://git.kernel.org/coresight/c/f195d54deef1

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

