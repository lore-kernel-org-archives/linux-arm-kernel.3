Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C3CC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkCOea6tIQttao4Q4gnUxT8VpD52QN8Jk9jItuqC2g0=; b=ZvreX38hw2ytPYIT//Drngi7X9
	ktcjvAQWhAmgmuZFE7Bufixyb/Rq2/aie2a2P2Pg75JukDQ0e4Ti3A06MHIlOyQvG9NAlR4Da1P5e
	XFOcmR+p07NuxZgWss8nRcRhi47N5uFC08lLGZ+ZZ7g1Kdotdut0O8u7ajawWBnoVQ1vyQM0/te5b
	WpMIEVEvPGqklOdoOE7sPtIoOSMiozTtwUETb8dKPqx9cOHjjsaCVxvk8MTVQOOP6rs35CV0Trq99
	SMkcuPkbmsr9Gfd44GD6OcGm0rv1mPgxCy7rm7eYLxanpLQi4LiG8JjbZ2t1ZuOQbOJXog+RH23VH
	0PO0pcmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n71-0000000F80j-3hif;
	Wed, 02 Sep 2026 15:42:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1n70-0000000F7zi-0zCJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:42:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48433fad54aso807203f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363772; x=1788968572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tkCOea6tIQttao4Q4gnUxT8VpD52QN8Jk9jItuqC2g0=;
        b=FuDVO8eS/OW2GE/P9OPlqd6rxsYnexx4oVnFHBkX615qkCUzrjmtQGiDUed+Ggt5sE
         wCX0H1QguwYJX55lX6gGkpUTdCURqx3rMf1Yf7Mwcksb1f7nlMGBkfzga3bx9hlok3k5
         hvXQ8azF4KHuVgbfqUc/WZ+pB3utFUX0ICPIANxXdpRwnLJQvstWGaShPWweyVYrnB9z
         f4lAEVKLxnCEVPuddIwHRYiu/YblxnTgTPgJ+BVVyIYM+t98RPh1PYtISPF0V90StGJR
         uOyG7bxWwAWSCwpJse2/G80XdtVQsHgYiH82xyuJxLui59EslfAHReIzWOLj3fPj3XDc
         O8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363772; x=1788968572;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkCOea6tIQttao4Q4gnUxT8VpD52QN8Jk9jItuqC2g0=;
        b=CjRkBaSmk5RxDLMilv4ImnlUuwFVBEgN/oNqMH7zOtx7f5ha7NI6lndsciVON8JwVO
         Zg3cJeF9n519/N0og5pxe4127R3ZEANhg7DI9U6xr6RR4sAZhtbFcN4ui9xZ0ofoJnmT
         70fQCOsJaX1c8J7A9RNVp9rt5M82An5zRMJ+gkXdp6SQ9DjatRlssHmuXy5WaMKkoV41
         LCanqjiZWOAyw29mpBAfTxW3bvE8djZPzp7mH0wx1QFet7IEJhXhJbvZq1cfM1flpmWR
         gqHsLred7WSb+D91U/7j10gKkGAXqgY3cADVzicLZdILs4z60z1CER3kcfFgPDV03zPu
         WX5g==
X-Forwarded-Encrypted: i=1; AHgh+RqzrrJWnE3I28OFOuL+eCMRJqQY81ju9m2kyZoBjwzz6YDfbQOIZ2fU92ppvk85bKacacH8KqmCUl3kOfcpUw1b@lists.infradead.org
X-Gm-Message-State: AFuF++mSiVVAonBTBArGQnoI0VJXeWGDRyrFVd+TO0BMMcjU8Kviuecv
	6842s166obE22e3JUvcNv3l5VNbGpKQ15ym/50gjokOQaKA5LxMfJInK
X-Gm-Gg: AR+sD13q/5b1PlaJOoo+U14m0Dg95CZRDLoq/qVNvFIWnJF/ZarFD5mmZiIx9uv8iRo
	knL9l9swuX1TUVizo3KyK3RuqWXFwx8mvRpaWQLyfQoIeSftDyt9FR7+aeQNyWyQRGlTWJPdqh8
	478/F+W36vTQlvpd8jmuIYXnT+6tisissMvDph8+ploz9jL6NBOlTC9Ghlv366OA7gRomZmvgi9
	XxfWyObh6dQepkdyRa2z79FDSgP21pPTpAwfB++JBYfeCm4UJCMrZ1a2NCl/9fATDYpAopcHJx+
	twzGqNKfFNpHaRe68YKEDD0kN4m6oyz4AvsaWTCnxCww1VbiMznmm5OmVIoOSensYFZhGhjfVI/
	kxSRcCrVTgj12eWsGwUDdAst2sTBT+OCLJopVDDJPxqerPUNl6yXTdx6osVeu3bK9stFEl3nWzg
	SkXZhuWTqDjJD+d+XoxZhhc3oFsqfIqzatvEI2xXd8HUY81M9BZEyCDtbRj3fWwslgWq2zaXQGm
	9t2iWTblfZ/Y37+/27DHC8UJw==
X-Received: by 2002:a05:600c:8714:b0:499:b65d:1250 with SMTP id 5b1f17b1804b1-49ce580d869mr109336155e9.2.1788363771670;
        Wed, 02 Sep 2026 08:42:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47b9817sm57993845e9.1.2026.09.02.08.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:42:51 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:42:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Usama Anjum <usama.anjum@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, vladimir.murzin@arm.com,
 ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com,
 stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com,
 yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org,
 david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Subject: Re: [PATCH v2 00/20] arm64: Preemptible this_cpu_*() operations
Message-ID: <20260902164250.40852ba7@pumpkin>
In-Reply-To: <9789fd67-205a-412f-90d6-42c401d3babe@arm.com>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
	<9789fd67-205a-412f-90d6-42c401d3babe@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_084254_302425_0C07C007 
X-CRM114-Status: GOOD (  18.54  )
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

On Wed, 2 Sep 2026 12:55:12 +0100
Usama Anjum <usama.anjum@arm.com> wrote:

> On 04/08/2026 6:04 pm, Mark Rutland wrote:
> > This series reworks arm64's this_cpu_*() operations such that they do
> > not need to disable preemption, avoiding related overhead in the fast
> > paths. Instead, the ops begin/end a "PCPU GPR" critical section using
> > unconditional/posted stores, which should be very cheap on any
> > reasonable micro-architecture. During a critical section, should a
> > (preemptible) exception be taken, the entry code will apply a fixup to
> > the GPRs containing the percpu offset and the generated percpu address.
...
> tl;dr
> Comparing this series with the page-table series [a] gives 8 improvements and 3
> regressions.
> 
> Fastpath is a Linux kernel performance benchmarking service. The table
> compares the both patched kernels: positive values are faster, negative
> values are slower, and (I)/(R) indicate statistically significant
> improvements/regressions. Unmarked differences are not significant after
> accounting for confidence and noise thresholds.
> 
> +---------------------------------+--------------------+-----------------+-----------------------+
> | Benchmark                       | percpu-pgtable [2] |   gpr-fixup [3] |         gpr-fixup [3] |
> |                                 |    vs baseline [1] | vs baseline [1] | vs percpu-pgtable [2] |
> +=================================+====================+=================+=======================+
...
> | perf/futex                      |              0.55% |      (R) -2.80% |            (R) -3.34% |
> | perf/sched                      |          (I) 1.61% |          -0.39% |            (R) -1.97% |

Might be worth investigating those two.
Something odd is probably happening.

David

