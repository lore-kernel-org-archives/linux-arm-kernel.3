Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54131CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVujP+zprKI6yaucjxQ+AnFkVr/LyLnb8WhpE7+IVts=; b=NijxkiClUgnuZfp/BiBuBp08UT
	DHVWc54M/fi+4EdxwrwHFglUjNETA3GbpCM+Re0aFe2e8tNEj01LZzzQyu5XIM3yzeAsDc4dHOQo2
	H2uoqwBo9LGqIXrU+9YVXR/vvkJaFCdOnIgulNp6VzLqLDCxUDjq7xTnfGodYqxhzmdI4It/S4nLF
	X8PLifY3mMRtQnD+zDVJaU3vhc1Cxtxz0M4/VICzocre6JUJ8dFbv/45DR41KJWZdzgQb/swGJdrn
	gNfIj90DXWxjwS9RUahYN/4T85e1MRlCIqDyL2OENppAjYPLkFR1Z70Z75JGLnWjhqckWT1u/tFvw
	ddIMHYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWOp-00000002ErW-0g1Y;
	Fri, 19 Sep 2025 08:23:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWOm-00000002Er1-3i1u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 08:23:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2445805aa2eso18621725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758270200; x=1758875000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVujP+zprKI6yaucjxQ+AnFkVr/LyLnb8WhpE7+IVts=;
        b=JJWdf/pA5+wr05u7RkVUwfg96Kj01EnTf9G2okuUsAlowwnIjCXjOIwff/mWx92nIb
         zYCBJjc4d0D0OPfVu3l8S4xclU6PSi2HGkS5ArdB7nmaHSWkdOW2I1B4FGyOErFbOug7
         6WsP3gfVAZIX9EbsMTRr8ZZCHnB8ZMyItfnBaGN7ibXeUI93FlpB466xh/BuMSdZPs1q
         hc/tkwzeAmjXrlN+oTrwZTy/AD2ir+QTP8w1cgIt8UuUnSOerLySU+Ls/IQElhZXG3pw
         uYTrblydzWYF2W7/2IVAoDByRzBTe2oMKXGKPIzjGF+PPXdGgMA1I3pzM9IuKlKA92JC
         QfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270200; x=1758875000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVujP+zprKI6yaucjxQ+AnFkVr/LyLnb8WhpE7+IVts=;
        b=QoQbfw3wfYOKDRUNFmK2TDOfN0d60qIR+f4+pMRA3hDGfM2TyMbvPTT/gjukadZedB
         1HrHsLolOxInWcaXk/ynzLdkLKytBFl+hGu88bOipyQoTesASGHs0c9QYJY13yhZjWPD
         Rd9mOyw3p9Yi1pRk6sF/etYR9FuliqAKP/yLsRB3mXUFTvkyoN1BTQlyHLS6NgGgeXxF
         j0JTWGkQNj0Onafv5BleIyCEzxLAx2GYwOJk99T1NzfDqgF7YUzp7HTjy+ld7wr4lRoX
         YHgV8HyHsFeVsZN0IBRIig+qYT1NcXhCxZRytJv0lDI1+++qkvGvAtJZl7uxgNS2OVll
         ZqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgA3A5hHbixBmTZF135FVxwC36gPR3Q2hTN7axxCH/TWWL/3X84KFjbRvNPIDlIL1MMg34ob995sMsRHuhMlTm@lists.infradead.org
X-Gm-Message-State: AOJu0YzdDZ4Y/KVh8xapk9gWQxuAMbZ8MybqGDXswOadnR3qTIBqbC1G
	wPBS8m9/Zi32hTp26lEwA8O6DLU1suSgXzvQ3xN4p5IgioW+835BOShvVxgxPeOibAtwbSkQ8eJ
	kJVhFG/LhQP8ytdmqa8/bEh7OvtragIo=
X-Gm-Gg: ASbGncuPUM/3Q1fiHTduoMg8QKSCxPi+vAEnPXIM0ST7CPx+XyLdEsjLOxt/lTLBc2T
	1r4kLspYmxdttiDofWrmXbJ2EwIHdU9DAITMkFLu/rU2RxC0v2cziUvLoQYbGMHyREqeDRhvuk2
	8AE4Nkg5+OPKBJod0uuN0mU/7kPTG6OBjZne1071c7sJcCANpZ98lDPAV+6BVRz7ZaDbMTcl/D1
	OyFVfhNa8eBWwZt5Ws6UqTYyWOrkN5niaIC
X-Google-Smtp-Source: AGHT+IGkUgFKopsVCvKH/I4NVsJnRweFemKrfKJemNsyC+3rmEF/RNRSqYb65QnzlOCE75UW6MFYdTLXvs3rT8z5p6M=
X-Received: by 2002:a17:903:24e:b0:267:e3af:ae38 with SMTP id
 d9443c01a7336-269ba4643bcmr39630535ad.24.1758270199791; Fri, 19 Sep 2025
 01:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
 <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com> <CAEnQRZB2ZkcRirj1SZkfbsPHyyGr5PfnCDfv+ZuMu_Mj6XKBEQ@mail.gmail.com>
 <PAXPR04MB8459216DAA827DB05BF675AA8811A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459216DAA827DB05BF675AA8811A@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Sep 2025 11:25:38 +0300
X-Gm-Features: AS18NWA2ML_75oP-q69uMA6bYWYFWGOMeEfKy11gSalmyDGfNKtTFsYUY529N_o
Message-ID: <CAEnQRZC34KuJZDcv3TLJQrOcT9NFsYtD9q5Rj6+5MUKSBub6-w@mail.gmail.com>
Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_012320_922583_849ED640 
X-CRM114-Status: GOOD (  21.86  )
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

On Fri, Sep 19, 2025 at 5:02=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Daniel,
>
> > Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable
> > logic using dcfg flags
> > > +       /* Remote core is under control of Linux or clock is not
> > > + managed by firmware */
> >
> > I see that you negate the comment from imx_rproc_clk_enable but
> > with the negation OR becomes AND.
> >
> > So, the comment should be:
> >
> > /* Handle clocks when remote core is under control of Linux AND the
> > clocks are not managed by remote side  FW */
>
> I thought this flag is clear that clk should be managed by driver.
> I will update the comment.
>
> >
> > Also, do we really need this flag?
> > Shouldn't we just make a decision based on the fact that clk is in the
> > device tree or not?
>
> From hardware perspective, there is always clk for the remote cores.
> So DT describe hardware, a clk property should be there.
>
> But NXP system firmware manages the CLK automatically, no need
> driver to do that.  So this flag is required here.


OK, makes sense. Thanks. With comment changed you can add my

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


thanks,
Daniel.

