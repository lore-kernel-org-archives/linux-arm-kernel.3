Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90387C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n/v8MuoAO1xopsxIu3jychGPHYTOUnSCipMok8NItNM=; b=OMz4ry9AKNF0Ck2LgA5kgRJBS0
	vd1vpMx/5gkK9+jOVEa1vlHbh7wprNQXz0EnuQHiHXlmPmW6ipLOZyEAqhFqkfXTYWCSwbL728gs+
	Hhl8XAiQSsLAKEb3YmrT/ijP4r4y+Oo7sIfhXV4dggaegfV89MSdxu/fZjmfHhGVkjAXGsKEm7nSN
	1XRtwYM4i7XW6mYrG+cBFEwTBg2fYU4rtdzwazpxKr9TDLwx1LLRqwFM7vdbjM+66TT+UeALy7YqN
	06d9mB57ej7vbhW7dzb4ElCK6h90/NfG4anF+XeZDesf11DvdFhBjHn9McPjzi7GAMfgwVTzhRPHm
	kWoCFZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgCB-0000000CwUf-3YMd;
	Wed, 22 Jul 2026 23:17:47 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgC8-0000000CwU7-1pKr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1784762234;
	bh=n/v8MuoAO1xopsxIu3jychGPHYTOUnSCipMok8NItNM=;
	h=Date:From:To:Subject:From;
	b=PSJu+yKiqXJcVQTcvtpHfEs9AJ8DeeQOeqxSPUUNpFkyZPaIrR2y2JIvL92r1SusF
	 YkyMDwEt+SNqDTLyG23E2hwp1BdGE8epcNpXCweno3PtxjMiCvj3jUsw1VDxThJ0ru
	 /Wc9atMAjFzoECZTKiNTT8bf/r0iTxXueeaNpqdc=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4h59Bf4f8mz11Mk;
	Wed, 22 Jul 2026 23:17:14 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4h59Bf1s7Rz11Jq;
	Wed, 22 Jul 2026 23:17:14 +0000 (UTC)
Date: Thu, 23 Jul 2026 00:17:15 +0100
From: Bradley Morgan <include@grrlz.net>
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC]  [Question] memset.S old code stuff
Message-ID: <F8EBC118-3F46-4A47-AD0A-A68E8688938F@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_161744_926691_C7CA9B45 
X-CRM114-Status: UNSURE (   5.16  )
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

Hey folks, sorry for the crazy asm emails, I see that in memset.S in
arch/arm64/lib/memset.S, the code is incredibly old code, like 2013 old
(heh).


I was wondering if I could say, adapt it from optimized-routines (same
treatment as memcpy.S essentially.
Thanks!

