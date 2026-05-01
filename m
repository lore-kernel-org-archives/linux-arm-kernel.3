Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1157CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqdV78Ha3ZcHSu7Csugrc0aupLcQuY2iftWCnXuSVPs=; b=JuGw4iRXPBBTgGu+pwQ0TAhD4d
	+YdnPzHvpx7TcqaSSkxuLDzDuBAhNsfvMNhGK8Rlw46g6V+Rkyo4wqP5tWrZar5DFCWIQPhVOwMm8
	gDMflaX3o5GMr9KL9iYtySFOf8Ihxxl/H/D1bHFmSqmgyUXuLF0K3E+SrHJ+N9Cmb1hhrRxPOqKJF
	D1X8Qj6n5a0QB8VaTMBIgCwm2ATM7wWf4lrNFSTAONrGlbSEGibSsaIBDun+Z6yG/ThuyA81M9iu1
	z2ovIu4dSb/vm19ayuP2+YJ3z/wdj1M0IeQSTMzKWucwMOohyTpm6wQYCp+eE5dKtP722VLSoG6w8
	SkN5ZzQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wItDS-00000007bkj-1wbi;
	Fri, 01 May 2026 19:07:58 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wItDP-00000007bkL-0SAV;
	Fri, 01 May 2026 19:07:56 +0000
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 991E2A020D;
	Fri,  1 May 2026 19:07:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 769B32002A;
	Fri,  1 May 2026 19:07:43 +0000 (UTC)
Date: Fri, 1 May 2026 15:07:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ricardo
 Ribalda <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally
 <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 01/11] media: Move visl traces to v4l2-core
Message-ID: <20260501150744.065081ac@gandalf.local.home>
In-Reply-To: <20260212162328.192217-2-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	<20260212162328.192217-2-detlev.casanova@collabora.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ukwp7o711oh9hqdcagr83o8ipbi84ubz
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 769B32002A
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18DLft44k2YZeX2Udu1SeE+L6rSwk5PnC0=
X-HE-Tag: 1777662463-242147
X-HE-Meta: U2FsdGVkX18HZ+JhHq9zIZprVHj8AGRMlv1oqYmjfGya9vaHea71t0EKjSn80nvm9Il4U7tne7/JdmHSroYcDA55tm7YVqGnxZtHrugibYTMD1JUiRqPTwQ5j9dkCF503SnUMmQ3WkDZXk8giuSr8g1YOaufsDbgX4Zn/1l1PRfIYZFetI5mngS6Wj7K76RpbuZJBRevihBBniFKGJxL575k0aJI8SevXXAClsYrRFmSQjHzLWFOCNllh/V4Q/pLW/FbuV0Qoj2JmWxeW2ulqkSJwE0aOcIhwqtqwDqnDO4NtURAcY8QIN20NCLerIUhVriTtPJHRfRzKlDs5JQJMKd3wDWbGC/PbxGfQEEGX3lZfBAUGJdgyqIEJKZyCnp/MFj37lOeNTKJSXwLFxCbz7j6ig0eE/an8d3WIfZQaXfgcgHFeLMFZuMiA8THIp57
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_120755_230637_AFFC6D8C 
X-CRM114-Status: GOOD (  13.65  )
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


Sorry, I didn't look at these patches at the time they were posted, but
when I saw you reply recently with:

 "On the userspace side, each trace events can be enabled separately and 
  even filtered (although I'm not sure filtering is good for performance, 
  has it has to match each event with a regex)."

I had to see what you meant by regex, because no tracer should be using
regex for filtering.

On Thu, 12 Feb 2026 11:23:18 -0500
Detlev Casanova <detlev.casanova@collabora.com> wrote:

> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
> +	TP_fast_assign(__entry->s = *s;),

What the heck! You are copying an entire structure onto the ring buffer to
print just a portion of it? This is really a waste of ring buffer, and also
prevents you from doing any real filtering.

You do realize that you can filter on fields (if they are defined as normal
fields).

 For example, 

  # cd /sys/kernel/tracing
  # echo 'height > 20 && width > 30' > events/visl_fwht_controls/v4l2_ctrl_fwht_params/filter
  # echo 1 > events/visl_fwht_controls/v4l2_ctrl_fwht_params/enable

And that will only trace that event where the height field is greater than
20 and the width field is greater than 30. It's converted into a fast array
to do the filtering. No regex involved.

Also, there's a library to read the raw events from the ring buffers where
you can do filtering on the read side too:

  https://trace-cmd.org/Documentation/libtracefs/
  https://trace-cmd.org/Documentation/libtraceevent/

-- Steve

> +	TP_printk("\nhorizontal_size %u\nvertical_size %u\nvbv_buffer_size %u\n"
> +		  "profile_and_level_indication %u\nchroma_format %u\nflags %s\n",
> +		  __entry->s.horizontal_size,
> +		  __entry->s.vertical_size,
> +		  __entry->s.vbv_buffer_size,
> +		  __entry->s.profile_and_level_indication,
> +		  __entry->s.chroma_format,
> +		  __print_flags(__entry->s.flags, "|",
> +		  {V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE, "PROGRESSIVE"})
> +	)
> +);
> +

