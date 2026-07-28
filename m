Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B38BC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 00:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfDn9fEtfbgd/pb7eTpc1EfqTer+j8fqHQ23wDO8qsw=; b=A69t6PdxddPM+Z78tz8oCqfARZ
	+MhNnm3ZOyuAR8EtVghniVLwpEyeQZVyHIj8is+aINxdKQtn7Bx1g+/Gf1bvQ4nWZ4P2U87asAfap
	nPgeALHYKwL9WaXdo3/nuSkbXFVniaF/RiCavUz3YYffKFXsA5Z3QDH6Ic5cZ9y5AaNPku6poiQSE
	goEI1keoH9m3ErXlvz3dXuhtk5CehabIycI1hXg6ENKtNH0jogHWJZoUP2rq6OkdqaaFCbRkjiO4A
	4mWTGaTz+sl1vKYQZ0InQgdnH783BJMD5I0UHPLj9XJ2pcE0WWR7fEYfWNgFaaFfzKxBQMzvcLR3T
	w1/9L+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woVKD-000000047Hc-1rU5;
	Tue, 28 Jul 2026 00:05:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woVKC-000000047HW-0Evc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 00:05:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69519406C6;
	Tue, 28 Jul 2026 00:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E3B1F000E9;
	Tue, 28 Jul 2026 00:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785197135;
	bh=ZfDn9fEtfbgd/pb7eTpc1EfqTer+j8fqHQ23wDO8qsw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WkKN2I6hEcZnE3J8fZikL0lqNc1BCEn9Ui/Zk/2UBj69QG7+lg+dCFrbx+o/S+7PV
	 Rx7M+uYoCfiCclRP4JECaTQfp84zJC4KXNIM1QUpVwxmYwLEevXqSFiKYGWHL9i2Z0
	 8rgguy6JZeta+i71JZHOl6v04U91vMAeRe2nmzEjZuvUfLbOtDtff/u2sT51/W8eur
	 Z7A3XC3LLVsxNOCJZFsZnFOeMau0MvM8JNyhQF+322XuTN/z1KGXqE6svLKoH/NTVY
	 H7F3KDSZEnLe/rO5bh64NWvrbh5zKUim8tXBZL1MGixoPUjfR3iq7i2Ia5/5UdLknj
	 E6IrACJOzNMBA==
Date: Tue, 28 Jul 2026 01:05:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
 james.quinlan@broadcom.com, f.fainelli@gmail.com,
 vincent.guittot@linaro.org, etienne.carriere@st.com, peng.fan@oss.nxp.com,
 michal.simek@amd.com, d-gole@ti.com, elif.topuz@arm.com,
 lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
 souvik.chakravarty@arm.com, david@kernel.org,
 subrahmanya.lingappa@oss.qualcomm.com, leitao@kernel.org, kas@kernel.org,
 puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v6 05/22] include: trace: Add Telemetry trace events
Message-ID: <20260728010528.6d1ff3b2@jic23-huawei>
In-Reply-To: <20260724144430.1440170-6-cristian.marussi@arm.com>
References: <20260724144430.1440170-1-cristian.marussi@arm.com>
	<20260724144430.1440170-6-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
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

On Fri, 24 Jul 2026 15:44:13 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add custom traces to report Telemetry failed accesses and to report when DE
> values are updated internally after a notification is processed.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  include/trace/events/scmi.h | 48 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
> index 703b7bb68e44..b70b26e467b8 100644
> --- a/include/trace/events/scmi.h
> +++ b/include/trace/events/scmi.h

> +
> +TRACE_EVENT(scmi_tlm_collect,
> +	TP_PROTO(u64 ts, u64 de_id, u64 value, unsigned char *tag),
> +	TP_ARGS(ts, de_id, value, tag),
> +
> +	TP_STRUCT__entry(
> +		__field(u64, ts)
> +		__field(u64, de_id)
> +		__field(u64, value)
> +		__array(char, tag, TRACE_SCMI_TLM_MAX_TAG_LEN)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->ts = ts;
> +		__entry->de_id = de_id;
> +		__entry->value = value;
> +		strscpy(__entry->tag, tag, TRACE_SCMI_TLM_MAX_TAG_LEN);
> +	),
> +
> +	TP_printk("ts=%llu  de_id=0x%04llX  value=%016llu [%s]",

Why the double spaces? I was thinking this must be a local style thing but it doesn't
seem to be.

> +		  __entry->ts, __entry->de_id, __entry->value, __entry->tag)
> +);
> +

