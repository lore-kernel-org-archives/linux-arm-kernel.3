Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7188C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIb23wfO7R7H8MNklKKsDP+RsX87PaDNS4GSIFnlxoY=; b=YsPG2VanTQs5rnnPd4Bg5ByZmo
	L56Pr8EiGA7boG083YjCPywWX/ttm+hpVHC71wVHn3BAZw+xACq1O6rgfpKWVfjlJVHjuO1Pltrbv
	wYaqj7pH7POid/ID0b2ugld++guNQPCAiNtm8Yfh3Bf0k+UE1d3ExrH+wdjbjZzk5iCrAWIx4nDa1
	fYmaZ1r/VcWEwZpGQxnMDDQ5mUWqfks2BZcy2vwtTGZF3p51wH8x5VbXtHFBjW2IdvahuVSPZ5XQZ
	cpJDRCnPVNTtwRT545+tDPivFaFLKTL0ivGwVNSj7ZmLFyEZ+FWIfAGUmCofJwDU82Q5IBH3lVQjQ
	GRylOr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZonw-0000000BWXr-2oQS;
	Thu, 10 Jul 2025 10:47:04 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnTW-0000000BKRT-127D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:21:55 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-70f862dbeaeso7886917b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752139313; x=1752744113; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CIb23wfO7R7H8MNklKKsDP+RsX87PaDNS4GSIFnlxoY=;
        b=ftAmvR5kqripaYi7mJ29jP6nzq2/P/0HFKP2/KTLY4hFGOr/4UEdbLZYLJvSAvNKQg
         YjBhyrBfcJ44AkdfgXx4KV9+j0tX+VtS51SN7RkK/gOREGuNnxgbESBmrNZ4nf5HtFIE
         j05DFPsHoPm4UZ4SHUxmsXJw8z3qi1dgIG39oWch4jqfa2uHgp5WS12USJ2lT9B+1eul
         c5zvjGqVl0/8gCMx2ntYDy51wXdPmp4kvYdoj0C9o+tj8gPymFeLhfHw5poKHYT5Jofk
         HyK6rcAeBkA38tCUT+ghaEZ6aLiPkRE2j8zW0KhC+bk9b4llz6nvtVx7JBsZfXfUWl56
         tACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139313; x=1752744113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIb23wfO7R7H8MNklKKsDP+RsX87PaDNS4GSIFnlxoY=;
        b=Rn5EUjRSSC//GUICRP0Wi8FPcE2j+DqQ1eiAHddNTy1k/zhpij/D1Bz4w7eRfcIE8k
         aFxU2Md8/QvvP4OwUkAADKW49lK1yKNjTeMRaIo3aRfLU7xHDlAGT7BdpNzv+p6qHPDB
         CQMqx++JGMZGPk7SqD4lAQsM6xdpJQLdr1p7Q4Vi5FPjCjaz7q67GO5Nj3Ck8cMaLWgW
         QpGHi1gJDw/dSBxlbnwwvSG2vEduFF20rCn8csd3LY41wKjUSYFbHLrSw5U24sNswm+T
         3aQ6pzGNnfC/nmXOF2xa8qVhJ3/OSuDEabRuZxhO53mPs2Dy7xGihnv/PJWPjx1bcAaY
         1jHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5uc95YcckYn/1KJAG+QFGV0KHtXtmdwb4qMyUXurdGlWe3iUl2u7uTrbzHeo+d5nWqNEJ4flFk45mgIYB7rB8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj7gYInSUli/cV+dWHBpnPzQod/zLa+T3VuCIKLOTT9iVFV6DB
	w/5uwFJS7qYJbts9MHHKrBxuewl1FvQ+Ta4LZBjRBT4QgHG98KO/PJXLDbb5ddjhxnwRQJKe566
	B6g5A4Sl2qy1yuPsf/fKR3MsmaZ34hbU9sKLuVSc=
X-Gm-Gg: ASbGncvao6KvHrOnDdzgwbhvZnHITwBYzq5h0q2/JqkVkLdX+Y9Jmgkxm15ikDwHvY2
	7/OORQotYrh2mQv7KgOMTe0uqQ4D9sHdssHnk8VOi1SPmrZyEZ1LL1Yg//NXUR8YzKTHu1EvK1a
	55ATu4ONBnm+3vk10uopx5/tErk9djEeD1eNnpgHkJ2g==
X-Google-Smtp-Source: AGHT+IEyihmR4k6j+d3nRg7Al2UjBfOwUKJgCp3uoe4n9JUTn8NhsBjL7wuXahr5HIPQlLPnZdlvYqaWnH6iYhxgRdY=
X-Received: by 2002:a05:690c:6908:b0:70c:a0c9:c648 with SMTP id
 00721157ae682-717c1774a36mr45258857b3.19.1752139313148; Thu, 10 Jul 2025
 02:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250709220714.85697-1-stefano.radaelli21@gmail.com>
 <20250709220714.85697-2-stefano.radaelli21@gmail.com> <9b503f65-5c8c-4f04-a1b1-40d7a1202e8b@kernel.org>
In-Reply-To: <9b503f65-5c8c-4f04-a1b1-40d7a1202e8b@kernel.org>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Thu, 10 Jul 2025 11:21:37 +0200
X-Gm-Features: Ac12FXxMoCORza1qjA8bpnm1jhAVYXGS6gK3JmG0IlhKcdilmwXZ2lWiCDsGXZI
Message-ID: <CAK+owohgk3CkQRv_PBDWXh44X2uN3p8FWBU2t9VtmO-xzOKTow@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022154_283101_FD23178F 
X-CRM114-Status: GOOD (  17.71  )
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

Hi Krzysztof,

Thank you for your suggestion. Actually, our compatible strings for
Variscite SOMs follow the format "som-factor"-"processor". Here are
some examples:

https://github.com/varigit/linux-imx/blob/lf-6.6.y_6.6.52-2.2.0_var01/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi#L14
https://github.com/varigit/linux-imx/blob/lf-6.6.y_6.6.52-2.2.0_var01/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi#L15
https://github.com/varigit/linux-imx/blob/lf-6.6.y_6.6.52-2.2.0_var01/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi#L14

These strings are used in our Yocto filesystem for WiFi management and
other applications. Changing them would require updating the entire
Yocto configuration.

Best regards,
Stefano

Il giorno gio 10 lug 2025 alle ore 08:50 Krzysztof Kozlowski
<krzk@kernel.org> ha scritto:
>
> On 10/07/2025 00:07, Stefano Radaelli wrote:
> > Add devicetree bindings for Variscite VAR-SOM-AM62P System on Module
> > and its carrier boards.
> >
> > Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> > ---
> > v2:
> >  - Add symphony carrier board compatible
> >
> >  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > index bf6003d8fb76..780fbb5970a5 100644
> > --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > @@ -100,6 +100,12 @@ properties:
> >            - const: toradex,verdin-am62p          # Verdin AM62P Module
> >            - const: ti,am62p5
> >
> > +      - description: K3 AM62P5 SoC Variscite SOM and Carrier Boards
> > +        items:
> > +          - const: variscite,am62p-var-som-symphony
>
> This is named reversed. Usually Variscite names are var-som-foo and:
> https://www.variscite.com/product/system-on-module-som/cortex-a53-krait/var-som-am62p-ti-sitara-am62px/
>
> confirms this, so the compatibles should be var-som-am62p.
>
>
>
> Best regards,
> Krzysztof

