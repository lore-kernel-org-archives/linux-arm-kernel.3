Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25695CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 21:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CvKAGdCUW18KUmFYuMA9APTtSF2TfQZeTic6jDx6AY=; b=pMufRin7Svz2RUltW5st6izXXE
	L4tbF2OAzI48HiTV65/4kN4CaOAu3fvdoeIS746+d25Up0nVbUJmDRzVTg5stQrqxSJrypoYDDviC
	Vp3QGlYf0v5E3QE8NrHEaLozalJDh2e+FV/p6aWF+ckc53pFSuRiMhdv3q6biiGxlsuKTf5AcSpZ2
	ypUKdCyWop0qqAovy0JdBIF8jtq93PmQn/ZKvd2jFoZHX+HhKwEoBzfGsHdUlcLUVbQmI7XWlTp2E
	7dbn04rlWRCAObTEXSlFP1cU0QHxxd3Jrk05/p3hni4OMvAZhzu7Fiw/XUBCzhZgYLbReyTW9+Wn7
	Kmppmczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZEre-0000000ErlF-1jne;
	Mon, 15 Jun 2026 21:29:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZErb-0000000Erka-1Vzw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 21:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781558937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CvKAGdCUW18KUmFYuMA9APTtSF2TfQZeTic6jDx6AY=;
	b=O0oX8rgGW7kIcNrGrvNSy9m0VCpUTeyqM7Nh9BlpSn3qRk1M3zR4PsT22HPJQ/0d0gzDq3
	iHXOSZsxpPGR45kPBmy+UjiQ4eR4SCvdK7L7cfHjOCtufBrqUiHUJNfM+LWaEtgzdJXGGn
	ZUnmWOQCli/vS3KpZ0qTQ30n2H5zzbs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-J9UvpPtOPSK2NFa7tV4wAQ-1; Mon, 15 Jun 2026 17:28:56 -0400
X-MC-Unique: J9UvpPtOPSK2NFa7tV4wAQ-1
X-Mimecast-MFC-AGG-ID: J9UvpPtOPSK2NFa7tV4wAQ_1781558936
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517ac42d958so73354681cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 14:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781558936; x=1782163736;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CvKAGdCUW18KUmFYuMA9APTtSF2TfQZeTic6jDx6AY=;
        b=JcnHlT60zOPS6zFXp6YGcDvuwjw996LTP5VvsRCeeUrYp4dD1LJEc5ANFqARbm0McX
         +8el6qL6PiW6QJKZT4fgSe4gCm6Ul9DhQCU2H1z1LtLWpxq+SgQqTQfnGNPHzRaw9Uwc
         KAO68vTTePvhmpXwbP9zNzHU3ZXx+Nl1+RIqpCZ3Zr43d+JR9QjMWKY/qrS+iUcfMCa8
         vbgNoHa8jNE1vlnj3OBHjjx2ekfA0Ou6fzi3uBKNFppW0ggtdt6b5CknrlzkUApvdoEt
         EYHUB9w1mYG2A5J6/0BqjpKKwJ8nXVLSH3PhqR/3HgjpWZ4e58+bZq0XCfZdsmJjzUWF
         x0qQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YCuZxJLd9e7J/Bm5/LCj+gZhBIK3TvmamCm9KA//DXeI2BDWMBQCnFYnO4dZ+GKBNhws9K2a2ewfKLSlavGzG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7wcD10kgq0hw+WNAaZUow3AJjT4DD6Zl7mxD+1BO6Bw9+YNym
	pmo2QES337ITxQ0mCFwOzKxJ9EyK/J1dCEhaVnOwPC9xG1+D0GsfFxgRpM4v8UdU8hRUyJaMKxU
	vUhRxfOMkOkNqpF7A/6A4VpowmiVk1je2mC2MoKeHYXakGFS+8xvzWnWZo8H696iua1Q3V6usCL
	8F
X-Gm-Gg: Acq92OHiobc/bhugr0HnUct/c4VeJZoKw+hu2p8rx5OgYJ36tGoyO5YVRR/YbAeevoD
	REdbl+Lbb7oKOHg1UpKTah7l/R483WgyyITxfyRIO1axLd9oc6luvkZj3P/e1kLXuvMqqo8oEuz
	/NdX4f6lP0DkP2OTZoJsv6bKk1uea6P1D6MGjvfYXfpvySYdrrGF4xsTs9XljNsqBV07X8MvOnG
	z9LWryzxbiZ6NjwO5Sy89XkxnuyNr2twuMpYFTgR5yjAcygt8jnfCuqVSafdgaLwQqnrpe3/Py8
	pjiLQOt2TNsox3hU0igBgQHxOkU0E/lxKk3/fW9KtqsVwalpCznfd/j0E5pD8tyqDdNt9nXZEkP
	cK+2dT/y67Fxqmh3t8+q+swqIZTC2lZlcxbXuV1LUD7hCBBczpsK8dbdf
X-Received: by 2002:a05:622a:a310:b0:517:79f0:ae3d with SMTP id d75a77b69052e-517fe23ac1dmr180027011cf.21.1781558935525;
        Mon, 15 Jun 2026 14:28:55 -0700 (PDT)
X-Received: by 2002:a05:622a:a310:b0:517:79f0:ae3d with SMTP id d75a77b69052e-517fe23ac1dmr180026601cf.21.1781558935056;
        Mon, 15 Jun 2026 14:28:55 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb6442d8sm119356571cf.11.2026.06.15.14.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 14:28:54 -0700 (PDT)
Date: Mon, 15 Jun 2026 17:28:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v8 00/10] clk: realtek: Add RTD1625 clock support
Message-ID: <ajBulHwzII9cynqI@redhat.com>
References: <20260610080824.255063-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260610080824.255063-1-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nS0ECbieEeveSMOhYnPAPytQHBgND8EbVEc4hUKrz5w_1781558936
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_142859_464098_F8F4B7B8 
X-CRM114-Status: GOOD (  14.17  )
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

Hi Yu-Chun,

On Wed, Jun 10, 2026 at 04:08:14PM +0800, Yu-Chun Lin wrote:
> Hello,
> 
> This patch series adds clock support for Realtek's RTD1625 platform.
> The series includes:
> 1. Device Tree: Add clock controller nodes.
> 2. Infrastructure: reset controller, basic clocks, PLLs, gate clocks, mux
> clocks, and MMC-tuned PLLs.
> 3. Platform drivers: two clock controller drivers for RTD1625-CRT and
> RTD1625-ISO.
> 
> Best regards,
> Yu-Chun Lin

Sashiko has some legitimate feedback about this patch set:

https://sashiko.dev/#/patchset/20260610080824.255063-1-eleanor.lin%40realtek.com

Can you go through that and post a new version? I'll review the next
version manually in more detail.

Brian


