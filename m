Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A083D5C0EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIut2zG4nhrdTcm8pehqATPHQassgFcR1/GrlB+OqdQ=; b=rOiVQT11epZ4VcFF0Tx2hKQnY5
	b+uIL1jbwCx+fwT0omM9aPVRtAftszCn/52PVGNxyCUkhUMJGKPHH/0RPI4x0aUEjDHfwrzu22gY9
	1otJHglAgA0Bz4+r3OWqVWUqddRIRnzHQwYq9e4PiZPEY4qaf1ivAI6+cTnB89VdQ4L0o4PXwpIkJ
	nx1ZQGxNRtdsqTzZ9tVeWj/OFVnLSC9Ddm7fkE5XExPgLc6q92vX1UlejNJxbV/7kc1790eKbuNDs
	wwbFeeM6ee6VhdsXLSOjEXfQqAvflXZ/v9l0/MM9Lt/YrtwteklhIe2nMkZVj7k4bWHj6lGXpMB+S
	0mdAy7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9R7l-0000000B4Yk-1iNd;
	Fri, 08 Nov 2024 15:42:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QS5-0000000AwEx-0FBO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 967225C3B27;
	Fri,  8 Nov 2024 14:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E21C4CECD;
	Fri,  8 Nov 2024 14:59:06 +0000 (UTC)
Date: Fri, 8 Nov 2024 14:59:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] kselftest/arm64: Fix compilation of SME instructions
 in the arm64 fp tests
Message-ID: <Zy4nONl6Ia7B7nLq@arm.com>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <20241108134920.1233992-5-catalin.marinas@arm.com>
 <15526a78-b9ad-46d2-b451-013dd3b8356b@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15526a78-b9ad-46d2-b451-013dd3b8356b@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_065909_180103_80F9C141 
X-CRM114-Status: GOOD (  13.84  )
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

On Fri, Nov 08, 2024 at 02:53:29PM +0000, Mark Brown wrote:
> On Fri, Nov 08, 2024 at 01:49:20PM +0000, Catalin Marinas wrote:
> > SMSTOP/SMSTART require the SME arch extension for the assembler. Add
> > '.arch_extension sme' to za-test.S and zt-test.S.
> 
> I've got an alternative, more idiomatic fix for this running through my
> testing - SME is still relatively recent so we can't rely on people's
> toolchains having it and we should use a .inst instead.  The issue was
> that the toolchain I'm using locally appears to default to a full fat
> version of the architecture and happily assembled the SMSTART even
> though we don't have a .inst macro for it like we do with SMSTOP (which
> is why that didn't error).  We only have SMSTART SM and SMSTART ZA.

It makes sense. Please post yours and I'll drop this one.

-- 
Catalin

