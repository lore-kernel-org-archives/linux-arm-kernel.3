Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AAFC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rcW83D0FgJqP/k3DifjhLl2F+5l3cQ4k1NrP9DKuhU=; b=ZnmARcYlKYUUJ74ARF9488To6B
	IW3k5EUfDggxNQQZis6d2ErDlJDWoPAFWn01k4YZj17Ai5bGSTIKTm1yTRMSXEvfRS8qrLgGs/FwZ
	BVCdncus7KZnxKowKtk5OOna+u9pDynVhcA7WNra87LirmDb4+y6Kj/p0l6lxKIyiFyWg6aekPlLD
	EHj7PqdDYGQu3TDT51BeUGVUv6ClBv/LbT3nywdqgHXcSif4qs6DP4QEjY+gVvG1ZQBJe2wxp2kfF
	CDYXyxdMBmygRNkelrnbDBh9ztFADMZcvWB4l9KRgmXHheaaMCGW3CBh0uMGbmcSnq0XG198oSuHg
	9tXb6N7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8lt-00000000MgK-2zfS;
	Mon, 28 Sep 2026 10:39:45 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8lq-00000000Mfm-3nUB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 10:39:44 +0000
Received: by mail-pj2-x0d.google.com with SMTP id d9443c01a7336-2df8bb777e4so9534455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 03:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790591981; cv=none;
        d=google.com; s=arc-20260327;
        b=gG/WTn128SK9kKsWaYwB+y1qSX6mGok9cNz5QeIxm0wZVfLKAZcb26UrISXbEWfaBH
         R1jvjUs556qV+5LGt2p5mfQY5ZyBIAgBz4dX0kAdNea4aoBKPAD/PA22iCKQxQmSQuur
         CJXjVWWWQqEYnpwnVpDxm4OrdIi60M0Di2xdu2FIJSFhIRroc1mJ++ACVmqIhdPgDSK0
         pxkXWJlcxsp+NSJCkXDNV6uffUA7zwtPjPaXV+NDim8zfGRwO3Wi/FyAtkGG4eu/RIIG
         HAQesqjWetiXpJc65EXlAPwk9bKWI+xAI733RsWbAVGhzhRWeY69lkG8uGUFjdfuf7me
         /fTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4rcW83D0FgJqP/k3DifjhLl2F+5l3cQ4k1NrP9DKuhU=;
        fh=vnistP5lFc5J2T6R8YtUFYkNv+rzBnyAy1W+xNoE4Og=;
        b=ewlanFyIcOyvo5WTLosrVP4T/VlPoNucTZF6GU15jr9A7u0HqaWVf3SIGeq45WN7ip
         UtibbXbsg5Cgd3RByTPfewoJJLo8quYNRlyI9sIFZ1QFiZAQfoEA8h07eyNjYoCke5H1
         w0ZcIr5HRKWxe0x6oRftCEcrMQMMfcWnalK3vyRxg/BZgzlOr2TOUET69RY/0BqAUmkP
         NIs/LOlFVuAX2eU4wenwcLfNUX3HfZY+lMGAeDV0htiS7XHdtMBptEaCUiFG8Ry/nUrX
         S2ksKNVdtlW77UrGCN5D1bOQpU7gBhNf0hAhKxxxNfjFVuCUDWQv3hsTv4aL3npTnfRa
         JYxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790591981; x=1791196781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4rcW83D0FgJqP/k3DifjhLl2F+5l3cQ4k1NrP9DKuhU=;
        b=RhW+lW2qkdaJF1hjlOgadgfJw4WG1d9lH7hMV3Jtp4uURFdiZCC1g4sdzSIbCRJ3q7
         yWQFuLkiZOmoV1Y7uIUOo21iNEHuau9UMTtNCYLm857K5T3VLGrq8LpgKOjiK7qVQ76s
         49EuzJ7o0fuzL8lsFNTZmQG+K7W08XB70xASIYoBw1ZbdGAI/MAKim1ULVtna0OMHKfT
         ipTXeDWly/WYJtZn+1PL3waSrAX3jPzT1obqO64hZVduLid6tu9N8xFjEJdY76KbPN14
         u5dkuUHv9UHmAPYSI3hbOsypAoH4/3vz80lorRVeXxwA75wA60MTQQDLbbUCmU93fYUm
         svyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591981; x=1791196781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rcW83D0FgJqP/k3DifjhLl2F+5l3cQ4k1NrP9DKuhU=;
        b=KV5IDLTczmE6KvyTKqED5PIdjldWPrQnaiMXGargE0rklsqns07q0laGXcVez5Pp3C
         lvNC7jWPAVMgxxE8QOFpZ9xhX/NPxQpP/c0nWz+xwmYQCIQHt9P4WFuvCkbT5NzaDxcc
         TlM8uo5JB6+0MfHYm8QgBMwyQwrYEDNdyxZilYr7I5nwnqicqxZ1sxpWC6SVqNHyo6f2
         HNtcXIP7tTKji03UiJrsbmekxrKnNIwNtVgzczsC8xvue2CQJgnc3kWeVIlF3magT1Ss
         Nme6GGFsu6aoSXRwwP93MDdOIt505MBWeKQqrpYYAhduWyE053ojZIFA27F0Oni4eIs7
         CbBg==
X-Forwarded-Encrypted: i=1; AKwUvBwf8e5jW9d3kW4nDtMHvYPe3e1VIxfYKnn2Siuj5BiFhK2iS2GEsiMh6QJV4ImXVgtg3Hmy7v92AcU02NeE6qFL@lists.infradead.org
X-Gm-Message-State: AFq9FYIafU+/AnSUo1HIA36vCexZExKqxsq084qu9ZytEXsOfpOzjDrD
	fhswG5JgDiZard0DR5PTUixORZFJz0yOfmhSgQW+SKZQwcyyWtJyTwYFvNUfGh2k3aNo9YNZrHf
	HnSND23DzctzrI6Sco3J5yVMdAEAIh1P2XmKMZHkR9vBXC+jQmLkz
X-Gm-Gg: AYBFou0dFup7Ou5XQCDs4GdkyF7pKIWdFsuNCB/I6Gzc8RX/ZSnVZKfCvq+qQ1Ekp8A
	FPEqtU7UQD8QZ4kKMo6wesCkmKwnMGxudrrs0gYCFqFtYvUwLC90Ne7pweRFw+CzARS7jPtwljk
	vFqAkL5LNvnA+paMMCVnRHMPxTQEl3/JNGGHa3agyZh7opUUqNso0R8l5mNF8jeBMolRspoS2pp
	IWKMs7IMBX5Mr4cg4/vJoquVeoY3UaTN90Ad5S+1jdnZwAHOCg1LfzfLZBmSRe2FtniIDsq5LGj
	EXY/B/oE+ptgI6hG+AOSS7RaH2VdPYYpbSNpdrYrfgvY+c2FpfGAMAE5+kzEHdkFltNmI9pNWyr
	RTvkkcjNT17xfRxsRLBLwGQoYMGC8anRObx4=
X-Received: by 2002:a17:902:e952:b0:2df:950d:8f4a with SMTP id
 d9443c01a7336-2df950dbb74mr71445885ad.22.1790591981383; Mon, 28 Sep 2026
 03:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260922125112.2111256-1-robert.marko@sartura.hr> <20260928091804.hjnabzi52kz4ktmf@DEN-DL-M70577>
In-Reply-To: <20260928091804.hjnabzi52kz4ktmf@DEN-DL-M70577>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 28 Sep 2026 12:39:30 +0200
X-Gm-Features: AclHuK-gDDCHfBtLac7JhmAB4p3Emj0wmBDLbCuTQrCHI_3_hiMQa7CF_cIXvSI
Message-ID: <CA+HBbNG2nGXpXC63AVUJX3KaqzJG+Q=-Md92eTpq7Y-O4CHMzg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: lan969x: correct RGMII port mapping index
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	Steen.Hegelund@microchip.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_033942_957341_1D4FC166 
X-CRM114-Status: GOOD (  30.79  )
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

On Mon, Sep 28, 2026 at 11:18=E2=80=AFAM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> Hi Robert,
>
> > Currently, the lan969x_port_dev_mapping does not check for RGMII ports
> > and just returns the physical port index.
> >
> > However, this does not work for RGMII ports as they have dedicated DEVR=
GMII
> > register space with an dedicated instance per RGMII port.
> >
> > So, check if requested port index is an RGMII port and return the corre=
ct
> > DEVRGMII index.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c b/=
drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > index f3a9c71bea36a..bf5320c7a6ca8 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
> > @@ -142,6 +142,15 @@ static u32 lan969x_get_dev_mode_bit(struct sparx5 =
*sparx5, int port)
> >
> >  static u32 lan969x_port_dev_mapping(struct sparx5 *sparx5, int port)
> >  {
> > +       if (lan969x_port_is_rgmii(port)) {
> > +               switch (port) {
> > +               case 28:
> > +                       return 0;
> > +               case 29:
> > +                       return 1;
> > +               }
> > +       }
> > +
> >         if (lan969x_port_is_5g(port)) {
> >                 switch (port) {
> >                 case 9:
> > --
> > 2.55.0
> >
>
> The mapping itself is right, but as far as I can see nothing upstream
> uses the returned index to access DEVRGMII. Every caller of
> sparx5_port_dev_index() pairs it with sparx5_to_high_dev() or
> sparx5_to_pcs_dev(), which never return TARGET_DEVRGMII. Those paths
> are also never taken for RGMII ports. The code that does access
> DEVRGMII, in lan969x_rgmii.c, computes its own index with
> RGMII_PORT_IDX(). Sashiko, correctly points this out.
>
> So I don't think anything is broken today. Did you see a problem on
> hardware that this fixes?
>
> FYI, we carry the same change downstream. But there it was added together=
 with
> RGMII MTU support, which reads and writes DEVRGMII_MAC_MAXLEN_CFG() using=
 this
> index.

Hi Andrew,
As pointed out nothing yet is broken, hence no fixes tag.

I am using it downstream as well, for the MTU change support where as
you pointed out RGMII code
uses it to get the correct index.

So, I thought that it would be good idea to send it upstream before
eventually getting around to sending
the MTU change support as well.

Regards,
Robert

>
> /Daniel



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

