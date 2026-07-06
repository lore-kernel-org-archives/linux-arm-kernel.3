Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D33C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxinGIhcu4WQR6Nqj/llYdJ3OsXvQAMFrn41RWNE9p4=; b=bJPxlVpe7PLyv9ZL0titnftOTy
	uVD9UzCOuqqL+lhVYijjiy8ARGD/kdGyjzRZoZtyMbdeqTdYxe3G+RszMvSDiyP5RPvt5eVzRDNJ+
	XUe1/tE0E9KgagchWrQ2EoLpnPIdoEGmtO/b7/WOhAZuuLS/b9mRCdk/2VjQnC32lOSPoSKq9bwIe
	43G01p0nJ/8IhR9d15f+UJKjpHV0SojyWt5THTbMEpuBfxXWeVBOXraQfZtjuXzxVUxnFv2B8QdJA
	hVzf0l28hQuaVVdjKJ21Kd6JODuOcBCIjOL1FrI0iPj0u/BT4GIzVyoZEGEYd/StqHG5pjWJTHxwf
	pQqsbpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMZ-0000000Cu4p-3nse;
	Mon, 06 Jul 2026 15:36:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMW-0000000Cu2T-3Lta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxinGIhcu4WQR6Nqj/llYdJ3OsXvQAMFrn41RWNE9p4=;
	b=FId5fHzpIkrYjbc1fAXME6feYDe/OLXt1ZgTRObZOueunIUcj8nyS5vws4V4jRp8dZuJEv
	OExhqA92wC5YNRwFyvcp2q6FgpbXAaUzLJ7vBs6T9D/lwei9ylez5Nw5zMOqreq4U+L93d
	nnS3KSDzU5jzbKqX/RYJ/mvwMzXdGEs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-ihZ5jPKwMzm4DeIjbX_lPA-1; Mon, 06 Jul 2026 11:35:59 -0400
X-MC-Unique: ihZ5jPKwMzm4DeIjbX_lPA-1
X-Mimecast-MFC-AGG-ID: ihZ5jPKwMzm4DeIjbX_lPA_1783352158
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f0867a75ecso63343466d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352158; x=1783956958;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxinGIhcu4WQR6Nqj/llYdJ3OsXvQAMFrn41RWNE9p4=;
        b=L8IyhoDXLgj1k3Iy8oupUWSxTsyKDdvaHhZGDWCXHi7nKvloPRvUHrJQ3d0T0QxDhU
         BKtJ050Bwn//dEgRJFoxC1onaDjCyloFnULEt61+jriO8QCNrXNgeCZ9ErsIV68wfQSe
         9SKP6OS03tTE4OiSfecpVyh1EBtPr6UyH1EVuDIZw0+PsXicZRdzIapTaN3GKiozm3aX
         Mr1kYMDIJdMzQMj8xwtX1DaqPidgNcyMvlKSB3q6lNed5esBimSGHZsDtJNIrIEODpzB
         SXRnPMy2hinZmyezNhKa+58ibniKm2EYIRT3Ba49Ze4hGEWbWUfTdes2i9Y9785KSJUA
         FvWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpR2oxAZg78aV89kfYdZKjuPwUzPr+o/CChvvVNP89AekhmqPsJBefjPo2IC2lcZvBvdbH1yG8Wl72k69lWwtJF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm1VJU7NfHOG31Buubs016prw1Tn2Vmq3ufab+KSIiOb08GGdB
	KhDzCkWhYtDxP6BaXMyd3aFxPLYMlLO3Riytqo2GwNKJv7mKiq5tW5NsIwEwvZvlqUfcx3N7sLR
	ig1yCAg1vkm6MpX2O9P+59dd95uOcvJod8HVjlE0aCftAVaAbqb0SoU2qNVhlzVfadAYhmKqupA
	N5
X-Gm-Gg: AfdE7cmNJEWd9nK9Chju2PpXX00T7J5ryhpKZCiNgLKF/XIMRwWZbyhYao/bSI8Yr9b
	vY+n34Y3Udw50Xyy3sUH5WXZ1jfr8revedZwaE+VWpsucYJdUERFEYtHR00yn7KtprasfO69PSF
	mQQSXv1zibDJ+wnMN+6fJi3ixTWJ03D9M67/0EyAjsVk7tnI0FRe7E6VKD7J/kc7uHEJPMhg11+
	H8gLTIiTqZjdYCCOEwJhc1H2e65+QLTGWopp5C2A5esFn/JyFG6SBYVMmY4mbSqStLY5cEsgA4t
	E9NSmcp5/GPI5cU8yqzgN9TkhvyAs31rLKxWgrrJ5gnEWl20It+rihDXa14HBRPKuWHAzutIWL6
	TrZt2b+3qBfsrZeUKwEHik925UgRiSAc54EfCg8vT7LjHGQ==
X-Received: by 2002:a05:620a:4606:b0:915:afa5:725 with SMTP id af79cd13be357-92ebb4b48d2mr159858285a.6.1783352154845;
        Mon, 06 Jul 2026 08:35:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4606:b0:915:afa5:725 with SMTP id af79cd13be357-92ebb4b48d2mr159850985a.6.1783352154257;
        Mon, 06 Jul 2026 08:35:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b800fasm939411685a.6.2026.07.06.08.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:35:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:35:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: mt6735-vencsys: add missing
 MODULE_DEVICE_TABLE()
Message-ID: <akvLV114MsiXu7Wf@redhat.com>
References: <20260704124808.19916-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260704124808.19916-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V8QINrcB6M6oESZhM6FMqQHYiKKc52P16GMv3nvTXgA_1783352158
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_083601_673723_DAF57571 
X-CRM114-Status: GOOD (  12.49  )
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

On Sat, Jul 04, 2026 at 08:48:08PM +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>


