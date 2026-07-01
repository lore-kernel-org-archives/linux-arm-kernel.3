Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03074C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 09:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aPPO+1CYD+YBwvwpYgtZJkmXkRW2VjIt/FwgJ0T6qg=; b=D5hEIS031/rPDXsYJffQYkhYpr
	cpJRCsQl27awOzTNvlephqwmTO5v839qkoBnuFsBQOudE2B6uMOzR/oqC4YFNawtBKbpkhzvTGfJJ
	5Sc5UPC9cWKtd7yLiwci4UXY7MBN4pcvO2gGKwPn1Jhfe42TQnFQsGG9Ju0h8GuvupNIgHGLC6QnJ
	eaka9bWL/OOTju6rBSdFhJO+F8Ip1VuRloRQkCBE7U+WrbtozXk5gch2uA2tYYkz/lA9F/a1W7W1L
	uphZuA/Qv137TCICGqe6QE1H8BhidQy5p8S34/ktE9zwzQj1UDN+ntD0G9WNyHGCthn7Z320Q8ndb
	u8RefjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werif-00000001G38-1Rn5;
	Wed, 01 Jul 2026 09:59:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werib-00000001FzT-3Lrg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 09:58:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493bed621acso47235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782899936; x=1783504736; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7aPPO+1CYD+YBwvwpYgtZJkmXkRW2VjIt/FwgJ0T6qg=;
        b=uKTYUk4S27IYiMI8E+aDHZvmEVYb0TGu3Jm8m1oXf6o0UkOw0nwklQvPweErrCp0bJ
         OZjfEWD+/s8NiAT9IrXqS2Vxp8vef9Km+IB5bl6lVpVhrlA6rnP9p9Cldl5YN2mXl0jo
         t0WiPGP+NY0UkbxH0jcUvfy15A0ADjLqabl6ajFqbNCskX0Cs6K2tet9DyKGWFjGUKV6
         it4ENJtq1KJSBcL2YlMDJ+irRtYMFh/A4b4nejwSEtqs73J3AGvyVu5TQf9ypKD2Nyjv
         fcMRgzYhXHQwKI/2at64tDY1hSco/7xUxOqYvrS2lQU2tRECUz4erizXH/b1yFvUIyzD
         qNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899936; x=1783504736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7aPPO+1CYD+YBwvwpYgtZJkmXkRW2VjIt/FwgJ0T6qg=;
        b=ixRitaSvBQN9n9YmthCzgOjHla2tGlzWEL0gCcE3vk6LqXXQXuwuQijzDYcC43bplZ
         HDEGod4Dshz4Qwu3ZWj+g6Gx15Y6fa60JeRRSbe0V8wqzwPno2VDhq50YKICzOBT6i4J
         h2lTUEVzI2TMNCXL7GQA6Vm6+4sJgVrmd0p2ZK+ezqAj3AnfJXBYkuMxTrVh01nlYrKA
         1xlNL1CDF3f16156NasoZ7IDf4s7MW4uHaGInLQbKJGyOcOq/xB2IkqAZnE6Ql3cTaGX
         B+SK5dyqF/stgeot/anf5fVPRu8J9ixmRmVbmc1iGQiCSPDspJ0WKbL/EY9VjYzrOd70
         MTYg==
X-Forwarded-Encrypted: i=1; AFNElJ8t7sw/yEJAJh5x0I/sOW0IHwF8sY2MMB9sZ+/UjwzZisVCY236T7CdDMvxtsMirEvru7YW97DYY/tcJUq/TsLD@lists.infradead.org
X-Gm-Message-State: AOJu0YyUBiplZopOBO0Gk80ZS6DFQgimM61aKanlMgLc57i6dJxvNaIZ
	OrNQm8tttd3Fo8sBlsil8cvm3mL4YCPgXGPSu8KZS6RjuzcYklK8aBxJzcIDo7lGpQ==
X-Gm-Gg: AfdE7ckFi5PZsQDJym0MRIfV+0/z4oxFcyke7QiGqJc5sA3xCsZ1wHsfegOb9olcuE3
	ZTx+kUduh42H6R3AOWqXSyhxiZuSrUZBuQ65NOPaK83ZHLNDrFztnMKvFyZ1wyIHWagUf107PJu
	aHyJ2mIqSWN033oERd2vr1wTpN9C5NqlvQjbwDbfkhC6cabxmvuvzll9MGWkVz7IfvLAm1RiqzK
	Zj5vam3q7LFzrylqBItXkT1+sQpvwHyLqAyUc9/O9z40T+n0ZPFjTcUm2lTwoQkETHHpa0QlNqK
	qmDv9hBuvbVGJio5xadN6i3xYbyS/brnG2GoseNVo61eU5lq3UzC2oardsyNzIM6yfaN8VhSFUe
	7o2zFofz/4EnKzz3XBVeNPBahPjOBUa1OrvAIMErmV8xhtujoQP6Sfvd3GO2vnca7KiG3eh45MS
	aP6Yc880MnhK92YvhlZhrqtGtU7Pd39W/Rem9FBKNdKBYDwHbaFTw=
X-Received: by 2002:a05:600c:22d4:b0:493:b47f:a24 with SMTP id 5b1f17b1804b1-493c0bcab48mr503405e9.6.1782899935171;
        Wed, 01 Jul 2026 02:58:55 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef17c82sm31881885e9.1.2026.07.01.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:58:54 -0700 (PDT)
Date: Wed, 1 Jul 2026 09:58:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	praan@google.com, kees@kernel.org, baolu.lu@linux.intel.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v7 0/7] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <akTk2uM0Kat4Jvrg@google.com>
References: <cover.1782799827.git.nicolinc@nvidia.com>
 <akPB6l-fuJUcg4a2@google.com>
 <akQYpCdwGnpKTnjN@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akQYpCdwGnpKTnjN@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_025857_851872_081050C5 
X-CRM114-Status: GOOD (  13.25  )
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

On Tue, Jun 30, 2026 at 12:27:32PM -0700, Nicolin Chen wrote:
> (I think Jason has answered most of the questions here.)
> 
> On Tue, Jun 30, 2026 at 01:17:30PM +0000, Mostafa Saleh wrote:
> > For example, patch 4 disables the EVTQ to avoid events as there might
> > be a lot, why are they not fatal also?
> 
> FWIW, the PATCH-4 doesn't disable the EVTQ: EVTQ is disabled in
> kdump case prior to the series; PATCH-4 just makes sure it won't
> get enabled transiently.

Yes, I meant the patch disabling it even transiently because of DMA
faults, which was confusing to me because I though they are fatal anyway,
but I see Jason’s explanation now.

Thanks,
Mostafa

> 
> Nicolin

