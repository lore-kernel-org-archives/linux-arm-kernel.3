Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCB3C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJhF12/fclwO6zAdWUTEZxX2hd6wFsf0dBXm6vlW0h8=; b=q2MH97FkeAamOGQ9yQGQV45z66
	8O00PiCbtQWqp8txvGS0JyyKCeOJ0iqRFKSaCt53J2lkII5b4WsFfNo2mUttheoLWu7ij4uBwVYpm
	8iFK4iCfMuyh0IDvkWXT+E1QC6+/576klZ9mzItj0VXGZDFnIXD7ZgKSKD0jUVL6AqPN/bBct7mEG
	Ylvobs7n+0jbbiMTfVFwk/15VJyLYkqSy+FYdua1tllsP/TSasCnRkkldncYMnypCTd7mELSlACj4
	0nFBjsaD9lrsvCE6ekQ2XOZeZyknSEP5AiwK6LjNLPIPkci6d5uVyZiTq/OliM8i9Kk8aNJo5DM3D
	LTUFG9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ptY-0000000ACMq-3Aoy;
	Thu, 10 Apr 2025 11:16:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2o4t-00000009uh6-1nZS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:20:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744276805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJhF12/fclwO6zAdWUTEZxX2hd6wFsf0dBXm6vlW0h8=;
	b=A7yNQQtazyb9XPUZRf0jJSzzrIHi51lf5CjAjz6d9YBB4IoqBfDRyA8tQEV2/lnF+omWdj
	ERVsVR/FZAFhAUXAxG7j+1Ig8+0zjZmINIMBQVpjU8LJQL561shJpy+DqqpDLoQTC6mJ9Z
	oJvjTnDQDqC7hUifRGCwy61wyiRiWnAK9RF3sq6iWRZOymOjLnjE3L9I84Tx8ONmHfrVBB
	//Ml62580CLywJmps4WxxNFHGe0DjKPPTsTed7CDJgBH1XBZPCkVOeyma4M0N8eiZPO9Qk
	oQAJCNQkDtgDkZhhMLq3GGfUqRGV45X0w/lx/M+yJ9LSOPfjCrWLTXWFY2oZTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744276805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJhF12/fclwO6zAdWUTEZxX2hd6wFsf0dBXm6vlW0h8=;
	b=VbKoGyMqlmME3/WtdvAyQPq0vCnxLJSBQjkbb6Qvq41UuyGSc2qOEwX7EqHcg5BD5r3uzl
	2VmoSm5pfbpFg5Cg==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 22/24] irqchip/gic-v5: Add GICv5 ITS support
In-Reply-To: <Z/d8bP9GceSVpJAU@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org> <87jz7ttb7l.ffs@tglx>
 <Z/d8bP9GceSVpJAU@lpieralisi>
Date: Thu, 10 Apr 2025 11:20:05 +0200
Message-ID: <878qo8tltm.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_022007_603593_E8C517C4 
X-CRM114-Status: GOOD (  10.26  )
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

On Thu, Apr 10 2025 at 10:08, Lorenzo Pieralisi wrote:
> On Wed, Apr 09, 2025 at 08:57:02PM +0200, Thomas Gleixner wrote:
> Anyway - as I mentioned in the cover letter, the current IWB driver
> design, (patch 23 - where the guard(mutex) bug is and more readl_poll_*
> boilerplate :), sorry), is a bit of a question (should I move it to
> DOMAIN_BUS_WIRED_TO_MSI with the fixed eventid caveat to solve somehow),
> or is it OK "as-is", treating it basically as an ITS hardcoded plugin ?

I'm not sure whether DOMAIN_BUS_WIRED_TO_MSI buys much, but OTOH from a
layering perspective it's more in line with the existing wire to MSI
implementations. Marc might have an opinion there :)

Thanks,

        tglx

