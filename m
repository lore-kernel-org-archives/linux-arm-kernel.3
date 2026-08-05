Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7C7C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRTmOAk6cTcHgi88kwVfB7nsud2FRmsRmiePcO6JUf0=; b=wD2A8lLRP3fH24x1DAolxlCx5j
	P2kmk4VKQBRPNKshZSY4F4WlCIA+CD4mMF30KxGYrjE7tzl9fYriEKUiLpHZktsRY8nmMYTrLh6h1
	VUCsAvpqF3+OFvY3a+Otl71FlQO2nJG2UO4PfFGQ4CcitzWTZfHdKNUsek/6WNy1L6mfvS/DOsle7
	gST0775zluXhxA0POUbC4aC4Qzbr3hJ0jHVYNiqIWXZ/++vT85jIydFrKcIWs/G93vdi70AKU067J
	q3XnJOBTSzQdca1/FY5cxPhVQrYyKsS05C9dZ8OW8x8woiQlR+zvENmWESrdoTSnBWn0yVT1rFuHG
	i+vh/u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcux-000000046mN-0Wc5;
	Wed, 05 Aug 2026 14:48:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcuu-000000046m1-1to0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 14:48:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3589B153B;
	Wed,  5 Aug 2026 07:48:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F34F3F632;
	Wed,  5 Aug 2026 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785941303; bh=TNWZy6YCwk1Jg/670Yw8+8Dm+5ppwdOabUkzC+QBhQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5AFHTTLzxiQjtqEvFZsht+b9/H6BjM/x3RwHls947twbgJc0VGaenS9OuNnNIJOT
	 mEjbZ+iR1nCYefAMDmIk62GyEXF0p+Wocz/2eB8/qm06XSy16S6U1PRVbyU662kBAt
	 jLhd7uZexScAhraTfyFOENpLJ/diDU8f6Yc/ZhcY=
Date: Wed, 5 Aug 2026 15:48:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org,
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, akpm@linux-foundation.org, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anNNLv3pHQwfcZOu@J2N7QTR9R3>
References: <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
 <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
 <anIXr4Kbn59Ac31Y@lucifer>
 <69f4cd9c-bd6c-4e5d-b8d1-a7be8408a57a@os.amperecomputing.com>
 <94c7988a-3ecf-4b26-b0a8-011bdc76283b@kernel.org>
 <29edec61-8f11-b9b1-3df9-2a51815ee771@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29edec61-8f11-b9b1-3df9-2a51815ee771@gentwo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_074824_534076_57F0D995 
X-CRM114-Status: GOOD (  11.04  )
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

On Tue, Aug 04, 2026 at 03:35:22PM -0700, Christoph Lameter (Ampere) wrote:
> 
> > That's really all we are asking for. If there is a measurable performance
> > difference, great. Share the results or point us at them if we missed them.
> 
> Scanning over the patchset: It seems that you are using a special
> instruction that is unfamiliar to me. Which processors support that?

Which patch and which instruction are you referring to? There is no
information to go on here.

Asking on that specific patch would be helpful.

Mark.

