Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44544CD5BCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctBc4upCgqzKeJAnk9xRDnJ5/kLYkjPG0jykALkFcYg=; b=MXAINSI+SNEK68tSga4BuyarlB
	TiuoXNopcBWCpz8N119LiLxwSgyEIDyLpp/vOBFhOu/NIgxsGRKdQABr8LHasBL+iqOS2BoT9GyrD
	Qq9c3p3+aEDLLi01SkbctODnTPdbQmpnEhtAVyGBI/ciM+O0yLY57TbRFBMckovPQbyqJZgbjmuei
	SOIclQ+vRs2B3UtljtXcxxHZpL0s5pBeGy5B78mIVb+XDAGjAB6pbGRJYYNjQbkd+4DAN4HE62vok
	Te24QRlkLY26W6C3zoINQvTZk0VIlcpFMRsA5pef3irnZSzxxwk1AX8yYNyxyMhiSKABSC7+ewhW5
	tWbVj+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVot-0000000APir-0PVo;
	Thu, 13 Nov 2025 11:48:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVop-0000000APiS-2F3I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:48:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 44CAC4E41682;
	Thu, 13 Nov 2025 11:48:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB0DF6068C;
	Thu, 13 Nov 2025 11:48:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 364B5102F2351;
	Thu, 13 Nov 2025 12:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763034524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ctBc4upCgqzKeJAnk9xRDnJ5/kLYkjPG0jykALkFcYg=;
	b=fKSFphfRMoXTQ0hCbm1ZC+zPU9x35KzW0zgQCVqecpiOq6xEYaWdAIZgWBuZF8QPSrH1FX
	3YYtrjz5mnrq3z4tYS1VvV/OGySMGEChlnwlFEyJDXVbq5dwt/nGOKJJiqenF43f3N5PO5
	Cy1n3L8dQS0ygIIffIDzOsJVKq9HUvt1K/wy3r0GZnrfW3/FYlKtDxAkUFz9Vp6ZCMTP4G
	rZ0HqUf7mvbhYlwiqp5DoVAd4zM628y/u/ag8d60VzZf2BJkQLMTwf7geYjfcdWG5YqL1s
	BW5MJffQA8Q0v2iTR+gD7YnJg3fZ6Imtm97MLeP5ezTZaPpEXQw/8EHzYUCcNA==
Message-ID: <98560fc9-ca90-4c64-980a-472e49a77a13@bootlin.com>
Date: Thu, 13 Nov 2025 12:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: Fix VLAN 0 deletion in
 vlan_del_hw_rx_fltr()
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, boon.khai.ng@altera.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
 <20251113112721.70500-2-ovidiu.panait.rb@renesas.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251113112721.70500-2-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_034851_717486_62040CCE 
X-CRM114-Status: GOOD (  13.36  )
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



On 13/11/2025 12:27, Ovidiu Panait wrote:
> When the "rx-vlan-filter" feature is enabled on a network device, the 8021q
> module automatically adds a VLAN 0 hardware filter when the device is
> brought administratively up.
> 
> For stmmac, this causes vlan_add_hw_rx_fltr() to create a new entry for
> VID 0 in the mac_device_info->vlan_filter array, in the following format:
> 
>     VLAN_TAG_DATA_ETV | VLAN_TAG_DATA_VEN | vid
> 
> Here, VLAN_TAG_DATA_VEN indicates that the hardware filter is enabled for
> that VID.
> 
> However, on the delete path, vlan_del_hw_rx_fltr() searches the vlan_filter
> array by VID only, without verifying whether a VLAN entry is enabled. As a
> result, when the 8021q module attempts to remove VLAN 0, the function may
> mistakenly match a zero-initialized slot rather than the actual VLAN 0
> entry, causing incorrect deletions and leaving stale entries in the
> hardware table.
> 
> Fix this by verifying that the VLAN entry's enable bit (VLAN_TAG_DATA_VEN)
> is set before matching and deleting by VID. This ensures only active VLAN
> entries are removed and avoids leaving stale entries in the VLAN filter
> table, particularly for VLAN ID 0.
> 
> Fixes: ed64639bc1e08 ("net: stmmac: Add support for VLAN Rx filtering")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


