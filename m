Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B85C4452E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7gT9UC4sQcenS3aM2Pap8cxEe9QaY6Up1+QlLfmUqw=; b=Dqm/rB1hYWOdQHe9kZAQ2vPChK
	o35ONfxJXp9CYS5nEFTLZiqSLC534h/AGWx+Yiz2AhUW1yN3JxGkggcICKqMKtmgQ+YC2uEOKwYxm
	LHhdwDGNmNpf4es45iCjkxHy+gf0Gjt9SE8j9+zVhrUh0nSr++GgRGG2BmDI6WThBa3m3M+pWwspG
	pdzKWGP528nAgMmIfg3xwbAjXuZRFPJF4LvmiD16pFqhEKCrGPRHKHJ964yxmvZEyQYEVDGGjTPoZ
	QgFyCqDONrkvIHfNGRBPp+xDLgK7h9MUsTxmTJ3RO+WP1wEtCIKdChrx5YE68sfhpGt5voZnpjEy7
	RRMRfqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYdK-00000005YML-2OdH;
	Wed, 21 Jan 2026 13:52:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYdI-00000005YLw-2hkU;
	Wed, 21 Jan 2026 13:52:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769003534; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gtuHqyJdIm26Gi68yEFskeWFD9ZoG4RxqzDfP4x6Du8ae40H3vouNHmQt1cjr+SuRR6//aDwJfE+FMqbNotpiJ5L8PcynHwlVfHjRwy/Kvmf9LJfWN3FKbur8MqS4gOur9suEzsY4SJVKIrDjIWSfdOXvOBSFhljA2WMNH9d+18=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769003534; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X7gT9UC4sQcenS3aM2Pap8cxEe9QaY6Up1+QlLfmUqw=; 
	b=G31Z5e6m9YgwA320ovrLK3t25mHfHWU8I70IFq3nqPLpoDp1JrA9V0Rlk/t7/epUORI64E+eVxSlCt+W9zxNiyYi6MKzK/DCpVSdIxt2qfpG63iz5kNne5aoQ/Jl0hviLFKIPzYjkD9rw+4Kl/dr6rukuX+KtqG1N1mGCSS4c5M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003534;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=X7gT9UC4sQcenS3aM2Pap8cxEe9QaY6Up1+QlLfmUqw=;
	b=J8wuY4QuC0BtQTpdyPyiss5sy28ILKTaKxLvFE/5mr3F6BlD5qPPdylW9DS9c2Zq
	QXihqonNeBPieNEid5VgFRi5QFUoLZTEXnS6KZEpecQqDKQNrOFYw9NNV/iYUWBP9rv
	j70kwKBKFTeFBknZd1L7IejUKmxXYWxWxycn+yHQ=
Received: by mx.zohomail.com with SMTPS id 176900353209289.89941655481675;
	Wed, 21 Jan 2026 05:52:12 -0800 (PST)
Message-ID: <4e0de2ff-4616-4e49-a419-1bdfb03e1430@collabora.com>
Date: Wed, 21 Jan 2026 14:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/6] iommu: Add verisilicon IOMMU driver
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
 <20260114100922.149187-4-benjamin.gaignard@collabora.com>
 <3082a454-31dc-42a2-85a6-0fd0c87bf31b@collabora.com>
 <25htwrdapwwvumlaqlu5oywcnnbss5kjyvnv6cxrx42q7mfhuw@wyagcnc3scgf>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <25htwrdapwwvumlaqlu5oywcnnbss5kjyvnv6cxrx42q7mfhuw@wyagcnc3scgf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_055228_741042_327B51EF 
X-CRM114-Status: UNSURE (   7.60  )
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


Le 21/01/2026 à 12:54, Jörg Rödel a écrit :
> Note that I stop taking changes for v6.20 (except fixes) by next week. I you
> want a chance to have this code in 6.20, please make sure a v13 is in my inbox
> by tomorrow.

I have v13 ready but I'm waiting for the conclusion of the thread with Will to send it.
Thanks for the reminder.

Benjamin

>
> -Joerg
>

