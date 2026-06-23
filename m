Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83C6CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVy4S/eNaNAAxNj9kHLDxwcgqSAw69kke2AJz1Kb9pY=; b=PjelX9L1GoM+EJmU2Bnz1p52vK
	y0UtrUAlxMatZQyP7Hcikj9eoduEynhlSDx4FjkzoMPuGtGM3xFyMnfDL6LLr4mx0kLzLrdbF8CCW
	L9qrwwm0BEccNSc9Hvt7cTzZxBn8qd47sFxqpJZsYDXBU3Iu+Pvn7eztizUU0uNA9KPFOO6ihA8MY
	xPFGs+u2sFJpGLUtd/HymOVSyqdPioOk0JFGRUhBCYaDdA26tufQ5euL+9afvZAEtnvqyO0pkwFBg
	MJ3YmQc31ZMmEjLOS5nmMf7x3HJus++6PppDOFSiVf15bsowqyF68v9yIKtrHCqDqN8GtHvdiD9aA
	OSH49C+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc16c-00000006L0i-3EMf;
	Tue, 23 Jun 2026 13:23:58 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc16a-00000006L0L-0RES;
	Tue, 23 Jun 2026 13:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PVy4S/eNaNAAxNj9kHLDxwcgqSAw69kke2AJz1Kb9pY=; b=YKi5a7gjyQM1wxwm+vvyuvL6+m
	o/dL7T7k53Z0zxFUgYtLOThwC8F7dF1IT0TDRj/R88bJu588o0gzioJEZVMqmNdOG4NJMjb1Zk38a
	9KCxA48kSac8oPHZJlKEOJbxsjTQBWzMKM7FIsQtv6ZkwMM5enI6BpRmLfTzi2ddbRIs8XuvBfLT5
	Yu8ZGfXW/Fo1MTzrwD01i+QNA5d7aQB8JAqrNCt3HFPjVGG0MDZqmyh/8bjt9UEaW2vrNfKCeUcg4
	134O5NTk2LBdItF1XzsEinqSxwtpRYoAbMUFOVFn/iZ2RM5+HrCjBt8L/XhQSBgV75yS/cr3XQhJg
	VGyp0ESA==;
Received: from [81.57.40.39] (port=52518 helo=superkali.me)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wc16a-00000006qSa-0t0n;
	Tue, 23 Jun 2026 15:23:53 +0200
From: Daniele Briguglio <hello@superkali.me>
To: Diederik de Haas <diederik@cknow-tech.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO
Date: Tue, 23 Jun 2026 15:23:51 +0200
Message-ID: <20260623132351.4144457-1-hello@superkali.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me> <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me> <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego> <20260623123316.4111002-1-hello@superkali.me> <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_062356_308349_C916877F 
X-CRM114-Status: UNSURE (   5.09  )
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

Hi Diederik,

> md.l 0xfd58c318
> fd58c318: 00000600

Thanks. Bit 0 is clear there, so the I2S0 gate is open at the U-Boot
prompt, after BL31 and before Linux. That matches the symptom: the
firmware on your T6 leaves it open, and the kernel closes it once nothing
references it.

Given that, I think Heiko's suggestion makes sense here. Marking the four
gates CLK_IGNORE_UNUSED keeps the kernel from disabling what the firmware
already left open, and boards that reference _TO_IO still drive it through
the consumer.

Could you test that change if you get a chance? Just set the flag on the
I2S0/1/2/3 _TO_IO gates in clk-rk3588.c and check your analog audio comes
back. The series is already merged, so I'll send the fix as a separate
follow-up patch, this evening if Heiko is fine with the approach.

Best regards,
Daniele

