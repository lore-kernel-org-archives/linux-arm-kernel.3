Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EE2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kSSs5d+mURldhTGN/D4hGaJTvjJYpIqJefyMHl21BE=; b=elaoUEjylDsNbU/+RmCUI2BGgx
	DSFo+8xurwxMtYByj46qI3mTMXyCv30qGrw0rcVt62h0MP91jHJjB8itkkWs8q60o2BG/zNqMGOUu
	gGeqCirOpet1S5DKJDzDbTFfzDF1dcrk36+Y0PGoXaBtaGbmOhIQVCo/hRlWVfHEFxZN96BuvpzHw
	5NZ64HkWqlD+O7xilWy+GAx7I/+WRXVhn8OgtM0ULA9ZxaWKYOXmV1oRPJiFVJEKaUXQ+S+bi5IUc
	DgNh8jcss+jJcUu4O54WeU69mnyElkENCfxTZRFfl0Fvwx54r8FLvqdFCq6uOryGZxs45+G3R6yGo
	XvRM7Z8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfJz-0000000D0wL-0eOL;
	Thu, 12 Jun 2025 10:38:12 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeEI-0000000CoKh-3dt8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:28:16 +0000
Message-ID: <64b98bdc-5375-478f-813d-b2209986c253@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749720491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kSSs5d+mURldhTGN/D4hGaJTvjJYpIqJefyMHl21BE=;
	b=xgTe/FN73ktwVsc7fUPBN23gcKu79EvC4q84/rbc5wcbqC6WqfHSo1lv323W47baMOF2mB
	RC0yT8A9xXPxkpNp65M9CTcCX8IFoYM5jp1zb72p4tY4jc1QAd84Xh6uEgkHIWlqg61HiB
	3DGyEfQL+HfP9i8bAMXbtAkoTpKimxE=
Date: Thu, 12 Jun 2025 17:27:40 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: extend use of snps,multicast-filter-bins
 property to xgmac
To: Nikunj Kela <nikunj.kela@sima.ai>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, prabhakar.mahadev-lad.rj@bp.renesas.com,
 romain.gantois@bootlin.com, inochiama@gmail.com, l.rubusch@gmail.com,
 quentin.schulz@cherry.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250610200411.3751943-1-nikunj.kela@sima.ai>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250610200411.3751943-1-nikunj.kela@sima.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_022815_376897_8FC1D1D7 
X-CRM114-Status: UNSURE (   8.13  )
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

在 6/11/25 4:04 AM, Nikunj Kela 写道:
> Hash based multicast filtering is an optional feature. Currently,
> driver overrides the value of multicast_filter_bins based on the hash
> table size. If the feature is not supported, hash table size reads 0
> however the value of multicast_filter_bins remains set to default
> HASH_TABLE_SIZE which is incorrect. Let's extend the use of the property
> snps,multicast-filter-bins to xgmac so it can be set to 0 via devicetree
> to indicate multicast filtering is not supported.
> 
> Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng


