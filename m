Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86EA606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fp0ArOfN;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1vxv0t8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tKorxSMbW3M4sLggkFqZvWEBwtgZOVvak8DiFauAu1A=; b=fp0ArOfN8UId70
	jisZHEENwR+z98HfYMxSTQ4mXirePoBcXbfqRE+pQdSmkiBCYiF4FDIw9mZp9jABw10PsHfmQ0djx
	QQfd2o5Jf6lBS1b0w5DIlRAbNZ8EbBV0eC89BLN9eAYA7GHUI/izP2ghZN5LUi0+/xAymYsDXq6Ya
	VwtrO9pxn5R2w7E6rNnJPXHCCsbzTyF5FRrSpz1UXaroOFqzsmPw+6swc+YtfkBRljytN90uu/WC5
	vhZlthHO4ujs+i/REFyiyB9ribpm+A328vecq9HXbsYpp4NWJ9WN0+gy3ltBRRI/7SobMkMbcn/z5
	ry5ZL47GhNRMhjLLXUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDY-00000002Szx-0EGb;
	Tue, 03 Nov 2026 13:06:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDU-00000002Svf-0maL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FC37406BE;
	Tue,  3 Nov 2026 13:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F173E1F00A16;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711180;
	bh=tKorxSMbW3M4sLggkFqZvWEBwtgZOVvak8DiFauAu1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n1vxv0t8pJ0QvtIlgvt2ukdoeT883QA4GXA2BhiAsiHpbfU9gf2YCWiELUjNzd55g
	 6Hh20a2TJQQPIGqdhO9J6w0tLXwgvd15wE+OMJB4qlWhp3nCFR2tcVtao2qgxs6wT9
	 NikpiWUyqA3pBp+Kfrm9qLyo/VKEYJ7pGrWkvjUVK1xq4oMfjfp73Ah5sW1DOeKyxJ
	 kCelGuYU8HTbVjGzQjw/6Wax6Zlz/nknGsdCdJvEfdREgcJlkEaUH5n/PnU6bascie
	 2w3yCfb6j3SBlgBg6iaiyZL0YbCOc9QdaapafqwAijVQtSZMlIIgnPlXt2hUUZCsGz
	 46+TLiUcCcOVA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDS-0000000ATWs-0vxI;
	Tue, 03 Nov 2026 13:06:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] KVM: arm64: Fix stale MTE tags reaching a guest
Date: Tue,  3 Nov 2026 13:05:33 +0000
Message-ID: <179371111264.2844725.2216259269329758038.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110700.493315-1-fuad.tabba@linux.dev>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, fuad.tabba@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, steven.price@arm.com, yang@os.amperecomputing.com, david@kernel.org, ljs@kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 21 Oct 2026 12:06:56 +0100, Fuad Tabba wrote:
> Changes since v1 [1]:
>   - Added patch 4, mte_clear_folio_tags(). (Lorenzo)
>   - Moved patch 3's sanitise_mte_tags() call into the
>     kvm_pgtable_stage2_map() branch. (Lorenzo)
>   - Patch 1 loops with folio_page() rather than reusing page, and its
>     comment now matches patch 2's. (Lorenzo)
>   - Collected Reviewed-by from Lorenzo on patches 1-3. (thanks!)
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: Clear the whole hugetlb folio when sanitising MTE tags
      commit: cbf47fe57a568f178ac55176d98a13caba1d8598
[2/4] KVM: arm64: Clear the whole hugetlb folio when storing MTE tags
      commit: 62b9e1f75a3c39cfc38b3950bbad017ac5f95bcc
[3/4] KVM: arm64: Sanitise MTE tags when a permission fault installs a mapping
      commit: 249e053eaacb2959794a5ee3d27737063f4e3dad
[4/4] arm64: mte: Add mte_clear_folio_tags()
      commit: da9f24dc43361b1cdcbba2fee7b90f4706819fa7

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



