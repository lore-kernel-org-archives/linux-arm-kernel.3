Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F43C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 08:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTOGQrBJXzyvRRWVDB7y/GCoHV6xVPXw8gkmTnAQ7lU=; b=qeLNF0dV7QSPb+YgqbnDaKVy3s
	5DIZBcPEkzDp0AHdMmwkgdf1ehufKNaAuMqfl/Y2kdQrVVQYt132yXb35t3gH2vLu0sZMIllsYs8+
	/0vKRp/FIz8CotqZ96Nm38dUnlEYQHMaHvz8IzU3V6wqNUmFMW72N2ja1UHMMziPT2cUnkmvk7I7T
	fYEqjuEUKq182TkeFZXfFvUUpFDHPv3JZdNVvMrFS0uoIb3XJLvAnTHnuwET99SRF4OGTG9AYN49r
	kNhuX/OGYN8M2GxB7joj/3TJKZehjFSbsbz0xJf+dl57MrBvFWKMaVW+vpU2ne8pK1WAn9GboahGS
	JChlZnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDwx-00000009N7P-1aV9;
	Fri, 25 Jul 2025 08:38:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDuR-00000009Mt1-22Dr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 08:36:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9F7546708;
	Fri, 25 Jul 2025 08:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7B9C4CEE7;
	Fri, 25 Jul 2025 08:36:05 +0000 (UTC)
Date: Fri, 25 Jul 2025 09:36:03 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: allow NR_CPUS=1 for non-SMP and adjust default
 accordingly
Message-ID: <aINB80UeE9pqKvrC@arm.com>
References: <20250724165639.13926-1-suchitkarunakaran@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724165639.13926-1-suchitkarunakaran@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_013607_539914_8A70AACA 
X-CRM114-Status: UNSURE (   9.84  )
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

On Thu, Jul 24, 2025 at 10:26:39PM +0530, Suchit Karunakaran wrote:
> The arm64 Kconfig for NR_CPUS previously required a minimum of 2 CPUs.
> This patch changes the minimum allowed CPUs to 1, enabling single-core
> non-SMP configurations.

Do you have such single-core system?

>  config NR_CPUS
> -	int "Maximum number of CPUs (2-4096)"
> -	range 2 4096
> -	default "512"
> +	int "Maximum number of CPUs (1-4096)"
> +	range 1 4096
> +	default "1" if !SMP
> +	default "512" if SMP

It's been some time since we forced CONFIG_SMP always on for arm64.

-- 
Catalin

