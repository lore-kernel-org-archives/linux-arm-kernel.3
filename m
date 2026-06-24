Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C506CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJkcKCn078uona9XGGRB7XcSnb+0ei7fuHLd3fVitTA=; b=RpZ6MglXNQRn7zKMoz+h/x9LRu
	a+NcuOL4afk/tBtw5NvQm0pTYYvxVsOaS2hlAHyg5Ohgvy2wmkleIEsngH1LD629INCbvhiPTwDA+
	659wz85KsznudaNOQ8dUXbd8gyb6b3BcYOxbZWzSDazZruLUzN3nDHFk5HHb5gZjMrsDLFyKOc8As
	P7FBOrTgsna+ut7zIE7K8oN0Yt4F2uV5NdvSR+ITVomQnKLL7hLL9gmfOrJuFJ9cfa1cVvAqaEgci
	XRjaoQsdDV6RtCXd1WgKtNDrfHjIm6ev1cDv4BqUIub7AB97ZRAxPnagL7AKxXNEGUtvu3aP9o/Tf
	8S6woKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMaW-00000007kBT-0Bu5;
	Wed, 24 Jun 2026 12:20:16 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMaT-00000007kB5-2Px9;
	Wed, 24 Jun 2026 12:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jJkcKCn078uona9XGGRB7XcSnb+0ei7fuHLd3fVitTA=; b=kZeRiK6rsuM+5U6Q0zOpbGqnRb
	cBSPQDS8MlSefsWmg5NTXgOHfvDyfD/CuhQacADe9pUlGrKPUjFz/v0cDdH3S6ZIjCA0r89Oi5h2x
	HGOldomGpiaL8OvkAiayjjV+ahEwAGBH3eJcRtqMgtvuOe0kzO+NxwJroGKqSyi4KJxKywla95MAA
	IxFMhGzTdOnR0xz/cbUUytzHoea1hBS11X9cnsfm5SKARTOn/PEkQ2WSDCxVUoPJ4EIXOlgcr40Qq
	YJONGlm+bi4R+/VJPAYmYAl4auXLeYaQBsG+esTLIzQb4Mqs8/62oz5CySGxap7qKzh8BnpsurCgS
	1qbENCjQ==;
Received: from [81.57.40.39] (port=58810 helo=superkali.me)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wcMaT-00000004mVM-2OD9;
	Wed, 24 Jun 2026 14:20:10 +0200
From: Daniele Briguglio <hello@superkali.me>
To: Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
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
Date: Wed, 24 Jun 2026 14:20:08 +0200
Message-ID: <20260624122008.1737107-1-hello@superkali.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2008560.6tgchFWduM@diego>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me> <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me> <2008560.6tgchFWduM@diego>
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
X-CRM114-CacheID: sfid-20260624_052013_915923_DFC6BEEC 
X-CRM114-Status: UNSURE (   2.65  )
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

Hi Heiko,

> Care to send a patch for that change? :-)

Will do. I was only waiting for your call on the approach before sending,
so I'll get it out shortly.

Best regards,
Daniele

