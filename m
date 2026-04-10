Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C900F44846
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r74tfLijQepwdzEGIMNneZqdsCHUDDkBY+hSmnTX8x8=; b=3Du6vxLZ6rh3jIIDPgg4qpC+Ff
	RNh4H8Y0mmPmINaLvuFDmIhbqrtOdM1wY2ySZKwQcvltBE0jIMFsJKR8+DCrde3UUO+g1IHQ4CbQR
	NumNxnE3mSb5s43zDw+lS7F65+P2Kipw5i9ejkLR664fbwP8BFZpkuF06sfvj3x7fRh/ouMoFre4v
	hHJu3Eq3UUj91CxOzom3Bi8JhX0YuE3Fri5n1h/kAj+PYXYpyVHKc6e/B3MX295fBM6TlgKJid429
	9nD+QVlUyPlQlmJ4mkhq9i0Cwnj/2eNospAFw0U+RMZLrIhr8r9Vz+xo2vsv/D4dRoRDnY3wZdB62
	y1vQpGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAhY-0000000C8FZ-3p9A;
	Fri, 10 Apr 2026 12:11:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAhW-0000000C8Ep-0h6t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 12:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9B6E42DEB;
	Fri, 10 Apr 2026 12:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85461C19421;
	Fri, 10 Apr 2026 12:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823064;
	bh=k78GcqpEWblcRbOUKOrDYbsYlt/6IMdePSm+NYmY/78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m33DTTTmy/Jvp1nd5wJCymcYOK06hnl9K2J00S01KmgRyBnFwvsTcVU1SmFylucMb
	 1CNO9wZF01DEZm7emF0aLHvw2D3UhFIIAnFlvLRRmLR8gj7kOMrRxMlLKm/dChIZFX
	 9OhUM7legqyd8nF/3pbe/yHkzIUT5X87DxKQC+a7kyzSpC6QVSl8Rk7AaeJVA/c8ZA
	 C5f+9+qbl/RbCB7t7EZLNDSznjtkBJsrg2h+Lc12I4o+IQj5o6rw8BrsB+FkL+8c0N
	 A30hXuNtp60oLA0dLJNidfxFfU9Bwf6x2Zp2fWU8G7cNhwa2MiSvHLI0iY5xmDOrr2
	 tZlyYI7RRNHtA==
Date: Fri, 10 Apr 2026 13:11:00 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 0/4] arm64: Work around C1-Pro erratum 4193714
 (CVE-2026-0995)
Message-ID: <adjo1Kuwu7v5dhqB@willie-the-truck>
References: <20260407102848.2266988-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407102848.2266988-1-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_051106_238612_75434C95 
X-CRM114-Status: UNSURE (   8.46  )
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

On Tue, Apr 07, 2026 at 11:28:40AM +0100, Catalin Marinas wrote:
> That's version 5 of the C1-Pro workaround. Version 3 here:
> 
> https://lore.kernel.org/r/20260402101246.3870036-1-catalin.marinas@arm.com

I left a nit on the final patch but, regardless, this looks good to me
so:

Reviewed-by: Will Deacon <will@kernel.org>

Will

