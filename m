Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80745CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqYNxB/tXY9RT/OF8BM2GW6kgx9YJr5b9t30p9aJQ0k=; b=KEi0NZ0Fa9tOVnBxdiqhnqlJ5V
	2Z7jXxhSfJdyDC1vwXDkjt42aGfTOFf3wrkv/zHPTT0msZDgW2LBAuTLte9yeL3RuyK4ktSFVpQrS
	Tu3uNoK5ulw1DrmfyI7wukcHchyHSTZK6UNESyDx401lp7esoAUsT3valNxEkHWcmkwaEBwX9If2s
	U3di6u/Jlxy0pbHGwSOB1QNywvqMHbAZNxhxuOgSsFZLPniW/UFSWB9vvgLmUGlHZkVG+gge0LuIe
	CrG/T8nVyoMXRIk53lZefo7klNkzwqaZDJd40ViKn/aMaNnhvb6iiyLIzdnOHsE9Rro33nMjhPYZA
	C6Jp2mwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx92-0000000FJQS-2Mig;
	Wed, 14 Oct 2026 11:27:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx8z-0000000FJPr-0boY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:27:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAA201595;
	Wed, 14 Oct 2026 04:27:31 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5AD33F673;
	Wed, 14 Oct 2026 04:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791977255; bh=zuv6pOOWeLAKZmBd8Ansq+o08TNWLk8Kd2TVb0TmpKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ORI1kCjsFOhguMPKfDxA3H0tlWs6BladvmHWBa1oKwZrm/ardftjBtzcb+3SLZjDh
	 zGp+h0d/LtL+UlmLz07uvvInVHM5aiXUQacSJus7c5+A2FkbeQ/lAqmUbJoq9BlycI
	 6Ol+kqlswpmnOCOMwWh1u65eBjz0gDe5e1jllucU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kohei Enju <enju.kohei@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	Steven Price <steven.price@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v2] arm64: rsi: Correct type of realm_config::hash_algo
Date: Wed, 14 Oct 2026 12:27:27 +0100
Message-ID: <179197724762.2616400.14263026474127319284.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
References: <20261014-cca-b4-rsi-fix-hash_algo-type-rebase-v2-1-6cb0ae13c8c1@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042737_227480_520286D0 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

On Wed, 14 Oct 2026 11:43:23 +0900, Kohei Enju wrote:
> The RMM specification defines RsiHashAlgorithm as an 8-bit type, but
> realm_config::hash_algo is currently declared as unsigned long.
> 
> There are currently no upstream users of this field, so the mismatch
> does not cause an observable issue today. However, a proposed series
> adding support for Realm measurement registers uses this field and
> exposes a bug caused by the incorrect type.
> 
> [...]

Applied to arm64 (for-next/smccc-bus), thanks!

[1/1] arm64: rsi: Correct type of realm_config::hash_algo
      https://git.kernel.org/arm64/c/c83237edf0ad

