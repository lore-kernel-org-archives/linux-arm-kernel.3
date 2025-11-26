Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308E9D11199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3LhDg+yUIEO9+/SIuMeJHAc2uhx3ggEtkG8ys37ptk=; b=w6NoGtTUb1ujKafuOQt9B3xGv/
	TPiyy2Km0okRKceQWtYWTekzmIlXjypsvDLGTBTS6iGgY2aOwQGt/6v8xWmhIaWVMCbJsXGRnKF/k
	0k5E8kauvZ6pBrQL/x0Y++1I4PX/n8JKlYwB3InmAn4NbIoQ1JJzBNC5qTheeJddVVPK27worVDNa
	LRHcDpLKzxTL3rpfhRuLyeVngL/QsPEj+c1UBrIeFoqMOVCjJbEiCGUNXUHlqvShQ16WpMEvTpjuj
	AnTTYTiAuVp5knLNT6ChhpGmM0OA1pp/oaW6BH4kOnYDl0MuXDqw3/J4/cpq/GyyVtfybY7oUw2QJ
	Y7n4qPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOML2-0000000FdK7-3cyz;
	Wed, 26 Nov 2025 20:42:08 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOML0-0000000FdJX-3q5h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 20:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=F3LhDg+yUIEO9+/SIuMeJHAc2uhx3ggEtkG8ys37ptk=; b=o3Wo/gJcdx6jF9yp+Moy+3zJBK
	4/xo3hGwpRQOjUuSnpVFd4+9RcmyDDSe6UMmetucmLae8BVJHjzLIu50qRgqYbk/odASxIUgSaAfn
	OZll8+aYjj1NWsWeY+RlkEcZ7SZ/UylVJW9S6ufdik3v9+fqhi1LOYdieImh4RVPP/pxDkPD633KB
	QFmjjdoW0GrmEG9tEjsTOgB0CoqhLB114KiR2psKlxll9g3YD462/AiRggY3TIECco1FGKJJaTLU8
	3V99sW3+lW6A28AxFj7hwSILErX3NPG2gXJopcYvlOTjOLtKShmxzpjPZ2/n6NgWW5TbZUWcR+T5p
	JvbpCgZw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vOMKw-00000002Jft-096S;
	Wed, 26 Nov 2025 20:42:02 +0000
Date: Wed, 26 Nov 2025 20:42:01 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: brauner@kernel.org, jack@suse.cz, linux@armlinux.org.uk,
	will@kernel.org, nico@fluxnic.net, akpm@linux-foundation.org,
	hch@lst.de, jack@suse.com, wozizhi@huaweicloud.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	lilinjie8@huawei.com, liaohua4@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad()
 with rcu read lock held
Message-ID: <20251126204201.GF3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126101952.174467-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126101952.174467-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_124206_958378_A16B851F 
X-CRM114-Status: GOOD (  15.24  )
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

On Wed, Nov 26, 2025 at 06:19:52PM +0800, Xie Yuanbin wrote:

> On latest linux-next source, using arm32's multi_v7_defconfig, and
> setting CONFIG_PREEMPT=y, CONFIG_DEBUG_ATOMIC_SLEEP=y, CONFIG_KFENCE=y,
> CONFIG_ARM_PAN=n, then run the following testcase:
> ```c
> static void *thread(void *arg)
> {
> 	while (1) {
> 		void *p = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
> 
> 		assert(p != (void *)-1);
> 		__asm__ volatile ("":"+r"(p)::"memory");
> 
> 		munmap(p, 4096);
> 	}
> }
> 
> int main()
> {
> 	pthread_t th;
> 	int ret;
> 	char path[4096] = "/tmp";
> 
> 	for (size_t i = 0; i < 2044; ++i) {
> 		strcat(path, "/x");
> 		ret = mkdir(path, 0755);
> 		assert(ret == 0 || errno == EEXIST);
> 	}
> 	strcat(path, "/xx");
> 
> 	assert(strlen(path) == 4095);
> 
> 	assert(pthread_create(&th, NULL, thread, NULL) == 0);
> 
> 	while (1) {
> 		FILE *fp = fopen(path, "wb+");
> 
> 		assert(fp);
> 		fclose(fp);
> 	}
> 	return 0;
> }
> ```
> The might sleep warning will be triggered immediately.

"Immediately" part is interesting - presumably KFENCE is playing silly
buggers with PTEs in there.

Anyway, the underlying bug is that fault in this scenario should not
even look at VMAs - it should get to fixup_exception() and be done
with that, with minimal overhead for all other cause of faults.

We have an unaligned 32bit fetch from kernel address, spanning the
page boundary, with the second page unmapped or unreadable.  Access
comes from kernel mode.  All we want is to fail the fault without
an oops, blocking, etc.

AFAICS, on arm32 looks for VMA at address > TASK_SIZE won't find
a damn thing anyway, so skipping these attempts and going to
bad_area looks safe enough, if we do that after all early cases...

