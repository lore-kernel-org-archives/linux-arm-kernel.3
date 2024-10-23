Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A08FCFA454
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kncYPndLsOelGMKlqwwHadUC14z02CrvmGuS/zxDlYo=; b=hxKVCpJ2cDt+/1HliUi080rmKq
	EeppOSysTLkP/yY+EgCabmhVblAwTBuf545uyJ7/2pawUxckHHbsHU7r+EvGsm8qEH4iTksQT0i76
	yVKKmzPghdEMJt4wqc9eLfkDIZnGFud6W1f1hrYwTmLyvi9R+E4gGBdZDi110fvG8Jfb2kh95jJsh
	7aJYUQgpWLgxkwLsqcdCM3JtQzcpbSnAF7SXqpMSayrsxQthjzqzhQMMqvAGvdgAQq/WWK8pwTD8s
	mW1xLFZlB1II4C4NgOoncLn/7N8u1u4q0vXc0Muzi73t4tAMOuZfnuHHZhlfCSBsUyraiZLYNzLVj
	09Bm+sCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ehN-0000000FGE1-3qTN;
	Wed, 23 Oct 2024 16:59:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e75-0000000F7Rk-0INw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:21:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 219A3A40452;
	Wed, 23 Oct 2024 16:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC75C4CEC6;
	Wed, 23 Oct 2024 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700493;
	bh=SJf+SzaQdUp/t2YICO2dXnoEsqXbu2mEmbegDmqm+Po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Aive14dZEVSXp+quEqJR36tZFU5ivEkQtiWAJ9Z0lsiZgjDw65Tg4EDqsnTTHr2Y5
	 MV9Ll10CqlkBwQJc8NDqN4l8mkW1pchaZZcx3j6rZzXWnLY9EqZZkk7/qQC7SQeFy9
	 lNWf6X2z+FKSzPOJe3d6frWoyu+x2Gt7SU3sUTlu2GjibBnZm7ccx7loKa6tKcou3d
	 9X83H8k2mBZg/M2MnE910SM9ruX1s+4zQFZrFW8wQqK7gmFO2x6v7iinAkR4wJSmnh
	 Ebm4umRzQmtxcwhxHTygrva0CJlHiQfJsdbfur3HyMplzSkwR/dilm5g2DkJ2Yd5ph
	 MfqX3Se6QSkBQ==
From: Will Deacon <will@kernel.org>
To: james.morse@arm.com,
	pierre.gondois@arm.com,
	Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	xiexiuqi@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_sdei: Fix the input parameter of cpuhp_remove_state()
Date: Wed, 23 Oct 2024 17:21:22 +0100
Message-Id: <172969674372.1724035.9964143354565371028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241016084740.183353-1-wangxiongfeng2@huawei.com>
References: <20241016084740.183353-1-wangxiongfeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_092135_396675_9A3BB1DF 
X-CRM114-Status: UNSURE (   6.98  )
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

On Wed, 16 Oct 2024 16:47:40 +0800, Xiongfeng Wang wrote:
> In sdei_device_freeze(), the input parameter of cpuhp_remove_state() is
> passed as 'sdei_entry_point' by mistake. Change it to 'sdei_hp_state'.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] firmware: arm_sdei: Fix the input parameter of cpuhp_remove_state()
      https://git.kernel.org/arm64/c/c83212d79be2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

