Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8B1CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 19:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icHrK2aTsAoupO6HF7R3pIp5ly1Gmg7Tm5VKudfF+po=; b=l1TdLEca4EylnmsTfmBzySOkkz
	rdmddH7ij/jpI8wuaWF8t6z3yYdAHL/v7x5rELBh/9enZYdcEtJGxfDYncl7cvVxoYyvKXyLzM0wh
	ILRb6kTXLUletwDS0K4lzy+DAvyctur4+YDVGROCBkGQd0oYlTjnOUN98Jt67hnrk22k1ymXA0ScM
	PU85Hsbq8jwd5FFNCzFIoHeRfdp50Y9naHhKr+tEhgWKoZF9GKW1Mmxtxi6GqOHa+qA4WlBR/xeVe
	uANa9bIWTwFVmsZuQoc4MUqrK0lpmccZW5e35Q68z+lB9VmCmwqdZzHeZaRQQMmu67Xea6dr1QXSw
	Xa+4gJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZMY-0000000GFbF-2fEn;
	Tue, 16 Jun 2026 19:22:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZMV-0000000GFaq-2lWm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 19:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781637732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icHrK2aTsAoupO6HF7R3pIp5ly1Gmg7Tm5VKudfF+po=;
	b=OWt8kZTFUc0p0FrIsL+1YITp7joNoKajE9f7Y08iUvzZ51TKNinPiADAlYfRUZHJihHi1p
	yfmp4oeS3lVBLSV6x2PKdX79RG1miU5STUS9i8sdxrXJIj489gqSHjW01mwrPg4y6uln3G
	ZydXhWDB/sFZhmEx80UCLE7xn+Rm1TU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-XenI0DkeOFi-I3x-pLcyOw-1; Tue, 16 Jun 2026 15:22:11 -0400
X-MC-Unique: XenI0DkeOFi-I3x-pLcyOw-1
X-Mimecast-MFC-AGG-ID: XenI0DkeOFi-I3x-pLcyOw_1781637731
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175a1e32e3so125459791cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 12:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637731; x=1782242531;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=icHrK2aTsAoupO6HF7R3pIp5ly1Gmg7Tm5VKudfF+po=;
        b=FcrR9yRJHKv7Q6r0DS9UEymdWP56EWvzvSvhtnvO10JAr5bpoAF9yPzlnFt5Fuc4Cs
         svtX0UuXunJ33GHTIJJFp3QbRNDBoGKNLloA/gKAehobZB7ujnAjjlHMnAJy6U0fwZl1
         WhHSTvF24GgUHPAeb5G9+6hlOOGAA96LriXtspQu3mwwZ2CpaWepS3QjKiY7viPuVxMI
         XpPYq9X7q4xYeSsKzZZjsbE3yK0ZmrF/8fPvEWgR4PLxEV8yeHcXS0dubtLj93wJsdu7
         SSdsv8NO/OhKggmG36DeMqbJBEcNvZ9/uEFBvEWbrPlxHWFaJxogBbC+cGYk2c/5KB/Y
         /vZw==
X-Forwarded-Encrypted: i=1; AFNElJ+RyVyvWgz/nvmgnPz3m2deSjz+zXkP1s2/QDUqU2HnVBdUyzp9CsO5Cdiirg7gFVysaC0DJdlFU8gkC+3dRxK5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmjh7NmJglA8WXqvR7oCmhOx5mdHno+ah8ZsLLwpN9TdIKWG1q
	j3hdsaxEh4CdQSNbnQCjORr9vSd1Q7x1Vfivy0nrGXTwqpXvwZuXug7bNC+n+jxg5vMWnFPNmW0
	f0QvKES77QzY6tNcwiiUogsxN9EUBwFrE9sFvN6dhU7ilKcVpTxFc2O9ilcgUKbwEjEYAdOCnzt
	r7
X-Gm-Gg: Acq92OFu277drbo6BqeVFbZV6xrzUHoFfcIsgFABDVyTwCNL/SNnQdxB4wL+bsHPsGt
	CFmIGA5HnAQ/euzjsz092V13U7rrnw1nYFwlpIz5QJSTs2wYQP+fJKho3XdkiGvVv8p5G6/aUEF
	MpR4qjoK59GTVMipMRlZDKrtG+WZwRBhGW998nA77Su7zcFGSUuqbdkpl91Cqnz5UWEPYENImi+
	KfqSpiRABLdFne8sDVzKY6rf4oay2rTU808wTcf5CLZ/jK56M+lpMalNKu/CJXPoTAY1EpJPtHs
	rvoHyb0NCKGVdPjbKpk/GKTXs0jMG10LGHUJm4omabMPT0BdPe8cinAtPb3s6nxm9ne0n8aAZpS
	Z9vgUNxA/enPugJ+/qtzK
X-Received: by 2002:a05:622a:8cd:b0:517:6afc:b644 with SMTP id d75a77b69052e-519a8fffa38mr13241501cf.47.1781637730971;
        Tue, 16 Jun 2026 12:22:10 -0700 (PDT)
X-Received: by 2002:a05:622a:8cd:b0:517:6afc:b644 with SMTP id d75a77b69052e-519a8fffa38mr13240961cf.47.1781637730415;
        Tue, 16 Jun 2026 12:22:10 -0700 (PDT)
Received: from redhat.com ([2600:382:8500:43e0:4da9:d4f1:1887:ec76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb79df4dsm147042751cf.15.2026.06.16.12.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:22:09 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:22:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: mvebu: ap-cpu: fix missing clk_put() in
 ap_cpu_clock_probe()
Message-ID: <ajGiX4JoGXaMu_-w@redhat.com>
References: <20260616122936.1669366-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260616122936.1669366-1-vulab@iscas.ac.cn>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nsCcOFq1csemcgvUSwnR3IBxLGkxtXRXs43dFX1I5NQ_1781637731
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_122216_155828_03B8B497 
X-CRM114-Status: GOOD (  15.36  )
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

Hi Wentao,

On Tue, Jun 16, 2026 at 12:29:36PM +0000, Wentao Liang wrote:
> The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
> reference to the parent clock for each CPU cluster, but it never
> releases it with clk_put().  The returned clk is used only to read
> the parent's name via __clk_get_name(), and the reference is leaked
> on every successful cluster initialization as well as on the error
> path when devm_clk_hw_register() fails.
> 
> Rather than adding clk_put() calls, replace the of_clk_get() +
> __clk_get_name() pattern with of_clk_get_parent_name(), which is
> the intended API for this use case and handles the reference
> counting internally.  This matches the pattern already used by the
> sibling drivers clk-cpu.c and clk-corediv.c.
> 
> Fixes: af9617b419f7 ("clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

The Fixes commit you listed missed this, and yes it should have been
fixed there as well, however the Fixes tag needs to point to the commit
where the leak was first introduced. In this case, it is:

Fixes: f756e362d9384 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


