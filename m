Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A203C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qT89Wi3RAN9CgJ0A7GdoQ7adS5M+Uxt5TfxmdTXEZ+Q=; b=4pOAb/EiLKnXp2CiIUPMgPr39+
	OhK3Vm4rWNz9BfYN9+i7otIPDTthmBneXvUSYHbQf1s2A0lm2bZEvOSyHjv/UCKFShGmnsHbucbbf
	gbSggi8xBorEWI8zHAMTzG7DvCCShDaT8XcfY4Y3/1InNNd826+GOfn+eU5NT3r8yRb+K7BNSk1QM
	resgfUSWwK7peRhD4YcV3YPhvOAEJhWsy8KW+G3Ta80hU0JhlmKq2YyAb1Fm5QTNMv6xF1ByxbCy7
	vRL4MwBm8hq9h3JRwOeB20BgiFTSL+hWQ81Jp6+RS0GlVQ4vPw44WiJUixq92Ik+m6sCRLzIEK6T4
	Sp45jiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl65m-00000004AYj-0hPt;
	Sat, 18 Jul 2026 14:32:38 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl65k-00000004AY7-0GSA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 14:32:37 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-930c0f9c1b1so76894785a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784385154; x=1784989954; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qT89Wi3RAN9CgJ0A7GdoQ7adS5M+Uxt5TfxmdTXEZ+Q=;
        b=Jfp1uZh0/YEuaDXliq1IH0NMSROm5OIBMlrQxNQzpeFmZxB8zLNQWUiDhK+RbAg3XN
         9yGlRSrdbdlcZEJ5/Iwqsxt7FwfdLsn7Psa5gaW/mBZa9PBbMz/Yuvrc00oiUY1d4pjv
         OK24BRCHBtefq/R/nevOo1csSmCc3kTQIGiw1uoRoqqQe/+bqMRAibilGesKlVp66qZ8
         Tdrp3oStONVa52ic+H3OAa/r7Dag/JJEjFOg4y20CKU+fkrA0ldc+U7yiuO6Z0p92ZuU
         RoHzmiZoHBOGTSrilquQ9BTkKqj82MXlwb2Ei/gCEPD8E0/43BtGJTzsMSImBqmGeRoJ
         9unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784385154; x=1784989954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qT89Wi3RAN9CgJ0A7GdoQ7adS5M+Uxt5TfxmdTXEZ+Q=;
        b=mdCuUBzKd54hXu0skC4mzsWLUqYTlt1lBbV4gbBEcbjnyIQd4PZhNJ8cfDP2XR5XUD
         AiqqssuOTZoQhEwQFnu/uTEGJQJ12D+B3pX0rSbYMG6BWpUW5bsO7g2mF0Ue0E/dTID9
         ML3pw64aQ3HC16YOhOEPBrbXgNlIfNkzeRY0+KEYbkwQ1raLcWouTBiDRZbS9Cx5zsN0
         7Spq0oY9QeJNQwk/1TjG2HcqqkQp1oTgjPGW3PV0SSQpVRfnd82PzbrGr9c8uxI4WoQB
         4K+KWarr4J+coWqXFuYdKpPCwJjM+Ff3APwx1UsWCRerk5FD0mwBh8waNZKJdTW96AHs
         uCZg==
X-Forwarded-Encrypted: i=1; AHgh+RpOo9lxCu0de8u0+p5Mbjz3achys9UuId6pKLLAy4IayZ+hq3IU3hU2YJDSCLkv0gl4Hzp2oVjc4q+2GVY5179v@lists.infradead.org
X-Gm-Message-State: AOJu0YzTw8fEYaH1seL5c7s/tJuvApJ+a7ha8CDTqVhLKbc0KvJzEDEs
	gls3ECA80pHrCbDvLGr/SGRL0evpqLhsQfeAC27QKR6lFXCYOvFeiYFMElmtOG8//G0=
X-Gm-Gg: AfdE7clj0d3iSO2qtVrTdUU4xcis4IwefBayiX2DEgnUPzkIL57wpKQFD9Y9tfno4fF
	b+dRt+TobBI0841yMSz9oUwBM0lGsqJm+MUail7USjl/PQAtAYDQYa8i49cQIMid221soc/7SC6
	YahIdFg1w9LV+c1qErwfRxQBQDmZFUwkwYNTZydrdiH4Vna17K9k1GbxZXjOxBlMifVqytBLji/
	0HorGwyDMckR2Ki6KH5iKqomn14WJCNJ+8bAWWamqvyADQxVsIDvcyVddUsnoHYFHFCDjKZdikX
	Idc8jNetCksz15jgvWqhq4yQUEkElMcWuBw50aBbimASiwh9ImfrIo7Xl31mR66CigcFX/og9mK
	WCBCv4CRzBhvXuYAAFS0PzgO/R3hUEI5IBfym8HN6P+zXfgcPfWEGL3csWabI
X-Received: by 2002:a05:620a:4706:b0:915:6a2b:6265 with SMTP id af79cd13be357-930b41e282amr722435385a.44.1784385154410;
        Sat, 18 Jul 2026 07:32:34 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b542d1e5sm425204385a.23.2026.07.18.07.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:32:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wl65h-00000006T6V-0EUE;
	Sat, 18 Jul 2026 11:32:33 -0300
Date: Sat, 18 Jul 2026 11:32:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH 5/6] iommu: Add Broadcom BCM2712 IOMMU driver
Message-ID: <20260718143233.GE701389@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>
 <20260712221125.GD1835788@ziepe.ca>
 <57f5675c-8bcd-4022-978b-9f7933bb0032@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57f5675c-8bcd-4022-978b-9f7933bb0032@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_073236_246289_F96C06E6 
X-CRM114-Status: GOOD (  14.97  )
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

On Sat, Jul 18, 2026 at 09:39:48AM +0100, Daniel Drake wrote:

> I don't think I can use that because this setup uses an IOVA aperture at
> base 0xA00000000, whereas generic_pt assumes it is managing a 0-indexed
> virtual address space. So the driver has to intercept every incoming IOVA
> and translate for the aperture, see how map_pages calls:

When you say aperture here you mean we place an IOPTE at VA 0 but the
dma_addr_t for that has to be adjusted to 0xA00000000 ?

I wonder if DT can do this with dma-ranges or something, we have many
other conditions where the dma_addr_t and the internal physical have
offsets..

> I was wondering about making iommupt understand apertures and
> translate accordingly, but I imagine you would want to keep that
> kind of thing out of the generic fast path?

We already have pt_full_va_prefix() which isn't strictly an offset but
it it probably matches what this HW does.

You can implement it in the broadcom format and return the prefix value.
So long as the vasz fits within those trailing 0s. That's basically
free and has no runtime cost on other formats.

Jason

