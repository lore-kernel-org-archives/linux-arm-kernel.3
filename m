Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545DBCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yF5an8vPwKISsVSZz7CHZXrwqqq4VnMfISpZHg7iVk=; b=4RYbsIGe+k2QruIUdf/eWPwCwg
	6joED1sU93ohJAPEwaQUODtk/NLZf9R0oUR3Z9yxIHO5z3Jy5nTzBJU88G8Ld5VpRnLRK60bqbQZc
	37HalpmmyO01utd2yci3c8HQZgQ8MgbWlLhEbS8W/R2V0MSqOVTJTV8r4ZNZZCCjQRb/HsSNwOOlt
	GUpywvDygNxXT9jjIC5fdMAWEVDW0PYjO6QvYgYSSpWMqZiM1IoMYIE2HLTi9rb8g901n6ZHjjIpx
	A7L8IlPsxioRRwjJP0e+YrzbobxXPLUX9n8inEeXiW9x9p9rWUpQdYiXA3xpuhPf/KT7kv5n6Sge6
	MsBZpl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ain-0000000FfP5-00LK;
	Tue, 14 Oct 2025 08:49:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ail-0000000FfOs-3k28
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 08:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1CC762227;
	Tue, 14 Oct 2025 08:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF8DC4CEF9;
	Tue, 14 Oct 2025 08:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760431766;
	bh=C7JuaamqYjTY8yKNBk8DAaYNefNASMvcLoZIKSBAuJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PLqbpLL1+Oo1r/vYSggD+Gynz+O1HTnN3Ih9MriG3qxEBLKsfdJJ4YpwUiF4m7fzs
	 5ukz4smjDbUyHkGXfQGCg/mNL7AvE74QgnpsDidNa2YbM/ygwNuunF0OB2Je3tHEBn
	 O+WOimzFFYMKdcDYTC7YFX2ajKyn2Rswue4pcWxWgOvjaFPgk5PjaxL4W7nPck3hUs
	 TFbZoa4LKe8DLGtnrwntVo7EJByt1La91uB7pPTljp4zR5k1ehOoLNTcoy+eBzH5yI
	 fxB1o5SrAczaPGjIgISdKP+kdqp8Csr8ifmjh7KXWO1HEAf8Rddz27iIFp6gk5G5JN
	 K9MVoU9KZAVVQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8aii-0000000Dms5-1mLR;
	Tue, 14 Oct 2025 08:49:24 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jan Kotas <jank@cadence.com>
Subject: Re: [PATCH] arm64: Revamp HCR_EL2.E2H RES1 detection
Date: Tue, 14 Oct 2025 09:49:20 +0100
Message-ID: <176043175100.977560.12584294473093983228.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251009121239.29370-1-maz@kernel.org>
References: <20251009121239.29370-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, jank@cadence.com
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

On Thu, 09 Oct 2025 13:12:39 +0100, Marc Zyngier wrote:
> We currently have two ways to identify CPUs that only implement FEAT_VHE
> and not FEAT_E2H0:
> 
> - either they advertise it via ID_AA64MMFR4_EL1.E2H0,
> - or the HCR_EL2.E2H bit is RAO/WI
> 
> However, there is a third category of "cpus" that fall between these
> two cases: on CPUs that do not implement FEAT_FGT, it is IMPDEF whether
> an access to ID_AA64MMFR4_EL1 can trap to EL2 when the register value
> is zero.
> 
> [...]

Applied to fixes, thanks!

[1/1] arm64: Revamp HCR_EL2.E2H RES1 detection
      commit: ca88ecdce5f51874a7c151809bd2c936ee0d3805

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



