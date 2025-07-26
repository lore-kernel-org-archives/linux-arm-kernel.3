Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468E1C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 03:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SqKK1itEFeyqao+wJaeXuZjHvB4xmHKjQAwZpz8zt0=; b=mgQZxJcsiRSIMyidp1o8o7n55X
	spN5e05DwsJvxIF6H9Fm5XeWv+Jq6/Qf2955YwvlT4BLHPDHe2AjrHA2WlCQQf08+quaz3+uQ7563
	YcOU9DYUePlj9uOesK0wogiPR1Fy+83POAOUVlAwxqv9l4E2Iq5P7HyWgWglMjndcyqqmC26lx5G0
	tJPAv49ljS+onrItphu1/kRwzinOJrAOIolGQsM5JZAVXoV/YXZbpMjQ/dnkkJFgUYTXLkA+DTCXV
	zBk39xtt6e7UlY7+Z6P5egmkqVusclhtLjC67F8Nm9h5ltUVRfIfMuaCrxk3Kg6IOe3u9FxUZwTY9
	3vJ3BdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufVkJ-0000000B5X9-16Gn;
	Sat, 26 Jul 2025 03:38:51 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufVhr-0000000B5Pk-0JWR;
	Sat, 26 Jul 2025 03:36:19 +0000
Message-ID: <0fa9e4e7-1247-4c82-8c0b-fa65b7fbb56d@infradead.org>
Date: Fri, 25 Jul 2025 20:36:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 01/29] kmemdump: introduce kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-2-eugen.hristev@linaro.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250724135512.518487-2-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 7/24/25 6:54 AM, Eugen Hristev wrote:
> diff --git a/drivers/debug/Kconfig b/drivers/debug/Kconfig
> new file mode 100644
> index 000000000000..b86585c5d621
> --- /dev/null
> +++ b/drivers/debug/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +menu "Generic Debug Options"
> +
> +config KMEMDUMP
> +	bool "Allow the kernel to register memory regions for dumping purpose"
> +	help
> +	  Kmemdump mechanism allows any driver to register a specific memory
> +	  area for later dumping purpose, depending on the functionality
> +	  of the attached backend. The backend would interface any hardware
> +	  mechanism that will allow dumping to happen regardless of the
> +	  state of the kernel (running, frozen, crashed, or any particular
> +	  state).
> +
> +	  Note that modules using this feature must be rebuilt if option
> +	  changes.

It seems to me that this (all of the KMEMDUMP Kconfig options) could live in
mm/Kconfig.debug instead of creating a new subdir for it.

-- 
~Randy


