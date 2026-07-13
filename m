Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2P0GCpX7xQ5SgWYiQkKz/UKhv5/hqMLczhsTlA66oGk=; b=EivNy+TeV7K2y3P6+dgJEbeaFP
	XsSjfrYA2+kV4WoOIZh1arXjOvL2ALCako2PRcRG51Q2MaHN0u7I6oe7/XVhT1Hx7kzTGqHajbOlt
	GwRQsLBd3ou8QNAerrUaQhC8L1Q05xn0GHu/y5SEXjzDRNlHmXW+jsUryQiHoU5oSEUrHDJhcWCCz
	556Jmth5z74EgaTPkXgu02eCuOFsXMGC918RHQh9xb3jnKlYmjU5gocRfj2QGzK8AIlxHpCxyFFFq
	xs9FoORFL0rLNsjTBas+O3fxFTDTGMsluh06luNTrxr/hZVtcr+TQCxHtz/2Ge0TMCxZutABMh9Dw
	0zHfsGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDUd-00000008p8E-3fQG;
	Mon, 13 Jul 2026 10:02:31 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDUa-00000008p7U-2QWr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:02:30 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so1716244a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 03:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783936947; cv=none;
        d=google.com; s=arc-20260327;
        b=q+GEePLb5Usu3HpA0ri3vcugJ4lcsT5btAYFW+yGnc/c+YEcqFkk/PQ9ulKz2GBpuH
         oA6qXf2rAp2saNpcXoItAe+QeS1rIS42UXjxDdnK4OonD7mfxcvyiqQgxQPtRoe/DMEg
         Lz8oj/fl6PvL90F8xLY4/RnVcBiY86JVyI9HN92uBKWhCQpSmbaU0wB3JevpYYO3QlgO
         O69s09D7V8dTs9Y9Pa5QaRcIvx14eJd8Sr19kXGY95Lc4drGjAYax9cwDsUcPwSZlPV9
         akUxaB2VaNnJ3vhRfZy1WyA2j6mx31vcrpPsvd8ImJutLuwriZarurFrefMUOtxVMgaG
         iqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2P0GCpX7xQ5SgWYiQkKz/UKhv5/hqMLczhsTlA66oGk=;
        fh=x3cd8Fue+qjsFMX3Yt8pweCbMITl1x7K7iFPdXEJgHk=;
        b=ItAkVxA/I6FjIwZpyAVZEtgT5RKiGZ3Gkm4a4m98qACxjF2zu7r66qxXl1onDqdeJR
         dUZgwBcRWFiPcPBv+HuMSDHxwVPs8L5Xo/xbqiu/L9tszD0IQS/n5JwVG5RN1cbdySR5
         yehbgG78GMsJHbqXIHv0asq898kh9MwzyMi2xoi7Sv3nfRCGLrq2sR1RXglAkXkdlp7b
         91zuCtkL080JvlJiT70gfGltFBtE5xKouYeSPaxCxnVb7HiIeoamXyWhCZ0PtKMaKYEC
         eyEXZ2ckDO34qBKWOmmXsa/CQ/pY0eINHDYHo1fkQcBCwBAVnjWpwspX7zp28cS03Am0
         fA/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783936947; x=1784541747; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2P0GCpX7xQ5SgWYiQkKz/UKhv5/hqMLczhsTlA66oGk=;
        b=smyPW620ll8Wn5J8u909z1m7FmcBqvZRIWgMgg16Bni5OIolY/zQzf6kwZjQwlNRoa
         oGGN4uFdLk7L5fTyhwdpWcb4k3Y9WB27GS6EvEoOX1a+gchPoIJCtTdJgcDoGxEnOFN5
         3rNI2Sb0a+n6LXPoIjI8CQC1FZaE0BojwT2k/InYa92jqsGpKe0WyEQjtINIf2e19D3D
         aurptToqD4NH2F4z7OBW+M6BluL28psnBN0K+gDrSHAbwncTiif0xEP7giBbmzLuCOBA
         skAwectG3drz7zQoD0BJYYNship42Ftds75YSq2DyZ0tXLKa4aFrcFJbm6QKay7kxd10
         dL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936947; x=1784541747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2P0GCpX7xQ5SgWYiQkKz/UKhv5/hqMLczhsTlA66oGk=;
        b=ELz2hWcmFBUpGbMCzBdagLQPqu+ku0h3GNpvnVT6mQELLdAbF96cheFDbOsmWTqV6d
         vzPSH3eZcxgbCr1PeMUDp/3tpiWcc3LIjEutkFx1N4R2ZbD+5UkiDPwRjFmJIM/CaZ36
         GpS66qR1oXT9hetjUR87tkO7Hj/yYAfdJJUdz9W93LfuHny1SELU69XCV8/A43UGm/6K
         /CkPND2G7P/TjvDAwce3YkMHthwx3idgjzG62/JYv7ajW0hdAxTtRV6rZZZVy79wW6lK
         XFFEYvEHgKSMHRc/PQ2S429XjP3mXdu4pFafV4xL9aRPkGw+1bskI8z2q7yB3k6nn+Lx
         6MvA==
X-Forwarded-Encrypted: i=1; AFNElJ8+ScGgF3VZ98kEAAgKWBVzhPbPpw2zI7O5J0kozgtZWJIeCjGcpeZbBvOYW5C+uNFM3QN6cSeXvEtqAB/ccwBi@lists.infradead.org
X-Gm-Message-State: AOJu0YzWiAy6L3sIMSFYKEsb3Vye5ZZINd1Ahpsf/hlDdXYCPZkSpxs5
	Xm29J2WepEsOfhJxZeS0HFZAp/4iwOAAeO8DAZF+iLKiF4hTwHrg/CKx+K+Txx7mrTE3VfCq4cp
	7kD+l5ssfVU37VX/O1qy2fAAq0ogd+kj8tHBdszVKGA==
X-Gm-Gg: AfdE7cnx9A6+odEUyxcZ1Y1emgzI7nGxPK8ldm8fFMD1RMj47UB5Ch7/5v0GLjVf/rQ
	nN7SlzHL8XmpdkJsPrvVveBBSLTKAF3p/FAkWBunyKFdfbEKb+muuJlmkV5Wkyys1DtxAheCjd1
	i8cbXvtcq9mqENVHAhEuZFEIFqX+1s7KPaxsHaawosnETSP0jXJ2jQehN53rZ4EIf3ZclLWw267
	8ylA7hLL8CK4omiuR3LdPyDjKDJl06CpXeJHRdk42yyxE6FvRa+p9rgrTcfxK5mBTir3tw8pvzf
	P6DH+ZsebZ6skhyK/hCEzK2Guf8z
X-Received: by 2002:a05:6808:1b99:b0:489:f199:42bb with SMTP id
 5614622812f47-4a42ac1bf5fmr6284861b6e.8.1783936946808; Mon, 13 Jul 2026
 03:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net> <20260712-bcm2712-iommu-submit-v1-4-80e10cdde2ea@reactivated.net>
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-4-80e10cdde2ea@reactivated.net>
From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Date: Mon, 13 Jul 2026 11:02:15 +0100
X-Gm-Features: AVVi8Cf4LGOVn8UuEl-XzGEtPWPky3oSnqvul0wqNroMw9il-m2qt1JpocyTw0U
Message-ID: <CAPhyPA5CqCzsDZg1_Sfr=EP5G6uLnnvDmdd_REZPX_VpwS=VJA@mail.gmail.com>
Subject: Re: [PATCH 4/6] iommu/generic_pt: Add Broadcom BCM2712 page table format
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_030228_695460_D1B24DCC 
X-CRM114-Status: GOOD (  11.32  )
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

Hi Daniel,

On Sun, 12 Jul 2026 at 22:19, Daniel Drake <dan@reactivated.net> wrote:
>
> The BCM2712 IOMMU implements a 2-level page table format. It is relatively
> simple, with one unusual aspect: leaf entries can only be installed at
> Level 0.

I should admit that a single-level huge page mapping is possible, but
I was too lazy to implement it (and haven't much tested it).

It can be done by setting bits 31, 30 and 28 of the top-level entry
(all other combinations of bits 31, 30 will point to a  next-level
table). The page number is in 4K units but must be 4MB aligned.

Regards,

 Nick

