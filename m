Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1B4FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f0aIguRQYWYljT8AmitpZ9/B4tpFTi2ewvWnvOjrRTM=; b=UDzKCayI+1ts8lhWtTViizkL9T
	2hYIojXNpXIozy9kCQi4WHCJXLOn5p65jzN3kftp+spinvwaZjCZyV07dNpZ1ZEBKQ6GLeQwA173s
	jbWKt4X3eU7Aj3GtpNZe4Zq7zT3Zy+N/p5MLJ9ed5zkr7miYPM57EpnEArGT/AMHNNZSh8SFtEV9Z
	C8bstMXBjYBCADW4He53dYygbJweHDHHuJsEcY965lpHxVrHa638FiWd7rrru4w1b9quTau4AtVEN
	xF6eN7+Niq9LPKtCuZjySdrmf/vRhv+xlch//rBX5Zw5YkOa7LOEWlCni56SamuNEXCApxGlBZA79
	cBlE0Mug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJz94-0000000EAqN-1DoF;
	Mon, 04 May 2026 19:39:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJz91-0000000EApt-2Twk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 19:39:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ad21f437eeso26934695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 12:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777923595; x=1778528395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0aIguRQYWYljT8AmitpZ9/B4tpFTi2ewvWnvOjrRTM=;
        b=ilurrU9fMZol25RuC6VkY4Vi0i0JlQf8rluomvYkolUOMFJBnssRCjgmToxwW3c70c
         DgfDaiXrLa6jKA9wZKFWf7Zv/ADrKhfKZORICaqaM984jlBLp1hPJLxOXZ83qttKPeLX
         QSgw4EArZeVC+XL2H/M7jbb2C1VOwVWQpBv0g3O7wZet6WKDOa3hQiOcMpzOpVzgy0dP
         3xbJ2yaHfxiJo+s9bia9mkw0DBMVR/eKRv5mzhNB0uX4ks+IE0rJg5c8Pra1E9nxGVeu
         0BnEQWmKatRtfBMRFqoszSJVCvDGD/pNpJZgcs0I1Web2SHv/gmyp0QAGCHCfqSKhf5R
         ojCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777923595; x=1778528395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0aIguRQYWYljT8AmitpZ9/B4tpFTi2ewvWnvOjrRTM=;
        b=em0lDudHYSEYr8Bea9oEAYm9YqpPjDH08al846VuaahXckFjT5KdXT8t59aOjKgoc0
         z/RJopMVpzDFD/pn2Yk/JV89tpaOVRBmsONlY05wo67XgWoPp+iGvc3SI+fBqAcccsYt
         4Ktm44F3qtrOjim9p/uN9HspBInYre5a++yB7oNGcNQ134YNOWPhsgowKxyVRK2BDrjC
         WlwnMLDCLunndO82OykWAUbl5Kb7oPQB6l5cq1oUaczCnMv3C1QCpmFWrhwxm0L5ZeUx
         m9adrjLj4ZV2G6BFcaWTHYZaPar7HNL++ew/MJAvo4jih01B08D8yolYLzbKAOD8I1cL
         V2Nw==
X-Forwarded-Encrypted: i=1; AFNElJ+AezupnANEEvdVLby3OPpuIXwkY39BPpeB3FrMNbgRLSXjns3D4JHPEiwVfeUnLdKFwsDTfwZHL++AZF2Xk8sG@lists.infradead.org
X-Gm-Message-State: AOJu0YzPj0wVO0nSw+O6phLjSzwnwTbTHICGNCehuKQvRyH12kjBUs/a
	nAwzmADxbmuHmJ1F1U39st6o5CGzUi327SmzPghsIHBkpSrq/8lpjutp
X-Gm-Gg: AeBDiet0xDdHTzKIuF6TnSfXma3+sfCJwYR+aE5JRpTWkXQhFMpQPMIPuXAT2GpL27c
	y/GptQBpkImmdx/YMuv8nzNlrHvzw2SKhgyMszs4vc/By6tnBjjvm5pc+JIjWSQsO+FmtNh4/oY
	gAX2PzzNJgB68WiJ0m2m7xgYjg/kn92IMkFJo66A252cvINZvIIsANmKh+sp12VzUi9YwqiZi9l
	8PUf8nUt/iDnJNvdMtHGZji1o+liw1HyM+/Muo9w0LdbQ0ithFLpdfgLAobYFUpQgfbVnq4q7NN
	nA11msQdM6QV1txWoUegQnaFMSgwHIc0xTMeMdqGV6+NYT2OHR3C+VS+uV/yJpIle6TWsA/aUhl
	vmwLgwy+rm+3LV+dOGb9Hl5gr0sxXaVZWRM71NUY5WOf+RC9vhehNPCo+TGLXGGyECBGnCfHgd9
	rQH365sDfzg/bEJh5nCKuQRHygU40O5WLhzcfKYc44Z98owuWZMVxjSjBrXM/H9wT5BxNG7L3I
X-Received: by 2002:a17:902:cf4c:b0:2b2:53f5:461f with SMTP id d9443c01a7336-2ba4e4d4b4amr6067815ad.25.1777923594624;
        Mon, 04 May 2026 12:39:54 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae363d9sm116121755ad.57.2026.05.04.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:39:54 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>
Cc: Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>,
	Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH net] i2c: sun6i-p2wi: fix of_node reference leak in probe
Date: Tue,  5 May 2026 01:08:34 +0530
Message-Id: <20260504193834.3516862-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_123955_632105_DBE1C4A6 
X-CRM114-Status: GOOD (  16.14  )
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

of_get_next_available_child() returns a device_node pointer with an
incremented reference count.  The reference taken in p2wi_probe() for
the optional child node was dropped on neither the early return when
the "reg" property is missing/invalid nor on the success path, so a
reference is leaked once on every successful probe and twice on every
failed one.

Use the scoped __free(device_node) cleanup helper at the point of
acquisition so the reference is dropped automatically on every exit
path.

Suggested-by: Felix Gu <ustc.gu@gmail.com>
Link: https://lore.kernel.org/linux-i2c/20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com/
Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")

Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..652b37b57159 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -184,7 +184,6 @@ static int p2wi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
@@ -223,7 +222,8 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
-	childnp = of_get_next_available_child(np, NULL);
+	struct device_node *childnp __free(device_node) =
+		of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
 		if (ret) {
-- 
2.25.1


