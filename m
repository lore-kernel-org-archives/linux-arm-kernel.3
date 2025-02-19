Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D5DC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CCUQvs7skbbtsR/YI3q9DDNHuUZH7nkoZeezReFSZA=; b=2FfxWAGQVjBz6dOOpaDzrWvCkh
	+RP1nTqhDki274Py8HnYtj0gi2SDScZEH/XPs3X0CQ1TcOm9M5eK93DfyvWe8OK1B/kDFkxFSMxoL
	zMeMe9fQjTjWKA2zuqGxZONVCK7LosrMPoc5+TzAm9hIBWQPBL6o0Of+06RDbxGdPomGAywBDJYHC
	6FEIEMgtQdchWSMt9vdytvHtgZ5ZTb3gmq+bSIBB6lo5pCNX8vO/OjceS+NCweXf+qw1QMBE4HSSB
	05dF0p5QfupMBtvX9SyJDJe5qVzM82in1uYcXCJKKUaXZZD5nviN8PPDeDmm4EzhVvrWCRbPL3gtm
	dv7XFCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfn0-0000000Bdyi-2Ayf;
	Wed, 19 Feb 2025 08:50:42 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfKz-0000000BU5m-3Xcl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:21:46 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fa48404207so12868208a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 00:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739953304; x=1740558104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CCUQvs7skbbtsR/YI3q9DDNHuUZH7nkoZeezReFSZA=;
        b=U3wNEqBwQtqRciqFeh8BUwR7x6KSAktJmsjbiHXzl9lEin9ysWS9drZvnnE6kXsQ4j
         74gYg9YKlFjoIbAGsmd8dhiKW7949t1MV9TpIpAcgx2ZKBsxVFvogxWV79nL2S+kGhst
         SqoAMwy0S6TKTyXQSZufnzzedU98j/tdSJBKjNFN6KZUqQQeDOsK+JmHEDnzQm1lDkCN
         SEtycT3HCRYn7XzmASHEbpKn907NofnU1dDOpKCX61CMUGl1acLNNJzEj0gNORNACBJ7
         mvKjbQkZF77hXLZ5Zz+EKmynkzhqlyhoqq7zkI1GrqAjCpn3bIrsrDWiT6g1VIcj6LMA
         etjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739953304; x=1740558104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CCUQvs7skbbtsR/YI3q9DDNHuUZH7nkoZeezReFSZA=;
        b=ANzH7xRSE6aE3YdE1hBC8o3L8KOwCavAMpEuOzNPBDRnv717ghF8uN6eBz0jit8MjI
         msYovp7h1+vZzrPvVD1QbVy+bGaTN1SkHzAv9HsFxNO/tbQcj3PtopjLJwZAqjCZ3g54
         S2+idXpRiz6jKvStFqCZzgTU4tnj1Wgd6ofWvn7erCstBgi9TnCMePC//K1nMrsZmWRZ
         /5MsHXTxAqohT6A61MPNnWB+ensjDtBIXc6flXolarfuEwkc9eeoozNBnC5PexHlLK9h
         MgzAHAPY1N9PQJm+PU/ADitTQsc5fwjBGyhhp8YReRsxMGAiQw0DElM1jjiDviBCBLyw
         SR3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsJI+SwomUl/9Sxe6sLYrLf2cnAulky1PhkGFvLwnXKgzrv6WP35WPZgf2G9hChHWs0TVvCSgIeoCKSewXT4So@lists.infradead.org
X-Gm-Message-State: AOJu0YzmaJiHWm8J6zIuuP3KXiwA6fBbereZ1UQeQTiNaYlepEFmYIdF
	efWTEOFFCgX66DfWgHHBrOwX2wW1iao6AtMkO+sYaVTVDQ6RX56ZR68B7E1h5PXz7ExfEiCvu5L
	wrtrrVMjiwJc+o4KCwyL9b8hTi8Y=
X-Gm-Gg: ASbGnctkcojB13Inx8axC6DZzh1pHSukdi/3xsmxCvrySQFyMJWnuJD9VdxbF6dzXY4
	x2Vci/1+O6Qgw5sdfbOjzXBOBUv9PMVe3jd3FB7R3buSMJUs1lsPyys3EMEWxMt6Zi6uEbpWF54
	LcxlplettrJYIM0R/pqYczsR2iokpyivI=
X-Google-Smtp-Source: AGHT+IFzIRpiLIjtv2iSzEdqta8V6rWObrEAdpRX7gMmj7WIN0aL5o3A9z+K6dA+admg76L3qNrsQ9fIjfYQvQGGYPo=
X-Received: by 2002:a17:90b:3b92:b0:2ee:f687:6acb with SMTP id
 98e67ed59e1d1-2fc40f0f07fmr26433153a91.13.1739953304594; Wed, 19 Feb 2025
 00:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20250218085712.66690-1-daniel.baluta@nxp.com> <20250218085712.66690-3-daniel.baluta@nxp.com>
 <Z7Stjh08+/RlUtek@lizhi-Precision-Tower-5810>
In-Reply-To: <Z7Stjh08+/RlUtek@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Feb 2025 10:21:32 +0200
X-Gm-Features: AWEUYZn3t8RO4hNneBNPP3WTziJtjhP1rlkqNpTqV_tfmebhGCfYSHFlLx1Yy64
Message-ID: <CAEnQRZAL1npc3-Z_O_7_-SWi=fvWkSv_fv2dcmVf5owVYsi0NQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] reset: imx8mp-audiomix: Prepare the code for more
 reset bits
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, p.zabel@pengutronix.de, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_002145_880170_339BDC51 
X-CRM114-Status: GOOD (  18.57  )
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

On Tue, Feb 18, 2025 at 5:56=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 18, 2025 at 10:57:09AM +0200, Daniel Baluta wrote:
> > Current code supports EARC PHY Software Reset and EARC        Software
> > Reset but it is not easily extensible to more reset bits.
> >
> > So, refactor the code in order to easily allow more reset bits
> > in the future.
>
> Nit: wrap at 75 chars
>
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  drivers/reset/reset-imx8mp-audiomix.c | 53 ++++++++++++++++++++++-----
> >  1 file changed, 43 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/rese=
t-imx8mp-audiomix.c
> > index 1fe21980a66c..6b1666c4e069 100644
> > --- a/drivers/reset/reset-imx8mp-audiomix.c
> > +++ b/drivers/reset/reset-imx8mp-audiomix.c
> > @@ -12,7 +12,30 @@
> >  #include <linux/reset-controller.h>
> >
> >  #define IMX8MP_AUDIOMIX_EARC_OFFSET          0x200
> > -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK              0x3
> > +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK              0x1
> > +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK  0x2
> > +
> > +#define IMX8MP_AUDIOMIX_EARC         0
> > +#define IMX8MP_AUDIOMIX_EARC_PHY     1
>
>
> Does dt binding need such macro?
>
> If not, you can use enum.
> If yes, create binding header file for it.

Thanks Philipp, Peng and Frank for your comments. All are valid.

Will fix them in v2.

