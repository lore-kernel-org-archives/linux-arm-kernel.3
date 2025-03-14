Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9471DC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 00:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvkY8LE8GxIxs55S0NwZi9F3m+UhYcVL1EwUpxmHvns=; b=VqItwHBSQX14hO2eXJQs7+zb40
	u/gOS0sViqr5ZQzw65thHRJ9dwteyA25GqeSQ7f7jR+vb0rWllvl7XObdTA4BkLEkSLxmxNvvgi2/
	SVZSEREAb1UTz/XtHu3xiViF6hkAlUwqop7/ZPGuhzDqxmGtZR6uP80SkERNyACbag2tG/lBOijps
	+jSXxGUzvEH2wY7TRwkQ+Dw+abS0yy1nPho0eShPWNgIk1dFAU3GA8EUGlOaPyZvlS+6Ayx7A16hq
	/gDRuVMP3DerLiOr5LdqNSvvjUoyGBmPHFtY71E3vxos+3hVGhEv9Awilke1e7STmufOfirdWJ3Ct
	gng7mu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFH3-0000000FZuh-2u1e;
	Sat, 15 Mar 2025 00:21:09 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEC2-0000000FUod-3HdS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 23:11:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741993911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvkY8LE8GxIxs55S0NwZi9F3m+UhYcVL1EwUpxmHvns=;
	b=vVbc0m6WD1NDLD+3S/6AFxUZl58jcM37eGR3bDoW0ejnx5hesy8QyjtjNIlpNHHX+F3SC8
	VXYGYqqzpBHfTRS3tuyw2y2NNp7Oqf/yiVFwa05SdfDgYbulhRlb5TIIXzov5f6JGV8MCz
	U4KVAKvm+eW66XoG1shaB7GTrYqMmSU=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	maz@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	qperret@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v3 0/4] KVM: arm64: Fix initializing HCRX_EL2 and other traps in pKVM
Date: Fri, 14 Mar 2025 16:11:40 -0700
Message-Id: <174199388872.1347355.17256091490684730021.b4-ty@linux.dev>
In-Reply-To: <20250314111832.4137161-1-tabba@google.com>
References: <20250314111832.4137161-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_161155_032448_99C5FB4A 
X-CRM114-Status: UNSURE (   6.34  )
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

On Fri, 14 Mar 2025 11:18:28 +0000, Fuad Tabba wrote:
> Changes since v2 [1]:
> - Remove WRITE_ONCE when setting hyp handle (Quentin)
> - Rebase on Linux 6.14-rc6
> 
> For context, please refer to v1 [2].
> 
> Cheers,
> /fuad
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: Factor out setting HCRX_EL2 traps into separate function
      https://git.kernel.org/kvmarm/kvmarm/c/44f979bf434e
[2/4] KVM: arm64: Initialize HCRX_EL2 traps in pKVM
      https://git.kernel.org/kvmarm/kvmarm/c/066daa8d3bc2
[3/4] KVM: arm64: Factor out pKVM hyp vcpu creation to separate function
      https://git.kernel.org/kvmarm/kvmarm/c/8b21fb47c778
[4/4] KVM: arm64: Create each pKVM hyp vcpu after its corresponding host vcpu
      https://git.kernel.org/kvmarm/kvmarm/c/1eab115486c5

--
Best,
Oliver

