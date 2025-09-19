Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F242CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=He+6sdn61LRVIxrBafIW06DcfRvltNAdv31TV0CKGnQ=; b=Scc/51unSkl0zG+NI4Z/hk2SKa
	8wGPWo28auTFMzYhvroOlgxRSmI/3kcmwhzWGUJW1uGWBJ65Jivxm2b27wGWl5OwZFbQbT9pxKMh0
	ea98ibnoEi/Ozz1JAhwzTFUBQEpK4E69/VRaRyXPMWh6/cl02zc0qW6/9NgQ7UYMjxpe2J3tSlO1+
	9lEBUB6SV8Ik2bC0bUWIdFPG8o7pcNz5sCbLAI0QCM6Umm1I2otjxd8RgzPKnhVMlqWthZMzqse/k
	UFydRCtU2DONes2JKzku0ulFPGUW04I8erOmaJ9ub9+LapN/uWH5lOTndlSZOaExvxrQ2xbELIF5+
	LXvhzjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZDi-00000002h8V-0bhT;
	Fri, 19 Sep 2025 11:24:06 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZDf-00000002h88-3swR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:24:05 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so1318254a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758281043; x=1758885843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=He+6sdn61LRVIxrBafIW06DcfRvltNAdv31TV0CKGnQ=;
        b=FHh5DKKye8zCrBVBlsYkY/LC3BUt4gPviqVN9cDfvAYrDCC+/DDNZGUwu2w1Fm3WwM
         E9IC9rPlJu2GZyzCH/+9uhAxCwgXERlQO1AIPT8PDNYrRzD7fQqFaPqHTEP0he0DvKEn
         130RNJCeUEfl+Qpbb2gQGu2sixCEBiH68oF3nVl1wwIaon74dxLTlVJ2fUfO7G1F50L6
         CiNzVT3C/UGun5qOAhZ7RU9IetJnF6S6OGcvbm7Mr9jrw2LZs03icFNr91L1baduoGxk
         MfF+FoPlu9LQ0YsLaHPKuiMZUeUnOOIEi2hbtvuMLuZ1punrF9nSegy7x9kdIogS7nMX
         hFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758281043; x=1758885843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He+6sdn61LRVIxrBafIW06DcfRvltNAdv31TV0CKGnQ=;
        b=K/xgSDKvKLxZQZsZiAxHrij07S7Eac6jmXS/oZMNFpijadpjhTdFsRZlU8vAw7+1b7
         8fii5sInC2VUy4uIQSSlAIBKzwsMIOZY+b/XN3aJB++5rm174TNEkot0og8zQEYla1FN
         LDRrmiOhtVs8it+m3x5mNgcsklVdV8GDOPjXtcvf44ZBIRzlxZWO3ZVEOtWnY8g8n+vd
         aiYD29J+vwyx9hW6npfzGQ7XDcxbUC1WtZSe/o5jJLPz70ajF52bPRTxOIU0kKQ8poG8
         IIvA2D0RRmnxeffiEi1W9DOota3P0g+bK4tTIUS9WDhpQJkWvV+/1I75ogOxQ8AklTLt
         dRbg==
X-Forwarded-Encrypted: i=1; AJvYcCXmaqa7RSXF0465VI1tYUcztv+Po4uEkCmclWgJtc4vR0Y8+/0cGlI9ynhV3cARSftkoEUOYBN9LoW/CPc5pnu9@lists.infradead.org
X-Gm-Message-State: AOJu0YyTokTg1SeiSMbs+bocE9FvmGb+8UKRDXmQuQhOfKRD3H9HnOX0
	RoObWKjqHNFJ55uFzxmkXYE+/LbZwUvw0LLdhzQBfR14IeeOblwIhv87njgD5Mnf1AZe8rqgRo+
	zpqhgO55if3Mg+ZHekceR2fQOFoJCRJs=
X-Gm-Gg: ASbGncvIlkhf7G9a15xnkG9MJJbFJ0RHNH57D2stT4sPL6a4wvKQZ5oHRhH1YHhFbBj
	3k094pux+o3lQuprT4ZtauQxR4G0fHnbb+M0xNjnvq4SyIOgWXy47i39wsP3tCbptbp8a7UuZlI
	FlZg68VXvh+xbXjesRlOrUtjvgXceqM/cNivExWyWbCJ4seXEx8AFz1ZVrB4vWjbiNQDOG3M0dd
	Xqf/LP8nI/EtxT2FGF5B/7JikqVjq2hmxTE
X-Google-Smtp-Source: AGHT+IGR+j53MtR7Ycbzac1nvh8/Xsimed1/N5Ir4au4nEDEE6nsTs+zulbhVQrxaMtQaq9Cc1ET2UPKXkixOlwNUv4=
X-Received: by 2002:a17:90b:3a4f:b0:32b:d089:5c12 with SMTP id
 98e67ed59e1d1-3309838e042mr3853941a91.33.1758281042999; Fri, 19 Sep 2025
 04:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-4-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-4-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Sep 2025 14:26:19 +0300
X-Gm-Features: AS18NWCk1Oc5eecL3-ZExUWvIBIypCHeXmF72jHYDkEXM6phwnZTdZT1871xqCc
Message-ID: <CAEnQRZCByoFeuH0KyPbrt8T4pPyPwG1DBvrFQq82mD3KGPTuZQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] remoteproc: imx_rproc: Remove the assignement to method
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_042403_967766_3258488D 
X-CRM114-Status: GOOD (  10.16  )
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

On Thu, Sep 18, 2025 at 2:53=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> There is no referring to the field method, it could be removed now.
>
> No functional changes.

Please mention that you are no longer require to provide .method with
imx_rproc. We are still not
removing the filed in imx_rproc_dcfg struct because is used with imx_dsp_rp=
roc.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

