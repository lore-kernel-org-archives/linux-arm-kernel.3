Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D70CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61HVUUUBujYWxZF3kJRe/CaNMwhNM+5pPU5vtUBZmdc=; b=eNwCCtlTIa9Ufz7lSNHbQIQR3E
	+zS9a4b7KJ7UsS6r+J4/7f0BOoAvGv3xMz8IyLbLs/IEQyHpZ4hrtYOkrFANJoKK8Sna93I5/OHrg
	5RgoXoUxVcsQ9r7os5SRGS7U9SlWSetANrZpdetfvsPNIW5oyzeBNBaSowrjePCI0hYlyylYhRLm+
	TxVDRJKYHlPgtIftLxYpQQIilGCUX/9VgCn0O8r0RNLMJT3wM9/k5GlKLvwY1RGRf2Ih7XfQx4iRk
	ZVazqjgtxPyCj+lCvIJiRaqT0uhbBtZiQ7pu7mLniGMyyhsUuKxD1oxgEvSF2jzqs4B2YBPAqfJg9
	0WTxKgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkyz-00000007uSO-2uHE;
	Fri, 03 Jul 2026 20:59:33 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkyw-00000007uRo-2JIL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:59:32 +0000
Received: by chaosmail.tech (Postfix) id 8649C1CC21E;
	Fri, 03 Jul 2026 20:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783112367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=61HVUUUBujYWxZF3kJRe/CaNMwhNM+5pPU5vtUBZmdc=;
	b=sodW93ujKc4YTfy1kcia8w4GUnTCnMEACok4ZgMl/VfTYfztulZ+4rn0H3hR4IITyXwzuD
	zFWlsaTWkFe2K9LoUAj+nd2OIMhtT8d3UPs70iIQdyp12Cny9WYltFvvlonuyh3AxrFRnu
	uqH0cJvPntZdT3GumJ5KKLVN0Lqt62w=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH] cpufreq: apple-soc: Calculate frequency as a 64-bit value
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260703215244.437ec9ac@pumpkin>
Date: Fri, 3 Jul 2026 22:59:15 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <AD6119B8-88DE-45BD-8241-3E8585F892FC@chaosmail.tech>
References: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
 <20260703215244.437ec9ac@pumpkin>
To: David Laight <david.laight.linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_135931_053666_1D6FDC6F 
X-CRM114-Status: UNSURE (   8.26  )
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

On Jul 3, 2026, at 22:52, David Laight <david.laight.linux@gmail.com> wrote:
> 
> If it matters you need to fix it for 32bit builds as well.
> It is pretty much really wrong to use 'unsigned long' for frequencies.
> IMHO the should either be 32bit or 64bit.

This module has a 64BIT dep, and is not applicable to 32-bit devices.
In addition, the calculation is passed to dev_pm_opp_find_freq_floor,
which is core code and takes an unsigned long.


