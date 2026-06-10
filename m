Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E561CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZlhauMybcsLl8kIgbp5wNtOt4YG3oeBwviWuHyGg7I=; b=xEkmkVugjwnGD8KlKoHyW2vXZz
	rytUBJwp5L2/Jkeq3oh34q5omtWl76a+eMFu3vHJ50/qbJ6WgNx/hDJE/7JJoV4AIYdwUkfekAv/8
	0f9R3uoJvwz98H6vXuULMhzdXhc4/dLWImqHOd8Nkfto8vKWsaA4jQNt92PYkHsbOUI4f3VAymtl+
	omZr/B8ytYUsxNepHr9czqo4Uvqnkv4YvkrbMR8mKba6cSCqPxdf1+yYEoRkNkWrNtQas8l9zpaEt
	CvHzCIfAdJ3qddalGfe/P0dSVpg5dGvwcCiOrscfz1yb6bMQmOdTCn98vGAsvvwDHzs/NS20vSX7P
	vJWNCOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM51-000000089M4-04sc;
	Wed, 10 Jun 2026 16:47:03 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXM4y-000000089Kz-2BAG;
	Wed, 10 Jun 2026 16:47:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4gbBWl74F5z1XLyhV;
	Wed, 10 Jun 2026 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1781110014; x=1783702015; bh=aZlhauMybcsLl8kIgbp5wNtO
	t4YG3oeBwviWuHyGg7I=; b=thCDfpWrWI/ywSQ9tYY8WHHnXW/IEBFUm/tBjyF/
	49Hy4Tj0FhF5Bp3qG5huP/npVKLKBsFieGtulviHRwlb5IRbs0u1Hf7eJT6tf8Yk
	ZnMNlwKb+PWqU3SVEzd5DylNPHO3v8bMwjxDog2cMEOGaHRAruHf6RRH9Huyd25N
	ysE9oz/mmtf2XPIbsoybAfj4NVuven6cHOMgjVGvFoSIbgUETk9I18lByyUVM0MI
	j8i/+QOsE+wmYum5FWC3LKzK3kgaCQSg+nAxE1gJpGumdisMi+kL41Jm2ns9FZG8
	eM96OighqxovL8j2uBHSt7wkkzyJKyK8+6XkJ71tcpyiGg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ltPV2J_RGYQF; Wed, 10 Jun 2026 16:46:54 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4gbBWZ6ZBdz1XLyhT;
	Wed, 10 Jun 2026 16:46:50 +0000 (UTC)
Message-ID: <1f4a26be-4985-448f-955d-00e4f697224c@acm.org>
Date: Wed, 10 Jun 2026 09:46:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ufs: mediatek: Implement get_hba_nortt callback for
 RTT capability
To: ed.tsai@mediatek.com, alim.akhtar@samsung.com, avri.altman@wdc.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 peter.wang@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com
References: <20260609103856.676222-1-ed.tsai@mediatek.com>
 <20260609103856.676222-3-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260609103856.676222-3-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_094700_595534_E0274777 
X-CRM114-Status: UNSURE (   5.30  )
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

On 6/9/26 3:38 AM, ed.tsai@mediatek.com wrote:
> Implement the get_hba_nortt callback to handle platform-specific RTT
> capability differences:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


