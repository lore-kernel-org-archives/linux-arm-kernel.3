Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A2CC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U85I0+4wNOSGacaQS9fkT6Xhn7ekRJlDjzLJdB2UOOE=; b=u2Ey1TEG/aAEhG1b7ZLBrBwugx
	+qHlNTsF6/f7OjweiApxdrMyfTpZ/ULPNlycPSLRnsZTPUMVJp/GOAjscAdp0o5NnZQpFtddgSxlT
	qMa56WqyXCEuN2xoDMgvR3tNObQwFXwDndt2elXCzQCr+vL5tcH6ZoDqNE4OxhTUH1a8tv1jUHDKn
	Z6P5mN9QQpY/eH537pRlX75ZbpfJPWH1JnK7j0lFB7o//XO5r/xuyWCQ/reLnayoIG2m9RLApPLoV
	MLMLMc9pJIrkPQBIPBtQYopZvQPMP6ZiK5Ukd/NG+La+iTnl18hbBgfncXYTdJYHh/KZzwETaJUap
	qOPXkZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Xhj-0000000EMgc-3BfI;
	Fri, 18 Sep 2026 12:28:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XhY-0000000EMdc-2CjE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:28:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CA9641AB3;
	Fri, 18 Sep 2026 12:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94F41F0089B;
	Fri, 18 Sep 2026 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734504;
	bh=U85I0+4wNOSGacaQS9fkT6Xhn7ekRJlDjzLJdB2UOOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EthI15cgtSIZ1jSy/TAl/GNPqI4psYUk9weO3zc8EdTH8cn/6LopsmWvoZq2Sietz
	 blOikGFtyxynFn0f4+4KCuFTdOeWYnuff0kKn5bUb/QsuZqdBXM80hHH+Ll8l3SADz
	 XI7HUGQO22IMSzbDktFr/F3nozN6zX4KRkUdz8WYEqL5tXqaUdEXOCerzJ7h/91bk+
	 KA1x1jiY81xTQiLZtBk5oEK6ZotNev9M9d7fJ4byCN4btdohVRn3L5vivZWbf952Qz
	 VwOySqqIbZ1NdR2TuA+nQeOQQR27D9LS3dwpSiFzQQCslVswQxy+9G5dOoOgoff9jp
	 IvZvMUFCU2gCw==
From: Will Deacon <will@kernel.org>
To: anshuman.khandual@arm.com,
	gshan@redhat.com,
	catalin.marinas@arm.com,
	suzuki.poulose@arm.com,
	Zeng Heng <zengheng@huaweicloud.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	zengheng4@huawei.com,
	linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: io: Reject non-user protection in ioremap_prot()
Date: Fri, 18 Sep 2026 13:28:08 +0100
Message-ID: <178972997621.2320119.5986862527529026747.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911015859.71164-1-zengheng@huaweicloud.com>
References: <20260911015859.71164-1-zengheng@huaweicloud.com>
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

On Fri, 11 Sep 2026 09:58:59 +0800, Zeng Heng wrote:
> Mapping a stack-top page via /dev/mem with PROT_NONE and then
> reading that process's /proc/<pid>/cmdline triggers a spurious WARN
> in ioremap_prot() through generic_access_phys():
> 
>   WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>   Call trace:
>     generic_access_phys+0x1c8/0x228 (P)
>     __access_remote_vm+0x2b4/0x398
>     access_remote_vm+0x14/0x30
>     get_mm_cmdline+0xf8/0x2a0
>     proc_pid_cmdline_read+0x68/0x120
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: io: Reject non-user protection in ioremap_prot()
      https://git.kernel.org/arm64/c/bb756b11ad63

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

