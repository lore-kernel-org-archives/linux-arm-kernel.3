Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242A9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 19:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FY8oP8TntW4ytWNHBRG2ykUEsygpkJOVRPFVHGGy1iw=; b=UTG8ueBSTYkKA+
	AxzoJsT3+mKU/xXM4ReFM0YINv7ANO/0n/+qDMMnfC75LE7JsKK5KKS+KIkFpV7WGC7KdkVK+C3EI
	WjpdQDNCP5SCHXCDOprjub0SlMDFasY+Gx7n6bkqujEqK+5nbCKf08mIDNP+erZ0pju3Im32IJ+MN
	mmF5H2iK3tiPXlXNNh2uINaBfRgplBNGI/IKBKY3VuNpwwtPwQkff1gFwj8uaL9iTyYUNvtg+oG0r
	5thqmu6s8uxEChyiZIzF3+sAHzsD8H/zwQrFImUiJ4qKIMA7DMrV5jtMk/u3Wj7Z+CEdU1HYpkSUz
	3laS0EqSmShHONNbXqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOZo-000000037tA-3AC7;
	Mon, 14 Jul 2025 19:11:00 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOXM-000000037gm-1Phk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 19:08:29 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso3108774fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 12:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752520106; x=1753124906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FY8oP8TntW4ytWNHBRG2ykUEsygpkJOVRPFVHGGy1iw=;
        b=myDlZv4wvgo9kCGxAZbcMf5VCxvHQAZpPxBkxOl7Wmj6A4jsLT/XVmvD86H8oy/JEC
         1lpMqMj5B7r6p8UQs0ALymL25ejjW4c+NWWrBLsO9+A0qHLnLbetdeWYYzwZeRlLE8JW
         NOd6ZLtKEoSaXuw7BP7olSUVj03KbC5PDD+tHc60Jmv/ESFS1ZSTKySpfG2LFvzkG6Sa
         ud3UK389NMFif5zqYkjELgZ8ly0mXLDnbA6dz0ltJ+XTDJyDOUCLNuZC9bmwJBkk5wU/
         d+agfrL/iRxfWIcr9B0syFPZ3Eh8iXCj8sBFoutVoIGX9uXeADsYZrsn+UChJaW435yM
         wzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752520106; x=1753124906;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FY8oP8TntW4ytWNHBRG2ykUEsygpkJOVRPFVHGGy1iw=;
        b=tpPF4rCIzvRxqxjwX7G/qZp1zIRMmRHpuzC4+21F88wMyUBtR5dBQdDmLmw/q5/MV7
         zRmQrX9Sj+cPr0EwS/Om7rVM/YPVtuVJrUjl3EaVByB+YgVsbnyVbkyeR0FhOVWOGn32
         zybrjI3T5MtzksOMSotPKpx+y93dINbXlcIPvKbFxex0i0SfR0AELAIT4Bgnu4hPsYwL
         vlaozEo4y2N9c0R55A8iw+UphBEqetlCZxPIYfgztg/aG8EcyGSVhImfl9fkNhmR+oz+
         MaUSdW91MVV+QcE4JCswORm7H2/A/ByhxOBeWdNN9fYPd9sweW/4lekuy3DKOkbUHK7p
         mf0w==
X-Forwarded-Encrypted: i=1; AJvYcCUgpbIzvF1TPh18nq/T3L6zRJwo4zz24TBEx1M+IYTcy8tG8OVcQMJmenFtvFit/dFKcGajg52nEMYSPeG/FPwF@lists.infradead.org
X-Gm-Message-State: AOJu0YwojUb+k8c/e8uCTkIkpbvHMjGg8fWYIijp0C7o2fN3RMGQKtCp
	uKLUSkCiajIMCGr3b9VKXe3bIungSTJ3dYKNwVxc2Fvb1dnFDRL2XPypAhR86w5tE/E=
X-Gm-Gg: ASbGncskmV5Oe0twkyqiMlRDiuNcAurf2B/NbC0WHQBZRXK8YBov/sw0Hu7AVRvaC7a
	xlqm1z9szwS/flZXOYujpYJmq2EMFl12IRaIyFbU69xoh/5xi1dn8sEw8SA8ydtS75AIaVTiJCw
	f44KcHIvLDAmgJbE0jgosmoBl4nEBSLXITDLcXZhXfSOEEAAXRVDZT0+T+8ffOm8jfyiWs50DUo
	/KdR5xaUHkr/Y5IyTYAZ4FiIRaKZXbDvu829TqTi9LtfU+gEs0BGaOh92lMkSSuY8r4eDS+RD5L
	33GwE3L7pOfAebB0udYi2fkF2S2DXT2H28fqpyLJesw5D0Di3ZO7MBESx0ufJGsKduN52fIxmvy
	QkT0kmt8H/fJaPIG1lnZUQT3f27RbQQ==
X-Google-Smtp-Source: AGHT+IEzO8bUgBmoo1uzE8f4f/z4iMC9jmOc9/Xzy7X6HZpF2LbcgnghTbE4rOCIVgXQl6Q0I/xJmw==
X-Received: by 2002:a05:6871:5d06:b0:2d5:b914:fe2d with SMTP id 586e51a60fabf-2ff270892c7mr10030939fac.33.1752520106283;
        Mon, 14 Jul 2025 12:08:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116dd664sm2036650fac.42.2025.07.14.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:08:25 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:08:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	davem@davemloft.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <13e48447-37fb-49d8-8c6a-ce5d198506ae@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630143315.250879-5-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_120828_386962_ED3795F2 
X-CRM114-Status: UNSURE (   9.79  )
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

Hi Maxime,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/dt-bindings-net-Introduce-the-ethernet-connector-description/20250630-224035
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250630143315.250879-5-maxime.chevallier%40bootlin.com
patch subject: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports representation
config: x86_64-randconfig-r071-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061812.0aBYBa9l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507061812.0aBYBa9l-lkp@intel.com/

smatch warnings:
drivers/net/phy/phy_port.c:130 phy_port_get_type() warn: bitwise AND condition is false here

vim +130 drivers/net/phy/phy_port.c

055cbf51317b1e Maxime Chevallier 2025-06-30  122  /**
055cbf51317b1e Maxime Chevallier 2025-06-30  123   * phy_port_get_type() - get the PORT_* attribut for that port.
055cbf51317b1e Maxime Chevallier 2025-06-30  124   * @port: The port we want the information from
055cbf51317b1e Maxime Chevallier 2025-06-30  125   *
055cbf51317b1e Maxime Chevallier 2025-06-30  126   * Returns: A PORT_XXX value.
055cbf51317b1e Maxime Chevallier 2025-06-30  127   */
055cbf51317b1e Maxime Chevallier 2025-06-30  128  int phy_port_get_type(struct phy_port *port)
055cbf51317b1e Maxime Chevallier 2025-06-30  129  {
055cbf51317b1e Maxime Chevallier 2025-06-30 @130  	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)
                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^
I think BIT(ETHTOOL_LINK_MEDIUM_BASET) was intended.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


