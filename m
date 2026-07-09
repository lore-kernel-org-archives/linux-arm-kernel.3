Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B83C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92JJ36rrwvvb7yLlV9W9rV0xnJPT/KBmVXI1YNHLk7c=; b=Okvgl2Go8W1SE3wrKdTmmhCa++
	xdRe7grT9hQnDzfP1ZZFk8wfeC3gTTk/wetPqRcPZrDJsUftG2Nr4ZcWoar08EjmH1gNzKTUSQ5Q7
	PyctriworBlgBiZJH7i0cbtB17IH/Hy25MoDL47WQgxT8TL3RP+DNpL6bgE1nBZrnUzOe2dmlJTPO
	FXiht7xoJRUxb+UpJicqG2Sx54ped0iuDRGsMmwUwyNAa6OfIGjvi+BFz6+6xhnhpbejr+agsfS46
	CsCEdlwoCyAHmkovQ8kBCFZ50GcP5PrvI+W4/aOAvsxekNOAqio1DlJ1p4dqFaOBn+fkknV4+Qu5m
	/Pddkyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpjd-00000002l67-2pyj;
	Thu, 09 Jul 2026 14:28:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpjZ-00000002l46-2tud
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783607292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=92JJ36rrwvvb7yLlV9W9rV0xnJPT/KBmVXI1YNHLk7c=;
	b=jTjzgptwPo20f9zD7f0S9uwQWmbqDBjnYzNBwkMSWoLfWn/OhaJvNvzzffNfpZiMFPiPXA
	/ASFojpjyIFs1/DbXAd5dA2vqQ+Dh0mT5waEYkGFMHzHwVo4teWNOLKxqPRB64F24FpHez
	RAgI11AEJJp8RfEY9s/k8INxalFygFc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-0eN5Q217NtGZKNbslfcsqA-1; Thu, 09 Jul 2026 10:28:09 -0400
X-MC-Unique: 0eN5Q217NtGZKNbslfcsqA-1
X-Mimecast-MFC-AGG-ID: 0eN5Q217NtGZKNbslfcsqA_1783607288
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso36193051cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 07:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607288; x=1784212088;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92JJ36rrwvvb7yLlV9W9rV0xnJPT/KBmVXI1YNHLk7c=;
        b=RdwyjD5yxwuLqoFZBpwLLbp7OfpGg072u5M73YMtOnjVm+IUPkJWP0/f6maqAZj7xZ
         Eno9NUOdWkkp36eBcwUJ3YNlHsKvVd2EY5AKA3YKkI6y2qFn/hyGSRZqfIjXay2TwzI+
         s01WWKWHQuxo4zkZBeVYolS27Yd4sevR6+hOGVpVdzcRijUcOZFtZNDpj2gcAf+fvheP
         NV6oPdBA+fgFAggQOxW+ry1Y5oJhyEEOhetl5JWi9PGNYwyjuJdCKVywo3itMGfUD/ku
         taHpTq18uZJA5sB0Jyb9xcHeiYAvZLw9hhQogoRUgg1XlEV+ra/8WR7bseTaP38OBdMD
         ihXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMvjt97SX4XrhfsItxTggZUOJ1W2wY7EJ2CAcPaReOnyNu/u8oBdPtKwwjVbR1RBf976v4b4DUgqjSK2I8yvHt@lists.infradead.org
X-Gm-Message-State: AOJu0YyytwWHIDNbsKmcBu5ooYGRAPcdRYXLvWeBR6Hkjxd8QBo+S+9I
	WFb2Jplm4BuIZ1jlaLbm4aiCYHPQAH0diTNvw3FzveE7y+0awDVM08uVjEgMHnlJTwOzQ8Q+tL6
	sNXBrm31SxsVQ65UYlybl9R/9AjX2wXm1u82VKzkHelzdSXgXcNmXwTyM2DSzQOU++f5COR2C7c
	dxVImmdg38
X-Gm-Gg: AfdE7cl9BZI53ZtXcjfoQXwAtHJAJty8fPl500LkoHEiTHGDQaMmQndOtKuBvt/aKQq
	m3TFqh5AcQnZCY5hYcM879IBCpem2FailNKqqlV4qHPAY5Q6cmnSqvxUDK6BnDWKyujyD5YVsrX
	nthAeweq9y/tZ56HM6VjOC9dQGXkQ9XW2vBO3vtGaqTSez9UB/FxwEIU6dvPyFEtsxyM+767BWq
	SVo0KtfTmsy0a6TO3Grn3tYhQ9w22yOih6QJpCVIN+8H+W7lECFIl6KxAc9kbp+yiEkKD2atAuQ
	87R2YWRTjCG4VzF2lKZo5BUg4Uyaq27luXU1M+89rjprhmW5Sc/dd6Lzss/B32WaxoLyUjjoJf6
	wr8hwOGoZlKHpRhNqtn8k+8n2PS+WEbTgLzmg+mJanDmq0A==
X-Received: by 2002:ac8:7fc8:0:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-51c8b399047mr79250371cf.5.1783607288360;
        Thu, 09 Jul 2026 07:28:08 -0700 (PDT)
X-Received: by 2002:ac8:7fc8:0:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-51c8b399047mr79249991cf.5.1783607287938;
        Thu, 09 Jul 2026 07:28:07 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2cde7sm173167731cf.18.2026.07.09.07.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:28:07 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:28:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] clk: mediatek: pllfh: Fix IO remapping leak in
 register_pllfhs error path
Message-ID: <ak-v9MPymB4rg9rP@redhat.com>
References: <20260709-clk-mediatek-pllfh-fix-v2-1-a235078fe9d5@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260709-clk-mediatek-pllfh-fix-v2-1-a235078fe9d5@collabora.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fCSnS2Qn70zt8srSuc4ENTaq5NVojczCWh3OyKLNpas_1783607288
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_072813_820411_974C3E0C 
X-CRM114-Status: GOOD (  16.44  )
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

On Thu, Jul 09, 2026 at 02:23:00PM +0200, Louis-Alexis Eyraud wrote:
> When mtk_clk_register_pllfhs function fails to register a PLL, it
> unregisters all PLLs and cleans up itself in its error path before
> returning, so the function callers don't need to do it.
> 
> But contrary to mtk_clk_unregister_pllfhs function, that does almost
> the same sequence, it does not free the IO memory mapped on fhctl node,
> leading to a leak.
> 
> Fix this leak by factorizing the cleanup sequence in a new private
> function and use it both mtk_clk_register_pllfhs and
> mtk_clk_unregister_pllfhs functions.
> 
> Also, change the loop index start value to avoid the -1 operation on
> index at each loop.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


