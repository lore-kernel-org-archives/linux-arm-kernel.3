Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2A1CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2qT8iGqCyDUVNGJGaIVKYxqpEwJngIId3tCvvdJ+vs=; b=RJTceS/SK0Zn/l/0G8JUNcPAH8
	XjjSwUtF/m/yXoL0tE5Aw0C8QL8m2eKaFQ1E9lhvTETirL2QioYm/BouyTpKpl5pESJcPclTpjsne
	u43QWxyYqmKDbB4Bj0+YPBbewhGDD48dyRVpgldqrXXJR3BfX97YMPK4Jc063M7rHFHP0oDq0KLe6
	RXSOwSTYoVd2eWpmPrIaFBRdTi5kV4noZkOtbfc5f7rS/Ui2IXdg4nYgcsTT4CTZs+CEkpiXONbWF
	6XNyjBRkpNm0+/k8YuTQ02B95+O4QsWSp+sU6seDuT0kWFDF4ow5T8uIWF49Tv84d6lpX/UvYU2pY
	4CIWrbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsHJ-00000007YJX-134B;
	Fri, 01 May 2026 18:07:53 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsHG-00000007YIg-3vfS;
	Fri, 01 May 2026 18:07:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1777658833; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dl5c7rTWjII5aXf3h1OrxYhT6Z4RcS4GUC6n4XRgH0niMNf/NQT+5bQwRzBMOaRaSyRuvm93lOTRM/v7Yf+0EzB8EFvsTJuA/5EjDOwdjYPpyvEZkJPNFuEj5codHDjMTyLY/bfXez3MB7YD2UMn2RqnJ3XTe+GsYftPHEHInhU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777658833; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v2qT8iGqCyDUVNGJGaIVKYxqpEwJngIId3tCvvdJ+vs=; 
	b=HpQ9xTBTPADN6xhKFxCkLqD2GAMLeOl4S5FhltMJcURXji/Xa/CXzMzbOoGba2XFQXUMnC0ZUt4e65mKDD9DDgvTrrc0vGJcpZ4ha4OaNYwHX8pU7fH1+XMgg1rHn4xj6AkuJQVzV38Ht6b7CifSNRlKSGFY3lr213G6VyrHEGc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777658833;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v2qT8iGqCyDUVNGJGaIVKYxqpEwJngIId3tCvvdJ+vs=;
	b=JdfSBTxM1BrXS5ExaImTfG+yWQQPv1Zl1UdiEmXpMO1TJ4pNffJ8SDVygIieu6MQ
	9owWaZSV/+K3dY+Ge1tZ3MWr8vhp1bPAkl6fzO8QXD6yfv6Si+Nosw8u3eMWAZBNSnu
	pw94Xnm9up3bf4b0uytloY28NvYRJr+NEKpEgoJY=
Received: by mx.zohomail.com with SMTPS id 1777658831566825.2211426215802;
	Fri, 1 May 2026 11:07:11 -0700 (PDT)
Message-ID: <23206161-3d25-432f-9461-4f5454d98d08@collabora.com>
Date: Fri, 1 May 2026 14:07:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] v4l2: Add tracing for stateless codecs
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, kernel@collabora.com
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
 <4c216c195d237e71188dfbdd54bbc1e234eff434.camel@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <4c216c195d237e71188dfbdd54bbc1e234eff434.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_110751_008507_DEB8DC77 
X-CRM114-Status: GOOD (  32.07  )
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

Hi Nicolas,

On 4/28/26 15:52, Nicolas Dufresne wrote:
> Le jeudi 12 février 2026 à 11:23 -0500, Detlev Casanova a écrit :
>> Hi !
>>
>> This patchset aims to improve codec event tracing in v4l2.
>>
>> The traces added in visl by Daniel Almeida are moved to the global trace
>> events and slightly reworked to be printed in a more consistent format.
>>
>> To each trace are also added a tgid and fd fields, helping userspace track
>> different decoding sessions (contexts) based on the given file descriptor
>> used by the given process id.
>>
>> Also for better tracking, stream on and stream off events are added as
>> well as HW run and HW done events to track decoder core usage.
>>
>> Finally, add a show_fdinfo callback on video device files, allowing drivers
>> to expose usage information.
>> Currently only used for frame buffer memory usage.
>>
>> The main focus is to be able to generate perfetto traces to show VPU usage,
>> a perfetto producer using this can be found at [1].
>>
>> [1]:
>> https://gitlab.collabora.com/detlev/hantro-perf/-/tree/hantro-improved-info
> I would recommend renaming this repo, as its not really evolving toward
> something truly hantro specific anymore, same goes for the code below appart
> from the run/done traces and the fdinfo that has to be opted in.
Yes, hantro was the first focus, but I've also been integrating rkvdec 
into this.
>
> There is effectively a bit of an overlap with the v4l2-tracer, but there is also
> advantages having it in the kernel, as you source all the event, for the entire
> system, in one place, so I'm fine with that. Considering the possible large
> overhead of the full trace, I'd like to see the ability to filter what we want
> to trace, with some level of granularity.
Tracing is by default disable and and has a really small performance 
footprint when disabled.
On the userspace side, each trace events can be enabled separately and 
even filtered (although I'm not sure filtering is good for performance, 
has it has to match each event with a regex).
> Maybe we only need decode_params for
> specific use case to be debugged, and don't care about large scaling list/matrix
> ? I would also like to see some Documentation on the tracing, so that its usage
> is not only explained in a tool.
Agreed.
> To Hans, there is nice tools idea in there, the perfetto producer is simply C++,
> and the v4l2top utility is Rust. Would you see these as tools v4l2-utils ? For
> the rust part, we can either leave the build independent, and cargo would be
> used to build and run, or we can implement a meson wrapper around cargo. But I
> don't believe its a good idea to use native rustc support in meson for that one
> because of the large number of third party crate needed.
>
> I like the direction, hope the feedback suite you well.
>
> Nicolas
>
>> Detlev Casanova (11):
>>    media: Move visl traces to v4l2-core
>>    media: Reformat v4l2-requests trace event printk
>>    media: Add tgid and fd fields in v4l2_fh struct
>>    media: Add tgid and fd to the v4l2-requests trace fields
>>    media: Add missing types to v4l2_ctrl_ptr
>>    media: Trace the stateless controls when set in v4l2-ctrls-core.c
>>    media: Add stream on/off traces and run them in the ioctl
>>    media: Add HW run/done trace events
>>    media: hantro: Add v4l2_hw run/done traces
>>    media: v4l2: Add callback for show_fdinfo
>>    media: hantro: Add fdinfo callback
>>
>>   drivers/media/platform/verisilicon/hantro.h   |    2 +
>>   .../media/platform/verisilicon/hantro_drv.c   |   25 +
>>   .../media/platform/verisilicon/hantro_v4l2.c  |   10 +-
>>   .../verisilicon/rockchip_vpu981_regs.h        |    1 +
>>   .../platform/verisilicon/rockchip_vpu_hw.c    |    4 +
>>   drivers/media/test-drivers/visl/Makefile      |    2 +-
>>   drivers/media/test-drivers/visl/visl-dec.c    |   76 -
>>   .../media/test-drivers/visl/visl-trace-av1.h  |  314 ---
>>   .../media/test-drivers/visl/visl-trace-fwht.h |   66 -
>>   .../media/test-drivers/visl/visl-trace-h264.h |  349 ----
>>   .../media/test-drivers/visl/visl-trace-hevc.h |  464 -----
>>   .../test-drivers/visl/visl-trace-mpeg2.h      |   99 -
>>   .../test-drivers/visl/visl-trace-points.c     |   11 -
>>   .../media/test-drivers/visl/visl-trace-vp8.h  |  156 --
>>   .../media/test-drivers/visl/visl-trace-vp9.h  |  292 ---
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c      |   10 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c     |  114 +
>>   drivers/media/v4l2-core/v4l2-dev.c            |   10 +
>>   drivers/media/v4l2-core/v4l2-fh.c             |    1 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |   37 +-
>>   drivers/media/v4l2-core/v4l2-trace.c          |   48 +
>>   include/media/v4l2-ctrls.h                    |   19 +
>>   include/media/v4l2-dev.h                      |    1 +
>>   include/media/v4l2-fh.h                       |    4 +
>>   include/trace/events/v4l2.h                   |   58 +
>>   include/trace/events/v4l2_requests.h          | 1836 +++++++++++++++++
>>   26 files changed, 2178 insertions(+), 1831 deletions(-)
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-fwht.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-h264.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-hevc.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-mpeg2.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-points.c
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp8.h
>>   delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp9.h
>>   create mode 100644 include/trace/events/v4l2_requests.h


