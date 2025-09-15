Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2D0CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOTk5TlD+m693q5yMG+lDTINCg68hJZOfTZkXMpEc74=; b=Nn/K0BNRCgLI8v8UA7KPIa8IRA
	A7Ar1NFiAceLJgJd+QOC5z+qGukEfBnRtPdfzQHFeAuYYTCP/tu4T+97uQdRnOlbSh4MMXQ5Rv34I
	B7TMkrCYDFCWYOZ57ZTV8tnPkU8eroYJKlHcOmbp71Tn97SB5i67Bp8tQDWd1FOkfsEPGzV6rSqkG
	+Dlde3yVii1/QdsFW742qY63AwDyWkC/LDmbm0u9R5ydpRgit4Tve2E5H66wbap/cOysSyXfsNhg/
	O+Es9r96+7cdjemtKzrPf16M9sOGDHnXCVER6LcW5+jPpNvWNlJqvex/8FTl0hm8A5CQ5ZhMB1iKm
	88VjDadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5rK-00000003Wow-1R3z;
	Mon, 15 Sep 2025 09:50:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5rI-00000003Wo4-3fkT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EDC460195;
	Mon, 15 Sep 2025 09:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC335C4CEF5;
	Mon, 15 Sep 2025 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757929852;
	bh=Oi62lywdDLKkKygUTfWGFHwFeq/dkJsnfIBR3CLOMG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbyR1yVcylRKlSrNl0nReGo3ggSA0LVb6GVj5wea81t9vI1pQU0JN+HFGrbtLCVEi
	 X3dwfItwNIsY0hoKMHcG1KrYrPoIvxUBgrNX0BZVVOzp6y5SkVsxXf8MFonq9bBY0V
	 u35v9N1g3MJeGIKS2lHkAoC2fqc3fkMdCABYC82TVidTXgFXMY0xfEFG+OPOAtIJH6
	 DHiG+HgGb3ALsmc7BXu8QbjWe2TPoaDLt/1VCbW/IVuZUneQjte8t9IAEaUFxE7zMi
	 LMqiFujiupsci11e6qGAv62sntNc26l2GIHN7B0ICETp7rVVqtmHDmKc/FV5tYavet
	 P0oSUPVQjHbBQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy5rG-00000006JVk-04gs;
	Mon, 15 Sep 2025 09:50:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: oliver.upton@linux.dev,
	will@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	vdonnefort@google.com,
	qperret@google.com,
	sebastianene@google.com,
	keirf@google.com,
	smostafa@google.com
Subject: Re: [PATCH v4 0/9] KVM: arm64: Reserve pKVM VM handle during initial VM setup
Date: Mon, 15 Sep 2025 10:50:46 +0100
Message-Id: <175792983912.521298.3255691890570537685.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
References: <20250909072437.4110547-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, qperret@google.com, sebastianene@google.com, keirf@google.com, smostafa@google.com
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

On Tue, 09 Sep 2025 08:24:27 +0100, Fuad Tabba wrote:
> Changes since v3 [1]:
> - NOTE: only the last patch (9/9) has changed.
> - Fix bug reported by Mark [2]. The existing call to pkvm_init_host_vm()
>   wasn't gated by protected mode being enabled, unlike the call to
>   pkvm_destroy_hyp_vm(). This imbalance caused failures in non-protected
>   mode, especially when creating and destroying multiple VMs. Tested
>   with kvm demand_paging_test using nvhe, vhe, and protected.
> - Rebase on Linux 6.17-rc5
> 
> [...]

Applied to next, thanks!

[1/9] KVM: arm64: Add build-time check for duplicate DECLARE_REG use
      commit: f9ac33e45d57bc4aa365363ffb650c830e5bb325
[2/9] KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
      commit: 58dfb66b1e4cfb998db9e71437a2c0d9b83a93c0
[3/9] KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
      commit: 604a5032b454bde03200d755f6ecc3f724511c6a
[4/9] KVM: arm64: Clarify comments to distinguish pKVM mode from protected VMs
      commit: 070362648f5f546018747a9a1857c1597594934e
[5/9] KVM: arm64: Decouple hyp VM creation state from its handle
      commit: 3c45b67625357ac680ee2508493b697cdcd78128
[6/9] KVM: arm64: Separate allocation and insertion of pKVM VM table entries
      commit: 1abc1ad52989fcc45a0de68bc49656d9fd0c2d74
[7/9] KVM: arm64: Consolidate pKVM hypervisor VM initialization logic
      commit: 814fd6beacf3c105ab8c8796be07d740952899fe
[8/9] KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and initialization
      commit: 256b4668cd890b741c54f83dbbef76ba847c23be
[9/9] KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()
      commit: 07aeb70707b1d52968f4959a5dba321ea4219c8a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



