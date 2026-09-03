Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA86FC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=; b=eDxPnisvPx/o0pmDTrccjw8yeE
	2d6uBWlO2AIBpz2T5FHgs159NDeRqwDtC/NrHnrvJxg6OiR9g+Eoa6Nz1FPYpNE9q1sydCc9+Oun+
	+oSatB6DRRZBgaEypuXofRdae2tdCjB3ywO9RDPPFiRe1RLynzTaY23bkCX8BKQaCT4KMRdMMfDnh
	WB2BjqqFgPixNWB/+nWdyVKErVyxiIJHEiVp22LxTNXMiMwIK0hSLqYXZHxNoVDGY7IGqj/rkRjIl
	HPu/rzS+gXbE7nsNRsFqHI6i0VmZguwLskMAocnOPW9CYxbEcSDJbpGdvS/wXlLPTV7Lo5bHJHBo8
	crzAkmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22ML-0000000GiWz-097E;
	Thu, 03 Sep 2026 07:59:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MJ-0000000GiWO-3JMQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 07:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=; b=PyW7laR3MTxbEhLdGsT7X0wcke
	CbgFltJ/9SL48RV0luzhBYw0b5DB4s/Ju8UpVx9907S38rXtK4j8HZ2rldg3yw3Sg/vFrUpTZtXxW
	cVW0qndjlOfGIuoLkFHOy6PDKEMW/RvOHeLyu8U37sDlO0wUSrIv9j5VhR5l+PSV4sO+XGySADGF7
	r2/LbL6tmiOkZQB6+dbIM8x+dj5C5u87/9WGKQGVrl+KcgmPnQ3cBEEJTXBjehGibOxhVeireuJtf
	dCiKG9jGy0B2PnH1WQpdy7KNw7qztKsircyQnad4V5zLEnLmJ/UW/nwwht8bLwvTZ5ARutveLTJej
	oV9cT6hQ==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22MG-0000000CpTB-48df
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:59:42 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-482e067e908so1768314f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422379; x=1789027179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
        b=kBKqcj5jbeO6gNf0Yfu8pMCojHJ+dPTIw/e5gSqvLRCO8U3UHXpO9SKHJmQA7UK+pO
         eRfFsUKkD5trA7uQqbaKtGRV2/W+pTdbXDSumcwBZ0criDvxAImHBaYQYO/N46uaru8C
         1RdIKFU2mk7JmVhA2OpqaQrlvSQnHRMM5cR4fc7ZBS3HhEl3/RbD8Go+IIKooQh4fIvl
         XjXTG0LZtkHuDrTB52qZRdiuKsk4cTTeC8rVtFCGRe+DoZw9xNe2ESba3hwvW6ahXgAV
         2u2NYLl18m6wCguO8vRbJMlsDN6PQSp1/fxCTKsF2jgGDBCA3Z9voT4P5eLm7iA63j/j
         nkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422379; x=1789027179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
        b=fMv/edFqW+kX3s1593wwmDkTXYe3l2Gh+N+G4ewwh4GKjDdGYS5c041/4RrdaCaWVM
         Yg2mN9bootMwVjwn7B5DftT9mMWGMET+4gzEGajOg3p7sg7Xsn7BKd+000MYVIDEwhRn
         KG+NuC7hSYxadvmvMx05cme7AgR9+YGzCbHawtc5O1ez4rY4hcVbFAzTsZ2pjRRLnSfn
         /y0rP7oUf5UfOiNEgEHgQZ1d+9QJ/CbaGO25w/deST1N6OLw4x/MbYP0KIXAJPQzVvQ8
         40knZg0G+KZbICvJCwzF+IOhoXlkJ8n0HsKDeMR0dgffpLelSGZKiO8prCev0C7uU1kR
         Ktdw==
X-Forwarded-Encrypted: i=1; AKwUvBw1k9Xqf4i8YFIQ5UDBqNwDlDd0kufFKONc1txp8YXRdDusJvMHbRCCVV1HxFE/mR4EGZN2c6mUpK3Wu90qg/Y9@lists.infradead.org
X-Gm-Message-State: AFuF++l7RbAmh/C317KJwXXQdu27Zs3bWrwLLIFBuLCkiKXucLk/Ebyi
	ML5bd0M55uAxSkIB7QISpGt10PVvVTnLMJ9q40fEqpsnIrmuqRNyqIKX
X-Gm-Gg: AYBFou1CvDpj+oDrSbV9BLW31SvX3uE67BDjOCKtQakKXH5yYxme7UUstQCa5z2K+2K
	rQ+FCy1O0hO019ObtAdOr+4Q9xUtE3dMkprEwYtpsYLkptuje6SkN/sFqIF+sccrGVd7uaQiiuN
	6Rt1hzP9CaG36H75OWB0ptABq3wevPvoUkeui5DG+orJ2RtTG+R+tlnBjB1KDf7gkDlesOGcZz+
	1J2R5WVqHVq8fJRsg7bPJgkouE2mTbsI4bHATuspyzUFPSBghkZcedilJQV45w0540b2v137Cin
	ym40CXx6lRGdhgpzHvBh9KfCzR51tJF21dL/arwbf4rdMSre64HahXd3Ms/cND2bA21pQLVBily
	cVlO2Ifu6iQsllaBd1gSrkKRpZrWz73kB11fFxFjSPB9504up8D8YAyfBtB55c+simh9huJmVtf
	m7Q861z1r5CmXz+i8I4ik2M53Em7V2NdEu2HSODRvlTGe4cIqkcYrk6qZrfm5JerzXO6x1mPMqa
	85q3Mo=
X-Received: by 2002:adf:e18e:0:b0:47f:e721:1f77 with SMTP id ffacd0b85a97d-48488f0f80dmr20736014f8f.13.1788422378643;
        Thu, 03 Sep 2026 00:59:38 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:37 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Thu,  3 Sep 2026 09:59:34 +0200
Message-ID: <20260903075936.2089280-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903074348.8F2DF1F000E9@smtp.kernel.org>
References: <20260903073143.2068494-2-mehmet.fide@gmail.com> <20260903074348.8F2DF1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_085941_168325_5116D4BD 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Critical]
> This is a pre-existing issue, but can an unvalidated pin_id derived from the
> device tree cause an out-of-bounds access on ipctl->pin_regs here?

Same finding as on v2 and v3, same answer: yes, the parser trusts the
fsl,pins value, this series does not touch it, and I will send a
separate bounds check for imx_pinctrl_parse_pin_mmio() and
imx_pinctrl_parse_pin_scu() once this series is in.

Mehmet

