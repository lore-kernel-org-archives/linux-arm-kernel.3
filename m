Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E63C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNhBt6L8z3MZ3xikqeYfdSSylwYxOr2zoiLPjMnq7HM=; b=As1T/EAV2duuuRW4ZxZZYww16x
	FZY+DPFQGD2RybhFyTpVYVxGlx+6zQH7iv8W1E7sCHSWHpr6x+W2/lqyb6sUfo4Bis4gMBuoIUhzx
	2dwpAbR0aX6izEtjpkc6hLjtA/1AazgZu6MDzOLkcU3oeFcc0Ln4riWMsiUhJPwlHpBQdy5ZPRLhf
	S9KfCQN/wYx9baCpBIPULVgBrGA6Lnl+y1BeXwv1zzgg6Wle5V5Z5uScyoGmyqShqjrJP/GCOWln7
	ssbWkwLR3rfANjJDiGocK10NjkEWkYohN1zpVJBDwxyskKjpqIKe7g9NSu0LVxyn0G1JW8UU4fzXa
	UyNKS2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lvL-0000000BW8v-2Atw;
	Thu, 24 Sep 2026 16:03:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lvJ-0000000BW8K-1M3L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:03:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E36A11E4D;
	Thu, 24 Sep 2026 09:03:43 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45F7A3F86C;
	Thu, 24 Sep 2026 09:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265827; bh=1MIHQqUrz6J+9YzsEjJ6TwrjRv0LLv73pcMCneaPxHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P1firPTkB2oQV6sARzno1Z8WJ8QJjqB1bOVUr89GzricFQpMMOT+UQjQ5XzUUpk7c
	 POUnawhGwwYmSZD+ljS2pg/Ca+150Bfelb3Py14RZ3iVXqXKscxXkUp1TKQNZyH/C1
	 4GOif+fBd7hJLSCcCBcsaK1IEX9NeoFXJUVp8DHg=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>
Cc: Andreas Grapentin <gra@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: Use proper include variant
Date: Thu, 24 Sep 2026 17:03:37 +0100
Message-ID: <179026581764.3570880.1246463318810507401.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>
References: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090349_410638_6307E2ED 
X-CRM114-Status: UNSURE (   7.58  )
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

On Thu, 24 Sep 2026 12:57:18 +0200, Steffen Eiden wrote:
> Use <> for including the sysreg header as it is not discoverable from
> the current directory.

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Use proper include variant
      https://git.kernel.org/arm64/c/b64f41a7ace1

