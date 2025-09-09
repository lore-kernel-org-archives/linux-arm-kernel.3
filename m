Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4751CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JK4kfmGVBbz84DOwcFJ4gLS65ihAP86rgX07utKgdbg=; b=JCo841YvSNJ+1SzUc6DRdo+JjM
	UqoIxWLl/USw8Ua2DESyg5/mNb74SLXtp7gm6Yu624OraejgZMg+9RHATo2x+oMuK70Ubi1ougBM2
	LmY8vG72IOSpHa2/Fpq4NeGQ/3njlPEWLyAAd2b2bjRADXDoE4/8qPObgTdHH/PcDUJQtWCJySgHI
	lu7ecxKCyrj/Gg/lfj0x3gryII7y171iJMDNKVae8VoeXu6yMaQS2G6L+xOGQiZ4hO6NRn9Ox21vv
	kwDlk931S2RogMzg25FGHpYhZnfc4lw/0x2lPGuVybJxtS7Co0mZEQvqmFlo6kLdaCW78bGr2wTkd
	J6XLakBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6Ft-0000000AVKu-0Qsm;
	Tue, 09 Sep 2025 21:52:01 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6Fq-0000000AVJb-04Xq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:51:59 +0000
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 37F7411AC15;
	Tue,  9 Sep 2025 21:51:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id B3CED20025;
	Tue,  9 Sep 2025 21:51:51 +0000 (UTC)
Date: Tue, 9 Sep 2025 17:52:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/24] tracing: Add events/ root files to trace
 remotes
Message-ID: <20250909175240.4db7c0eb@gandalf.local.home>
In-Reply-To: <20250821081412.1008261-8-vdonnefort@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-8-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: a6dhj43w5f1j4i5ea6e1kz1oidpsfdiz
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: B3CED20025
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19NE8UX9pout0gmp8nK4qQdOWNA+46veZ8=
X-HE-Tag: 1757454711-688199
X-HE-Meta: U2FsdGVkX1+5T2tCPQ+moXus8fA3OM8acJeM+WEPmFi/qhIBWOI3c1MIrGa8HCGVuEPNTJpPFnstSsHWuAqGhXNajKOEStbjgqTlnZzV/TGwuesdpTEnH/czE+NNgquHlm6dtXATZx3Ygwq3Ay3ZH2ovgcIxKBk5xyiyIAO31TrYvniPp/wSl2JSupBAhRGenJEdGZ6RLnX6LTapu3t5pEqVwyIfG0Y6oBvF4w8lI5adQVgM/ZDhHkx6yFiV+1aOk0521araOy7Rc5SDUxEzZxgrGaxDaxU1Ko+DPWVghsinHexkE24dcer7txlzXEnZBK0ctKUzoE9rmB/+jnGhiIx7KKmW664l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_145158_123570_91893AFA 
X-CRM114-Status: GOOD (  21.73  )
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

On Thu, 21 Aug 2025 09:13:55 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:


> diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> index 822cdd76e334..5065b162c8ef 100644
> --- a/kernel/trace/trace_remote.c
> +++ b/kernel/trace/trace_remote.c
> @@ -710,10 +710,118 @@ static int remote_event_callback(const char *name, umode_t *mode, void **data,
>  	return 0;
>  }
>  
> +static ssize_t remote_events_dir_enable_write(struct file *filp, const char __user *ubuf,
> +					      size_t count, loff_t *ppos)
> +{
> +	struct trace_remote *remote = file_inode(filp)->i_private;
> +	u8 enable;
> +	int i, ret;
> +
> +	ret = kstrtou8_from_user(ubuf, count, 10, &enable);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&remote->lock);
> +
> +	for (i = 0; i < remote->nr_events; i++) {
> +		struct remote_event *evt = &remote->events[i];
> +
> +		trace_remote_enable_event(remote, evt, enable);
> +	}
> +
> +	return count;
> +}
> +
> +static const struct file_operations remote_events_dir_enable_fops = {
> +	.write = remote_events_dir_enable_write,

Hmm, why not a read as well? Or is it too difficult to figure out what is
enabled and what isn't.

For the main trace buffer, it's:

 0 - all disabled
 1 - all enabled
 X - some disabled some enabled


> +};
> +
> +static ssize_t
> +remote_events_dir_header_page_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
> +{
> +	struct trace_seq *s;
> +	int ret;
> +
> +	s = kmalloc(sizeof(*s), GFP_KERNEL);
> +	if (!s)
> +		return -ENOMEM;
> +
> +	trace_seq_init(s);
> +
> +	ring_buffer_print_page_header(NULL, s);
> +	ret = simple_read_from_buffer(ubuf, cnt, ppos, s->buffer, trace_seq_used(s));
> +	kfree(s);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations remote_events_dir_header_page_fops = {
> +	.read = remote_events_dir_header_page_read,
> +};
> +
> +static ssize_t
> +remote_events_dir_header_event_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
> +{
> +	struct trace_seq *s;
> +	int ret;
> +
> +	s = kmalloc(sizeof(*s), GFP_KERNEL);
> +	if (!s)
> +		return -ENOMEM;
> +
> +	trace_seq_init(s);
> +
> +	ring_buffer_print_entry_header(s);
> +	ret = simple_read_from_buffer(ubuf, cnt, ppos, s->buffer, trace_seq_used(s));
> +	kfree(s);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations remote_events_dir_header_event_fops = {
> +	.read = remote_events_dir_header_event_read,
> +};
> +
> +static int remote_events_dir_callback(const char *name, umode_t *mode, void **data,
> +				      const struct file_operations **fops)
> +{
> +	if (!strcmp(name, "enable")) {
> +		*mode = 0200;

As 0200 is a bit strange.

-- Steve


> +		*fops = &remote_events_dir_enable_fops;
> +		return 1;
> +	}
> +
> +	if (!strcmp(name, "header_page")) {
> +		*mode = TRACEFS_MODE_READ;
> +		*fops = &remote_events_dir_header_page_fops;
> +		return 1;
> +	}
> +
> +	if (!strcmp(name, "header_event")) {
> +		*mode = TRACEFS_MODE_READ;
> +		*fops = &remote_events_dir_header_event_fops;
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
>  static int trace_remote_init_eventfs(const char *remote_name, struct trace_remote *remote,
>  				     struct remote_event *evt)
>  {
>  	struct eventfs_inode *eventfs = remote->eventfs;
> +	static struct eventfs_entry dir_entries[] = {
> +		{
> +			.name		= "enable",
> +			.callback	= remote_events_dir_callback,
> +		}, {
> +			.name		= "header_page",
> +			.callback	= remote_events_dir_callback,
> +		}, {
> +			.name		= "header_event",
> +			.callback	= remote_events_dir_callback,
> +		}
> +	};
>  	static struct eventfs_entry entries[] = {
>  		{
>  			.name		= "enable",
> @@ -729,7 +837,8 @@ static int trace_remote_init_eventfs(const char *remote_name, struct trace_remot
>  	bool eventfs_create = false;
>  
>  	if (!eventfs) {
> -		eventfs = eventfs_create_events_dir("events", remote->dentry, NULL, 0, NULL);
> +		eventfs = eventfs_create_events_dir("events", remote->dentry, dir_entries,
> +						    ARRAY_SIZE(dir_entries), remote);
>  		if (IS_ERR(eventfs))
>  			return PTR_ERR(eventfs);
>  


