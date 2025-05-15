Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C0AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJZrSFBkNbM1G4hOj8s/L4+l2f6c8+4aH2wqD19Gqc0=; b=NT8oX9SwcULIHTny3P9DLO4Zd2
	nYj6zrgGK9B+fBqPXeR7PCsdSlaMkjyUsXfRdmHoHV/A1lFb5k7Nh7Kzasyuprwjd43lFZXZ/FVXs
	za87mKkNNNIvTgRWGWfscfkOeBiJsSBqdkT4zNIwFhHEyakvADp22ITaLQHj913chTnRuXBMmNRtc
	ECEM3UhgsxCZSXlGkp5qO1QlcR0WmsQ1REDwZ1QunUbsQeqoUouu6qjAZNY7K79U/OyMr9uVXKxIt
	TCBmwBJ5zgMXq230h2usDViZm5VPps4xmRnMai2d7T3LYBX1y2DNxI9S7D7C0eYRlgS/0Bx7agtGu
	R2XBrPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVzA-00000000JhX-2K2R;
	Thu, 15 May 2025 10:38:44 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVkb-00000000Hal-3epW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 10:23:43 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3da74959554so1898065ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747304620; x=1747909420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJZrSFBkNbM1G4hOj8s/L4+l2f6c8+4aH2wqD19Gqc0=;
        b=XCPWtKMseh/EfrfPnpjWVO0h4Adl1cvQqBjRf/JjDU8612oqezMsOLIPtCsiD5fKgY
         Z4nGAocJei7X9Glm1mpUS5DefHRG4G2B4hHV7H5kxIskyn5AXCT+3ywPfqDvusDEjOaL
         r+sx5NGoI/w3JhpLZx+oia+wysX1MvnEthJpRNh8CL1znjkErgyy3XHUaKSzcpmT7C7T
         LVz6ZSErltbhxP+JqHG+wyP5gl62YQJF3FOVZzwl8fpBGCMQSWju0imOecrJatNZ7DG9
         8CUOXHe2eHZxj4EOIdwHsEsCCRlT1CXUm4Qr4X7F2GdBhjXqkmpeKtr7PtOesGRT6jF4
         vVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304620; x=1747909420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJZrSFBkNbM1G4hOj8s/L4+l2f6c8+4aH2wqD19Gqc0=;
        b=rGgxSUcPnP8cRIlU75pQUGG2N1JQMtwmROlsG2JopGVlZrhzxF9KNOfa5aXcoShCwn
         wjxdZbxtqtq7btaRZ25GX3MqFTDyqSAjZoUyRBmjLa4Xz7rFR6vSpuuC8aONDAcJa14+
         NFuzbzir6v1LHm6/qCCIvE1edK5/Ypaux+WGG/zNPOCNL2lQYYFWtYmHtORdUZp6d/Js
         sysHht6SnxYCpdFSfXFcWMTsV6mweCYc1lKli4Lp8Lj0yoyOxAxZ9/dmVkLyllac3PC6
         y7CfRYHUPXa8A5OjebinGPLK7ZlU5KurN7RXL1k/geggQ3PFGNq/S+aigxCCkGHhSVRO
         eYBg==
X-Forwarded-Encrypted: i=1; AJvYcCUGF0smodYNt8kKpsDStMuDf/fUvpyeuMddDPwd49hhJpYWZGbtl0q/Orbn1tVEzs6MWcElfZ7bXf4ircbA7ecN@lists.infradead.org
X-Gm-Message-State: AOJu0YwoAsQ68q5XBKf8pbA3uG0OdcpCa/vK8iiEblLrAfUh7JYhLYBw
	wi8g/Q+EGQ3+/XRHo+hAshwjrYYeggxM5CvCInCJsMkEExa9P4uvLxqFTlckypQFF0W+GuqS+Tf
	hj9kq9j0tyvCTCPAiSLyvUaQjE0JdOQ==
X-Gm-Gg: ASbGnctyoeWBuJ7LZR7vzkERK/FsyvThWnrx5tYSrCP9s4TmVfX80ivqAWegd2S/WnK
	DH8/5fuImAfsy/GXTbRPdltF1VAFPTuA8DIHMCfHkWikCpUro7rN6MNnMJcaU8j35gLH8FaghTr
	SL3eUOTdjJL4M4mLSUsNJdxyVkJPd/tjXj
X-Google-Smtp-Source: AGHT+IHO5NjvG7NPaTx/Wk84Xf6YXEN9rB+dPDyiQnC6Nqm2qSNMD7m/f1k9O8ljI/qF9B+KJKVTOxllmfRsmBxkeqU=
X-Received: by 2002:a05:6e02:2186:b0:3db:75e6:80d5 with SMTP id
 e9e14a558f8ab-3db75e68272mr38100995ab.14.1747304620350; Thu, 15 May 2025
 03:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
 <20250515051900.2353627-2-shengjiu.wang@nxp.com> <CAEnQRZBJgJpyE-K6fn3_s61-Q7j=mXk5FGMggpaBhnH62w+ACQ@mail.gmail.com>
In-Reply-To: <CAEnQRZBJgJpyE-K6fn3_s61-Q7j=mXk5FGMggpaBhnH62w+ACQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 15 May 2025 18:23:26 +0800
X-Gm-Features: AX0GCFs1HwaoDdoFbQAbv3WJV20f_7O_khUEi6c3pJChsc5rxc9dD7nQQ1yVecY
Message-ID: <CAA+D8APSQK8FqGYYmAygF-dhM7N_54Zw-jSz4xWrr5ToGfUKmw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, carlos.song@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_032341_909123_2B901FD8 
X-CRM114-Status: GOOD (  16.19  )
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

On Thu, May 15, 2025 at 6:19=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Thu, May 15, 2025 at 8:21=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > Add micfil and mqs device nodes
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot=
/dts/freescale/imx94.dtsi
> > index 3661ea48d7d2..77297dde5c95 100644
> > --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> > @@ -108,6 +108,16 @@ scmi_misc: protocol@84 {
> >                 };
> >         };
> >
> > +       mqs1: mqs1 {
> > +               compatible =3D "fsl,imx943-aonmix-mqs";
> > +               status =3D "disabled";
> > +       };
> > +
> > +       mqs2: mqs2 {
> > +               compatible =3D "fsl,imx943-wakeupmix-mqs";
> > +               status =3D "disabled";
> > +       };
>
> Node names should be somehow generic.
>
> So here, we need to have something like:
>
> mqs1: mqs@<ip_addr>
>
> similar for mqs2.

There is no ip address for mqs module.  The only control register is
in BLK_CTRL.

best regards
Shengjiu Wang

