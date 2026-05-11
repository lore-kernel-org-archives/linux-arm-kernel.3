Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8380DCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRmZZoSXD3Wj4LMAwAdt4eJuVkT2JvoyntYmnjZ3hZo=; b=T+T9yG5TCsah0cZk/5jHuxw583
	G6SqQbqH40ZhWAh0vXhyZCsm4EX+6kF2dwMXLg/Ly9Ai4KjucG8gPFXwC3Dkje5Bge3q30FmhK/3G
	E2WN/d44KgSB00CWKWBRc0r/b2qN99TMOIzP62KC3rUDX8A6o3Dm1D9/feyUx8pGMa+Ag8Zr//MuM
	jgMBGsU9ZbvG8+QMcsVmREKthC8pQl0XTW3atXPCPsBoeL/vkN8HdCGliKIstfU1gfG7aGub38HBW
	2t/trUffTL5boOL6LUp2KYGPn5sEnQs4Ku9YIme9QrGP3EPHRiT1dJyHj9iWje+VrPwMSwJtL9KkL
	DxP8dM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRkH-0000000DvS1-2pOQ;
	Mon, 11 May 2026 14:36:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRkC-0000000DvPu-0mPq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRmZZoSXD3Wj4LMAwAdt4eJuVkT2JvoyntYmnjZ3hZo=;
	b=A3kzHdNyLKB3kjAOS1R/3JL96EwLaQmSTGI0sp3+s8XyhMb5mep5IbiU3J3VZRSTxDN96U
	2qhjbGsLWSK4T7HzSh60lHoSYestJPPT2VmqNgPO4LWn+tLpUPRo16Kh4hYZbvf7VP40KJ
	xzwcbAWevfPmy3cRLRZXcgk4o1UR9oM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-IGs8hL1HNk6pd1LBD38f6w-1; Mon, 11 May 2026 10:36:22 -0400
X-MC-Unique: IGs8hL1HNk6pd1LBD38f6w-1
X-Mimecast-MFC-AGG-ID: IGs8hL1HNk6pd1LBD38f6w_1778510181
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ee1a909037so814483185a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510181; x=1779114981;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TRmZZoSXD3Wj4LMAwAdt4eJuVkT2JvoyntYmnjZ3hZo=;
        b=KIwdQM3wwB3bhOWT15/E0N8OtiC8oxMcdtqOBHdnAG9MRQK1dJkJGZSLXe8JXZ6hIJ
         AwLZH2P4kc0kcx0GK7bPM+GpGTy9yyxgntq8sZKZcZmBcBPS3/kCE5YvcEnAnK/qOCmQ
         Uqze8UCf0TOIcgzQUw7e3lsK71NQ7EDFT4/jVNRmSviJK9C4+V9zI0cydPqO0rv0zuht
         ehRX0Iqyoitqv7rEeNRzl9Pw2vUQzaXA1nKCC1LS8268ivVcmqGOp9JUK1rU4LZsAocK
         KjAIprJvsBJf57u1twDv3b/a4fzdkKvXAdaJGSgX6E2KqMxE43y78s3YzUBwIJ5aEnB6
         W8vg==
X-Forwarded-Encrypted: i=1; AFNElJ/5Qd/KyPVZVecUhIyMO1CRFSwzf7IN+TPGfZOfCEruotxf/gH1215UqIUob7p2FvXpKtqZK9uefaV8dCRtnHaT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb//Q+Q7PkCROrsk5B1KZp73ZVMkwDJ2tpT41K5K7/sF/ivE+H
	5kw95htj8TlfBS/S5FZFSp8cV8l/r4uKw3DL8Se2gulc7PNGonWmaDp9/GO6PwldGNXBWCmoLO7
	MFPSixR5iWRp1u3/KFN9yYJkGGrV+G5DSdaEXiExKYrmDtcEEgxFdSKtaQLSmBXpDhVsV6puBlu
	tG
X-Gm-Gg: Acq92OF0mSy8Lo0m89dQL0FQkcbJ2P0Q78ZSejl1qHRMLHeqfGlRF84BceHt12eeTKx
	tozkwNdENlRBSxU8p4IQnuHbVc4xNCOxh7nOow/bDWsy3N87+8xiPmI6pz1fy3sYZLUtbH/a+jJ
	/nnOInd6cUPlzNJJyndhVHvXxc4AcOSjHancUiWpF/Zi0kbeNw0oPgOE0UwMqZePJLnsYx82y7A
	Lmo2VM4lwJfiVVcixwK3Nzg96/kiqzUrouD5CyoSnWSkuSPUgyJJiw1qfOP7GzFxQKiL+m1aOGf
	d0o/BcqQZv5x0T5gZqunUB2z7U96fggGftw73ZKMLYUBf6x0PpkPtB82vCwzNi4jmbxNm413xrS
	yj/q/vlQtbVNiwHyfepZSXyui72kYPhwdRls9hNdzSa2POkJAMWbdzupa
X-Received: by 2002:a05:620a:298f:b0:8cf:ed8d:20a3 with SMTP id af79cd13be357-907bb3e1b6fmr2203931685a.42.1778510180770;
        Mon, 11 May 2026 07:36:20 -0700 (PDT)
X-Received: by 2002:a05:620a:298f:b0:8cf:ed8d:20a3 with SMTP id af79cd13be357-907bb3e1b6fmr2203927285a.42.1778510180315;
        Mon, 11 May 2026 07:36:20 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd04c68sm3128259285a.46.2026.05.11.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:36:19 -0700 (PDT)
Date: Mon, 11 May 2026 10:36:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: a-christidis@ti.com
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Randolph Sapp <rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Message-ID: <agHpYnkCgGfZp2-E@redhat.com>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
MIME-Version: 1.0
In-Reply-To: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i1__5PA6uHQX5ebKU7tSh92trBKrajuQ6uDLXwSdp9o_1778510181
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_073628_293810_C3CB1E81 
X-CRM114-Status: GOOD (  13.56  )
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

On Thu, May 07, 2026 at 11:09:34AM -0500, a-christidis@ti.com wrote:
> From: Michael Walle <mwalle@kernel.org>
> 
> The TISCI firmware will return 0 if the clock or consumer is not
> enabled although there is a stored value in the firmware. IOW a call to
> set rate will work but at get rate will always return 0 if the clock is
> disabled.
> The clk framework will try to cache the clock rate when it's requested
> by a consumer. If the clock or consumer is not enabled at that point,
> the cached value is 0, which is wrong. Thus, disable the cache
> altogether.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Randolph Sapp <rs@ti.com>
> Reviewed-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


