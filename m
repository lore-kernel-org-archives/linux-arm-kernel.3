Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DACC60A3801
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KhJZQPDD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqGZjti3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7jqk4Wusj+dbOg4A9kCrSGLO68/43vHoF4FXQEeCH0I=; b=KhJZQPDDdIr+tt
	E2wwy7GWPdXKvT9tY/gLZf2oP8Ic7iB9hCGC/fHEex+pPzcjVU4GD3MoodB2U3No8QWeTRgA5+GG0
	ur2TYcz/tQpfhlX3jyTSWyug7Ysi74RmLYgvaGnvkuFlNt0fos32jvUq+kpMQpl0PTDdBV+Or1h7H
	rlIiB41lIrxGVwKWL5/u9rArTobSwFBSMmN7uDhlqEeL1SK0RrtTDArPEZhNyqujUgmnHCTEK0Da2
	a91H3MRgFahV2Im/mmPmXWlS2MtLV7FGyO3WT06p9/i0yDr5HHdTUCcXnvP99krXeQM2lo3A9H0pz
	K1JE/Bkywwhlx0vahH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOf-00000002Raz-01Nu;
	Mon, 26 Oct 2026 12:01:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJOC-00000002RIF-1Kx5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:01:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D3DD44006;
	Mon, 26 Oct 2026 12:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEE41F01829;
	Mon, 26 Oct 2026 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016080;
	bh=7jqk4Wusj+dbOg4A9kCrSGLO68/43vHoF4FXQEeCH0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mqGZjti3x9eLYOQqnwLx/WRv/5LOs1rrJEUDXgx7hgVZALUeDD7mDdINyRXzVIbuQ
	 L7SUTZbMX3eIbEx4jyur3RTA88/7qUIA6InFOJde3klYWVuO3H87+719wLth4Mam7d
	 xF4pLNndTo43/byerXjx2eNuyxPh8CRZnACt3aHX0Oh20FX9Jn7ZzFUoJfTuvaGE89
	 fbqDZYA110QxtNNdvYVXKbOAaHBCSenMna1ZM6DMuMiz/4pQ91sReKbRuTKp10d6si
	 /aR3Gukxe0R1K2oVFjKHBMi1rfdFavUoc7SJy96nNhIKnMl7IW1cwKYIG/tP79B3iI
	 VOcvUC3/smlWg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLJOA-00000007Fr6-1mpF;
	Mon, 26 Oct 2026 12:01:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: selftests: Skip unwritable ID fields in the failed-run test
Date: Mon, 26 Oct 2026 12:01:08 +0000
Message-ID: <179301587204.2527370.7441548835620478409.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026012128.2270251-1-sashal@kernel.org>
References: <20261026012128.2270251-1-sashal@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, sashal@kernel.org, fuad.tabba@linux.dev, broonie@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, pbonzini@redhat.com, seanjc@google.com, shuah@kernel.org, ljs@kernel.org, itaru.kitayama@fujitsu.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 25 Oct 2026 21:21:28 -0400, Sasha Levin wrote:
> test_idreg_frozen_after_failed_run() checks that changing a feature ID
> register after a failed first KVM_RUN is rejected with -EBUSY, and does
> so for every field of every register in test_regs.
> 
> On a host without AArch32 support at EL0, KVM treats the AArch32 ID
> registers as RAZ/WI: aa32_id_visibility() returns REG_RAZ | REG_USER_WI,
> and kvm_sys_reg_set_user() ignores the write and returns 0 before
> set_id_reg() checks whether the ID registers are final. The test then
> fails on the first such register:
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: selftests: Skip unwritable ID fields in the failed-run test
      commit: a4be8d69698b11d976c122be2d32bb72b8a52809

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



