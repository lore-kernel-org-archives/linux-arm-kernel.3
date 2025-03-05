Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15D7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezfHGj2cBWaEtzI2GUJQGGe0pXWbLGhCMJSGAb0XXr4=; b=3t782OTBlsTV2UZ5w7TPEvLrki
	bVumLD+f/ryNpytZhllvVwppNR91oM5C2mcja7aHJjge84JczZ1FGD9s7SRT1vvIh0zac8sERRLF2
	A0HqoBuHdIVN9bE2kzvIeW5VG/KVUXaptvKjveqGw4vu2IA2Z+uK1QPfhzRgGnQbGd8lzs/uT/L3j
	RvIKj0zGL55ygYIXPvjVuGIbum1KK3ShytzfJtARQSIoVSw4PxdwHK5CeRZ2AhiVauvRXsTgNTU3m
	CAUxv0IJjMnhrl7QUj+zh3gyBUpX1Hg5q9V1OW3s1o1RhGL8Df1lpn0Cj0t6rEYLnCQUgr57GEHYt
	4vaqKJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq88-00000008Qh7-2mEv;
	Wed, 05 Mar 2025 14:53:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq0u-00000008OmZ-0yIF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 14:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ezfHGj2cBWaEtzI2GUJQGGe0pXWbLGhCMJSGAb0XXr4=; b=A3uhkyAzl3KEOem8nBTITJrNPr
	rOlV3ytNCfBMER0m6+ly1EFhk0egToXu/MVklM+2jBTHrFjUZxw7OjbwjBkfXCYh6LHi53LZ/k6Ov
	wPiQJfAwVxnDXqn6gEAfQ0ISy/FYiFeRzaIJwnY9m9Ppz0onF5R8WuOSaA0x+aifbOMu0piKE54mp
	mPXJNkp0bWpZyYJQpfdQiiEjOaNaa/X+NgLgJTgjmcoZwuAAypKB+KU5Qe+Te9E44SZtXD8t1fq7k
	RQwbl1mygJDF0EJvIVwvWAz1fOdjq/W1EaC0wNRlhHBlP8IDFRgcjhC/npB8TOSRSfNll/e8fOsPP
	NCPH8JuA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq0r-00000000abw-0tyZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ezfHGj2cBWaEtzI2GUJQGGe0pXWbLGhCMJSGAb0XXr4=; b=jW9wJ7/ppvRin+Y4JUSWXTLaM1
	yehJW1Smm4DGYwEuwb5ZvnlCk/wtdsusMLbKAZjT74M3C2oeSJFjV1z67c8sepbl0eBldOJOSZQdq
	JShkPG3qy+eEoQwya185JoDQGas0okfzmC29Q6E+26u5/JB4hlyr6S5VfDe9Ch25F8I4Prf86oI2G
	T7OAdYOsXBDpahK2sJya6ri14yku28ZMfZ2PIEqjK0tfSFMvKSDAUdxE3d3nqbI9oi+Qg8e/SAtY2
	pS8pI8x/yJhA8HBfvyDWjao6InfAmpX3NHEWmFtK97D06F3vJMQd+CAkQPfOy5VeVYS6rNCf6tRCg
	0A+NQqJw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45016)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tppyZ-0004Sc-2H;
	Wed, 05 Mar 2025 14:43:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tppyS-0005rB-2p;
	Wed, 05 Mar 2025 14:43:52 +0000
Date: Wed, 5 Mar 2025 14:43:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com,
	gost.dev@samsung.com
Subject: Re: [PATCH v8 2/2] net: stmmac: dwc-qos: Add FSD EQoS support
Message-ID: <Z8hjKI1ZqU19nrTP@shell.armlinux.org.uk>
References: <20250305091246.106626-1-swathi.ks@samsung.com>
 <CGME20250305091856epcas5p4228c09989c7acfe45a99541eef01fbcd@epcas5p4.samsung.com>
 <20250305091246.106626-3-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305091246.106626-3-swathi.ks@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_144621_352710_9CC0456E 
X-CRM114-Status: UNSURE (   7.40  )
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

On Wed, Mar 05, 2025 at 02:42:46PM +0530, Swathi K S wrote:
> The FSD SoC contains two instance of the Synopsys DWC ethernet QOS IP core.
> The binding that it uses is slightly different from existing ones because
> of the integration (clocks, resets).
> 
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>

This looks much better!

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

