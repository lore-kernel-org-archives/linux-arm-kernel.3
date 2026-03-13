Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE73107BCD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tdpzCjfd9Ry9f1CUsXXFtWyu0Swm3ZLAk7lZVu01fo=; b=OykH8SdqQeJ3tcEcwrVpzUcE5L
	jpMKfQki0Lz5NsX8wFdGqHPAHZWA7yeb1AEGhXTx3XdLBmNMIoAqIMm4rQoJDJ/J0jznxCfRNTlls
	JhtdmX9Pl1BJkaWw9hv7/HjGPzuRY+fIpbytO22fITrW7nLLz7wwvcw+YvtXsXHsFp8/YE2w0K8lx
	4WoKz/0wN5JrEy6rG/xT+wUvmvtPPUScLIoMZkAawZ8xTDiBuymKaT3gYnLLyJAtM453mLDzPfHh2
	Ax0rQbPKp78UCJqxECo3c66+gpABKU0qgnp6FwtCD+lOlUluyCOwLKkiHYtpPuyDp8aXFcQ/lyaEX
	TYum9bTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17St-00000000wep-3ZRt;
	Fri, 13 Mar 2026 18:42:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17Sr-00000000wdu-2YBy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 18:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6tdpzCjfd9Ry9f1CUsXXFtWyu0Swm3ZLAk7lZVu01fo=; b=k0QvlEX9IYsfeTo+hPcc2ovRdk
	E3ERkxj1kciouvsK0NuqjZC2XrplYyqUqMJakrTRYFPPB5s21rLvjoN5A+I+hhrLvk+iCJo6QdfWp
	tPAiSpAdnyzYKnClPN/vQzFaswO01+mHVby6ji+Tww2Rx2lbhVQlNTXAPKV7IqRNhkHk7YtUHJsec
	w2gwBldUXZYtBFnXXzqfSwL4UlI7iuFDKdNbGKOm4Qq9roL++w/Sn8TodY+0H0q9kbi1gQePDeUhN
	jNEKg4FpGInqMpWjyH4sP4cD39rBbcY9I3d3BSaidaM+dSDXhitpMEb9XQnngRAKTuIwHCELdlSFz
	29NWMItA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54202)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w17Sk-000000001PR-2lDL;
	Fri, 13 Mar 2026 18:42:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w17Si-000000008RT-2T8o;
	Fri, 13 Mar 2026 18:42:16 +0000
Date: Fri, 13 Mar 2026 18:42:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 8/8] net: stmmac: report PCS configuration
 changes
Message-ID: <abRaiCW9oJ8IfFcy@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <E1w11dz-0000000DEie-3fyA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w11dz-0000000DEie-3fyA@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_114225_650509_0999B5EB 
X-CRM114-Status: GOOD (  10.07  )
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

On Fri, Mar 13, 2026 at 12:29:31PM +0000, Russell King (Oracle) wrote:
> +#define REPORT_BIT(x) \
> +		if (diff & GMAC_AN_CTRL_##x) \
> +			pr_warn("dwmac: %8s %u -> %u\n", #x, \
> +				!!(old & GMAC_AN_CTRL_##x), \
> +				!!(value & GMAC_AN_CTRL_##x))
> +		REPORT_BIT(ANE);
> +		REPORT_BIT(SGMRAL);
> +#undef REPORT_BIT

I see checkpatch wants the if() inside the macro to be wrapped in a
do-while loop, which is overkill for this - this is not a macro that
is used throughout the kernel, it's only used in the next two lines
where we can plainly see that this is safe. There is no need to make
this unnecessarily more complex - and thus less readable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

