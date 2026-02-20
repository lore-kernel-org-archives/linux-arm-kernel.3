Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3A8E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 02:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RaV8hw3AXOrpstqaeQMdx39+aahmt7LDfsKU5eK6HU=; b=uPrpw1ifR8iKWXHUt5LKjE8zG/
	q6mTgGe98d3JGpTAjdycaucR0KHryGA5LFxtBCAWugERWLjgnRvL+ThxeiQG9aaRq1RY66sLdZ9yZ
	DjVjl+LwG6T/blwDyHBGFptqNcYkjzTzYCkQCGQhmRg76uQ8t/pwMMP5I7C6KdLUUMjY5R9rh/3Vk
	6mlO4tRCuOrXzzbrfeZrSdpIR3CB85yaCfpO10Z6dLfpvfExP5GhKSKODSbD/x7MfTe4RZpYK/Tby
	uJoiIZsZFxgSKn6X3/vwc5Dv8R66AUMl7CAAl2iqALTgjQR8JesRVmYtpUPeDDkq69CCr5w4BLLyR
	WR28UElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG7r-0000000D43B-0TLH;
	Fri, 20 Feb 2026 02:20:15 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG7o-0000000D41V-25k6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 02:20:13 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-7947cf097c1so14450807b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 18:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771554011; x=1772158811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RaV8hw3AXOrpstqaeQMdx39+aahmt7LDfsKU5eK6HU=;
        b=TccZ3tivsOKTEa8NdQLbV7gZVgw217upw1QpSj6HNOM59E3UihoVPUOHIMUq26To/n
         Jy8Hq+sLZfZ/fuvJTk+VO2ulISVXH4WFEWPvjj4mbSG3sXe8oHwt8Tv8xPnPQkCyfjiI
         7Q5K8YH1ypakvq5z9q0o0bJ9y/8Sz/smta0wHIYK9tWJI1WtM6WO27rqR0JdesRl3QKv
         nw/08QuCNCCDxDDwEW4q+DxcpQbIhqBa404hj/Vc2BCGzwmG6pal9a1XdxO7bhBv4SlC
         FozpDNnmAb+QL7FUSQAPGdFdICGlwf+j6OegKP2ZSaI2MZkI8wdNb97eCIKlhNVxgDHl
         WOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771554011; x=1772158811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6RaV8hw3AXOrpstqaeQMdx39+aahmt7LDfsKU5eK6HU=;
        b=I2aman0wcZbwHQQTabkZR/aFs025yZYTcDtozgSSEJyLb186LPUfmSu4qMvzLfqAYm
         GAASaqQrmiM0MnmznMegcddSIRhkomjWSdDb+8qjlKBMHlxEG6zBXS8DkDxBWOH6LDJO
         4lwwVt26T7iVREJRrRFK1GFEIP0cOc8VJV97xaUsrCxNZaWetRsTYyuacffhGQSHAUuI
         hqjZyAZJ5dHXWMQ7aVBgusf/f54F1jCxpJBXVzrMuDeDh8H1+UgVG7oL4zA5OA4XfmbX
         TIOmAvbE0SUJ0rEa8gv/2kA/TDlYXeav71qdssrBVODu6lZtBSu4oe3H7K1b03CM9c2a
         b/zw==
X-Forwarded-Encrypted: i=1; AJvYcCVIZo/uha7pprmcV22xDw0S6Zy7Zqz6+LjvFQ6B/0XpRdJ4QTYmj/vjbFvkUZ/SeHqjfV+/zAsvzWYMcuDErr14@lists.infradead.org
X-Gm-Message-State: AOJu0YwDCo1IhAmvAbTBmZeXsFeaXlWxJXvZUBRtql/KVHAW1Ue9GReh
	beqhYQWK+t1XX3oMoF3VVdnyErm+vW8r26kX+6twzeWD75rw/cRRFhRs
X-Gm-Gg: AZuq6aJEQVVlpkrHGVhFUfF8ts3+c0OBsTNXRdbbyskco4A0OxAAb9mNrHDWTQ13kr1
	BRHrjJKRwQxS5qw/7iFIyE5JQRr8zXwtiPlTRTC5704R2AYDCP03rwQMQKMqS+ak96ltILLQLK6
	46Qldr1t8Qpa0WahIgWS46GGOT7tzkYYsG+4G9rk0BREbv+iM2/oI+9mZRcpy+N108xy2BgafXq
	GHhoA0F3HVSUSWOcyig3c8Ym/Z1et2rJN2yBJVS3n05cddjVS4y4XpBEluCEyLmbKB/lrodNLXg
	IsNduouSrPjBcfvLI9bcPwIYQcTlnzYVPIggyINg0ACT9tsEFLGw5Km4xmhiANJKyn8o2dCeCwO
	8dImFHG2nwThDAdKKUK7rQiJy6pQc6wloOKU1OzzaZdko4R+pAs7JrJvHqQ3GF5WB2tr/
X-Received: by 2002:a05:690c:802:b0:796:2fde:5df5 with SMTP id 00721157ae682-797ac5ce756mr105281867b3.32.1771554011568;
        Thu, 19 Feb 2026 18:20:11 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-797d142c2dbsm45550347b3.47.2026.02.19.18.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:20:11 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next 2/2] net: ethernet: cortina: fix nvmem mac addresses
Date: Thu, 19 Feb 2026 18:19:49 -0800
Message-ID: <20260220021949.40817-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220021949.40817-1-rosenp@gmail.com>
References: <20260220021949.40817-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_182012_550981_A73002EF 
X-CRM114-Status: GOOD (  10.84  )
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

of_get_mac_address can return EPROBE_DEFER in case an nvmem driver needs
to be loaded. Handle to allow nvmem mac address overrides.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/cortina/gemini.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 8726e5ffbce7..4225676662c8 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -2525,6 +2525,8 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	netif_napi_add(netdev, &port->napi, gmac_napi_poll);
 
 	ret = of_get_mac_address(np, mac);
+	if (ret == -EPROBE_DEFER)
+		return ret;
 	if (!ret) {
 		dev_info(dev, "Setting macaddr from DT %pM\n", mac);
 		memcpy(port->mac_addr, mac, ETH_ALEN);
-- 
2.53.0


