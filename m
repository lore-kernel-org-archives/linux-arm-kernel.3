Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE5FC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eX4lFJvGPAAq+TJkwdWXeBO2K4L3FS4jS7wg6NEAm3A=; b=GV7eEAtj5+KvdnhsQYsHSaJAjz
	F4EW2iW7L7yYS/oLRHwsGwOA3rpImYvs47f0gjSv+HNATykJj5CeYV2vIxv5TsaF4BQ74Pgk0rseb
	HB9f1OZprCb5EutA43DWWvJzDLxVm2vkeQqthYZDZ0vMk/YwESc7A7yDP559pExL85M5wgcApyrq5
	m8Pk3bW/uWBVnLvchFh0Cn4dlq692TCVyUwzaK+couJTN7cqEll82v+2AJyLhTleiX1nFMda0Nd0E
	DqDQ4xxnQwkuJLdyk8ZLSmKNtsCcZ9aPmQsqWbPVWnhWX4VRY5mnmYqm8t99zbqehQHplbP3vjxbC
	/PSDRGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Miv-00000008LLk-1oL3;
	Wed, 23 Sep 2026 13:09:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Mis-00000008LKQ-3dzk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eX4lFJvGPAAq+TJkwdWXeBO2K4L3FS4jS7wg6NEAm3A=; b=ijRDIoVchibeZIUomjltED/2Hq
	VfxSznYOnK+TKFtBwkXpLs4nqsS0KB4L5IpvK3W62pbep+V5Z3dF8tMMIybdkQA9cUYh/IqgOp9K6
	ZcJ+7Mrpn3YQg1KknkSRVw7gQn0AIx2TzD0Rpg/giMDIqJxODtoWeq0eZxmzbsHxsFkw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9Mib-006oGi-Qs; Wed, 23 Sep 2026 15:09:01 +0200
Date: Wed, 23 Sep 2026 15:09:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: shengchao.guo@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
	mohd.anwar@oss.qualcomm.com, maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] net: stmmac: support low-speed USXGMII validation
Message-ID: <e05baad3-49ec-4db0-ac70-ffd8e0f52b10@lunn.ch>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com>
 <20260923084921.3942100-2-zhangfei.gao@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923084921.3942100-2-zhangfei.gao@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_060918_924252_11C53ABE 
X-CRM114-Status: GOOD (  10.54  )
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

> The XPCS also consumes the PHY-generated Clause 37 in-band link and
> speed status, so USXGMII must use in-band signalling.

Is this a qualcomm specific feature, or defined in the databook of the
licensed IP.

>  	case DW_AN_C37_USXGMII:
> -		return LINK_INBAND_DISABLE;
> +		/* The PCS consumes the PHY's CL37 in-band link and speed status. */
> +		return LINK_INBAND_ENABLE;

I ask, because when i look at this, i immediately think is this a
behaviour change? Is it going to break existing systems? Or was the
old code broken?

The commit message is where you try to guess what reviewers are going
to ask, and answer the question before they ask. Seeing such answers
in the commit message gives me a good idea you have done your due
diligence, and the patch is probably O.K. Without such comments, i
have to assume this is poor quality code and really exam it in detail.

     Andrew

