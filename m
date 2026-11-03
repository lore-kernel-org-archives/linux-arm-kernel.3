Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23560850B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kXiF7C4Y;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANpPfrIH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PnFjXjJFl+0s212g4Biiqwpc+pB9dQcS8Fb86q6L9HY=; b=kXiF7C4YO+k7f1
	uM530RlJBWv4BtaLS7a2MfKlS72dCwKbrC6dG7QsjlbGH1T/K6gbSMTUePAseDyAO8KSyFcnwq5ww
	gCvK3HWoD9O0qWJ+CyoW6uQ0RyhAkMkiPqMVjNkodoE4ABZtZ3b+IguzyL74YIbXjevLlcFLK4XfN
	QdmN2A+dWVO+5JHn62zEpEwKaaAvzLUfrAPwir43QWseD54mcjOtHnfwMWE8dQmG4LxBRK/WuTFqX
	RVnCBCqIRFGV3oW9mA3xl1y4KOkoUyTDQJF06LDIcvfqAQqrdf0TZboaj0/YyAhph06/OJG5f9Nmd
	ztuZh5SzAuEMCXVVBcUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDY-00000002T1Y-2uV0;
	Tue, 03 Nov 2026 13:06:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDV-00000002SwX-0QP5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 72CA7608F7;
	Tue,  3 Nov 2026 13:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4035D1F00A27;
	Tue,  3 Nov 2026 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711180;
	bh=PnFjXjJFl+0s212g4Biiqwpc+pB9dQcS8Fb86q6L9HY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ANpPfrIHCAge/uSyxNnFgZxKhSto2HW0O7QLNo0Qv/8kxySUPqBrBR+fOpXwENvy5
	 oTGBzxQ3jG44qtd+IA8z7Mu3/Sc8fHJR08dno0XjmCj1c4QgAaGzZ9J0v4SvYrDvnd
	 y7OJUQiSGidZjlzCW1zTgr38fIdSNbupFOPo4MCYQGHGKW69bu5HZrKPE0Xu9Wi/+a
	 hXV/u6beCI8TlPJ5ZyPzTo7MC/3Ss+0qS58DEURhZ/dmTxHAiXzkga/qSQRgS5+rat
	 gHFUfLq7NPEsOhLTFrf9xfbaKPl4/dr5qbMTbZQ/4lep5kVuQ2YVRPiexA2mAfgcrp
	 NpD7TDGrZkwwQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDS-0000000ATWs-2689;
	Tue, 03 Nov 2026 13:06:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] KVM: arm64: Support FEAT_LS64_ACCDATA in guests
Date: Tue,  3 Nov 2026 13:05:34 +0000
Message-ID: <179371111281.2844725.13648407938600355335.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025075138.2919734-1-fuad.tabba@linux.dev>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, mark.rutland@arm.com, yangyicong@hisilicon.com, wangzhou1@hisilicon.com, arnd@arndb.de, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 25 Oct 2026 07:51:33 +0000, Fuad Tabba wrote:
> Changes since v1 [1]:
>   - Support FEAT_LS64_ACCDATA in guests instead of capping
>     ID_AA64ISAR1_EL1.LS64 at LS64_V. A saved VM keeps its level, so
>     restore no longer has to accept older kernels' levels, and v1's
>     set_id_regs patch goes. (Marc)
>   - Add an arm64.nols64 option. (Marc)
>   - Retitled the series to match.
> 
> [...]

Applied to fixes, thanks!

[1/5] arm64: Add override for ID_AA64ISAR1_EL1.LS64
      commit: 699edee85fb9f4403b5bc939f3f84374f841b33b
[2/5] KVM: arm64: Add ACCDATA_EL1 to the sysreg array
      commit: 8b5bcf2e799c24906b813f4a63081e68721a026b
[3/5] KVM: arm64: Add context-switch of ACCDATA_EL1
      commit: c122ea1564b41326d8c09c64005d38ec2fa6dd8f
[4/5] KVM: arm64: Enable ST64BV0 for guests with FEAT_LS64_ACCDATA
      commit: e2412d6a90a4b39e3fc464eeab8637a7f4eccc10
[5/5] KVM: arm64: selftests: Add ACCDATA_EL1 to get-reg-list
      commit: b7bb9e9425dd7772cba9ac4392e982f541cccfac

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



