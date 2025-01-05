Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63913E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 01:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOBt5DPnUIGvC38vlr30QgnqV2+SG/MycZQ+czmsjrQ=; b=WNiSiYCVpUJ/Ck2t0EkDjfuKW1
	yQk82/uEDvUGe7NHXS6PusqpmIKmhieDiFe3+ryrBAR5hEZ0Y56WVIhVB6jz25XGPZUk35qR2e0zK
	XXe+ddeRPB0bkh3ASjFt1KkDgcleKWVrSuuLiYX6Tblr+Bfp4JsSW7NR3XmZ30HR7UGBvjPdtNwU0
	0KCQV/AxVl15d/HghvEO4hJmd9GmX19Trzxb79qG+/UZ/1aoUUfHUAdcZ8k/C3wEPHEk8veIMuY/L
	MwezGuRyVjTZiTF8cEi8JBSXKoD+e7QojeMdf2IsCUmbEWUXLARqwHKBN5gAwxu2sR+mMnJpYF3OB
	11Wz6bcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUFie-0000000G0Gm-2QFl;
	Sun, 05 Jan 2025 01:46:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUFhR-0000000G09T-1SvP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 01:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A3875C5780;
	Sun,  5 Jan 2025 01:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE66C4CED1;
	Sun,  5 Jan 2025 01:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736041504;
	bh=oq/Zazx3snTJ//HvVkRX0cBRbpMDsarbsm2tecQIdeI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dzldYET2emHDIAf7pzP0JoImS29VgCeY5/sCXhrOSKaxR6uYeadUuElqftv4FLpGK
	 fLXF6VYE8kqqFAQgqJ5ZPUAl6NcPe4N8yw63oF0pCNU7QCaQ3rUiaqrNkXAGZSAUpe
	 pOml0TNelBOAPn8HO/MR/lobpU5ydKFYEuhZIIkndr2ok5amNRxKyyog/lE+QZ4Tz3
	 Xt7sYf0lK3xoiLYHzahbLj3ljbjWtL4Z0eZvM4y4hwfBhihxbDjXJwBNr5R9HSE9Zb
	 BZ6sVBRhXiQBLYpjk3km+425LXrZTM4OXYTHXwruV2TsbfxR1OMLFbkqUDq/PcpCaw
	 W4mevP1ED11vQ==
Date: Sat, 4 Jan 2025 17:45:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH net-next 04/13] net: enetc: add MAC filter for i.MX95
 ENETC PF
Message-ID: <20250104174502.0d43e7c0@kernel.org>
In-Reply-To: <20250103060610.2233908-5-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
	<20250103060610.2233908-5-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_174505_450219_7CAFA86B 
X-CRM114-Status: GOOD (  14.73  )
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

On Fri,  3 Jan 2025 14:06:00 +0800 Wei Fang wrote:
> The i.MX95 ENETC supports both MAC hash filter and MAC exact filter. MAC
> hash filter is implenented through a 64-bits hash table to match against
> the hashed addresses, PF and VFs each have two MAC hash tables, one is
> for unicast and the other one is for multicast. But MAC exact filter is
> shared between SIs (PF and VFs), each table entry contains a MAC address
> that may be unicast or multicast and the entry also contains an SI bitmap
> field that indicates for which SIs the entry is valid.
> 
> For i.MX95 ENETC, MAC exact filter only has 4 entries. According to the
> observation of the system default network configuration, the MAC filter
> will be configured with multiple multicast addresses, so MAC exact filter
> does not have enough entries to implement multicast filtering. Therefore,
> the current MAC exact filter is only used for unicast filtering. If the
> number of unicast addresses exceeds 4, then MAC hash filter is used.
> 
> Note that both MAC hash filter and MAC exact filter can only be accessed
> by PF, VFs can notify PF to set its corresponding MAC filter through the
> mailbox mechanism of ENETC. But currently MAC filter is only added for
> i.MX95 ENETC PF. The MAC filter support of ENETC VFs will be supported in
> subsequent patches.

clang reports:

drivers/net/ethernet/freescale/enetc/enetc4_pf.c:1158:6: warning: variable 'pf' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
 1158 |         if (err)
      |             ^~~
drivers/net/ethernet/freescale/enetc/enetc4_pf.c:1179:24: note: uninitialized use occurs here
 1179 |         enetc4_pf_struct_free(pf);
      |                               ^~
drivers/net/ethernet/freescale/enetc/enetc4_pf.c:1158:2: note: remove the 'if' if its condition is always false
 1158 |         if (err)
      |         ^~~~~~~~
 1159 |                 goto err_wq_task_init;
      |                 ~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/freescale/enetc/enetc4_pf.c:1128:21: note: initialize the variable 'pf' to silence this warning
 1128 |         struct enetc_pf *pf;
      |                            ^
      |                             = NULL
-- 
pw-bot: cr

