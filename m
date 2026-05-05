Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38C3FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNrRjG8F7y7vIp8q5Xm5bg/bZGzosl29uygoNMwlHPY=; b=BGOS+MNy78JBfN2feTtRlcIrSj
	WQrwfJFeiDf0owEaAfYmlIs6uKLxMtJTSlTapUXMNeuCB8o28jMewuf9NNR+4voXJ51o6HVcyVfsH
	MASURipcbtBe8As1GFof0o5q3DjuPYVNZ709yVOTiebXQB4WXNzNxW0cP0g9AytApYxHbwCOn8L1K
	oteinvAw1I4E3h2D/Sl5dLOLEc/ieh5RuVNwNt9LZaDEcZSytSdBHNdmFx/Wcz7RpOwRmMLRzh3Z5
	0Wx6CpCHmamaj2xfoTpgqSOLgTId5ZJbBvxoUduRK/vjFeq6LoTadJLOWb8GyiEic9cpteCh+6W7e
	KkFgsASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKISU-0000000GqV3-0TqP;
	Tue, 05 May 2026 16:17:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKISQ-0000000GqTR-1gLr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:17:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48909558b3aso59613325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777997832; x=1778602632; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNrRjG8F7y7vIp8q5Xm5bg/bZGzosl29uygoNMwlHPY=;
        b=NqPnLVhbbdV2RueirAAl7MYZEO/L9n2a1+H/OUVALXMuoTTvrveJpGp423PgEYIYWm
         GD7PMN9o51SSltkLaTOYKuinPD9g+qNPAFsF0yKTyb1xC6i1RpW1SRNFIo4oI95X5Vh+
         IwZVCE+lKiNDBR/KvC6HJ357LxPq7Cls1SB+V0DLOKuIq6fjDeDYTZjl83Os4PyjoYpE
         c6e6SNvjNDnRWGuZuUIHPI6p8KoWNzg48nrIiUoJkt8uYF9n8HuErvMave3xpkQpWrr8
         OgAglzz9mcyY/BITKBrzsYAMKX+NqxSfcKXy6VkUrLisSuxkjBYbZhm3P17h50YHR2nr
         13Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997832; x=1778602632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNrRjG8F7y7vIp8q5Xm5bg/bZGzosl29uygoNMwlHPY=;
        b=ljmycZBz3waLvsIehvc8yTIeY5fGU63c61Z6Wi2r1ezvL425Slg3zBcJELZfmHRnGm
         v3US1KgAPWcVp+Dho2UbaJSLcqBsx8qlqeY4cjiWzwM7m0+EpqExJUKJMjf/RFUtn0Bv
         3lINTDn5Slnx2uW1SbmvEbq0xwSNpgaxfFT8/PYseNPvmLiNFMJjOjoLmUXWD+BGdSZF
         LvMRhCsXrMr4wfCCiPBvY8p2NliyOeLkqw533bCk100PaJpTmBgfcrY26DIaYoa9r5sU
         zBhU4IWOO6qOIj0KNx4/dJEQoeqZBVgkZpwe/fFARWWiXq0ywBKWNjT3ERgYY7WnSMX9
         NpoQ==
X-Gm-Message-State: AOJu0YyoHSTSs5hp6VlnkwfnJUwQsfd0pH9uXDOPyCKELK3bjK4EyUmV
	/wN2ISPS//+oI6EHpSVi6/T0PAeT4mU7S9rnca/C3yI2E36k8rXLmCf2pyoEklFJVXU=
X-Gm-Gg: AeBDieuwddmeEp5hJLch0Cx0/YRzt3QkBRAI4+HbgFCkFJPI92wAkHmr+blcCN66ua2
	92O2bbPErvYSv2wb+UigR2KR8YppTNdHQLniLai5ogVtOug09YhDf940hpIkMbj4/OJ0nj5CGFj
	pm1riZQdNLVjp46otfY5MXoqw+fP4Vkc7TBk6pkQNJPiw86srq+zZfnFerwMmpTbflxKDNw9cHN
	RjU/sgD+kn+rTkRsgT0785orU3Yucfm+ZY7N9PyNQgp/2dUEQHxn5/Kd+hWIWjfnQ2XTaUVl2+r
	njHjqTlCDZIhjG9UhuxkMl5h3QQcROcwnFTy/vR1d3Y4hU4vji2V09J2jxW0mg+pzPlRZmS7HHg
	7NWztCEnO8uJJIL6pEy9ZDfa/b3gRPb+cjwREp4zQO2XA1C9zK5icpu9zZSZ4aataFvcX9WZfxs
	F1me0Juy4=
X-Received: by 2002:a05:600c:64c5:b0:48a:5574:3a48 with SMTP id 5b1f17b1804b1-48e51c6ade9mr1520075e9.16.1777997831520;
        Tue, 05 May 2026 09:17:11 -0700 (PDT)
Received: from ziepe.ca ([213.147.98.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm692460135e9.13.2026.05.05.09.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:17:10 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wKISL-000AN3-Vc;
	Tue, 05 May 2026 13:17:09 -0300
Date: Tue, 5 May 2026 13:17:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation
 into common code
Message-ID: <afoYBYIJOTClsdLS@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-5-smostafa@google.com>
 <20260501124143.GB6912@ziepe.ca>
 <afiN1UwS9q6F6A_v@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afiN1UwS9q6F6A_v@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091714_459243_A995C6C9 
X-CRM114-Status: GOOD (  16.81  )
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

On Mon, May 04, 2026 at 12:15:17PM +0000, Mostafa Saleh wrote:

> I am not sure if it’s worth it, the hypervisor is much simpler, there
> is a single page table, it’s locked (also identity mapped), it’s
> updated on VM boot/teardown only, we don’t even use iotlb_gather at
> the moment, although possible but I wanted to keep this series as
> simple as I can then we can add more features later.
> So this patch is the least intrusive change, as whatever the main SMMUv3
> driver does, the range tlb invalidation logic is the same.
> But I am happy to experiment with that when posted.

Okay, then maybe just always push a full invalidation?

I didn't like seeing the range invalidation lifted out, especially how
ugly that will turn into after my next series. So, don't use range or
use the proper full gather flow seem like the right two options.

I'm not so interested in minimal change, but maximum forward
maintainability. It is much easier to manage if you double compile
more of the driver exactly the same, and call functions in a fairly
normal way vs make special cases and special functions..

Jason

