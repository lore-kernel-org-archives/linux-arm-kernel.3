Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61379C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 10:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y6/I/pDZBuBTZecMf88avq46W1mPavdnDU1oxsJM2Q=; b=tFpgJK6WNIhEHTw27BEr6YgHR9
	Z36O3vnNIeeHbtQqUW8LtthQS/bJo7lxCocNcj8L5+49gpqkog+1f0d4XMZm2bPcs5PMoBWAkL9Kj
	JyEQ6/7gMmfrjoy78/x7a4oN2DH5pDNdhn3Fpbhbc8FbQWSn5oEjAcBAso1aSDqUOy/ouPRFAg8va
	ylOR6x97V+tLD7W4R2ZaTwdFRQDUqg0FKYiNhPembhGe2Aj/OzUUFjBA9QkAevG0lPhicZqKi3N7y
	USuynAVHl5i49ivnGjZSDZSrp8VaTdHv1GQr+lo4aCD5njvlaOvi1e3WxQiC8ocEllOcT5rp2cDoo
	WozZa91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbdr-0000000F3wN-1zSu;
	Wed, 07 May 2025 10:04:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbWR-0000000F2Dp-0ypw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 09:57:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79FD12F;
	Wed,  7 May 2025 02:56:52 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17B8C3F5A1;
	Wed,  7 May 2025 02:56:59 -0700 (PDT)
Date: Wed, 7 May 2025 10:56:54 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	daniel.kiss@arm.com, david.spickett@arm.com, luis.machado@arm.com,
	maz@kernel.org, richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	will@kernel.org, yury.khrustalev@arm.com
Subject: Re: [PATCH 00/20] arm64: FPSIMD/SVE/SME fixes + re-eanble SME
Message-ID: <aBstn-9GClsAmlXC@J2N7QTR9R3>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <aBq7-_VhS8DXFgYL@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBq7-_VhS8DXFgYL@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_025703_312378_40554C20 
X-CRM114-Status: GOOD (  18.22  )
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

On Wed, May 07, 2025 at 10:48:43AM +0900, Mark Brown wrote:
> On Tue, May 06, 2025 at 04:25:03PM +0100, Mark Rutland wrote:
> > Hi all,
> > 
> > These patches fix a number of problems in the FPSIMD/SVE/SME code, and
> > finally re-enable SME support.
> 
> I've given everything a first pass and aside from previously noted
> changelog nit on patch 17 which don't affect the resulting change this
> all looks good.

Thanks.

Since you haven't commented on patch 17 here, and this is the first
version of that patch, I assume that by "previously noted" you're
referring to the ptrace ABI discussion we had when I posted the
preparatory fixes, i.e.

  https://lore.kernel.org/linux-arm-kernel/20250404174435.3288106-1-mark.rutland@arm.com/
  https://lore.kernel.org/linux-arm-kernel/45cb5ce9-39af-4c42-b68d-fa506b67bc55@sirena.org.uk/
  https://lore.kernel.org/linux-arm-kernel/Z_VS5wvn0C7tdjbo@J2N7QTR9R3.cambridge.arm.com/
  https://lore.kernel.org/linux-arm-kernel/879811da-d0f0-4b0b-bca4-df68ff9bf394@sirena.org.uk/#t

If you have a specific objection, I can consider massaging the wording,
but as it stands I don't see any problem with the commit message on
patch 17. There clearly was an incorrect assumption during development,
as indicated by the code, the comments, and the documentation. Providing
that context makes review *much* easier.

> I'm on holiday for a week and a bit more so probably
> won't have time to review properly, other than a couple of the smaller
> patches.

No problem. If it's possible to throw any automated testing at this,
that'd be much appreciated.

Mark.

