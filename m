Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE85C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6KN69q8DGHd7PPBv02gK5qhAKGHBRDGCZpzS4/PGLI=; b=yjoysIYiy+McXSH/3v0Oa0dDsH
	QI5xd9KhUpteMe/I5W0s2wE6XTe6mgeXyb78M9f371WvZK67Iuq9CBybLPtseQWSqTWl/MHA1Pc8j
	oUFO+twpBwZRQlmuti1HT2alHhG1Jx3ganUt2koMwWy08hdbnGxq639G+oKxF1g6pUFNs82CQ9S0a
	7HILdTJu/5Q+XNn4d2qtmdDa8BJ8NT1AVUn9pMMszQKEpoOv2xtMwxfKlm8u7LkkI8YhUidSgptsp
	rtjy8k5WzUgzXVZ2swnmkSDfd8qJyISLimUgnIjJ/fWfJ1SnUEsp7++NOp9hZWKw+qZRLq7nykDuN
	HYspTRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHQl-0000000C4sD-2Bdt;
	Thu, 06 Mar 2025 20:02:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHKE-0000000C41K-0Y3I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 19:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9CCEBA44E26;
	Thu,  6 Mar 2025 19:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C81C4CEE0;
	Thu,  6 Mar 2025 19:56:07 +0000 (UTC)
Date: Thu, 6 Mar 2025 14:56:07 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] ring-buffer: Expose buffer_data_page material
Message-ID: <20250306145607.0aa91e22@gandalf.local.home>
In-Reply-To: <20250224121353.98697-3-vdonnefort@google.com>
References: <20250224121353.98697-1-vdonnefort@google.com>
	<20250224121353.98697-3-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_115610_239311_0AE40F76 
X-CRM114-Status: GOOD (  10.14  )
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

On Mon, 24 Feb 2025 12:13:44 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> @@ -61,11 +65,50 @@ enum ring_buffer_type {
>  	RINGBUF_TYPE_TIME_STAMP,
>  };
>  
> +#define TS_SHIFT        27
> +#define TS_MASK         ((1ULL << TS_SHIFT) - 1)
> +#define TS_DELTA_TEST   (~TS_MASK)

By moving this to include/linux you need to add a prefix to prevent name
space conflicts.

 RB_TS_SHIFT
 RB_TS_MASK
 RB_TS_DELTA_TEST

-- Steve


> +
> +/*
> + * We need to fit the time_stamp delta into 27 bits.
> + */
> +static inline bool test_time_stamp(u64 delta)
> +{
> +	return !!(delta & TS_DELTA_TEST);
> +}
> +

