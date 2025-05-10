Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B6CC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ijvnew3h0xw65xtPp4Zyn3Y7poqn0R7NBg2KYZO4w8A=; b=PlBfuxEptvN5cvgwIKZnQ3NZW7
	LLqlx372+XdOaGBFVkp5+sPY6YK2zMGzdEA+LbixDIca8/jH/Gwz+iGFr4EPN1gWpvcHVmmIzevhf
	qOpWm5ntACmJqBomLvdkKZ4nlf8ideHnwP3tkNMQ1GOgztNkk5ujw8BtOTglMxXh7MsHfIhTubWyr
	nz1HAqpPlcnFVXv10PzX+KOACrkO8rKPK+/1q1cWg2114Wqc3LuQhUucDSMK8ZwoCxoQWKSmcrxPa
	+iFciYjByUGSLS0NWJoyHghqpZtPBkmX+zoxEgXeo4UroUU2+2h8GLmGtSX93Z5o/POa0o7P+Bh0U
	7Ux5qMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmvp-00000006A1a-1T3N;
	Sat, 10 May 2025 16:20:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmpj-000000069RS-0njH;
	Sat, 10 May 2025 16:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Ijvnew3h0xw65xtPp4Zyn3Y7poqn0R7NBg2KYZO4w8A=; b=rE77FBZbRCIsb/SQN+cYSJYiOi
	HaWqtErRGaZR5988s0daXG+FPekrma/zJE/m+1wNR4cZl2TXEU45BuPgAT17zR/IyMeYIsYGHvYIK
	wWooRTyMCUghK8+h/LOxdcGYXqwVdyw1VAYiL5QwG4e6J/zYg0mwAZ1HBI3/+2Gbqucp9vLCQ3F8T
	urYh8qcdnsBRP5H2+i43HxDrkkoeJZXizaI9dBTurGBQYTPGVQgUXJeMo9gfj70DOWy8CRJ+0O9MR
	Vw+fiq5yfD0tRBv28VmFb5HU0fFfuHXhcQh10LZUhc7FQe9MAtpxrAj9xDexR/mRFbBITwjnDUXCr
	SeehJG0A==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDmpY-0000dK-Im; Sat, 10 May 2025 18:13:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] rockchip: Enable Ethernet controller on Radxa E20C
Date: Sat, 10 May 2025 18:13:28 +0200
Message-ID: <174689356069.2086280.16152743367950070469.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509202402.260038-1-jonas@kwiboo.se>
References: <20250509202402.260038-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_091351_226204_ADB70869 
X-CRM114-Status: GOOD (  12.38  )
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


On Fri, 09 May 2025 20:23:56 +0000, Jonas Karlman wrote:
> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
> used with the integrated PHY and a second 1000/100/10 MAC to be used
> with an external Ethernet PHY.
> 
> This series add device tree nodes for the Ethernet controllers found in
> RK3528 and enable the LAN interface on Radxa E20C.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add GMAC nodes for RK3528
      commit: 5eb28f461a1b368a57994cc3b3f2ba3154c00bb8
[2/2] arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C
      commit: 10b9ef4a514b25dea6eac24f25e3027866526800

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

