Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0E2CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBSFzFA3KQepz/6hUJEehGOkcBZDsXn/cI/byRrIStA=; b=cz4HMdxe9m+F3fhBU5O3ysjcek
	e//aujpF2lkvUsDxwtdId+UdMDshMPqpL8c/XkCRIa+hVeB5z08YsMxSidbGbCQSs36D5gZxE/Suo
	fC/NpeUCme4p5Bo2ZK0CreRxOBw5X0VBk+MKVMefZfV5AMnT5zDBGqYOWg7vCoUVnCvxvD3BJn73J
	eu946DAyvX0X/398PL5seArimWAHF2z6S8yuaMCgNRn1Od8X8QybARCUPv/XsLtPydNwf8eMP+G1v
	vepfy63MlEyP94RBOYWyz6Zl/YWTZnyn9jaZ0pqoXlW1n3LuXQ+f72gzVUsPIaJDGEStJFJeOrnVz
	RQZ0BXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb8j-00000003lVr-1GLr;
	Wed, 20 May 2026 07:14:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPb8h-00000003lUj-2b56
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:14:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A9EB4096F;
	Wed, 20 May 2026 07:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4A81F00893;
	Wed, 20 May 2026 07:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261286;
	bh=SBSFzFA3KQepz/6hUJEehGOkcBZDsXn/cI/byRrIStA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LKtBo6KULLlxvCyAj6v4urxZpuP63Q6SlIcvNVbGCIG2g1HW1DZ35FgD4UU1NLG9f
	 Nf4gCEmFKMkw9azxJJ7L2wOAL3hYjV7qY9wMtNqDfu6hfGmkIDaIeiUq7m9iv53jaw
	 cDAPB+9P+/VMBZ4mi/AXy6YfALYuZ3DCHuPQWiSWnkVzQg07lUlDnsDDTCnn2xdeCC
	 +rYsan38zoIwkQH0f4+ybNLpLRQH5C4McADa8lSPcW2cSRYm3gBhwmgmPob+bSlqUP
	 tJEuk7rWKBoceY53P4m3HhSLDfWcx5+EcJ28zfygwnXE1J0f4TmR/dBW+3LDWSBK5T
	 NmmIOdmVVUghA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPb8e-00000004FaD-1YHa;
	Wed, 20 May 2026 07:14:44 +0000
From: Marc Zyngier <maz@kernel.org>
To: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid desc
Date: Wed, 20 May 2026 08:17:55 +0100
Message-ID: <177926141814.52935.12967491031659448633.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514162624.3477857-1-vdonnefort@google.com>
References: <20260514162624.3477857-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, vdonnefort@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_001447_680142_DDED27AA 
X-CRM114-Status: GOOD (  11.79  )
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

On Thu, 14 May 2026 17:26:24 +0100, Vincent Donnefort wrote:
> pKVM must validate the host-provided tracing buffer descriptor.
> However, if an error is found, the hypervisor would just return 0 to the
> host. Fix the return value on validation failure.
> 
> While at it, rename the function to hyp_trace_desc_is_valid() and skip
> validation for the nVHE mode as we trust host-provided data in that
> case.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid desc
      commit: 1702da76e017ae0fbe1a92b07bc332972c293e89

Cheers,

	M.
-- 
Jazz isn't dead. It just smells funny.



