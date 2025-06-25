Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3206C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhTGhxf402H0iQPCNCiqCI6RIMS+rgS0mxhxD4XS+R4=; b=Ws05dcdiLQdDPUJfP6SXkiVPeY
	B9DUJyTN8DxEaP4+jyBo5aoVHJ2KhUIR3yraqtCTeU7J4j6m5vVyjTgc/Kxv/zBAZlE8e/NifAIXS
	UydgciQSeDvdZRSRC9n1DqKYVTyOnSQcwxxHU2VJmtoWkxAqkoIYNDCl27j1bZEEyD3I+v8aln2OX
	EZZpDxUcz1JFVUCJq5anOx6Tg4hhbGaFA9ggTMWneEsuPE9kH0eexGNq0l75AWHqpYPVwQ8cQU5rK
	eo8FwqQNK4D3UgaSeNjcdD30cDt7RxA636he7zlJCkRntz9rZxSF0PVrd/1vROyyqXpSHBfk3xI4C
	usN70eIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU2w-00000009Sxz-22y3;
	Wed, 25 Jun 2025 17:36:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPIz-00000008dby-3yB5;
	Wed, 25 Jun 2025 12:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NhTGhxf402H0iQPCNCiqCI6RIMS+rgS0mxhxD4XS+R4=; b=ePPCwni8NwPvb7USa2CZUlhCuz
	2Gh9vm64Eh7luN95psYCzPXhylnp4DqnTWpqvzBNitXIGpsgvX1T4i9GHiEr2Ck8la8UCzmsT5TXj
	ZJApa/DYksJsmXN5ugf7ctE6owN7uDqFSdn7UFbrU7p9S6q2sAL7TNNAo8QIYKEaoqUw5eaAus3fj
	lqQ5SqvD+5Mc7PBn0k7Vgi8skc3IBlCNPz0sBXZdlywOOWaDtR3qaXcLM3Vq0zZ+r7y3gLHLnIStw
	DA574iK40EY1AfN4HEqjLHlfM2PXd9o9KnwnCmTX8r15PmtuYE7Azrj4HJfiu5KI9mIEiaEogpwso
	PIBgmpLg==;
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPIx-00000005r0s-0H3y;
	Wed, 25 Jun 2025 12:32:44 +0000
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d3f192a64eso153565185a.2;
        Wed, 25 Jun 2025 05:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854759; x=1751459559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhTGhxf402H0iQPCNCiqCI6RIMS+rgS0mxhxD4XS+R4=;
        b=Yg+YuaptWY12N+Af2sxfvtDMHCglNl7SWdmAuyNWu7RRWeMCwHRSqyfIhtXjRuGTUL
         Z7HrJXRkZdhKWWUgGppl4zYCBONuW1at4OroZmjK/9yajeMfBBGQ8mVqevBANEGMQCV8
         HbsrIUJrGN/y0DaQTeAaa3lIsB+pKRVD0ZodJf6PQb3VaKG3nToGRK0rbwa05C5Ipc4b
         NbQyy2UB3pJPtRNKyz7563sEfFWGRXxM3AQ1VtfkuHSM9Uy3YHPOMm642SGFKJMEUmox
         nJhrgqyuAa9I7WQXB6Opre8n8Dq7zHp3NTN4ksfZO4hdJF4sBBN6PdSTBNSFQFtmqnoE
         9VXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3qHtCNU8hWRGTVFavSrlF8rZQpzWV9/IADE0VVMlq3Tl5uaGm31D0vw1/XkZJaWmCZd/f0Og3DUCaMD8=@lists.infradead.org, AJvYcCWhTntG/zwtxrXP9F7IB4kD6zjmMDahs3kT2MNB677eCwgS/5X8Aar1NdLiaha6ucFLYW/BYAEeX3kO9DPyGGwe@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj0nQRWq//njMcd+CP6834e5/nx3k51GdXlylTiZbu+scXZgoF
	R6x1BsufpJBa4KxmvBLFyDhohAmVb77ww2zjXrr4lfCfoeiys0sLTHiyhPZCSUZv
X-Gm-Gg: ASbGncvWP5Ru9ii2hSMDXPOkTLAMCyht7OrYZvZmZ9ap/eOfuoXTf2PXc9ZUxeAm+Ab
	O3EHjkjfCT+bgHsFEuAhsKHheJka7m5F7r7wHekWrJz88af+Km2g1NLuf+GLEVyUy6/ebH4b57B
	GxGTU06GcVyfnF3MWFuW2jfxte3laJ5O6iMsPsrcm0sFHlJaBDpWMO1ICqy4P46GreKe9jmCD64
	R6yqLQAxBh/RhRp//sXmJfeUoXEnHDGimPo3Ty908DrSIw5DW6O3S6riaFl+GSfs6cwnH3cCnWq
	5+pJ05Vh+qTJgySV63owDxrKz2wnG1Cwoy3zxPO/TrE1X4/xrJHyGjNjWvIOfp4f26LbVJbOzED
	/prbCf1mtHodB1rjyZQ6DaHm78e8xGK6V+YSRRRc=
X-Google-Smtp-Source: AGHT+IENIEtKgw6za1J/rqRmOOIw3Sy+OKAIVQyhXVx5uXoJoj8F/VJfatJxePux/KJputD50SzJzw==
X-Received: by 2002:a05:620a:d84:b0:7d4:dce:5f5d with SMTP id af79cd13be357-7d42973ef53mr352753885a.38.1750854758930;
        Wed, 25 Jun 2025 05:32:38 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99a6415sm602669585a.40.2025.06.25.05.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:32:38 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d3f192a64eso153562685a.2;
        Wed, 25 Jun 2025 05:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPT0MNa5PK1wcrG+TxPOWhlWzikboRWluoBs4hsyJ5twvstfHWwsfpjVgrdMIVwZCicrZZIXJsGuGoFpc=@lists.infradead.org, AJvYcCWH/loV3fpzlrNiz9y0tofDnS2RsAHj1MbHjPAVkcGPfiO2sWH0TBSpfeVHC+XX869jrunlVLeZwnpCaRdwl2IC@lists.infradead.org
X-Received: by 2002:a05:620a:8011:b0:7cd:5b2a:979e with SMTP id
 af79cd13be357-7d42971e484mr353693085a.30.1750854758407; Wed, 25 Jun 2025
 05:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250625111806.4153773-1-maz@kernel.org> <20250625111806.4153773-4-maz@kernel.org>
In-Reply-To: <20250625111806.4153773-4-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jun 2025 14:32:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWE-hnQEL4EU5H7ciFGUPUfN2c86ePjOG51tEiR_xhL1A@mail.gmail.com>
X-Gm-Features: Ac12FXwRxxe4uRV1CN0dx9-vvun5P0zm41CVyhHyZ3rpCXz5PgKojsS4sa7YJUs
Message-ID: <CAMuHMdWE-hnQEL4EU5H7ciFGUPUfN2c86ePjOG51tEiR_xhL1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] Revert "PCI: ecam: Allow cfg->priv to be
 pre-populated from the root port device"
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Janne Grunau <j@jannau.net>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_133243_209309_A900963B 
X-CRM114-Status: GOOD (  15.33  )
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

On Wed, 25 Jun 2025 at 13:18, Marc Zyngier <maz@kernel.org> wrote:
> This reverts commit 4900454b4f819e88e9c57ed93542bf9325d7e161.
>
> Now that nobody relies of cfg->priv containing anything useful before
> the .init() callback is used, restore the previous behaviour.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

