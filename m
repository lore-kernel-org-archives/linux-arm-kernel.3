Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61655CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7gY71n24jkS+kac1oyH4zGLv4Mgm4d4NB7g+mYr34w=; b=xZhd6tZdUwYGyLNX7HPwCMryid
	/8l5nh/tCjDKap8EOkLXhflC/YB3tGY9y6gyQXr90EBORWtmZiMuQkQqstQ511XFIO4lMrcf+5x0R
	n22UruN0gapqc/VAFbblwiU94KWSyaz+wzuR5AFAxiaI4VPbbGeTdGIEPVa4byWF1sXgLD9ujZbG4
	OyG9loComTPAZ/45WwLXy3u5OCUDXRaWsWXAKJlKcqPyNKR1DFloQeQ2MtAlzrjp2PEDSgCSkazio
	h+vx89H/RAXR+cSw3P7ICVnpplk8+6YjMURrQt46N1MdZvgIsH18f3C4zpmuCAy3mzlmsrF705Cc3
	A4UXp9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2Xb-00000000VSf-2yaA;
	Wed, 29 Oct 2025 09:32:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2XZ-00000000VRs-2EU0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:32:26 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29488933a91so70897745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761730344; x=1762335144; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7gY71n24jkS+kac1oyH4zGLv4Mgm4d4NB7g+mYr34w=;
        b=NOZOkEDwbR+ck0VtlUiYRX2w7uiZOI+s/57DIaOVLgJX+m6NYcjQpgqRF68O7A+kDN
         26gt1grPr0aTtQmF92AkGvTnjcKaOzfwWM1q4uIwqsCLNdg3BbC1WbgqDegJDqTfLN7W
         iNjzlgIWj4vk1tI36y1WDNjb0f9mUNrXf0UYn8A7zMYNEXcD4A+iDm0gAlTXiELsZ0Qe
         WDFmX+xzqtTAMzeGpPwINfiUBwKaOvFOlZa1+fp+rfcYIa2WAfR/jpWIcGkuwnju1uMc
         XzlmimcdjQKSIkdMbfegXiG84P9rByNBem0PTd4z5SZQefukoxMMEW5olUUg09BXO4Il
         8+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730344; x=1762335144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7gY71n24jkS+kac1oyH4zGLv4Mgm4d4NB7g+mYr34w=;
        b=neYWXTsA73N4xnqciRpeBQ6uwmeuVnpYeSvrnW3pSimlaiHhcphBWkgMosqX4w/mbl
         ZezWDcgv9ddgpiWUGgxmijnWSCCT0omNltkBI6fD0YV/cdLAe0oKS2qUSld8eEzxczfg
         JWfXO9FbIKz2/guFM6HZJDwNwCykIrrWaMAbyvnnP23rdoDOoNcmnhayQx/5gU3KgdS5
         9eA4HTtrdVfVftBdsQhPhXMua2GWoTrAbLRyfXECafyzwcD2V/s7OAykkk5LAUTKRUqt
         Tlr7S2oy4O6cBEw9urKmtNUC5B9TDrIKqBITL4JX0X5rXk4F9u/2XMTmg4TC6KhupgNg
         HRig==
X-Forwarded-Encrypted: i=1; AJvYcCUPmrv2dV8RNiVPuFMEqttE8uQ+VpIja5/wOAP2J0c9fy5rZFvU/YkvMU/asME7GcvPxmhO30oJ/KmFwFIftjbn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6SyDS7DRhZQnG/wHP6Ww+gtUR1OJ6/1qUcj0i111BnHBHKgGE
	nxuOTI7ZCJojBiiCgRs219z1+cR/vQiSdTTy628odZY5qlEvYlfi7f2DaJ0I6k3oM6Zf5tB8DTN
	0IHt/gt0p9oaKRfcxZ0IqMpmZ0NhjBOQ=
X-Gm-Gg: ASbGncv+Mv4dKagjbjpQu/hooG/XuqLheB1CBRWXVbzK2Sqz2OKA78HnLqfhJt0hPk1
	KChnuXqv13v4escFwqG77LGMxEJ42KmfBO5LTfWn9dc73E32rqAbtypW+839sdnORe7a8tTf+gA
	QN8IWbHf/r089SkgSezyVMU4dyf0BmEYgofsFCG3aJy0f1XaCREsXfTZRjwE0Ud4JzZ4/CtMgnd
	1r0+fPPxIl8gV5mGhe0UDXS6stkzBj3gBzWZyE1r+NhGBcbUjT4tiFgwb4vOGJmfNKcSfOs1SLM
	HYf+0UlPFxJ0+g==
X-Google-Smtp-Source: AGHT+IHEmOYvQKBTiwYrDdUImmONCxMn+7i+FjSXTPYthBD2JV4BFZY8+M8zns5YrqEDI2UCuQBIua+fHP0X5y03rTw=
X-Received: by 2002:a17:902:c408:b0:273:59ef:4c30 with SMTP id
 d9443c01a7336-294dedf1056mr30630685ad.15.1761730344236; Wed, 29 Oct 2025
 02:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com> <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 29 Oct 2025 11:34:49 +0200
X-Gm-Features: AWmQ_blaf6t3K-8uusFpzUZDxAED2sVeQ3XqyTQaNCspO1b_QKvTo6faDe6UlPo
Message-ID: <CAEnQRZD=ynKyJXGneQMwX6NbHaOPNr4jxnP_90Ed860kpKUN3Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_023225_567934_308202DB 
X-CRM114-Status: GOOD (  12.89  )
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

Hi Peng,

One comment.


> @@ -116,6 +116,7 @@ struct imx_rproc {
>         u32                             entry;          /* cpu start address */
>         u32                             core_index;
>         struct dev_pm_domain_list       *pd_list;
> +       struct imx_rproc_plat_ops       ops;
>  };

Here do you plan to change a member of the ops table at runtime?
Like e.g replace just the start ops? Or the entire table.

Because it would be better to add something like this:

--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -116,7 +116,7 @@ struct imx_rproc {
        u32                             entry;          /* cpu start address */
        u32                             core_index;
        struct dev_pm_domain_list       *pd_list;
-       struct imx_rproc_plat_ops       ops;
+       const struct imx_rproc_plat_ops       *ops;
 };

