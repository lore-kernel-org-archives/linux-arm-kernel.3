Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E060850B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uq1auE61;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7HD2XKi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hKXq0WGbyVJ4/tDG4Vk1teTQwOi0V+tMcOilLKOGtJQ=; b=uq1auE611ElfIh
	Ggewvg00Vha7ECwcqkpEbJnVz1jmn2bVwD1vk6pavcz72iiamLPBYQ8oLCb6SNAU8I/mN2+knSXvJ
	VjICEEv6D7T+zsGjamgTEoiFuR8IwWlEOpa6+/0jGghtHXpxddfz3Ensg6KOu9fpGVoet2OIsTp35
	udwOCGEp/Y/rAKdRrYWlhUtlk63F/ukThc3IAGGYufHqJTO/zaWxsj8d0B495wYGHL/i8dlTK/JFA
	oqEBvrEiuB8cC4JMvBJNbhVZ7TCn70ik+dKUO+uMejxWPt7HNNYj//GUZiu8vNfkRXOsZnm39Icyd
	+7RnTSdDGQTcN/Ic0lqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDY-00000002T0e-1Rck;
	Tue, 03 Nov 2026 13:06:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDU-00000002SwV-3Sek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A0BF43F75;
	Tue,  3 Nov 2026 13:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE561F00A1C;
	Tue,  3 Nov 2026 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711180;
	bh=hKXq0WGbyVJ4/tDG4Vk1teTQwOi0V+tMcOilLKOGtJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m7HD2XKidnRAsWZ6QsB9Qe5Pzdj2ZaJ6LQDj0sXIOyufw+tRPxGkLo575tesGXNbn
	 EtTHZpd9E9zJvxm5HsKRJi18hN/taHyBHFete6Qv5a5vSPSknE1mM3ND5aelaYLk8k
	 g6XCQTwmBM0Bji2+PmZd5cpHZ8eLZL2TtPt5TN4ctnG4Uee2e8rGws4sqmF93vVtT1
	 H11kF8HDe3f/5ujuTxJK6tjIwW9+tc76/HWTdiysakmwUOyYqtbyP/yirGItlRQKan
	 IM5NFYapPKOrUc9uOKSkiYSp/xA1EadjEt55JxsuginwdP88tbPv865YsIbKryaD04
	 w3DGguffkvEAw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDS-0000000ATWs-3C5P;
	Tue, 03 Nov 2026 13:06:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Ensure TLBs and I-cache are private to each vCPU in pKVM
Date: Tue,  3 Nov 2026 13:05:35 +0000
Message-ID: <179371111277.2844725.10385477365574044594.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020074311.1873316-1-fuad.tabba@linux.dev>
References: <20261020074311.1873316-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, vdonnefort@google.com, qperret@google.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, 20 Oct 2026 08:43:11 +0100, Fuad Tabba wrote:
> All vCPUs of a VM share its VMID, so KVM flushes a physical CPU's TLBs
> and I-cache for the VM whenever a different vCPU of that VM is loaded
> there. pKVM guests, protected or not, run on the hypervisor's stage-2
> and VMID, and the host doesn't flush for them. Nothing at EL2 flushes
> instead, so a vCPU can hit TLB and I-cache entries that another vCPU of
> the same VM left on that CPU.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Ensure TLBs and I-cache are private to each vCPU in pKVM
      commit: cadcd8d70f331044d12aa6a9644f8253cd2bf29a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



