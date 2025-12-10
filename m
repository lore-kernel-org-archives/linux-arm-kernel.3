Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E8D3C920
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1ayr3DLw+QKALAud4vAcgvs5VlbG4pKmYHj/ve96Og=; b=VJvEOwMOhQw0nuzpcMBPC1NVep
	JgjJSo66fGc/s9UOeeN/Q5proeRK1Iq0088DaKxBagUA6V04GZeoOqeRhEiRt8a8DK+OK+gy5axPo
	WpegcABWOo+6AcTAZjNxNLY0x/J4Q1MrDfIO7BeRitpzSeAPeqbkvlmw/FE41ljhTzpH2cWKqvbpE
	GHlLbxuuJh4/wlBk4p8grHY8KVabQ4Y7jP5UV4/VIytaoSM3eD9jnxT+YiH8IrmBN5Csr+fjUfqfD
	pITKd+b4XEwH5nyStkOBTGLAqW0ugiqjM+ZSwwxOF23YYeRlReumlrV9Cv/v9z06HmmVwpjNj35VG
	RLLNj6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLr6-0000000FXr3-2JDc;
	Wed, 10 Dec 2025 15:11:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLr3-0000000FXqJ-0EOC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 15:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B1ayr3DLw+QKALAud4vAcgvs5VlbG4pKmYHj/ve96Og=; b=h9gs8jq2KVKEwiF6UniargAP+Q
	9O+q6HZLXYQNjlCwpQ32cSsjImQ9LBvF4dU1BwHbS6wXdAJOMAGjHQogvQZO0Fhgaj+FbL9M6Q3wU
	dQQN5DVHpqFjyaWpTK3vU/arbYmXyiOSet3y7NKWu6F3z1PJq+UHPzPv6l9iZ56p8Wy3CWRM6Iltk
	hfmBdBoBOdNLdT1CD+0e3LHWgU5Nz/yw8+ekSyagbwglUKWiWAivn5O7X7L6BQN7PzWvDNolo9VkM
	rYs0Xk2QUPRNK4ZOyQ5ahra9O4N8PkSJSAYug5edeXZh6arQxUTKgPgYK1BmrWbK9MGd46P2lYNp7
	k3/UGE1g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50020)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vTLqw-000000001mC-2OVC;
	Wed, 10 Dec 2025 15:11:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vTLqu-0000000073K-3Wwc;
	Wed, 10 Dec 2025 15:11:40 +0000
Date: Wed, 10 Dec 2025 15:11:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>, torvalds@linux-foundation.org
Cc: linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk,
	will@kernel.org
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Message-ID: <aTmNrPVmd7sG7J8s@shell.armlinux.org.uk>
References: <20251209085627.64057-1-xieyuanbin1@huawei.com>
 <20251210090836.60465-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210090836.60465-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_071149_388142_65E58EA8 
X-CRM114-Status: GOOD (  14.11  )
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

On Wed, Dec 10, 2025 at 05:08:36PM +0800, Xie Yuanbin wrote:
> Hi, Russell!
> 
> The syzkaller test has been running for 19+ hours now, and no issues
> have been found so far. So to patch3:
> 
> Tested-by: Xie Yuanbin <xieyuanbin1@huawei.com>
> 
> This test will continue to run. If any issues are found, I will email
> you. If I don't send any emails, then there are no issues. :)

Thanks. I've updated the three patches, and pushed out the updated
tree. See the top four commits:

https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git/log/?h=fixes

Given the timings, I doubt that linux-next will pick this up before
I need to send Linus a pull request before going on vacation for the
remainder of this year:

https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git/log/?h=for-linus

However, I also can't guarantee that I'll be able to look at mainline
at the start of next year due to other pressures - and I don't yet
know for how long that's likely to be at the moment.

So, it's either a pull request for the for-linus tag later today,
at some point next year likely not before mid-January and splitting
it up into fixes (for -rc) and the two PREEMPT_RT non-fix patches (for
the next merge window.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

