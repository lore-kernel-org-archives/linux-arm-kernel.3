Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB817C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=; b=p0o/uVj1ijnKeqhd1AJsTPvc5P
	fOcbz54hoCl+pWc6DEcsmA/MuyssUObtC4vMc+pkYybSrRWs5RT5yinHhd6NeM23n70MDh/WELH/p
	VCTAgOPMrDjf2SL1VLnJkcPmpbPkXysEpGMnvk0HBkVpNHkFjACvSG4jux/8OH9zWs0NcnkYmQXQ3
	KxbylqVHMKsfenM3w9M5AkVD40iW0jSTrUegBTZ3d7cBIbjX3UQtgqAlCyeyJTlxs8O3DgHiHF10M
	DRnzzLC3IuRUNH/fP0cgCF2DKJyrvpCEY2qXiU+VSGZ1AmTH9IUNLELxobr6FeLCfV9OIpyIfYdOf
	v6ycL5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvi1-00000000Rym-0kty;
	Mon, 21 Jul 2025 18:57:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvL-00000000ONb-2cG2;
	Mon, 21 Jul 2025 18:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=; b=hpMuDt6tNzxEwPRgtfGONTWb4S
	v/zwcNmHbs9Zu6dLL6Rd4buWqAskclWXbTtEPRvuQhH8xksC00XELBz+BpsBSJemFTZEJaFmL7OwG
	8MkuK8ndqEL5rR9uWMiv7S7rDr8zHNnr1+TQheCqOff3BZvMhOB7lwl+cTKbyuj6AAehPLwhInjii
	9L/2Yapf3N2BK345cIQ6QCxSy0SVA8y/I0vWB1YYn06jJ/Sp5OAB+pnJJeEh9/K8sPvHpIpgulCTh
	gvhakXzzz1CBvBwSM5UMP4Qv/V2o+z2vH6J35ainPG1xdAlqPE9ycqfFQ5UVOH8vANJX/urq6TF2h
	5JBoP9YA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvI-0000000B6tG-2lvM;
	Mon, 21 Jul 2025 18:07:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a52874d593so3512197f8f.0;
        Mon, 21 Jul 2025 11:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121255; x=1753726055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=;
        b=Dlt7JLihMboQjfcL1MWrHGM3v1VF5A0jLXMIcW6UF9fPjeNIXM9AE3LqSV4MRnJKQw
         MuYFBevnRthzpdvI453+FZkR5Q1h5SaIyCUfsw65TXEN2C7NcY2afKKwiHVHYyVK7BiX
         N4YRPYavSONLaaiMT1BueSyY6DBZR5ZaE2uFi5tQmxagq92AiI+xa5n4SCacHZzvpETF
         gYz41OGz3qlckmZ59/HPSfgO0jalBoyKkJFhS+M1nCKxDh4UrXp/6fK/GwO3kMoe/YFc
         CxfR4tF85ILUXJ/bSuuNBJaCphV8FnNNI865wBIxOsAtH9clR9WA96CFAZHZtmQvlmDn
         5UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121255; x=1753726055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=;
        b=MMb2tKRT6wMFSiMDJ01V6HasahskYTf92LZjRplJ889lmU5rUeb+QeBM/PjdGP1H0x
         bGc/b9M75rP9H2oXAoteW8VdPkYGPq2/T8BWQaZieASf9DXzFybsR95mbe9qZdR1UB7n
         gBgFsQS+KqR4tV7hD47iGXSZh9VO/59hR8x338EsDcpy4QhQhOZOtHVg7P0IJwof7KHJ
         xHGiJG4Jme7LB7T5Ax0bqoF+FjgavBL+xc/a8l05LbBn+d2TlfUJkf9R1fp5I/sQ+DoW
         fbnSqBit+t0dtX8pEKLt4KE6ycTx/QJNraf69N5UsM8KUr5EA3zGS0pij6RchA6txr4Z
         C9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUS0dsWZMDBvK5Ccy8rk8GYO3w88B6pN8kyfJ0kkof8VIUJvu6aShvBwrtoYeUcYwkbP6r5yIYGLA49hHWNlJwZ@lists.infradead.org, AJvYcCVrlz1kxl38ZrfcS15mUYuXlkW4GR9cRJ61kF9jS42B0wx9eabQjwSJrtZ8h5qE/woo4jnvqc65ZivL5wmvCQk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFAomp5P5tyKiLDczbb8EmhN4ybFFvxNHGFh8CezNMXpHNNvrQ
	ErSYDoyqwJRc1KRYMZswLVi+qHd3bRS9PiykRDcVcl8OVI3S4UvxLHQE
X-Gm-Gg: ASbGnctZHewZQUjswoGkGH2yuGOWDWEqcm0iaSJ5kRTCtHU9JDd8Nj3B9YZvn2dofWX
	ibdPbFF7VxzgWIL0EFUNXQuYedO3RoyObUZG/IOO3J727paFahhPtodMrK50b2wI/E20gRuD8U7
	Z0ml7L3oZQPW92eC7qZfFtkchoKxm4/Fvd1e7id57eUMKEDA/Va0JfOaJZD6mnG9hlcQo6GPT+T
	zUVvBT/tbn6IKAZEctaTHophnhLkIrPRP0PKSF73KtWIx9mXRsUHR8vVC5Dwqw1/tztxVrIgOrv
	BAXPxK2LZ/4bY6NHhc84wKNPFPUHX6Rtmbww+ExchozCxHOqxOH19H0PyBzEsSNjRcrvb7h8QvS
	D6xbPX2ADpAdLOrDIwsJOBPE=
X-Google-Smtp-Source: AGHT+IHMDl1HdTYdt7dKUNczFNSMkURtUfgoOq1Dch3s+qbqN05Wekq5XqXHAV+JIJaRsdTcIptzmA==
X-Received: by 2002:a05:6000:26c9:b0:3b4:9dbd:eee9 with SMTP id ffacd0b85a97d-3b60e510026mr17022246f8f.36.1753121254931;
        Mon, 21 Jul 2025 11:07:34 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 5/5] i2c: mt7621: make device reset optional
Date: Mon, 21 Jul 2025 20:05:56 +0200
Message-ID: <20250721180710.2116-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250721180710.2116-1-ansuelsmth@gmail.com>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_190736_929849_E3C29708 
X-CRM114-Status: GOOD (  12.20  )
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

Airoha SoC that makes use of the same Mediatek I2C driver/logic doesn't
have reset line for I2C so use optional device_reset variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index b4dc1fb269a6..6e3848f163f0 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -91,7 +91,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	u32 reg;
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
+	ret = device_reset_optional(i2c->adap.dev.parent);
 	if (ret)
 		dev_err(i2c->dev, "I2C reset failed!\n");
 
-- 
2.50.0


