Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A786BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 07:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DVOc43tpuHAeSYUprVK/px81spsWiqY11TWh6bFcbI=; b=JBg4z4Xf1ZE0+L2MfDGsViN7es
	ajftjSJaWDdCJVjbKVN8kA37qFTDCsD2nHhGym6tuG6aVbxEI5BcmJGZW7rLGaRjIKCNx+JaBciyi
	8C9Q0jqe2bX1TqDxdnYU7SU8vfd9+t4pFZE7pjRjXvRo+pMe6Zs97mj87ljJkr5yBcUL287F/g1fO
	FGZ03JrOq9YO0cU309nj+lhMWW1QsLyQMNqxBcTxj6zFwiMRFWdSFHl9kNSSoWzNb6OVjAf78RJSv
	Y4bi1AKcv0qDzCDhmKJ0NTQZ829HpjS4RHHJp9BA2HzRhhJNxyYxFwSqJ6FjPGk8eRXScify01UjK
	Wnr7be6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6sc-0000000AdUz-3haO;
	Sun, 23 Feb 2025 07:58:26 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6r9-0000000AdNv-18O3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 07:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5DVOc43tpuHAeSYUprVK/px81spsWiqY11TWh6bFcbI=;
	b=Hc5YUR7RMKeIPr9yWOW0WaAIKkxFLkGacRfrAK1j5qvMpYwQabpQ0MeSeMHzjy
	B7rglAa0ztRY/yrNz3B9TzR377wkkHaN7L1bDR5DwRZmGHEYJgxEzZ4eIyiKPMkf
	ZlUWQ7yAfWHmmSJXBa4yLNmRl7BJwwxkrfLSgy5IExSNY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnL+au1LpnwNGLCQ--.21312S3;
	Sun, 23 Feb 2025 15:56:32 +0800 (CST)
Date: Sun, 23 Feb 2025 15:56:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, marex@denx.de,
	Peng Fan <peng.fan@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH V4] soc: imx8m: Unregister cpufreq and soc dev in cleanup
 path
Message-ID: <Z7rUrhJxZ3gk9nTW@dragon>
References: <20250214084751.2975503-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214084751.2975503-1-peng.fan@oss.nxp.com>
X-CM-TRANSID: M88vCgAnL+au1LpnwNGLCQ--.21312S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrAw13Gw47GF1fZr4UZFy5Arb_yoWxXFX_uF
	4Iyw1UGw48Ga9Fgr93Wrn7W3ZrKa93tr4UZ3Wqyrs2yr93K34DGFnYkrsYqF1UGw1rWa9F
	vF98tFW0grZxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU05rcDUUUUU==
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQ38ZWe6kszZYgAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_235655_656288_31EB0DFB 
X-CRM114-Status: UNSURE (   7.46  )
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

On Fri, Feb 14, 2025 at 04:47:51PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Unregister the cpufreq device and soc device when resource unwinding,
> otherwise there will be warning when do removing test:
> sysfs: cannot create duplicate filename '/devices/platform/imx-cpufreq-dt'
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc1-next-20241204
> Hardware name: NXP i.MX8MPlus EVK board (DT)
> 
> Fixes: 9cc832d37799 ("soc: imx8m: Probe the SoC driver as platform driver")
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!


