Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0B5C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBvlH6prRmF9is7rqvJqNTGgh3P2sJVPtfOXauJIgQo=; b=jvcxwaMXmDody9ZRXL0oeP3SL/
	3A8OnKb1BJxP+UMvKk0UoblFvnEkAduAIHgc+GPQF2S+Q+/Kf+nn+8Hf4vV39KRzqx8+sSq91cTID
	SWQGrQcz9JE2w7g4qHfEV9vqGhJXcOCDucq6qPWq8kQ+MXuXfGA/kmGVPfqwmkRR2OVuXD4Z0jdMo
	67QlYaIt9cWDhfPOYnO7T6tpQETd9tPkWRT9hAXXyfXAhEjRxnMUTaWqXluEbwfgIrTWfPgFIS4i6
	ZCUu6GPR6FbSIuEqDTlSPjR1bDPMdRxPlZnzdbGSotPdbGW3UZmTsWm1+je4JGy2V+58zocZcwfKE
	epcONHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bRx-00000007D2b-2Ae4;
	Mon, 07 Sep 2026 15:40:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bRu-00000007Cye-04od
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 15:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cBvlH6prRmF9is7rqvJqNTGgh3P2sJVPtfOXauJIgQo=; b=EHqtiInrd36b/NLFuuLVd1nCRQ
	Y0nhoRQzr6Jq/wdG5nINoCn5kCuKeRDkVwBnXF00nP0OVPPinmkLDVrzp5M9YBQYzoMzpb4O7YQuE
	6kAN8E9iwM5ftSWYIITy4XYCZFRtPIN4Om21wH4IHyVQjrFt/KiVyzt9ZkmU70cNTVk9URki5yOSY
	Ma2gSrjxUIs6jKOxfM70ALEi+3ubIqGsQodw9RCwQncK76q+uployLqvNqzOx/TcsiXTVsLboO3gW
	Ed42H8M7K95wT99RAAOtlGhPdffKh91eKLVwF8BBrhxmAc29kRdEblZODBA3/2udBwgEZiBEuzw6r
	2fL+cOMg==;
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3bRq-0000000GNze-2aE1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:39:56 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-396d27bb2beso3065599a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795592; x=1789400392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBvlH6prRmF9is7rqvJqNTGgh3P2sJVPtfOXauJIgQo=;
        b=GwXGyKvReONJ65PJNub7feRB9CZmDUbdoTlCxhS8WTKE2J1+c+0dDSLSk3KCR03uAV
         gbPuTI3mv66GvCfZypjCCOmBmnJE39FHOCRdYEmA2VCBe7krn3oHxVlkLnuIlMWwZHMY
         Jq2b4iNDvlVMQoZwLnoF/ai9ugN9x0geDXUgAIJhhpi+HW3uLMvNMDYPAnPsy9Iq45+1
         egKnsd+H+bkDIeij++JoH+gzURmZABMYnT7DXyBgj9W/W6VMuf7wgL5RBsvsaJGZe3la
         5KTTMG9zx50H3s9wArAxigkU3LXKzY2ksAkC4aHeCTDxyLrNhDSQh8a6Q+bTiRjN2h5J
         FbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795592; x=1789400392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBvlH6prRmF9is7rqvJqNTGgh3P2sJVPtfOXauJIgQo=;
        b=jRdERsnb6kB3RpnvOQxZ6//VpNZYaiDcvUxgh3myEFctWdsjYlLjancTIsC1kFlsl6
         2Q6qDNq1bqj6qifVJdu7CcdXw2iHbferNPE4/9ixLhLWoLFN0iA4CJtOOtGzNKhU3acG
         LgpGt6khUId2+are+kDa9HOMudm0SqjnefuuaKFPBT9MbIqRdR944B3XDno6q65mGGiD
         NhjaxUWke4Ix7w1juzPqtUWXK06/cLCpdnrugiZf5HKEm5QIfiiJpJKdpCthNVJ//aka
         fDpBK2JZg/z6ilu2kMiVJMD2+RcXu03Z57jwtXXn3odfSgaJtMDL6RP+ZxeKViAyg6EZ
         iIMA==
X-Forwarded-Encrypted: i=1; AKwUvBzHUtV0jOeZrfbe6amG1gb/rnoFYB9oRR+NkRrf7+Zt1TWUDwtgbBuKZnFyiZ6+HaAyVoqk+OR1Ps//3zrdP5Km@lists.infradead.org
X-Gm-Message-State: AFuF++kiGveUAN5tu/SeBt1REfmggkJRKO/mTDV91aj9xQ2Tip9XLgiI
	JYlK61u+cYCOrbdYy3nzl27hXLOux95S9WvN+s+WsGrXy9LJ0pq91WZu
X-Gm-Gg: AYBFou1bzUEW6zwcrQ8O6S+ZBU4GdSai86TdoRFGoIxPyF6kbkJO9fk4KQVXYAR0omS
	xDqhqB4Mc2T9GAhwKKV6kg5Y6/O8N4PDaOaYFq64xlK9TI1eDgmNKI1LFLabcs3Hj6TPpPh4kG0
	tinR+D7yi+/bbrKPsScdrMiQJe/6VsYVdPkl9JHWBAiOn5rnzCgI3x4bdMNAtjONn7XdIev/mKV
	hZmsE0jb9iZkuej0IUscR6fIv/fWOovR7UZ+otnpvXJJkti+gMHoEpZ6SRJnE3qB3SW6htYR/3n
	x4Qcl78LHof5xrcmqte9+a5IJUUf53L5+QemH7WtrG3O7kN+UCLH/nwXIskUMXk5rEvcJcp0WmA
	2U8GHSQH46P5Vgx+P9cIqaqpBPwpCL055XBFSHlEesYTr/t4fIN3j1k/jyxd3vXjOROiUQfiLet
	E7cYSGggOC7EqlVx/4dOfsqLHnmcLC5MqUakm+JA1g2ddqPUWa7D7uDs/Woe0/
X-Received: by 2002:a17:90a:1c96:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39b66ee3442mr7209213a91.25.1788795592309;
        Mon, 07 Sep 2026 08:39:52 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:39:51 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v4 10/10] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Mon,  7 Sep 2026 23:37:13 +0800
Message-ID: <20260907153713.2572547-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_163955_217141_208D8C3B 
X-CRM114-Status: GOOD (  12.00  )
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

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc320b373656f..dda4d211b7db4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23738,6 +23738,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3


