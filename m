Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB9606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KepTWJGW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gs2WEUGm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7ZGLplWFKaB8JY5T+15czx4UcwJP0brOC2Z4Smd6YM=; b=KepTWJGWTE3KuxjdepRLU3i2kB
	6n/oKXMd+ypSqjCUSp9Zqy277y+4e90rA1/72NCykO8H7bqudt1vWumy+K59zTShds0eTKa1aRmGj
	d8fwV22gHQSRkmJ7i7LSpXcM5ufXCnNBnXMdqz+gkw8WJTELgA81fMIBSvNHbr9f8f58J2QqNrrWa
	f6/QuoueC7rKqZLV+/+mJOV0bHTOQBYl5wI40UFhb6ubEqYFLU2jSKKvLHNXTvHRc44NJUgLAb0Lr
	DL23huAB0pV2aeDkBhWZUTcibpOdgKGNqOzEX6uSyPuvOjudUjcE7jQPICDbbXMeJwrKryAJyGgB2
	A947geXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXhJ-0000000C9TB-15lt;
	Wed, 21 Oct 2026 14:53:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXhI-0000000C9T1-40MP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BC2440243;
	Wed, 21 Oct 2026 14:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4F71F000C2;
	Wed, 21 Oct 2026 14:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594424;
	bh=k7ZGLplWFKaB8JY5T+15czx4UcwJP0brOC2Z4Smd6YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gs2WEUGm62ZAxSMTfnoYtXqKE0RhuPnkUxecvljB5l6U1FTMYeHfmrX+ob6l47l65
	 Phc793AjwVhxmGPH8d3WaeGwXLv7NxRkYwv1n4PFOSXBWX1Job+eEpY06+4zuCWbRc
	 0CakWSkKDyg/6CDnORverYc01G6GX1xDlEbCN81b/IJl9I4mpUri9X5nP5rCUHHx1A
	 ihuwbN4yDcNUcP3Gt4ahNTPeK7otJ/+GxO2edRlMd1i8OTD389VK+ULVp8wa5Qe0aN
	 3eEnu+XPxSw+wgmrknS/k1sIwutHZpmmPBdZNFDY+ZylESVpu3aGmVdBaObU/TSwrF
	 CvVA8SIX36g6g==
Date: Wed, 21 Oct 2026 15:53:41 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: David Cemin <dcemin@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Compare notify_id when looking up
 notifier callbacks
Message-ID: <20261021-graceful-refined-lizard-1efaff@sudeepholla>
References: <20261020220902.611138-1-dcemin@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020220902.611138-1-dcemin@nvidia.com>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 03:09:01PM -0700, David Cemin wrote:
> The notifier callbacks are kept in a hash table keyed by notification ID,
> but struct notifier_cb_info does not store the ID and none of the lookup
> helpers compare it. hash_for_each_possible() walks the whole bucket, so
> any two IDs that hash to the same bucket are treated as the same
> registration.
> 
> With the 64-bucket table, hash_32() maps IDs 2 and 36 to the same
> bucket. A driver that requests notifications sequentially therefore
> fails at the 37th request:
> 
>   ARM FF-A: Failed to register callback for 36 - -22
> 

Nice catch. I dropped the exact same change before posting the support
on the list. For some unknown reason, I assumed there will be no collisions
for such small sized buckets, my bad.

> because update_notifier_cb() finds the node registered for ID 2 and
> rejects the new registration as a duplicate. The same lookup is used on
> the delivery path, so a notification for a colliding ID can also be
> dispatched to the callback registered for the other ID.
> 
> Store the notification ID in the node and compare it in all three
> lookup helpers.
> 
> This was found on an arm64 laptop whose embedded controller partition
> declares 38 notifications: the EC driver failed to probe and every
> EC event (AC, battery, lid, hotkeys) was lost.
> 

I will queue it soon and send it as fix at -rc1 or later.
Thanks for finding and fixing the issue.

> Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notification callbacks")
> Fixes: c10debfe7f02 ("firmware: arm_ffa: Add support for {un,}registration of framework notifications")

Is this because of rework we have 2 fixes tag. Need to check how backport
would work, hence asking. I will also check before applying.

-- 
Regards,
Sudeep

