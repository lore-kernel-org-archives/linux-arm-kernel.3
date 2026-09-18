Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CBBC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 00:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnfWuAdQvvp1HzGV0Vkr5bNv+6XkbSDVMVlrqnMPLBU=; b=pu4iHDgezFIDgh83mHwOjpx+QL
	4hc+jfP5Dj1GltWKVP1KB25MtE8jVJGakHP1SJpwps2cFJzBRK4ZVpCdPjwrI0dXp7P2dgVmQQ8AK
	9pscoaoEUTSLhm7/OLNrphjjMb0vqojYsyYfWbXf64gBLthCRWTZNNtxV9qblX4DH8o5X2J4v2+au
	wa5T6KgZ2nTIZNQXJD8YdXRwrmzVyUprGGMsrKTE5o2qMJlWh938TqPymZF7yCint5aUiUtvVkZ7C
	Iu1GgeUX44u4Df+SI70LyCjJOVZxRyJs7+wZDUza6Yxhf5cP/W1bgPOp2RcE2J+RRLJ7hxz9CL1hZ
	jgSri3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Mqb-0000000D4ta-40UD;
	Fri, 18 Sep 2026 00:53:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Mqa-0000000D4t3-3Imi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 00:53:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4098960232;
	Fri, 18 Sep 2026 00:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3DE1F00893;
	Fri, 18 Sep 2026 00:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789692780;
	bh=BnfWuAdQvvp1HzGV0Vkr5bNv+6XkbSDVMVlrqnMPLBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fq6AmyQKzJ4nDEDKCV+OOG5+kupo07SPrmu5jX9HhQiXoO5NJgyZrr1ltfeyrCk7t
	 gTzITKMctyskpyVTL6psIM5l5XTov30Z0P+/hduHN4LR3ZHIZHBxyifGRFMuw1IAo8
	 ALY+rzAWyqxzNjyFyyTcjstoLCq5hguLbwxyZelT3kS0xIrJTu6lunoR2PS6x5T+40
	 1vUEraxHwG76nZy5m6Ilhz/6+211jD76+/EYQz+WrqFajddvIxQn+OIF7affGvbxaY
	 WQYn5J2x8pKmOJ59qA48FhGZi8dcOSxfI4aWBB2HaFF66hI7Wrf2YIHIM0Gu2jHa3B
	 atgKKtbBNewNQ==
From: Sasha Levin <sashal@kernel.org>
To: gregkh@linuxfoundation.org,
	linux@armlinux.org.uk,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	rmk+kernel@armlinux.org.uk,
	linusw@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	arnd@arndb.de,
	xiqi2@huawei.com,
	ljs@kernel.org,
	wozizhi@huaweicloud.com
Cc: Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org,
	patches@lists.linux.dev,
	lisongze2@huawei.com,
	wangbing6@huawei.com,
	Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: Re: [PATCH v2 5.10.y/5.15.y 0/3] ARM: fix might_sleep() WARNING for mmap_write_lock() around show_pte()
Date: Thu, 17 Sep 2026 20:52:36 -0400
Message-ID: <2026-09-17-daily-reply-0009-arm-show-pte-faults@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917023056.2280-1-xieyuanbin1@huawei.com>
References: <20260917023056.2280-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
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

> This series backports all these upstream patches into the linux-5.10.y:
> 1. commit 7733bc7d299d682f2723 ("ARM: fix hash_name() fault")
> 2. commit fd2dee1c6e2256f726ba ("ARM: fix branch predictor hardening")
> 3. commit 59e4f3b45b96a24fc9b7 ("ARM: ensure interrupts are enabled in
>    __do_user_fault()")

Queued the series for 5.15 and 5.10, thanks.

-- 
Thanks,
Sasha

