Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB37CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZG8O0FTKMGqPVn5P9rMKTqMAVjS5M0CRnVpJwaU138=; b=Ht/gysFHdrhSrVcDoEcK7W/wFM
	+teyNaODmesjXBNjnpZFB7ZQXiHK8LJT6gxniklFue7eDTc8DKO+MZ6hYP0tJPjxl/eC57G2vJGaQ
	fCHuBgmfD9udAGmNPX0T317ZLbUDllM0gy41g3kTpdhEY8E0hSuKsY60QjWZIkrXqFWweVYMyRCGa
	u3d3G0Wu1DzQYJia3iaQN8AeSh3x6HiALFSgRcomdTXtc+f8mXA9S3av90FGbDHfKrD8eDj7HmBBa
	6o0vdV+yxsZk8YSAYro+z7IrakBxf0/MhBKssmNPJGKN+KUblMZKmZeh9GXlouXnreri4ROZXHGSn
	kW7AcoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1Z1-00000006NKY-0Mik;
	Tue, 23 Jun 2026 13:53:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1Yz-00000006NJR-07uW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:53:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FCD460208;
	Tue, 23 Jun 2026 13:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98421F000E9;
	Tue, 23 Jun 2026 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782222796;
	bh=qZG8O0FTKMGqPVn5P9rMKTqMAVjS5M0CRnVpJwaU138=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hz4o+8P53m6+5g1JZ/3AuhJv/7iMNsCH85Zb4nEg1DjSbRjCU0fShKQUk4cBkcy6W
	 wd0HNKQCA+qW6koNGTgXcZORbcdJShW2eVUyZCD9FVUKiMU0T1VP2ko9ZGJw68zyKt
	 628nJfgWvilWdw2QOK9DOOuFVBUR0ez4PapBv3aFomirgVJeuczRlp3SmO+WSiW29k
	 zcMTFaECteLYPl3KfIeFxV2nF545OPIIHq8wGOineeggkXP8lx4O03+p61eRaw2yeY
	 pgm9HOW91sEHQ5qaZ5RvWlo8+RZooUXFjH6haJb42nV1QDfGcSOY+69GkniSoruJuP
	 Bqt9Cl7Voe5cA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wc1Yw-0000000FJ27-043g;
	Tue, 23 Jun 2026 13:53:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Bradley Morgan <include@grrlz.net>
Cc: Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: account pKVM reclaim against the VM mm
Date: Tue, 23 Jun 2026 14:53:11 +0100
Message-ID: <178222278590.523236.18181071715501850418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260621213155.6019-1-include@grrlz.net>
References: <20260621213155.6019-1-include@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, include@grrlz.net, tabba@google.com, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Sun, 21 Jun 2026 21:31:55 +0000, Bradley Morgan wrote:
> Protected guest faults charge long term pins to the VM's mm. Teardown
> can run later from file release, where current->mm may be unrelated.
> 
> Drop the charge from kvm->mm instead.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: account pKVM reclaim against the VM mm
      commit: d098bb75d14fde2f12155f1a95ec0168160867ce

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



