Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE00CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pj5Qf/1bxCFrPvhs0jRUa6YUBACyGl4rbZxu2Lu22Yo=; b=d2bjZgKU1bIxalq9P0ygNYqmbm
	gLLa+d+LjknLoXz2LPV0kRy5szJJC9rCdZd0hI3iz0fg4/MSTIr6WjBJ/BLKJW/kz2HmGuDB/4IjH
	D3zG5Ao/fIlYuxZgE1pJxOwEVD99P0d+FVMlHmcazVVOH+HoKBb9wQooxesdg+MeUP7/LvRbX5Ocn
	83DzL4YU3ibhcYP1ldaRXPwaEbvBfdjvY9N0JGmxLtzSdBUijig1HPNg736gC9Ic2t6i5Y7ehhflg
	DZMhaisGs01tWBnR18aVuFQfV+6iwwaR2I3MBH2Qh56HT1FsrDSpVGlILFbMLcZnUChZctGSvb8Bm
	txX/yoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycwV-000000098bC-1vyr;
	Tue, 16 Sep 2025 21:10:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycwS-000000098aM-1Vq6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:10:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758057022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pj5Qf/1bxCFrPvhs0jRUa6YUBACyGl4rbZxu2Lu22Yo=;
	b=rzggNwY2vNIxBIBWhIM2eNT5/Wfp/pOEx3vtX/gpirUkPKVvJ0xOMkn1gIzyLdOdcJM/AD
	LJ2HK4ybwmU0mn9P3gCiw4KAwCnEtKWMS9Sb/0qKfySh8hUCPH70rJAg5Vq0oS1Etq5y9s
	fWaUbCSElmQMt6NX3zClcf91wEMcC1oZuAdCi/5IRA+Ig27XqQiW9KvpUqkD9NqXkHLd/0
	Gd0n3URf4LrYUw8JAffVYVHTmdNOaBv3i4kwOMJvXw8NmVIpVwwAtKoaJo94DrP41+tyCK
	c1/lgsIXQKLPw28SqA5WCxffxdnDK3zoAfFJs9W+tYUbrCs6XWPUEcEbL4SF7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758057022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pj5Qf/1bxCFrPvhs0jRUa6YUBACyGl4rbZxu2Lu22Yo=;
	b=SDnxirkNQwaVrfSM04srsZSWToQc90VpYlu25/LRFyplMb/H/OpA4GODTfBkYO63u2m+3S
	JVN0QitkAjbE61Dw==
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
In-Reply-To: <20250912150855.2901211-10-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org>
Date: Tue, 16 Sep 2025 23:10:21 +0200
Message-ID: <87cy7q9k8y.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_141024_537198_71FE377D 
X-CRM114-Status: UNSURE (   6.21  )
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

On Fri, Sep 12 2025 at 18:08, Eugen Hristev wrote:
> nr_irqs is required for debugging the kernel, and needs to be
> accessible for kmemdump into vmcoreinfo.

That's a patently bad idea.

Care to grep how many instances of 'nr_irqs' variables are in the
kernel?

That name is way too generic to be made global.

Thanks,

        tglx

