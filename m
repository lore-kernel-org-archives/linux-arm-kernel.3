Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02807CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iU8cYU3B3yAKoLkyUXfgY8bgL90q9YRQAluD1Tl1gR4=; b=Kp7dX08OEw4AHEQaQJvD6thTp2
	Rrj1nI65cKbuCFBA4oxs4AsNMDNau8JUvXc0oK4IVc2qAKSK2sZqyd82vaoaRTVLYDSCrpBd100im
	83o6+902LUkU97NrPe1eYba86iUX9q5WNBG/w89yyuxb6uegUhYMfaO+jFr/CEl45ceSk0/vKYqXy
	tc1HOgG7+dJq0DbDFj813GfRgCw52JPK5j9OeyoeUkHLIM7m4ZaQifQq6Zw9QoLpfSF8hg0GrTzHS
	mG1EwlrdSI2ZGa/NWV7RTXT6tvhZD1GEAHv+MYIqQ/k8UXLsi4LZqpR1OFWDqaFqXxafNZqLAhMxv
	JI3JTknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXW2-00000002LZS-2Awl;
	Fri, 05 Sep 2025 14:34:14 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSwn-00000000oEk-2clN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:41:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757065291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iU8cYU3B3yAKoLkyUXfgY8bgL90q9YRQAluD1Tl1gR4=;
	b=qQKQUc4rbHC+yqm4Kw1VeM0/JPrfqHRYxOrwTqeA5pOc0roLCustMIbsbrG7juGN2ZgXRP
	72KpUaYOUhlowN4HRoX/+CdnjXthMu7ipFrjbsTPjf/ZMszRxqI7gksxdtcC+QMi40jmNK
	xYZKYe7wSpvtcR/MXTIzXtdtnjZhogI=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	Geonha Lee <w1nsom3gna@korea.ac.kr>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: nested: fix VNCR TLB ASID match logic for non-Global entries
Date: Fri,  5 Sep 2025 02:41:10 -0700
Message-Id: <175706523473.1669883.17269564627952159753.b4-ty@linux.dev>
In-Reply-To: <20250903150421.90752-1-w1nsom3gna@korea.ac.kr>
References: <20250903150421.90752-1-w1nsom3gna@korea.ac.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_024133_809184_68306312 
X-CRM114-Status: UNSURE (   8.56  )
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

On Thu, 04 Sep 2025 00:04:21 +0900, Geonha Lee wrote:
> kvm_vncr_tlb_lookup() is supposed to return true when the cached VNCR
> TLB entry is valid for the current context. For non-Global entries, that
> means the entry’s ASID must match the current ASID.
> 
> The current code returns true when the ASIDs do *not* match, which
> inverts the logic. This is a potential vulnerability:
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nested: fix VNCR TLB ASID match logic for non-Global entries
      https://git.kernel.org/kvmarm/kvmarm/c/06f66db9bda4

--
Best,
Oliver

