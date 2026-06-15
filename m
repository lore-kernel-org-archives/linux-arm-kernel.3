Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D8ECD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGVKq3DqkJdswBGgVG+gslnExkfAwrSp65EizBZiGKM=; b=dQTaFq5v/o56QiGOy5ZwDVFTPS
	jNDf5Mk9cLMFU1TPMzUKgU7fWvGbqp1ar28A4FdzfuyfvisVMPAqTwKuPkoKdeyuWuRr89XFcOSjN
	6IBA6X3p9LwgPsqeRyb6/1cs/1o4CPq2+bizL6MxhvDzz4FP4IzQbCc3vT74J60h/B1BIp/EW41dy
	lE85jI2ltIYtCr9kdF6GTpVDyl5onhhOf3KHPVnkZqsMoAzX8duBYTv/tsJsNhE/Xnb8uAkW+tWTF
	6DgR+bfiCa+Js+BG+NjXU7zGs1Wk5mIhfeNOAQfm2Q8csUG04OUIXNMKc8Tdk6qE/Et5Wf9ATNNiJ
	one55fyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7Yr-0000000EKDS-32T5;
	Mon, 15 Jun 2026 13:41:09 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7Yp-0000000EKC8-1ekE;
	Mon, 15 Jun 2026 13:41:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4gfB8t2kqszlfl5V;
	Mon, 15 Jun 2026 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1781530855; x=1784122856; bh=dGVKq3DqkJdswBGgVG+gslnE
	xkfAwrSp65EizBZiGKM=; b=DzWHun1z/cTIPfcFjYWFAYKfGzApZhmJY3T8Ic1l
	ekMU1Vrdc3A9lkGKQ1cloPe6yfEd/kHkn+ja9LQf3wKTeBF6qomGJhpl/y8FNcNB
	Ibif9KtpeVwA75hxytJTulSkPZyuQJ9H4qZwynVTiS9B7x41yD2jOJBgQaaLizeA
	WJhj6CC/jATxIE0Hpr7pDnSAVhJRu2/mRw5FxwZrn+2cLV5hYF08w5DYDi8fk1yN
	RiAEWcaZFvwBedNbp2H51nQPCvVMJMM3zbTjlhJXbsJN/2QVAeCpzIihhOnMBy7c
	ArvCMhF2WooauWI1qpBRk9gFZ+9uxUl3tyoadkMMhmo5kA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id m8jRUe-O9L6p; Mon, 15 Jun 2026 13:40:55 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4gfB8f1dQfzlfvpG;
	Mon, 15 Jun 2026 13:40:49 +0000 (UTC)
Message-ID: <414c9338-0e3e-4d68-941d-18cb83dc78f5@acm.org>
Date: Mon, 15 Jun 2026 06:40:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ufs: core: Remove max_num_rtt field from
 ufs_hba_variant_ops
To: ed.tsai@mediatek.com, alim.akhtar@samsung.com, avri.altman@wdc.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 peter.wang@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com
References: <20260615055802.105479-1-ed.tsai@mediatek.com>
 <20260615055802.105479-4-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260615055802.105479-4-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_064107_449064_F896017C 
X-CRM114-Status: UNSURE (   6.11  )
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

On 6/14/26 10:57 PM, ed.tsai@mediatek.com wrote:
> Remove the max_num_rtt field from ufs_hba_variant_ops as it has been
> replaced by the get_hba_nortt() callback which provides more flexible
> platform-specific RTT capability handling.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

