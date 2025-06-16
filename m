Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C701C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KT/2mLdsrhe4l5WXh2mMIJOHdvnt3ZcZb+h3AjjEok=; b=itIAYrBt6BANGRmcYCG9mccTLb
	Q9TgV9/3uvxK4kYSL3Mgoai3Iy6BfaKZ4WmBCYgmN+H40KwnfFO5SvWU+GUir74B4WbBfFKyePDNV
	MA5kvWpNEQ/zU1QnfXnYEqz73tRROq0jKqWtlEI7eWxQ7bjmKGFjwfeLzPpIRNaOzBQ/nZZqHcIX9
	DCUreM+atAzcTUw9LjjmaxQnJPvzDZSflYkNEdBHQN7UtHgdk4hwI65JdlO20fO1D7WSdelAAqX+x
	n40Mwfh94b5qe9kwGaHC3va5J3T6dDtEF/K0itwN31VZw2qBD2zBc2yeRBYnPKsPQNVjAPBMZSIhF
	eXcaTVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCqJ-000000051de-1lwA;
	Mon, 16 Jun 2025 16:37:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAQz-00000004dfS-0tsB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750082614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KT/2mLdsrhe4l5WXh2mMIJOHdvnt3ZcZb+h3AjjEok=;
	b=Hb2jbE4DSbn4dQErBkkkXPnkTOgsQNgPKGPChTo3tM5eyBYVq9n3NvduHjHm+jLBGU5RMK
	p+AJA8YfWUFg9YDNnec8HGzO/TJh3eAAHBN3cca1uGUI1CV7vtje3hE3vzWgKdZLDsOJKf
	Cf71lCHW0o5zRm8VMAtNdPM0S/50qtQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-Xe3Hv8FmMomTy-AIPCCGXQ-1; Mon, 16 Jun 2025 10:03:30 -0400
X-MC-Unique: Xe3Hv8FmMomTy-AIPCCGXQ-1
X-Mimecast-MFC-AGG-ID: Xe3Hv8FmMomTy-AIPCCGXQ_1750082609
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso1866514f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 07:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082609; x=1750687409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KT/2mLdsrhe4l5WXh2mMIJOHdvnt3ZcZb+h3AjjEok=;
        b=Y96/zpKxDcZ4pIRkSuH6p7YC6/19x78KCC3QFLyXQmnQPs6E+d0FxgJuPksILb9e0A
         a6hczOiXHcJ3TLfG8Kdla1w2ab+Pgt4R6iGXg8X9visHT+B1P/4JGQD71R+tEgq4i0NK
         AY0tO1wmVw0o65yJFt73vyfTqeT1rrwAQ/5jYykKQrFsG4x9XFJ25aa5Ns+jTSs+TUpI
         xvVuAxOfHTes0W+Bag7dwgHxLCJkfUNxOQcTZ165TOhQn8tmJk0q3bq4V6oSUjxxEalu
         xxJb4tiFfy6lCWKNBbq4O4oFnI+nnLCBx9f58vV/67fQHPM4UhX57JUqtsVlLJpxvB7Q
         /5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVuVHBlzKibWXqpow2FXnQiW3oOu2ChtBVoh1LUwf4OIUqzKaRTUTL9xEJXM/9DbxGlDgLgfKLY/GuYd8GqO9oB@lists.infradead.org
X-Gm-Message-State: AOJu0YxfkNuzvBDJbtmAM1j9OtTOdRcRix/ifGMzN6eQv48sQDiSwcmZ
	2t8Wt1MUMuRAMuMCb4NXJujARDx8vBPcc9fPU4Dae0PPql8UN2j6k7a18F3tP1b/Y0p8urxSG36
	CXWu6X9O2kfABi1WT5HL0JTkFVAoNx1UhaphNVzMiUDhfDy2wQQka/vLO4fsyohuB4qVlqGHUr/
	Ss
X-Gm-Gg: ASbGncu78Wj7IRRbyH9SArw/eOlHVkLcBaT4h3ESfm1vN14zz3l13zdWCfdjBtIURFx
	i+C8/XEKF+bvZyl+1Tp5dhAiYIO9T6n5qt8ULBoULA2MnlAQY6fWLFfhQtJ4+UkdqF/IHKxQwAh
	wOqLJKlXxfJuRhr/n9oVTrFzMKeMLytXYUyPaOa4ZBKNVYNShSkn7m9dsJUN6DjtbOmD+/+Lioo
	APVtroSPFAYDB2t+wzkgEEUMbjCo8ypwhf8LJ2oK+Id8ng5PV3/gtNH53PtYhNX2/qPkci2UqGN
	ASHUh5MPhetWFZlmzY7x3Y8LXa/DW8gmcg7NhiItVJQ0NTSoV6pJvA==
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a572e9e01cmr8627011f8f.53.1750082607434;
        Mon, 16 Jun 2025 07:03:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhnN5lqHyekM9U5mFuJ4VnEOh6SefVAzY1bT/B5jogeMQLSgptuYNFVoJKZP5a2pKpaGM6cQ==
X-Received: by 2002:a5d:64c9:0:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a572e9e01cmr8626772f8f.53.1750082605375;
        Mon, 16 Jun 2025 07:03:25 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d7fsm11345085f8f.18.2025.06.16.07.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:03:24 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:03:20 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <aFAkKGs5h6kfXYnO@jlelli-thinkpadt14gen4.remote.csb>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20250614020524.631521-1-kuyo.chang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XPfTgIZEeaA8v7zhzaFuP60PIt8Aif5dKl0SgKnPcx4_1750082609
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_070337_349728_0C8CDE0D 
X-CRM114-Status: GOOD (  13.83  )
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

Hello,

On 14/06/25 10:04, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Symptom]
> The calculation formula for fair_server runtime is based on
> Frequency/CPU scale-invariance.
> This will cause excessive RT latency (expect absolute time).
> 
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
> 
> Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> FIE: 100
> CIE:50
> First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 = 4,882,812
> Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 = 238,418.
> 
> So it will scaled to 238,418 ns.
> 
> [Solution]
> The runtime for fair_server should be absolute time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the fair_server.
> 
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---

Right, I would agree we don't actually want to scale fair_server runtime
by frequency/capacity. Your change looks good to me.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks!
Juri


