Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6091ECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PuYbZh3CSJx/YeySaraDhA8HTOEwlS5gR3oZ9G0OMs=; b=awN1E2Sbhtg1m/dnAZ9LoIWtQS
	RVWZfGi6O0Tp2RGg0xfHX+Ien+qBddQvNMiP71jFhJso/g2aEQtC7RjbEwKrU9/1EgTBovVGRZ3Ed
	I2+pUvuTirYL7y9sOLDR9/yGE265wrJToLNKOPKkH7IXyIob/3uQwAeIeObHmNd0unuz7f2BYI22N
	jynRRQIm/FeBPXKcs6JJvbu8dH87lIQZQdqK5w5mclDbuTnJ8GlYelQajCkro9iVP82v8GklUhLtC
	xzA5X7WmBCZ4vxQT0fxs968kmQLfu29VtGrQeSnt13YG0AfnHQBHshsOfcMPk1tfEjNfHnqX863tb
	XyZVC8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDnT2-0000000GzqG-1wHU;
	Mon, 05 Oct 2026 18:31:16 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDnSv-0000000Gzo2-2USo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 18:31:14 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3282db206d3so6640774eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 11:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791225068; x=1791829868; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PuYbZh3CSJx/YeySaraDhA8HTOEwlS5gR3oZ9G0OMs=;
        b=s5qtOexOvMckyIgGYM/6Y9vqV2kKlbpIdCnHgFILEAWMGbhAK+AbYCl+lVcfW9c48F
         WfPMG0MvepNVBwBiEuDtpvWkb0L1/390v1eD10Nmy+wT/xUlM0aENLt/1RIJYZ0qQI9U
         e1fjwuZKGNEE2kXx09txBYM7zPEwi5d8ysBTeK0NQIApxkrsr5OJWuMYl6ow/ZuJ+9FQ
         qR7bjrgU0bTZD68nz5Rcra45suixBQxlvLhGNNftWaiXYeHzOiteDfFUQALoY0bnnwxb
         AMY3NMJ6uADWmwYmnX+LkPBblSL0TN42qyk24picLUZg/orsQ1tu8Cb6QA5lNJ4nkRwr
         BKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791225068; x=1791829868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PuYbZh3CSJx/YeySaraDhA8HTOEwlS5gR3oZ9G0OMs=;
        b=ZdoP4gJP2VsoabkXBC/ULkFMA9dVXt2Du4wbU5VKh8WnZHzLPA6RT1x4RAJSCVMmiI
         +HPuVpyKEnZNUpZEo+Q8/r5s4gYfxJUFBGI67KtyzKR5SS59PQ9pYuyPtRXh+vaSacst
         dHbKuFPYAhj3plaPJh6x4xdmza0qXSqG7vaWVzEgu+rVhS8UcHaCtJHbDASMnwqWtegE
         SDCgFo3HFv57nGuog9ENfJirTRd6QrwgEBM6PmZn1TmfxV2nMzNQIRUJbgrF5IXdcetJ
         6P6Zf/IqWRN7PMjQfeFrqPNBtDTYtrdo0LXy3s2Ec2+5LUF/C5ybZiNWxnMHhc3PXQrX
         98Mg==
X-Forwarded-Encrypted: i=1; AKwUvByOl1NqwJ9rJAI1qwzJXgYj4sx8ESTa/DKzAOfx53GrJYPMB8W6nJy4RsysEflpSi4VH3BhiM+vn8eTzYFucMQB@lists.infradead.org
X-Gm-Message-State: AFuF++mwxpbWwMvIh4nUJuHY/2T1BspeVbDjcD+bxyy5obCBISMRKrR7
	0i/Aw0XgJ/QZ+gzm9zIMOGCJyiv7Y5r1GJTQcVlLp/b/pS2rieuj0pW0
X-Gm-Gg: AYBFou3IKFpkBNheD6tY0aTzIKXIEGdYdi08ZYptBbIVZOthDthsr+YdvCvgv1sjqOA
	G+Q3yv4O9JKfpJvgRlDlEvYiInrkKpG26tuBCh60K5DOhQPKsZyTkhY7KgDMBEQSJtzlSZ/5LiV
	D1f8I87hchzKyS/eW0tP5H/xo3ZqJXWIO4k7veNsNLxdPFFccMAWMVwW2J+IvsgLrwoZEGXI9OO
	30ZyUWez/Id0VT383jIzDGPdcWg8S06Y/anscrMsRsjGG3eMsdIO8jVOSraW/ms8+xkCtUr6CV5
	ats9zG8mZRR2/vOfwm9ouZ5fn83sNVjboWjWo2b+URWojE6Tc2WO/yIRQ0YNzUPF62TlwvqrlbZ
	MFY6Y5LpDaTDnMy584y3zUBA6afTLalprqhTJRm2Off+f+wWW+HY5uGswTrffZ6HVzUIoPjlH2Z
	7WgG5r4YLh54melj/tJOSo4bD0qq2nPqFOqJatjwEbeo5DChyyjKaa+vek3tfWp/FBFtB7O2vCu
	fS+vv1+y2rc3onxkTqeeByCiQBPTNUz3fGew7f3GHycEzX5egVcyit3gDU4RbXdAv7RTkR/iRGE
	qgluHcE=
X-Received: by 2002:a05:7301:f84:b0:34c:1f07:2d5 with SMTP id 5a478bee46e88-3511162fa68mr10914269eec.6.1791225067702;
        Mon, 05 Oct 2026 11:31:07 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac4dc4sm140223eec.23.2026.10.05.11.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:31:07 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  5 Oct 2026 15:30:20 -0300
Message-ID: <20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_113113_573625_3E45A03F 
X-CRM114-Status: GOOD (  10.30  )
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

Hi Junhui,

On Wed Sep 30, 2026 at 1:26 AM CST, Junhui Liu wrote:
> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);

[...]

> +static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
> +			 0x21c, BIT(0), 0);

I'm bringing up mainline on a Radxa Cubie A7Z (PCB V1.11, 1 GiB). With
7.3-rc6, this series and a local common-DT integration, PSCI reboot and
power-off hang once unused clocks are disabled. The boot chain uses
vendor boot0/BL31 and source-built SCP/U-Boot.

Keeping both of these gates enabled fixes reboot; either alone still
hangs. With only these two marked CLK_IS_CRITICAL, reboot returns to
boot0 and power-off drops DCDC1 from 3.3 V to 0.7 V and turns off the
green LED with power still connected. I haven't checked whether each
gate is needed for power-off on its own.

My guess is that BL31 talks to the SCP for these, but I haven't traced
it, and it may be specific to the vendor firmware.

Would it make sense to mark them CLK_IS_CRITICAL, like bus-r-cpucfg
already is? I can test the next revision on this board either way.

Thanks,
Vinicius

