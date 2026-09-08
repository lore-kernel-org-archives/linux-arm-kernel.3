Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F741C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4vXbWuRfzO/MusqbPkktBl/EFRxYMbIBerOhaVzBug=; b=gI6NcrCesf7g+n8EYwoV7YGk9w
	ZBGwjo55fT9556n60Vy9UD4bfqY+0W/Tko9S/0CNZoFbGlgiGxGyMO7AvbsX3Izm2tlcTpKpfb17J
	OD5FRaoLhEBwY1fxTKjZD9b2xpnbdttd725EQWzgr0NJ7vs/S8Dr1GpNHbtXudP4zxwULhgoFGOXa
	CmfmVcBQdanHzjp4/Y60w6V2OBq/gbtmEqAIlPOcmY1yr9hlL4cmgIWUIwjphjFmtM203/EZDnrCw
	kZqp/pZsJwb1lk7TijXULjCKzknLAYgU0MUKOZdA5WntGBG8M9vW2TRErP39i13IPGghwDLGLFp3r
	yx7ohBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xQL-00000009PJD-3Src;
	Tue, 08 Sep 2026 15:07:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xQJ-00000009PIY-2xC8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:07:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 523681476;
	Tue,  8 Sep 2026 08:07:41 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B8CB3F7B4;
	Tue,  8 Sep 2026 08:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788880065; bh=F61H69mF3VruYwfQfBXakM+FEgay4xnK235Alpe4aoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QoWVPHf3TavwxFTtgnVEyELJjRbP3NinnNCLDdKrB4tTPfhhSaiI9Dv5m+cuqbs5c
	 6A4UZVT4jCFT5UoqOYgw5HqhFx+QATcMzDM7TeYSbbVUYO0rTxiCgImQ7mpKT44N0p
	 OSWoWaZXcddyG//soN84UEUHOWhs9eahQeJsU8Os=
Date: Tue, 8 Sep 2026 16:07:40 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v3 16/21] arm64: percpu: Implement preemptible void RMW
 ops
Message-ID: <aqAkvK6zylxwq5J2@J2N7QTR9R3>
References: <20260904161758.376504-1-mark.rutland@arm.com>
 <20260904161758.376504-17-mark.rutland@arm.com>
 <20260905100319.0a50c17f@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905100319.0a50c17f@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_080747_784542_AA3334AF 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: vladimir.murzin@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Sep 05, 2026 at 10:03:19AM +0100, David Laight wrote:
> On Fri,  4 Sep 2026 17:17:53 +0100
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > Use the PCPU GPR infrastructure to implement all of the RMW ops which do
> > not return a value.
> ...
> >  #define __PERCPU_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
> 
> Isn't this definition exactly the same as __PERCPU_RET_OP_CASE() except
> for s/tmp/ret/ and the 'return ret'?

Not exactly the same; the __PERCPU_RET_OP_CASE() assembly also performs
an additional instruction at the end in order to generate the RETURN
value.

> Since the compiler will just ignore the unwanted return value
> there is not point replicating the definition.

We could consider sharing the assembly, but it's not quite that simple,
so I'm going to leave this as-is for now.

Mark.

