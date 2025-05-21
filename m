Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E232C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QiAvvm3mFGO7j5haJ/CRUWWnyjSWWlUqQr8DQ5A31A=; b=0XVMUUaJhZ7gc4ivNOA5GhOTVA
	M7rIwmv4D/U2woahRLmRijFopDccp5jnMI9BQ8kWvvLejnDE/hCXqW1ixgDmqDIsYGjPMk2bRq1nm
	VxZNb/gdr/7yivNfEczQFx041RGn9Da32G+IqBognM808no6a5IW9ri3G34sW46OVNqDpXCl5kfrd
	5QrQah2zIrH5Kz/ENjMAQyjEXWH/Z+5dIGFdZPH7i/bErS3Hy7z7KDhwc9F0VkiPNktrTf5zdw/yZ
	rf/7qSESL1w6VMpkk49+Pg2VD2PSlWuC+VpHMHh2wTeJpKk5bzsiKcyGO7denyMI+y1f/FidKx04G
	+izBfi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdUM-0000000F0Sv-2DYq;
	Wed, 21 May 2025 07:03:42 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdSH-0000000F0DE-2nPY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 07:01:35 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 30B8FA0F32;
	Wed, 21 May 2025 09:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=2QiAvvm3mFGO7j5haJ/C
	RUWWnyjSWWlUqQr8DQ5A31A=; b=tbqsNC0g1PX0U/IumfDoDbGPVXK3kUuNSOfS
	NTGoAORLsuXfvB1x6Bui/CjmuHNWeGpjlizFaeRKtTghJOuut/KXSK2VROeEVdUy
	N+LUPci3lsBvJyxSr4RGgQ62mOXkVwYfT8h9q52evCcTuSuZoBe2SFye1zEpkP9A
	3BjAGPE06GAv77PTT9hcEwKzuxi9QIgFEjUYAP3W27rTEvcmPWtu7AOEzwPR9OKH
	lEkDatJbfEsuMZaihHMEVnNqIcVfUxgNmJLbljG6MzZ2CDDmgsHsWCC8/qUG3r7c
	4a+h1duVe107lZh2JQQj31AxnBnH+/Bq/WC8sJHwGoRGaOkh7tumHXecPzNYCxzH
	5uLQiloaCL4RC0nsmoUIUpVJW1VaPwYTLfagRbav+qrtzhybtxtr3BK8p4RmbdGw
	ykKHdvbYjoDoQjBogYGO8C8nGJPi8Gw6CAUsX6iHisIByZvPDQNhhfi61nxgLQ4b
	fSUtgZoTuICW/171rTCZfgWaaI0CpoFW+jCF/lpI3xwa9GfusY0sLfKtsPtT2sZr
	UcwxLwvSOBudjQNBTOL5UBvjaACTAIoRFAn4lZ3cCij9/F+lVK85mCIlmIGGvTDe
	XV+iSxG/tmJdwFALKyCwycszjZzFWvOZKhfOlkoiGQHShEo1tiCAugsyXhqP17Nr
	nL6BCw0=
Message-ID: <6a7ffc24-dba0-4b67-9d3d-477f3bdf2128@prolan.hu>
Date: Wed, 21 May 2025 09:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH v9] dma-engine: sun4i: Simplify error handling in probe()
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Julian Calaby <julian.calaby@gmail.com>, "Vinod
 Koul" <vkoul@kernel.org>, Samuel Holland <samuel@sholland.org>
References: <20250514161803.229600-1-csokas.bence@prolan.hu>
Content-Language: en-US
In-Reply-To: <20250514161803.229600-1-csokas.bence@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D607466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_000134_163649_81A915E8 
X-CRM114-Status: UNSURE (   4.34  )
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

On 2025. 05. 14. 18:18, Bence Csókás wrote:
> Clean up error handling by using devm functions and dev_err_probe(). This
> should make it easier to add new code, as we can eliminate the "goto
> ladder" in sun4i_dma_probe().
> 
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Reviewed-by: Julian Calaby <julian.calaby@gmail.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---

So, can this be merged? I do believe we have ACKs from most maintainers.

Bence


