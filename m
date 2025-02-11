Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C37FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xqq0atmWH/Uq0mb5jji3xKiIhPlLJddp9ctcEfalNpc=; b=HLAtgeMK4oAwb2ncOI3tp5AKTA
	z/h+SrG219E1/JrU16yESeH67uEpTpf0Ow/GzN4s8DQgC4x1Xh1np0l3n27Uo+wAgeJUMbyE3Iypd
	ux+5Xqqdnv5kRadCLzviZPyoFzEA//C9XXXexxYWIPZcW1bpGSTcHIv3p53wBwOlSj2l28DiG3f30
	XT4vPQA3hUWcMd4cA9o+M05ro5kVztoDJXdh3zQ4jVBbyjNbIviMR2zL+ZI6miy/H3fT46lIz2DHt
	WNa27Aoz4dRCJh5rSh4+FLkZnflPF5oJOCWRXohIEB1xU4OqJBqsLYknBkmjR6tQk8Sjq6tPF8Vzj
	HUFzJ2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtqa-00000004ddx-0qGh;
	Tue, 11 Feb 2025 17:14:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtpA-00000004dYD-0dWJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:13:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8BF013D5;
	Tue, 11 Feb 2025 09:13:48 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AD313F5A1;
	Tue, 11 Feb 2025 09:13:24 -0800 (PST)
Date: Tue, 11 Feb 2025 17:13:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z6uFMW94QNpFxQLK@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_091328_233205_CA69EAC7 
X-CRM114-Status: GOOD (  13.65  )
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

On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> SCMI_PROTCOL_PERF protocol, but with different name, so two scmi devices
> will be created. But the fwnode->dev could only point to one device.
> 
> If scmi cpufreq device created earlier, the fwnode->dev will point to
> the scmi cpufreq device. Then the fw_devlink will link performance
> domain user device(consumer) to the scmi cpufreq device(supplier).
> But actually the performance domain user device, such as GPU, should use
> the scmi perf device as supplier. Also if 'cpufreq.off=1' in bootargs,
> the GPU driver will defer probe always, because of the scmi cpufreq
> device not ready.
> 
> Because for cpufreq, no need use fw_devlink. So bypass setting fwnode
> for scmi cpufreq device.
>

Not 100% sure if above is correct. See:

Commit 8410e7f3b31e ("cpufreq: scmi: Fix OPP addition failure with a dummy clock provider")

Am I missing something ?

-- 
Regards,
Sudeep

