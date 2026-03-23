Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAC6EC01C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWnmeTBWsnuBRyqHM3IEo7BcmdfaeD508UOpxwkLPTI=; b=jP6wTO2WCWPRncHjVyjM+D5Rrg
	9lja8GprO6bb35kiIQlZufpUD3hA+BLsT4A3onORfl0loTQJ9NICBaXjVEnf5OSSXzJ8IiIWbVevy
	hb9eG//o5PPW+bqKpMuPbWMAQmapjq7SPplaGvYUcNtPWvf0DD9KH7NKfRGe6QQhUklu9d3Pz7rs9
	MRyv0o0R9qhTVft8jtKiQ3SYJIUe0M7zC6zd0bq5zUaNchUxoNXzqhrvL5XknXllJg8AN+iKaakWc
	flI4TW/mOCtrU6Zg6LkHFnuJeJMBpMBxEqP+E10Gp+plDhp/U6VNYq4ud/qyB+8pAt2cORoPXVht+
	6Bsa324w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cZ2-0000000GWIm-2Yyc;
	Mon, 23 Mar 2026 10:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cYx-0000000GWHJ-370B
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 10:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TWnmeTBWsnuBRyqHM3IEo7BcmdfaeD508UOpxwkLPTI=; b=L70DusxDEVcpYuKNQXXbQt8Lgi
	MRDOnjTGTmqw/pRKxU0G24kxtWMgjCYzmsH+ZcvQjIwh+0covpdicDOnNBVGZe6Yv57FPnsMG8IaK
	HjsRRsWWrBLKkI78zkV8lESWJo4tJ+rmsrcvjbqoQ5lsSRwMMuo7s25QVZRllNNHgwLK+qBneRAVS
	ob7KGTFChlmBGUQj2X/hbZjbkQBCJkXvZOnck01usAIYJcULypw1Pj0XKtuMQJlZ3QaGjIbhukl86
	R115SfX1S72HpmeNu8B8gDLBntidwfuSwFuAHiQ4W7loUw76/S65yoLnxcNNjngH/hrsWh7swT+Lp
	cZaV2MoA==;
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cYu-00000001EYX-1vFC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:31:10 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6F8845BDB4;
	Mon, 23 Mar 2026 10:31:06 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65C044381A;
	Mon, 23 Mar 2026 10:31:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j7rTGGoWwWnAIwAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 23 Mar 2026 10:31:06 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 2EBF2A0B2E; Mon, 23 Mar 2026 11:31:06 +0100 (CET)
Date: Mon, 23 Mar 2026 11:31:06 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org
Subject: Re: [PATCH 3/3] fs: remove do_sys_truncate
Message-ID: <yggi6tpu3uptzwe4an55ufkqgrrxkhu6e3sftlmgmny74c5w2m@4hapz3ee6kqv>
References: <20260323070205.2939118-1-hch@lst.de>
 <20260323070205.2939118-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323070205.2939118-4-hch@lst.de>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 6F8845BDB4
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_103108_831823_C6DD1DF4 
X-CRM114-Status: GOOD (  18.80  )
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

On Mon 23-03-26 08:01:46, Christoph Hellwig wrote:
> do_sys_truncate ist only used to implement ksys_truncate and the native
> truncate syscalls.  Merge do_sys_truncate into ksys_truncate and return
> int from it as it only returns 0 or negative errnos.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza


> ---
>  fs/open.c                | 8 ++++----
>  include/linux/syscalls.h | 8 +-------
>  2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/open.c b/fs/open.c
> index 181c1597e73c..681d405bc61e 100644
> --- a/fs/open.c
> +++ b/fs/open.c
> @@ -126,7 +126,7 @@ int vfs_truncate(const struct path *path, loff_t length)
>  }
>  EXPORT_SYMBOL_GPL(vfs_truncate);
>  
> -int do_sys_truncate(const char __user *pathname, loff_t length)
> +int ksys_truncate(const char __user *pathname, loff_t length)
>  {
>  	unsigned int lookup_flags = LOOKUP_FOLLOW;
>  	struct path path;
> @@ -151,13 +151,13 @@ int do_sys_truncate(const char __user *pathname, loff_t length)
>  
>  SYSCALL_DEFINE2(truncate, const char __user *, path, long, length)
>  {
> -	return do_sys_truncate(path, length);
> +	return ksys_truncate(path, length);
>  }
>  
>  #ifdef CONFIG_COMPAT
>  COMPAT_SYSCALL_DEFINE2(truncate, const char __user *, path, compat_off_t, length)
>  {
> -	return do_sys_truncate(path, length);
> +	return ksys_truncate(path, length);
>  }
>  #endif
>  
> @@ -222,7 +222,7 @@ COMPAT_SYSCALL_DEFINE2(ftruncate, unsigned int, fd, compat_off_t, length)
>  #if BITS_PER_LONG == 32
>  SYSCALL_DEFINE2(truncate64, const char __user *, path, loff_t, length)
>  {
> -	return do_sys_truncate(path, length);
> +	return ksys_truncate(path, length);
>  }
>  
>  SYSCALL_DEFINE2(ftruncate64, unsigned int, fd, loff_t, length)
> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> index 8787b3511c86..f5639d5ac331 100644
> --- a/include/linux/syscalls.h
> +++ b/include/linux/syscalls.h
> @@ -1285,13 +1285,7 @@ static inline long ksys_lchown(const char __user *filename, uid_t user,
>  
>  #define FTRUNCATE_LFS	(1u << 0)	/* allow truncating > 32-bit */
>  int ksys_ftruncate(unsigned int fd, loff_t length, unsigned int flags);
> -
> -int do_sys_truncate(const char __user *pathname, loff_t length);
> -
> -static inline long ksys_truncate(const char __user *pathname, loff_t length)
> -{
> -	return do_sys_truncate(pathname, length);
> -}
> +int ksys_truncate(const char __user *pathname, loff_t length);
>  
>  static inline unsigned int ksys_personality(unsigned int personality)
>  {
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

