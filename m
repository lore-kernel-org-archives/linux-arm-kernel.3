Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EEBC28B27
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2MHZq557DZLmu8HoDAX+Ak6NqSl7I/7w5qQt+/fGYg=; b=OT+VqXgxZW25IDoEZD1u8Ri5Wz
	sPXqnEPN1FVH9wQXXwIAkdZWlaWef7zZd3WSazhULPxJ36meVfE+Ye8uXVkd+A3r8jznUHXQx49QJ
	a1AIpc0H1y5BnfBl/TSwkCNlFbVAIDXR3T7NThmpwKc9tX/T3wsXPumsG4TFVgtKtb6FnvvgspUAW
	s4njTh0g0lLkAoQvfqNetq+O8jncISRjOotj+I9GC0wan3l856sLzsJPlwXWQHyB1uZhu3fs+33sp
	3EhIE/T2Oo1MJomUBwrxjcO74EjD5EUpr/gbD8QyEwIUmFXTfV4eaSmD5Te2ykW/sIZTw2881hGKF
	Kp546l8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCWz-0000000BEuo-18x6;
	Thu, 06 Mar 2025 14:49:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBOy-0000000B4fh-0lEi;
	Thu, 06 Mar 2025 13:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p2MHZq557DZLmu8HoDAX+Ak6NqSl7I/7w5qQt+/fGYg=; b=VB1ji/NTSQGDDUYqqWJqs7MDn3
	d8XOGLkkFBMWVg4IEfVZzWuWg5uNBoE6/DQz+AlZZ+T7KHuDO0b67Cmcmtx5wUG1npQ6vVytIZOyD
	71G9A/yEcuBqEpuJ0f8SSSY2GNR3cCWj3z2co4dATYlV2eED6xlo7n5A9j/C3L9+gjzsjwOlcmHv6
	vn6cj2tPqZTGziyp8p9NcKPHcFAY8pWkBlBsoUlO4ZKw8Vd/Mwpi3r8HnDx6pwwb/OzYFYTVYxtdE
	/bv3z6Ek096MOtZYehV9Jebl6IJE+SfdPd6ugjXASxQYABtBr9T3hQU9ia0IU6XSRcgizgpp/+iCt
	vWdBRfGA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBOv-000000016Gw-0ai9;
	Thu, 06 Mar 2025 13:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p2MHZq557DZLmu8HoDAX+Ak6NqSl7I/7w5qQt+/fGYg=; b=A+w0f7RvRtsuAyx5NFTDD8uU2l
	mNPisZuKkW+KoACpYl1xCpSqeUiK71ycK4fKV14rQOEtNw7Drgj9TN8xCfek9MZ+B2wguVybUZ6fR
	E7H1siM4ZsCfyA+gfYw8g9mTzLYAu7AXPyCXO7n+hqm4LI4YRQLJtEY5V0AYo7yG+tHtDcbqv3daw
	LDT64gyOShAlzBZriEXPoJGanytmsW7GDPtByasV2gwXgcBVkqElh1Z1EFNCdj82SFyWPCpJ4lbiN
	RaWgzVN5DRps4RsJ4+9guH48ioSpXJVpdyknlc5eq+tfyB4jmBQNOdKb4+xZqZgXYAf/W9DuIwmYq
	9sqCXMeQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqBOm-0003OH-Hz; Thu, 06 Mar 2025 14:36:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/8] Support SD/SDIO controllers on RK3528
Date: Thu,  6 Mar 2025 14:36:26 +0100
Message-ID: <174126816885.664640.17521271236710485903.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250305194217.47052-1-ziyao@disroot.org>
References: <20250305194217.47052-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_133637_461502_2FD9467C 
X-CRM114-Status: GOOD (  11.33  )
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


On Wed, 05 Mar 2025 19:42:09 +0000, Yao Zi wrote:
> RK3528 features two SDIO controllers and one SD/MMC controller. This
> series adds essential support for their tuning clocks, document the
> controller in dt-bindings and bring the SD/MMC one up on Radxa E20C
> board. Both HS and SDR104 mode are verified.
> 
> This is based on v2 of the SARADC series[1]
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: soc: rockchip: Add RK3528 VO GRF syscon
      commit: efc1bc1f36568a4297d20a691758b68c121cf982
[2/8] dt-bindings: soc: rockchip: Add RK3528 VPU GRF syscon
      commit: 8f814d7c9f6cdffc1f5cc97637e12cd699ff9085

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

