Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D59C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=se78CTgWSMz3fwwLUHiO5oHWeH+WmhQaI4Bm8mflklg=; b=kQh+FtI+AupFzSHqnIqtDWdMdS
	qyf/qVUKEqv+pAUQrppzGD2D19mQzZjPjIbct36g8VT8cG7oKRKC6E3FwZv20ZRXluDSKsTk1JS4O
	RYmHaAdruz69JQ0KaSVJvt3w6tZd5WZkFUScSj9HYFRI0Mfepaj6U22twiHwIId4RkWcqYwGYi4NK
	L59snOdNbnrK8j80k6oPSvgCcqYV7WORhBA9VThTKvKRS0IJUanuWUtE5oZlz2jFvx+32upJpjrZ3
	Pj8qg1LcfGTs6NZocT3pw9RseELljPd4f69GOinx65+zl5yrBQCMcZB8ZVlXlDAJGllBAlHedzLBI
	BXwaR+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaPl-0000000Erwp-0SKn;
	Fri, 07 Mar 2025 16:19:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZKC-0000000EYYs-3t0p;
	Fri, 07 Mar 2025 15:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=se78CTgWSMz3fwwLUHiO5oHWeH+WmhQaI4Bm8mflklg=; b=x9Anm586sYnv+cpZc9KXc48alS
	wvsfTYgeanUiP4jsGZqdyqbURpfrkFuA+oIVM3tAqrpgP/ei3SdmEjrVugVb1T4eNFuTg7gtmDO2c
	T7a4F/KTMociRYbUrWS1heoWUbcadNzERNMbOmQuq2vZKK7+3D428CHMxRBQP+2DdkVgkcLyfl4nn
	bDxMLyNlWEnP/MaPIVd8zOV8bn265VkptQ3RoAnqdCZi4l2574oRqixKb8ZQTg0H5Nd3evL2gVNUv
	PLY4iDtOB0drDRnq7p6bwDfViFApqU5L0t2R0L4fMDZJmgngG7RVHJEtQYWhWZfQTg0Pp/KV1eGrQ
	WKe7OdsQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45108)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tqZJn-0007Zx-1M;
	Fri, 07 Mar 2025 15:08:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tqZJj-0007uQ-0o;
	Fri, 07 Mar 2025 15:08:51 +0000
Date: Fri, 7 Mar 2025 15:08:51 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v7 2/4] net: stmmac: platform: Group GMAC4
 compatible check
Message-ID: <Z8sMAyH0qsMyXmjX@shell.armlinux.org.uk>
References: <20250307011623.440792-1-inochiama@gmail.com>
 <20250307011623.440792-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307011623.440792-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_070920_969664_1634B71B 
X-CRM114-Status: UNSURE (   6.65  )
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

On Fri, Mar 07, 2025 at 09:16:15AM +0800, Inochi Amaoto wrote:
> Use of_device_compatible_match to group existing compatible
> check of GMAC4 device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

