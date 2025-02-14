Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ECEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSa2vJnbFjvC58Gr/g4XJj+QRJrHcejNnanjAJ5Ajbo=; b=VCqrShmMeJWv8Dqp9G3p36f7wO
	5SGc7FuM059SBrJN+loXFszgWMx0jkg601bnaYpYz/paVnYuf87862lWDt2pb6ZF9gOT2qF6O4BOo
	mVNvOmvX+HZGwnvHBlZRMXRolZVUongWipm2/iBFLUyTJ7qXURsobdi2cgZEANl7ccavuWQt3xoVq
	kqL9+lNVdAWzId4DyjdBV/UkhogCf/PHpmIxyCRBlpGiatgPooZ7nadnmoMXZ0JT3kQY/IJFrej1i
	sEbYo06ebiFBc/HC4RNbZHPR4PH2+tHKvOuE/o7zjGfScMbMABvGBKwM552R6PNfzozuC9FOy/qmb
	ixLJZjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyqz-0000000FZME-31BO;
	Fri, 14 Feb 2025 16:47:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiypI-0000000FYtu-3MrC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 16:46:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5D52A4322C;
	Fri, 14 Feb 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5187CC4CEE9;
	Fri, 14 Feb 2025 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739551563;
	bh=yCxxaLvR4UouW1wbpmBsL5nojd5dCMqZThqzSxI1LRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1JaPcdGKCf+5qYgIy7U8kI80cmFy8NR+Sm6WgU4QlOi/E60LNRfIwXnQDiCJ2NdW
	 RqSMPHnuaJb9m4+x7r+gRxJjcTA/OPgHsTYYJGZy1HhpqbF5bETwmijH8xng1MpFfg
	 4P5fXLlWGBnO9Lp+dXGF7Fb4XfA/ZMO0594y3Bn+M+Uh+xWWKkf2rnd5hkZo1kDJ3r
	 2LJja+YBYPOW4ynXEK88nAVaWMkIwvTxE8+fJws2MUR7yhwd8rbS/egk3Y2fLzePk+
	 TUvXIyxv/8JsRpm5FO+SL2ieCsFI2LCNc8LW83vDHEkI5ekv2Wdy6Y7GNO8klNRu9p
	 3rmy4qEbh7dlQ==
Date: Fri, 14 Feb 2025 16:45:57 +0000
From: Will Deacon <will@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: syzbot <syzbot+e13e654d315d4da1277c@syzkaller.appspotmail.com>,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	maz@kernel.org, mark.rutland@arm.com, richard.xnu.clark@gmail.com,
	jiangshanlai@gmail.com, marcel@holtmann.org,
	johan.hedberg@gmail.com, luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org
Subject: Re: [syzbot] [arm?] WARNING in delayed_work_timer_fn
Message-ID: <20250214164556.GA13743@willie-the-truck>
References: <00000000000046efb605fec3def0@google.com>
 <675c28e0.050a0220.17d782.000d.GAE@google.com>
 <20250211111045.GA8885@willie-the-truck>
 <Z6u6MgaJWMpjCn4O@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6u6MgaJWMpjCn4O@slm.duckdns.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_084604_906667_3AAE98CE 
X-CRM114-Status: GOOD (  11.40  )
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

On Tue, Feb 11, 2025 at 10:59:30AM -1000, Tejun Heo wrote:
> On Tue, Feb 11, 2025 at 11:10:46AM +0000, Will Deacon wrote:
> > Given that this seems to explode a few times a month, I wonder if it's
> > worth adding some instrumentation to e.g. dump the name of the workqueue?
> 
> It's usually most useful to print out the work function when identifying the
> culprit. I'd be happy to take the patch.

Thanks, Tejun. I sent a patch adding some more diagnostics:

https://lore.kernel.org/r/20250214164349.13694-1-will@kernel.org

Will

