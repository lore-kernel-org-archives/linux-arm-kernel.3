Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3665CC87FC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdywicGMC8PWpQoI79nyLjxZDbmHom2ul/36bE097Ak=; b=txxDC9J1RuqJj68lfwekZwc5I1
	bkIRbA8Sxyri5SPx7NTx1EYaj8WuCZjSVGiWzGTofkALn6PVJ+xO5tRp/SGBFsxIRy9mlTlvP8tzX
	hjFpgTbAHzTlKwGPCnhCOik9TWRqBwCfealOV3se7vgJzwU0yPU5WIFQc7wJOPQ75c8py8bqNwssW
	Y/G0miW/OVTTDB8ZuXTGnXjAHzmq6/nlGIx7piSInFDs51DO831sOLqlDy7bfUfypvV9us+ysBCO7
	m8zTcBMkUUTQhByaNUY8/uTQ4ilBTrvGj12+QwKPhGBFfGv5AhlQQtuM/fpyPr9YFfi5kn7fiWAOx
	wgxYZjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udm9l-0000000GhhT-3F6L;
	Mon, 21 Jul 2025 08:45:57 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlpN-0000000Gdnm-3Rnw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 08:24:55 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-af0dc229478so6356966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 01:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753086292; x=1753691092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdywicGMC8PWpQoI79nyLjxZDbmHom2ul/36bE097Ak=;
        b=zJoToFsw1I5Ta/wa0gq8Ykl5yI2WaLTeCdOPTJecbj44bGkNj8cNXZonfmQGAAzGY4
         5HhVmeO0pXS6sWTSqL981r81o93MPSlesgJF2xMDXZpdKtOox1tHd2yNQPJNhjJd4hZ0
         VhZV3YmUHwi4KHXlkfONQmsQjPYCPptli50MJjHHb4GQ49z6kLeRALAk1ALk1YsQMJ8w
         9LFcCcXQSvMP64R1JiFbWoLeSf7tnLweqMAGDPZYnB/rZ5zv4v9K932YAQelyy1tElOd
         4iOy0KT18r8SSSR1KWXBZMKiYg1YzeRAwKhrTaHacU/omVdrD43NsNQp1HTPhTIQaNU+
         2dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753086292; x=1753691092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdywicGMC8PWpQoI79nyLjxZDbmHom2ul/36bE097Ak=;
        b=L4MIzbiQse6iSaH26e3DYCZvXlQ3r5AIlJT/8HcRxBc4AUjyeGJFFnSK8w99fZBpL/
         TIRd0U/kcAIv7oWltmkKmyE5zGy78tdc8QsOOaW1lPorkpjAxrB1+akF5WEBJOcT3Y/I
         YG94ekvHK4SndRcE0+jikq9RVvhBfQy7AzLcanxOkiF1DuYwiQs1CahfbN8f9Qbg933q
         +qaUDgKInAyl+EMmHl7+VQPSpzf2X+NsLXi2EuaolYEjo1G8N+R9VMvlYhQZTlCOPA6i
         OMerPphZHlzbF3qfpb0pzEdwcEEs5gdVdhAtgMCVosEYE2dmD7B1jVgXGlp2KHdXa4R5
         woJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCQFcS6Vz5XvxLy6wBDi1NRLEYXeJThW+ngJxhquwVOjmXfQE3Zm0yP2ZbK+4jFw/1W8frwsLMGHNo0YBeAJZa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7wHBikRo6S6nI+9sjoFCCG7MU/Vbm4g/ddUv5hCEkDjgbjiAm
	IrGVesFAnwnrvTmGo1U3ChvI7eS9Gxo6gmKshhiNDS6cmtr0TIGGN7UMK0kAuB67Sz8=
X-Gm-Gg: ASbGncvCEYgzQJEXv98Hw+VhMpCwKDY+UFat/pC+x3n6aKCQxvXaiSjhGt2HVbexvNP
	ROJJMmwgNATY7lEQ2CkYcZ9xgBoAdUXM8LLH4U2qEY6HFCDMVKb37pkbNKhw65N3HFUnKhmcNxF
	2wdU4sfIlu1HtsZpmBNRQ4fFGQfj5wnmTVuLiZIlaOnJk7p5vLpNtUPFf+yIuYPaMvOLFkZ1KgK
	anlIqocGlX6lVHDFn2Qlhrgoy068DvyafC5Gvx4R3zkcneQWXSqiBkn7lbXiZF1c88ZWLdZ+esp
	6sjXQE7HSkCvhpfV9F7QuQZWjgIrZpD2qI40VI2sfoSYij+ovB94gDJ8CIxXtCpBXw1vWehIBm/
	b0WEW6YYEmvsgjgRfn+nC
X-Google-Smtp-Source: AGHT+IGXBWkrr0OYxAUb4JL3ZpYz7yNfjNojugUdotLeKq4sWMewk8MwN0wQ2Tv8Q662Ax1Tz4MBzA==
X-Received: by 2002:a17:907:1c17:b0:ad8:ae51:d16 with SMTP id a640c23a62f3a-ae9ce198bf6mr1960198566b.55.1753086291837;
        Mon, 21 Jul 2025 01:24:51 -0700 (PDT)
Received: from hackbox.lan ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d330sm633826566b.126.2025.07.21.01.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 01:24:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: (subset) [PATCH v3 0/6] clock: imx95: Add LVDS/DISPLAY CSR for i.MX94
Date: Mon, 21 Jul 2025 11:24:46 +0300
Message-Id: <175308625432.1291588.12529765608002208630.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_012453_873098_B4C2AF56 
X-CRM114-Status: GOOD (  14.02  )
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


On Mon, 07 Jul 2025 10:24:36 +0800, Peng Fan wrote:
> Similar to i.MX95, i.MX94 also has LVDS/DISPLAY CSR to provide
> clock gate for LVDS and DISPLAY Controller. So following same approach
> to add the support, as what have been done for i.MX95.
> 
> Patch 1 is to add the binding doc.
> Patch 2 is fixes when supporting i.MX94, but the issues are
> also exposed to i.MX95 even not triggered. No need to rush the
> two patches for 6.16.
> Patch 3 and 4 is to add the clk driver. Patch 3 is almost picked from
> NXP downstream with a minor update. Patch 4 is modified from NXP
> downstream with a few minor patches merged and updated.
> Patch 5 is the dts part to give reviewer a whole view on how it is used.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
      commit: 0b0cd1857b783711b4bdfb8eb513c263b8a84f6d
[2/6] clk: imx95-blk-ctl: Fix synchronous abort
      commit: b08217a257215ed9130fce93d35feba66b49bf0a
[3/6] clk: imx95-blk-ctl: Rename lvds and displaymix csr blk
      commit: 88768d6f8c13ede81b248177fed3ac285499f77c
[4/6] clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display CSR
      commit: 9678bc7661cb34bec4be92685039eec68ca67dad
[5/6] MAINTAINERS: Update i.MX Clock Entry
      commit: c78865241ecffaff7ce5db00ed5b71c1a70c0ff1

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

