Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9175CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nnIwcBQt92lCOlOOaGrqeudJML21vpTZzYbN2KUxng=; b=hdB7AetpDKqXRaQUoxEtVVpQDc
	HIrByYdmtkvq1ijR+r1MBBmkk0jlM4g/vHYRVtlmN1Zrhhr9YZVqnPidBccSGd6ri6sx/UEqTm9Mr
	3iooL36X6QQMgptGwDRXHhANH8TwRetIWnhPboKELnRZfS8Jxt2O3/GADqjzvEgNHsaN6JQB+dIot
	zEoDMl+91pPte9sbhq9NyTbXLGRj4rBfa0v1kZp1bQP/HEVxPVHNnc+1J7F07os5ZSL/COMi2PqKQ
	YxarPcvNiqiLb0lHkxRii5KByQDt7NwUjN/7hwl/hBab3Z23U/2E7jOGUuvCC+f0JTVqtqKFXsWRQ
	PMp83vMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21O-00000008wjb-0kRU;
	Tue, 09 Sep 2025 17:20:46 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvz2B-00000007dX3-2Fxs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:09:25 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589E8oIh4117177;
	Tue, 9 Sep 2025 09:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757426930;
	bh=8nnIwcBQt92lCOlOOaGrqeudJML21vpTZzYbN2KUxng=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OXE81EkKsvvu5bR4eko3/6126JOyjE86JMnyscYVwDS0qQ4uj1XejUHvw1WrWDJZ6
	 zTniqE9ktd2/BPkPDT4HDZtoW7ZzGFlrcIKBkJBqPP0/OZEGfo8lBGTwuNH6fkCjyj
	 a7sfyl8sND/N8Rf4qOrDbAu8TscgPcrgbWEPOWJs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589E8ovJ410472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 09:08:50 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 09:08:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 09:08:49 -0500
Received: from [10.249.130.74] ([10.249.130.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589E8e5A2743053;
	Tue, 9 Sep 2025 09:08:40 -0500
Message-ID: <3e22a667-bdff-43db-9388-846b2b278d77@ti.com>
Date: Tue, 9 Sep 2025 19:38:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/7] net: rpmsg-eth: Add netdev ops
To: <Parthiban.Veerasooran@microchip.com>, <danishanwar@ti.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <horms@kernel.org>, <corbet@lwn.net>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andrew+netdev@lunn.ch>,
        <mengyuanlou@net-swift.com>, <quic_luoj@quicinc.com>,
        <gongfan1@huawei.com>, <quic_leiwei@quicinc.com>, <mpe@ellerman.id.au>,
        <lee@trager.us>, <lorenzo@kernel.org>, <geert+renesas@glider.be>,
        <lukas.bulwahn@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20250908090746.862407-1-danishanwar@ti.com>
 <20250908090746.862407-5-danishanwar@ti.com>
 <4a69e4f1-06b1-49a1-aab6-baef6c613f0b@microchip.com>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <4a69e4f1-06b1-49a1-aab6-baef6c613f0b@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_070923_669232_6D73CFCC 
X-CRM114-Status: GOOD (  13.17  )
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

Hi Parthiban

On 9/9/2025 12:08 PM, Parthiban.Veerasooran@microchip.com wrote:
> Hi,
> 
> On 08/09/25 2:37 pm, MD Danish Anwar wrote:
> 
>> +static int create_request(struct rpmsg_eth_common *common,
>> +                         enum rpmsg_eth_rpmsg_type rpmsg_type)
>> +{
>> +       struct message *msg = &common->send_msg;
>> +       int ret = 0;
>> +
>> +       msg->msg_hdr.src_id = common->port->port_id;
>> +       msg->req_msg.type = rpmsg_type;
>> +
>> +       switch (rpmsg_type) {
>> +       case RPMSG_ETH_REQ_SHM_INFO:
>> +               msg->msg_hdr.msg_type = RPMSG_ETH_REQUEST_MSG;
>> +               break;
>> +       case RPMSG_ETH_REQ_SET_MAC_ADDR:
>> +               msg->msg_hdr.msg_type = RPMSG_ETH_REQUEST_MSG;
>> +               ether_addr_copy(msg->req_msg.mac_addr.addr,
>> +                               common->port->ndev->dev_addr);
>> +               break;
>> +       case RPMSG_ETH_NOTIFY_PORT_UP:
>> +       case RPMSG_ETH_NOTIFY_PORT_DOWN:
>> +               msg->msg_hdr.msg_type = RPMSG_ETH_NOTIFY_MSG;
>> +               break;
>> +       default:
>> +               ret = -EINVAL;
>> +               dev_err(common->dev, "Invalid RPMSG request\n");
> I don't think you need 'ret' here instead directly return -EINVAL and 
> above 'ret' declaration can be removed.
>> +       }
>> +       return ret;
> can be return 0;

Sure. I will drop ret.

>> +}
>> +
>> +static int rpmsg_eth_create_send_request(struct rpmsg_eth_common *common,
>> +                                        enum rpmsg_eth_rpmsg_type rpmsg_type,
>> +                                        bool wait)
>> +{
>> +       unsigned long flags;
>> +       int ret = 0;
> No need to initialize.

Sure. Will drop this.

>> +
>> +       if (wait)
>> +               reinit_completion(&common->sync_msg);
>> +
>> +       spin_lock_irqsave(&common->send_msg_lock, flags);
>> +
>> +static int rpmsg_eth_set_mac_address(struct net_device *ndev, void *addr)
>> +{
>> +       struct rpmsg_eth_common *common = rpmsg_eth_ndev_to_common(ndev);
>> +       int ret;
>> +
>> +       ret = eth_mac_addr(ndev, addr);
>> +
>> +       if (ret < 0)
>> +               return ret;
>> +       ret = rpmsg_eth_create_send_request(common, RPMSG_ETH_REQ_SET_MAC_ADDR, false);
> You can directly return from here.

Sure.

>> +       return ret;
>> +}
>> +
> Best regards,
> Parthiban V

-- 
Thanks and Regards,
Md Danish Anwar


