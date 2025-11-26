Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6969AD1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idZH2h/5MOn2BpvO2NsaMW9MH0PQn/xXe34joZcJV90=; b=2ncEwq8c5Q6nRS47AxBqJJRgcN
	vJ4MUZfbWHml/srmZcRtJB5h0P1e3s/5dmXOWqIqSvsl/ljKOPY25SZ1ynGuMsYOLBO9DQv1SqvAE
	AXyjKDNcIKMmQ8T+s8PTXzRJmGw1l+Rsl5xzcLQ4eXYGy4o90ZJL8xfmU4aCtM5+5CSSJeezdIqxv
	Pc8vJP+Pl+QSNLZxtOvkP0uu0FDgErAVj04yh1MGHYx8t7gcj7zvGRTwVQvSUCMfzpDdTLl2hgB9j
	IlSqKAbojfPqSV9NTctX1GtPPjEYUhYKMSy8WYHDD2RDkY3cIfWgDxX2RdMM/9TfPqfAg7S6U9Uvp
	8OFxKEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODzA-0000000Evim-3vm2;
	Wed, 26 Nov 2025 11:47:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODz7-0000000EviH-1qFB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=idZH2h/5MOn2BpvO2NsaMW9MH0PQn/xXe34joZcJV90=; b=k+oI7hx2JT1gTwNlxw/iufN1GT
	7bt0/SdgGFl5jlQEdkfaSucsJojlmITuzJwAn229N3JVCTWmhCnMfSZPeeh/ccu5uC9qEEcc8MXLp
	7FjQvYmR5gJQeJ6crmXSOMbMcKuRcuOqXqnhiQffmCeEYUsdeRF8AKlMEbUZyWpx1NWudpsImv9yg
	USevgdzZANgGK9MVBYLJwilcW/iTX37QoMpWvidMCi2rIsFEcIp1cM+9I1zcRGjMVf4VbaCr+J9MN
	eBrKYxh2q/KGiFxSfEE6/fKErhEuNP/VqFGrhyMpjesHyJH9K8omSJQozflB7ZRiHIbtn8SR7lHUP
	31XfM12w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41852)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vODyj-000000003vq-3gDf;
	Wed, 26 Nov 2025 11:46:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vODye-000000001gr-06HK;
	Wed, 26 Nov 2025 11:46:28 +0000
Date: Wed, 26 Nov 2025 11:46:27 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Jochen Henneberg <jh@henneberg-systemdesign.com>,
	Piotr Raczynski <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next] net: stmmac: fix rx limit check in
 stmmac_rx_zc()
Message-ID: <aSbok34XaG1DrlKp@shell.armlinux.org.uk>
References: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_034657_855736_6ABE9C25 
X-CRM114-Status: GOOD (  23.38  )
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

On Wed, Nov 26, 2025 at 10:43:27AM +0000, Alexey Kodanev wrote:
> The extra "count >= limit" check in stmmac_rx_zc() is redundant and
> has no effect because the value of "count" doesn't change after the
> while condition at this point.
> 
> However, it can change after "read_again:" label:
> 
>         while (count < limit) {
>             ...
> 
>             if (count >= limit)
>                 break;
>     read_again:
>             ...
>             /* XSK pool expects RX frame 1:1 mapped to XSK buffer */
>             if (likely(status & rx_not_ls)) {
>                 xsk_buff_free(buf->xdp);
>                 buf->xdp = NULL;
>                 dirty++;
>                 count++;
>                 goto read_again;
>             }
>             ...
> 
> This patch addresses the same issue previously resolved in stmmac_rx()
> by commit fa02de9e7588 ("net: stmmac: fix rx budget limit check").
> The fix is the same: move the check after the label to ensure that it
> bounds the goto loop.
> 
> Detected using the static analysis tool - Svace.
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> ---
> 
> After creating the patch, I also found the previous attempt to fix this issue
> from 2023, but I'm not sure what went wrong or why it wasn't applied:
> https://lore.kernel.org/netdev/ZBRd2HyZdz52eXyz@nimitz/

It was because:

https://lore.kernel.org/netdev/871qli0wap.fsf@henneberg-systemdesign.com/

indicated that the author was going to do further work on the patchset,
so the patch submission was marked as "Changes Requested":

https://patchwork.kernel.org/project/netdevbpf/list/?series=730639&state=*

My guess is the author never came back with any patches.

netdev is based on patchwork, which means once a patch series has been
marked in such a way that it isn't going to be applied, it won't get
looked at again, and it's up to the author to resubmit. If the author
doesn't resubmit, no action will happens, especially for a driver such
as stmmac which doesn't have a maintainer.

I think this is a safe change.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

