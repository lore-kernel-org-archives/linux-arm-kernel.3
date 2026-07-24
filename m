Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB11C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vr7PU9QdQLaE9g7OxEq1p1hH6fPGZz9aJy8GzEkv17Y=; b=N0AVXM8mEuIRLx0oStcPIBk+T5
	+4ZtGK0qXiuYjtTq9SMq65b6mx+x3/AmzsVwKWBWXGudulJTTOfuu8Vt4H9bMedRCGYgBLK56D7FH
	F0NFm+Jo/hKPhMA4yT8MmmZ1p8ZRJ2b2BfR2MIB2I+TKcYhEkEaarCV2pG6k+7V8np9lINlmNvzlW
	Ukk2xBNyJtDUdOPC4C7AGCMFxf7IA3tOwhpeYsQHW3WjoV/CVKjbLQy/YQwDhcbg/2g6Q7F7gMJnA
	MPmc0OTGbWtYZGg5wrF8iD7QYc9YUOP7G9/gsRm+unb6y95/BdfAeeiET9oZBr/UwtfSABLa3TxdK
	NBKAN33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmT-0000000GhTa-3hEQ;
	Fri, 24 Jul 2026 15:25:45 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmR-0000000GhSG-3Y4O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:25:45 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9e7391839cso528308a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784906742; x=1785511542; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vr7PU9QdQLaE9g7OxEq1p1hH6fPGZz9aJy8GzEkv17Y=;
        b=jDAyvFaBPeyy0/4CoJgxFeF5LC67cR6Ps46q24lC84y54cnqfx0vcLKOdSH+ygfZfo
         6VyYNMFXM7SvV196TQ75oKlnpd9MAwa1n1kVR35Ej0fB4vnRfUV9jOaZVVs9UGS+Pfo3
         j5vzlIb2Pt8wy4aruRdaWQ0pa5y58CBr8x9lHX7rX3qmvcU74pj348V5fKV8rQhnIN7j
         I3P9R0QRKqv1H2RgGh1R0+ok/hd2aeJn5cGjqJB55YioIRFMVZwqsM7H5Eq1REw0J5Y9
         XuRM0v/ENupQ/Rkr+uBHcfe2CJvoAq5qBc6C5+DvJKezQ9GeehnEB7iH3kerbi80JAJj
         0luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906742; x=1785511542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vr7PU9QdQLaE9g7OxEq1p1hH6fPGZz9aJy8GzEkv17Y=;
        b=rYsZX9WRYi0e4gEgYp5V2eG8lglrbRIzz7w/5LYsrd2ACryZcb+N/8bI5k8blBLjGd
         lueGUWs2b80FxsfIBwpNnMwnIspyT7Bu/5akN1R29sVQ4cRP4SAwLCpJ1sPpnJQI0lKO
         ovgIDffqeyNz8BU5g3EjmybG6VXrstFp1w1zK6mqymdgZIESydhnQ36P1df33bSwgdmG
         D1VHvtxBl9zq6BpfcM0w6pfTQQ+IXxMdb52OQv0G1zD7ROZs1m2iY0lo0zXIDbw/qzCc
         CLAYFIycGq66t4mdzuM1jf2224DBqdn8PtbRL0xYDveP2YqChLmnivks7vJI5hFRqnTh
         WAbA==
X-Forwarded-Encrypted: i=1; AHgh+RrYJ3xryqqMUP/Ah+f6isPSsP+2f3fm6D3LeGwQ1l6diH5evoqW00T1Rn8TvaC++4WrB+CYd7hvokn55aYiCkjf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Z1IqRE0KREUeOzr+tG0UJbOpsCzoh+d6Wnkwd79fO+OYs80Y
	6UANA2DNfJbvHzeoyrBaEHMhK6rjSRNN7eC9uTwON+iSO1CY1NRUBI9VLujjzfP4zuI=
X-Gm-Gg: AR+sD13jIqxSVsyZblIKwYxLf6voV3kJYVJUIxHgCAtXj+RWmtpkhWOfhjzUzDAqDZ4
	xWBWj1cC04oIx4pnL0jR1165SiT4sK60yLrkeNn4v7FFcxHjZBaHdAA/g8Qx4yUjctpp/Qum2xk
	zBbLJgnK5UQI0iQZqkyt+T9L6D0WRyRLgBZooGHdAo1/hfW8a8omo9/QPcgLcqB9YbSM3hW16HY
	hW7zi+fRxclO3uYScJYgvlQPq9Q8ARZ/vbwubxmX67IJf4BqYwj72j7neEda5jDDW43KMO7gffp
	NwfsTnECzUQ9f0PZx7NBdbp3PIRJU+4s18IoVVVh+s2x7E8ho8uiUOL7nRwcxtirplr0Aw6FGve
	O1+0zkYtIL3VjYZEi58TGXS2/1ihE/0wru941sl4rVl1uk51pagqsuQfTwMUPGGE=
X-Received: by 2002:a05:6a21:6b16:b0:3c3:bbe6:95c7 with SMTP id adf61e73a8af0-3c44b00772bmr8719542637.17.1784906742420;
        Fri, 24 Jul 2026 08:25:42 -0700 (PDT)
Received: from ziepe.ca ([216.228.115.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59434fsm590606eec.24.2026.07.24.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:25:41 -0700 (PDT)
Received: from jgg by NV-9X0Z6D3.localdomain with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wnHmO-000000002o5-3k7t;
	Fri, 24 Jul 2026 12:25:40 -0300
Date: Fri, 24 Jul 2026 12:25:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, nicolinc@nvidia.com,
	joro@8bytes.org, jpb@kernel.org, catalin.marinas@arm.com,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <amOD9GAz0j7wMMij@ziepe.ca>
References: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
 <amDEmlcyC3Tfmkel@willie-the-truck>
 <acd85a2a-af1f-4ebf-8370-773338d4fd15@arm.com>
 <amFCQDrEowvL28O_@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amFCQDrEowvL28O_@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_082543_955483_F3B3C5B8 
X-CRM114-Status: GOOD (  13.09  )
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

On Wed, Jul 22, 2026 at 11:20:48PM +0100, Will Deacon wrote:

> > We might block traffic in the process of _explicitly blocking traffic_!?
> > Whoop-de-do, surely?
> 
> Hmm. I have very vague memories that there were some virtualisation (?)
> cases where Jason and Nicolin cared about the type of event that would
> be generated by concurrent DMA (e.g. bad CD vs translation fault) but
> maybe I'm misremembering.

Yeah, it is actually important for that special SVA mm drop/release
case. We need to write a CD that blocks walking but always generates
translation fault.

I'm away from my computer right now, but if sashiko is saying that the
SVA flow that uses EPD generates a racy bad CD then that is a bug that
needs to be fixed. Possibly by ignoring HAFT in the used calculation
for the EPD cases.

We should also try to have a kunit to cover that specific mm drop flow
in the SVA code.

Jason

