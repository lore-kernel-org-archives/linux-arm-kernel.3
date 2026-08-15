Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD21DC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 16:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NfHWK5eCLsKe3q8tXnB061j3rMYklOX1uFVNFZM4RcE=; b=UGmgA/MKFfvXtgrQRHEjSD4NV4
	AzrKBMPFLcqtzvba9mC2GHerwVW4gD4gXcIO3+bRVf9y373R9ej0lMaEtWHC8wg6bd4QoFL7Ej0e7
	gKmymh1cUbGnrvLq8NYxf09DkMDVph7pJWjcOaskbfN1zhQSLnYxNBZ8D07keyrM2bMZXQhQ4VjSo
	5r0rhyt0ggXA8FKyOOxRAekRutwtcVukE30+Buomb2vl99vmFmT7H33pY6EYqdkZ1VbF/y6RlPXfk
	bK18vkPwxRt3Js1wtiGlRm+ILBJtR4ufQ8naSS9+6yARN5Gh/w6MEGlUI08nFmjnqUeR7mRTOaT4Y
	fgDSK3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvHd9-00000003xOU-1iDd;
	Sat, 15 Aug 2026 16:53:11 +0000
Received: from devianza.investici.org ([198.167.222.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvHd6-00000003xNy-2bae
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 16:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1786812775;
	bh=NfHWK5eCLsKe3q8tXnB061j3rMYklOX1uFVNFZM4RcE=;
	h=Date:From:To:CC:Subject:In-Reply-To:From;
	b=K/jCKnt55RskZeEO+bZhkFbDxqNT+0hOLgNYXQSKz84G+VPEs5cb+kRqH+VjqVc02
	 CVJfqm3bQb9QslrUHmEbQv4PRbgmr2Io2/D2uInpDNpyZDq2LzStW/havzYNDh881a
	 OtaQkBzN0S4w1E2BHM1C4949abzYz+nmnlt8dsX8=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4hMlX74lSqz6vJL;
	Sat, 15 Aug 2026 16:52:55 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4hMlX71Fz6z4y6W;
	Sat, 15 Aug 2026 16:52:55 +0000 (UTC)
Date: Sat, 15 Aug 2026 17:52:56 +0100
From: Bradley Morgan <include@grrlz.net>
To: gpiccoli@igalia.com
CC: broonie@kernel.org, catalin.marinas@arm.com, gshan@redhat.com,
 kernel-dev@igalia.com, kernel@gpiccoli.net,
 linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 robin.murphy@arm.com, sonicadvance1@gmail.com, will@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_arm64/kernel=3A_Expose_the_run?=
 =?US-ASCII?Q?ning_CPU_of_a_native_task_in_TPIDRRO=5FEL0?=
In-Reply-To: <20260815152759.2046231-1-gpiccoli@igalia.com>
Message-ID: <404DF303-5478-4B5C-9DE1-3A7B3B3927A5@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_095308_821206_24EFB40E 
X-CRM114-Status: UNSURE (   4.71  )
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

Hi, we meet again, :)

Well, I looked at this assembly code until I was blind,heh, and I
couldnt particularly find anything bad about it, well, I know I'll
probably get these arm pros saying I'm dumb or something for not 
noticing a mistake, but I don't see any mistakes asm side.


For process.c, I really really like your comment, it's, straight
to the point, did your LLM write this, or did you write it?

For your patch;

Reviewed-by: Bradley Morgan <include@grrlz.net>


Note: I hope I don't get plonked, I couldnt find anything wrong, but who knows
Thanks!

