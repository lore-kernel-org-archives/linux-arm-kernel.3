Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06097CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bz7DwY3jgp26kR5mZtZm1CnNUUr5RMuuKRQFFY++tyA=; b=WTc2kaSGD6Fl7ZzMc+45dDfbNy
	680AJZ7wKM6bZr9YGb65Vgw1faqAYPqvWqcIbEVM7y1F2HrmFWK6ILoZpY7KfOhT+GbBsiwG8qEHg
	zlABsUzSFdWs6XzcngyZuTonzygproCL0jtJspO5zej2lZRrgfnWiN/aK2B09wz4w7vn5D0VXasxR
	frn8WD8Y44jyR/vf8BWqBfOiUeyiJa2A1vGY/IMpIp7duV1WgURdGUcNja5NBPRXSha+83dsLEY54
	cISzCPgwefnAefXpemfkeeB5ZmvpyycvI8xZ8UhIAleFUfUrS765n0xzZDYsci3d5m5M97vnLi0cH
	iA98bTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ufr-00000003zF0-2igI;
	Wed, 08 Oct 2025 13:57:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ufp-00000003zEb-2Tjm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 13:57:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 746AE44437;
	Wed,  8 Oct 2025 13:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD01EC4CEE7;
	Wed,  8 Oct 2025 13:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759931864;
	bh=3xT85CT/P1jeGTZY3huEJ5JRccxDMFaCN0SMPtXlL6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btLyQNEBjY5F1ulKVbtXT+e7r8PeA3SG/SPfwT8Qz9QmGqlRzClVoeuktL6vhHqSH
	 MjaW38Qh58m6qKnBBqkZa5xal1kLNvzVjXp5RtF8ij5z9/Rd9eXL5Ia4+j+f0IQGEK
	 DJAontqMzliW40srMf7YsO7EaMtOUW7p7ocG2Jo5uYrTn/K97TI321G/4GUqBIi2KT
	 lla3lM7v2FvnBt/gkTKn0E49isfaRjf/sQ8n7k2wMVxcP18V4Th1I4+YlyGRJ42gMy
	 fY6tp0AqzXResdFCnmHzJpfwbaZLV+Xk8utzc9KZkI0r2p6Wa9lCN0ps0wvVsuI1Da
	 qsJacXp07UpKQ==
Date: Wed, 8 Oct 2025 14:57:39 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Subject: Re: mfd: macsmc: Initialize mutex
Message-ID: <20251008135739.GX8757@google.com>
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
 <1bc9a4b3-7a8d-4bcf-9481-36fdc76e066c@web.de>
 <20251001095505.GP8757@google.com>
 <0acf13d6-d63b-4079-93ba-d53910e624d7@web.de>
 <20251001124825.GR8757@google.com>
 <a3b93cc1-0c0f-4aa7-9b08-b3821ce8e70e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3b93cc1-0c0f-4aa7-9b08-b3821ce8e70e@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_065745_656382_352CAD76 
X-CRM114-Status: UNSURE (   8.12  )
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

On Wed, 01 Oct 2025, Markus Elfring wrote:

> >>>>> Struct apple_smc's mutex was not initialized before use. Surprisingly
> >>>>> this only resulted in occasional NULL pointer dereferences in
> >>>>> apple_smc_read() calls from the probe() functions of sub devices.
> …> However, you must also provide your own context.
> 
> Do you try to support the creation of improved change descriptions?

Not to -pedantic levels, no.

-- 
Lee Jones [李琼斯]

