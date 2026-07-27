Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAA7C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxhfi3VWM2ZO5rpEKIfZcY3s5wKcbQuJh8HHKhGOQwM=; b=Ce3PGVEPVcjbzRQobOeH+lZu1C
	Dh7vvtSHqzYjFUW5d9uZMwjHPepxEMM8VV0sIeXaZNUU7DGtD5xw84KpbwHd47itFgu5+T/0/Qfw+
	Ri3iZfhGl4Q12y0Y/RsJKA+v2EpLLa7/eShy4/MroImxJNWzNiUWRJXeOEdUu9Dp4CGMyhDfZLEcZ
	6d92Vc4r4wcn1JfxbPIub5neHQEHZqyDr9FsU+15JFCDuoceqa3NGkEdKcUD4KEAQ5uXglulnf1Iv
	j4AIqTJ2M2bxknbj58Ye2oRi40ZZLk/OADFX1iAAVe3QYv5NiwxddXaE6IMTvFUd0tFUFbYOcljZp
	TJ/7ev7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRbH-00000003o65-00DZ;
	Mon, 27 Jul 2026 20:06:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRbE-00000003o5j-3TLB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:06:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F7F460008;
	Mon, 27 Jul 2026 20:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C1B1F000E9;
	Mon, 27 Jul 2026 20:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182815;
	bh=jxhfi3VWM2ZO5rpEKIfZcY3s5wKcbQuJh8HHKhGOQwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YaeAYkNuQfx46iAf6KSXNj9qHCWO5lV+G+qet8NRJdQfc4wNO31nxmofjnmqa5wem
	 ZFmwDUQDvBYNq7gS5WCJ8RzU5KDKToMrwW5lnJ6Morwd2KUriV2zYNRYM1XIn7zMb6
	 oN0dZZY54FbxuRVxXHWsINTAbn1fGYiIrh5NO6OclOsJvtZnSsFAS1VcufY3VR8JVJ
	 qd8HqIc0eSLtzpVxn5w2bX2y6Pem0uW/fzZ5TwpMDJ45g+xa1IiY3oPF6oCz7FbSeJ
	 IqfKMtHD4Lz4AH6roB6cnrmtFeUN9vq07sc9cpvcsHAlN5Al7ykOGKlpeeflUBH6sV
	 029sOVB0+MLzg==
Date: Mon, 27 Jul 2026 21:06:52 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] clk: scpi: register scpi-cpufreq once and clear
 on failure
Message-ID: <20260727-towering-spicy-starling-da9cfa@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <0ef515019f96.1785118770.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ef515019f96.1785118770.git.liuxixin@kylinos.cn>
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

On Mon, Jul 27, 2026 at 10:19:15AM +0800, Xixin Liu wrote:
> scpi_clk_probe() walks clock children and, for each DVFS provider, calls
> platform_device_register_simple("scpi-cpufreq"). Two related bugs:
> 
The function named above appears to be scpi_clocks_probe(), not
scpi_clk_probe(). Fix that.

> 1) Multiple DVFS children each spawned another virtual cpufreq device.
>    If cpufreq_dev is already set, continue and skip a second register.
> 

The registration uses id -1, so every device must be named "scpi-cpufreq".
A second device_add() cannot register that name and must return -EEXIST;
platform_device_register_full() then drops the second pdev.

So the above information could be misleading.

Can you state it as each additional DVFS child attempts a duplicate
registration and overwrites the first valid pointer with ERR_PTR(-EEXIST),
rather than saying that each child spawns another device?

> 2) On IS_ERR, the pointer still held ERR_PTR (e.g. -ENOMEM). remove()
>    treats any non-NULL cpufreq_dev as live and would call
>    platform_device_unregister() on the error pointer (oops). Clear
>    cpufreq_dev to NULL after the failure warn so remove() skips it.
>

This also fixes bugs introduced by the original virtual device support and
by moving registration inside the child loop. So

Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")
Fixes: 67bcc2c5f1da ("clk: scpi: don't add cpufreq device if the scpi dvfs node is disabled")

-- 
Regards,
Sudeep

