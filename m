Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A617BCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADxiCui4GJhGYB1qPWloq2mNVq4UuzCPy0T6zEc2i00=; b=xr7B+5msg4yvyfW1hEzXl5aFa4
	K8EniFuTXCFFL2QtyQYJ7D47IiYW4kUCNM9XL+rFocqPjI4fwq4jrAlju5Y90nvhBqdTTOq+Ao4Dn
	6FwAmhHgqXX16j6jyf+hahwv/JEq2dzNH66/aewmBAaLirn8+L5qm414A3cTw1aAzHWUML2WN15N1
	yKmAMjI4X9Ma0rOREA8HKssR7+zU2KDh212K5xZa+XH3qtGsElFo8yhAmMldsHLfr36v3t2k3lInz
	cLZrYGABdnhavKOJohg2lr+65HbkEbDKnxlrGbr9GM55OLrx0FRkw93q21Pigm8PTWemHZO50ZsV0
	DsVKMsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv0c-00000002bT4-2RGS;
	Tue, 26 May 2026 16:52:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv0Z-00000002bS9-1GE1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:52:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B080E16F2;
	Tue, 26 May 2026 09:51:52 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3529A3F7B4;
	Tue, 26 May 2026 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779814317; bh=PNfzOd0XnNPmZGjcu5LANYH6PkI7wBG9bSQBrmzrp/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WpPBVuVLmVYNLUGiahOLNy0vipR0lpSeI48VX4CZPoXGJgdn4L1DtSWBepINF2IdN
	 6fqmk8Ce2nCHupWifzTBpE7xBPeilTkGkkreVh5PLpvFGeYsx3IWoxUCgMtOaro86u
	 djuXNYZHbiICB7bVxuiOLfzbI/Radtl9uUjGLHns=
Date: Tue, 26 May 2026 17:51:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 10/18] arm64: sysreg: Add FPCR and FPSR
Message-ID: <ahXPqSPB5CEUbRdz@J2N7QTR9R3>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-11-mark.rutland@arm.com>
 <458fcb4c-46a9-49db-a179-9081d7d50dbf@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <458fcb4c-46a9-49db-a179-9081d7d50dbf@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_095159_383104_CA366691 
X-CRM114-Status: UNSURE (   8.89  )
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

On Tue, May 26, 2026 at 04:55:44PM +0100, Mark Brown wrote:
> On Thu, May 21, 2026 at 02:25:48PM +0100, Mark Rutland wrote:
> > Add sysreg definitions for FPCR and FPSR.
> 
> > +Sysreg	FPCR	3	3	4	4	0
> 
> This looks good.
> 
> > +Sysreg	FPSR	3	3	4	4	1
> > +Res0	63:32
> > +Field	31	N
> > +Field	30	Q
> 
> DDI0487 M.b and DDI0601 2026-03 both call this field Z.

Sorry about that; fixed locally now, and I've double-checked the rest.

Mark.

