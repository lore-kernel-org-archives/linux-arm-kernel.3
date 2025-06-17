Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A04C761AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nZJ22rsS0RPWxh3ZE7aCZVwueQlyLoqt+SFU6IEEhY=; b=coq/ZYFlTY9v8tfje/QvNHRzNm
	q3CMxpjIAD1o96uK5Xzi8G9riUEq6l6UxwS2FPQnVsPzb8tmaS5Bta3pExzBNKAtT2zHTQFsF50mn
	lgZU/C9/OMLBJcn/kNDtZ9+HNMzdJIPG+R/WyME5K72Q4XHzW62zN1+7jRtvq2ce9uMPRBK4DtJuE
	t+eZ4XoO/nMAAlw6ShaZND1Vh5gmw/vF7BalhwwejttHa8GcwO5Rbm+7wA0HiXflSwsRh3tn2StCR
	AP1YPEhjhX+ILUgngnXJ56LG+5aF2k+AX+QCqXOxEcmWHRPcFAXKNqi7y2NHHYvkoJvBJrKXGX0RD
	dFUx2LdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZpW-00000007xbd-13Hs;
	Tue, 17 Jun 2025 17:10:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXES-00000007Xa8-1RWy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750170250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8nZJ22rsS0RPWxh3ZE7aCZVwueQlyLoqt+SFU6IEEhY=;
	b=Gxu3VfwwWKKXvn4nujvVAp99zjeMscmLtbZ2uaqDj0qvILfuZ8lMEr1sPPwea7MYbbT6ZI
	y2oZnjghm2ElesmXtpvS3enKndTOS/LqAb+X/t2qFHUWmKc+7xFJe7hCsEKONNjLaxnBcY
	+V2PCWuzMXhOcvwCVfpTu+IF7Xnprac=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-MSxMOJUkPPqhC_Oa3_gyJw-1; Tue, 17 Jun 2025 10:23:57 -0400
X-MC-Unique: MSxMOJUkPPqhC_Oa3_gyJw-1
X-Mimecast-MFC-AGG-ID: MSxMOJUkPPqhC_Oa3_gyJw_1750170236
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so38184805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170236; x=1750775036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nZJ22rsS0RPWxh3ZE7aCZVwueQlyLoqt+SFU6IEEhY=;
        b=bJFZ+2M/WFbYQghQxWMNmgbfV06lqnwVcDnqUDvYKehnxtxpMd1OUaNN6xLingsJZW
         zVu6h8AhGOs7ybLGShaMmSBkLEVRsFdD7qMzp/P7q4mBNUD0/gZK0/NtyvdsenuRWy1i
         thPwxP5Lmy/CDhBBOYg+3TXBA4YO7Vs+Js+6wzb1FfAAbvmHhq1ycyX19kAuoBppbUIr
         8P5oJqgVmazG4Vnlh/mF2D/Gr+zGaSdGqCDXvTCkuNsEZKVneC8Q9oI0VtaHZnf0FQaR
         eNqOTAA1K021d6WSbgxKj+Se4DBlQGAg3ftcn+hzH4MKwsG0pCfamZvL/gdVdRxzh8cF
         6hTw==
X-Forwarded-Encrypted: i=1; AJvYcCWwSoVkejPenYZz7gZ2E+RNsPsYoaWmC10Lbffo16rypTKS0GLrdaEDyW3BW5ZS5NLJR7Z760IwhpnTJ+xHkbmG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0cnzgrgGCia3u97cyrTBw90T8T1ry8UMe9Z8ESWj7eDljv4YQ
	94SdUhd1XmH79JZY+k1+ekfNC0lgoMoJKS1lzWpYSie/zX5DWBr+2sY44pp7Pe7PlYHRB1m/wvF
	XOvgsHMs4jLFhl0T1P1UuFkJ0IJ9jetHHM2xdVqR0Bp7N5VSA8Sfb4x+mx3e/oX1Mf8R1uJQCgx
	Rv
X-Gm-Gg: ASbGncuOceO8lrDYwPyAd6xCE/pJt0LYzVx1xJoAvBAHVN2KDYFIjTCS+tkMby6/tMZ
	s7n+UL09cA0ujq0wFJzRSqAiA22l6yGq5BdXhHkuOhbIi4gKM+7/RINtf3L8BIB/hdDAUbfRbTa
	wp831+nv4wvyqg6uT1lgqOGzH5fjvL4YNSLQ6ssM+WLTFtu6+kgIIw4SQsVmHHM5zII9FG1/8rP
	uecj53aEUqnJUiDvaN4fflCYAVTsH1/wJEvbDXv8rCm0c9AzQx3epf3eY4PoQZqJwHM1P6dtunD
	7mTvxa/dY7J9PFxqUZpL0tn+/n+EY6JysmJ4BaAI6kNRjZgnivrjPw==
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr122013195e9.29.1750170236074;
        Tue, 17 Jun 2025 07:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFXdSBOaD0bkiX6RgDIIItmoJz66Z98LumAPn/RVxW5in7JWmC1em46bTnPvZqEArSrV/R5Q==
X-Received: by 2002:a05:600c:5396:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-4533cac8fdbmr122013005e9.29.1750170235702;
        Tue, 17 Jun 2025 07:23:55 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25302dsm171997755e9.26.2025.06.17.07.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:23:55 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:23:53 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kuyo Chang <kuyo.chang@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Message-ID: <aFF6eYzMahzQ9sxE@jlelli-thinkpadt14gen4.remote.csb>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
 <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
 <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
 <20250617141437.GW1613376@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
In-Reply-To: <20250617141437.GW1613376@noisy.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xk9gMTv69tMKKNZI5qk2N0QOGmVlPxWGpAk1f0DPdwk_1750170236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_072412_460460_590F6412 
X-CRM114-Status: GOOD (  14.06  )
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

On 17/06/25 16:14, Peter Zijlstra wrote:
> On Tue, Jun 17, 2025 at 02:33:15PM +0200, Juri Lelli wrote:

...

> > To me it looks like we want this (no scaling) for fair_server (and
> > possibly scx_server?) as for them we are only looking into a 'fixed
> > time' type of isolation. Full fledged servers (hierarchical scheduling)
> > maybe have it configurable, or enabled by default as a start (as we have
> > it today).
> 
> Right. Then we should write the above like:
> 
> 	scaled_delta_exec = delta_exec;
> 	if (!dl_se->dl_server)
> 		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);
> 
> and let any later server users add bits on if they want more options.

Works for me. Looks cleaner also.

Kuyo, can you please update your patch then?

Thanks,
Juri


