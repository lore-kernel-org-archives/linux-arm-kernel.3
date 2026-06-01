Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69E0CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi2AxBnDBuiwVVwwXIXlKf9rcXdvhFLnG5wAFAlVNdc=; b=S4cvIgMUrwC2RZvP1WpnuAB30c
	wt6XnKZ9iKnljUyMRRTZG0u4MoTy8KLdzSrBup+HXhOp8SK1VOzTSUbP/R0/advIUOuDVOmujhzEa
	Ye8X+1Y/JXMNPmzGuEgL9VdzzHZMurhcKjvylP7W3127KKhtWqk75DntGqX6cIbXhS+mXGWlH7xVW
	e7xgCRUmyLjmES3ghT2MhGlwXFmQ+qWl7yU9151r6/eCnYcNaO+yw+RED/Ho7st3NIMPd0uvyDACv
	C1fd0Amsqm4hgPkseT1tYlwM/R5yKcTssQtk+0WtqOOGX28kKDZZaJWJlOAR2tfqShtNbfT+wrX7s
	ksk2stnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3hJ-0000000BI9N-1ONs;
	Mon, 01 Jun 2026 14:32:57 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3hG-0000000BI8o-08At
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:32:55 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-914bb8e95c2so574383485a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780324373; x=1780929173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mi2AxBnDBuiwVVwwXIXlKf9rcXdvhFLnG5wAFAlVNdc=;
        b=FZzxta0Kt2OP68LRqGg0oToU/dELlZuh1Xb5SflLNLVPcO8uMo6/l6hhAhexfWT8Ob
         3W0DHwgnt3qF8Na9rDUGJ2tKNWkbT0dZRJOD3CYwRVb56FYhy9dUCmbNh0IZewyP50FC
         v9/EIdFHokGII6nX3XDznhOxOEuBAjt/ne1fi0Bbir3kFIVZfGuVaJDCaD47VJueFJLE
         cxtusf+vX7lkcYXtgDRLsKiXCNmjrztE0lSdF2b7sV8anUT3/v+gRoGW9xzHzfnQR72k
         yxEHRCsIpcXIHpfQAge0ipcvFRHV6OBnQgsFwFlbPGrk79nkbsINgFoS1Xi7RVo2jgOT
         bEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324373; x=1780929173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi2AxBnDBuiwVVwwXIXlKf9rcXdvhFLnG5wAFAlVNdc=;
        b=Q84Ko4yhohdDD1RIpErtAx3/6SzKgVxnwRn/lEWDbRjlczNwlte9zQ833hMVX3zNV/
         KuJPcEis3o1Mn3DCyVzBHB+aZiMvmK+1oaCbL9eIHkXDuS99bRNeRo+5hS6fltJNmBFf
         u/Fje4IS+Y9dA1kcAfMSjcIUw5m8h8I1VhlQ3S8+QRO7tFB2XLt6O4v7iZH1Vy3T/FUw
         603FnLdLtOfJ653pqC7p84LDHY7kHEjrEXONqAgsHheqRLJP86rtNAKIR1OqlZJkBHzq
         o7i8/uS8oXnrdhkfo68i9a69WzOD70euUQH8zwheL9qKOMTSZBTrvFm3JA3mAZo61jxH
         HCaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dp0YSrx2enkIpGderLF0Oz1emaodD7QTLKmA4rgfN5+maGvuR9+2/g3lIdptfCFMke1gmd+6jZOEEqi3wAj9X@lists.infradead.org
X-Gm-Message-State: AOJu0YwAC+DhXwy5ltGL5mJT/mw2bPnem+vl93cVuZnwf62xMFSJ7p8U
	44MDOe9aCayqNQ+65ZUYP4my9gtLz31hd6Whojdq1Zg4BqKphNH6JlWQzQsUgXKr/e4=
X-Gm-Gg: Acq92OH1gfMZAb7EVdMkoeI9Y9xcs6aOymAucXP8H6MtByuf0Wk6TxzBNeXNAZ9Zdo7
	mir2f1SiZRl+QZCszDXkG+3xoalpUyCs0Hyk69gYdEVCGShRQcQf51MT1ntrxPC1EjK4F12P5pJ
	jc4N6T0VmIh1aD6oHf8VzYvF3YUbtppFbMWsvPwxA2hLroSeF0DQN8G+Is/pLU+Ow7b1iPxdnYn
	bM7zlfu/iqfvTTxGkYO0k1I8HhXsU4794RMHsQh/01epe/nfyWJxY5sFKtwwXJDKPOJWL93bIhw
	xlJH6fhiiXCpa3CgLE5I1Gir7m0LgyjV3js2t3i0Lmp2Zrldjp6O2S5Ts2BQue4uUY+rRT3gVyt
	yFIYltso9spUB+At+i8EIhFzABXhwm+R5bfGad5ra0op6kVnaNXqq0U7wCVrh5WATSlB6Qclfrq
	VNgggPhG3xXfYlAqMzKoQPHdFiGnLFwNXf51B337tEsPEQci9vdzCg6MeBP6TA3YtHAoZwMKTtz
	oVLKgV8c6GRgbjg
X-Received: by 2002:a05:620a:701b:b0:915:4213:eb98 with SMTP id af79cd13be357-91542140a21mr1632452385a.56.1780324372641;
        Mon, 01 Jun 2026 07:32:52 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91570271853sm113463685a.24.2026.06.01.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:32:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wU3hC-00000001n2t-2ubv;
	Mon, 01 Jun 2026 11:32:50 -0300
Date: Mon, 1 Jun 2026 11:32:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "guanghuifeng@linux.alibaba.com" <guanghuifeng@linux.alibaba.com>
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
	adrian.larumbe@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	liviu.dudau@arm.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, alex@shazbot.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org, xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com, shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com,
	alikernel-developer <alikernel-developer@linux.alibaba.com>
Subject: Re: [PATCH 3/9] iommu/generic_pt: implement iova_to_phys_length
Message-ID: <20260601143250.GA2487554@ziepe.ca>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260531093637.3893199-4-guanghuifeng@linux.alibaba.com>
 <20260531235421.GW2487554@ziepe.ca>
 <fa924b86-1ca9-4819-8330-0d5f6ede8923@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa924b86-1ca9-4819-8330-0d5f6ede8923@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_073254_169930_FF241509 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jun 01, 2026 at 10:24:14PM +0800, guanghuifeng@linux.alibaba.com wrote:
 
>    Therefore, currently only the PTE mapping size of the iova is returned.
>    The current commit has a large number of changes; this issue will be
>    fixed  in a subsequent series patch.

No, do not introduce the wrong API to start. The iommupt version
should be easy enough to do this.

Jason

