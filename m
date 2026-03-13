Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F1E105F7A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqJfjj5bSFwQr78REbDblBhmHQrXei/rYwDnGeis3LI=; b=uAC5Qz2ddZO6mJ/3yu0oVZZnB9
	/tuOLYooeo1JmrywEjGCMXYk45LTTHREjSJMUNEsaiDW7YoDkcXQtwG1gEmNm+ifdQ0myBcB58gSc
	/Rr4vL5mXM9zWzbpruo6BtlyHmnuH+go/Oa2V79G/P+kFW4/nEksaDkmNHIc9m6ZKEhca+fsnEv0y
	0QEmHOYo3lQdfMxKF/CBwDntDIXVFh1fdCwNyy0E0NP9db0lPP7NOiXcv8356HEC19ckktBHAYzzc
	9cGKD6FAJzK3GNK2BDeDOpK/CgaRthPrMR6K1yy8BqKdGdl32CzowfHaiSPhuROh1UjNqNcqtruoE
	qOFCVJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11Ny-000000005PK-10MQ;
	Fri, 13 Mar 2026 12:12:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11Nw-000000005P1-0CJ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 12:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yqJfjj5bSFwQr78REbDblBhmHQrXei/rYwDnGeis3LI=; b=NSW/IpveyLpEwFh9iVvLICuEa/
	V5L5gDT9bi0fyQok+5GH3TDAHnytb8vPzUXEWkFPt8n/4/rBGmdP+V24Z83zp67hvy6IWfzXGZryL
	BZosecN7q0b5gjVntuE6X1OzPFKHoAa2RfBaKV2DrlBF67Q/bDS8O+0E7wYq0ngi3AlAH7bmW3LkI
	ud8QqeD9XJoFouriJkrANerEpg1UDnJrgyNvFW+VTa/O2Tue9uN8T8okEXm84tmjkiZXYb9RIIs3H
	pBQTdAjFiHv9s4DuM4kvgNOl4FL290pQ56RNH9KG2AB0DYDBUMDtzTQ1UL/RN4gOUA2qAeZLuDRoL
	3S0HGyHA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46278)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w11Nl-000000000tT-1RFx;
	Fri, 13 Mar 2026 12:12:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w11Nh-000000008Cx-2mts;
	Fri, 13 Mar 2026 12:12:41 +0000
Date: Fri, 13 Mar 2026 12:12:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH net-next v3 11/15] net: stmmac: add helper to get
 hardware transmit descriptor
Message-ID: <abP_OfmKyiVtaupH@shell.armlinux.org.uk>
References: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
 <E1w0zBR-0000000D4Fy-3tXg@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w0zBR-0000000D4Fy-3tXg@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_051256_088129_D411F3D8 
X-CRM114-Status: UNSURE (   8.46  )
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

On Fri, Mar 13, 2026 at 09:51:53AM +0000, Russell King (Oracle) wrote:
> Provide a helper to get the hardware transmit descriptor that takes
> account of whether extended format and TBS are being used, returning
> the base struct dma_desc pointer. This avoids multiple instances where
> these tests are open coded.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Damn it, I merged the fix for the AI review on this patch into patch
13 rather than this patch. :/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

