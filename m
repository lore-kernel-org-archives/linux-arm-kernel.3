Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1098CF537D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZrP0N4hv+TFz+SIF4ni1gagKIfHSezeTfzgo//YLIg=; b=HpLTHdqwRoesx9mmuuj+9IIp1t
	f/Q7LooqvXTXzhX8pIWRn309K1bwUs45suPUvJkQtlkR4DPX9pjWChXO9maN3YQP4s2uyCmtU8wMX
	7pqB4H1CriiqINVbEPkxSAA/++Smc8RmPVNsVEv7X/kZRZK09wAfosM637eRUx/6mDZehqPfyIpk5
	rxQCuthfOv5Psl8iDenA+k9BHTGNYH4K1YoJqoMwFR/s3cbEeQhry1CxM9csr5047FNsPIhcFZVe2
	ilwTV2gqBNsTeOSJTrF5TM22ClKjCNMW1/TnJwCRWZgz1kgyVqn84ayywFuu+gcGngRb9sF9g6z6n
	UpJbTqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3agY-0000000EM2R-2Ks7;
	Wed, 23 Oct 2024 12:41:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3af0-0000000ELsE-36sH;
	Wed, 23 Oct 2024 12:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 828AFA44E40;
	Wed, 23 Oct 2024 12:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957E3C4CEC6;
	Wed, 23 Oct 2024 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729687221;
	bh=dzqN+awO8TcOkYgyl6lEgGX9CYpgV1GK+LsfppVV8w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G01LHK/vpGe0lTSOwUHtuMKExgS4os+O+zy89jYCbdgWExVshtObrm0N6Icqhkl+H
	 TdoU04T7Yi5eo5p6jdcc7emXRa4zVPv4vMBnvBwKdedNuusHFYl0x5EgLDBZUsMjve
	 I05pBGjEj2ueFiMMKKHrSOY5cJrY4cfp+/tRBCIjpg7NOIYEKqQI9sk9aLLIzov5w7
	 1zgrlF7BCFFU8ZgKMLKXNwiNZA2MWMs1xZk2WX4ILgR0Olb2gnfo0ladgTk0Idv2sx
	 Xleqrvsv2wXC6dp71tv5sbiEBgtpqy9QhFfybS6J36EmJxQUKTf253zMIuVlmAXXUK
	 KgqSETdRR9clg==
Date: Wed, 23 Oct 2024 13:40:14 +0100
From: Simon Horman <horms@kernel.org>
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
	helgaas@kernel.org, danielwinkler@google.com, korneld@google.com,
	Jinjian Song <songjinjian@hotmail.com>,
	Jiri Pirko <jiri@resnulli.us>
Subject: Re: [net-next,RESEND v6 2/2] net: wwan: t7xx: Add debug port
Message-ID: <20241023124014.GU402847@kernel.org>
References: <20241021121934.16317-1-jinjian.song@fibocom.com>
 <20241021121934.16317-3-jinjian.song@fibocom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021121934.16317-3-jinjian.song@fibocom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_054022_863125_5C846940 
X-CRM114-Status: GOOD (  11.92  )
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

+ Jiri

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
> 
> Link: https://android.googlesource.com/platform/packages/modules/adb/+/refs/heads/main/README.md
> 
> Application can use MIPC (Modem Information Process Center) port
> to debug antenna tunner or noise profiling through this MTK modem
> diagnostic interface.
> 
> By default, debug ports are not exposed, so using the command
> to enable or disable debug ports.
> 
> Switch on debug port:
>  - debug: 'echo debug > /sys/bus/pci/devices/${bdf}/t7xx_mode
> 
> Switch off debug port:
>  - normal: 'echo normal > /sys/bus/pci/devices/${bdf}/t7xx_mode

Hi,

I am somewhat surprised to see vendor-specific sysfs controls being added.
And I am wondering if another mechanism was considered. It seems to
me that devlink would be appropriate. Jiri (CCed) may have an opinion on
that.

...

