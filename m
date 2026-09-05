Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEB1C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGtVfsD+Idm0Rru8q8gaU08QlFQGRmR/5Ipf/gp+BbE=; b=ll9CcPDaq82K0U9zZ/Iezasykp
	OrPBCLazwzS7QP3uiR3ZgKgXYdVt2VCQZCtVng7vKnHd+1KcxFljBgVNOGNJbsLmoIM7tVisUNLy9
	tZbluJtHAEeVLFAgDmGQWGmg/X201IFRUYdd5DhSgB7LHeKOSNbmbZltqxjtw1EgLmUfiS1L8c25d
	Wvhu53NEgM/dNdF5nttDHXlpPy2gyY0RdNrU6cGNvM+j3c4ORgSDr5HUR6Tbqp3jnE6UDLg5osGjL
	7is5rLxMsDgR+HCFpqJ6B7tGuCHTc8CnlWkk0c8rzAcnjiq74+uEpLVxRoU56PGhYjmwdx+bQ5CMh
	zWmh5u4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sQz-00000004DWo-27Ky;
	Sat, 05 Sep 2026 15:36:01 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sQv-00000004DVJ-3eB1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=BG
	tVfsD+Idm0Rru8q8gaU08QlFQGRmR/5Ipf/gp+BbE=; b=n1HFzLaD/Mr3yToOrQ
	jwQOj7VG8257/rB70mvnwEH/keRu2+VoPsTMJedavH49zScoRTtz/IjzTyboAHHL
	VrMpeZ+eHc4PDw2J+GatHJsoPPS8f+qnqURcYOI1vFMBh4TEztNCMPXczxXoK3FX
	/TBn1iDsHFSD0zBJBgm8y58j0=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBn8j+dNpxqczV5Aw--.37655S2;
	Sat, 05 Sep 2026 23:35:10 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: andrew@lunn.ch
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dinghui1111@163.com,
	dinghui@lixiang.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	liuxuanjun@lixiang.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com
Subject: Re:Re: [PATCH] net: stmmac: fix NULL pointer dereference in tx/rx resource cleanup
Date: Sat,  5 Sep 2026 23:34:53 +0800
Message-Id: <20260905153453.1648537-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3fd3506f-f254-4bff-a7ee-1063bf413919@lunn.ch>
References: <3fd3506f-f254-4bff-a7ee-1063bf413919@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBn8j+dNpxqczV5Aw--.37655S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4DAF4kCr1Utw1UXw4kCrg_yoW8Gry5p3
	yIva1qk390g3y8Zr47Xw45Xa1SkanakrWUXr1S9rZF9anxWF95tFWjqr1UWryUJryruw40
	vr4Uua97AFWDZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiYFdUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0g56pmqcNq7OUAAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083558_410666_31445E3C 
X-CRM114-Status: GOOD (  11.13  )
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

At 2026-08-30 22:06:16, "Andrew Lunn" <andrew@lunn.ch> wrote:
>On Sun, Aug 30, 2026 at 12:06:08PM +0800, Ding Hui wrote:
>> From: Ding Hui <dinghui@lixiang.com>
>> 
>> The DMA descriptor ring allocation in __init_dma_rx_desc_rings() and
>> __alloc_dma_tx_desc_resources() is split into multiple steps, each of
>> which may fail and return early while the per-queue cleanup paths still
>> call the free helpers for the partially-initialized queue.
>
>"and return early", is the real problem here. When a function returns
>an error, it should first undo what it has done, up to the point of
>the error.
>
>Rather than add extra NULL checks, please work on
>__init_dma_rx_desc_rings() and __alloc_dma_tx_desc_resources() and
>make them cleanup on error.
>
>I would say the problem you are trying to fix does not bother anybody,
>so is not for stable. So i aim the patches for net-next.

Thanks for the review and the direction.
You are right. The proper fix is to make __alloc_dma_rx_desc_resources()
and __alloc_dma_tx_desc_resources() clean up their own allocations on
error, rather than relying on the callers to handle partially-initialized
state.
I've reworked the patch accordingly: each function now will undo what they
have done before they return error. I also kept the NULL checks in the free
helpers as a defensive measure.


