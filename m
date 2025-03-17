Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF982C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVH7FeVXKprlJ0xYMb/25S89U+AvjSzEC3hvL+P42DE=; b=1Oc+y3fHAO9gzVb5J9SpIu40ms
	fwxMGn536fHsa+v6eejPhNBe3O7o8da5i9oK5Nkb0luRgLxzlG9ycv3da2ev63mXALQabcbDFb46U
	ZMphn/umqR3ONfPsfrmnVb83q/4tHZBkC1uoP2L6Cm3S9vuPnsQ5Sd1Jdi0UTRE7gdPjJSnkFiqS2
	RAgqnSTd33DOBBJJAJOVSHIACFQRRsjY6h2nHHGZKt4x7avZ2l5eTJICyrlqcBkp8BzoNF/Lgo7BH
	bqEtnOtsWLjVXn9aDTcoplbBofr/EggTYVxxG0fee32s41+rS+lmj+I7GoPoQAXqFHQrCjWZZfZ+T
	LKZeIGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCJb-000000038Sq-0UDS;
	Mon, 17 Mar 2025 15:23:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCH6-000000037lV-2GYq;
	Mon, 17 Mar 2025 15:21:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E992A5C1850;
	Mon, 17 Mar 2025 15:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550E8C4CEE3;
	Mon, 17 Mar 2025 15:21:07 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 454A918082B; Mon, 17 Mar 2025 16:21:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: sre@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Chen Ni <nichen@iscas.ac.cn>
In-Reply-To: <20250312073729.1430053-1-nichen@iscas.ac.cn>
References: <20250312073729.1430053-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] power: supply: mt6370: Remove redundant
 'flush_workqueue()' calls
Message-Id: <174222486427.175368.2927346420371391237.b4-ty@collabora.com>
Date: Mon, 17 Mar 2025 16:21:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_082108_695575_2AAE2824 
X-CRM114-Status: UNSURE (   6.44  )
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


On Wed, 12 Mar 2025 15:37:29 +0800, Chen Ni wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> [...]

Applied, thanks!

[1/1] power: supply: mt6370: Remove redundant 'flush_workqueue()' calls
      commit: 0b8d073f6c66d7110ac9fab1f13a09337e03f1b6

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


