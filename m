Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAABAE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osyXKRqUv4PvfNbOFslNjYYNVIaS0mD+W2/0VCKnb7I=; b=2NjCUaLLGKYqzA2QGTdUXihMuP
	LUsCUi+DEIKynoOxreB7SGraj+Wy1CJ3Xbo/SdZhRIsjealddqsKcyEXclTtK/zQ3nOWtIhtpWRln
	9GJz7TzcBRfB3ioNa5W6kCzaEdTlhHXrthOCe7Bl3jgUIU1dxMoGvS/GWcPFyhyysaUCUBRUJBynb
	GsU/gbGbNEUDRCl35I+LRdwsSDAFzHFOhRt/gKhGGuI/KOzhmfUQ4hHmt32SyJss/98DoCEDv3Zuq
	paSCebOyEM0kaqyblmbsEyOhUcGlpv0BNFurkPWfp7rTDhG4zEzpnkpVwhBK7lD/Aa8SbNXhNdr6l
	GrmUAn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPe1-0000000FTC2-2weB;
	Wed, 11 Dec 2024 16:33:01 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPay-0000000FSW9-4At9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:29:54 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3022484d4e4so34062541fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733934591; x=1734539391; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osyXKRqUv4PvfNbOFslNjYYNVIaS0mD+W2/0VCKnb7I=;
        b=Th8DVI7htbJwFxhrvfl9PRmlIFB94ni4jywOgUj0PAPCqsHycDU8BphapUVPgnWJ66
         y27URZleWT3KvfHSAqY5u8+4dCL8VdDx8aZw1w8Pt9kVXjObxsPh+jhw2E84kSKKHP/g
         j8982IeGLh5yAeYbfcVRPbv4bNR1Lr0QSGIW8v8PsT9Obv14RZI1PVjYkRVX6rNOuQWv
         fu5PIHeZJihetc9tLZ3ppi8Sid6bu5HDuEVI3zk8wEHtnryeh6Gm+5C84DbO6BAfOBcs
         pir3AH1uPWjTKDi2ZgZkTfwBKR+GxZdqhZbnqzMnTTH9pIJQ494uXVSDffQu6CrkS2zY
         VopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733934591; x=1734539391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osyXKRqUv4PvfNbOFslNjYYNVIaS0mD+W2/0VCKnb7I=;
        b=aCeGb2lOKo3ZDR7aTGH607wuZL1iMYACBQV612IYfEFgiPVHXTKkEZW5jvlDVOQsmK
         NNlbWgUQ6T6PS9YN98Nv7XaddPQ+9msiPfbRMEgnq1/5TLydozsn4rN+7qH5WE3/FKCL
         J+c+FTBSUeZuraGS9npc41MKwovPp64fiXNXG1vfpKqlfmmEb/LFaE29EuhvO+1YWOPf
         FLyx6OGVGNBVg01tTfU5hIawFoRjEgGVuHc0nvPCSpbFdnWk9Ha+XLVGiYm+VyR3QSBW
         ommQtjLQvm7AdEe+0/djBDd8e+gSxhp7T/SU68AhDMoPoabYVlU5nIwCITaN7rd/Gtat
         PXeg==
X-Forwarded-Encrypted: i=1; AJvYcCUVpkGvlaRBiPsxcX0GOgTkTBhtzjOFSrcpWcXyQcPs3powqPiY0phcLjMnPCx5iYp7b7h8sRMNFaq+gHIuuKN1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1KIQdUYcKF5Pxsj5S802prIqF7fFY8r58zMnYfv/Um4djWmn
	IYx7wNFAfETANvHWarLQIxp5MRXSVg11eSxyKYNWGIUcflnnMrDcfaaDUIO5kATxcifZ81w2hcn
	iTjf0vnyGo6s40FW5jUgACXCBEp8=
X-Gm-Gg: ASbGnctrxWc0FDWGtrnvon0h3UVcEKuJOiH6R9J4z+eeV7DIBO19TKm7iGDSXnvymEu
	KfR5FHu1EOSdsLIaz8Nyn6PEj20VAtStEsNmXzaSIaRYykUfNNQIfEXxdVtxLviw/1Ko=
X-Google-Smtp-Source: AGHT+IGYVMJ6W3ctYMQ7NC8ivi8cFDMpjmorS0+eO9pMHQYMNw+7Ad3Tj/sNuMyEstWHwoEfJ1/yML70vfdfCV99C5I=
X-Received: by 2002:a05:651c:221a:b0:300:2c9f:ac51 with SMTP id
 38308e7fff4ca-30249e0465cmr677441fa.2.1733934590663; Wed, 11 Dec 2024
 08:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20241210105705.116116-1-festevam@gmail.com> <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
In-Reply-To: <yujvdu3s6v7z7th2lrdscqfxocx2zy2u4owakisvnjppz2udqv@5ok2rcf4exd4>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Dec 2024 13:29:39 -0300
Message-ID: <CAOMZO5B3810+4RJsPUtL3ASxqpDd+UmC=GcY6t8-ad7NZXZLjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add compatible
 for AUO G084SN05 V9
To: neil.armstrong@linaro.org, shawnguo@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_082953_029820_28AD0570 
X-CRM114-Status: GOOD (  12.73  )
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

Hi Neil,

On Wed, Dec 11, 2024 at 6:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Dec 10, 2024 at 07:57:04AM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
> >
> > Add a compatible entry for this LVDS display model.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> > Changes since v1:
> > - Added devicetree@vger.kernel.org on Cc.
> >
> >  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Would it be OK for you if Shawn applies both patches via his i.MX ARM tree?

