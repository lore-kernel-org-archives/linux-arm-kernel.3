Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8319CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EvQjw+wWOIIOHZmFhG/4lQ3ETvY/zjgD1sqcMFevPY=; b=rbcEKoz3/sPs2G8yl2IY5THhU+
	rWWfU38dLdO9CzOKFavqDysyMJ/lPaCJqqE1khvEfuvLK639bJ6fZG0YkMlea1mTJFOSplq13pABE
	xxHd1Cv0ZkKFgFggthzKKEgmLmzFlpGfnxRyWdj+l18QlSBvLubEhAv2geSdbiCyZhZ6ClHHZD5yn
	zUB42hgiSpQ5rXJ1j8JE/wVE3SmLGXZFJfPBCrAkxNHzUbt1a8uG9uN0uVlmnAa+1OE20gBtY3nWn
	giluQ4R8eTx0yFGi9Hk2W//gVDzX2A45g2aGU6XqRm7J7gVJlq1i6pApvT+3wpsb5IKamYFPJnZvO
	GJXH0lvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs36-00000005aoc-2M8s;
	Mon, 17 Aug 2026 07:46:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs35-00000005aoV-1YFa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:46:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94955600AE;
	Mon, 17 Aug 2026 07:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB881F00A3A;
	Mon, 17 Aug 2026 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786952782;
	bh=3EvQjw+wWOIIOHZmFhG/4lQ3ETvY/zjgD1sqcMFevPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h5cCwZFmSnkWiyzty/pQ12jW/TPWRirRxWX7/AqR4M/Bd8/2MGjtBpiRoaydQzrDZ
	 YDRANLlAaded4e8kMnryHktioBtFOSIVc9nge4YHvecM0NJCc3E9qI3IFXNx3Fku5I
	 i5fOR/CW2OQkK8qG7aCAMzOebUBGLdA60s/z0nM8DrfdBYP79+Ru4DTSyQBrJcMZHF
	 jLxOxE7McfjdHTrWR10YLKauf/24I86ywHia3dYN7QRnbJ4MTT5DsZVKJ/Tr/e+Xqh
	 +EblOYe12KIitI5JsIVa+DccMaeIOwZGDtdoFmJX597HWQsaCBgX9Bl2AA0n7YLpH1
	 r7gaj4Uvt/S3g==
Date: Mon, 17 Aug 2026 08:46:02 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Wei-Lin Chang <weilin.chang@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jintack Lim <jintack.lim@linaro.org>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Fix spurious warning for benign stage 2
 teardown race
Message-ID: <aoK7vLOD3oKKAxH0@lucifer>
References: <20260812-kvm-arm-nested-virt-fix-v1-0-4ad883f1b6a5@kernel.org>
 <20260812-kvm-arm-nested-virt-fix-v1-1-4ad883f1b6a5@kernel.org>
 <qfhlmmidzdmmsfopfhxpddgwa7nob45jwgb6sabskawaxtox7i@mnxplk3zn34k>
 <an3gqCJ1fzloWB_N@lucifer>
 <v3vgnteumpaxbgqjtfwoilcbwpwohfci3uwu4ooykls6zjwjwe@rukbigno2m5o>
 <an7Tk0qrCM84zS54@gremlin>
 <dlvicg2jykp4icqkpa7xjm6bmim7sbp7vventkzgoihzpombcc@pemvii5d6qfj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dlvicg2jykp4icqkpa7xjm6bmim7sbp7vventkzgoihzpombcc@pemvii5d6qfj>
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

On Mon, Aug 17, 2026 at 08:38:37AM +0800, Yao Yuan wrote:
> On Fri, Aug 14, 2026 at 09:48:39AM +0800, Lorenzo Stoakes (ARM) wrote:
> > OK so - I confused myself here :)
> >
> > The underlying issue here is that I am working back from a situation where
> > I can't quite recall what I did, but am rather reconstructing it based on
> > what was observed.
> >
> > And you're right - this stack makes no sense for an L2 VM being torn down,
> > rather only the L0 being torn down.
> >
> > So clearly this is what I did, and the correction should be to say this at
> > the start of the commit message.
>
> Ah I see.  I agree the race is there. Below is just an idea
> in my mind for reproducing this, hope this is helpful to you :-)
>
> migratepages (https://man7.org/linux/man-pages/man8/migratepages.8.html) can
> help to trigger the MMU notifier to qemu/kvmtool easily on 2P system, meanwhile
> kill the qemu/kvmtool on L0 to reprouduce the racing. For 1P system kernel has
> numa=fake parameter to generate more NUMAs there.
>

Ah nice thanks! There's also /proc/sys/vm/compact_memory so you can do:

$ echo 1 | sudo tee /proc/sys/vm/compact_memory

To trigger immediate memory compaction (and thus migration) also :)

--
Cheers, Lorenzo

