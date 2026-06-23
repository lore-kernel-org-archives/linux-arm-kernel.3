Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E92CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzZ/eVkAfrxKfCLuLelvePEFPRb5OS3MmMKbZz3YN1o=; b=g19mID0eyJ1F5Wk8WiSh5cOy+3
	Nj5m1K5dfrWGKiBtnXhfCWaelAUME+bNw81LS8uQRSHE92kFl8sjboN6/6d3Pw+4SkohhdQM9n8Py
	8aT1tKWGSpyw82ONF3wXlZN2h7sH63yyKNZhTxHytrdq1QfrTndyQ8VcvmloBLRTl5dFJ+/U8WPzW
	MahB+4bfJrCm20f05UtUmKMdeGMqsE5kZo2I7F4sf9hYaj4lIfSj/CL5gABcAKWQHqq24O4P4Xy8Y
	DxDEu5NRKGCS82Dos2jhmsi847qSpHOjmpYZghkAkYMu9giIPiS8VxjPybA5E6H4kpdUvVqsK8v7Z
	9NTbOb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1pE-00000006PGw-3d1v;
	Tue, 23 Jun 2026 14:10:04 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1pC-00000006PGD-3lX5;
	Tue, 23 Jun 2026 14:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QzZ/eVkAfrxKfCLuLelvePEFPRb5OS3MmMKbZz3YN1o=; b=lB1sH8Fg4D035v/eEGjsmD/nds
	1qjTMd1aOWqyYCSUoOuu5NowhENS5PNqJPPWFrt1J8WfM+rUzw3OOA5Zay9XD912Bmy7qKh4jRPzT
	iYEiKZNTrRjQnajOwDdSd0ToNDN7tB3jf78OOV3cSmWEpLtkbMErlT5Xt2Q3N+c9m8AueJkGhlHCZ
	jAxfZWU0/iDNXR/lj97U1DXYcpwTfYk3ttdJuKAu50qoUS+oYYsZiGAn3ajjV3KbPDFVucZrXNcUh
	VwQFbJ/BNH4F7nwtO8m45QajKORSqAQeT+BeMa6bJ63ntnD04XjnzAvRQW3GrP7npeJKTaKEb5oz/
	lZ1xcw/Q==;
Received: from [81.57.40.39] (port=50640 helo=superkali.me)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wc1pD-0000000AngH-03t6;
	Tue, 23 Jun 2026 16:10:00 +0200
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
Date: Tue, 23 Jun 2026 16:09:58 +0200
Message-ID: <20260623140958.4181297-1-hello@superkali.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <DJGH34DVKL0W.3T6UB4G4WYYUJ@cknow-tech.com>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me> <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me> <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego> <20260623123316.4111002-1-hello@superkali.me> <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com> <20260623132351.4144457-1-hello@superkali.me> <DJGH34DVKL0W.3T6UB4G4WYYUJ@cknow-tech.com>
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
X-CRM114-CacheID: sfid-20260623_071003_121082_9EE484B7 
X-CRM114-Status: UNSURE (   4.34  )
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

> My suspicion that more RK3588 based boards would be broken is because NONE use
> I2S0_8CH_MCLKOUT_TO_IO; they all use I2S0_8CH_MCLKOUT.

These bits reset to open (SYS_GRF_SOC_CON6 = 0x4600, i2sN_mclk_ioe_ clear,
1'b0 = "Output enable"), so a board doesn't need to reference the gate to
get MCLK. They're RW, so firmware can go either way, but your 0x600 has
them clear, which is why audio works today.

The series made the gate a managed clock, so with no consumer
clk_disable_unused disables it at boot. CLK_IGNORE_UNUSED leaves an
already-open gate alone, so nothing changes for those boards. Only the ones
that come up disabled, like the YY3588 and Ricardo's R58X-Pro, need _TO_IO
for the kernel to turn it back on.

> So IIUC that means I'd be testing both variants.

Right, that covers both: the mux path and the consumer path. Looking
forward to the results.

Best regards,
Daniele

