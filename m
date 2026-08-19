Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFEFC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 21:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQ9UK0HQnXCrAGrJ3T1tTyPOhL6zeCrydiH56Wdp198=; b=vD9GBAEGVb6Tqlsl7ROfWaItJX
	atJaApN3WtXPRYY3ZhmULghWWjhxaVjE9IHi9wRXVgmfCHZFrYXb5bLP0vLadfDJbyUC2I6egxadB
	7wfilQ7WuTAKfzNd3WwfX+ZVV9h6A0SrWfT9Ycw/NOaIJRqMTCaKda0yXSqIFuPrFHkBFjhpYy7cU
	gWx/NeZ3f9e6ZCOXddnfd6wUWNfA1eYEVK5o3Ntuph12Otnf1Uj025ME7botN5BpevtdE27pXgWqF
	jdTvv56wnilHjhUWAxeMe/sSe3IXQwlm33Jk2vOxNqltfyxM4KPPTTh5K+24sgY/gKQl/T0Uhuuxx
	p7KRu6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwo3w-0000000AZYn-1ZUJ;
	Wed, 19 Aug 2026 21:43:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwo3t-0000000AZXs-330R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 21:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787175784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YQ9UK0HQnXCrAGrJ3T1tTyPOhL6zeCrydiH56Wdp198=;
	b=NYS9993NLbjOaKA9KrSnuZ1nU9eumtFsOrBg0m/lxd2SQcgN5mleB/pDBJa20+nTUQFwJ4
	oF3PU58kO8XAYQTbGpB9ZO8KR7OE5e3I3BTxX2UBr6cmkePnpcxYLccrkykxTrdgRi0fa6
	qX9+zZTxLgYzFZ0A9coaFtIl056VH38=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-I6IjGDQbP5agA_zvNsoIWg-1; Wed, 19 Aug 2026 17:43:01 -0400
X-MC-Unique: I6IjGDQbP5agA_zvNsoIWg-1
X-Mimecast-MFC-AGG-ID: I6IjGDQbP5agA_zvNsoIWg_1787175781
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92efd2ca21aso291059385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 14:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787175781; x=1787780581;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ9UK0HQnXCrAGrJ3T1tTyPOhL6zeCrydiH56Wdp198=;
        b=PlzUjieoFwDTDnZnGHtkc/JYXgXBaRT13Q3oDi//fdLN7ee9xn1aby8MMAqEth2lL2
         i7cEbndqUhpnt6M139SuxHfJpFWPSJJcngi0MbGf1GCXh4YKUxGcBDbbQ+JR+abn8mgN
         uPEG+i2qYtenK/MNp/1lenQvwuCG4KGxtPybAytXiuIUm0nHpiDkLGYUlwnGVMNA+mur
         xKOhHzDMN7QThlmNrxrGuh0vfJC6zUVPQlaNFcZ5QQhUvO5TbytGdTtourg+S1W2DQRs
         m6Y5jSOW2NhaTqbeC+eYIwQyjudA7AJ/ZSz4DlFpi93S1UfvO+sat7kN7AN2JCNiCXfs
         TO1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKMK93lwmh+E10OoMGmz/iZGiICzxsliuhVr5drVhijn2YYSeeHQjvDyK89m6bXtYRkM0udOPFqPBJvzo0VQGJ@lists.infradead.org
X-Gm-Message-State: AOJu0YycyYEfl/d1pwe3ETu3yoSsmogEbSgr7rSTX+OmU5Aq2s/z53u4
	7Nb+eWPNBsobhDA31xSYaxpHRFcLO5C2HyEK5NvKH8gWcrIch8zriF80iCmJDllm1FgZPvkoHV/
	Eb8iXmOre2zpHtHFmxpcPDSwohQOixzbNUgVL2Ocd4XOjXuTgGcVkUZCyMs7CB5N2oWmM4x4WMg
	Py
X-Gm-Gg: AR+sD13EXmQNZJWSnK69Dh5u3zymGsPVYMclDxSdtVwwLHYXJPqdiiKzTX3wLFklNWb
	zQqjk9AKOPjjJ0UhV9C42c00Sn+IpueTtCNLvzQZt7ZsKx+Ds7xA64dpWQc6SyVPRF5xKyKwQ4j
	Rqpk1AVD2iu6prILLDu2fe6K55fr4YF7KNZbsiRIGUnnXbAWNjyTASFo6CZ49DkAsInuNRpJCDV
	8l4kedDtgJY3H9nqXk8pzU+sOWJgocr5xQXaFiDrAIVnYVK5o15biJypNG4r5KbmWKYu74VVtph
	fdROIO6z1nC+UVmxcad2RH8AKDdFzh83yOhoEZ3O1qeJWcFV+kI4Uf59MqyHkv+Edi7t7b4CdHm
	MAT91BtP1btKBBHb/p4L07/0LAWtOQRNqqZ4=
X-Received: by 2002:a05:620a:2688:b0:92e:4470:f6a7 with SMTP id af79cd13be357-9371e1f7187mr727421885a.10.1787175780964;
        Wed, 19 Aug 2026 14:43:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:92e:4470:f6a7 with SMTP id af79cd13be357-9371e1f7187mr727417785a.10.1787175780441;
        Wed, 19 Aug 2026 14:43:00 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9372056b803sm225396385a.23.2026.08.19.14.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:42:59 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:42:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: mt7629: Properly use CLK_IS_CRITICAL flag
Message-ID: <aoYjYYpQ50JAgokb@redhat.com>
References: <20260813153113.3952621-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260813153113.3952621-1-ruoyuw560@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YSwT32k9tVmiZ67q9xmkUrpFdBX6uc9fUT7OKqllgBI_1787175781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_144305_834987_393958C8 
X-CRM114-Status: GOOD (  20.07  )
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

Hi Ruoyu,

Just one more comment on top of the Sashiko review.

On Thu, Aug 13, 2026 at 11:31:13PM +0800, Ruoyu Wang wrote:
> The MT7629 clock driver calls clk_prepare_enable() for six clocks that
> must remain running. These calls create permanent references owned by
> the driver. In topckgen and apmixedsys, provider registration can fail
> after the references are acquired, leaving them unreleased.
> 
> Mark ARMPLL, main_core_en, the AXI, memory and DDRPHY selectors, and the
> UART0 gate with CLK_IS_CRITICAL, and remove the manual enable calls. The
> common clock framework then keeps these clocks enabled without
> driver-owned references. This preserves their always-on behavior and
> avoids leaking references when provider registration fails.
> 
> This issue was found by a static analysis checker and confirmed by manual
> source review.
> 
> Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt7629.c | 36 ++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
> index e154771b1b8bba..627e8017fa642f 100644
> --- a/drivers/clk/mediatek/clk-mt7629.c
> +++ b/drivers/clk/mediatek/clk-mt7629.c
> @@ -48,8 +48,9 @@
>  		_pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift,	\
>  		NULL, "clk20m")
>  
> -#define GATE_APMIXED(_id, _name, _parent, _shift)			\
> -	GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +#define GATE_APMIXED_AO(_id, _name, _parent, _shift)			\
> +	GATE_MTK_FLAGS(_id, _name, _parent, &apmixed_cg_regs, _shift,	\
> +		 &mtk_clk_gate_ops_no_setclr_inv, CLK_IS_CRITICAL)

[snip]

>  static const struct mtk_gate apmixed_clks[] = {
> -	GATE_APMIXED(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
> +	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),

We shouldn't put CLK_IS_CRITICAL in these generic macros for defining
clocks. Your commit message defines specific clocks where this needs to
happen. Put a flags argument in the macro, and pass the critical flag
in. 

There should also be a comment with the code describing why the critical
flag is needed.

Brian


