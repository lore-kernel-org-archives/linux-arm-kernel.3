Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226BC107526F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+sFZ1FLKiR65L4M1IonsRzZ9s3L1BFiD5c8mbE2C9B0=; b=Ou9ShT3FY5QXK6
	a3VBzcstyqoAFlSFjnZ/lTDrp9hwE0OCGBbhHzv6FloXPPkqbzp8He+rJoEIWdkkNLB/nYJvOKkpV
	LuWtS2MCl3oliO6qbAQCAoZBJqSZtkLbe8Jj+SPn+3GSmE6LoKz5g+R//OwmxnNOxePGicRES2xdx
	CxVZNHHGUIw03S25Dq1P1JYWrUt5RtUIYZMfELhCWSUObeL0wCe4QNDjf8d7Xm51lwTc5+JoTGVYh
	B7MlQ4VeOlHNAKpKVvqiMAGHYlS/UZFBaHTk7y0Y1YCoJUM/4rJhsDY5p1K+xFwFvGbEbNHljPnfn
	iw1BFjDVN7dDQClLWusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37ur-0000000A9eH-3OFF;
	Thu, 19 Mar 2026 07:35:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37uo-0000000A9da-1FmG;
	Thu, 19 Mar 2026 07:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=+sFZ1FLKiR65L4M1IonsRzZ9s3L1BFiD5c8mbE2C9B0=; b=V62rU/Xb4T3rDARmvr6/doRamm
	Z7M9nITFmOXJqjxqGYBjS/hH9WZqIJg/TngX6SGcSgLjbM2bBQwnCq5EKkmgTkJRpZ4wXfNq7wViK
	U3/t5q09H662InQnYhUI5HQpv6IQGuodxlH6DVewluyUm97civaRJ6j4Zs0tStC5XrcjWOP3sTn74
	CyiyIIdkCcrQrGuHsFuPTM+wWFo3LUUJB80hyt6GbsMlz5ISUXKQrRfteKxanb65wjcM7X2k4H+3C
	1gm+Y6H2E882zxA3YyXcxHjFOaIAff58Mgo8Lpd2MKL14bk1gCVHSZgpT12h4i5k58uXbTe6MxVTh
	jqOEx+Sw==;
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37ul-00000005k08-16AE;
	Thu, 19 Mar 2026 07:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+sFZ1FLKiR65L4M1IonsRzZ9s3L1BFiD5c8mbE2C9B0=; b=HuhqpKnsB9WMzy9owOWVxJ77M2
	7o4WnVvv4hvWee3S/36BP+WMIPiOT9q8iZ6yJR5iIMaoJJJlOMMVzwfZYBFA9GlxYHWAm+hbB/bQu
	UnQFOwampOuM+DCkIjUxTZJQ7RoRGRIfDXOJJcAhgFaiA0plcfTfjtkYh/DPB63puMOvG954E7NV2
	GKN507nImCj7yCSMeUlm1wHkV62wC6uWhWucSWQz//ExQW8M42VWSVH/eaiEc7muQOAWQQAmnqKb1
	CSHIvXE3sNrC2l2PrcfSmXGON0o1Wy4NrWDLTSnmBHvqfgFqeQaSWngJlx+Oi0IJQk0FvHJTl9zZw
	fuxbevcg==;
Received: from [109.52.2.233] (port=10095 helo=mac.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w37tN-0000000DgEs-2FIc;
	Thu, 19 Mar 2026 08:34:03 +0100
From: Daniele Briguglio <hello@superkali.me>
Subject: [PATCH v2 0/3] clk: rockchip: rk3588: add I2S MCLK output gate
 clocks
Date: Thu, 19 Mar 2026 08:33:58 +0100
Message-Id: <20260319-rk3588-mclk-gate-grf-v2-0-c4c8daab0762@superkali.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0Jm7Zi2YK2svIdhUeoUGn4zRaIh3
 N3KBVy+l3zv2yASB4pQZhswrSGGaUygThm41o4NYXgmBiWUFrnUyF1+MQYH13fY2IWwYY+uqKU
 RRW68E5CmM5MP7yP7qBK3IS4Tf46XVf7sn+AqUaDWvr5ZVeirNPf4mok724fzQFDt+/4F2AAyE
 rsAAAA=
X-Change-ID: 20260316-rk3588-mclk-gate-grf-c4b180438fc0
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Daniele Briguglio <hello@superkali.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773905640; l=2504;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=hwWOzRdVjXzUuETpCCZtWnOEr3ju3ZD/7cJHhaC2XaY=;
 b=mMlo4V6ZMSIrvQtN1Pp9tg+tjEeICjCvhseV9g1Wqd/UzsZO+A2hqW5EfXzmrGcGGqdCPsp8B
 Cs8B9xF8FZPBNunlVOcc4j395FkERMfhnWpkA/jPkfGq6nm7DStgQS+
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_073531_352835_AA770E24 
X-CRM114-Status: UNSURE (   8.93  )
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

On RK3588, the four I2S master clock (MCLK) outputs to external IO
pins are gated by bits in SYS_GRF SOC_CON6 (offset 0x0318). These
are set-to-disable gates with hiword mask semantics.

The TRM documents the reset value of these bits as 0 (gate open),
but in practice the Rockchip firmware (BL31) may set them during
early boot, preventing the MCLK signal from reaching external audio
codecs. The kernel should manage these gates explicitly so that
audio functionality does not depend on bootloader register state.

This series adds GATE_GRF clock entries for all four I2S MCLK output
gates, following the same approach used for the RK3576 SAI MCLK
output gates [1]. Board DTS files that need MCLK on an IO pin can
reference these clocks (e.g. clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>),
ensuring the output gate is opened when the clock is enabled.

Patch 1 adds the four clock ID bindings.
Patch 2 removes the grf_type_sys exclusion from the aux_grf_table
        lookup, which prevented SYS_GRF-based GATE_GRF entries from
        being resolved on RK3588 (where ctx->grf points to PHP_GRF).
Patch 3 registers the SYS_GRF as an auxiliary GRF and adds the four
        GATE_GRF clock entries, each placed after its parent MCLKOUT.

Tested on a Youyeetoo YY3588 (RK3588) board with an ES8388 audio
codec connected to I2S0. Without this series the firmware leaves the
gate closed and the codec receives no master clock. With the series
applied and DTS updated, audio playback works correctly.

[1] https://lore.kernel.org/r/20250305-rk3576-sai-v1-2-64e6cf863e9a@collabora.com/

Changes in v2:
- Patch 1: shortened commit message (Krzysztof)
- Patch 3: added missing #include <linux/slab.h> for kzalloc_obj
  (kernel test robot)

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
Daniele Briguglio (3):
      dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO

 drivers/clk/rockchip/clk-rk3588.c               | 23 +++++++++++++++++++++++
 drivers/clk/rockchip/clk.c                      |  7 +++----
 include/dt-bindings/clock/rockchip,rk3588-cru.h |  4 ++++
 3 files changed, 30 insertions(+), 4 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-rk3588-mclk-gate-grf-c4b180438fc0

Best regards,
-- 
Daniele Briguglio <hello@superkali.me>


