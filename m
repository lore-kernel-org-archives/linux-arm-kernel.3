Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C57FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rx2BQAUJ1IxK7gyf+sD2B3OWvxmlQljfsfXOepl3UNQ=; b=XmQB0OJirKXraJQCV6+MQC0gYf
	y4A6vT7m4sb8BpxwlYfl2Q4D8brcIQp4yg9xuxSuyuQ1Snfhzl6LNMlWPVT7xjWW/2kv0ZiQ6zHmP
	4Uqgn67sCMlOnuET0gwjG1GEJEx8xnFS257FLM/nEodOn0Mrh24HWwJMw6aY1dk/xJTJ9ullzAT3y
	BybjgtlsymRPFfx1RkUd77RRqawu0W72RJpHAl/0Dj5HHCUUbGveRpcyMFfHGKTc61P8qFy3vSp8g
	bznXTOnQ3XXxz9E2N+krECeScujFx8EokJYiPD4gVj7tvxlFB0HbhN/UhBLbAR5oDY3gdb0b1Sxil
	KUTX35EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHow6-00000002RR9-0BaC;
	Tue, 28 Apr 2026 20:21:38 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHow4-00000002RQj-10wi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:21:37 +0000
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id E22CE140424;
	Tue, 28 Apr 2026 20:21:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id DB11A20032;
	Tue, 28 Apr 2026 20:21:31 +0000 (UTC)
Date: Tue, 28 Apr 2026 16:21:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 4/8] ring-buffer: Skip invalid sub-buffers when
 rewinding persistent ring buffer
Message-ID: <20260428162146.78e52988@gandalf.local.home>
In-Reply-To: <177701355481.2223789.8929563537404268817.stgit@mhiramat.tok.corp.google.com>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
	<177701355481.2223789.8929563537404268817.stgit@mhiramat.tok.corp.google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DB11A20032
X-Stat-Signature: uxqknnieyh6qocc33pm4dz7a11hriibh
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+WQB/o4GfEx2nnNkMQzQazvHdAcoOUkS8=
X-HE-Tag: 1777407691-181976
X-HE-Meta: U2FsdGVkX1+x9wPUL3Mdg1isPM9pfvR1/hxbPT0fY0XZvtE0Hf2YH9Xd1aKCTwW1VRk5Nzd0AtjHg1RVcGOUNjxGS/QaOBSXB46Rq+uD6AEztUuQVj4UE0TCl5utRe+HA48HVFGRyUKUe2ZO9dLfoOsYirrMSuNqbLarWp1v+31u5nEivCDpiOWwEKlgIONYAGCw0cMS43zASy/EfwX/EFDl+S5VWyNpYs5u9Da9HKa280zLjqQeIDeCHtHlD8Yo/BUiGFydQj0YvUWLBNpiKafYnotbtTc6BoTWRk8kPlzDm9X6qPnmziZlmYv8W1f+Q/cvTtwgRp3Qm+sMcEI/a6SMyjbBQ0U9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_132136_343394_3BEC49FC 
X-CRM114-Status: GOOD (  10.55  )
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

On Fri, 24 Apr 2026 15:52:35 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> @@ -1892,9 +1895,19 @@ static int rb_validate_buffer(struct buffer_data_page *dpage, int cpu,
>  	 * subbuf_size is considered invalid.
>  	 */
>  	tail = local_read(&dpage->commit) & ~RB_MISSED_MASK;
> -	if (tail > meta->subbuf_size - BUF_PAGE_HDR_SIZE)
> -		return -1;
> -	return rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
> +	if (tail <= meta->subbuf_size - BUF_PAGE_HDR_SIZE)
> +		ret = rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
> +

This code seriously needs comments.

-- Steve

> +	if (ret < 0 || (prev_ts && prev_ts > ts) || (next_ts && ts > next_ts)) {
> +		local_set(&bpage->entries, 0);
> +		local_set(&bpage->page->commit, 0);
> +		bpage->page->time_stamp = prev_ts ? prev_ts : next_ts;
> +		ret = -1;
> +	} else {
> +		local_set(&bpage->entries, ret);
> +	}
> +
> +	return ret;
>  }
>  

