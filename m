Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAB5CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZZKucDS9LY8FXeEJnTpsGEk3KUkIQjyQmRctRwv82I=; b=JeI0KLFX1wgVh2OLd6lIRgnU1B
	COM2DuImBeWMNjGmV3/4fMDkmgJsayOLi2W9ThdFVsjBPhg/YHrMo2BTudwxC3TGzzNg+MWRy/lox
	JaY8ERegRBAMlDq4gyspMbbnW7ylvXggtWWwaCBxGLL7hyxs4K/nIm7Ttygc3kxq6+YIbPJSF/eBi
	2p9HrwRrq8Hzm2LBg6U0uaDqHmNpsTWb9Up/1tFzzJMrETFeNafn6YwjketvjgK5ae99yHgiO1PxV
	QiD/G07I+SihR+5gKbi3ckxwkARBPl5YpV0bFdmD/EINxrQtSuLzA2GITdFLTZJ/5gpuje/yIoNO5
	mesVcXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKetQ-00000001T1P-3W77;
	Wed, 06 May 2026 16:14:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKetQ-00000001T0F-0nEN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 16:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5F9943E15;
	Wed,  6 May 2026 16:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878CAC2BCF4;
	Wed,  6 May 2026 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778084075;
	bh=A0quAGCK/EpA/Nbo/d5YzQaDvSpRk944McU1GFhDxkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W2tcqdr1OXMwzgVW+ML6e0udUsOw82v+LM6zMQ8UEzrumicQwEBVBnXTX9rPy8jlF
	 phbB/435SXxp/Ovuy4GpGmWJ9Ru/VRHvBZA+WJBlDKsruheQY9Qe4kGiQN6H/WiRYR
	 5U7qj6fNGAaNx2sMV/FnUGMRG+598BpUdt2A+y7RFFLpkXOMjoN31vV0fZuUtbhmTI
	 B5eRAn1pDoTD43ddHFqNLGReBz/vDphDCwvdFF1Gopaqm0VS2Zldo6x1pbrZ/i8YrM
	 Mt0uu03NamOjYbYzAkj3Xa4W3priDIDpYDTYvRzQUqb/RiPEpfvapJm+KTGUCcyBcU
	 6G5gisiA5IZTg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wKetN-00000000MI5-1ObS;
	Wed, 06 May 2026 16:14:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	tabba@google.com,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: mark.rutland@arm.com
Subject: Re: [PATCH v2] KVM: arm64: Handle permission faults with guest_memfd
Date: Wed,  6 May 2026 17:14:30 +0100
Message-ID: <177808404891.2712489.7110397022243564508.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505094913.75317-1-alexandru.elisei@arm.com>
References: <20260505094913.75317-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, alexandru.elisei@arm.com, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091436_247747_3639542B 
X-CRM114-Status: GOOD (  11.03  )
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

On Tue, 05 May 2026 10:49:13 +0100, Alexandru Elisei wrote:
> gmem_abort() calls kvm_pgtable_stage2_map() to make changes to stage 2. It
> does this for both relaxing permissions on an existing mapping and to
> install a missing mapping.
> 
> kvm_pgtable_stage2_map() doesn't make changes to stage 2 if there is an
> existing, valid entry and the new entry modifies only the permissions.
> This is checked in:
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Handle permission faults with guest_memfd
      commit: 9be19df816dea9eb7dfe1661b3690bed6a2cb146

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



