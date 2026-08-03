Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A0CC55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysEVWKF2WWNcsBakZlX2KYejEWt8550NvykEr9wiGg0=; b=iP9O/tKEIx79pFnaRzJ0YJyz+h
	QxR2Kq6bh1JaInXTf5JOf9G2y8NMr5gh8LAJJcWA5Sqk4a5/69P/iWHTHJGB1WeGTD7V+wg+wtTNt
	hwaSG25qLdtvVAryAFmZuzCaxV7LhUALqVNR7vFn2gcQTUbCjg9ZU/OD0M6yonMTPJJrrqRz6ZVLf
	iNbJNQNnumekPDUGmf4UT0HS+fr0zz/l8wnQIz2uIN+CAETOzhQa4C+zPJtx68Cf4jbD2sK9VUA+I
	KPtV4H9TiL/rtuVROO4f9y43S7TnqAkIDGBVm4rTPrC5DZgwHrEMhvizZfHT1H3aF6ib8h33QorZQ
	QRiBeQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxZn-00000000NqD-0Dsh;
	Mon, 03 Aug 2026 18:39:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxZl-00000000Npc-0MK1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:39:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cab97c86bdso25905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785782387; cv=none;
        d=google.com; s=arc-20260327;
        b=cIqCKl5j67xoJrEPZ2xrkdXLqi6btGUL83H/MvssIyfVb35LcXM9HHKs14uRexP2wp
         IfdHJZUE8ockBp7kVNgIlblyZqMoOHbeZiPsMa5eCeyoCAHYtb+k031wc9QTOREE/dd7
         0SPyYAkfLV/hmktEEkRoWVdt1uG4n0gnZJmMzCdO5iBeXWvIIpJ5FLCIYH93QjTGSulO
         slnEsghhT7R8UpK4OXNI3V+b1BFtNg9qQ+G8y9SjuFcPOjlzCWhlfSRefNuirI3piq8n
         MJMroWTbkUcwFnsZ38y3ZRSzaJCXy4i1CzX9I/HXbZTxSMax7sW945O5c0o09judfcyE
         rEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysEVWKF2WWNcsBakZlX2KYejEWt8550NvykEr9wiGg0=;
        fh=dDF0sH6iaqZvfLtbdVcghjyPMrsOycVxd+g3cQlnaRw=;
        b=elbbpykZLZs/b0hHmKCHQ5JNR/rrs6RaW3Y4q3ysMrm4VanxkkY26cQ93LqyqPLfue
         HWEzkJolTVgsLcOingdzBRUKrrc4Wn7DJ7SWNQRKYlHwAWpPaT1HkxcTu+2A5R09ilsS
         XclZcIHnaS365lje3htwwv6HYqhPHcvLGx/2RlA/9HOrN3h2TwP3tOuGSeXR8wrbnx9t
         KkdHCOq50sAayRVthkBcIxYtRkVRocaXTrfy+rH1l8bPYtACIyTO7n1rOW2o/Hq7J2NY
         yemvRYniZ60ozns3StnGyCYDynhjFkpDaATC02zEp2+ugLayOBwMrKtLVU1uz+XSdeVK
         YbZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785782387; x=1786387187; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ysEVWKF2WWNcsBakZlX2KYejEWt8550NvykEr9wiGg0=;
        b=HO1Fql2QUEdvAXyS/te4c0Rnm0SGVXaeFIdfYOVZlsDxiEOZMAnQ3ZWKpBEj9uwjCN
         ZpwmHIH7/n0UajYixdLs6K/2EqKpExVaP2HaONW6UvvTa6HmrttU3F34KgpA7fZL/Y4w
         TMPnLeeGtxbttu8k9jn36y9T0vEn5Mof/p/ie9waUEGiXfYvNvzFzOrxwrauWAr1CJ5T
         NiuM3yLCz2u6rhYSDvPwCtnZqxzgbwyRQANAV1MjAOIXNsyiifQAS7OXYLx8I8s4d6G1
         tFtx7+wlx1cASQIsDN3B6uDaXx0CK/lGrY9qFycOkE7tuhuHE3EN36MkU7y898F9tBhH
         irGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782387; x=1786387187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysEVWKF2WWNcsBakZlX2KYejEWt8550NvykEr9wiGg0=;
        b=k0kZ0K+I0lXMXjSLOgTCtTlpe16t9UkYvAcDE2AQIp6uWyNitpLhnxp2oLgQjTuT+1
         cufniodZQPNAaKD/mI3PgdMXTn8oCln2IlsxjZG7PiuffGdCbvshAleCsPXb6AfchbeQ
         0xgAOpOhc6hb+HP4SU2mIhHLhCXYllw2AdtnS0fmwz9aDAn+sLzZz5KCkYEuVXSaB/8L
         7uCghd7nMIWwBP5zRL8DwgiyARQJ6CSD4lqE9UJH858WGClwGSD7q54VNENdSGPxsCdU
         eNjJVxLW0Ea2AgNi/3WiSiEekDBFyM3DLn3pxIxaj9h3hbdmdpOo/o0NroK1Rb/azZ+r
         phyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqL4w1cs0mZ9PvjNUmTwD8HS4tcJP1LitefcJ8SS/sPUgLVw3pEHaPMVvo16UJyUvRUqV59k0soIRksSnBJswTM@lists.infradead.org
X-Gm-Message-State: AOJu0YzIe4iK5tfdbFQiJk25TZqJ0MT/7dQABnfkB4qjA4jK9/SqY4xx
	k/XgwevrzefYV8XfTSbIXiRtKtpbbyUH8S4pSr7MJRcdQsTr0TyzN+Lig1KqEjmLBPz8qe27cg4
	hUQX91XObpqjMLUBSA1ITqCa0Ou9Ohk2qNzb8cpSG
X-Gm-Gg: AR+sD13xD3cdr6GCIlyAvxo198mySwUi0vUtOcO3Ga8dhgJT2IRr0bs50FVGE3EoeH7
	C+yqj7H6ReOEMffyc5NzheJbF6hGdFsGLSqm79PlH7AKTFSyvJay4KxZFs1LK6Ec6CFkGv/lysI
	LRFmLI2kWMpf5JYYDHLbGow6o1QKSDNeF5JpzHn271zm0etgJlOoLEwOay2OfE+JskUCLG9Uow1
	Yha/7icUYxdd/I9F7xMDWe07sZoqZePQXosVtw+HTKJFGvkEoTsCeUmEgSXeOw2XvqUevpPzmzh
	uO+LGtQpaYPStTFJkGSoN0W9uoP4fr8kVoOuJixqCmTi
X-Received: by 2002:a17:903:8cd:b0:2c0:defb:557e with SMTP id
 d9443c01a7336-2d08cda9b92mr1251285ad.1.1785782386773; Mon, 03 Aug 2026
 11:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260803070513.4657-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
In-Reply-To: <20260803070513.4657-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 3 Aug 2026 11:39:27 -0700
X-Gm-Features: AUfX_my-IXUAAmiOm1dPrWOoSLO_UNWLKoIxVmuwUTZRIKlicpuwAkpUNxi7N9c
Message-ID: <CAHS8izN1mCBH5=ERy9OKaeC4Wz2-v2N2oGDW34P=ZoS7oo2aOw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: stmmac: Use pagepool instead of
 streaming buffers for Tx
To: muhammad.nazim.amirul.nazle.asmade@altera.com, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, dinguyen@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, 
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_113949_124801_4AC8C145 
X-CRM114-Status: GOOD (  16.77  )
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

On Mon, Aug 3, 2026 at 12:08=E2=80=AFAM
<muhammad.nazim.amirul.nazle.asmade@altera.com> wrote:
>
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>
> Use page pool buffers instead of streaming skb buffers in stmmac_xmit
> when snps,pagepool-tx-buf-quirk is enabled. As page pool buffers are
> recycled, the overhead of dma map/unmap for each transmit can be
> avoided. There is a trade-off of copying from the skb into the page
> pool buffer, but this helps where the copy is cheaper than dma
> map/unmap (for example with IOMMU invalidate cost).
>
> Currently page pool buffers are only used for single-fragment transmit
> in the non-TSO path.
>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.co=
m>

Whoa!

I haven't looked at the patch deeply to be honest, but using the
page-pool for tx is a bit interesting. There is no other code that
uses it like that I think. I can't think of any blockers off the top
of my head, but I think there are places where we keep a global list
of created page_pools on the system/netdev and the code parses those
lists may be assuming it's a normal page-pool, which is a pp used for
rx and attached to the an rx queue.

Just Ccing the maintainers of pp to know about this use case. I can't
think of issues again, but I wonder if a more-expert has thoughts.

--=20
Thanks,
Mina

