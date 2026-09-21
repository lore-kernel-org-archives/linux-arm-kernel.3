Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AA6C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku06OYHQ0i3UHM7d11/TJ5MF/OpW3Y5sNIIiJVQbWRU=; b=QoU+GOFOJmm40FK23oldpAZuEn
	vUZv6B+Y5cXPs+DXcOS52CKHld38IT678yQDrY0c/1F3NbG+9gzic3n4yTX5OzyOxIvfguoBCmwGE
	IUMH3muGlY6L0XPCZbGxBJSZeegu5DO7whDdsrvEmA/9xQh7MyXzFCuwjRZdlA4em0aoY6NDeMwze
	GhsCgulGw/fO8d3rZd3kwBYPasf0PYdVP0c9aQCZk6w6F+v7cDxRUcjB8KXVPwOnQI3llS3jmQKkf
	emPLWsqWU7YqfDKgj4NNQVuloUR8Fi8oHAfFWgM6w1lKzqlIKYW3ZD3oVDR11dIk5rC/WBiro6+aF
	oW8YVT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cof-000000020Qs-10L2;
	Mon, 21 Sep 2026 12:08:15 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cob-000000020Q7-3VnC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:08:11 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e9430321;
	Mon, 21 Sep 2026 20:08:06 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	KyongHo Cho <pullip.cho@samsung.com>,
	Kukjin Kim <kgene.kim@samsung.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] iommu/exynos: Initialize lock before requesting IRQ
Date: Mon, 21 Sep 2026 20:07:59 +0800
Message-Id: <20260921120759.95145-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901130527.3289245-1-runyu.xiao@seu.edu.cn>
References: <20260901130527.3289245-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0c3ddc50203a1kunm056564654b610
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGB1OVkhCGk0aGkodHUhCGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=fSLvIY3b+pMqf48ssjiitMaCS85rfR+3iQwB7WmtsUnawpdMvp+WRomez24HSn+ve6wTqQ0gP/7EHc7+HLflgHmJsTIpY181+yHuNZEmez7mOGcQ8zJewy8WQC/LrOJaOQgdKOyatgEAN1lowfau04qYgRHyhmIZTGeWSSy7V5I=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=ku06OYHQ0i3UHM7d11/TJ5MF/OpW3Y5sNIIiJVQbWRU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_050810_067600_020CDD31 
X-CRM114-Status: UNSURE (   7.51  )
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

Hello Robin and Marek,

Thanks for the reviews.

I agree that the current patch is incomplete. The interrupt handler does
not only access data->lock; it also depends on the clocks, variant data,
device pointers, and the SYSMMU hardware state, which are not fully
initialized at the current devm_request_irq() point.

Moving only spin_lock_init() before devm_request_irq() therefore does not
make the handler safe. I will withdraw this patch and will not send a v2
of the current change.

If this issue is pursued further, I will review the complete probe ordering
and the SYSMMU hardware disable/reset sequence before preparing a new patch.

Please disregard the submitted patch.

Regards,
Runyu

