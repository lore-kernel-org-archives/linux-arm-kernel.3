Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C531EEA84C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 19:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=; b=OfI2ZNQ1z6cqd7Dp+mn6MjPdR4
	06VFVdythVXHScH10gmaS9b2N89c+Ck+s9X5F+J/hIAUO58QeHy31irmBRyxxtg619t+IP4jt5OcV
	+xyLfLOcIp98QwZYp+tlI54mnpKLcuL35nXabUNYovII3rfpV2prsMRMkd9R9ioWFrFJJAXV7MuQA
	s28CaJDKW6h0WvUc2qavovdZxqP9GSt+63mvLExfru0FzMyHrbys78m8mtEHMhQQES/bnraZgrxxp
	VFB2s1QbDHt/gL25gEyDfb92AIlhoji8+K7FmAHF2WvMLUA0jPMkf2Nc2z8PJh1g+TulTxrMOVG3w
	w+7+VGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcaz-00000002aQD-1GWU;
	Thu, 12 Feb 2026 19:43:25 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcaw-00000002aPs-49l2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 19:43:24 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-124a635476fso324860c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770925402; cv=none;
        d=google.com; s=arc-20240605;
        b=bwBsKKpAH9Ye8XzrVmYlgBY5RUpcmyFUcOOBlyrtjFN8JyaSj4uNc4m6xaOq2WEl1G
         qbtRj71rXJfv+YDWwBkikkrTuTFSezkc8e+ggFl1dCmQJ9DDcD7bXmxp5LFcqc1n1swu
         fD8AAqy26DD8JYF2sMdwyP2BdAKpqaqi1HFujRq5+/D9nDw6aE25SZqeKqCRaC7qqvpL
         dIJjukf36/BqImmaF6d1vAS4iPejimTzocBz9086mNe4c3ajW7zizyRyS57HDz6zgGOd
         LE2KMG77qZi8CCaCZEa0xrbURCMBEUSkCPLEw2zCk4a/V4NU44sZQN6J22Yww8xsR3Of
         9KzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        fh=1BDcUhG/Rf6UWr3p7fpTX3YY1K66OQ48yW8QYzE1MmA=;
        b=OgHJ74hw8TsF8P7GrdABLh0+0KNZl5ydopB1J93bDWQYp2yVGaEvHQB8QehbOpm2Pt
         DN5ukwN84ExdzqEbxngdgueZRKSRYRQOhtBxaIVoCZXpMsnkOt8gW3QgDiv5Y07Xps8D
         bnjO1ttbYWLkS4Eil5B1dvPN4UpfcNJeGZRosOTRoMZqpp+dufz2D5cneSsp8O7UbQhl
         mETukenSLX3ftAOljE4zebvhfXkFPFupPuhyTL8naSY43o1B08PVQO190xanJ+QI7Gu8
         PlS/98Nk2QeMOKiP49emfbsJQApa9uwOYQtCQJvtP3oH/Xf2QDWDD4MM9dRfVF1GzNGt
         9XRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770925402; x=1771530202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        b=VThjwBASJrAUo/CVwO0qSv8pzDDeptSrJbyNajdrl6PY5FSEsY3ZwvK3emzAeTqmPM
         a6AzKuh9L6/m4JQwTh9aorGUsblxHt+DPtRg13TwxCspkP0Z2MPQZlZVRAlQr4ubkgwY
         +OWpYCtjW4htlKcWYw1YNnosRHu0tVndjRRsWIK0V/P7NaQZIBF7vDNiv6bVAysgqnMW
         +2aFtCVUaxltkIHyeGMdiPF0/mf/K2A6bSFgRZZoXvwv4zFkzrwkK0WXTnmDhVM2Rbc6
         AP5RwvkemkMPQo+oUO6B9i4uoKImPQ1W+SXXlHmQS7x+xHutM5qULDOuA6osPFEURwPP
         Z+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770925402; x=1771530202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        b=Xg17pl2gHxyVr9mlbZVUkwGJBmc+eCNnf5hzgZQ5BDssNHAsl/gDO0OV9RKyW9fVVR
         oITaIw2kqO7N+yGg0T+s7Qd/O0RZIrBbDdGzKHGdg9z7GPXVnfQhfM1cTYZKDPDXmD9q
         Hr1grjDg1RSQbYjSkeiZ4eHfOzRSMe1qnjMJaD4GYHQ32dxM9bh88Ad5/ZI2bW8D+gGl
         v7LI8lx1f1k2LoPeapW7308HsrsoG6zFUdc6SfGUiHrqBC/iR+/wNCsoIenxXdNE5i0Q
         84yqULfktu+9YAIyi44ENx+ZHT6bjryNN3cXSPQLkM/ZR00I1gxsP8QKKmHVq7UV1qBT
         CeKg==
X-Forwarded-Encrypted: i=1; AJvYcCUmiIbTBrxyIdMgy5OT4irq6pwTcS9Y4zSbcReVfpZUYgrAwYe4tp2RiBaM5tSVBn/9d4XMlnu8+EWCN6wjwk9d@lists.infradead.org
X-Gm-Message-State: AOJu0YyTStRclauRC2W51oy6eBjvSyWZMA/leq0hzhTsnDwN/fFWpCx7
	24TIOx7ocWRdi1gXcyiMIufGoOaPwRbiC09FdP1TBPAzBE3ejJSVXMl7mV+gZxPwOKH4LgJrlTD
	Joz2aPHrxNkdM6Qs6N59JbRGwxatpVqM=
X-Gm-Gg: AZuq6aLO2r821KiV09Nuex1MnZE8Cmnld/bWgFmFxiT9v+nL6Bd69gGIYEDGniWOybs
	1lzAMzGUi/6PBfriw/lQwMlBug8n9cx95ik1UBlomSkkDUPCFyKzx0OYmyvCNFPEINyjXpyDF1m
	X4U1tGeL3t4NM9ZrSjDNsDcRpElLV3xNdzcUhpLxVsLnc54+LYh0xm6S2ttgjnCJPicj650JyDu
	nFasxj5IE4YLBE0HgKltCNl2SNAGc+msCW4uprwhcLCj4wgpQttCxSFXhAdyeP0F0Fj0hUaw2s6
	3iFABudbnre0uYoT1hmRflP9k0vAhF91z2sQU8xJCSZVmID1/HNGcsG3TXVyGnIxEcqiS42wd7a
	EiK9oS4lqjWWU43pKraDAIA==
X-Received: by 2002:a05:7022:2218:b0:11b:9e5e:1a66 with SMTP id
 a92af1059eb24-127397b47a3mr48022c88.14.1770925401574; Thu, 12 Feb 2026
 11:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20260211142321.55404-1-dakr@kernel.org> <10809444.nUPlyArG6x@steina-w>
 <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com> <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
In-Reply-To: <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 21:43:07 +0200
X-Gm-Features: AZwV_Qi9zFnWs7AOJZOKq34_yl9qM1YaahPkhWTWEjwtIMb5KBMQENxC_CBtZ3Y
Message-ID: <CAEnQRZDMXhh-V6p6ovtmSTx2Gc2R8p=pHg8jOFgJ8i3TNNJT-g@mail.gmail.com>
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_114323_093198_AF2403F0 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, Feb 12, 2026 at 7:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed Feb 11, 2026 at 3:59 PM CET, Daniel Baluta wrote:
> > On 2/11/26 16:43, Alexander Stein wrote:
> >> Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
> >>> +{
> >>> +   int ret;
> >>> +
> >>> +   ret =3D platform_driver_register(&imx8qxp_clk_driver);
> >>> +   if (ret)
> >>> +           return ret;
> >>> +
> >>> +   ret =3D imx_clk_scu_module_init();
> >>> +   if (ret)
> >>> +           platform_driver_unregister(&imx8qxp_clk_driver);
> >>> +
> >>> +   return ret;
> >>>
> > Also, because the logical flow is that CLK driver is uing SCU for calls=
 I would first call
> > imx_clk_scu_module_init and then register the imx8qxp_clk driver.
> >
> > But there is no functionality issues your your approach too, just a bet=
ter logical flow.
>
> I now remember why I kept it this way around. If we swap it we have to ca=
ll
> imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
> Consequently, we'd have to drop __exit from imx_clk_scu_module_exit().
>
> Please let me know what you prefer.

I see. I prefer your initial implementation then maybe with an
explanation in the commit message.

