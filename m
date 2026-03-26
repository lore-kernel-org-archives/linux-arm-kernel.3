Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA709109E552
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 05:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdT6SrhoT/3nGy0YPgkvAP4eQeqYv8/Cmj1jAOtLnZo=; b=NICJl7R2MyZCfJEUnwsHYZtOLm
	FtYEuMGvRSRPCLL+SZ3vyOBOUgy0dyk8NpKJLnUisVE9V8VTlgBagjM8Cbf5ONJTNEwO6VeiwS6vT
	yXedbk3yZ2QrAEJiuY4C5yy9qgNnt+2/Ey0810OOkZjERybTbAo79zwz3wEV6YmrLwmlm18W+zZth
	hqnXR2JcYZIkLAO4QLtnpm4Ejt01XE6UBIsEjh6Rlztmxud5oeWUg3j129j1ruFSp432oaAs9z1j3
	mqyVDdVb5HZpyi0vui+Ar2Zy+dvwEw/e+S4LKBrb+2wE3C1QrL/N7ebStB8b5G4CvWu6/YlMIyVku
	OXytdr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dMw-00000004kLS-2UJA;
	Thu, 26 Mar 2026 05:34:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dMt-00000004kKl-3yvU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 05:34:57 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-824c9da9928so540318b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 22:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774503295; x=1775108095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TdT6SrhoT/3nGy0YPgkvAP4eQeqYv8/Cmj1jAOtLnZo=;
        b=QjkJNP5l2/nqkvmdYiEHeAkkc7PKDjzWrmvvLlsmQ+waIMilrw7maBrbp6Zc2AMUWI
         QavjQ5xPzozVDg3Jw9IM78sDeP6RdGHFO3n58B9Eb6hmexr8Qjz6SAiZ6xJPKZapuu5B
         WBAo11t/OsG/Oo7J4Fc/KWmIS8oaHdzx/2ZTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503295; x=1775108095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdT6SrhoT/3nGy0YPgkvAP4eQeqYv8/Cmj1jAOtLnZo=;
        b=UvQAJbv1Q2jGufAU9Tmx8UMdCfhxlnlHih9/P2g/Hs+KQmC0VVs2+LTiZwroWLb/BZ
         AHLjBK1A2r3Cg1ogU6w5ftYyMBY+OG4dArcCDJS8sqqmOnkMVVF0lkUcGsO6/0t0QRr/
         4OQVhz9Y26tQojZkBKlW1cjveWnZXio74gewu7OBOziQmlg+PkVZTJv9ioQicbaQJfTK
         LzCNpdj5sYU4ecBf4kuGflsdtTpVnWvrrpQpn8tVZd0SnM06G1bvBwf5bOOpOuvy0s2z
         +u4NMnsY0+eubwjIjOzbvAcvajKgAnl/+7gxqh1T7zrtMwEZ8Uf0AX3s46I/KAw5Ucqy
         I3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcKyW5Wd5yUawSA595zDhGmsF0c3PCZJnMdqhL3ea0NF+vPoqnUKcY9A/PMBZr2pLabj4+3f5vkyyef6OuFq/d@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3qYc2aLlME6PhIzHuYr7NAYWXUACiHlLZ/uQ6RUTek/qHhDp7
	PSGSN+KVvx1lVrUUwdDb73M9xCfGcT7fbOVfpureaxFjvDbkcn/nZZ2afCudnImCGQ==
X-Gm-Gg: ATEYQzyeXm+jUak7wX3OU+j5pZaiW7irW7rWFLQXT/7n2pNkTNjBHkupV14Mb3ashM1
	fx4DCLB0uYdZp11OwoFM1eTWGmlfOjtSpJJrGeWlwO8AOgFtJfXUdctz7t3KpsPpI2UQ8K3Meud
	Ev83mrmhivw4EqvTDceE3wUAruVemCr3QD07ImsJ1MmSqjgddTCNC0fdiAXXTmNkw71RgWxpSGH
	uKYmO+P+rNrLP3TFF7nVoo5f8EEbo9mntOdYPIERhG66/n69To5w+UsHiQO0REv07PwxNwLeY/+
	AdhkNpEv/vaR3yr17HRxqCr5/CrT8R8m2GKNKH8Aa3GWFRINCEArJGayjPXjrLWJx/OoG7tQmCP
	btsKVxYksOGDEkbdHsNNsCA185XkRB6aPbPjFGElFa4UfjkbBSQpTk5Nud07WCAx9VcH+OzhJQR
	WLkUPn1Z35169eUrwnRsf0Ls0zHvJ/agXfNOWlIsG97b+jOBiFjydGZBHjv4pWRnaewg==
X-Received: by 2002:a05:6a00:4304:b0:827:3976:3232 with SMTP id d2e1a72fcca58-82c6de8be34mr6221037b3a.5.1774503294866;
        Wed, 25 Mar 2026 22:34:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d388d11sm1401322b3a.28.2026.03.25.22.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 22:34:54 -0700 (PDT)
Date: Thu, 26 Mar 2026 13:34:49 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v11 0/9] Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
Message-ID: <20260326053449.GA910813@google.com>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
 <20251106161149.GU8064@google.com>
 <701b6abc-71e8-43fc-adfd-211a62dbec64@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701b6abc-71e8-43fc-adfd-211a62dbec64@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_223456_147510_A7D67456 
X-CRM114-Status: GOOD (  21.12  )
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

On Fri, Nov 07, 2025 at 10:01:56AM +0100, AngeloGioacchino Del Regno wrote:
> Il 06/11/25 17:11, Lee Jones ha scritto:
> > On Mon, 27 Oct 2025, AngeloGioacchino Del Regno wrote:
> > 
> > > Changes in v11:
> > >   - Removed unnecessary #address-cells in all mt6316 bindings
> > > 
> > > Changes in v10:
> > >   - Added "struct" prefix to structs kerneldoc
> > >   - Renamed struct mtk_spmi_pmic_pdata to mtk_spmi_pmic_variant
> > >   - Added "REG_" to MT6363/73 mfd register definitions to disambiguate
> > >   - Expanded MTK_SPMI_PMIC_IRQ_GROUP macro parameter names as suggested
> > >   - Some rewording of comments as suggested, addition of more comments
> > >   - Refactored IRQ domain handling due to deprecation of function
> > >     irq_domain_add_tree() to use the new irq_domain_create_tree()
> > >   - Fixed to use generic_handle_domain_irq_safe() to avoid races
> > >   - Added support for two interrupt cells in translation
> > >   - Removed .irq_lock() and .irq_unlock() in favor of lockdep classes
> > >   - Added support for handling PMICs without IRQ Group register for
> > >     upcoming MT6685 implementation
> > 
> > The MFD part looks okay.
> > 
> > Let me know when you have all the Acks and the set is ready to be merged.
> > 
> 
> 
> Lee, the regulators part was picked by Mark, so I guess you can take the MFD part
> through your tree.
> 
> I'm not sure if you can also take patch [7/9] (auxadc binding), but it would be
> great if you could, because there is an auxadc example in the mfd binding that
> needs that commit in order to succeed the binding check.

Friendly ping. You might want to resend the remaining patches. Looks
like they are all ready to be merged?


ChenYu

