Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66862C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkLPH6/pG1QKxQFoZVVjyOIy26h52EOkhnvic+LoJGI=; b=d+Cbb8AdlDP2xlO8yyJY15It3o
	6W2fxSO/VVcizR4Dr/3HyR44jYMriVNZskCIUjkVxP4eXYM5TFaIL179kWL2gkL9ug47O69F/ixNF
	9UNorxLqwSLABPRrxSfItLTVqX/j0fNFBI40CqFiNqExHv8vjCmmGGx+AW/AK/mQh4uWtYsjNfqo9
	/xTaUyPVNYBzUoJ5fSzaTwBg+uTQEqhix+ttJj+BcNJ0CX64B87h9QAaYteNBDk6UaZ8WsmKKZMu5
	gxqup4VCVRLq3gVOPVyyBCTH0WmtcKR36PLgLLkdbTtXwQ4oWK3y22dVuHDg4VU2PrZplEQzPHyrO
	P9PzVW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIus-00000002Wki-3OHm;
	Mon, 27 Jul 2026 10:50:38 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIuo-00000002Wk0-1rNp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 10:50:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NkLPH6/pG1QKxQFoZVVjyOIy26h52EOkhnvic+LoJGI=;
	b=x7xLRq6ZkYT0Ul95doRBYSSnpAh5sUTjppMZp2Qc5da9r1lZMGeAK8qEYbFmU+vWx9jF+GDSG
	P/EOLa1Sus306/JlJBMQdWQb8bmOIyfK9tFQzMCuu6ZNQAnz/ZHOdOxaLcfdSODeKR0+JZNxE/v
	6fIO/oz+N9RCCHbwifoIwSE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h7w9b3bV7z1T4Fq;
	Mon, 27 Jul 2026 18:40:51 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D87F4057F;
	Mon, 27 Jul 2026 18:50:19 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 27 Jul 2026 18:50:18 +0800
Subject: Re: [PATCH] irqchip/gic: Simplify Maintenance Interrupt ACPI parsing
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, <radu@rendec.net>, Sascha Bischoff
	<sascha.bischoff@arm.com>
References: <20260725155941.114322-1-maz@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <6be4973f-e601-8781-36c2-848a45d372f5@huawei.com>
Date: Mon, 27 Jul 2026 18:50:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20260725155941.114322-1-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200006.china.huawei.com (7.152.185.252)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_035034_948161_31BD168B 
X-CRM114-Status: GOOD (  14.69  )
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

On 2026/7/25 23:59, Marc Zyngier wrote:
> The ACPI spec describes the vgic Maintenance Interrupt with attributes
> indicating whether the signalling is Level or Edge. While this
> superficially looks like a sensible thing to do, it doesn't actually
> make much sense.
> 
> By construction, this interrupt is Level, and cannot be anything
> else, as the hypervisor actively needs to interact with the vgic
> for the level to drop. This indicates a state, and not an event.
> 
> Get rid of this nonsense, always register the corresponding GSI as
> Level, and let the user know that they run on quality FW should
> the interrupt be advertised as Edge.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-gic-v3.c | 10 +++-------
>  drivers/irqchip/irq-gic.c    |  8 ++++----
>  2 files changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks,
Zenghui

