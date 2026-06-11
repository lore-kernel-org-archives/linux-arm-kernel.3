Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C4BCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuTYoMzmADbLZx5mBuWf/jeTSzrUAeENzv6Lo4hWe+o=; b=PM7k2/yOGt4CRMPFYO5mVOJooZ
	rNn1eh+GgdYwN5iLPXIbttgI6FHKVOo6vl4FW6PBBIFuK2XDrnmeortljSdu93Fn3cp+gGholgZ6P
	s1YprpbiXSzMg3AHwcQyG6MON0z3tch+1l7TeZolRrjwJzM3H2rrWggsaZph474f9kc69vzv/adO4
	u51ZGvQPyJiEo46awEue7SPTrV9uClbl7w7L26kMYSktfkyJH7KIbXTmzcPJv3KLMoGAQiK5UIJat
	2jGa1wpdGmNmBPCt9Qgms+HGOWCf8syEX8achMYvI4WxMWlxwJaJrbq85oiB0dr7miF2vZJF1bhsE
	mi1dtPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfab-00000009Ww2-0Qvg;
	Thu, 11 Jun 2026 13:36:57 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfaY-00000009WrO-1ZZs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:36:55 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781184976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OuTYoMzmADbLZx5mBuWf/jeTSzrUAeENzv6Lo4hWe+o=;
	b=tgx5l7fEPJqyKE3EtrMYdNW6Sxds47dKnfzuGanOOuaqz+09uI8JEBtA4tqIpP4uCgwPLq
	7UDlQm+/7kJqyHYp327Oly+uc3y7A61cb5UVnK8c+xrAVpSRXfNCpi3jez/PyI9YufDup1
	hGu21L2FRpVnZ8eH8wkwbY3pXq9n9/0=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 13:36:12 +0000
Message-Id: <DJ69DK9H09I6.O3GUDBXQS1QF@linux.dev>
Cc: <linux-mm@kvack.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Ryan Roberts" <ryan.roberts@arm.com>, "David
 Hildenbrand" <david@kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>, "Christoph Lameter"
 <cl@gentwo.org>, "Yang Shi" <yang@os.amperecomputing.com>, "Brendan
 Jackman" <jackmanb@google.com>, <owner-linux-mm@kvack.org>
Subject: Re: [RFC PATCH 1/6] arm64: mm: explicitly declare module and ftrace
 execmem regions
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Brendan Jackman" <brendan.jackman@linux.dev>
To: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-2-abarnas@google.com>
In-Reply-To: <20260611130144.1385343-2-abarnas@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_063654_560946_3A986D36 
X-CRM114-Status: UNSURE (   7.15  )
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

On Thu Jun 11, 2026 at 1:01 PM UTC, =3D?UTF-8?q?Adrian=3D20Barna=3DC5=3D9B?=
=3D wrote:
> Replace the reliance on the EXECMEM_DEFAULT fallback by explicitly defini=
ng
> the execution memory (execmem) regions for MODULE_TEXT, MODULE_DATA, and
> FTRACE in execmem_arch_setup().

Please can you explain in the commit message _why_ you do this. This way
reviewers don't have to make a mental note and come back later after
reading the rest of the patchset. And once it's commited, it will save
readers from having to chase down the contextual commits to figure out
what's going on.

