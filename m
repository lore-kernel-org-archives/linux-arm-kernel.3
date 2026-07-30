Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28681C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dR3ZygedUQjRGCKUSRpWTl4Te1l6Y9QC4qZxoalTtM=; b=S1vDPAF52dRjeS/v1Y/LqvN3xE
	L6ewZcSQJc0JzKfC1g2daARa5kex+R+IFVTzsIrVw6iS5Q9oYR2hUyFiAw00IM/QpiGZME4CkLPxx
	vtssVuSAl4bFq0EqBrf00To5Sx11WsMTyGtifVgnlX7f7kk+twCiLkRsewu9D6U0FTPI9kQ5QOvF7
	qEDKrBi1aiZykdtjwJVIuoCe24Qu3P00TJWhQ+2dFwhLgN2p5f5QLgRgJj5QijqHT7Rt0+mGjVRDI
	2tEd6GtxHhmXRSXJzxiCwRGox0QWX+Ih9gt+hMl0+k/uf/Teneovhz/QO2DmdbPSnY8v5fjKikQCE
	GLGra2jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpThQ-0000000B0IP-0CWi;
	Thu, 30 Jul 2026 16:33:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpThN-0000000B0Hc-4B9o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7dR3ZygedUQjRGCKUSRpWTl4Te1l6Y9QC4qZxoalTtM=;
	b=g6qV7dxm/jgItEgD0k4wzo/KioK195dNkenj4fDf7YUnRe/XGcGqIli+ixpLpf6GMmXVA7
	HYYl7U/gmHDfG73Jy+A7cj4Robe1IwU4wLr7HvB65ez6ELmOFIlzL4kA6jb78BQRpeT3u5
	xaHVcK36ZGysW+3JEFFAJbWdKyIR1Ak=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-f8s2Tn5PNGm6qqEBRk59Fw-1; Thu, 30 Jul 2026 12:33:29 -0400
X-MC-Unique: f8s2Tn5PNGm6qqEBRk59Fw-1
X-Mimecast-MFC-AGG-ID: f8s2Tn5PNGm6qqEBRk59Fw_1785429203
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81f8ba7885eso265727b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429203; x=1786034003;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dR3ZygedUQjRGCKUSRpWTl4Te1l6Y9QC4qZxoalTtM=;
        b=tIreFvPuz/N9Zcas0bmXKS1MZBzY0maGLVSo1ryO+yMl4K8tZaXTYZlGUVp7ck3hIf
         CdRbdq2QthAyvse+WFu0LksfB0hPho7x+E9n6wBOe7yiYfr6mknYRZ+VeEXRZusMHqWQ
         By0VkcOiDy0GknuGR2uJ9BCxKBHFZKqLlKWr56fNKt5Owox3Dsdht+LEF6WeHJUS+MOA
         Aq5ycJC1TgBrZeCHD2sAfUWuYo6Ob5nn4ab1Yap/tJLcRFT6cG0iqfspYBZARfSr5NdA
         Svcr7AgWaepjfwj0jsTdS2qcyGtltseZTf0LfaWETUzkXS2/ThcbDL1X8FmRagzaidb3
         g/Ew==
X-Forwarded-Encrypted: i=1; AHgh+RpKniORBM6PJMUV02r2gVJ4lHRYeGn9x3AURm0d1JoZedyN0sBxq9rEjlzvKU0h4B91wC9AevJjUZLY9j8Anx0C@lists.infradead.org
X-Gm-Message-State: AOJu0YzY17ae11NNSjkMbo6GO8Ai9umyJcSsuMVvT7Y9SQ2FFUH0CpZp
	74Rmnv1QTIyaXAloKzplacx6IjiRaW/jEc1+J1Fv/ckq+eAhIi5LYW6rYn5mpEQfLhYty+RrHDb
	4klvtLBXV9OH692+uYY3cr66FeAF0tLMNULqel05buVJNgR/fabJis5qDLKOzLqf5xOz+e813A4
	mA
X-Gm-Gg: AR+sD124F2CQrZoUY2w+YqnscTv+EcL/ZIv5bTqJqFLBdjzK7BfCLw2knqdttycQwJG
	x+WRv+QXGOdmyU7DuV0rxBK4d2gj83rpPHm6CnxwsLZpMV1iyMqUsuzxm1uqA7+abEN7I9TJSqZ
	lK8l5Bq/0fozsRkQQs9DQF292m6QeoiT0t5hQXO3xdMq3HpYdQUeD20qj4R7XJZZdcdNQxtJiPK
	0Pz1XhFS0/rHbGx/dtOiisLrEu/2A7LLan8QWWzlYVjtbcpn8QOjR81kvTlr9TSlQtsQJHzyILh
	+uC8DnTtOIgl0ltL6b1gD1LZl2KGcav3imD3h6cL0dKV4gohjpdaLCAsI4pKgC65aFM9kbRfbOR
	3Z10/opRDbUxBUtZHtKyRsdnc6JZJSNXY2NU=
X-Received: by 2002:a05:690c:9c05:b0:81e:68f6:f842 with SMTP id 00721157ae682-81fc1dfc3f0mr7119917b3.3.1785429203167;
        Thu, 30 Jul 2026 09:33:23 -0700 (PDT)
X-Received: by 2002:a05:690c:9c05:b0:81e:68f6:f842 with SMTP id 00721157ae682-81fc1dfc3f0mr7119457b3.3.1785429202515;
        Thu, 30 Jul 2026 09:33:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8ac228csm12990017b3.35.2026.07.30.09.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:33:21 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:33:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 04/11] clk: realtek: Introduce a common probe()
Message-ID: <amt8z3G8lIitanMm@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-5-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260728142806.1954638-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o3wbPAjrxF7B8K5UkK8dve8VAbP921jDfXEckWsPG-U_1785429203
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_093334_209578_31067132 
X-CRM114-Status: GOOD (  11.91  )
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

On Tue, Jul 28, 2026 at 10:27:59PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


