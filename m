Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F3DC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hh+S6BT+/ZJJa40lL1O++OyyII1KUrPxAo2YLD9DsQ=; b=UVBpNhYNVqAAbZN0n+rVoZpBaV
	oRjuQhcCaSyIlBhlppccmTbPpYd/I6lVYFi5Pj93VsDoEpG9LMLFE+q9sYcRDJn5cob/8Ld/hpCdl
	yoxUJbXv/lwNYsad611YFMgRIRuB1kM7lkFcRtkkbfxF1zn5+BWR+SZVqLWGxgdrVmyov2RrIVhDs
	RssTtiUiSAnbrVoPsoYGMSCT+xi4186ggHK0ECPCd0ffWNOcbkiNH5x6Yw5jnOKJyPxJNpES5HWhr
	EStOkZrWKWxC+Uur+zXw8lIV3RZ5I6ZQuAknDS0WOmm0CPGmpj3u19JfCRPd8qyNRfBa/59y49eIq
	EwKYAfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX6M-0000000GzDv-1aYp;
	Mon, 24 Aug 2026 16:00:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX6J-0000000GzDB-20n9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787587242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1hh+S6BT+/ZJJa40lL1O++OyyII1KUrPxAo2YLD9DsQ=;
	b=AmpPvpTRP2i7zVduBIimiOY64m12EHzB7LCCPoEnZTj9mFXNa+Rn0bdI418KM1vMYAcY+O
	2IT7sibrBWu4p4EZDL/EAXyK1e4TKnw8mWN9IbfxmbTKc47wlVtteLVqmJj7fMI1yM3Kjv
	bKJAcCvf2Ht8+Yg4+mESDSASZoI8Hmc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-xEPV686oPqWrnVwiuztz2A-1; Mon, 24 Aug 2026 12:00:38 -0400
X-MC-Unique: xEPV686oPqWrnVwiuztz2A-1
X-Mimecast-MFC-AGG-ID: xEPV686oPqWrnVwiuztz2A_1787587237
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494527488so629113585a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 09:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787587237; x=1788192037;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hh+S6BT+/ZJJa40lL1O++OyyII1KUrPxAo2YLD9DsQ=;
        b=JRJWxjJajLNTolARwjXefFbNNqKFzElx4ChH2/h0/FRb/k8tBks1iwF62Wh1MX+a50
         AHZOrr4am8oBobMs2dJA9VnV5UueydI1xeshsyOaGa6fQj8BCI2BWUry4zRr+NWZn6wC
         lPJNSVShnBzUDHl+KFdgbUPKyrb9gynS3AhU4eyeVjFGEHE0adNzkxyPd1DwfXgN2tEN
         FCXbYOqddUFqNSDihQ59O8CiPmmkPjCJXnQm0N329YTP54UbX0O67CpZTRyhYrp7nQvZ
         wHGNvKpTsnSWJV+rUkhrKAhVML6lZ+wy94e1m2/txsZxDCa6U+OuWEMkQgpxwM0O+Wr5
         sndg==
X-Forwarded-Encrypted: i=1; AHgh+RqcCgPxx6hMEgaqTbnR+dF4wRT/URjGSSAMe0IHJLImIBzkIwb7O+VS3k4ECT/662vExZMyXxBXenMWd9sM3gS8@lists.infradead.org
X-Gm-Message-State: AFuF++l2QOEnwl1UPcehCWiBncnjwYl5Md6V7NMPcPF4hmycFa1lA6Ov
	aqW4pMZ5xqExlBDGrXZKecbLurzgqimC4hzRsHVZcmJAHr/DIcM1zzvd0aENdDx+PMWiM9ke0JA
	oX+L1xX98G7fzZs11p6MCoyn5O/7Wx5gC5NUVoqSDgdauGZjjGZ3V3sVEFrfsCkfW++bFBO8OeA
	2a
X-Gm-Gg: AR+sD11hwHpnxT1h/O3CNGbrHHJK1/IJtCK20dNp0T8CWLAveZIXjL/yAurgi/NreS7
	j4o/lPia+RdZSWiQMA8JUHPN2/RYf0AMHFDK/rrUfeI1x3zPbDBgwTjkea/9pr4hypSnasJ+s72
	rEtIe9wIJ8SJ382p+svyUX7jEkTkTDurYdF+pCpueepLMPuzY0PO9PcOa2VDPKfkKmGnSumSsvr
	OJ9Eowtfw8HMLx00AVQ60tlCT7uXmVtFdaWWHRJOr6NOlNeknz57jRL23KDc/ewe/rlXMKIvUsZ
	wzOTBkNpjChPleNhZgKcia9JMnoRh6M01FOijGsdsKvJwpgxWKbT2WQscVkNjB+Nwn3btxQnEbq
	dvaKVIk7AgM2TTNzywwKmXvynHeOCEjXExyQ=
X-Received: by 2002:a05:620a:c55:b0:914:afc1:c66d with SMTP id af79cd13be357-9373945a4dfmr2575003485a.11.1787587237627;
        Mon, 24 Aug 2026 09:00:37 -0700 (PDT)
X-Received: by 2002:a05:620a:c55:b0:914:afc1:c66d with SMTP id af79cd13be357-9373945a4dfmr2574985285a.11.1787587237031;
        Mon, 24 Aug 2026 09:00:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749d9531fsm532494885a.24.2026.08.24.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:00:36 -0700 (PDT)
Date: Mon, 24 Aug 2026 12:00:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] clk: mstar: msc313-mpll: fix off-by-one in clock
 array allocation
Message-ID: <aoxqosHN8sqiR_XC@redhat.com>
References: <67ec3261-9f3d-4dcc-b916-19dc8be56a6e@web.de>
 <20260824142800.3497263-1-hanzhijian1991@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260824142800.3497263-1-hanzhijian1991@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fg8dwQKjUsBmNK8AHYvWCcQ7R6fTrxXo1DYYZ6EL4ic_1787587237
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090043_592978_7BC11E5D 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, Aug 24, 2026 at 10:28:00PM +0800, hanzhijian wrote:
> The hws array of mpll->clk_data is allocated with struct_size() using
> ARRAY_SIZE(output_dividers) as the element count, giving it 7 elements.
> But the probe function stores the MPLL clock at hws[0] and one
> fixed-factor clock for each output divider at hws[i + 1] for i in
> [0, ARRAY_SIZE(output_dividers)), writing 8 elements in total.  The
> final write to hws[7] is past the end of the allocation.
> 
> clk_data->num is also set to NUMOUTPUTS (8), so the clock framework
> reads hws[0..7], again accessing hws[7] out of bounds.
> 
> Use NUMOUTPUTS as the element count so the allocation matches the
> number of clocks actually stored and exposed.
> 
> Found by smatch:
>   drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
>   error: buffer overflow 'mpll->clk_data->hws' 7 <= 7
> 
> Fixes: bef7a78da716 ("clk: mstar: MStar/SigmaStar MPLL driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


