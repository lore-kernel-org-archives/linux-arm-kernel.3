Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBB1CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUSdR9R631N14alNwqa0GqPMI72JdY9A7cqHTS5tg5U=; b=qJEsDC1Py4N/1UY5Rf34xUlYIs
	KRLUloCL7FU6+F/OqoSfTyYAK++CKL9j3rE98YwSEysLWUuQx9Q4W3bzsXqZUl0X8PUcPK44eYnK4
	IdS4XxUl1iTfNkyoLZEyoOJl7dkWnUw82BOnoGhkNd2MrSrPO4tGxAZukP0TIWPC4zuWe6hKhVajS
	junK8HIdL9+go0nYKthSvTa88CUu5I93kXKoF2hTQNISH5hkTxtQUTH6Lhl/Sw0HsGxnV5MQEzA5X
	2K+SeWhoxJ6TatD1P6D2LfWemNjpRhJUU3QXCHd731MDDYn7rp5YGUq4FG9a/J5AxqHOpFRHcGtD9
	jRpV8kHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXtj-00000000DBd-0RgR;
	Wed, 06 May 2026 08:46:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXtg-00000000DAT-0uYW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:46:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba4efedbeaso13305955ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778057183; x=1778661983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUSdR9R631N14alNwqa0GqPMI72JdY9A7cqHTS5tg5U=;
        b=B74uh6Q47Nchckt6ZXhADU+EPRrdbxoPZkqUEdFBOs/A0kn2ycI22Ka+htALNlxTXL
         uRoToMZGdclVJpin8eUBg/g+LZWvwvpTlLQGHqQqNhpPcC8iTaftvkpTR7AcR19sGyOo
         k30fnxA2fqVmj/tYDaA3P10z/qWat3P8G7gxb7s9hZahP/QyOOjvy62i4P+xru1bd9gm
         TEBmu1PYa5pugtfEpTSDxSNPkRMYp6Ao+bXCaLvxGRLISToF4frAhpxDg0gZtMz4qok3
         feY/00MrHJ5zoJgKa9jLpAdit7AoV43UY04QoZc+gg2fqt5IvkmXKYEGcDnM0j0IX12G
         KsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057183; x=1778661983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jUSdR9R631N14alNwqa0GqPMI72JdY9A7cqHTS5tg5U=;
        b=FIrEaciT0x+8jvgb2E5NaJVntnQAhAFp1SI9aBa27dmkBxPTV/+qSjV4wM5PYJv2Wi
         m7wf1skkLTY4kkccgZglO5QazA7gWfjVX+C/tNMLu3dq/+O1mjeuBXDf/Q+HGeaSl3Dw
         DiZah0RL+80qeNWtGkxSs1fep/h5qts6gQi0PkB+gH44hGzcuJcvyW+YTIs3prNwx1dc
         o63ED45fvqB29ERfLUYdaWYn/G9JYANcr1+FZTc16p8drSiPvz8xKicH0QU1ILyRR5Ar
         tTh5qWWmJHouu2iXaGs+pwbHaT8DKrd4Po1MFaUW1ZMVsneisCpIYNNlIBbmby2J7FQ1
         egkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RhPOgjqEVficOJGTk0YYTLWEKOGa0TAa72XgSOnfjRGi9q1JGU1E84PK/bHXAxxvoBoMNHuZeyj/6/2kG+Gey@lists.infradead.org
X-Gm-Message-State: AOJu0YzbcEN1Rmuxt30MwYjveWxnJkqe6V08XXG2u6hx5T3SMNJQJitS
	aSWMcyO5nbjMXif/Cb2hoq0XkkcErvI62eHkuQrXNx/+etFG+q0Ksob6
X-Gm-Gg: AeBDievgXqtpCRYfIji0Wzu0MQ2RXRwpWt4heuEAWe//5as76/OJOqG1R3ZYSjNVKF6
	vm+n0dbtqsFR10/eqBaC9mZLD2J4BCCoREwQo2CBvsqrANYdaJuCVzlqW3zkPfw1lYJGRZodN+2
	MfPogTU+6J081mksAxRVsuaFJWzCsy+OiBhaHuezQR5gFwZ2i0RWMGBUKB41q52OzEM8XzEnpwy
	01T+gwXqfFHjs6ebqvmR5IS3b2JoQKlJ1x9K1yz51QQipdf7eGhz48B/JcT+SxO06TyD1Nqt/VD
	4kAO8Ts6MynWpAAW6+XX+sxCwcXbfqFk2roxBOrbrjE1Yyv1nPYAjb+9pcRK2uFxPnUEnySjlGk
	4rT7GJps2OSo+1x/vFfQnJvYOdnvi5hbo7WPnQxIuLgD0wwdlIP4vugN80tqw4ly9ysKyA9kRWw
	ojnxm/Fgv1UuGwK7wDPT0oaDKyAUErbGqBBjax156d+WFC+kuoXrx+PpKGm5dnKf0VcnxC6l1hf
	i2ZA9jv6UuTYH8l5vtfBBg=
X-Received: by 2002:a17:902:f650:b0:2b9:87e0:1f80 with SMTP id d9443c01a7336-2ba79c2301dmr26131495ad.24.1778057183288;
        Wed, 06 May 2026 01:46:23 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7bf2d72dsm18985145ad.25.2026.05.06.01.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:46:22 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com
Cc: alexandre.torgue@foss.st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net 1/1] net: stmmac: dwmac-nuvoton: fix NULL pointer dereference in nvt_set_phy_intf_sel()
Date: Wed,  6 May 2026 16:46:13 +0800
Message-ID: <20260506084614.192894-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506084614.192894-1-a0987203069@gmail.com>
References: <20260506084614.192894-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_014624_257672_377C5971 
X-CRM114-Status: GOOD (  11.17  )
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

priv->dev was never initialized after devm_kzalloc() allocates the
private data structure. When nvt_set_phy_intf_sel() is later invoked
via the phylink interface_select callback, it calls
nvt_gmac_get_delay(priv->dev, ...) which dereferences the NULL pointer.

Fix this by assigning priv->dev = dev immediately after allocation.

Fixes: 4d7c557f58ef ("net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
index e2240b68ad98..2ab6ecac6422 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -100,6 +100,8 @@ static int nvt_gmac_probe(struct platform_device *pdev)
 	if (!priv)
 		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
 
+	priv->dev = dev;
+
 	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
 							    1, &priv->macid);
 	if (IS_ERR(priv->regmap))
-- 
2.43.0


