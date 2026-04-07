Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94842FF5132
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/MSOJp/AJlf7hUTMD/NXnVkTNNfR/Z7vvW8KkUYbLI=; b=TLoDg3SdSxQPEpC7jZ0HCBSjLW
	Ogj+x41S8HK6WciFzwbRova0W6EaYPy+WDaxqIh9rEvLiJnIOuiWGiTYJdKBorhA1iSiN2OS7TQtw
	AQoZ+kOjloolpIaiVonqh0p89v6KO6hDcejCE2/1andKGbVqOWox9fDb0U39KsdrTczJUM2VLJzhl
	OkI//T/2AlZ0U76od1G4o1ziEpIkjskCeci9B4lRbAr0S1SAHYsfEC4NGcZFgKkUhWbzufZ80AYe8
	ZLf97g1kkkHeNIRC4ojS4Q9nd2OEzaXov20VP1ZGBMzWpbxOWhmZNsqBTFh2M3krQlm6TMo2ZtGGl
	QGQktNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAbg-00000006t58-0QVZ;
	Tue, 07 Apr 2026 17:52:56 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAbe-00000006t4T-0Sda
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 17:52:55 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35842aa350fso12471710a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 10:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775584373; x=1776189173; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/MSOJp/AJlf7hUTMD/NXnVkTNNfR/Z7vvW8KkUYbLI=;
        b=lVD4A2xvKTsWLov1gw1CL7FogtUwCXSx8aHHWRRjLvYfvK7huTvZ728lHLLwFLS1M9
         X5s98fCXlTFOc6pmqXkTYkdI1OGFGxfKnChXpkxhtilydILQ1UEcr/aCkWGLjXCgYOzr
         puJK/0G885FRgbmwh5UHfIvg5i9SBsO7CT95304Ly00sNYqIoinb3jmczVqKiBT4cL1l
         bbg0toUgNwlS+p4BsEzynXXSp2ruivYQ8MmaE/P8321HJ5GNNWPORtuDkCmGNZw/Uzv+
         5DHZH5ubHMYcdoN8kbTHwbB1R7EnU7Mb2MKmJKxqb7/8s5FVPVknt2SAAMpBE9TfDOM7
         Omvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775584373; x=1776189173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/MSOJp/AJlf7hUTMD/NXnVkTNNfR/Z7vvW8KkUYbLI=;
        b=DybAWlO85JgkzwosAUqvGFAVWUB/oGkd1G0c7eiqIG26RapPEcvG4uB2lRtzIpOsky
         pmEDcpweiyoseheMH5cIrjd15rpqGZAry+0u20hV5CEARAZsFq0BLFXT9xT31spEDAVb
         j4xccAQ8am9kilFHlJoKyRjXpGuTa9Nr/ioqOq+Xj52+U7iD9LZ3xOWO5Op2vtxme5CO
         oxnhyX/DKraeFETVLB/BC0I02ZaapjSOfCsDQNcd26nuZ4TxtjGqU64yziKV/0sHo/YF
         CkG8p+JWz/tWRWZxjZcTl0ACeXGHF88vX2A/ym1nlWNME/U+5AXGrTfZYmEOwcrt3G/p
         SBqA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9i9U4KSo5v3p93atWstuCMGDPrYyBnX78wuh+Cb0uVXoS0cKa3TDyR6YYKl7+lb2vZrpCwB3LoCSIbrjMLn6@lists.infradead.org
X-Gm-Message-State: AOJu0YwcpoNsjbdiyk06nbSSYBDMlGruGjprqWst9siB9e7aSd/g4X8Q
	Gy3sAgTSDYylFqHYF+yXbzIczKONcGe5UdJucJmmqp2HQi40AFlBH+3dxr6QkyfVNxxaQZis4xI
	VgeSO9w==
X-Received: from pjps16.prod.google.com ([2002:a17:90a:a110:b0:35d:94b3:bd6b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2885:b0:35d:974d:8f7
 with SMTP id 98e67ed59e1d1-35de679c8ecmr16179304a91.1.1775584372473; Tue, 07
 Apr 2026 10:52:52 -0700 (PDT)
Date: Tue, 7 Apr 2026 10:52:51 -0700
In-Reply-To: <2a216ee2-aebb-42ba-b2aa-826488448bbe@linux.alibaba.com>
Mime-Version: 1.0
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <545847c132da5d957cfc74ab19e849b16127aa8f.1773890510.git.baolin.wang@linux.alibaba.com>
 <67c670e2-c98f-490b-bbb9-2960f8175b5a@lucifer.local> <66e78b59-f96c-4277-b7d7-473b68ed413f@linux.alibaba.com>
 <adBJTXeE6G2vQNKX@google.com> <2a216ee2-aebb-42ba-b2aa-826488448bbe@linux.alibaba.com>
Message-ID: <adVEc4zUVVxRiEJG@google.com>
Subject: Re: [PATCH 6/6] mm: change to return bool for the MMU notifier's
 young flag check
From: Sean Christopherson <seanjc@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, akpm@linux-foundation.org, david@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_105254_182084_DB0D8DA4 
X-CRM114-Status: GOOD (  14.06  )
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

On Tue, Apr 07, 2026, Baolin Wang wrote:
> On 4/4/26 7:12 AM, Sean Christopherson wrote:
> > On Fri, Mar 20, 2026, Baolin Wang wrote:
> > > > > -static __always_inline int kvm_age_hva_range(struct mmu_notifier *mn,
> > > > > -						unsigned long start,
> > > > > -						unsigned long end,
> > > > > -						gfn_handler_t handler,
> > > > > -						bool flush_on_ret)
> > > > > +static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
> > > > > +					      unsigned long start,
> > > > > +					      unsigned long end,
> > > > > +					      gfn_handler_t handler,
> > > > > +					      bool flush_on_ret)
> > > > 
> > > > Can we please fix this terrrible indentation while we're here :)?
> > > > 
> > > > static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
> > > > 		unsigned long start, unsigned long end, gfn_handler_t handler,
> > > > 		bool flush_on_ret)
> > > > 
> > > > Would be nicer, thanks!
> > 
> > No, please keep this as-is.  KVM's preferred style is exactly this (and I personally
> > find mm's style much harder to parse).
> 
> Um, Andrew has already queued v2[1] into the mm-stable branch. Do you want
> me to send a follow-up patch to restore the original KVM coding style?

Nah, not worth the churn.  Thanks though!

