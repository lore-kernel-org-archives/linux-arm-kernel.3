Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD45E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKiJpEEU7KyAkBQES5lzawUnpv/iWF4Jxd3ufBFceUY=; b=KXgpmrrS5GNryQl9txxKL/CrVq
	y4hIi5/hVc2F6Gkg4wEhfbW+Xmex7rrL8VPaa50iuYfGkNFqRysjG5wEVdQBjwT2mld3BPXTjRhFu
	lGkKucx9TFc749NQUBnMDSPDR5QFCx5/7XHJe8guQW+OgRE/QWC0GHS26XB83fJxeXM344gqZxNst
	atFL56NcCaASaWsN7fFE/98mIiIlrxHcmJJFgJGL+Qh/0oyNG+RQT4pVa7ZkS290GJCzpMLkvSECY
	u1O6ZDIRe4j0OBfjuQ3XNIbYS/0DF1NByACosQptM4hwD9/IIgKW3YA3WgE4sTFYPlhVhJO4ZKzR1
	Wp8HSn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD5W-00000005lzP-2XwO;
	Tue, 07 Jan 2025 17:09:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCfI-00000005gRX-09iO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:42:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 597925C011D;
	Tue,  7 Jan 2025 16:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F22AC4CED6;
	Tue,  7 Jan 2025 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736268167;
	bh=7m9srgpMEiXCY3EwU421KJCD1mkHAQtbO2dhdmFCRw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWF6m7NPfxEG40b4664zvEnm1bLBbYX24kosBrfehIi+uCYikhhmwIgk8aX6vTd3M
	 WX73/yYf7UoE0cTeCqfXrk4UF9hU0ugpJGt/sStNIL4JTMessrl/tX5ZXJMkQntu2s
	 dP7uYqFoQDO1Is5Q9HmqxckBWzw84D67zhOsV1gnEh7EHT/clAiHIH9jE2IhW5wdYZ
	 czkQPMsMiZ1jtXLgnhrabVozQQE/fGQ18EJxYvdPTxa817TFIT+y/bO+QKs//XuRRa
	 IL8Pzfqr1VbRW7vrYKgqIQ/jM4tsj2FH3aL+3iofcfaDbEpFg+kYGWWS3LnDEEYI/l
	 +FQTBg+LuFrNA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 0/9] arm64: Support 2024 dpISA extensions
Date: Tue,  7 Jan 2025 16:42:38 +0000
Message-Id: <173626298431.2741856.11908646584681839796.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_084248_116813_6419B34E 
X-CRM114-Status: UNSURE (   8.95  )
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

On Wed, 11 Dec 2024 01:02:45 +0000, Mark Brown wrote:
> The 2024 architecture release includes a number of data processing
> extensions, mostly SVE and SME additions with a few others.  These are
> all very straightforward extensions which add instructions but no
> architectural state so only need hwcaps and exposing of the ID registers
> to KVM guests and userspace.
> 
> 
> [...]

For the sysreg definitions that Marc's fantastic script is happy with,
applied to arm64 (for-next/cpufeature), thanks!

[1/9] arm64/sysreg: Update ID_AA64PFR2_EL1 to DDI0601 2024-09
      https://git.kernel.org/arm64/c/1ad9a56442a0
[2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601 2024-09
      https://git.kernel.org/arm64/c/054339beae58
[3/9] arm64/sysreg: Update ID_AA64FPFR0_EL1 to DDI0601 2024-09
      https://git.kernel.org/arm64/c/12b5ff517a19
[4/9] arm64/sysreg: Update ID_AA64ZFR0_EL1 to DDI0601 2024-09
      https://git.kernel.org/arm64/c/9a43ee864349

[6/9] arm64/sysreg: Update ID_AA64ISAR2_EL1 to DDI0601 2024-09
      https://git.kernel.org/arm64/c/d66e21d59ed0

The KVM patch needs an Ack from the maintainers and the hwcap change
probably needs checking in light of [1].

Cheers,
-- 
Will

[1] https://lore.kernel.org/r/20250106174020.1793678-1-maz@kernel.org

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

