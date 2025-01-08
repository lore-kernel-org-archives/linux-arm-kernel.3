Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A5DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/APCxPaAmRg726CeSOKBkZk9FkcwE4e/XEB7eacvNI=; b=cESHfXq2Tj2vPmuoAo8M7RltEJ
	LHFbZ43+IP4O526BL1OX3ePBe2uPGbyvjhWUWRf2CtQJJ+HZKLugPsNFsYMBReWAsWj5X6ETFsYl9
	VkPjWt8mik7m85QBq0YS3UmW+KxsTD9SHrvY+tI5zOMSHiS+b8dxCGzHcnmhITqXGYiF3y6PIUFmu
	JKZ+UZTT/9Y8h/j7kQKt2VGChYSC8zpGTO/WRkKgKhqThIByop6cK1VMlHNBMLGOwE2raAFfaOHrw
	eNLlcBd/S3k0SVhCYnnBPFcItXRJnkrtVb9zPLn8CY8HJ04VPNQcjgKRXRz3N54pDvAP/s+u76pO5
	fHcfZpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQdx-00000007Sbx-0Grw;
	Wed, 08 Jan 2025 07:38:21 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQcj-00000007ST8-3ure
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 07:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736321826; x=1767857826;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3u6bfLayhG54+WPRNwaf/qn6txkoyZ4B6wiWkKksZco=;
  b=LukLDZYA1veIX270vBpPODeecPaAbLRY2iAr2rmWk2wf5B5zHbK3vcBX
   2agtyfDMCYdlI3JsrkmHSs95Ok2Mu5eXYIybAq9ll0q1paNFaqYm26rC/
   6O+z5JHiG4KtZDBg+tEFXllErfI9DncFw5qSyHVGLhevHa3TwvOSvmZC1
   xSD/zGyFksze6WTaM+i2iAG/J0dIRBbf5lhMpQQuDUh5OMGUkDe7pXCf9
   73TTmDtNhuCZmaf3i4uOWnAPQzElC6wR4cBHOY85Gdzz/z2IK4TYOJ84I
   Vl33CeocLuOLonjP09lf2JtBqt/0fYhEpYXE21TySNQXO7WCAIyYmRBZx
   A==;
X-CSE-ConnectionGUID: 7UJrqukJS4i/dAYi64BhlA==
X-CSE-MsgGUID: RkO6Yf3hRHuZP28MQZem5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="54081470"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="54081470"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 23:37:03 -0800
X-CSE-ConnectionGUID: tfkFk3DfQlG2R76nsCMEHA==
X-CSE-MsgGUID: I5uzctEQSUqQrc844McEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="103225655"
Received: from unknown (HELO [10.107.18.17]) ([10.107.18.17])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 23:36:59 -0800
Message-ID: <66b95153-cb12-494d-851c-093a0006547f@linux.intel.com>
Date: Wed, 8 Jan 2025 15:36:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 02/18] net: stmmac: move tx_lpi_timer tracking
 to phylib
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
 <E1tVCRZ-007Y35-9N@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <E1tVCRZ-007Y35-9N@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_233706_021191_48DF5391 
X-CRM114-Status: GOOD (  14.52  )
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



On 8/1/2025 12:28 am, Russell King (Oracle) wrote:
> When stmmac_ethtool_op_get_eee() is called, stmmac sets the tx_lpi_timer
> and tx_lpi_enabled members, and then calls into phylink and thus phylib.
> phylib overwrites these members.
> 
> phylib will also cause a link down/link up transition when settings
> that impact the MAC have been changed.
> 
> Convert stmmac to use the tx_lpi_timer setting in struct phy_device,
> updating priv->tx_lpi_timer each time when the link comes up, rather
> than trying to maintain this user setting itself. We initialise the
> phylib tx_lpi_timer setting by doing a get_ee-modify-set_eee sequence
> with the last known priv->tx_lpi_timer value. In order for this to work
> correctly, we also need this member to be initialised earlier.
> 
> As stmmac_eee_init() is no longer called outside of stmmac_main.c, make
> it static.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Hi Russell,

I have completed the sanity test on the EEE changes to the stmmac driver.

It seems that most of the changes are acceptable with respect to EEE behavior.

However, I noticed that this part of the code requires a minor change to 
fix the logic:

	/* Configure phylib's copy of the LPI timer */
	if (phylink_ethtool_get_eee(priv->phylink, &eee) == 0) {
		eee.tx_lpi_timer = priv->tx_lpi_timer;
		phylink_ethtool_set_eee(priv->phylink, &eee);
	}

Otherwise, the "tx_lpi_timer" will not be set correctly during the initial 
state.

Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

