Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3386C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyzXCjgWOyXuqJ0/mqD/AnRKkls0LW3h0CWtAPFpsi4=; b=pmJYTAUQwCfLyIkzl4ntN9b9JW
	8fAMNbwrMAeTmHjKLFV7o6z2aiDFLn5X80uataX7awEp9JCvqDJYVaJKfFhKmkWWHnu1YqOPZVOGq
	AH5Bib/wfYgn7tWzpsEtCoaCn1u8kBnPSH0gIeKHyNVOui7qItIcfG3Yp9vcghZu6g6lirzgKJjsX
	JejOqVmy1rDAyyO6XOirJupeHNG+dNj4DKk480/5pdXCL6gQIh+X5EyExNyowqY9dHJczuehELXbu
	JxZup8bMX/1zMAcIi2G5eigb+ohCZtvPklRsrxv2xiUj7MJwKtbfU7d9fvVT3N7OA5jzZv7BfHLbB
	qm2dOZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsI1-0000000H6C8-2SSr;
	Mon, 03 Aug 2026 13:01:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsHw-0000000H69u-2NDc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vyzXCjgWOyXuqJ0/mqD/AnRKkls0LW3h0CWtAPFpsi4=;
	b=Gqii3zUAIHJsqFvSkQiTT3dj1CgprTEYPUS7nA3CXdhzS2g9u37mCnUZHMSCl7lCFE306M
	RnToNataEhk356tOMOCCP9kZiPfdAEwloThDJ7wq2VBk0VhupbGZk7WbM0XMVuY9jwzufV
	fe45YLQEa6diEHYHyNjcYc8rwmgBSo0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-oSuu24tQNcK9CVnHXF-nhQ-1; Mon, 03 Aug 2026 08:59:20 -0400
X-MC-Unique: oSuu24tQNcK9CVnHXF-nhQ-1
X-Mimecast-MFC-AGG-ID: oSuu24tQNcK9CVnHXF-nhQ_1785761960
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eb7dc4e28so120915927b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 05:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761960; x=1786366760;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyzXCjgWOyXuqJ0/mqD/AnRKkls0LW3h0CWtAPFpsi4=;
        b=OCqej2MOZ6Ub0PN4bdk+5lD4bKBP0yWtZjMCnI1X+39NOnyRa0t+fa2Jfd+8y3RiFq
         LvlK4uUECZ8pRXqRSkrEJhJsg7CwftJyULy64wGBPYmI4O5p5EV3rdyurDVIWyJyRC3a
         lWHp2FhffYB2/CrOMuXRBrbtYcOdU7F82KYzb7fhzLhB3m5rUp1OkDRc0nPPHgFieJJ9
         khhwRgu2+tha6Cvhf+TWFwRX/N5DAS9BijBEB8QhQE+sGvrOv78+n75318iEozOmU9Gx
         TOCxznYAzYOoBheV5qccJtFDQJIBwyZfW8dxGLVtHau4DTM6X8SCgqeh+nqGLALdwld1
         UUQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVjj7N/JvRxkzb4hGCGy69wn8XPsHhp+K1IL9B4Uj3vy+U8zCC+P5Sgz7aaRHlZ0YCmS+0ki2BAfYabQ7EGkZs@lists.infradead.org
X-Gm-Message-State: AOJu0YxGvLDJkNA6TPLBIVBrWyNu4+2Xms1K9VB8zkctNJ2z0M90Weh3
	HKm08gveRwSNBlK2CNCLXWdtROtb0WtG4rHUGzQBxEdlathtJSi0LWwFwVGcI2h92HNGmsc2L1l
	BLG0dcEYajPqDzUYqfaHoMljf+rLtmBpFQ0gbdPlcHTGEaPOJQs3yUFpKyWUlVUA7tse/yKs+9/
	3MOmikeLyy
X-Gm-Gg: AR+sD10zTO2HbncOo+zhSSIPj5Jd4EPACA1RuQAB+CwYnJV3dA2etqfEvvD2l3EG+P2
	ZHjOBS+vZRsHEmVHWelw+75YlwUETsxANDa90NDwF9RQifhPxUvWChixvto+S9TASN7FjVOCGBE
	6aMz9dx5UpfUPrnYOZNG5hQDsZt/tfETvHlHzjLrJmMH/ezkhZ4oK2G+ad04705btkUmq/Vs7sg
	M29mA6Bm//ByYzXzcDgboTAo8QTIyj7JbNFs9c67KCLpwFeBz7U8l7nViBst56wNd7Wf53tP9AI
	vPd9xgCyxucyI/fSAPnW5y+93dWjd0p6nCqID3EVrNfk0UK3wDCg2bJbxbJwryrwyTSdRYNcHAF
	68bAD0h1n71bwzAX9Fw1ytBw+KK8R1hwX7Ak=
X-Received: by 2002:a05:690c:670e:b0:81c:c77b:3546 with SMTP id 00721157ae682-81fd4b5a1fcmr127824457b3.21.1785761960042;
        Mon, 03 Aug 2026 05:59:20 -0700 (PDT)
X-Received: by 2002:a05:690c:670e:b0:81c:c77b:3546 with SMTP id 00721157ae682-81fd4b5a1fcmr127824077b3.21.1785761959385;
        Mon, 03 Aug 2026 05:59:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd1240d6sm53683327b3.40.2026.08.03.05.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:59:18 -0700 (PDT)
Date: Mon, 3 Aug 2026 08:59:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: zynq: pll: Fix kernel-doc after determine_rate()
 conversion
Message-ID: <anCQpAdZI0jg-KAe@redhat.com>
References: <20260803063126.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260803063126.7-1-bbnpreetsingh@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AaDHtfVxcekjrH3AblZB39Y2hHe9eumSpvoo2yxNJuo_1785761960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_060104_677142_9DAC3AA9 
X-CRM114-Status: GOOD (  12.64  )
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

On Mon, Aug 03, 2026 at 06:31:26AM +0000, Babanpreet Singh wrote:
> Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
> determine_rate()") replaced zynq_pll_round_rate() with
> zynq_pll_determine_rate() but left its kernel-doc block behind, so the
> block still names the old function and documents the removed @rate and
> @prate parameters instead of @req.
> 
> Retitle the block and describe @req. The Return: line described a
> frequency and referenced the removed @rate; the function returns 0
> unconditionally and the rounded rate comes back in @req.
> 
> No functional changes.
> 
> Assisted-by: Claude:claude-opus-5 [kernel-doc]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


