Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42A7CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yA5XHJIh+uwK8m+cFLqO7xuw+2f8PC3Mm/yaRJEXFTs=; b=OxsguISC0hew3qFl4nPeWh7Nyq
	paR5ThZxLjVfWWYiL0MYjLQDbGzdt7wtZ5fvfKPcxmoQ+E64AIRlrvQGSOJGIFi8f03MHs2asitXh
	ccY6Qz3IVTqyiEroM42B2xrlUZMQh3WCqvtNDgECNUe2r1+GJ/rRA7mbaM8NNWrC14Zoo5dpExKXj
	YcJIhYsxIOFNzTkxFOXoMzGFFswF+fZmxw8HOkwNPzmtr/PP7/uLOuqbj5Ym86VNU4sOv9diFhwJ1
	hrV/fOU+ToWTRutX9FU8QJcCAJXMEqyUO9EAHaHoovbDEjLfkT0uQ4oXN1ug4ZX3rc+hZSnaZDtw4
	BNIpZa3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67ny-000000024iq-3Bx4;
	Tue, 07 Oct 2025 13:32:38 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67nw-000000024X5-31eG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 13:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yA5XHJIh+uwK8m+cFLqO7xuw+2f8PC3Mm/yaRJEXFTs=; b=rhxlNvoZT0teHb0DCJY3mIC6El
	5Qz1/3Y10Mju3b173o7WcTErbx60ZGETrwUzHkoho84Xkx7xAhqcSAnKgCg1d3DNkHtVwXDH8q5e/
	pm+xMX7s6U8qBwOH5h/581byBmK/GTIMiedcf4EaOriOwwTc6D804/Jrm5u7Q02NyTQI892E3dX2/
	uNWR+6kQZIMFhVBerJ3uPHAU5B7BLfi2wWlI3cpICh+nDSZif/lvmx6GrJHRWrkl3eivFibve/Gb7
	xR/iaxEnvsbQedO1njoUc+nD6r2/n9OqoB6ApyZWtnFVpCaYnWOJ2vetwHpJFj9lZcAd8twP+Rcyv
	xh1fWUEw==;
Received: from [122.175.9.182] (port=40538 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v67nF-0000000GaQC-0lW3;
	Tue, 07 Oct 2025 09:31:53 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id DCE311781E3F;
	Tue,  7 Oct 2025 19:01:48 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id C05CD1784032;
	Tue,  7 Oct 2025 19:01:48 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id L5Rmm5XC9WVq; Tue,  7 Oct 2025 19:01:48 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 8F08E1781E3F;
	Tue,  7 Oct 2025 19:01:48 +0530 (IST)
Date: Tue, 7 Oct 2025 19:01:48 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Md Danish Anwar <a0501179@ti.com>
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
Message-ID: <1064562813.13523.1759843908228.JavaMail.zimbra@couthit.local>
In-Reply-To: <44ed3d16-a8d2-49f3-a6b4-16d9a14d1cc6@ti.com>
References: <20251006104908.775891-1-parvathi@couthit.com> <20251006104908.775891-4-parvathi@couthit.com> <44ed3d16-a8d2-49f3-a6b4-16d9a14d1cc6@ti.com>
Subject: Re: [RFC PATCH net-next v2 3/3] net: ti: icssm-prueth: Adds support
 for ICSSM RSTP switch
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: icssm-prueth: Adds support for ICSSM RSTP switch
Thread-Index: l8mheEKSJM6Rv+qMUH11fPjpxyfFdQ==
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
X-CRM114-CacheID: sfid-20251007_063236_782504_C6BE3A1D 
X-CRM114-Status: GOOD (  17.30  )
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

> Hi Parvathi,
> 
> On 10/6/2025 4:17 PM, Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Adds support for RSTP switch mode by enhancing the existing ICSSM dual EMAC
>> driver with switchdev support.
>> 
>> With this patch, the PRU-ICSSM is now capable of operating in switch mode
>> with the 2 PRU ports acting as external ports and the host acting as an
>> internal port. Packets received from the PRU ports will be forwarded to
>> the host (store and forward mode) and also to the other PRU port (either
>> using store and forward mode or via cut-through mode). Packets coming
>> from the host will be transmitted either from one or both of the PRU ports
>> (depending on the FDB decision).
>> 
>> By default, the dual EMAC firmware will be loaded in the PRU-ICSS
>> subsystem. To configure the PRU-ICSS to operate as a switch, a different
>> firmware must to be loaded.
>> 
>> Reviewed-by: Mohan Reddy Putluru <pmohan@couthit.com>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> ---
> 
> [ ... ]>
>> +static void icssm_prueth_change_to_switch_mode(struct prueth *prueth)
>> +{
>> +	bool portstatus[PRUETH_NUM_MACS];
>> +	struct prueth_emac *emac;
>> +	struct net_device *ndev;
>> +	int i, ret;
>> +
>> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
>> +		emac = prueth->emac[i];
>> +		ndev = emac->ndev;
>> +
>> +		portstatus[i] = netif_running(ndev);
>> +		if (!portstatus[i])
>> +			continue;
>> +
>> +		ret = ndev->netdev_ops->ndo_stop(ndev);
>> +		if (ret < 0) {
>> +			netdev_err(ndev, "failed to stop: %d", ret);
>> +			return;
>> +		}
>> +	}
>> +
>> +	prueth->eth_type = PRUSS_ETHTYPE_SWITCH;
>> +
>> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
>> +		emac = prueth->emac[i];
>> +		ndev = emac->ndev;
>> +
>> +		if (!portstatus[i])
>> +			continue;
>> +
>> +		ret = ndev->netdev_ops->ndo_open(ndev);
>> +		if (ret < 0) {
>> +			netdev_err(ndev, "failed to start: %d", ret);
>> +			return;
>> +		}
>> +	}
>> +
>> +	dev_info(prueth->dev, "TI PRU ethernet now in Switch mode\n");
>> +}
>> +
>> +static void icssm_prueth_change_to_emac_mode(struct prueth *prueth)
>> +{
>> +	bool portstatus[PRUETH_NUM_MACS];
>> +	struct prueth_emac *emac;
>> +	struct net_device *ndev;
>> +	int i, ret;
>> +
>> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
>> +		emac = prueth->emac[i];
>> +		ndev = emac->ndev;
>> +
>> +		portstatus[i] = netif_running(ndev);
>> +		if (!portstatus[i])
>> +			continue;
>> +
>> +		ret = ndev->netdev_ops->ndo_stop(ndev);
>> +		if (ret < 0) {
>> +			netdev_err(ndev, "failed to stop: %d", ret);
>> +			return;
>> +		}
>> +	}
>> +
>> +	prueth->eth_type = PRUSS_ETHTYPE_EMAC;
>> +
>> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
>> +		emac = prueth->emac[i];
>> +		ndev = emac->ndev;
>> +
>> +		if (!portstatus[i])
>> +			continue;
>> +
>> +		ret = ndev->netdev_ops->ndo_open(ndev);
>> +		if (ret < 0) {
>> +			netdev_err(ndev, "failed to start: %d", ret);
>> +			return;
>> +		}
>> +	}
>> +
>> +	dev_info(prueth->dev, "TI PRU ethernet now in Dual EMAC mode\n");
>> +}
> 
> 
> The APIs icssm_prueth_change_to_emac_mode and
> icssm_prueth_change_to_switch_mode seems identical. Won't it be better
> to have one function to change modes and which mode to go to passed as
> function argument.
> 
>	icssm_prueth_change_mode(prueth,mode);
> 
> This will also work seemlessly if you add more modes in future. With
> current approach you will need to add new APIs
> icssm_prueth_change_to_xyz_mode()
> 
> 

Sure, we will check and modify the code to use a single API,
icssm_prueth_change_mode() which will take the mode as an argument.

We will address this in the next version.


Thanks and Regards,
Parvathi.


