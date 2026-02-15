Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE1CE63F08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 21:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98u/mhEqw/mlD21bgRdDI+M2Mw8p79SKwci4AWwqc9s=; b=1GRFho5KdZIqhln/fWyGtNoQrJ
	Um+MYtWzQrDXqCtVakrYi0hy+mG7s6j3yZfZaAv9EuhagK9k240rptQvKhAkK7PdJtx3rysXH1Cjy
	nQGR9M3nR3/5NlUxku340I7jcZWsSvcHMogqPgYV6xRAS9OnDX9ORUEDvVtDI2WcMVINW8aPTkM1h
	iXXOtqwsxurMJQhfyxbAqIwZE1HIO4jhrv2Hi+cb0Z7SQbg/koiiWVL76ol74Eo9F8s72YP1DRdJn
	2anG4pzmTHucdoR90ulLrmt0T2hc5a+gQV29SNjuvyjLYGhHTyOYTZOjtne+cxlUKjO5zm2FSvSj7
	+nPPIlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrjyy-00000005gcJ-3f8E;
	Sun, 15 Feb 2026 21:48:48 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrjyw-00000005gb8-0sHg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 21:48:47 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771192122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98u/mhEqw/mlD21bgRdDI+M2Mw8p79SKwci4AWwqc9s=;
	b=nLGda3Vzr5Y5NM5gJVHotmPxaWHDgePF6zCsEFeovvzIdPqJYOMW19qUuGfzdT0wYmzpe9
	YxdTYmunGjeNjmbKJAkCtf7+cN+4AQ7U8nELfjj5s6fryPRsui7iGe+i/v9mXcHSyQLS8W
	9T29ib2rctwBUsNvk/DyjXBiXDb+c0s=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix OTP sysfs read and error
 handling
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CAFXKEHbCrp57ruvCF2TXXcnoJF93Z5bdUd7Nt5WtM9_abtc66w@mail.gmail.com>
Date: Sun, 15 Feb 2026 22:48:07 +0100
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
Message-Id: <2E9C85C9-AD05-4BB3-A945-5ADECCB5C7E4@linux.dev>
References: <20260215124125.465162-2-thorsten.blum@linux.dev>
 <CAFXKEHbCrp57ruvCF2TXXcnoJF93Z5bdUd7Nt5WtM9_abtc66w@mail.gmail.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_134846_455090_377DB773 
X-CRM114-Status: GOOD (  15.30  )
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

On 15. Feb 2026, at 22:09, Lothar Rubusch wrote:
> I tried to verify your patch on hardware today, unfortunately it did
> not work for me.
>=20
> My setup works with current atsha204a module in the below described =
way. When
> trying to dump the OTP zone on exactly the same hardware with a =
patched module,
> it only prints '0' and nothing more, see below.
>=20
> [...]

Hi Lothar,

thank you for your feedback. I made a small mistake in the return value
where I forgot to add the previous length 'len'. Sorry about that!

Unfortunately, I don't have the hardware right now to test this - could
you try if it works with the following change?

Thanks,
Thorsten


diff --git a/drivers/crypto/atmel-sha204a.c =
b/drivers/crypto/atmel-sha204a.c
index 793c8d739a0a..431672517dba 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -134,7 +134,7 @@ static ssize_t otp_show(struct device *dev,

	for (i =3D 0; i < OTP_ZONE_SIZE; i++)
		len +=3D sysfs_emit_at(buf, len, "%02X", otp[i]);
-	return sysfs_emit_at(buf, len, "\n");
+	return len + sysfs_emit_at(buf, len, "\n");
}
static DEVICE_ATTR_RO(otp);


