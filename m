Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160C2FE520C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6GePlXqr4KEOmk21GYvQBuwFXeqvmi10cZFU9jiyGs=; b=V0ptC0m4aIt+SijjoBzuLl6cNR
	Oq5ao03ARtGMaQPdsN9RrlY3/dnjZfU/YOgRgJ5djk45bPusF1eeqOt/CXcb3bRimQVgxDiA5f+s+
	shNfJkmRkPzCJSUqlmdEox8FtLMn6dYvWvboDHl3pnQ+dhyTX6OkfyjnxGalS6vTKLAq3mM142DMh
	0qKzAw53iZIetiJRMClAFe/dfo0M2WGIOvmeluL6Jb0qmmSkScG+k+flW+RgCaMD+mZAogO6AshaC
	9Bs43hRKLKhixV41/t7lq7BM5epM2joaKAKgXrZA/s+JfmK9+FJgMRyI4PYfMWSeDbtwCoo32gGI2
	lApwDQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEOT-0000000D4Mm-1wRL;
	Fri, 24 Apr 2026 11:08:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEOJ-0000000D4IX-0UMJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 11:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFE4144312;
	Fri, 24 Apr 2026 11:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4DBC2BCB6;
	Fri, 24 Apr 2026 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777028890;
	bh=cmSla55ceuCbLiK30aqfSAllXwLZ2tM2r3ifRj5DUwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hBb/hNTAcd75sQn1Q24gofMGtsSOC2duEKWZgSdOuB8gWgI2gXbaQOc17YPe1fWlX
	 6lbv0d7o1Q5rpU8W0H04GkZ1bTwtfJf+MXj8uLQwBTb+nN6kdTUP6tgoCf/R59irTL
	 tzVNAxU7AwLJmRrKdd95N/wH1Z2GiVTFYObvCjVlSFK+uoQqNFfv7IjyIqTC9jXnbK
	 r8B3a2dV/LyTHYnr9FKcZMZmyJ4eO7Lxf0G+lJmxw7m+KsnZxmOgOMugvzY3ihGNmZ
	 x6pe2P3fhZcG2Pm8YPJTNcus3CDN+l7qQB2tFawDOp8UMlUGUxiFOnKjMD05xGchSC
	 vagYo7CTAgnsA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wGEOG-0000000ELuX-251e;
	Fri, 24 Apr 2026 11:08:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	android-kvm@google.com,
	Sebastian Ene <sebastianene@google.com>
Cc: joey.gouly@arm.com,
	korneld@google.com,
	mrigendra.chaubey@gmail.com,
	oupton@kernel.org,
	perlarsen@google.com,
	suzuki.poulose@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH v2] KVM: arm64: Reject non compliant SMCCC function calls in pKVM
Date: Fri, 24 Apr 2026 12:08:05 +0100
Message-ID: <177702878144.537738.10946354960670336499.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408114118.422604-1-sebastianene@google.com>
References: <20260408114118.422604-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, android-kvm@google.com, sebastianene@google.com, joey.gouly@arm.com, korneld@google.com, mrigendra.chaubey@gmail.com, oupton@kernel.org, perlarsen@google.com, suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_040811_181281_516580F4 
X-CRM114-Status: GOOD (  10.51  )
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

On Wed, 08 Apr 2026 11:41:18 +0000, Sebastian Ene wrote:
> Prevent the propagation of a function-id that has the top bits set since
> this is not compliant with the SMCCC spec and can overlap with the
> already known function-id decoders. (eg. if we invoke an smc with
> 0xffffffffc4000012 it will be decoded as a PSCI reset call). Instead,
> make it clear that we don't support it and return an error.
> 
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Reject non compliant SMCCC function calls in pKVM
      commit: 480ea48cad873b49a1fabd07c0847c3cf1c32286

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



