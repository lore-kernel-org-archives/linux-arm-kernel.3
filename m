Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C01CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 21:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZr0hPhFAud0Uw+aBiZrTvnM6zeOzyc8u94gFH2jTwA=; b=FpiP+qZ/u+KfogVSmjIPy/vUHQ
	H/mYKpe1QhLOZkIMA4qSc1DimIzGzfcXBmDaNm0rVcRA7VpjU+ZaSicVpoFT3GR2ydG20NLGqmG1d
	WuELfoe0UGJqTzQhIV5igKQ/pho/sM49ll1E0sCyP4NSNN6SSTEPj9I+qOQSm37NXQSvnQWgqzArf
	J1Wqcc3V+/kGhYV3doMCOecu0Q/ZAop+LrmxK9tvUVm9Q948Ovnu3x9Q3EJV7398PBSjTbxV7miaO
	lJwoIcMIDhB0r8wtAOncx/cwj+3ChX5esaiOOFBUx3iJGGIfe6F3TVS2RNmTVn/AKrGJBsn8yWVE3
	7qgqfaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ndy-0000000BWFb-2zYz;
	Mon, 22 Sep 2025 21:00:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ndu-0000000BWEb-0mpa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 21:00:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46c889b310dso18652735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758574811; x=1759179611; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tZr0hPhFAud0Uw+aBiZrTvnM6zeOzyc8u94gFH2jTwA=;
        b=W51pRY37u4PsIFxQdJPKNmum2GNwetO2k9eSMkJeWUY6OgM3vZ6VhbDfxmy9yThl/x
         ccBEJWs6gvaLRW5tc86Xa+GLo6h6j9HZIju8xyuMXovmS7Ro+i2CKS8EGYPbovvWa8G/
         qQHjL5pBDYWFwd7NdfyRqnNg8vo72z0M4w3I4YnGemdVo+Rw6kQyYXv5QIK3ckTbmi9L
         ojj+ULrGBzRRokfLDrUTwLHz5+48qLQAacASL2Axug6T49Muhgp6at/1itePmUMwX0NC
         OVMovZhU4JPy7dhQMTRRYl/l7E6fBC/kAV/CkAo+XVDMCdic/ZCr61GcBM2N6I3dh0qg
         aBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758574811; x=1759179611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZr0hPhFAud0Uw+aBiZrTvnM6zeOzyc8u94gFH2jTwA=;
        b=QRcGw1oAK63iRqzaczyYV4FeduEQwuBVlF4y7HD+QgslTwSW3svQAL3qdyzBeBcB9Z
         yciUFEMEbHDkHxy1QswzfqodK3vmfBp4yXmq9V5qLOXAvte/udJ/xmWhX/B+JuIbQPKu
         kC+GlhJdsfBTYRf5PBonX3gt1iQFWBEbbLer6t8y0/bY0yQOIBYcYFwKey2ln3IWby29
         cDMLWR+5tvh77ac2cIXq9ySF56tuxPtwOeT2VlG4YI/QjEGfyqexyJXF+H4Kq5rabT9+
         4o1OAwiOXZQfkWuSv5Ta38t2I4wDQjsSAJyNHJACzPTpTzBTXFvvUDSmpnImC7otecbJ
         KVKA==
X-Forwarded-Encrypted: i=1; AJvYcCWsbRWaE5LvPTOqU1LwIXGyPAwHxsPX6PjkObcqlmLvhaFgLajJtBk/l1fHRxid736UZiatDA2OrbDouefds4pu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1iDCEzcTz93P5YdpM7aQdfFKx+xQlaLHvFGb6CJG82aPwtV9i
	vbqQ1dSuFhd59zTM1ZNOpe/oQYD2LrOo5VQOvtgW+B4+uoFg+iO2xjTht4TTlxTTDg==
X-Gm-Gg: ASbGnctOeQaJbHQY1J47NmXDCtkY8GvlxyJI+cDX9QZn+ZxYA2CDDnMAuO3lbi5IDUi
	TpTHMWgzJZAa+WP8nR1Erjjn1vbZa4sKk2eX0vVh5+rpAwv8n+f5acWx3WD536wLTcNjfHFssuv
	CrUBgUfGFRIKEgwWu/J2YLrp4oL467LA+UPFeGm+VwAUEgER7jeavLhaz9SptQtwF2PZ3CVhAuJ
	m/lXmJZgnW2TvJrPyqpyqVewO9vJkPioVskSeZLtfXT0hIAWW4UU9KCsq77PY9inq/85t8dYE8t
	QlPkBLwjrtLkG1wOptvT+Rgy6E/WUbE6Q3v7kFir4b7BDfey9u4EhfcFSiCu1fMFt6ELLI8ORtw
	tLTF0/ehGGoLqm4D2q5Bj/Dob/Gjn153JbzZjPOGkiwoaKj3NYZ98pf8xB4/yuberfw==
X-Google-Smtp-Source: AGHT+IGQQ4kfiQOVTFeyQzQt2jYtkM5/eyZicm9Wu0N0OnLEQ0zchv5LfIGa+8+xPV9iHI+UIbvczw==
X-Received: by 2002:a05:600c:8287:b0:46d:34cc:e9c1 with SMTP id 5b1f17b1804b1-46e1e0f7c74mr978165e9.4.1758574811415;
        Mon, 22 Sep 2025 14:00:11 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e1bc00695sm14039935e9.4.2025.09.22.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 14:00:11 -0700 (PDT)
Date: Mon, 22 Sep 2025 22:00:07 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, sebastianene@google.com, keirf@google.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2] KVM: arm64: Check range args for pKVM mem transitions
Message-ID: <aNG417MneSKBxyn8@google.com>
References: <20250919155056.2648137-1-vdonnefort@google.com>
 <87plbkxcvv.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plbkxcvv.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_140014_269162_B4231304 
X-CRM114-Status: GOOD (  29.96  )
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

On Sun, Sep 21, 2025 at 12:29:08PM +0100, Marc Zyngier wrote:
> On Fri, 19 Sep 2025 16:50:56 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > There's currently no verification for host issued ranges in most of the
> > pKVM memory transitions. The subsequent end boundary might therefore be
> > subject to overflow and could evade the later checks.
> > 
> > Close this loophole with an additional check_range_args() check on a per
> > public function basis.
> > 
> > host_unshare_guest transition is already protected via
> > __check_host_shared_guest(), while assert_host_shared_guest() callers
> > are already ignoring host checks.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > ---
> > 
> >  v1 -> v2:
> >    - Also check for (nr_pages * PAGE_SIZE) overflow. (Quentin)
> >    - Rename to check_range_args().
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 8957734d6183..65fcd2148f59 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -712,6 +712,14 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
> >  	return check_page_state_range(&vm->pgt, addr, size, &d);
> >  }
> >  
> > +static bool check_range_args(u64 start, u64 nr_pages, u64 *size)
> > +{
> > +	if (check_mul_overflow(nr_pages, PAGE_SIZE, size))
> > +		return false;
> > +
> > +	return start < (start + *size);
> 
> I will echo Oliver's concern on v1: you probably want to convert the
> boundary check to be inclusive of the end of the range. Otherwise, a
> range that ends at the top of the 64bit range will be represented as
> 0, and fail the  check despite being perfectly valid.

Do you mean allowing something like start == 0xfffffffffffff000 and size ==
4096?

But I guess that would still put all the following checks using "addr + size" at
risk. Also, I believe even the code in pgtable.c wouldn't support a such range
as it is also using a u64 end boundary.

> 
> That's not a problem for PAs, as we will be stuck with at most 56bit
> PAs for quite a while, but VAs are a different story, and this sort of
> range check should be valid for VAs as well.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

