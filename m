Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8EBC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 21:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMTsipfeAR97oss5jjE0710Rzb8sAzf+X9WR3xZ2yEE=; b=R+n1IxTbsw0wiFEi9uFT25wCTw
	M0KIGQY4ZCMJj5UB1IMp4VSvAO1L0Eu56Rh3PYhu7lG4jhDyVqDGSkYLGRg+MRhhioZ7L49XZRKyN
	oEGoDLVmpehm8fcVwa2RU6sdTyDzuwB4HJEACIYF6h3wbFmJGX3BiktwnpQYRGlWagemDqOLjpelh
	mhjQGEE02w9XH5YDS30VYl6fkmwh6dgy2pKL4aKPIoyR7r+MBySs9ExAL4zicu5S6J/zYlKWfHLd8
	zyOVXXzQjTEaBdwhHLdgR7I0ChUhgf4vPlWaly6yCvoaSJ1GscGO/H04eqwZHZenOnql6sgNht2zU
	4JbeQXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxNN-00000005Gmi-0JNu;
	Tue, 11 Feb 2025 21:01:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxLw-00000005GcV-2eAD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 20:59:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EB1B5C562F;
	Tue, 11 Feb 2025 20:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273FBC4CEDD;
	Tue, 11 Feb 2025 20:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739307571;
	bh=h66F2MARKJ0K3tXXMQGR25Duc5c7sPuk3UNDeq/Ou5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFSP9mMdHCC0Y2sUcYf7y1ZEvCSndcc/DPH40qQQQTnxRICFJRta5wkMSrPg0/in8
	 SndLBNisIGQWlGC+hqEOA40YYSHmfbDKDiVW5a4y17C7krN7UAhaNtcG+/bfVZaQKW
	 r5tKxpq6p8IqRlLSdtJ9mjElyKEmXUWpXgW35sWJB1vO33vtU7SHpn1ohk/Lo2kFmo
	 coGmYguJUtd3bKrZ9abgURH+h0Etism6tpMrvS5VmNd9tBf3LHisTvkJe0jr7vn6Jr
	 wYcF+RML4QYk+098THoOYc6N5Ug7LoX+De/iYLSezd7F3DCn4QPhZaC7caNCzp16Sw
	 imdKM+NgKx0pw==
Date: Tue, 11 Feb 2025 10:59:30 -1000
From: Tejun Heo <tj@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: syzbot <syzbot+e13e654d315d4da1277c@syzkaller.appspotmail.com>,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	maz@kernel.org, mark.rutland@arm.com, richard.xnu.clark@gmail.com,
	jiangshanlai@gmail.com, marcel@holtmann.org,
	johan.hedberg@gmail.com, luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org
Subject: Re: [syzbot] [arm?] WARNING in delayed_work_timer_fn
Message-ID: <Z6u6MgaJWMpjCn4O@slm.duckdns.org>
References: <00000000000046efb605fec3def0@google.com>
 <675c28e0.050a0220.17d782.000d.GAE@google.com>
 <20250211111045.GA8885@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211111045.GA8885@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_125932_710085_1559271A 
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

On Tue, Feb 11, 2025 at 11:10:46AM +0000, Will Deacon wrote:
> Given that this seems to explode a few times a month, I wonder if it's
> worth adding some instrumentation to e.g. dump the name of the workqueue?

It's usually most useful to print out the work function when identifying the
culprit. I'd be happy to take the patch.

Thanks.

-- 
tejun

