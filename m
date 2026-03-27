Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B86A10F2867
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=368mPLXc9JyM0HjsQfm0Fgy565wxp0dKv4mk+E8MWN4=; b=FdfGiolrkAgeYqW0grL9HA0T5Y
	Bal+Ewn/MINiBBWwOG5VZysH/BnddyMbbHcPAY5DLXdVkY3xGepYQBkGnEYDGlLI73a0LtIjG+7rm
	VEtsKPLQ8Pp0quTbUeCjLJLprEbaiFRXdnRQ6EBLfTxMFltz1oSTZeYsB7g1q8fm5468WOCd0ATlE
	ojuVGEez1bHj78E1ojbGkm5Z2Six8an+wv58JPUFMJI4oZIv3bdCYjyi5jTW3lelBxaSpCw45BzuP
	Mag4w9fYWK6zkeyo0pfzW8lTE6pB0ax3KWencRvsZy/KiDD8T+Y3nuzEl4WGDHjysFVzQ5DBsvgpm
	MCRK9AcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Bgn-00000007vN1-19AZ;
	Fri, 27 Mar 2026 18:13:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Bgl-00000007vMb-1vT0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 18:13:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB8BE40886;
	Fri, 27 Mar 2026 18:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01347C19423;
	Fri, 27 Mar 2026 18:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774635222;
	bh=368mPLXc9JyM0HjsQfm0Fgy565wxp0dKv4mk+E8MWN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaOY2uaQ0Uyjv+zfwm7wl7Al5M46tHMtJ/uzYECADjqpSw/x0y4rYlx6Xu3l1y8Uh
	 UsOtzpSg75YFz+yCjaaXlpVge7C7hc2Z7EcamBgcD8QyWCoVHoOHwo5+axfiLEAIpD
	 ENL5lA24cgY4bYHA5AciicMtv58Dc26G/DzcgyXto33OrV/MNudgxMgXA+S/72+sRE
	 DAKniMdUe/SN6Q73+S+Kgoc0xE+SCvLBnhrK1qO9hbqQSdcxDHM82jbUv45La4OhcU
	 LsN/iFRTS2nlJjJ/3OTssSfwR7oyk274buFNbKrC/vQKL6q/wx76yabCPzuFZ5yfIN
	 yGj1apjzgqsxA==
Date: Fri, 27 Mar 2026 18:13:36 +0000
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v4 00/38] KVM: arm64: Add support for protected guest
 memory with pKVM
Message-ID: <acbI0KbctmKQR17F@willie-the-truck>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_111343_540478_7E4D3E52 
X-CRM114-Status: GOOD (  10.23  )
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

On Fri, Mar 27, 2026 at 01:59:59PM +0000, Will Deacon wrote:
> I fully expect to send a v5, as this is the first time Sashiko has had
> a chance to chew on this and I'm expecting a roasting.

After going through it, the report isn't as bad as it looks and some of
the comments are actively wrong, which I suppose is inevitable.

That being said, I've got a handful of fixes to fold in now and it's
pointed out some unrelated life-cycle issues that we want want to fix
separately.

Will

