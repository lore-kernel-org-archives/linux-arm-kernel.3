Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12078F436A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSNcKOS3hG8sEUDHsVUafsH6WDl2L0zMSBSQ/AasRFU=; b=xpweIfDMrpldCVRmq9kjzJLa/u
	c/qsVPSHqa4pE3MWtHd2wVpND0ZfF0bxu86sj29egS8ZyfcXQD3oaPPH0qHTsF+Vi0HdP4eZP5QTo
	OCipsSignUj/XlxUgmgzsgyBy3e95yPJgWzn0Ofd06FckicviA02s5coC/amhsp+yLywMsOjLoD5M
	jet48sfRrMK/4Ote0Px7zaBJc+XHnFMKLTE2SsHWAGvUVn7fZlHOsSOZDx823qt41Ku/0gQEe3PGd
	CIbvNnuYlKwH+aM5MVcBfdpQbiCY3607jq0dzlv6FV8vGYcAf2Zxkm1LoA81uZO9RF4+MfLiLDwun
	3atTyzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDk6t-0000000487V-3hjq;
	Fri, 17 Apr 2026 14:23:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDk6s-00000004870-0LZ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 14:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A3194417E;
	Fri, 17 Apr 2026 14:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38894C19425;
	Fri, 17 Apr 2026 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776435833;
	bh=QSt6j0W6pMiio5QTp6a2cbkfPTTGBRXzqIob3FlkAUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wm48HSKhaI8SA5MxAEernWSnujsKRBi1Gsa/5utLnjUaQCdLjkgwn74KT2/fbNDWa
	 E/hGjdJnzrE1E8haO7Rh4vw65jFPgvAkilc2zUM8zxIB296hNT+fX+BoXpSYgWJeUG
	 sB1ZHIi6X+GBDWa2mQ3BDJFjXZ3kGt2DQbYDU3kHQlta80TIlGmMgi1yu90TWeSw/+
	 YcdSh+AQVvo12tLR67pkHkiXIv3MSEbD87mhNgmcPnEQK3M2ygPmKY/UE+hXL+tgsp
	 u1Td7R7h/WogpUDTbRPfDyW3zXeK9nRTxdrdNkKTeTAQ0B2F9x8BSZrNMkLOwRXsgO
	 YCvK5NKagBVrA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wDk6p-0000000CTLo-19xx;
	Fri, 17 Apr 2026 14:23:51 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: pkvm: Adopt MARKER() to define host hypercall ranges
Date: Fri, 17 Apr 2026 15:23:48 +0100
Message-ID: <177643580645.2772443.3213087362625681888.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414160528.2218858-1-maz@kernel.org>
References: <20260414160528.2218858-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, will@kernel.org, vdonnefort@google.com, tabba@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_072354_142959_94AE7514 
X-CRM114-Status: GOOD (  11.46  )
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

On Tue, 14 Apr 2026 17:05:28 +0100, Marc Zyngier wrote:
> The EL2 code defines ranges of host hypercalls that are either
> enabled at boot-time only, used by [nh]VHE KVM, or reserved to pKVM.
> 
> The way these ranges are delineated is error prone, as the enum symbols
> defining the limits are expressed in terms of actual function symbols.
> This means that should a new function be added, special care must be
> taken to also update the limit symbol.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: pkvm: Adopt MARKER() to define host hypercall ranges
      commit: 9b72acd3f770517d3fd4bd7193fd60f3a81d1f69

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



