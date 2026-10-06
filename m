Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41305CA6006
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=; b=mYo7Hx+4QE8SutF06rSOCs+0f/
	JvTOxrARSnvuQse08auvLFSADaEvwyM1rssuLdrYNlAEy2flWePcJFq9zuPnMyoPusvq7cwOcLnYd
	+f/tx748B/tPzDGnFiegrR+i4KRz7hZPOdh8os9yLawIolAAWtx/YPNe3QyuSog3L9EIwcsGUDpan
	IfByBpVe6+fixwgTx/CIpIRte4M6Z3BIhbrX5u4qikFCmt/A8I/8BEln8HfniPlwRbbEoZH6lXgQA
	8Yok3cSPWBix4Dk4tGh+4jwE7pnZH18T7lqmjsH5wyUUsCR8rLTh0LVHX951uaUN/04anKBOEJOm7
	a80E3inQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7dC-0000000169H-3dVT;
	Tue, 06 Oct 2026 16:03:06 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7d7-0000000163b-2Rq0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:03:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso563876f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302579; x=1791907379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=;
        b=yNZ/J8gBw/FmSXeHrGpK+3bHtZNnR6yxuAMQVSs1khixIJtznZwsu1473xXuN3zmsx
         nMO04yUu1n88Y+Qcq0bk1sNQRrJiOoqIgYmr3h5OEDkTv8DE9QaHR10geeHvdf06YndG
         1aBFV4/S3WHKqiPtK8hWQG3v/b/6gPsOv87stleg90QA9H9l1Erd5kkI48gKGM2QEgo/
         MSA+oodVIJJ+8/bcpcP3eE/r3+yGMH0dfg5WHae9pELyod/3FzwpDEQPqZvZo0fw1x8j
         o1doyS/cmbgK5tZ8bKxmPIhg2GlPa50aTdd7R3rY0hrk0VSOBgGUFmIwbzGV1xyuW2hN
         t7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302579; x=1791907379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=;
        b=UEAXo02pJrRHnZTp2y+0CcMppDhnyOz6PXqnf7fMYHykMJkjxZEawHpYxqu3Qvr5wy
         33yImJhhc6fis/GoT5lyXrUxDhP+fPSNbyOQ22F/8sZdZ5AkG53ZVmaBEr7oN+TyRlhz
         E40Gh2QKvk80j9nVDvtBZ7g7nQjZgocPHJnj5Jxuunr4O7Ve1cJEWtGh+Dbc4A6P3PYg
         T05Vvgls5TMEFXLTCT4bm0tSkIvavPUBxgec7gRgCT7gDa+sd4N4rtXjHRovNwKoE/yZ
         /Gf2HgvTbVBbJVuXGqZRJbNlyrE8WyRb9T+RSdfcLHzRxd9ekn2MAz6tCRlyUIZ726BY
         XDXA==
X-Forwarded-Encrypted: i=1; AKwUvBw/XRK885A/SsiPb8jUBi3Voh7fuZJkMJADUlaZx/SkXI1RtM0qv0/mgLcLs1urCF6IenoD+ZnwkBsQjxGFK8hh@lists.infradead.org
X-Gm-Message-State: AFq9FYIvkH06pIsQH1eH5LAPdrMx+FYmeBUlnmKkRueuiOZk8ebdJwIf
	Sg9POGHbx350HvNgKqwYGszcCHgtMpV8XmWv5b7H2vN+xURHlNZbikZU+M2N3/yXAlfO8PjSrQ/
	dz4aErrbccQ==
X-Gm-Gg: AYBFou0AN1PV/pTC98cfI1zMWuhQ6mWZKhao7526FfxtAU84mCVShuG1ks9pYTEMJTa
	c7iynYKLjilQ3vQWPYQFRVhthACFYPzSkkPgjZ2WSCguAFqcb2ZrnK1jidSBPs6X9mbXbSdvCw+
	0wcr6B+lOa/GEhnlRZZT3Me52FysotDaSOKLsyFgIjfTFZMQxVhb6DSm+4gKs+GNIrBkDsTTFNI
	htGZixcsJOktZvnikCi3VO1O3xpXIcci9nt/QpNyLe55lVWfYegN/nw2f4DSnF63mU+VV7Bk3gZ
	qqmtUReKVN3mRv9B9Q6XlfaGBWqvVQNaSq5PkPbnaMHQFBb0ijPj1/y5yIwTYDtUnir7At3Ww2w
	Hw8vtmshzL9zW/iOdATwGkJiSBl9jdf//XEnYmKZSo+rYGF8Jt0olLm8GIMqthZneCtiFRSwnSQ
	9ML54ybXtdMMtsovDixe6ARHEIzA2v38HvvLLybKjpDBYawmhr6/1nAlXqfK0o2NJpi4S/Fp6aO
	xoie+tXU5lM9NCz1g==
X-Received: by 2002:a05:6000:2c04:b0:48c:55c1:fb50 with SMTP id ffacd0b85a97d-48c6d1cbc24mr3125986f8f.40.1791302579018;
        Tue, 06 Oct 2026 09:02:59 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:02:58 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:40 +0400
Subject: [PATCH v3 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-2-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Qk5juJXyHQAA0FzltH0EG8o2EdUhAIQpUus6d2gQKFo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV69416CV0SY0q2a6g3/lvREXw3JaLVe8uyHhWGR7
 GMBx/nRHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy14HFGhk4V3ggHMe6XpyPkA48GW/nN6T3hbZU8zyvO5D3b5Ip3cQz/QxiLTU0
 r8xh17WrDPwscuvcndcftWYsZL9Slchi2tJ9gBgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_090301_824583_53FDBE2A 
X-CRM114-Status: GOOD (  12.62  )
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

Whatever program that acts on a reboot mode runs before a full OS, so it
may lack the capability to enable the regulators it depends on, and a
reset that preserves the mode register generally leaves the regulators as
the previously running system left them.

Allow a reboot mode node to name such supplies, so that they can be
turned on while the mode is being requested.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
index 79ffc78b23ea..5ed70c87269e 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
@@ -36,6 +36,14 @@ patternProperties:
   "^mode-.*$":
     maxItems: 1
 
+  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
+    description:
+      Supply that has to be powered for whatever program acts on the mode.
+      That could be a boot ROM with no access to regulators, and a warm reset
+      leaves them as the previously running system left them and not necessarily
+      what their expected out-of-reboot state is. Any supply described here is
+      enabled when a mode is requested, and stays enabled.
+
 unevaluatedProperties: false
 
 required:

-- 
2.55.0


