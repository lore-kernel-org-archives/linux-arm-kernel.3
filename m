Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398BDC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 22:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ESxItapZGpeX27bCqCWykYCjM+yU4vTWbwqb34xOmU=; b=OJ69BpCHPHEESfs8S2J86pqadF
	OCgdt0kbZj44AE8cd5N5kXNhYYXrZ730YlRT+KEXZUSi37L/6fQaapvcpAW7I9dhqwBg0tON839c7
	V5F2LWGlnp7tEK77Mn0DayO7TWcKXHuemRIAEZVIv+0KfipHo6fI6Zg6wlE4Os0vz5NNqsaD5VQtN
	KF8HPSnxKpcB25WFBJubXHCrvSg4XVWeXP9cBKnT8tctA4iLjKIo9PFJ7JCcjvxm8boITAcvO3iuI
	66JVhhtg2tP+/G7Mgo56qrg1igtgSrMQGRGsXch4Rhb9UiUb1cXcV2CLnU2UsUyQGVKjoPLUF6zFH
	lpZ9DHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpKT-000000044kP-28KG;
	Mon, 23 Jun 2025 22:07:53 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTl2r-00000003ZXt-3rvS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 17:33:27 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-605f7d3215cso2155511eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1750700005; x=1751304805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ESxItapZGpeX27bCqCWykYCjM+yU4vTWbwqb34xOmU=;
        b=LH0PX6gjizuukawFK38NgTkayXzXXqiCPCqx410ZsCbfhHEuHvSAynlNLr6rORw2O3
         riVYZzsg07RmhmtPizF2pL1w6qMhf7Pi7KwE6MQQzdUcaYSYPxhTdAbPV46bZWi5ZwNH
         +MOnJL+kqI59KXkoTPM5zFThAwjsYL4OcCDVwTn7RrS1Gl3l0SO0JrqYHmE/VNm0I28Q
         j66ksocZZkKBGsKOwj9DzlubcZSPllrO2N3qsr0PHnnTUJ4UmU0RkMqsVqtY2X6w4WG3
         4bfAFEjHmJ0gFg65GKaRvSAvgaYcZpunajS0iHxiVqCS8CyxxWxmzYr2OK7o850IaHPn
         WBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750700005; x=1751304805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ESxItapZGpeX27bCqCWykYCjM+yU4vTWbwqb34xOmU=;
        b=ALvrXjP7LRU8A5sKTC9hIlpQLA5sb0k8PsDTVLwsKPltT1AaaDLnRBV5X7xRl4XEul
         8HxD6Mo23Ug8hLjZmuNTYl9B4UhU6O/qojkG+8v2pZmLlnh1uFyACoary+ZdzZ+v4rMA
         7XjkRLjdopbjDw/qEotsZ/hN89XPt+xMF43Xv1vLkifY25K4LvCQDZsGIwcyjPFEVYQF
         18h3YR1ZqukPMNdugWQB3Vp68jJudhZmcYLCmCqcCMOYAA7eiKoQmdz2Wqzfk2lf4e4D
         fUPOA6nJacHaPvZivGn0cN0dzGnOKx7u3D0mp4AqsB+/AogZf02p5/5Q8px8H7VqvE/4
         6yDw==
X-Forwarded-Encrypted: i=1; AJvYcCWvEBCvtOj8S5EMnYf2P+dJxcVyLFmyV6TNIm3Efp+EnEpuLfwllsjoYqvc+wE3e3sVNlSF/q+vp9/3iYTAVYFk@lists.infradead.org
X-Gm-Message-State: AOJu0YxZDaQKP/KFt4/HfiwlVeaBxn0wRBhhySfzjy5AXZWvEmWSjsW+
	RJFQ6MjnX7veLyB+kiXh/Sa9h0pLqmliqIuovuZZY+y9moCr6Pk9d0J5DUGoIyUnxaVbufiT6r5
	8Uss9mq6u3Mt/29ulPQC0NfcQrC0BrWuxn8iaHa6DSw==
X-Gm-Gg: ASbGncsOi6jbwdrYTQ3duWQI0r8s7eN3UJ3ESI0C3gs7+6X3oZXwOD2VKZBbqI+lIRI
	fYGYwY+B0BMdqYFShBAGDiq56oSS+NG0Zl8BUK+D9Eg7mqIDjBjtvtfgqA+L2OjuglNtwBSABpF
	zlqQlLPXqBfOPLjndSNIAJ2PRf63S/Vj7ROU8/1ht+p2c=
X-Google-Smtp-Source: AGHT+IEnQISZoeoPxj8JEGlUaibukW91WXz6xwGvL5sx8yj9FeldaqG5qJs0cowqWl1mZaAAU6aoFwKpwix2JbTKO8M=
X-Received: by 2002:a05:6820:1b07:b0:611:7f80:6474 with SMTP id
 006d021491bc7-6117f806825mr4229278eaf.3.1750700004712; Mon, 23 Jun 2025
 10:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250616085742.2684742-1-hongxing.zhu@nxp.com>
 <20250616085742.2684742-2-hongxing.zhu@nxp.com> <kjsaipr2xq777dmiv2ac7qzrxw47nevc75j7ryma32vsnyr2le@mrwurn6rgnac>
In-Reply-To: <kjsaipr2xq777dmiv2ac7qzrxw47nevc75j7ryma32vsnyr2le@mrwurn6rgnac>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 23 Jun 2025 10:33:13 -0700
X-Gm-Features: AX0GCFtnkiV6JnGTj19oSXnEDcUfrmPAyTPCGVHfXU5cEeF-T0n_k13y5pEP9X4
Message-ID: <CAJ+vNU3mKiEE86SYFS0aEabkqRKADFDJN0giX73E0cA=GOyhjA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, frank.li@nxp.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_103325_970286_6AF46B9A 
X-CRM114-Status: GOOD (  15.55  )
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

On Mon, Jun 23, 2025 at 4:42=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Mon, Jun 16, 2025 at 04:57:41PM +0800, Richard Zhu wrote:
> > apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms=
.
> > Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> > wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
> >
>
> What about other i.MX chipsets like 6Q and its cousins? Wouldn't this cha=
nge
> affect them since they treat 'apps_reset' differently?
>
> - Mani

Hi Main,

This patch effectively brings back the behavior prior to commit
ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in
imx_pcie_deassert_core_reset()") which caused the original
regressions.

To ease your concerns I've tested this patch on top of v6.16-rc3 with
the following IMX6 boards I have here with and without a PCI device
attached:
imx6q-gw51xx - no switch
imx6q-gw54xx - switch

I only have imx6qdl/imx8mm/imx8mp boards to test with.

From what I can tell it doesn't look like the original patch that
added the 'symmetric' apps_reset de-assert was necessarily well
tested. It started out being added because as far as I can tell it
'looked' like the right thing to do [1]. You requested changes to the
commit log for wording [2],[3] but I'm unclear that anyone tested
this.

Best Regards,

Tim
[1] https://patchwork.kernel.org/project/linux-pci/patch/1727148464-14341-6=
-git-send-email-hongxing.zhu@nxp.com/
[2] https://patchwork.kernel.org/project/linux-pci/patch/1728981213-8771-6-=
git-send-email-hongxing.zhu@nxp.com/
[3] https://patchwork.kernel.org/project/linux-pci/patch/20241101070610.126=
7391-6-hongxing.zhu@nxp.com/

