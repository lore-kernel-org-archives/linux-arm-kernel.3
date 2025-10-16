Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8401FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACAqVbHWeoat6K3HL1ahrRzqT6qreY6/QV4aq1RfvOI=; b=Ah4/rDstno+YQqCFikhLGw7J+v
	yp+HksKMtx7Y/o8MnQM6Ap6PiFXJy1SGeazGOx5JVN+ytz4trYKMHogX1kQ6qeiM8yxO19ugjhBPa
	GXhEsq2ATP5LZsCTlhJmC/QLT1o6YfUVq9nhnDKIiBCVp1T8K1+D9CsK3pltjkQ5unmPOGa3u93Ta
	74ZXCIVR29cGUov3dHXRckhJVXe0/Vkjc+B4Bq7eh2GJMD/hZB5PKUkwoxELNi11r9UbJwlW/9zsP
	Rq6nb9hl0sY3VDXYgUU6tvODgz3BGgJ95wT5DwIW1MwZMNtkkDJEYhh93X6f6Ut/8z4Wl5gZEeIuf
	qXr+NO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QaC-00000005NFb-0Oh0;
	Thu, 16 Oct 2025 16:12:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qa9-00000005NEf-3CxF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ACAqVbHWeoat6K3HL1ahrRzqT6qreY6/QV4aq1RfvOI=;
	b=Zoj5S0Q34VyOgIAaFvUyYnWRIZEMRtrLFuyN1Gd34QG03facRFo3xGS1rYDo7OR0307oOi
	+miaKSZ9PdLns5vY6LeimQDkbARcA9TqlC83WOIyX3O3FaEm5TYqR+UUHwMs8CCgf+oHk5
	4siVgUanGEJIuqnDYJqDR9VyYia8wWw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-jdQivsqxPRKxkuCfxnSMyQ-1; Thu, 16 Oct 2025 12:11:58 -0400
X-MC-Unique: jdQivsqxPRKxkuCfxnSMyQ-1
X-Mimecast-MFC-AGG-ID: jdQivsqxPRKxkuCfxnSMyQ_1760631116
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87bf4ed75beso38860546d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 09:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631116; x=1761235916;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACAqVbHWeoat6K3HL1ahrRzqT6qreY6/QV4aq1RfvOI=;
        b=GtpBrXzjqj05MIC2yzYUSM98o7O20tPQWZFXnXMyDkha/4sW1N8Nvs210vLwbZdxD5
         xRPE5I2Nphzrx3GAyq7yt0l4WOsd4p0wM+XdZxGQ3rHiL/NzTjE8KnJfA8Ha0sriRzwp
         ilUzqeMigY0EzRbCKLOPIVaMfRUAbxN8Ed7emuBFhm0twU+BFyojBTj1u8SbOiN6hJ2y
         NKxLfcrsV+YrCS4T1aYGAp96EdUfudji+Z5/By/691ygU+Ek94x9iT+RxZj6SQLIMqR/
         TrU4sJe3Rj5W2QLwzRxIz8X8E0/FlKYxq9dI3/eq9SwogR/neKUN25BlOZdEB16Tc+h7
         1jSg==
X-Forwarded-Encrypted: i=1; AJvYcCXL41ks7IYpMaZVlaI1hnqANe3oxUj5FTxhZiZVOwB5B7FatcKoMNtp+A1CxItDTroDF9T+IC/OV+tPFTzCGRBa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdri6PVW+o5HrzE/oc015PppIoO4EMtXZ5uUjLmuT3Eq3CcWAX
	urkqi+p+2xj0CBYGnGs5TlvyPSibUMvWhllVRLFbqGAMrU20WKK++KR0uuLL1/Z7EVa0zIrIPxs
	aINxfG1BwM1l2Antfxt4sgJvuGgdVmxK8Jx2YXSjG3stgjpieSRmW9Gb4a2xhCI2X1AHm62u9aF
	nP
X-Gm-Gg: ASbGncu1Nz+kPaLb6WdPBTTx+MeTieHXUsQb3j3gkewyk/WM8iC1EBcgNkENpcZbxGi
	Ddh1E0pum0lzWd8dH4CRauZAwZe8FcEI8bMTmUvkSu2jN0lX7lsNL8TbnmMq58N2TcANpkulMUe
	dLRqw1t6JEr1aeJso6aMopF9ksNbW1rc45awOq5sxlzQndPIjkU0VpP2zLVetjMcAmRwWz9DVXz
	v+2R6Dfq/TDqAFTnnpbIyrgQZBr211JY3mTrj12hC53og5yVEt/u/GB50x3P7ouu/jXHr9F28zD
	XgWrE9YNxD83q9CaFKppwsFE9RgEVkYV8Pd+OuckxI4gDVyfurkh+p72nQsMiVTPJgnAHVqUeXe
	j3PsC7tXOwAYDkQhr9xi9nw6ct26DGB1CDVF5ZsUspj1z/Yv8VFrZPP3zKlScx7EFGw==
X-Received: by 2002:a05:6214:319a:b0:87c:20b5:6685 with SMTP id 6a1803df08f44-87c20b56795mr9221856d6.55.1760631116556;
        Thu, 16 Oct 2025 09:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3K3iFq5m/T2G5n5k1Ub/AwaYH7OwwIxLCZt5EEaLCKub8NnH0J3P6LhBuV98s17jbVOVRfA==
X-Received: by 2002:a05:6214:319a:b0:87c:20b5:6685 with SMTP id 6a1803df08f44-87c20b56795mr9221106d6.55.1760631116071;
        Thu, 16 Oct 2025 09:11:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b4608sm42179536d6.58.2025.10.16.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:11:55 -0700 (PDT)
Date: Thu, 16 Oct 2025 12:11:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>, Maxime Ripard <mripard@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <aPEZSY6RC-UVclxN@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
 <aMatZAX6eFI1RmDH@redhat.com>
 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
MIME-Version: 1.0
In-Reply-To: <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lRnRnO-SQLGUh7wA51-xx8-oatiVoSbvMKUofVtK4DY_1760631116
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_091201_875942_FCCE3846 
X-CRM114-Status: GOOD (  19.59  )
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

Hi Andrew and Iwona,

On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> Hi Brian,
> 
> On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > Hi Iwona, Joel, and Andrew,
> > 
> > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > appended to the "under-the-cut" portion of the patch.
> > > 
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > Would it be possible to get this picked up for v6.18? I'd like to remove
> > this API from drivers/clk in v6.19.
> 
> My (strong) preference is that Iwona applies it, but I'll keep an eye
> out for any unusual delays.

This patch wasn't picked up for v6.18. Any chance this can get picked up
now for v6.19?

I'm hoping to get this merged so that we can remove the round_rate() clk
op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Thanks,

Brian


