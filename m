Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93268CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeslHR1jlw1xruRqjXzRBACShWjDNA/E65l0zPzBNbI=; b=mphVZQjg8SwPTcEzEIS3htBl11
	XXOVmEgrADHMzJpFlIUYvf279BVSq5I/q8GFu1/XidEAiud02TC1sjtI7jnwAi/ZZWzoyJhV8AI5K
	qVXImRGtv4sdjmaj+bWqqmks5OSNb3v8c8SafQMo3nzW+32M4PLwIfG4wyKByXfKYcUNDT17MPj8C
	bLbmHJFTWtA9nWNFhUAt5co02EzmsuKMxY308d2RkJxIBfU0iQS636tZcR4yTrtU2XSYLuozU+uGy
	xxgtBooSOyZdXCU9DOFeKwbtayrxV56afz6tAdC8BEy5ynFOJnZLz2KO3Xohc/VFcd++ROX33UzPM
	dvRhPVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNtF-00000002KLD-2IOT;
	Tue, 19 May 2026 17:05:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNtC-00000002KKZ-1nlI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 17:05:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63FAA1C25;
	Tue, 19 May 2026 10:05:46 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC3AD3F632;
	Tue, 19 May 2026 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779210351; bh=PZE9+PzF190lLfRdR0cgcu4r05tWAtk2bBmdxyYvBpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S+n7JDAi1PMe566IuO1Lon+2lm0vB/R15/V46ZRjXGVaakF7EEDJ/vVpWN60pcMeG
	 gQilHaf1T62vwpTL7h+m6cG3PWTXRwxc4ehMhAtgcvxHWNA/IbsHWLNtMuH1XbirXZ
	 RajXL/bjWZCGh8gp8ANpH32/oL2Ni2yaJIYjkoyg=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: probes: Handle probes on hinted conditional branch instructions
Date: Tue, 19 May 2026 18:05:45 +0100
Message-ID: <177921034516.3320748.14765801039531573479.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515133729.112196-1-vladimir.murzin@arm.com>
References: <20260515133729.112196-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_100554_595499_928E7E54 
X-CRM114-Status: UNSURE (   8.08  )
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

On Fri, 15 May 2026 14:37:29 +0100, Vladimir Murzin wrote:
> BC.cond instructions introduced by FEAT_HBC cannot be executed
> out-of-line, like other branch instructions. However, they can be
> simulated in the same way as B.cond instructions.
> 
> Extend the B.cond decoder mask to match BC.cond instructions as well,
> and handle them using the existing B.cond simulation path.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: probes: Handle probes on hinted conditional branch instructions
      https://git.kernel.org/arm64/c/2ccd8ff980b5

