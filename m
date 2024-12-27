Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5593E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKZLDmgXnxDTvedApqeYbhb4pkfn3581HbM1Qj4Qke0=; b=AvBEvQggC/WLFxVChiJJC9vjG1
	P0tVn7zC9rudpPj15vF2HqC4F+D9b39HRkir9LcX4HxPhvCMBmFHlJ5zcfKSRU1wllwQ2HQbaozdf
	H0A9L0Gel8AjB/ZyvYQPzQsaefN1970waNMt4LbMAHUW0LJPZzYDGf/1kUeqDvkL0zvSzPoNJ9GGU
	aFNQf5WIneEtxV4re9HLZZ4DJZzWL1gYP7/kATUp11ugwpq2tVJ1duVvjtmiy+2z9abp90l98X5og
	mruqm3WApBI1GPop+UgHuo5NJuZieEiasDWK5x9hB3pyBTw6OxCnT7uIZRClgUXLjp3jajXD/VIh6
	LJup+T/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9m9-00000000CQe-03P4;
	Fri, 27 Dec 2024 12:49:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9jv-00000000C9o-0LY3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 12:46:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so3828552f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303609; x=1735908409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKZLDmgXnxDTvedApqeYbhb4pkfn3581HbM1Qj4Qke0=;
        b=ajADrmJQNJlrt+6MC4HJxkYwCui7rJXYfgT2k1IZs/m/6HQKUAGwBQrmlRaMq7WQUX
         LyVVDC7ApRxVz9bWW2Bb8bf+iIrizVCsDP4ltJBRqX2USKT3DS0k7/u2/nG/5+EO5vDE
         RLEIq0hNmqxsJTI9XSU//scR7kyfHylXzwbvqNaFeyOhiU8wCbd/bsWkcoPsKl+Ykbik
         ablUPpfy0DQ3xLq6vxApx5cMVcx92RuhV4oYI3iXHLTcwUy4jnuDjr2vdRQiF5WgZrNq
         JSF/RE6VYOvLEyBj4sw3mrYnp7Ev2EaHUjiT8DtmpO8sWiWF6F5MYu1L+D/dPZCI0R91
         Iflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303609; x=1735908409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKZLDmgXnxDTvedApqeYbhb4pkfn3581HbM1Qj4Qke0=;
        b=in+g5XSmtUcpW86/YYB/BJd3bCZ39kX2NnxiQ8ysJpyryRF/IupnOGvgO5JODnom4f
         wvf8+UVaewr+L66BQ+7MXI2gD1uo4ZQeiEEdkV4gEaAVVr/l7m2/oEqlgOvahVu03pWB
         8N8ooL8Aqc0SBiVu+sQZF8wIhKweBY5uZ7fTXvO7HUD+Di7DSxzX2uJuc5+8NFNR2XwZ
         zjoM0zv4Lx/gyJ+voxNt95kA/YTOpGFfzbGxG+FghzlT/OEGoFrmPC58YlbCIxchOkFB
         CIY9eEjzrYAOVIfwarFp73p1cf+JbCFKNvkGcr3wqKuF/snzkPEu9IhNSyZHY1UTNYex
         ymzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoXPCbCMSOoG2EdKOVcKahIjqRxj8B3Vw7NPYXP9HHFAciLqJuJyrDcUqCjJS3V1zEyiEWh8/sZuxOnPqW9ImZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxKFQeQEtyR0XZTkAlriOZrE3e4UelS98T93UjvTX014klFYoYF
	AhMF0SXmL//g9jtDJl4O0WiNFrCVC0635sFfyJAMTT4ifLBZIo/v0Gjk52WZjsA=
X-Gm-Gg: ASbGnctzcNMrohyWjA1Syam/xTrjh2e3AxLRsavLu0FnCWI9UaxYNXl68Qaw1WzMbSu
	FaTOYffmocPy+PfT47/JDmRLg8e1/QFFn4ONM55CBuxMKY8mUiQQOmvyeb3s/da1aoJuwjFbGlE
	BivOjkjrCSnzSFxBFUgpxjsjBgPTn0s5Bkjuv6cMSSNAzC9yJZqS7fKTv7xy38+4Llfcc+J3Hx+
	E7TSQKq8c5M6EDz7vKcM7cgJKEe8nQSgYMf4SNtQh/Xl5Lfs/YvDxjl
X-Google-Smtp-Source: AGHT+IHUGw1dRb20Q7tB744vdpiCFmHJR9m5A9wf0UJHlaCM5WPSJo762Y4NDRosAM8fszG7xNcx2g==
X-Received: by 2002:adf:a3d9:0:b0:38a:39ad:3e31 with SMTP id ffacd0b85a97d-38a39ad4128mr6360300f8f.57.1735303609335;
        Fri, 27 Dec 2024 04:46:49 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:48 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: linux-clk@vger.kernel.org,
	Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 208 MHz and 416 MHz entries for PLL1416x
Date: Fri, 27 Dec 2024 14:46:00 +0200
Message-Id: <173530350108.4140483.17886635259126245579.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112013805.333798-1-marex@denx.de>
References: <20241112013805.333798-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_044651_126664_B1E59404 
X-CRM114-Status: UNSURE (   9.92  )
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


On Tue, 12 Nov 2024 02:37:35 +0100, Marek Vasut wrote:
> The PLL1416x is used to implement SYS_PLL3 on i.MX8MP and can be used
> to drive CLKOUTn clock. Add 208 MHz and 416 MHz entries to the PLL so
> they can be generated by the PLL and used to produce e.g. 13 MHz or
> 26 MHz on CLKOUTn output.
> 
> 

Applied, thanks!

[1/1] clk: imx: pll14xx: Add 208 MHz and 416 MHz entries for PLL1416x
      commit: b7f67545ca9fa13f6e12debd68a92c1c664e2e3b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

