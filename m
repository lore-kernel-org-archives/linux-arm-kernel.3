Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497A8606A973
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E3x2NltD;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lxzl54JO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eKDTH0MLAoeCDhgOJZ28iGDUuVKoiijcjuCI9gWAGe0=; b=E3x2NltD44+Mja
	IncJbEPMncylfmItWai60SbqdZx4hizSnGTBnfEK94RANKxLQJwRyexTfFKbu8n7tH+y7qqTb94hj
	OZFsHvl2fmkbfQnYcr1JLGN5fRwetODLACiAZXwGQQmgovoCuOEXZ+qnZmN0RoFH8+BloXmmBhpTC
	d5E519kAMlE3r2PblZwr/tE3CX5bBUoRbViBcW1Q2e8ULngahFaADSex4lhLGu4qN2CIipZYDgni8
	epmMzgcwf4/No5etg7dCdnIplND/Aoc1f/plGfqxE8J4P34u6NfdfMYEOmEe7cilGT2hNTr+7IZHL
	ktom52Kue28ZcEy8KKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIvk-0000000GiqG-3tif;
	Fri, 23 Oct 2026 17:19:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIvh-0000000Gipu-2XUI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:19:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BACA1C00;
	Fri, 23 Oct 2026 10:19:39 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 097FF3F7B4;
	Fri, 23 Oct 2026 10:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792775982; bh=22SUcq5bb2KGp5212Gb23QIKYxy3lJocLmhA7Vz4YU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lxzl54JOfCUeLDlgUrsc47Tw4QUN7hMZy2I8f+1qUnV0rI4NEzd1bRqWkWNCPdq1X
	 8nJHem1U6E3jLfjD8TiWIvSfu7KlDrJnJmv+ES6LhfQUb657RHHd9/DXa0SRMeXo97
	 M+nJx6UTYvMxz8RtVghryfbLDZhbIvLQamX8gTeY=
From: Catalin Marinas <catalin.marinas@arm.com>
To: james.morse@arm.com,
	ben.horgan@arm.com,
	Ping Li <leeonion.muyu@gmail.com>
Cc: Will Deacon <will@kernel.org>,
	andre.przywara@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Release the mon_sel lock on mpam_save_mbwu_state() errors
Date: Fri, 23 Oct 2026 18:19:31 +0100
Message-ID: <179277597074.484399.16115818154176601359.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
References: <20261020114807.3915705-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_101945_791095_B45726B4 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 19:48:07 +0800, Ping Li wrote:
> mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
> iteration, but the four error paths that return after failed
> MPAMF_MON_SEL register accesses do so without releasing it.
> 
> Take the lock with the conditional mon_sel_lock guard class instead,
> so all exit paths release it.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm_mpam: Release the mon_sel lock on mpam_save_mbwu_state() errors
      https://git.kernel.org/arm64/c/643b64025650

