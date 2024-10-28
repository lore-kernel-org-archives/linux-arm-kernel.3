Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF72D33998
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ek231t06jS6RkmTQz1qzd1xmke7zrYrcAAhEd0EtWxE=; b=dl1IjCzCi14NqCg6WDoL9HepBy
	V4qfRBUxVV0RuNztcHQFWw3JatKDa91siv1KtgUUJqw9SX4Kfjk/9CtLvTAft148Lnmtb3Ih3niUq
	QwCAV2sAl5pEBGwiOpKqPrCK1gWQvC0A3mTKmqc85HRGU/c/wfXWygRIq5H2Upo/wBoZ0K41KwZCF
	5Ea3zwVa4rp1K2ItGPA0Op0J2HpNTc2/n34rlqjDf0iZrxv9bW1PHIZKl+4onoDObvAV4qHfNCiRq
	HQRGFH8QSUTPL7UVi04STopHGUdlFSzvwiS+IP9l6/m6ue9naiiv7pFbUxWofAHjnyOBwqX+ketpd
	wNXMUL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5S2q-0000000BNSi-2yoM;
	Mon, 28 Oct 2024 15:52:40 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RZf-0000000BISO-0h35
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:22:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SFMMeh027800;
	Mon, 28 Oct 2024 10:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730128942;
	bh=Ek231t06jS6RkmTQz1qzd1xmke7zrYrcAAhEd0EtWxE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fIXk/2PyUIoV18k7oq+/iYmIgFv8YqrilOnQaSMGifnxCTP35qN3QXGPnlmyooBpc
	 mLMeclC3EGwfL3ZO/HfYf22ULLB075gHoJD5mIIfJyi6u3Pgq6mYJ1Zg7BqY4tclov
	 S4hkeaVoiGOPihomMJo0t225ufWzS+m2hXvAdApw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49SFMMv0049529
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 10:22:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 10:22:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 10:22:22 -0500
Received: from localhost (ula0507357.dhcp.ti.com [172.24.227.166])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SFMLNi017857;
	Mon, 28 Oct 2024 10:22:22 -0500
Date: Mon, 28 Oct 2024 20:52:21 +0530
From: Suhaas Joshi <s-joshi@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <s-vadapalli@ti.com>,
        <devarsht@ti.com>, <vigneshr@ti.com>, <b-brnich@ti.com>,
        <danishanwar@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <c-shilwant@ti.com>, <praneeth@ti.com>
Subject: Re: [PATCH 6.6] arm64: configs: Enable additional docker configs
Message-ID: <20241028152221.bnawg4wz4y7oqd55@ula0507357>
References: <20241028045340.1079402-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241028045340.1079402-1-s-joshi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_082231_340177_23BEA06C 
X-CRM114-Status: GOOD (  16.93  )
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

Hi all,

This patch is a mistake. Please disregard it. I will send a new patch
across the latest baseline, with a better commit message.

Thanks
Suhaas

On 10:23-20241028, Suhaas Joshi wrote:
> Docker requires a list of config options to be enabled in the kernel.
> This list is generated by the script at [1]. The list has "mandatory"
> configs and "optional" ones. The mandatory ones are already enabled, so
> Docker works well with some images. But many of the optional ones,
> particularly security and network configs, aren't enabled. So
> enable those so that Docker can pull and run all valid images.
> 
> The configs generated are listed below.
> 
> Generally Necessary
> ...
> - CONFIG_MEMCG_SWAP: enabled
> - CONFIG_BLK_DEV_THROTTLING: enabled
> - CONFIG_NET_CLS_CGROUP: enabled (as module)
> - CONFIG_CGROUP_NET_PRIO: enabled
> - CONFIG_CFS_BANDWIDTH: enabled
> - CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)
> - CONFIG_IP_VS_NFCT: enabled
> - CONFIG_IP_VS_PROTO_TCP: enabled
> - CONFIG_IP_VS_PROTO_UDP: enabled
> - CONFIG_IP_VS_RR: enabled (as module)
> - CONFIG_SECURITY_SELINUX: enabled
> - CONFIG_SECURITY_APPARMOR: enabled
> - CONFIG_EXT3_FS_XATTR: enabled
> - CONFIG_EXT3_FS_POSIX_ACL: enabled
> - CONFIG_EXT3_FS_SECURITY: enabled
> - CONFIG_EXT4_FS_SECURITY: enabled
> - CONFIG_VXLAN: enabled (as module)
> - CONFIG_CRYPTO_SEQIV: enabled (as module)
> - CONFIG_XFRM: enabled
> - CONFIG_XFRM_USER: enabled
> - CONFIG_XFRM_ALGO: enabled
> - CONFIG_INET_ESP: enabled
> - CONFIG_NETFILTER_XT_MATCH_BPF: enabled (as module)
> - CONFIG_IPVLAN: enabled (as module)
> - CONFIG_DUMMY: enabled (as module)
> - CONFIG_NF_NAT_FTP: enabled (as module)
> - CONFIG_NF_CONNTRACK_FTP: enabled (as module)
> - CONFIG_NF_NAT_TFTP: enabled (as module)
> - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
> ...
> 
> [1] https://github.com/moby/moby/blob/25.0/contrib/check-config.sh
> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
>  arch/arm64/configs/defconfig | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7ffb46b74ae5..c37f18bddd38 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1,6 +1,7 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
>  CONFIG_AUDIT=y
> +CONFIG_DUMMY=m
>  CONFIG_NO_HZ_IDLE=y
>  CONFIG_HIGH_RES_TIMERS=y
>  CONFIG_BPF_SYSCALL=y
> @@ -16,7 +17,9 @@ CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_NUMA_BALANCING=y
>  CONFIG_MEMCG=y
> +CONFIG_MEMCG_SWAP=y
>  CONFIG_BLK_CGROUP=y
> +CONFIG_CFS_BANDWIDTH=y
>  CONFIG_CGROUP_PIDS=y
>  CONFIG_CGROUP_FREEZER=y
>  CONFIG_CGROUP_HUGETLB=y
> @@ -28,6 +31,7 @@ CONFIG_CGROUP_BPF=y
>  CONFIG_USER_NS=y
>  CONFIG_SCHED_AUTOGROUP=y
>  CONFIG_BLK_DEV_INITRD=y
> +CONFIG_BLK_DEV_THROTTLING=y
>  CONFIG_KALLSYMS_ALL=y
>  CONFIG_PROFILING=y
>  CONFIG_KEXEC=y
> @@ -135,22 +139,33 @@ CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  CONFIG_IP_PNP_BOOTP=y
>  CONFIG_IPV6=m
> +CONFIG_IPVLAN=m
>  CONFIG_NETFILTER=y
>  CONFIG_BRIDGE_NETFILTER=m
>  CONFIG_NF_CONNTRACK=m
>  CONFIG_NF_CONNTRACK_EVENTS=y
> +CONFIG_NF_NAT_FTP=m
> +CONFIG_NF_NAT_TFTP=m
> +CONFIG_NF_CONNTRACK_FTP=m
> +CONFIG_NF_CONNTRACK_TFTP=m
>  CONFIG_NETFILTER_XT_MARK=m
>  CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
>  CONFIG_NETFILTER_XT_TARGET_LOG=m
>  CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
>  CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
>  CONFIG_NETFILTER_XT_MATCH_IPVS=m
> +CONFIG_NETFILTER_XT_MATCH_BPF=m
>  CONFIG_IP_VS=m
> +CONFIG_IP_VS_PROTO_TCP=y
> +CONFIG_IP_VS_PROTO_UDP=y
> +CONFIG_IP_VS_RR=m
> +CONFIG_IP_VS_NFCT=y
>  CONFIG_IP_NF_IPTABLES=m
>  CONFIG_IP_NF_FILTER=m
>  CONFIG_IP_NF_TARGET_REJECT=m
>  CONFIG_IP_NF_NAT=m
>  CONFIG_IP_NF_TARGET_MASQUERADE=m
> +CONFIG_IP_NF_TARGET_REDIRECT=m
>  CONFIG_IP_NF_MANGLE=m
>  CONFIG_IP6_NF_IPTABLES=m
>  CONFIG_IP6_NF_FILTER=m
> @@ -171,6 +186,7 @@ CONFIG_NET_SCH_TAPRIO=m
>  CONFIG_NET_SCH_MQPRIO=m
>  CONFIG_NET_SCH_INGRESS=m
>  CONFIG_NET_CLS_BASIC=m
> +CONFIG_NET_CLS_CGROUP=m
>  CONFIG_NET_CLS_ROUTE4=m
>  CONFIG_NET_CLS_FW=m
>  CONFIG_NET_CLS_U32=m
> @@ -198,6 +214,7 @@ CONFIG_NET_ACT_GATE=m
>  CONFIG_HSR=m
>  CONFIG_QRTR_SMD=m
>  CONFIG_QRTR_TUN=m
> +CONFIG_CGROUP_NET_PRIO=y
>  CONFIG_CAN=m
>  CONFIG_BT=m
>  CONFIG_BT_HIDP=m
> @@ -1573,7 +1590,12 @@ CONFIG_HTE_TEGRA194=y
>  CONFIG_HTE_TEGRA194_TEST=m
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT3_FS=y
> +CONFIG_EXT3_FS_XATTR=y
> +CONFIG_EXT3_FS_POSIX_ACL=y
> +CONFIG_EXT3_FS_SECURITY=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> +CONFIG_EXT4_FS_SECURITY=y
> +CONFIG_VXLAN=m
>  CONFIG_BTRFS_FS=m
>  CONFIG_BTRFS_FS_POSIX_ACL=y
>  CONFIG_FANOTIFY=y
> @@ -1598,6 +1620,8 @@ CONFIG_9P_FS=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ISO8859_1=y
>  CONFIG_SECURITY=y
> +CONFIG_SECURITY_SELINUX=y
> +CONFIG_SECURITY_APPARMOR=y
>  CONFIG_CRYPTO_USER=y
>  CONFIG_CRYPTO_TEST=m
>  CONFIG_CRYPTO_ECHAINIV=y
> @@ -1628,6 +1652,11 @@ CONFIG_CRYPTO_DEV_HISI_HPRE=m
>  CONFIG_CRYPTO_DEV_HISI_TRNG=m
>  CONFIG_CRYPTO_DEV_SA2UL=m
>  CONFIG_CRYPTO_DEV_TI_MCRC64=m
> +CONFIG_CRYPTO_SEQIV=m
> +CONFIG_XFRM=y
> +CONFIG_XFRM_USER=y
> +CONFIG_XFRM_ALGO=y
> +CONFIG_INET_ESP=y
>  CONFIG_DMA_RESTRICTED_POOL=y
>  CONFIG_CMA_SIZE_MBYTES=32
>  CONFIG_PRINTK_TIME=y
> -- 
> 2.40.0
> 

