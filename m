Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD51606EE9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f/BPZUk4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKzeSrpZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rGq3BFd/+B7P9vI1bpgAX9feA3OyMCXcQKhqEkCS1rM=; b=f/BPZUk4zK1ZwE
	tFXbYOm/wyDupJVu5iJX3T+R25zsQGgpIXQausLumNINhawoL6VxjKbUeNz+Ho4+mU6kSUHp4yBpF
	4UiZ0UtxeOuFv2Q/boZRqlU8N7OOHd02khJo6qwutRiSOQ20nyskPGgLnq4q/ygrTHFWwoOhvWBGl
	j+sWCxMYJ9hCZKhvTmPPAs5h3VW/dabtVuv7dYvDagDgFp9QJBNgysGVOI8OjTNDkNb6i3hSZJ4rg
	p21crswUHmMeP+gBgYhHgIBEckSgeh2tEQTFulROLjvDO9+bWlVpehOcbPeROvyHSpvuAXRnTEMif
	JZeyel90Z9HdjjXK4e9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDX-00000002SyE-25NL;
	Tue, 03 Nov 2026 13:06:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDT-00000002SvX-3fGH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 86AD941A6E;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACE31F00A1C;
	Tue,  3 Nov 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711179;
	bh=rGq3BFd/+B7P9vI1bpgAX9feA3OyMCXcQKhqEkCS1rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bKzeSrpZBD/FDvBjIxoyxU43+9fHS9P6oNrQ0Y8TGiObRJL1si8STS9hUza1EHBGx
	 x7l9myctHMlHNo5UHogePR19WVXsmU7sfAZ8oZeVOpJRW4ixTxocvft0kpL85q9b17
	 JcXysnDx+Fy9eLPwNkRaL+Zrl2kuJH87lLkfPXsJuOn2pg5rbhzZSnD4gFmYVQKRad
	 l/Lx+AxoyUgPWzgVMn02R12T8pd/nfsal3lN50qlQn/83ZlrUPfDpdAKEDCvBk4tlE
	 F4t4peBgT4F9OKwUwcIjC/75hXc1EPMZe9cuyxPMGlVwYnit2WDwTS8AkGc7nMPc6F
	 U6gPNVE89yGeg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDR-0000000ATWs-2wl5;
	Tue, 03 Nov 2026 13:06:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] KVM: arm64: vgic-v4: Don't allocate vPEs that a VM can't use
Date: Tue,  3 Nov 2026 13:05:31 +0000
Message-ID: <179371111249.2844725.8495619581179342527.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028101318.2170928-1-fuad.tabba@linux.dev>
References: <20261028101318.2170928-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, rananta@google.com, eric.auger@redhat.com, Sascha.Bischoff@arm.com, will@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, 28 Oct 2026 10:13:16 +0000, Fuad Tabba wrote:
> Changes since v1 [1]:
>   - Gate vgic_v4_init() on vgic_supports_vpes(), split out of
>     vgic_supports_direct_msis(), instead of open coding the nASSGIcap
>     check. (Oliver)
>   - Use vgic_is_v3() for the GICv2 check, in vgic_supports_vpes(). (Oliver)
> 
> Two fixes for vgic_its_create() allocating vPEs for a VM that never
> uses them. Nothing frees them when the VM is destroyed, and each
> doorbell handler stays registered with a freed vCPU.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2 VM
      commit: 1995650e0a5eb29f624e9b3e4afe487541bfd3cf
[2/2] KVM: arm64: vgic-v4: Don't allocate vPEs when userspace clears nASSGIcap
      commit: 6ade9467e37149d62ec704d1a03d52f334906f13

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



