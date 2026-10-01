Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1665DCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDoJGusJjj9fWwjr1asctJ4ruRZGa3Y6b+riH2Zmh94=; b=nwyK6nKkGu/WKmA9I3S86BKsxX
	/MihABOxkdg3G64rtkTsgzKo9PRXJ7CzxwKpRxXunJODMYFzmrNqaHQssFD8JGzjaQA1CAwV7RQk+
	6dCHyktPiSf7ZBw+SSqdxFKxrufaHkncJ8Ntkzahp9KCRMimw1AXVuNkm35kklQtagVz0gKeb2mUF
	WHigQTrEL400DwYVb6YNQy7HBklgZNPwTu2koo+tC5hqsQaxStV//PuyTY12GyEy5gAAOtF7Jrlm/
	ijHh7j0gL+IDX1UyYWrSMUQRAEGJuYGeFSDBBIOkU9KJstY9FupPY5/DJcB2Q8v9EQTa1GYS+xJ2p
	D708ieOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEaw-00000008aYe-0QHO;
	Thu, 01 Oct 2026 11:04:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEav-00000008aYU-1f1S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:04:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 299F24019C;
	Thu,  1 Oct 2026 11:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F191F000FF;
	Thu,  1 Oct 2026 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790852697;
	bh=yDoJGusJjj9fWwjr1asctJ4ruRZGa3Y6b+riH2Zmh94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vd2ritWNwMl4w47uWROaY+6SWKRnNZIMVEnU/gxN8f+/MzbMikJBnGlkjNMgnwGB5
	 9AOaC+VY+jvCPHsb62HkbFUbznVc9uq30qgzOngP1WoVIxjBukLD9cv3V8iieB8Vbm
	 8AceZrqbklsqPcnOBL2ANcgt3wcHd2gdS9XmKFa2tVSWfZRuwt/uy93xXipSokiBNf
	 td7JjOuiCgojI9IUAjiRG1JZIFwVsFNudjZhBjkwWTMbgZ2Z196rPWft7pHM5i+p3v
	 JF/sqBcIUbL8M+W8Vhw34DNs+MwGBonM/r3bUQ0OjATWW/rl5mPOcvyDLg/rNiD9CL
	 ES7HKJRG1lDaQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xCEas-0000000Fjgd-3Ckb;
	Thu, 01 Oct 2026 11:04:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Steffen Eiden <seiden@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: (subset) [PATCH v9 00/24] KVM: s390: Introduce arm64 KVM
Date: Thu,  1 Oct 2026 12:04:51 +0100
Message-ID: <179085262878.3865846.5787241839391727949.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930173441.66762-1-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, seiden@linux.ibm.com, agordeev@linux.ibm.com, gra@linux.ibm.com, arnd@arndb.de, catalin.marinas@arm.com, borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, david@kernel.org, fritz@linux.ibm.com, ggala@linux.ibm.com, hari55@linux.ibm.com, hca@linux.ibm.com, brueckner@linux.ibm.com, iii@linux.ibm.com, frankja@linux.ibm.com, joey.gouly@arm.com, nrb@linux.ibm.com, oss@nina.schoetterlglausch.eu, oupton@kernel.org, pbonzini@redhat.com, seanjc@google.com, suzuki.poulose@arm.com, svens@linux.ibm.com, Ulrich.Weigand@de.ibm.com, gor@linux.ibm.com, will@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
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

On Wed, 30 Sep 2026 19:34:15 +0200, Steffen Eiden wrote:
> Introduce arm-on-s390. Enable KVM-accelerated ARM CPU virtualisation on s390.
> 
> The new KVM functionally depends on KVM/vfio: Use file-based reference
> counting for KVM [5] The series itself should apply w/o those.
> 
> For the original, now partially outdated, cover letter, have a look at versions
> one to three [1].
> 
> [...]

Applied to next, thanks!

[05/24] arm64: ptrace: Use constants for compat register numbers
        commit: 295d3df9b1e425099a4eb37954a02c4a08fdb496
[06/24] arm64: sysreg: Convert SPSR_ELx to automatic register generation
        commit: d3d78520068779779e1ed7aa0dd8a3ce63e1ca43
[07/24] KVM: arm64: Access elements of vcpu_gp_regs individually
        commit: 29d92585ab987bb80b1e78d811aaea2a8db86e62
[08/24] KVM: arm64: Use accessor functions for core regs
        commit: 89ed62818f10e38e64fea46d43ee6455a1beb647
[09/24] arm64: Prepare sharing arm64 headers with s390
        commit: df6a70516adec8b7f5fa49e1755d8ee33d980d9c
[10/24] arm64: Share arm64 headers with s390
        commit: c7e18ba462536e870b0ff4deca581babcac9135b
[11/24] KVM: arm64: Share arm64 code with s390
        commit: dcb776bfcccc9662001a75b99dbfbef55f46eb31

Note that there were a few conflicts. Please check that I resolved
them correctly.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



