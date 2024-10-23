Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C225CFA44F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bu1l2ObQ2xP4luAG6wLCI+L1JC9c8VEm7Uvp5bR7kt0=; b=enAsdes0QtzMB7
	bQTsCra26x/GFCrh3KycVnuRn1iQG2KofMu0UcMvVwX1LhZ07p28s9jgzd7A5vgZfx7U00X0eeKM3
	LFCa2CizY1Kn+i8CyHEogRHVDB+kqQsUBxkj4POvO9tHZb4Ry7/tt1wnpuLo3nfVaQiLyhXsfFcfD
	K0B4rDvmPWyecl5s0hwiySmbQYgyWpClbY0SO94IxokqajjEobB4GZrbAfsP/1qSrkDBpSE3q2wtY
	Sc8XUyLXlLNTQjI4VK1/8elayF0OBdnrrSumgZ4LcTQ3ItR99PSt4MZ1M4jaHnw6Ddv4LH/dKqn6M
	/jaappLGoZIjQ19oF1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3du3-0000000F5Ch-2USf;
	Wed, 23 Oct 2024 16:08:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3d4v-0000000EuY7-2KA3;
	Wed, 23 Oct 2024 15:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 111E65C4C78;
	Wed, 23 Oct 2024 15:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10073C4CEC6;
	Wed, 23 Oct 2024 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729696516;
	bh=eN8F/lNDkjIAfUB0JM4j0vPqOsiKHYVixWKxi/Pt1pQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TG+6cHH1+2xLbh2vi1zJtsnou/pAIZQLsuo22e4xHmh/goTCkLgpGqDRnV5Lu7/cz
	 sJgGvRBpKTwqq+GbMRNbQY+7iVfUHEsDh1tVqS5ya6Httoz9alp1HUi+Ue7IZcslAW
	 dauJSlRUKWwnZpFOe441ybpb5NI67PvFbMRdwI+dHotS8+cOizF2/a7gmucWmxepOJ
	 j+BkzNm7tMF0K8W2H+cWyYkyc3jqunBWpKB9m2wYWXPCU0ssaWQxLHmYfG8eKdufh4
	 Xngd8gMBsw34e+MbFQidmS7VTdwFiUlkFOzMd9++PXJbh6HSNNVdaRKmmUSGlCx63c
	 b9C1xODOKVipQ==
Date: Wed, 23 Oct 2024 10:15:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	corbet@lwn.net, linux-mediatek@lists.infradead.org,
	danielwinkler@google.com, korneld@google.com,
	Jinjian Song <songjinjian@hotmail.com>
Subject: Re: [net-next,RESEND v6 2/2] net: wwan: t7xx: Add debug port
Message-ID: <20241023151514.GA888712@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021121934.16317-3-jinjian.song@fibocom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_081517_664542_A67B090E 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, Oct 21, 2024 at 08:19:34PM +0800, Jinjian Song wrote:
> From: Jinjian Song <songjinjian@hotmail.com>
> 
> Add support for userspace to switch on the debug port(ADB,MIPC).
>  - ADB port: /dev/wwan0adb0
>  - MIPC port: /dev/wwan0mipc0
> 
> Application can use ADB (Android Debg Bridge) port to implement
> functions (shell, pull, push ...) by ADB protocol commands.
> E.g., ADB commands:
>  - A_OPEN: OPEN(local-id, 0, "destination")
>  - A_WRTE: WRITE(local-id, remote-id, "data")
>  - A_OKEY: READY(local-id, remote-id, "")
>  - A_CLSE: CLOSE(local-id, remote-id, "")

s/Debg/Debug/

> Link: https://android.googlesource.com/platform/packages/modules/adb/+/refs/heads/main/README.md
> 
> Application can use MIPC (Modem Information Process Center) port
> to debug antenna tunner or noise profiling through this MTK modem
> diagnostic interface.

s/tunner/tuner/

> +++ b/Documentation/networking/device_drivers/wwan/t7xx.rst
> @@ -67,6 +67,28 @@ Write from userspace to set the device mode.
>  ::
>    $ echo fastboot_switching > /sys/bus/pci/devices/${bdf}/t7xx_mode
>  
> +t7xx_port_mode
> +--------------
> +The sysfs interface provides userspace with access to the port mode, this interface
> +supports read and write operations.

This file is not completely consistent, but 90% of it fits in 80
columns, so I would make your additions fit also.

