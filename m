Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA15BC3ABD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyJvYyBbIG31EkvMbQZGkETWyU0MhgDcmer+R8iU04A=; b=Kqq9ijC333DNbvr6zgcwv2Z7St
	GRKpqT5p8YjWYQCxvs24oBePCcFU+uGxdVoc/V5ks/7SPRFjo5wXLLEHciWxV5sEuIBcAcwkEf59y
	1l6aC9SKCaJS9IzQpv5O+SiNM0EP78BzjI+Bu82F9Jp8SZvgjAKDqXexgl+1zd147b8jETysT8Fc2
	So13r1XDmRrzyGPpkUxPGhhGxDpbHVx6aXvs4Q6VtdVY3elv6kgEgyYPoCX9GHvKM2wMkduqD4/ON
	ctO39KZtTpgF4c1UkMojvzgU48rZFO72RYLT03sHpQOJo3eVCuFGkAwLFZIV/UvrybQslbV1wm4O3
	RhVPgViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxj-00000004ucq-3GxZ;
	Fri, 09 May 2025 21:08:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDTgp-00000004hFL-1207
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 19:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6913A61120;
	Fri,  9 May 2025 19:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7D8C4CEE4;
	Fri,  9 May 2025 19:47:20 +0000 (UTC)
Date: Fri, 9 May 2025 15:47:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/24] tracing: Add events to trace remotes
Message-ID: <20250509154735.530d4a37@gandalf.local.home>
In-Reply-To: <20250506164820.515876-6-vdonnefort@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
	<20250506164820.515876-6-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue,  6 May 2025 17:48:01 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> diff --git a/include/linux/trace_remote_event.h b/include/linux/trace_remote_event.h
> new file mode 100644
> index 000000000000..621c5dff0664
> --- /dev/null
> +++ b/include/linux/trace_remote_event.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _LINUX_TRACE_REMOTE_EVENTS_H
> +#define _LINUX_TRACE_REMOTE_EVENTS_H
> +
> +struct trace_remote;
> +struct trace_event_fields;
> +
> +struct remote_event_hdr {
> +	unsigned short	id;
> +};
> +
> +#define REMOTE_EVENT_NAME_MAX 29

29 is a particularly strange number. It's not even divisible by
sizeof(short). This will leave a hole in the remote_event structure.

Should it be "30" to plug up that one byte space between name and "id"?

-- Steve

> +struct remote_event {
> +	char				name[REMOTE_EVENT_NAME_MAX];
> +	unsigned short			id;
> +	bool				enabled;
> +	struct trace_remote		*remote;
> +	struct trace_event_fields	*fields;
> +	char				*print_fmt;
> +	void				(*print)(void *evt, struct trace_seq *seq);
> +};

