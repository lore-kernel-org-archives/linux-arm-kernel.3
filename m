Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBF3D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pslbipuyb311NpGDh7aABN2Ik4Dzwcn+Di9Zp7T7MRM=; b=tVfC6lM2hIg1YPbIHJHGh48H3j
	akm/5X3lJlg2Q13BSqLQdZnv+FG/Vvd4u2B9duRWIabZ2W1JvwWqVXX341RGSZn0/zrL0qYZY+lY5
	AWnNw8zPqotiYcY0buXZD9VB8V+5oaphdvxZmVixGcU5mqbZKnSb9X5G+q2YszQdWj4ikayQI8Fp6
	dCpqfxvdl7V45ZDnWhB6lksllVm5MQ6X/tgJbQn9WReZJttg9kNPEcDCo1PWe3Q2k+N4G9e1Izgjb
	MNo7xiVyk+js1ZWS52v6Ydb/HgPbyxggtsgNkXaqf932KqFHOvg6o+Q+NAJkOTemfZlLFSVULkLJR
	nX3SvOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdPX-0000000DFwr-2CsD;
	Mon, 08 Dec 2025 15:44:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdPS-0000000DFwQ-2V4z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 15:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Pslbipuyb311NpGDh7aABN2Ik4Dzwcn+Di9Zp7T7MRM=; b=mS/JIlOMRVTCrqARcmN1g+l1Ii
	wA+sPPH2au2vG9zqcNd5pB7ibNnRoOMQWQkqTMRYcWHEb/xUdQKKphUAl7gYU6K3/PXNYggILrKri
	or0Y1vEey+b4oOLJ2aEQDTMRMLfVfW7RPsU7WOUUflxo2AqiUfA/+xd530Ahi9e84dRQcVYFxXGJl
	D9esXo4AczKMywv4Y8YyosK9Vx6+OvNlj/MOOzpqrJlw7CcDm7yI945DKBQvlNMb6SjuCej6Iru5I
	WTpOwU86ufXTwC7Y5cC5Fjvtma5c4aitPp1NMpxEO3jNTpVX6p2ms9PgDO2NnWEbQ7tHz3WsAfffJ
	VPacYP6w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43242)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vSdP6-000000007uN-491j;
	Mon, 08 Dec 2025 15:44:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vSdP2-00000000591-3DmX;
	Mon, 08 Dec 2025 15:43:56 +0000
Date: Mon, 8 Dec 2025 15:43:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org, catalin.marinas@arm.com,
	hch@lst.de, jack@suse.com, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, pangliyuan1@huawei.com,
	torvalds@linux-foundation.org, viro@zeniv.linux.org.uk,
	wangkefeng.wang@huawei.com, will@kernel.org,
	wozizhi@huaweicloud.com, yangerkun@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <aTbyPNINxjzU3Lua@shell.armlinux.org.uk>
References: <aTajXdAVYh9qJI6B@shell.armlinux.org.uk>
 <20251208131842.76909-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208131842.76909-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_074422_637856_55157539 
X-CRM114-Status: GOOD (  23.60  )
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

On Mon, Dec 08, 2025 at 09:18:42PM +0800, Xie Yuanbin wrote:
> On Mon, 8 Dec 2025 10:07:25 +0000, Russell King wrote:
> > This isn't entirely fixed. A data abort for an alignment fault (thus
> > calling do_alignment()) will enable interrupts, and then may call
> > do_bad_area(). We can't short-circuit this path like we can with
> > do_page_fault() as alignment faults from userspace can be valid for
> > the vectors page - not that we should see them, but that doesn't mean
> > that there isn't something in userspace that does.
> 
> I had indeed been lacking in consideration regarding do_alignment()
> before, so thank you for reply. But, may I ask that, is there a scenario
> where user-mode access to kernel addresses causes an alignment fault
> (do_alignment())?

If you mean, won't permission errors be detected first, then no.
Alignment is one of the first things that is checked if alignment
faults are enabled.

So yes, if userspace attempts an unaigned load of a kernel address,
and the CPU does not support / have enabled unaigned load support,
then we will get a data abort with the FSR indicating an alignment
fault. So do_alignment() wil be entered.

Whether branch predictor handling needs to happen in this path is
a separate question, but as it's highly likely we'll take an
exception anyway and userspace is doing Bad Stuff, I feel it's
better to be over-cautious.

> In your last email, you described it as follows:
> On Fri, 5 Dec 2025 12:08:14 +0000, Russell King wrote:
> > Also tested usermode access to kernel space
> > which fails with SEGV:
> > - read from 0xc0000000 (section permission fault, do_sect_fault)
> > - read from 0xffff2000 (page translation fault, do_page_fault)
> > - read from 0xffff0000 (vectors page - read possible as expected)
> > - write to 0xffff0000 (page permission fault, do_page_fault)
> 
> There seems to be no do_alignment()?

Yes, I didn't test this case, because I was only concentrating on
the effects of the proposed patch which did not include moving the
branch predictor handling.

> In other words, is there a way to construct a user-mode testcase which
> accesses a kernel address and triggers do_alignment()?

Testing these mitigations is very difficult as there's no public
test cases for ARM.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

