Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831DBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xq1grJ8mXwPn9Roe9X9TUKYEHJu7PmdsQ5T/TFipztg=; b=ddMF+Bt0J2r3857M7kNFtVoeZW
	9MNTVKtQpEi9BDOHkDhTgiRsF1NZX21Rwag8JbeDoDNLhKZxSvywwbQdW1gYDoWjwdWqphnwAbkbQ
	n7jBULtz0F8KrUQewzpN8XgoDPES/K6OWqSZwYTmvHauPA1wOKJ5jUjNo+EOBe2Rk+G4Kh663ueqJ
	mU5sawWByIXvpey3f69zNiOOCXGyOmk4TF5LC280ncBkkQwhgEGtzzJ2CJq3fgwW003Hnq2cxojST
	g63113/gniA41LRNStYZOOR6vxv2d7goCNBsUeby3ptqeeabJRCJFuN0Wboxu5mO9Vi2oGk5D5uib
	5kTttlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqS1v-0000000DQIc-0A0n;
	Fri, 07 Mar 2025 07:21:59 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqS0H-0000000DQ9g-1zOo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 07:20:19 +0000
Date: Thu, 6 Mar 2025 23:20:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741332013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xq1grJ8mXwPn9Roe9X9TUKYEHJu7PmdsQ5T/TFipztg=;
	b=PqsVloQnU+lGdYTBf0LnqVHZTJIOiLuAW7o6xlwPBe3yUu0v9oww45hkB/d+WCXqHKZ1pw
	zw4mNWr7rGkVwFX5yJCqOHU6N++SFbeC+ygzVf/MPm0lW6BBTLuiwa53jbJBbO7dAmpSPF
	qYz1+kBvQIl7RvNtS53h2klsA6y6cP8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 1/3] KVM: arm64: Add flags to kvm_hyp_memcache
Message-ID: <Z8qeIPfTOJU6w_8l@linux.dev>
References: <20250304134347.369854-1-vdonnefort@google.com>
 <20250304134347.369854-2-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304134347.369854-2-vdonnefort@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_232018_250402_FE298E1F 
X-CRM114-Status: UNSURE (   8.98  )
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

Hi Vincent,

On Tue, Mar 04, 2025 at 01:43:44PM +0000, Vincent Donnefort wrote:
> Add flags to kvm_hyp_memcache and propagate them up to the allocation
> and free callbacks. This will later allow to account for memory, based
> on the memcache configuration.

It seems slightly more obvious to me if we pass a pointer to the
memcache instead, but that's just a minor nit.

Unless you have a preference on this, I can change it when I apply the
patch.

Thanks,
Oliver

