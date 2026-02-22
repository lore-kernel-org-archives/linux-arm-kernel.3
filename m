Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7403BC636B6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/CSVdBwzzKkwCtFcbxbYi/B3jHjcunPSplQZJEY+7c=; b=UHmLXvjOAh/ZsdsDhGThqAFyy/
	eWtwzpGH6BTniaLNQKAOj35H5VEt3j/lzeEcMcJp86BH7shceHqaVYw4nFLoU1RfmICCVInnJ96BV
	58ieMhkOF/27egpiR7q37hVOb4PrmsHD/9jmCY95DYu+pGF8BGY7JWHPEyWwqgEBTKvYAZ6PI1R2j
	P50Dkgnl5Z6GMMZ/QatocIVyI1lmB81fcqtp2SoS8W8maTw6fxNgJATegN8+gfgoIzX+WxdXor4dS
	2DT3LU+h2M2L8BeDqss8u7D8VAxL40n45FFE3EjjRsM74Bzb1+wQo2LCe2CBZNFhyux81ouYBvY9q
	jTorSOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuEFG-0000000GrrX-3y3p;
	Sun, 22 Feb 2026 18:31:54 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuEFE-0000000Grr8-195v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 18:31:54 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771785109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/CSVdBwzzKkwCtFcbxbYi/B3jHjcunPSplQZJEY+7c=;
	b=RuRNP42jd1C0YDEmmq30bCd6GeZXG/FKTRDKC8OohuoG7uROUeE7ScV6/VvKeIqhMsRbeB
	VvpQfG5O4jpCCATD5dUoxRHqT0YA0dBFX3/qi5yi2NANz6ScQAhZMj2QpeIxR4yODSA0RF
	Gt4MUx+AvFZmDWZMyIuCL7s6OIpCyLM=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix uninitialized data access on
 OTP read error
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CAFXKEHY40ybHVbWLWPjOR_wuv5sV9YYXyum6nTT7LHG+irBpUw@mail.gmail.com>
Date: Sun, 22 Feb 2026 19:23:02 +0100
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 stable@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FCD7E828-7951-49E0-81B9-523C1A4DC2B6@linux.dev>
References: <20260220133135.1122081-2-thorsten.blum@linux.dev>
 <CAFXKEHY40ybHVbWLWPjOR_wuv5sV9YYXyum6nTT7LHG+irBpUw@mail.gmail.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_103153_149838_E952E1A1 
X-CRM114-Status: UNSURE (   8.91  )
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

On 22. Feb 2026, at 18:29, Lothar Rubusch wrote:
> Hi Thorsten! So this one was tested on your hardware?
>=20
> Wouldn't it make more sense to squash this with the patch before: 'Fix
> error codes in OTP reads' (which IMHO actually fixes mainly the bounds
> check)? This on it's own I'd consider rather a refac than "Fixes".

Sorry, I forgot to add that I only compile-tested it (like the others),
as I don't have access to the hardware right now. If you could test it
on your setup, that would be very much appreciated.

And yes, happy to squash them, I just found it after submitting [1].

Thanks,
Thorsten

[1] =
https://lore.kernel.org/lkml/20260215205152.518472-3-thorsten.blum@linux.d=
ev/


