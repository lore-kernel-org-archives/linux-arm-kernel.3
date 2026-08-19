Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0A5C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4ChA2iAuM1re5S47W1n/wqqx5CQygSZc7uhrjoaTvo=; b=eKck06OzfrXFs7aklQJjK0UA+E
	9p+kaXCutwymKSw6GWftTJiEdYqg9kF9tSerocvp/c7b1USfAJdtHZE1A8GkyyJtNpjmTHZuOQbct
	Gbncz3mi3fK6Sb7N8WjZbw38O0cOZRcldYDmpSfl6vIkOcBznVdcsCgq55RKlgwA5C57j7gnu4LHf
	3aV8Pb8VphUQW/KVtT19B9Oxh2RtL5GViS+KELgYO3Ob/TQYEvpXlWW5tI9qupNVUJcosgTsIQkkB
	Y2HXsMlQJNG3frXhKDPikSZb3qNXeAQoA/Nq5s1QEXkyP8cvG3OeaYR4QRK66Zs5pBdMdyF37Nsy5
	7jWtlmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaPz-00000009A21-0bt0;
	Wed, 19 Aug 2026 07:08:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaPx-00000009A1q-12sh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:08:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 52128409A2;
	Wed, 19 Aug 2026 07:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592571F000E9;
	Wed, 19 Aug 2026 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787123334;
	bh=f4ChA2iAuM1re5S47W1n/wqqx5CQygSZc7uhrjoaTvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+4u+EKcAPUWzPqCkM7BeiMaYIInvudLkYk9l+sDvwCUP9LpcTqD2k9PqAiuvfSVI
	 Lfx9fM514+UAXR+M3MJlaqjiQMvCCi66KkfA9YbdUShEEwU2efT09PRsp6U1TTLLrf
	 0QNachjkh4xadLVle6t9juDlm0HVfLR7+m8VYpm8nNVoNfHS8OHNsq3qXJF/jBuNPT
	 4z/PV7B2Dph9ykaLJEhnfyOaKBxdzYhqmPTmGdUg+VgYp4SbSx7vzsv5/G0nRauvaV
	 akJIMQEdRvo45Lf3see+DNVWKWzyfuH3lyF/Xhf4sXRdyTNpV3w+pKgDOnlLJ8KU07
	 HPOYPy9Oe3kQQ==
Date: Wed, 19 Aug 2026 08:08:50 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Carol L Soto <csoto@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mochs@nvidia.com
Subject: Re: [PATCH] firmware: arm_ffa: Unmap Rx/Tx buffers on shutdown
Message-ID: <20260819-aromatic-albatross-of-virtuosity-2406c5@sudeepholla>
References: <20260818224404.3694580-1-csoto@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818224404.3694580-1-csoto@nvidia.com>
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

On Tue, Aug 18, 2026 at 03:44:04PM -0700, Carol L Soto wrote:
> The FF-A core maps its Rx/Tx buffers with the firmware during probe,
> but only unmaps them from the remove and probe error paths. A kexec
> reboot runs device_shutdown() without removing the driver, leaving the
> old buffers mapped in the firmware.
> 
> The next kernel can then fail to register its Rx/Tx buffers because the
> firmware still tracks the previous mapping.
>

I had posted a single line patch here[1]. The original author/reported never
got back.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260729-nostalgic-accurate-raccoon-ab7d7e@sudeepholla

