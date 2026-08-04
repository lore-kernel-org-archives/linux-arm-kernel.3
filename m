Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0EFC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zdxL7pbRtsTEV8EC4r/5IgaNc8hBDEJjb1U6nqESgU=; b=dVvbZEaM/q8wam6d8T9B5nMJDb
	qq2LOBL4Am3urK3cTDcRp6rJpja3WdVxX/fXXr7UI5VkSCZ3oxuG9aJT2tZFDyTYW6RZSGQE32caf
	4mcFbQSjwz7aD0zL13LTyZJS27iEQ+K5GCCuqHPV67sM9LLSXT1wjwWk9K9Do/qOXDneixlcltL4Y
	kXB5w0oajIauAX/CkqD38JzBUiKhkPcESA3DBbDJGV4dzzbZOuuRYRVRBM0IrV0sZ0fO9bjeEgnBC
	bvRRXKQrZ5ZuAErDS96A/fq7VL4ewRrkiKGTj+51foG9p6vDZy7XidBtQ7F5LESjfiMvjeJxZfTrC
	Cek3gqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrN5p-00000002qT3-14P5;
	Tue, 04 Aug 2026 21:54:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrN5m-00000002qSi-1jPr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:54:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49553515a8bso3719215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 14:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785880472; x=1786485272; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9zdxL7pbRtsTEV8EC4r/5IgaNc8hBDEJjb1U6nqESgU=;
        b=J52xY3NAeKkLwPstm7px8DlG0I4eJNljhm791lmxa5AIafEEpMq28dghxd3XqH/N27
         IWNQhkdhcGiepj+NQAZqZ90IzeRc/WJC77sBYxkJPHNyG6LvG64SBH1WJHQm/TiXxZ6G
         lKgJVl31WbrjAKCr/FCHBzuLSS9f58VVL0RyI90uC3PvGdupHgFYZT40efxVUXczDluJ
         goAn5dxUa2ZrX0jsvfWwuq87M372NM1P4bQy+e0f+ltPlBtpfXCepHYoRxH8CNkbCO/F
         ZGKQ0qnuBe6U+u/UXSx00pIb7GqbVi/8r0Dcw31eS/sdJUOrB3rcsrvTG8HWoXVJUllC
         8WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785880472; x=1786485272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zdxL7pbRtsTEV8EC4r/5IgaNc8hBDEJjb1U6nqESgU=;
        b=l1PZefEkYza5LIAD6B6x8w62CPv5BXPOPgmUvMumgcfp20vpsPVHWYrLxZU3sn4R28
         xjpujjiHvEf25rSsoXNdz7HFHjsHDyh9aa9v9gWXaMhO8XVyMiNqp+IMTSmEth7r8yb+
         5qHUV03WtRxFgoElNWnMw046+pTZUw1NGZObGYM72il5JXbaZsBvx59y/ildCGMZ70TL
         TpIuKtGmYu19RsdH5fNpnX0L+vZT+4og5aemqHHputZeVFn6gzf72EfBt6dNJmIFjwdg
         5e3aaH3ep6PyJzmA7TyYxlyjTJIuTDD33r7anC/VVnplWerSL2v9fuA1rlKwY00yUBEJ
         r1Mg==
X-Forwarded-Encrypted: i=1; AHgh+Ron+vy97BzbYOWcEhFCXdiB2TgpNJ/02Vz0r1uGRciCFF71ckf7u5qkiMVpBGMgwxdBkFV9w+nLGNDOQIypseSI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj0G/cGbXpSIV9dbMhajASKrRkVRAXQewUvdeMTeG5YLvdNezn
	oGFyZXMxy7CBG+3vWQkqeS+LJsRbA939iHpYvjs+lbpnqnm2NZiNunLa
X-Gm-Gg: AR+sD12IQstQa+V6mVlk3H+6dPnWkfaxnKPXJ307VGKfmqOV3pNkA0axlSg48Z12+ix
	e2qv4W0QNJ50yP8gif1PyjGVG0WBpyPlHYxPXzWtEpKG+5ertejNc0EavQRTmbYXIXDPIUSzqWF
	5VylPHeiuEOCxlf0ttVDyQW5hP8E3FlfciOwaIO+tFuSEQ5jbSrAb/drS1UoM7A8NJ1AbOo+VKc
	V3G16cMCscIhRZOqD8gpq0iGbUzjeuFamyFVrP2yLIG4jxoUdC0ZMgoK/UTSh8UJQNkGlV807Pq
	OOadZ6rS0r0djuW3hSPz+MRjeLDEktxX6bT6srx0lU07RLhDfe5QW+V6MK8BwFuufSy0giWXM3/
	ym463jb8RAItw2zH5fWuegmn3SvTFz26OTEdiScFTngl2TY6wsc/1WsxSI2KDNvpP8B9BEDqO97
	sAYKnhCUHE5V3zd9oY9i8xoeZHDDBQcTOr3rtGyx97sLcUCEIhQr2Wsxtx40zLnEsapvES99fC8
	SmoDjyLZUh+cyqj3PXXDHeEwdQJP/Wx97vsnk2xRrkqo9sfvuXKishS/dlik7l2b21HIAL3bWmM
	yQ+GsI6myvboYQYj5GXtFUoXwwcrKN7ovb376oaST7qiXnXvq+nsl65WTrlOTojo7e4MMFGpu7i
	c7VANRw==
X-Received: by 2002:a05:600c:3589:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-4994e79ab0emr15048195e9.4.1785880471944;
        Tue, 04 Aug 2026 14:54:31 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a48b-1c01-1c76-d8bb-0f26-1c8f.310.pool.telefonica.de. [2a02:3100:a48b:1c01:1c76:d8bb:f26:1c8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e980559sm10979265e9.2.2026.08.04.14.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:54:31 -0700 (PDT)
Date: Tue, 4 Aug 2026 23:54:30 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, grayhat@foxmail.com
Subject: Re: [PATCH 1/2] KVM: arm64: nv: Allocate the shadow S2 MMUs
 individually
Message-ID: <anJcUNlnNmP-mKWH@gmail.com>
References: <20260803224405.41468-1-kmehltretter@gmail.com>
 <86mrv2arf2.wl-maz@kernel.org>
 <86jyq6aq8g.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86jyq6aq8g.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_145434_475737_5FD602CA 
X-CRM114-Status: GOOD (  15.59  )
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

On Tue, Aug 04, 2026 at 03:56:47PM +0100, Marc Zyngier wrote:
> > The other thing is that reallocating the pointer array isn't great. It
> > adds complexity, and makes everything more fragile than it should be.
> > 
> > See the hack below that seems to work OK.
> > 

Your draft is indeed a bit simpler.

Should I send a cleaned-up version as v2?

I would allocate the table on the first call to kvm_vcpu_init_nested()
and not in kvm_init_nested(), so it cannot leak if VM creation
fails. 

There's another issue in the current code: the ptdump debugfs file
keeps the raw mmu pointer as its private data. I would add that to the
commit message.

Thanks,
Karl

