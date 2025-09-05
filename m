Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92246CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3f89ee38JzlP4+WgyrG1VSv+60qHAOmRS35v0Ui0Uw=; b=XkHrnk0i1OnmauBzsaF9F3zlCv
	hdMHvk3h46AJKFnswdwDVPNLfafaNnYdjGICFfW9ihgnh/HBvS9Sr/nFJ9B1uCoOuaTjdwlI4Yf2E
	6uOgahXVM9y7e9nq90xoM9pFom+7Ww8lchq9dqMj0qwPuLiHY478rUQFLZlw0jnuwDFCz6zyK8zOL
	krtyh9OrIV4/2WkecBcSSsg0YyKG1EaVEYtyaMi1sQHCcVSZ6VJ4u+m9DwK4w/XL7DQi9/vrl/dMc
	gcqRYuNPPSJ6iM89iWaXXW/Y7AXEz/WzKV21uBD3iciEKnnpWeD68PQ/TdNodQVe8VPXdpG1ReD0M
	9D3//JXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXVz-00000002LWL-0ymM;
	Fri, 05 Sep 2025 14:34:11 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSwj-00000000oC1-1hyB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:41:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757065287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e3f89ee38JzlP4+WgyrG1VSv+60qHAOmRS35v0Ui0Uw=;
	b=wpMNqaR88xSefy6Ul0H0g6t9aY5WxK1iW7rRhQRQnK5gjU++CLwnujruhbgPH4QwmWvnyj
	ZGfTlu/z0rp+4sSm1aemt139jjbh/O3vXo67Bf5oNgjcJg06oRSLxiT/3o3w20WM2dxP74
	uxvIzZPiF9lQDeV4yyP834GcRlgfZCw=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Mark freed S2 MMUs as invalid
Date: Fri,  5 Sep 2025 02:41:08 -0700
Message-Id: <175706523465.1669883.14530688411686369270.b4-ty@linux.dev>
In-Reply-To: <20250905072859.211369-1-maz@kernel.org>
References: <20250905072859.211369-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_024129_592096_49AAE73F 
X-CRM114-Status: UNSURE (   7.49  )
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

On Fri, 05 Sep 2025 08:28:59 +0100, Marc Zyngier wrote:
> When freeing an S2 MMU, we free the associated pgd, but omit to
> mark the structure as invalid. Subsequently, a call to
> kvm_nested_s2_unmap() would pick these invalid S2 MMUs and
> pass them down the teardown path.
> 
> This ends up with a nasty warning as we try to unmap an unallocated
> set of page tables.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Mark freed S2 MMUs as invalid
      https://git.kernel.org/kvmarm/kvmarm/c/34b8f4adedd5

--
Best,
Oliver

