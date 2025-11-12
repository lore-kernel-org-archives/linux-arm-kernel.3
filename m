Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78221CD3429
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wee6c4dDukm8z3hSZIH6NBLzvLOXmMEAzonx8MFu3Pk=; b=UeW8D68psbK1S8Pjk0NeSuDLm0
	IIdYEkS+fA5/WQ3wYllEI8VPIePPDz0B0g2C6s7RAdqaT2SuPraSh5XhWtaO3EZp3p/kLwe6W8x8q
	DIlXtfqxkRhIp9g2GkEcYjuhYt30lBr4GCDgqDQi5mZn3UJugUQ8wf1aniMuPoGEzI80PQCQYHc+v
	kDqp4tlHu8jW2PtRT0PFAvJuq2c2d3yBVUgUPlz4ktHT7Rn6+keaWxkvwhSj7o84QQHzKOlh6zFYn
	FCLkX98vlHUEI2LQZZrlYAOxEm8EhkcstDaDj/Xj8peHZrJts4tNY+WFCbNZn6tx6l3kCSk6ArJPb
	WmQbB9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEb5-00000009FJt-2MKY;
	Wed, 12 Nov 2025 17:25:31 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEb3-00000009FJN-323Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1762968328;
	bh=wee6c4dDukm8z3hSZIH6NBLzvLOXmMEAzonx8MFu3Pk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oVN4FIRtiDdwP6aOXZJDcg9MKkNCLq/7E78gzXAtCW6Gh3rb2c5xt3SbxRwFr0GKG
	 74l/PRTkd5N2Rk3UWVWyCpRkAC4ACT/4JK6kI8QKNvcwnXpoloIIez5N7pv+KcKTE6
	 8rCM4dZt8FKBeuePIQPBXAMnw6wt+JyU/5OHh06Q=
Received: by gentwo.org (Postfix, from userid 1003)
	id F09BA40251; Wed, 12 Nov 2025 09:25:28 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id EFAA14010D;
	Wed, 12 Nov 2025 09:25:28 -0800 (PST)
Date: Wed, 12 Nov 2025 09:25:28 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Catalin Marinas <catalin.marinas@arm.com>
cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
    "Paul E. McKenney" <paulmck@kernel.org>, Breno Leitao <leitao@debian.org>, 
    Willy Tarreau <w@1wt.eu>, Mark Rutland <mark.rutland@arm.com>, 
    Yicong Yang <yangyccccc@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] arm64: Use load LSE atomics for the non-return per-CPU
 atomic operations
In-Reply-To: <20251106155213.3186582-1-catalin.marinas@arm.com>
Message-ID: <ec4caccb-e464-c8b6-3553-719c4ec443a0@gentwo.org>
References: <20251106155213.3186582-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_092529_796135_17472743 
X-CRM114-Status: GOOD (  10.79  )
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

On Thu, 6 Nov 2025, Catalin Marinas wrote:

> STADD executed back to back as in srcu_read_{lock,unlock}*() incur an
> additional overhead due to the default posting behaviour on several CPU
> implementations. Since the per-CPU atomics are unlikely to be used
> concurrently on the same memory location, encourage the hardware to to
> execute them "near" by issuing load atomics - LDADD/LDCLR/LDSET - with
> the destination register unused (but not XZR).

Far atomics would evict the data from l1 of the current cpu, I think.


