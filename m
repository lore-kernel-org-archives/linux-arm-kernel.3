Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A0CD46C01
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+QRUlQ5qR66lfHUzRdswZWmidT1ZMWUyzUwdn6Imxc=; b=CsFQ4433sAnhz53fwjHo7xlLx0
	Q/lK+tgQWb2YKKzuKymS2jqo1S2NLUVGCahD1vQ8JP8k4ymnOYw1VGtGmdNg550vBXexGVxtPlXUg
	utjONOdzGxQj0jmQEiyFTeaUQpkJ4UfdVCXpxbS9OYWVmwBxnzDTjVjaoMZN+6Qaema645E3h7Raw
	NJ6IfpNh07rbgjsjW5BvwUStR30K1j55oZEt/wz3yNDMMboiF9z4sHSDR0sR6mqXA7X5cPZuMrG7r
	k9FTeQIf6u1fzr8yOqCpfMTarvXXs/1J4nCewoJvW5VW5trysewMgLN8y3uJUXarI9dFdlZ5J8tsN
	nNP9M2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEbs-0000000Gv5X-1dcb;
	Wed, 28 Jan 2026 23:06:04 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEbp-0000000Gv5B-1Da9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 23:06:03 +0000
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id F10A513BB98;
	Wed, 28 Jan 2026 23:05:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id 4ED0B19;
	Wed, 28 Jan 2026 23:05:53 +0000 (UTC)
Date: Wed, 28 Jan 2026 18:06:02 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 09/30] tracing: Add events to trace remotes
Message-ID: <20260128180602.4dd645de@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-10-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-10-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 64uyghqa9n4atbg59i1p3muxdue48cc5
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 4ED0B19
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19WPhVJLy5TbGzL4199/ZqemVIHZwaAhhU=
X-HE-Tag: 1769641553-721359
X-HE-Meta: U2FsdGVkX19+jYoLOZs18rm280yAUhdSvQpIWK8tx9XPXYfDnCbgjYvHUvTP1JOaQEwG+lUeMVrqhU1k8e+7f2vJHr2xfVMbkalmiOLwMdJeEVI62F0bK9OL75fnGczpTGHCOjb552m4Covu6F5daWhu20zNfqlw8TM2gXb74nE2STgMXt6Y4wcm/5FDtNwWdt6gFB25VMOir9UoxvOdsL3esEhmSq98Br+MT6So48OCLdldlBfPH8A/+MyeDB5Sqd4W3xvcc3Hel2un9hv+HuE2en1Vgp3pLzWoZmIbPPs2UpBxwM2oY5VqfzECwKzTzHnZE2LmmhxzJ6fz3AGLM+nM5xpRhUjM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_150601_402182_8CC5E45D 
X-CRM114-Status: GOOD (  10.19  )
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

On Mon, 26 Jan 2026 10:43:58 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> +
> +static int __cmp_events(const void *id, const void *evt)
> +{
> +	return (long)id - ((struct remote_event *)evt)->id;

Hmm, just to be safe, we should probably make everything int here, to not
have any overflow issues:

static int __cmp_events(const void *key, const void *data)
{
	const struct remote_event *evt = data;
	int id = (int)((long)key);

	return id - (int)evt->id;
}

-- Steve

> +}
> +
> +static struct remote_event *trace_remote_find_event(struct trace_remote *remote, unsigned short id)
> +{
> +	return bsearch((const void *)(unsigned long)id, remote->events, remote->nr_events,
> +		       sizeof(*remote->events), __cmp_events);
> +}


