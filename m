Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D21D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 03:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dCa0Yi2abB18gZnNstjxBDy+4BryzpI37joEvmB9nM=; b=1HiKY914pV2fpX9MfI7tPYwTeO
	dk3yogDW/XWYj3jjc4vra20k5z6Lg/bgNnq31tksLahwVG02unO6IWfPFTKpwmw8foyEEkVjHspkd
	2BL/MgGE9cMuct+iE0D1caUqDrrlYWgx1Lq1tkqViZFRnhulGOYItA8o07S/lNui0xHI1w+Mds7gO
	lKS5b4j6jwfqLoMTclZYhIwtMHrxr0iqYkFth4VT+Pb8oID3VO14aofnHyVIUszVYaawhBFN946oI
	hIPklSMj7xbNlUqVkCkvHGbU1qZox8frklkRvbqEDcyZDuTE1jlZJjVCeWrt2/BslZnAhYaf1ZGrK
	cDZwDmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPC3D-00000001FOQ-3C9v;
	Sat, 29 Nov 2025 03:55:11 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPC3B-00000001FNJ-1xpm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 03:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1dCa0Yi2abB18gZnNstjxBDy+4BryzpI37joEvmB9nM=; b=gif53AQXc1RzHnygPbDtIU0X9L
	pXTFfokzhGNWnuy66xDaEH/e5OK0oyUdCm4pbTUKtbbksPMcXlqSNS0VCZDb2SJIB9J/PGAbtpqbG
	CO8OW3uSLvzVc3N7Das2tMfFe7RiY/yna+fzkylq+2CW5cGxecl6dTfKxhJgvWdBBeoPwcIyDFC2s
	8sQLhqsD1hjniYUK2XVRqXshs+TJ0gYBdaxjzN6imMaYMF+GPISY28ftXIfPzc78DeU0qhSE93uU7
	+1dLgV4XxZb7onQ+ybhE2DK6uXuf5i3CZdI074nrQAY1XXegzlcxto0oJi2wynNGH9zvSxytr5yAR
	kywVSLoA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vPC3C-00000000XUf-1HpY;
	Sat, 29 Nov 2025 03:55:10 +0000
Date: Sat, 29 Nov 2025 03:55:10 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Zizhi Wo <wozizhi@huaweicloud.com>
Cc: Will Deacon <will@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, jack@suse.com,
	brauner@kernel.org, hch@lst.de, akpm@linux-foundation.org,
	linux@armlinux.org.uk, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, yangerkun@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com,
	xieyuanbin1@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <20251129035510.GI3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <aShLKpTBr9akSuUG@willie-the-truck>
 <9ff0d134-2c64-4204-bbac-9fdf0867ac46@huaweicloud.com>
 <39d99c56-3c2f-46bd-933f-2aef69d169f3@huaweicloud.com>
 <61757d05-ffce-476d-9b07-88332e5db1b9@huaweicloud.com>
 <aSmUnZZATTn3JD7m@willie-the-truck>
 <b6e23094-f53f-4242-acb5-881bd304d707@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6e23094-f53f-4242-acb5-881bd304d707@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_195509_535134_E767717F 
X-CRM114-Status: GOOD (  10.62  )
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

On Sat, Nov 29, 2025 at 09:02:27AM +0800, Zizhi Wo wrote:

> Thank you very much for the answer. For the vmalloc area, I checked the
> call points on the vfs side, such as dentry_string_cmp() or hash_name().
> Their "names addr" are all assigned by kmalloc(), so there should be no
> corresponding issues. But I'm not familiar with the other calling
> points...

Pathname might be a symlink body, sitting in page cache or whatever
->get_link() has returned...

