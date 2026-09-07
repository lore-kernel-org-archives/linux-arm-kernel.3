Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20846C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/2WLxDmERbGCh7iT/2ZThPPuDMwAWqV6GCdXRr20bA=; b=IWNWPNVvxykpFvvTV6rtarXk1O
	QoT74ZPHFUHNMgrNXTG3vPHKoLQWM27vml5UB7vpU0vMhOQzaEFpCq0ck/sV9L+O+nbH535jciFHt
	9FSAjFw9U8IzNbyEP9JD1J4a89xNitER5y4shcdXsJa7MEjCpP1oiPCGpVlO2wJEWkVTIsrjf9dJJ
	kjVILk0JFpGDbFyAQizTX3Ou43Sqgsv5h6BI30oSh6MT775aSM/ut/2Llhq9omfYOtD9dffTU9NuZ
	xbySA1a0XKFyk9CfYgUVZXTgRICRmcCavYsFoWacEx84sM4X4nKFFGc5CAJWxtvEpRdm3TJjiFSTU
	Skvv7SXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ckx-00000007QjQ-1WPJ;
	Mon, 07 Sep 2026 17:03:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ckv-00000007Qil-1o4L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:03:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48436251906so4303601f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788800619; x=1789405419; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D/2WLxDmERbGCh7iT/2ZThPPuDMwAWqV6GCdXRr20bA=;
        b=B6urleOnTXE47PlVbj+vU1fYIkXBqPld6DRbc+3WRGxUu71y/NW29VMKmviv2Eudvy
         aXKW7gsk2eVp/2oIczTlPQzp0W4vrDXyw3BHUNu/nfox+B/TWqH3qCr5g10/OL/P8eDR
         hLS3id6JCvL2eUYAo04+irKLahMwjkPW7XIYakDxnNeGo38e9HK/L+sNoQFRDhiKZlZk
         +HK7rOG91w4oxfXxQtYIGHH0vhGHuzwYxUNQ0bzQju+Cn4yBvAo9rcjfKoOs5rmEZabt
         6ElVTcJL0PBxeYMHEZwORFa75Xg5HbUlmN3tYRWnDQhsaMHOojMVpUKJlyfpJUI99Emh
         zEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788800619; x=1789405419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/2WLxDmERbGCh7iT/2ZThPPuDMwAWqV6GCdXRr20bA=;
        b=ObSI4Lu0x9nm8P+fZ6chP/c4+AJDt/9o7Xfw4HyDuKPIHMumLtrE8EiySJOH4zWmCe
         hFfH3QhczwJoYIyejhCcWarwLvk9fTIUdGlPm1MbCExZDSeOKh/QGPAJgeVCKlZidTZn
         L6OEqpP22uYNrG5wCfx9GMBmPRRanQfFN71NJ9bEGTEABkxSbofep3IpQIXuG1Tx/EVx
         96qOirPe3xNq0xGqQVEpWVmSDEw3UJDGqqMW3UIOI9IVkF2wpdFEkeAvC+PGLiIrlr1I
         B/JSANoB1ndy2+vh5zb8TDPNXRcxUNyX+MwovuflwVvy2pVcKejTCi7W9LtqU3M6B//h
         dlDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvNeOrdi41uMitG7WByISBTrxUNF9HpApbnEMMcQlnWh4qFBdA2BUbLtB6jtN3wYY6CklLKMN43bn62Skh3bTZ@lists.infradead.org
X-Gm-Message-State: AFuF++lMeZfUGJqbrvBGxuAG3qakKe5Ao4LjX276FL/qEhW0leG/iO/t
	d0snIZOgGLivBPn0gMjDtKKWJ66nmINYTmtqwmXF3fKDubSD/Gf5wVa2OcBP7Me07A==
X-Gm-Gg: AYBFou2k0BBOeUwGRaY9CokzlA93YCAR4cnXR4+W60JyLh7nH1skSkhNxkEYVGumtQY
	ptg+r/26/sc1onSIWP5mnqvMru9Ruy/Jk/7GI45m21ilvoYzBcMYoguL2M5jKHGvgHY6GZaIeQZ
	ZIdcm3nES1cUZPrzuQqQhXLaGcX0Hv02K8jFQHu8f7YmzvDd3uaMLVpp4TTuxMmTJE1MYrCi/e3
	1N8gtAJDzqCXnrb5pRqsKk+uG82fbCmjVFLMoVTIQY1wMF6O0TUGd6ZsJLYZzqbzRTK/VuqsJGP
	OcnY38CJGdHzpSx8tRBxh+q8idWKhe52m4jOrYS6xYImsi7ABG+gwQNxHRdyMwbKb+Md9Fw+qEU
	NmSBtdXsW1vfZZL/xA0tr82DgQHLXxZrI00EeFN89IrEocN1Lj5+lMWPMvGxqALK08CP2j2KMZ2
	DuO5WlLeBz+ntzbYa9tqOzuwaQ0bVnZkzFCMxS1Sx7MNFCECzaHi1cuE9gRHgxxUmufrnmxKlcq
	zn/4IhZ5Y+WU9UJfCUhK8EKyzdAU7yS
X-Received: by 2002:a05:6000:605:b0:485:8b66:f5 with SMTP id ffacd0b85a97d-4858b660161mr42549469f8f.18.1788800618759;
        Mon, 07 Sep 2026 10:03:38 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm23089736f8f.11.2026.09.07.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:03:38 -0700 (PDT)
Date: Mon, 7 Sep 2026 18:03:34 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, catalin.marinas@arm.com, will@kernel.org,
	rppt@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <ap7uZuGraZ2N58c_@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
 <20260902172436.GB1440252-robh@kernel.org>
 <aplF4NaoFk73d-c5@google.com>
 <ap7CAowlFTFhSFP9@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap7CAowlFTFhSFP9@orome>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_100341_502658_1CEEC2D5 
X-CRM114-Status: GOOD (  25.03  )
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

On Mon, Sep 07, 2026 at 04:00:19PM +0200, Thierry Reding wrote:
> On Thu, Sep 03, 2026 at 11:03:12AM +0100, Vincent Donnefort wrote:
> > On Wed, Sep 02, 2026 at 12:24:36PM -0500, Rob Herring wrote:
> > > On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> > > > Keeping last-level mappings is interesting on some architectures as it
> > > > allows mapping/unmapping pages from the kernel direct map without the
> > > > risk of splitting blocks which, under the break-before-make rule, may
> > > > trigger page-faults the kernel can't handle.
> > > > 
> > > > Add an "ll-map" property for reserved-memory regions. When set, it
> > > > splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.
> > > 
> > > Where is this documented? Any DT property must have a schema.
> > 
> > Ack.
> > 
> > > 
> > > Though I'm not thrilled about more flag properties. Handling all the 
> > > combinations of properties has proven to be painful. Can this be implied 
> > > from the compatible string instead?
> > > 
> > > Rob
> > 
> > We need this before the kernel direct map has been created (paging_init()).
> > 
> > I would have moved that directly into the driver lend_pool.c, but then it is
> > probed too late (unflatten_device_tree()).
> 
> Any of the node_*() callbacks from struct reserved_mem_ops get called
> prior to paging_init(), so these could be used to manually set the
> memblock flags in the corresponding drivers.
> 
> Thierry

Ha yes my bad, early_init_fdt_scan_reserved_mem() is calling ->node_init()

So I should be able to drop this patch entirely to do set memblock_set_llmap()
(or memblock_set_pte_map()) directly ino the that new FF-A lend_pool driver.

-- 
Vincent

