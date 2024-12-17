Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A2DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ko81rOXBnl15Kp9sz0wiT29r3RdvTRcC53LJ7v4IBw=; b=Y4c42169DjgA+yQmegUl/Hpmjm
	66EQDa63yOyHeZkRWyOI0xskLmcOZrQfDb12vB2KiwTMc42HzkAdgyORb6udhE132TadW8Pb7YNXJ
	ee78vJ/5bNVHUKrZ/vdPQEgbHS3LvA/b97oNxfINLcxiA33do9ghdC1aqotosaHqSEFX1a8o4ZRXR
	uxoNZUZ3BCmzR18BZTzuqoxv6Yyr4X90OWMdsYTnmp4n8dVKztmKE6gPWod78IWzQL+z5Qr3HY+0v
	lok6xuCwaGl9we+Tw7OfkxohzBXezUd1JOM48mfig+JS6y5m8EX9QEPtpj98Bp80Je/caBq8yzwM1
	x2hRD23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNc7K-0000000EVEZ-3l5Y;
	Tue, 17 Dec 2024 18:16:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNc38-0000000EUUO-2Il4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:12:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D414A41F43;
	Tue, 17 Dec 2024 18:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357FFC4CEDD;
	Tue, 17 Dec 2024 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459121;
	bh=d9mGnZDHaJzDeXuKCaPy+9xk0XBg5gLpu9ArK0AHMKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oeGJV7TzMO2K/f4KYDTiE7oK8pvu0X6kilCxjF5oFugyKqzLn+6n34touk83bBI+F
	 skpEqsPKCkHdiNdFIBGSRhJndcH41NadHgdnnn5LSoCdZbpBoE8+VzsUH/3UA4VE5D
	 /zyFHELz5BOhGK0S0aS5NwjPHbFEMTOE8v7gKxCgg7Kl2Hf/nrFywk2LbP40jJ1e1P
	 G7yGDFVr1i9vvN69t0G1BcnUbV/qjvlPQi6C9CHQfZvaivfRTBfRJL/VMASFIM4xpa
	 syn1KdPb9tFSzE25V9vueRU9bBIJ6fFv6Zu4RAF5vbZl7O/L6ErrPliOQVDL8iAjp2
	 /BpPqY4vXonMg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 17 Dec 2024 12:11:42 -0600
Subject: [PATCH v2 3/3] mfd: syscon: Allow syscon nodes without a "syscon"
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-syscon-fixes-v2-3-4f56d750541d@kernel.org>
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
In-Reply-To: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Pankaj Dubey <pankaj.dubey@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 John Madieu <john.madieu.xa@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_101202_716472_48035A9F 
X-CRM114-Status: GOOD (  17.16  )
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

of_syscon_register_regmap() was added for nodes which need a custom
regmap setup. It's not really correct for those nodes to claim they are
compatible with "syscon" as the default handling likely doesn't work in
those cases. If device_node_get_regmap() happens to be called first,
then of_syscon_register() will be called and an incorrect regmap will be
created (barring some other error). That may lead to unknown results in
the worst case. In the best case, of_syscon_register_regmap() will fail
with -EEXIST. This problem remains unless these cases drop "syscon" (an
ABI issue) or we exclude them using their specific compatible. ATM,
there is only one user: "google,gs101-pmu"

There are also cases of adding "syscon" compatible to existing nodes
after the fact in order to register the syscon. That presents a
potential DT ABI problem. Instead, if there's a kernel change needing a
syscon for a node, then it should be possible to allow the kernel to
register a syscon without a DT change. That's only possible by using
of_syscon_register_regmap() currently, but in the future we may want to
support a match list for cases which don't need a custom regmap.

With this change, the lookup functions will succeed for any node
registered by of_syscon_register_regmap() regardless of whether the node
compatible contains "syscon".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Fix logic when a syscon is found in list to not return an error
---
 drivers/mfd/syscon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index bfb1f69fcff1d3cd35cf04ccd4c449e7d0395c79..226915ca3c93dcaf47bdd46b58e00e10e155f952 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -171,9 +171,12 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
 			break;
 		}
 
-	if (!syscon)
-		syscon = of_syscon_register(np, check_res);
-
+	if (!syscon) {
+		if (of_device_is_compatible(np, "syscon"))
+			syscon = of_syscon_register(np, check_res);
+		else
+			syscon = ERR_PTR(-EINVAL);
+	}
 	mutex_unlock(&syscon_list_lock);
 
 	if (IS_ERR(syscon))
@@ -238,9 +241,6 @@ EXPORT_SYMBOL_GPL(device_node_to_regmap);
 
 struct regmap *syscon_node_to_regmap(struct device_node *np)
 {
-	if (!of_device_is_compatible(np, "syscon"))
-		return ERR_PTR(-EINVAL);
-
 	return device_node_get_regmap(np, true);
 }
 EXPORT_SYMBOL_GPL(syscon_node_to_regmap);

-- 
2.45.2


