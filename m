Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F50BE7AD67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 17:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kJtkYpkUPuI2JipA1QFCVFw9kslwydenMOjeWpb0No=; b=eKmyVnl0L7c4Z8SpmwnZfMDnYn
	kvko6TqQcU+jHjgzDG6dxsSYqENXQNPp+Uj0JJBrHp2HP+urL5je/Ye1De6+M6bXybvVpMuetce2Z
	uT7+Op4WB7+KtQOC6NVVmlPpTI6i6SRUcRpKvBHBHa92BI0VeV9Zn9woEAQzSpQ0jWjqtfODMvbqM
	eSCQ29bNMJopBUuMBye+lpbipPZXq9Pc5XzxnKMc2iRe1I+fS9TBBOo0ct/21XVUPhpK8ES1rE4Qy
	RpfHP2ikhLe0so5obvMNRbCC2TbS8hcsW5mmbW+DlW4/V544cIOfwJrM6wMxdyUcGygNGRggdChaM
	v1t79iSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpQW-00000000aNo-3p1x;
	Thu, 25 Dec 2025 17:47:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpQU-00000000aNQ-08Th
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 17:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766684821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0kJtkYpkUPuI2JipA1QFCVFw9kslwydenMOjeWpb0No=;
	b=CeSYSAyCOafdgXCq2Urnk9kbLtXI2WYC86KBKbPT376utGH5+FcUp/EG49FU3gbBi1Xu6Q
	QHtU4nWB1HHUtzolZfIagLHTtVUc1FGPy7Gno+Zt7z+1mDaEsLF0oyiESkBKx2SIdSV1Wt
	IoMMbbygJBvdK9Qa6t0C2MQGjd64oys=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-t75OMwEwNPmSA6XpfD8fjA-1; Thu, 25 Dec 2025 12:46:59 -0500
X-MC-Unique: t75OMwEwNPmSA6XpfD8fjA-1
X-Mimecast-MFC-AGG-ID: t75OMwEwNPmSA6XpfD8fjA_1766684819
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b234bae2a7so1615890785a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:46:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766684819; x=1767289619;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0kJtkYpkUPuI2JipA1QFCVFw9kslwydenMOjeWpb0No=;
        b=RJHJ+kQSmxwsxFpw4dnMGcM2MeOExqqexmY8MO/Wvj9MKthYHsjXVu5aJuNiBnmPcP
         YYNXAyMoVbF5wNodLy38FTwrxUNSOfrKbhRse6UPLcw4rZpzA+++giylzyFIDo0aVnLP
         KTM6tMXoo6lkd+2e4OMztlllZZhA+DNy4bjeaDx8gHUEDWJT6PfgBAx8b722Tgz7E53T
         Jzp4LZjOLzfy+siQcGcIR1pBlThaU49kEVKo1+b05rjxwjRxjjRf/dHfYYnyBK+6Dvgz
         ZbW4YoMaoyTCeDUoQZr0GpMntc0pV5nU5AplBhFahoLXI2SFsJh+0SSPGSw1MOVuHE/5
         Sfng==
X-Forwarded-Encrypted: i=1; AJvYcCV/1y/U0WAVK1+2O1hBeSs8CzcRkQMWPY6RURG8PRwCDNOFVg9ESg2k34Afsg+AKXZqF8Tbt7Dm9c7HY4O2fwvW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg32vwa0Z+4K+WXRh7B17EefXGLEUBof4zojsRXd1Oz/a2n7Nx
	NIfSeVjdQKMYaiR+VeWI1yEX0sIgpjbzIQM2sA5nUIlivcnO0a7D6e3wz9fDBpOJUZ1XH0GkM7E
	tfWou5GT2wYNKWpSpYCyIFVbTWWWmUY7k+OYBaO6NTgqGTNA3SsIwgAOo4cYRlI6TzphLU9f4Tf
	Qu
X-Gm-Gg: AY/fxX6F/tjFUL65is2x6LR/Jr/LjIiVKPFVvuPXoqSqtBE1kGdDQD9LBeCb60eMzm6
	tWA3mDetYlBvfmMv2NNX7r/bs7cmt2BSx1JcGY86475SlPBCCpdkSOCCRmEWga4YtIa0lKVouSM
	Hiic2lxWwAMH0VGty+3ZX4XzepSlfd19rtO1gLI6lFzzLgvAkHLQ88mW1m2zzNxaYo/Wbu1GEG1
	oubEwoc5d8OrpO58KKrxslBEY4wYxmY+FGd/86w/MmGZazLvVm1/shH+YzFdJxY+BLj+9ABrhZ2
	DDp2hC6k7kHIioZhdj3TdZdOJ7psAjncy0coYI4A6AojxUnfxDxccLncz7duJLCc5PO9WmLlTj5
	RZyhAnZz9oTOVO/7Cao/tFOKhb7rgpZGHneyG9Mn1LlM/
X-Received: by 2002:a05:620a:4109:b0:8b1:498b:77fc with SMTP id af79cd13be357-8c08f6742f1mr3088095185a.33.1766684819236;
        Thu, 25 Dec 2025 09:46:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7WXmE0cMDSwpEq7NOgN64FHK9QeM+bXc3yG0olFDRDC23yLs0+NqXOH85EiqPqZlaeHq21w==
X-Received: by 2002:a05:620a:4109:b0:8b1:498b:77fc with SMTP id af79cd13be357-8c08f6742f1mr3088093785a.33.1766684818831;
        Thu, 25 Dec 2025 09:46:58 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0971ee247sm1538002385a.27.2025.12.25.09.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 09:46:57 -0800 (PST)
Date: Thu, 25 Dec 2025 12:46:55 -0500
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: zynqmp: divider: Fix
 zynqmp_clk_divider_determine_rate kerneldoc
Message-ID: <aU14j4Xxes1BJLob@redhat.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nf37nI6lKOj-1CnYXNBWns__1j0UGUTNtTDHoLLGoUw_1766684819
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_094702_138523_6564E56A 
X-CRM114-Status: GOOD (  10.58  )
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

On Wed, Dec 24, 2025 at 12:42:11PM +0100, Krzysztof Kozlowski wrote:
> After renaming round_rate->determine, kerneldoc does not match anymore,
> causing W=1 warnings:
> 
>   Warning: drivers/clk/zynqmp/divider.c:122 function parameter 'req' not described in 'zynqmp_clk_divider_determine_rate'
>   Warning: drivers/clk/zynqmp/divider.c:122 expecting prototype for zynqmp_clk_divider_round_rate(). Prototype was for zynqmp_clk_divider_determine_rate() instead
> 
> Fixes: 0f9cf96a01fd ("clk: zynqmp: divider: convert from round_rate() to determine_rate()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for the fixup!

Reviewed-by: Brian Masney <bmasney@redhat.com>


