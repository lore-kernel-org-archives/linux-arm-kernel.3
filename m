Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976EDD13C3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5HrTW2SOHe2mIAr9pst8U+MU+QvEsPBDyKffQcj+bA=; b=KVTVjMyrm7T+XKGLPw3yOsH9i9
	BfeUvl+P8KPVX4jQ8gzmRtTSCX7ilBYSebxVfHf1JsqYmtNa82c9KLUcnZwViKLIo2jpOssC2d2dv
	vOcdB8kft9yR3Sb7FNfiP/nl/2Hq2nhTzewYf4UNFnK0aF0+rWNkHIsfE3kDw1WcPox1G6VTw6mul
	cQOplVryEwI9W/MMPkINt3c3XINEGW4MiL9b5BQ0tj7lTf0FuJrROxWMtTyMgoMBu/2MlK9ZZubRS
	W8f/YErD1oD3M3c0GTJ6EmqMjD7UJiZXgXlIndn8KQ/bXZDY1wliOUROZOljiuL9teRofGI5imOwR
	NQCtEG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOsu-0000000CnOn-24pZ;
	Mon, 26 Jan 2026 15:52:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOst-0000000CnOC-2f6H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 15:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F69F60097;
	Mon, 26 Jan 2026 15:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF8CC116C6;
	Mon, 26 Jan 2026 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769442730;
	bh=+ADv4pELrdIIcbbNOkUvc+VYYWavY8uNP77ALYYtwqo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YQbLdhqDEzvnIE38o1MR+mhM1BOL1xnJjw4XhU9J9Uk4Ie2qP1bw99BXPjRhUQAid
	 zha/AWEQrJ/0QgJZQ2CWYMA5aG5BdM60OP3fdI+7vdGaKDq/OF9lFv3fieLygk4/V4
	 ryMdCYbxWInKHNSn+egpVjM9H7Nq5HUIGgmVzByHBG6u9iFYqlmEZ9GPZNlMcnpybI
	 yLLV/kxLKf0CxTP14fhxM5vCjmLTTCBk7a3WwqKFlpo9l2arqd/exN+mcFhC93hNaX
	 uNq7Vhb/mM/gfAfPpD6/Tr9sehWzqrJo0t9OcfhkdsXwdjVoZwuvCA8TEazfNwkUXP
	 R83GLAvc4HmbA==
From: Thomas Gleixner <tglx@kernel.org>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, Neal Gompa
 <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH 2/2] irqchip/apple-aic: Add support for "apple,t8122-aic3"
In-Reply-To: <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
 <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
Date: Mon, 26 Jan 2026 16:52:06 +0100
Message-ID: <87fr7scqxl.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, Jan 25 2026 at 12:08, Janne Grunau wrote:
> +/*
> + * AIC v3 registers (MMIO)
> + */
> + 

Pointless newline and please make this a /* Oneline comment */

> +#define AIC3_IRQ_CFG		0x10000
> +
>  	}
> +	case 3:
>  	case 2: {

1 3 2 is a weird count order...

Thanks,

        tglx

