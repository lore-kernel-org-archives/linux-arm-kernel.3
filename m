Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3730C88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOLL1C5eie9+kGSnrAOXLT9ogy6qmnrvuuUUQyZnKQA=; b=4Wy7BOTTZ6L2nbhCKg6n3m1uNs
	h638t1P25/Cqqmae/IOeERLW+8/oWgUeMosMwep6e4IvAYOqirbOQl1UNeztWbvrghrN6bINwLZ1Q
	slcvNKe/ZHJ2/+dtqpTI5fGqdZ3xjLhTKWxk1pmNlMQifz2T5awv/9UAn37cf+ZEuGQ8njf8c0Vj0
	n/vIyMvRuqKCkuurjem8Lw3JJFOJnMwDFSEOVUD/3z7xGHEzI5a0vz/25372flrDU/hEuPyNs2FPG
	oQrnQHtbnHBcFd/x+LKCgy7KDBx7O+rDROaXHdKPYSKrzFlWSwj9OpOwUqrXwWUJvvSLY759ESbeU
	dc39JvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65QM-00000003TAk-1AXt;
	Mon, 14 Sep 2026 12:04:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Pt-00000003SvK-0h1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:04:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF4E443941;
	Mon, 14 Sep 2026 12:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB261F00893;
	Mon, 14 Sep 2026 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387448;
	bh=oOLL1C5eie9+kGSnrAOXLT9ogy6qmnrvuuUUQyZnKQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YUiAZs4ZCmd3/F3nbnio15LpDvz2LTIPuBEeUhcKB3CO+db0M/lD/JNFUQAhppwzb
	 ZxqLMD6s4KoN2nOiLnBxHAA4kqLSJJIvUSdl980qtJIylOtS0pPPCvzMoVAFqUKWZb
	 s1Uptynq53GXx+MLNZRjKxhUmIwFEpA3ltvauIKC7++8k4IcBC4LCq4reo5HnSWy8y
	 2jDeIQ6wyPjS7cIoqO2oAAIOqdAog7jkx3mdeSwsfrbPdO4i8T5HUaiQcL8GKrJm2l
	 FjQpXImE+2RhiS3EpiY00ZkB7uOzzdJAkzqeJnMTDAjr+ot+mUxioEXMXm6bn18XnO
	 cpNzCXynZjt0g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x65Pq-00000008bDc-3qgi;
	Mon, 14 Sep 2026 12:04:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: fix typos in comments
Date: Mon, 14 Sep 2026 13:04:06 +0100
Message-ID: <178938739476.3215146.1948187248567448062.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907044434.4682-1-hemanth.selam@gmail.com>
References: <20260907044434.4682-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, seanjc@google.com, shuah@kernel.org, hemanth.selam@gmail.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Mon, 07 Sep 2026 10:14:31 +0530, Hemanth Selam wrote:
> This is v2 of the spelling fixes for this tree.
> 
> Changes since v1:
> The pauth.c change is corrected: the doubled 'is' is a misspelt 'it is',
> so v1 deleted the wrong word.  Spotted by Fuad Tabba.
> 
> Only comments change; no code is touched.
> 
> [...]

Applied to next, thanks!

[1/3] arm64: kvm: fix typo "synchonized" in comment
      commit: e9fac0fc75abadefbbfbcf514f5d3b6e3d8c1196
[2/3] selftests: kvm: fix typos in comments
      commit: acf96ecc5fb6a802928a0b71bcded2addc3e58d4
[3/3] arm64: kvm: fix typo in pauth.c comment
      commit: dacfc40976411dfa97efbe1cc21650049a391eb7

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



