Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82464D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=; b=ru/rMat6jb80QC5UW42AWHJNia
	WxX4yLGLbjRL9iI6+uuDaUBlj7fi+scR3yvhMBIg4+dR4bZ4tjp3RUGkBgcBqL9sOJod4tMy2SB1Q
	vSLqfYwkBV0g6wVPlN2FE5bDuAGG9rsIRudQe2efQiG6Z/10CLaFZ7phJT4J5CTC79edyIebZRbYz
	VL6CdtCKjPKFop5j2uaqY3qpZMTr4hMw/vMueHdJT5ndktmrWh1IDRNr+UEsHQAzBDD0I8OscS5FB
	CIp3WntpHBSsj0jK+V5e5zPh98M2or2C2g5nNIK6+f7ENBQ0SEW44GsEbpCPdYN8lON+agejRaLKL
	VZ124xRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyX5-0000000EOHc-48KQ;
	Tue, 09 Dec 2025 14:17:39 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyX3-0000000EOGy-0b2m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 14:17:38 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2a45877bd5eso8182708eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289856; x=1765894656; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=MaMbKX/btV3jXBOt7MQ5/ZyQRLYZJFeqrXdF6z8OXtRuRP4GfqSWZGlMN0oHc1aBTo
         /29cA2/iWP++0p5R4pgjcJzIqVNSDmATKVbgzY44aAspjutjWQbecIh3WMvjcMiKOx7f
         BF1Mxo1CxkaG6eqbOFU/LaSq+5+wkyaEpZVrCLQ+XTePpwcyhC+b0hr9eSOosdMXyZnl
         C+CQ3UkTZ5CayAvCtpdLBDu57wJ/KPF5VwKvEkEonjUexnQgAWkOxcBUaEeK4twSeF3F
         DTJ/aISbIeFJmAN2uxKkPSKoQ4pd8s/EGTWiKuG5RIH7kZx/2HRPbzZOypR1ypyQbfT3
         eAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289856; x=1765894656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=e9LPTPwZ58uKhILr6iYPbV32dOQX5XEC22t8HgoSFWw6Y25Jzvch/H/Ifjd/eWgGd1
         ggzNj7UcwshAQjc/fzCFMxdPT11GwilRzXtVZTtquceiXPRsqlvjOAHX+YGuiSjjV0Fs
         F1guVNAadXFjdzSjAFhonKDvoNp5MaZ5KAn26Cp7+qZk/STg0VNQkpSm57c6ivi78exj
         sF9NS1OU/cxTQVKUnpq4q6OIqgxmWULOsSOs8IGYSRWVgeyKJ+mGO1jThNXZ/UwNBUOk
         OwRzvknQerHOSJTIHA6pJ/y6Jjyrc/zXzUZB5V0fod0swevPqfX67BJmYR4PUxi3k67Z
         9aEg==
X-Forwarded-Encrypted: i=1; AJvYcCUOY7zCaNhNf05uX7riTs5xTJibN4NPlq2XkzRN45xMcVugi27kSvvHgwmBRLuuRb9r1gTPgCILunAyMsXG+Koi@lists.infradead.org
X-Gm-Message-State: AOJu0YwmV/D60VTB3HTXFfwXqGuU9ZKD1Tg64swGgJgz5I3KvpiVP83e
	jHC3FpNCPCxK2lhxRuIROwdcCKq3cNj+204Dpr2i+L/8Yxv5k+R+iKAYIjQNBMeK6HByjlm4X3R
	jVUlbR9XOAQo/R8me09NQNbxR/r6HmHw=
X-Gm-Gg: AY/fxX6WqvOfka30pnJS0upBTkV33USj1nD5ySvh4TxP6OGqUW8NeQyCKBmd0JkKZID
	YVcR8JzMbIwcicVK3MgKZ4FBQYi90bnWaS3hlwYOWic8zpC3KQByPAqwxSFazV3qrd4mrxs1SYg
	8VjPFdsPv2juwydxnxXB2qS/Q/fgzPNWvjJ15cPeADribmOFD89fQz6ELOYFW2Dic/D2pHubWYS
	L7e4kD9WiM/Fkk/Fh84tp5G+FZyS4SH1vIlNdMhNPysMS00CwwB9yteTrdovYQuTF6XCcCoBooB
	OiMk8aTjPijaLLxT+PTUsdGDd6cVRmSJtIXmV4RaA85N9dihpT02kTX352Ev9nwPydv/kel7zVe
	jpHBZ34Cm1g==
X-Google-Smtp-Source: AGHT+IHJSK7Qp1zb5om02W592OqiY5udTEsk9nBSftpZyGmqI0e9P/OjwE7rDiAyfrBX382yq5jBhBWzuWKkJmGaXh4=
X-Received: by 2002:a05:7301:f25:b0:2a4:50c2:a74c with SMTP id
 5a478bee46e88-2abf8dee655mr691583eec.8.1765289856143; Tue, 09 Dec 2025
 06:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20251124182751.507624-1-robh@kernel.org> <CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
 <20251124182751.507624-2-robh@kernel.org> <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
 <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
In-Reply-To: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:20:03 +0200
X-Gm-Features: AQt7F2rjwQKc_bRBeYsxUFhD_YJR9U-Y3qN6s4VMgPax1Na8ykfHoapTIdM-w18
Message-ID: <CAEnQRZDBZ52FoNRBJa1qScbkcEYKwbyP_ephutdkYFaY5b1yLw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Rob Herring <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_061737_182036_C6077815 
X-CRM114-Status: UNSURE (   9.83  )
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

> Other platforms (non-QCom) were tested also use
> devm_ioremap_resource_wc(). So something else is claiming the same
> region? Can you dump out /proc/iomem?
>
> The region is dynamically allocated, so maybe that has something to do with it.

We noticed a related issue with imx_dsp_rproc.

Because:
imx_dsp_rproc_prepare:
 -> imx_dsp_rproc_add_carveout
     -> /*... */ and this calls devm_ioremap_resource_wc
-> pm_runtime_get_sync

imx_dsp_rproc_unprepare:
 ->pm_runtime_put_sync

There is no easy way to manually undo devm_ioremap_resource_wc so I have
sent a patch to use devm_ioremap_wc.

https://lore.kernel.org/imx/20251209140425.766742-1-daniel.baluta@nxp.com/T/#u

In your case Marek at least you need to understand which driver
reserves    8dc00000-8e7fffff : reserved and why.

thanks,
Daniel.

