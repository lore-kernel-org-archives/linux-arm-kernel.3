Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD95F54ADC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcUAX0q1yGtUD3vTJWJKedAHMDPJIsOcQZyGNEBEUBc=; b=1h+XA4K+lo7XRRTROApEEJiabl
	dBd8kmffjuAn+f1uP76gPIPdhKz3h1Qvw+jRmNp9X0q3ipAw0K5JLPazc7c001tCZs1QlIqm8EDkN
	x7u2sPir8Ofur+0vG6oPc7XvyLyJs/T8VkghEYRVPjfP0SBLM+9IO3wR00wD6TxVenCXyiSbkfK05
	4i8eOG2W82Pg8Qk1gPYr7Vn6A+SVRedCi9cSWE3AohlEeo4RAyrBzYPQBdPtt8YRw0SwgPO9ZZeNi
	nPkRjj2Miy2tbi7NK2Q3oOziGq2GMSe3fxBkKP2kTRil+jeL+OpsSWnFbGnLV0T1/Ii74ML9ejg3I
	foAK4kTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w555X-00000001wYT-1KEL;
	Tue, 24 Mar 2026 16:58:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w555U-00000001wXT-1N0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F3B843E35;
	Tue, 24 Mar 2026 16:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F19EC19424;
	Tue, 24 Mar 2026 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774371519;
	bh=XTX3RY7lgLXPIuC8OIWPU6uF7FH2kNY+iILh8Aykr9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKc66ACIVg0DMObY7mYeEgbbYlwLWvGU2c2JLYflggsoa+sRKJ/wwQUy1JGBXocBC
	 AD4JqBTcSW0NwMq8szw8olUqMB43x3FpezZASqKUmSyDmHtBBCQ2iVpP6P/mVFzfdU
	 CTxAS3J+MYl7n3Ka7tbXRN/ehxVUjANMaGV/pVh3v0D7LhBIfxyF55ywOdI+0Q5NFm
	 Mc4fkj3s+oM3rMvggMKHFtHMZWB+KE6al6bh8Z1Ws3DDXAVBSm7pa2zJBs5uihcyaK
	 dxO83w/ddPbDzgZIGtZsarGjGDJQTX2mdDEY+aBAZIvBrXD6MIwcZ7+4OHMfa4DNmG
	 gVVOCNQ4PBv9A==
From: Simon Horman <horms@kernel.org>
To: wei.fang@nxp.com
Cc: Simon Horman <horms@kernel.org>,
	frank.li@nxp.com,
	devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	kuba@kernel.org,
	claudiu.manoil@nxp.com,
	andrew@lunn.ch,
	krzk+dt@kernel.org,
	linux@armlinux.org.uk,
	edumazet@google.com,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com,
	f.fainelli@gmail.com,
	imx@lists.linux.dev,
	chleroy@kernel.org,
	netdev@vger.kernel.org,
	robh@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	xiaoning.wang@nxp.com,
	davem@davemloft.net
Subject: Re: [PATCH v2 net-next 08/14] net: enetc: add multiple command BD rings support
Date: Tue, 24 Mar 2026 16:58:04 +0000
Message-ID: <20260324165804.245011-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323060752.1157031-9-wei.fang@nxp.com>
References: <20260323060752.1157031-9-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_095840_403858_6CE87C60 
X-CRM114-Status: GOOD (  22.66  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: enetc: add multiple command BD rings support

This patch adds support for multiple command BD rings to the NTMP driver.
The switch has two command BD rings, and netc_select_cbdr() is added to
select an appropriate ring when the current one is busy.

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
> @@ -117,6 +117,25 @@ static void ntmp_clean_cbdr(struct netc_cbdr *cbdr)
>  	cbdr->next_to_clean = i;
>  }
>
> +static struct netc_cbdr *netc_select_cbdr(struct ntmp_user *user)
> +{
> +	int cpu, i;
> +
> +	for (i = 0; i < user->cbdr_num; i++) {
> +		if (spin_is_locked(&user->ring[i].ring_lock))
> +			continue;
> +
> +		return &user->ring[i];
> +	}

Frank Li raised a concern about the use of spin_is_locked() here. Is this
lockless check reliable across all architectures? spin_is_locked() behavior
varies across configurations - it can return false negatives on UP builds and
may not provide the ordering guarantees needed for lockless checks.

Would spin_trylock() be more appropriate here? Or if this racy check is
intentional and acceptable, should it be documented why the potential race is
safe in this context?

> +
> +	/* If all the command BDRs are busy now, we select
> +	 * one of them, but need to wait for a while to use.
> +	 */
> +	cpu = raw_smp_processor_id();
> +
> +	return &user->ring[cpu % user->cbdr_num];
> +}
> +
>  static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
>  {
>  	union netc_cbd *cur_cbd;
> @@ -125,10 +144,10 @@ static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
>  	u16 status;
>  	u32 val;
>
> -	/* Currently only i.MX95 ENETC is supported, and it only has one
> -	 * command BD ring
> -	 */
> -	cbdr = &user->ring[0];
> +	if (user->cbdr_num == 1)
> +		cbdr = &user->ring[0];
> +	else
> +		cbdr = netc_select_cbdr(user);

This isn't a bug, but Frank Li suggested that the special case for
cbdr_num == 1 might be redundant. Since netc_select_cbdr() would handle the
single ring case correctly (the loop would find the only ring on the first
iteration), would it be simpler to just unconditionally call:

    cbdr = netc_select_cbdr(user);

>
>  	spin_lock_bh(&cbdr->ring_lock);
>

