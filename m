Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B79C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmocOSK9hgh5E+Lsrtu82Yd/W9gDMariJqutM9LyXaQ=; b=lYna/bQpARgWZZOpTz6h1KeDp0
	5yR1jABlO/5PtMOby6oi9ju/1sjuBzao5cpVYQPEF+musuNhoreDPY1W2qclTf/KAoe6TU0b8PE5D
	8shqMZ7uIv4v5gfasd720SUCS7RBO5hTQQMv2QEAPfL+I7v3+TqUQ65aQQ16Pdk6BKEPuvpWFtLnX
	W+p5m8CtdOHxqUIFolRydIbTWguFD4aZYrv0tT5eH5xsk2ZZGasE1U+cchXEgOiOD/mzisG3sFVRS
	kwxZTh0U+oZWrY/d+McoV0q3ZCybmqxE/kmIPv3+lZuNIDAE+F2GDVPTxrYAfutsKZr03DiBQxNvW
	aTumwdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrGc-000000050aB-2yIq;
	Thu, 06 Aug 2026 06:07:46 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrGZ-000000050ZT-2M16
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:07:44 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso457364a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 23:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785996462; x=1786601262; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmocOSK9hgh5E+Lsrtu82Yd/W9gDMariJqutM9LyXaQ=;
        b=ST6YOP3+Bl578RBR5beiA/1CV0NWc+AP5K9ck+ht2mKOOYIvT5BH4TVq0tumaayFKz
         XBbP+5zOHFLAtAZaGE5x0jiEjtotuGxH0qgKeIprdmiJJjqzLBA5MMM4E1HnUB30X4wS
         /ecmTwrT2K7nrSrRq4DpbWH7YLd2Ao2rqbz1WQgeJExAqfWhzbCG7XsKHgrDTHetHVRN
         n0MDtXhInJL4DeaZYY8tKXj7KVbBGKYLEk6XoDgEgMQKpVn7qRlWP2aoezL1ZxZ5lhML
         7TxHiYqibBQ5cw/kE84N4L/1hIhqAK/Bp5PiaokredzKIv8jaXP5Bj4hOKKb0t+u+RWU
         sOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996462; x=1786601262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmocOSK9hgh5E+Lsrtu82Yd/W9gDMariJqutM9LyXaQ=;
        b=Kw1VurHyoPumrLcJEkJZ42rmMa2IoiC5QDnJSIUwraOSBiRVxymsdncYoBcX/Cp+qw
         YHfL416JkKQX+Z2oC2ffdYNf1z0gdX3rHMoect8vVkV32QAteuOXBtTQ72DkFP7Xrbcz
         /6v7BLJ3eYQE2JNIrO/0fBxq64mPjEljNGqgB5iT1fLjV8MmRekTzxtfBTRNXhPdQVRt
         jsLUA1ias7uN5d50XzVN4YZRlA5iKrEDf0GfKSgtWhHS/P9VITdqWuZ4xWILfK9gfAl7
         iUrLTmHV9b5wkBh3eJcRaEIbNihclG3+BXsWxRsqCDE13VrLq77tbPrlaenoMNBHvTiR
         CFFw==
X-Forwarded-Encrypted: i=1; AHgh+RqBQfSH/LUwpoO4TTIyBmgf4s+4JO8OlloI3T7x+DsQbSRHpGONB84Cf8d3Sjbxb7zF2ScOB+tVY8GWIOTC+4Sr@lists.infradead.org
X-Gm-Message-State: AOJu0YzesK3647NEAqbLQ3mxxRUSSdF5/cC3hZT9OIFA/qSXPzmz3Zqp
	cDJ9xt8WcJoYDmoaEuV00ed3y2YI0Wk5GqJQ0ijImQNS6R2mDUi8ChE90ajMUkIbvgI=
X-Gm-Gg: AR+sD10JjXQMi79+wsLYqI5/TnZMHeoGcr/g4xIAdhrajv7OuLf8Ksq9s+VkI1IFvGo
	DtgUUoQxCbbF+T3AA9xyqzsx383T71Vhp8Q1tWjrTyXx56QgAbLkxtiDssUXO4VN8sYNzyzrpL9
	b6yk1GVW/KuTxY/UQ5mBD6B4gjyDq13e5b58YcKzY9mz9GQTmHYAa3KTFLJs0SCoNyAJovfcE1n
	ifz5tNrw72MQ2CGNhzY8QjaZQwka3WDfMAMGliLTmcHMFyP8f1fHUuHvvdLPHo2e5MV3XkMDLOo
	jahkMggqSLLi7G3/TM6qbG460k6PXIQPQl8zM4fK9VIh/l/MFvcFyqS3L0FNHT7fsvmt3uKfVHp
	jwBUEHNWqtxZK3uxokQeBpz2s3822Qz/D7NmBV9eSZa+2KcXbYe4Z8TRdB6ccQs3ATwqMiPWrEX
	/0UViPGL1tfW5tOIZ7cbWWmwbDZ3r9urKZ4KpDmvLplhRHK1OL0Kei3QSeyJYz
X-Received: by 2002:a05:6a21:178a:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3cb9c1a3bb4mr5836488637.12.1785996462270;
        Wed, 05 Aug 2026 23:07:42 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca908068sm20402627c88.12.2026.08.05.23.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:07:41 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:37:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Anson Huang <b20788@freescale.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: imx6q: fix out-of-bounds write when probed more
 than once
Message-ID: <f3oyofuwnnygmazuduufjvvafqpgqxfnvnf6dcxfc63z2ozz6o@vxk7bozr2ctl>
References: <20260806050239.90188-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806050239.90188-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_230743_609807_79A5588B 
X-CRM114-Status: GOOD (  17.71  )
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

On 06-08-26, 07:02, Karl Mehltretter wrote:
> imx6_soc_volt is allocated fresh on every probe, sized to the number of
> ARM OPPs:
> 
> 	imx6_soc_volt = devm_kcalloc(cpu_dev, num, sizeof(*imx6_soc_volt),
> 				     GFP_KERNEL);
> 
> but it is filled through soc_opp_count, which has static storage and is
> never reset. A second bind after an unbind keeps indexing from where the
> first one stopped, and writes past the end of the new array.
> 
> Unbinding and rebinding the driver on qemu's mcimx6ul-evk, under KASAN:
> 
>   BUG: KASAN: slab-out-of-bounds in imx6q_cpufreq_probe+0x3b0/0xa34
>   Write of size 4 at addr c5e90480 by task binder/73
>    imx6q_cpufreq_probe from platform_probe+0x88/0xe4
>    platform_probe from really_probe+0x108/0x384
>    bind_store from kernfs_fop_write_iter+0x1b4/0x28c
> 
> The write lands one u32 past the end of the allocation.
> 
> soc_opp_count is only read a few lines below the loop that fills it, so it
> never needed static storage. Make it a local.
> 
> Fixes: b4573d1d657a ("cpufreq: imx6q: correct VDDSOC/PU voltage scaling when cpufreq is changed")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/cpufreq/imx6q-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

