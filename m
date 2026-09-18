Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDC0C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmUqK+rq52Mp671nbFhAqy/BcNTM6h9Cl3CLl+lByKU=; b=ycP3gTy8+7AlZ7bRaGmRfPRhvu
	uzXsqCt54zcrgHpzaVwzz+r4AUtdYTI0RY/1WAqTbNCFyVGBUDEFohv1zqVRBapkK+jqU9o1Iqj9M
	D9MmKZ3j1tdyOswLQfMymDt7V4gqrFmn4enb2DyxjH2DOK4TX6YjztBCKCi7pOIza+TVFzls4e6C4
	t+90h0Wht1CeEWYeSc5nvLh/YkLYlSoX5Uy/ddRpKYdr4lwEpna9QD8HFyr2Z44kj+hpeArrrgLOE
	KPniLcOY3myzPNvHFCwtHCCLyFWe0Z7wyMEqadlPRnTO3wcbKdf8EBTpbM5GfW3daR2g6OwstTnbF
	3RRrMmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7h3o-0000000FctY-0a72;
	Fri, 18 Sep 2026 22:28:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7h3m-0000000FctE-12nQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmUqK+rq52Mp671nbFhAqy/BcNTM6h9Cl3CLl+lByKU=;
	b=PfWMPZ0ONIsqZHGrkY+2yrQyJTVBdsm1x3YKMyBzjUxPlUPnBMW21liXGTFgNsLnF/toSN
	H4vVVPvOvxPmyPAhINTVUTsf0jF7qQQLHi1obmAqTOVqupTDqZ2D6TEUuqn/n51dlR5s0q
	Ff36P41jUc1e/nfgybMpInyX33QtpPw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-7f4MF4nnPQmrq02vqPF5RA-1; Fri, 18 Sep 2026 18:27:55 -0400
X-MC-Unique: 7f4MF4nnPQmrq02vqPF5RA-1
X-Mimecast-MFC-AGG-ID: 7f4MF4nnPQmrq02vqPF5RA_1789770475
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530d206e2b4so25930591cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770475; x=1790375275;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YmUqK+rq52Mp671nbFhAqy/BcNTM6h9Cl3CLl+lByKU=;
        b=SbWZ5b+UGlxOppk4HH+BA0YUcdcvm4j6LGqIGQncc7l71YJd78p/3KSSAQi9y+QOZJ
         BjtNqkCx3fDWNKeJLURc6b7CVwQytq6neEBtLlWRr0Dr6hlhgl6HgHtK+rHujqYJTYR5
         GbA29P4nKHrbZQvK90dcD9QKOKpMS97anPupnFtAFB+jn/ZKMNl4r01QMlPK3a/OSakq
         bYRFOtI2XCjcsCWYwkDXlJxf8UK7RXqTKiQupNzm4Id19QOQ3XcQL2trGlDHA//9usJT
         kYpU8DwzN7UvFlJeFjsCo4g/6LA+u3JrfwfpKZWyhWtRRCj/cRL5mFuCF5Xrq9n+m/qi
         KWnw==
X-Forwarded-Encrypted: i=1; AKwUvBz9DYTdxs7nzRUXSz57NOg/TlT5uItUd4dpTINGCMHhueCmrXC/qq8SZcEqETs3omsxluJmnMtIjN2UkxRz46BG@lists.infradead.org
X-Gm-Message-State: AFuF++m2s70znD9QOkgfnGeJvMvkKGiFHdgUk14WWXnAa96g6kEOGH00
	yv1C80LkVdO5WjZLl8b4c2Dg5gO3FIEyJEm9TmwMIj2Q4TaUrt+RbBewYoE0uolhRVWZEYoPbbK
	sjkGBH4mY9LUIXAA91ch68rWMt8Kvqi1mIUxFkNSnZnoa+6Av71IiJSdLfSh77ApczGtsrVu1nW
	QA
X-Gm-Gg: AYBFou08TQnc/tZnIL6tz9yIcUwJeYInNMjTZLKPxhL+5eQamhj34oiLMWEqTvnB6R9
	wxVXPmIqaS03dWYOWlRG3+wTCdQae+eGhprnWUXM97wu3R+hn4b/xSVSkutstJiBHtfGrj4QIkh
	wF4OnNohoB6N+889qLiIEwcbMcEwFCfd0stTLaCD7q81I6RWV6O4VkVO+b7I/k0wkN3QMHJ/2wD
	DqRPcg4RyetUT5ouUOj+IUpnfLAqIxzBjHv+c4+qiyAGe/xvDzAryeuAR1BaGKF1Puro+3pXcCP
	smVaXlyvvt9XysJB/LQyKfrk08z+QX0Mj1SuOFczuN15OT3dG7Ff9IAA6REkrRds1bS5/AM=
X-Received: by 2002:a05:622a:2616:b0:532:9ade:b6da with SMTP id d75a77b69052e-5329e557017mr77338951cf.67.1789770474836;
        Fri, 18 Sep 2026 15:27:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:532:9ade:b6da with SMTP id d75a77b69052e-5329e557017mr77338571cf.67.1789770474435;
        Fri, 18 Sep 2026 15:27:54 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae750977sm7202701cf.23.2026.09.18.15.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:27:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:27:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: clk-icst: Fix node reference leak in
 of_syscon_icst_setup()
Message-ID: <aq266FMPwj99yVCz@redhat.com>
References: <20260915070103.1733176-1-vulab@iscas.ac.cn>
 <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oml4MmDqQArlEAnNEuO1XgbaCovNb-ITFPymm7LZ9rk_1789770475
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_152758_383332_42C9918B 
X-CRM114-Status: GOOD (  14.13  )
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

On Wed, Sep 16, 2026 at 07:25:39PM +0200, Linus Walleij wrote:
> On Tue, Sep 15, 2026 at 9:01 AM Wentao Liang <vulab@iscas.ac.cn> wrote:
> 
> > of_get_parent() takes a reference on the syscon parent node. The
> > reference is intentionally kept on the success path, but the error paths
> > return without dropping it, leaking the node reference. Release the
> > reference before returning on the error paths.
> >
> > Fixes: d430819d69a5 ("clk: versatile-icst: add device tree support")
> > Cc: stable@vger.kernel.org
> 
> Stable? Really? It's no big deal.

I'll pick this up but I'm going to drop the stable tag. It'll probably
end up there anyways with the Fixes tag.

Brian


> 
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij


