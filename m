Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E563CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asPcu0HFDOpbe01/M/JtJ/Ahm+2yhurMQ/9pz+Kce3g=; b=vF5iVQOP2p39ShZ9fHYUZ6x4k5
	YqPzrUHJbcA0uzQZiC/9gMGlrdoL9f2deTGL2v1Rys6ZmFQrAfMlFOguMkZEMKl4hdvbgpZdNFQc2
	ewgpmkcGG86GytdRY3yc7GHL4UZoFhqGYanExeYvTKmDY1EhJJk+/nzhGkYFAkGEkpfpMeWPpI3Bo
	Xj2ihO2HI3rbfFg2N1cwUJQul/wCdMsgm0/RSL79hdkbzkwXt861Xk2tqx3bQYditS5u/ikOpBbaH
	sCPIqC1baa9ldf/h5ohIIgoGkWVVKMdvphJM6XXvL5K47pC8VdpztazzbIWfvXT//9AOfoc0HoR2S
	Hs/xElXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacl-00000009Cl7-07BN;
	Mon, 11 Aug 2025 22:04:11 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXWB-00000008pJV-0oe0;
	Mon, 11 Aug 2025 18:45:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754937896; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lmbspXf8oivJUf301TY1GyvEouLfOMCKKQgvbhX2bM1ZH3Q5JlLq/LddWrZayuJBebcXkVl/B2H2tSgyxbLc0Ttq8KqRkiUdDD3gJt9f4SB0mEs2wQFWqkCo3MXZjM0qAjrqtdqxQbLrIbmODstr4iuqOYsZbvRBX408kTlmz6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754937896; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=asPcu0HFDOpbe01/M/JtJ/Ahm+2yhurMQ/9pz+Kce3g=; 
	b=Qe74IdKuu2TsIVQ7Uhl1dlnJ9WcEt2MEuQakSScpSSjKpbc/TNM8ej74dkeRxPqJ/L7Yge4tQq0VnL43qRCHLO8xHmBHl54scq9UI2KGoEW7UtYtTX2Z7AbA8T9L41y280n0u+mSta0zQlHOsZeJRZUtYlu2vt4rJhj7YgkOpkY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754937896;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=asPcu0HFDOpbe01/M/JtJ/Ahm+2yhurMQ/9pz+Kce3g=;
	b=H9zwuiMxTQhnInn+t5Gkc5DdPKCp99oq/fNsSfV2zWWKWtH/89o3VYQXpwOKaejK
	2sDIPJrzVdtAGukLnmVMTJV0jBjPqniojX6pVY2Iz//ChFUFBxI6ZVKo7xviFawVhZT
	C5/YgmjuGtTn/unfZ2LQIgPUeSmVrOb2bw1h6HuU=
Received: by mx.zohomail.com with SMTPS id 1754937893088844.0326429284914;
	Mon, 11 Aug 2025 11:44:53 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 06/12] media: rkvdec: Add RCB and SRAM support
Date: Mon, 11 Aug 2025 14:44:51 -0400
Message-ID: <13821567.uLZWGnKmhe@trenzalore>
In-Reply-To: <ae6a9c48-85d5-479f-b230-187a06995553@kernel.org>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <5031584.31r3eYUQgx@trenzalore>
 <ae6a9c48-85d5-479f-b230-187a06995553@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_114511_303086_98CE84FE 
X-CRM114-Status: GOOD (  13.39  )
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

On Monday, 11 August 2025 10:01:59 EDT Krzysztof Kozlowski wrote:
> On 11/08/2025 15:54, Detlev Casanova wrote:
> > On Monday, 11 August 2025 02:13:42 EDT Krzysztof Kozlowski wrote:
> >> On 08/08/2025 22:03, Detlev Casanova wrote:
> >>> -	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> >>> -
> >>> 
> >>>  	irq = platform_get_irq(pdev, 0);
> >>>  	if (irq <= 0)
> >>>  	
> >>>  		return -ENXIO;
> >>> 
> >>> @@ -1204,6 +1217,10 @@ static int rkvdec_probe(struct platform_device
> >>> *pdev)>
> >>> 
> >>>  		return ret;
> >>>  	
> >>>  	}
> >>> 
> >>> +	rkvdec->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> >> 
> >> Didn't you just add new ABI?
> > 
> > Oh do you mean rkvdec_rcb_buf_count() ? I could indeed use that instead
> > here.
> No, I meant DT/OF ABI for "sram".

Yes, the sram Documentation was added in commit c6ffb7e1fb90 "media: dt-
bindings: rockchip: Document RK3588 Video Decoder bindings".

Is that not how it is supposed to be used ?

Detlev.



