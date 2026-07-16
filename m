Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B61FC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 23:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3cXULbKCIHVZXaBSZwWm05rlQZf/t8tj2PxjsvmhEk=; b=xcSOUwcaVNLBpZKZVTBIiZxIfS
	zDjMIOdpUwrl1HJJ4lPBrzpRdwRPUB2tcbMRDC7HhgIMfDb4oZkgaee1GXoHtZDKGF3qsdTDnGlOI
	OjCVoEgRlwpvgb6MoYwCRQewJUDQ8TMkQrn7bCzFFtnIoT7KTFuHYWl5z8WRECXyZso8WBAQU4P4P
	0ay08FBEgmrWDdwyi4rqsm4qGu818aqzMBDYGmmYnOKsmPAhqWrJNRIRsl1JxwYOisajcAp3z3hr6
	goxQb5ANuSdC9E29O2tf33SlIS+4+5Hh5Y95Eod/V7jHqC8cw6uPLm4SfLt2GjtFCSIphEBYBkOwH
	xgrB5dyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkVFr-00000000mgn-34cz;
	Thu, 16 Jul 2026 23:12:35 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkVFo-00000000mfx-2Ylt;
	Thu, 16 Jul 2026 23:12:33 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id F2DD9EC003C;
	Thu, 16 Jul 2026 18:51:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 16 Jul 2026 18:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784242302; x=
	1785106302; bh=s3cXULbKCIHVZXaBSZwWm05rlQZf/t8tj2PxjsvmhEk=; b=V
	McHBbSMI62JlGYzwu6OQy/xohl/s/66EkzaYYt/+QFhwFKpR9hTorD97T/SxIkLx
	wc7gswCXBv96l4Zp+bWS07cdUi0oXx961dtCuAsOsImrjqeYu4HBpQE7pppOpdmG
	NnSHICYxriHahKapvOjbHZHbOO5HcBfxBhNryuMDt/ZLOrnpXubnJJmyuBoC/sTP
	0HsoaiSbp9nxgqhiJcHSu8QqFxxhnDToB58qEaqXibC08+KAc6L8ZIOUzMCyGaa4
	20puS+fTh76geGgjcTbWIlr7nHewXZmaZy5GK+UDyHPPboQ8VdH07/+tnarjgA5u
	dHK+bkIERCbr2RE297j/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784242302; x=1785106302; bh=s
	3cXULbKCIHVZXaBSZwWm05rlQZf/t8tj2PxjsvmhEk=; b=WOmjHf8WmOGFH7u/5
	L7KG+EQypcB5G42/Rqx6uUKCfaHl0RiJrCvrtUItKrm940+vQwerGJZs1AIFUowr
	DobYD/fsgwMKXQ8AALcgBxGwArEi55LGos2e91uyDfvAeLjd93TbPUppq78kGUdq
	QNPWmYRdmi641TVddzNYIEuKsKBnNcgXJrDrl3w73C1xeTDN5RWKqhGMfbLBkYDZ
	V3hWMVKT/DDwh07l4DXeuwmb5X5HF0ynPXfi060qVHNny5FQUe0Y7v/ktAjmbQ/h
	wCrae8gaNkgznYreArvpzXUEE9ADXnhmsbmKrRuwjub+ugn9b0b2fN6gKcbFZfa/
	gRITw==
X-ME-Sender: <xms:fmBZaglz8jEM8AgvPj2b53QieZXxJfVYcmjbUmfAyQE4cbUOJlV32g>
    <xme:fmBZaoAhU7T2YiS1xuqm5HFkAxyo7au_rc949u7XAkvuH509qdAxUt0YYzb0wiCtj
    Enc4ZWh43v0qqrfm4DxIkPCPtTVLk-a0rYyeFzN4qrFDdtDXtvvekA>
X-ME-Received: <xmr:fmBZaqMF-eIdE_7gdJ673U55LCokpNtl7fJxE_X3Ne--nTjxQhWeYyCc2u7-Sz0cbNhIfzBTJkfjR5f-obE>
X-ME-Proxy-Cause: dmFkZTG0kLL2r3BGP8LXEPxN2Zb6VvSqQ9uCR8eBin4CWjH1opqEBzK+o7HzQhPMU+8DaU
    Hg6S5aSkKo2oLZ6tFycACl68psHaw+rt60gPT+fiE16kWsg5izpHh5k+kicW2vIjZlcypa
    ckL1HKlP/PKtzdDCLGSg5ZG1R2AuPb3zfsqqh+cOgQ5JCjK7unJu2iCeXsP8flBJGK3Lzj
    ki6Cj8SbJN8jf9b/dETi4UJdSOAzfE8vmZ2WIfwJTICY+5sDmt37/UaeEIquZwIu7z5hsl
    ohrQyrU78XzMUxpofzdCqnp7o9RJjyG1PHP1BrzoTHTwRuQDuyPkP/u+qlRLqfQSXyszYb
    M6u+rVADxavm/d2ADd/sB2sCXFteBCu7xVCKoiKCcJlCzu+gaPYbubx1Y9dmk5EbatunIA
    7ESQDJIo//iAdO+Md3Kum9jCvcrtu3MKCIupVEz5cTXMwiWwg39qyGqn5eqld0oBBcGht2
    8fvANe7UgHnxhHCqgRKll1tXeRA4o6S3XgeAhxnmZYuk2T199NQqVDTZ4QwJ0MY74e7zo6
    Z1Q2pIwdoJCbalMlM9/EebybbJNTcC04kbfa6ZAl5QBzIzxJuznhyr34F6vEMjVeDrYxTa
    znu1oKvKab13D0y80udLUwzgLs/FC3Alljzrr1aXhuoTXW7CglaEGdItlxRQ
X-ME-Proxy: <xmx:fmBZanNe1E38J-zpkw3OagtFH7E6suGZL4y_fsUSUO3RHNjLDHAGIQ>
    <xmx:fmBZaqnMmbMDe1vouBW7QRbwCaKV3kp7ZrG_m9ia4bHdo5z4xLQU0A>
    <xmx:fmBZatvMDNdDqUYHVyRZ6d_5IRXSSML9Vd2QAc2VYukpP6XC0BS94A>
    <xmx:fmBZaloWL6TbWwnRs3O_BEVVntV8FbXQXjoUSYK2smxb0h6cO0FIUQ>
    <xmx:fmBZavOFncnRBa5ZiakygoOTQs2Dn5odbta26JuGj9JHeg57HCCqDb0b>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 18:51:39 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: andrew@lunn.ch
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Fri, 17 Jul 2026 10:51:37 +1200
Message-ID: <20260716225137.2544880-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e99f752a-da1f-498d-9305-089b9d736e70@lunn.ch>
References: <20260716081711.2482259-3-gahing@gahingwoo.com> <e99f752a-da1f-498d-9305-089b9d736e70@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_161232_840516_C141F7B3 
X-CRM114-Status: UNSURE (   6.31  )
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

> Try setting phy-mode to rgmii-id, and these delays to 0, or removing
> them.

You are right. The PCB does not use long clock lines, so rgmii-id is the
correct description and the delays should not be in the DT. Most rk3576
boards upstream already use rgmii-id with no tx_delay/rx_delay.

I will switch to rgmii-id, let the YT8531 add both delays internally, drop
tx_delay/rx_delay, and re-test the 1000 Mbit/s link on the board before I
send v4.

Thanks,
Jiaxing

