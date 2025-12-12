Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F26D59D68
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8RokAtosDkKW20ZPmF7jI+1D1J1h8RY8U91CVgDMOA=; b=S4tzY+oiu0KRMR4wQwOJR3hIEC
	XEmDhi4VzuWJXXvLsxylgcKWtBtn+nowElQ36/uKzQAaT0o3WWwra5g8h8l9vDDb+sj66suAs1upE
	rqEQFoIyTn3swKtS8+7h2d53xrq0wNAxoucqIJUIxgb7FHk+fBdUiPeza6QwzQlMKfi1LD2vDNYLS
	qVSOFLlAzbFTKHSo3NKcu2WtsuZ5iOTz2lXA02fBBEiT9rZKQSqik9B7XtzF79IpDDlDK7eg9i/YY
	ZXi8gtyQ91zGIxTamlB43Oj+enXxR6zvEkYnKmwGNAVOysGg/ikxoNwV7MKfYRCmw7DK+It53iXW1
	h5cNcBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5DM-00000000kfY-1W3m;
	Fri, 12 Dec 2025 15:37:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5DK-00000000keo-0vuW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:37:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47a815c43baso132045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765553868; x=1766158668; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t8RokAtosDkKW20ZPmF7jI+1D1J1h8RY8U91CVgDMOA=;
        b=GE/aO1FuyTORlYrzJwsvbwMLh0+NSCMJOVQ/RlLU/w13/tcCpxHbq27NsFkr2GokfH
         ibGL/pV8dhFAbwnMA3vq/261ikOPOntfLPgtXfXP+iOZkJysLbdlcN8maLWmqeZi3n/i
         hHhzwvnMy3VK6HK212ukx81IYZG8H9h1nORv0mfoP27Pfy29V8zk0k7Z2CPvxuCIq9Fr
         lwu79MmE3ga39xJjTAggLAITuP0MjSZhrR7hOz7vNGlbR9Tj5nvUQvJ1hD1aqWhFgYQq
         JPcaNQgaFG/Tw4O1YMDy6jZYDRmM5bBCiDslCzrd14vtHjwZUCB75wr/r7ounC5OtLDN
         6Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553868; x=1766158668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8RokAtosDkKW20ZPmF7jI+1D1J1h8RY8U91CVgDMOA=;
        b=ZZxWx3suiP14xqRLWHeKIAnkaNrg/9/lpUucRTN1gMk1Y2LIVzvdjHw+FboSNzOv+N
         4v6sKqlNmQYLwSPjx9hBCN/APWqGNXH1WPSLJMTvHgsAn/4Sw8op74rOCHkMOSbVPJ1b
         xGCDsZO7yWMiPcR40PL4juCxTnzgzifKMG7FUuCgtyJKoyGuieTTogmZHx2ZKRYH6yss
         ANjNaw9Y6sY9PKub/JeEiMvjo9QQgiK36TL1WGaiuTQqak5o/qSMeEvju+wtC3L70Be8
         x3hVqFSaw2CobL4JNgfY7tT22QSEaFkfWu9PiFq/8IYIF52RFzNcgyDM/CqKprdbdw8N
         rFpw==
X-Gm-Message-State: AOJu0Yw/uuAPGARQo2RIq/9BH/m33LjIZPp0GlKHCc60xs+kG+wVec4R
	2wjRlfNRQ5OtEKa4cUW2Eql/pOy2JxeZv+SDe9HivNdyfCouiV7Jiw/sSWtHa4DE6jF4qZc1Soo
	na3U7bA==
X-Gm-Gg: AY/fxX5D15VRrkNRm6R/UVy2dNgGFIftiVnyChD593hgwqbqXd4CHu0fTgwchhH2BGw
	Hjm+22k2Scc4cEOjTF+VEz5E0oP5pdn5VTEeIKcQmMOwEU6MVJJ7g0JLUtwZsq/k1O+XBM6CHS5
	6rPAg2t0BILNC8vF8oGeEchUohuhUcHLrNVPvspo1FooWs5SXpzxD4AwK8eHaHO3CSEtdSSjUAt
	GbhjFmgcHA95lG4RFZn12ndo30ADjzveTXaxU7SXgEysmddiqYSiaDRwbPdXV/OyQYdYW6vJT8k
	O2eZLPnhqLHHHKCwoJlBKBy6ejfAHaxd2Npomd4Q1iFhnGKN4ULnC8+N/dZZ0uMD6qwHF2Ymgbj
	QuqeHzIdOrFEDiLH0EvxIkYj5p2iHDqXl5F2pZu/auQv45TnwQN2XkFGXYCQWqayUxcKg7Cw4h9
	Fjkk6MWkLneqeuFkjnueu5f10wdZQ+rdtZNzf8MRfztrS9PXzwEA==
X-Google-Smtp-Source: AGHT+IFXfc3AC76G1YFLQm1Se+be8N8XTO6jICn0jtn4xJXqL4zg2CykiJrG0pTcXZHbluGygYoeaA==
X-Received: by 2002:a05:600c:4f16:b0:477:974e:2b34 with SMTP id 5b1f17b1804b1-47a88c6d52amr1996775e9.16.1765553867672;
        Fri, 12 Dec 2025 07:37:47 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8a97esm15306057f8f.31.2025.12.12.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:37:46 -0800 (PST)
Date: Fri, 12 Dec 2025 15:37:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 04/27] iommu/io-pgtable-arm: Factor kernel specific
 code out
Message-ID: <aTw2x1UlldJGVA4Y@google.com>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-5-smostafa@google.com>
 <20251128164541.GA812105@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128164541.GA812105@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073750_293136_9C9A8D4F 
X-CRM114-Status: GOOD (  22.49  )
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

On Fri, Nov 28, 2025 at 12:45:41PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 17, 2025 at 06:47:51PM +0000, Mostafa Saleh wrote:
> > Some of the used APIs are only part of the kernel and are not
> > available in the hypervisor, factor those out:
> > - alloc/free memory
> 
> Why not provide the iommu-pages API for the hypervisor environment?
> 
> Same for virt_to_phys, that could be moved into an iommu-pages wrapper
> too..

I guess that's possible, but then we would have to stub dma_map/unmap,
which might a bit ugly. I will look more into it.

> 
> I want to change other parts of the driver to use iommu-pages in the
> long run as well, so putting the abstraction there is probably more
> valuable than this.
> 
> Also the genericpt stuff is merged, should you (eventually?) be making
> a pKVM hypervisor specific set of page table functions? Eg if all you
> are doing is mirroring the host stage 2 I think you can build
> something much more efficient...

Most of the code is re-used from the io-pgtable-arm, so when that is
converted to genericpt, it should get to the hypervisor also.
The only hypervisor specific logic is the memory allocation, virt/phys
conversion and CMOs, I can look more into painting those, we don’t have
to change much.

I have some plans to add support for sharing the CPU stage-2 page table,
which is going to be complicated as it requires changes to the core
hypervisor hyp/pgtable.c code, which will be in a subsequent series.
However, I reckon that we would keep the shadowing logic as not all
SMMUv3/platforms are capable of sharing page tables.

Thanks,
Mostafa

> 
> Jason
> 

