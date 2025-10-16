Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D353CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdJWyTw5grIca2C49Gc8SShAY81xl1ZxjBDpB/TgceY=; b=d9tdEt4XroCaxoODv4KyplpehE
	T8d18CeO4O0RzAzRya8VNKWvGyQ/HuX6DxACP4ai0QnjjPfUokRjhfJ+pb4nUkDdimlHDuUSduRX7
	/5WlSTostOjYpbVuNicE7ZM2bQCDTmCX82dzXxzvts/+2gi4XN8sihy6QuSeEZ/956dpdx+SivZVU
	GFOIYZZrXvwnZkMVsa7xAOFPbnnMjxRbnIAJb8PtkIzOZuBI+L/D/B5xfyklMaUrZ1LMeAVShsbhI
	aoAmg3GoVEcE8VIpufOWB0eBJz2T953nR67HERBLrJ3P0PetlRA7wOp3LgMdRTpooiZKn8zHvRc0e
	pGieRpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MZz-00000004eF8-0Zlp;
	Thu, 16 Oct 2025 11:55:35 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MZw-00000004eEg-2Vvi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 11:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JdJWyTw5grIca2C49Gc8SShAY81xl1ZxjBDpB/TgceY=; b=CxFPCAnEfus2DAQGC/F0bO5d4C
	kLTklHkcWcVnvjybleV9p64RbrYZdQFzdDopV8SWnlFMURdQ+kLJVkG3CCo88/fmPtKYEJCRetPP2
	x3D291Gwuuy+wO6MzV/rFM8lrn+cR8xXn+rWp5dy9ib7ltgJFjD9ojLF3xGnA0H5Vnd2xx9NgfAzN
	1CRiAstPPcaL5okfp9H4Zc1Gm+LmQx/a0frpnREyqRJ+sdIKSJZfTuUFYze9n8lGWCf23frw1SAEX
	9HLigBvQkTAhbvLbYJtz9Hkn09mLzS6sYr+oQNAq/9zualqofN/BAq3JyLtqIMr5qfQtr0PI/0HGd
	6h1M1VXQ==;
Received: from [122.175.9.182] (port=2029 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v9MZu-000000079dC-1oBn;
	Thu, 16 Oct 2025 07:55:30 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id C240E1783FF9;
	Thu, 16 Oct 2025 17:25:26 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id B466E1783FF4;
	Thu, 16 Oct 2025 17:25:26 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uJODz3yCZt52; Thu, 16 Oct 2025 17:25:26 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 8BA601781E1F;
	Thu, 16 Oct 2025 17:25:26 +0530 (IST)
Date: Thu, 16 Oct 2025 17:25:26 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: parvathi <parvathi@couthit.com>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	danishanwar <danishanwar@ti.com>, rogerq <rogerq@kernel.org>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>, 
	afd <afd@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, Prajith Jayarajan <prajith@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>
Message-ID: <179725937.1046.1760615726437.JavaMail.zimbra@couthit.local>
In-Reply-To: <ce87a72f-09b3-4615-aab9-2be8648300f8@lunn.ch>
References: <20251014124018.1596900-1-parvathi@couthit.com> <20251014124018.1596900-3-parvathi@couthit.com> <ce87a72f-09b3-4615-aab9-2be8648300f8@lunn.ch>
Subject: Re: [PATCH net-next v3 2/3] net: ti: icssm-prueth: Adds switchdev
 support for icssm_prueth driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: icssm-prueth: Adds switchdev support for icssm_prueth driver
Thread-Index: wPaVLJ+dDJYcM1dgRjkmeX50UJ4mnA==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_045532_666038_8C1332A4 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi,

>> +static struct prueth_fw_offsets fw_offsets_v2_1;
>> +
>> +static void icssm_prueth_set_fw_offsets(struct prueth *prueth)
>> +{
>> +	/* Set VLAN/Multicast filter control and table offsets */
>> +	if (PRUETH_IS_EMAC(prueth)) {
>> +		prueth->fw_offsets->mc_ctrl_byte  =
>> +			ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_OFFSET;
>> +		prueth->fw_offsets->mc_filter_mask =
>> +			ICSS_EMAC_FW_MULTICAST_FILTER_MASK_OFFSET;
>> +		prueth->fw_offsets->mc_filter_tbl =
>> +			ICSS_EMAC_FW_MULTICAST_FILTER_TABLE;
> 
> I know for some of these SoCs, there can be multiple instances of the
> hardware blocks. It looks like that will go wrong here, because there
> is only one fw_offsets_v2_1 ?
> 
> Humm, actually, if this are constant, why have fw_offsets_v2_1? Just
> use ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_OFFSET directly?
> 

Sure we will evaluate this and address in the next version.

>> +static void icssm_emac_mc_filter_ctrl(struct prueth_emac *emac, bool enable)
>> +{
>> +	struct prueth *prueth = emac->prueth;
>> +	void __iomem *mc_filter_ctrl;
>> +	void __iomem *ram;
>> +	u32 mc_ctrl_byte;
>> +	u32 reg;
>> +
>> +	ram = prueth->mem[emac->dram].va;
>> +	mc_ctrl_byte = prueth->fw_offsets->mc_ctrl_byte;
>> +	mc_filter_ctrl = ram + mc_ctrl_byte;
> 
> mc_filter_ctrl = ram + ICSS_EMAC_FW_MULTICAST_FILTER_CTRL_OFFSET; ???
> 

Sure we will evaluate this and address in the next version.

>> +static void icssm_prueth_sw_fdb_work(struct work_struct *work)
>> +{
>> +	struct icssm_prueth_sw_fdb_work *fdb_work =
>> +		container_of(work, struct icssm_prueth_sw_fdb_work, work);
>> +	struct prueth_emac *emac = fdb_work->emac;
>> +
>> +	rtnl_lock();
>> +
>> +	/* Interface is not up */
>> +	if (!emac->prueth->fdb_tbl) {
>> +		rtnl_unlock();
>> +		goto free;
>> +	}
> 
> I would probably put the rtnl_unlock() after free: label.
> 

We will address this in the next version.

Thanks and Regards,
Parvathi.

