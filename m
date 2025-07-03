Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C901CC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIyqDlLt3CT1utfTbk2TkfmajXEi5ZvgikV+/3VcJck=; b=l3/CEJM6sGNWUlqSo71jZSkdqH
	xesu+VNJZ2K6CVGe2RfgEaKEjS4N4yQu5L7gRh5WqtlQTWwoC738S/ZuStKrcPL7nrX6gtf7YK51M
	J0FTNcGqgShX89fFyZvCc0vfGOqINK9IZ9SzE4OKmnuWov2u9KsdSznMBqM77Ezmuslmi2LH8zKiQ
	8hJ+1BhTZH5ZrpHPXQtnJrEIxzpAbf0uxu8o79PVhNNk+Jl1rajW6L/xAqqq+0El0p65E2tNrCJ+K
	if4rzmV9zDKSn8g/J06UggDeQkn3n4p6J8Twkq6JyFU4HH8s93iBkPkEGQ6MXkrk9MgAEMtbiTWYi
	9MmAi9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTY0-0000000Cr2e-17Sn;
	Thu, 03 Jul 2025 23:40:56 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSnn-0000000Cn9T-3jqc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 22:53:13 +0000
Message-ID: <218ed5ce-6e0d-41f7-809b-04e554d08c5a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751583186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LIyqDlLt3CT1utfTbk2TkfmajXEi5ZvgikV+/3VcJck=;
	b=let/ROpgpEs+HqLRrGdvieskEbzt9tFEKP9ekxEOGcwqnmErdLrGJ016+f28aLWFswBbmF
	exExgIED9KiRFUeIyT4jn1VfJq/r0JPY0xLLmJbbbF+GAA6mGFCUB1WGIJTwYsMse1RLb4
	HiQRVv3DpWbFq6UjPVjAFyXhxzupLh0=
Date: Thu, 3 Jul 2025 23:52:17 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v10 06/11] net: ti: prueth: Adds HW timestamping
 support for PTP using PRU-ICSS IEP module
To: Parvathi Pudi <parvathi@couthit.com>, danishanwar@ti.com,
 rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ssantosh@kernel.org,
 richardcochran@gmail.com, s.hauer@pengutronix.de, m-karicheri2@ti.com,
 glaroque@baylibre.com, afd@ti.com, saikrishnag@marvell.com,
 m-malladi@ti.com, jacob.e.keller@intel.com, diogo.ivo@siemens.com,
 javier.carrasco.cruz@gmail.com, horms@kernel.org, s-anna@ti.com,
 basharath@couthit.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pratheesh@ti.com,
 prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250702140633.1612269-1-parvathi@couthit.com>
 <20250702151756.1656470-7-parvathi@couthit.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250702151756.1656470-7-parvathi@couthit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_155312_091004_1BA2B708 
X-CRM114-Status: GOOD (  16.40  )
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

On 02/07/2025 16:17, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> PRU-ICSS IEP module, which is capable of timestamping RX and
> TX packets at HW level, is used for time synchronization by PTP4L.
> 
> This change includes interaction between firmware and user space
> application (ptp4l) with required packet timestamps. The driver
> initializes the PRU firmware with appropriate mode and configuration
> flags. Firmware updates local registers with the flags set by driver
> and uses for further operation. RX SOF timestamp comes along with
> packet and firmware will rise interrupt with TX SOF timestamp after
> pushing the packet on to the wire.
> 
> IEP driver is available in upstream and we are reusing for hardware
> configuration for ICSSM as well. On top of that we have extended it
> with the changes for AM57xx SoC.
> 
> Extended ethtool for reading HW timestamping capability of the PRU
> interfaces.
> 
> Currently ordinary clock (OC) configuration has been validated with
> Linux ptp4l.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---
>   drivers/net/ethernet/ti/icssg/icss_iep.c      |  42 ++
>   drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  23 +
>   drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 423 +++++++++++++++++-
>   drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  11 +
>   .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 ++++
>   5 files changed, 582 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
> 

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>


