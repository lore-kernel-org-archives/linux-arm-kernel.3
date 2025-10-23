Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB0DCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=; b=MrD8irDcl6dOIvVUTYfSOdrZH7
	dZkbupFvJP+zDmZIG7gzCT+F3Qe8ZjBwfKgyESHdip86OlBC9krAm18vErCSOBsHmXfHwJyHQCu9i
	A4KsQKJO+hXOS43fZOhweusQbwPXfwpKIX3fzPmm4YoMWBAit2X5JRhVsjlVT+7JESCqrADUN7sew
	Osa5RvKcKxG6HwAS+DdTEIfg8TGRrxRlzwMusytLv+OOFAca1cAeQB5iBtOH+nqfY4HO4Gcv39AV9
	+QZbf0zzaxc601ppPs08XfN70CIis+kyQsrLfpZ3tmnXktES617geThWa31/+pV42wh7WXOKb+vlg
	vTi4Kz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmY-00000006faK-2w4X;
	Thu, 23 Oct 2025 14:59:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwmR-00000006fVG-1jBW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:59:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-471075c0a18so10578435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761231545; x=1761836345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=;
        b=cvUM+hNp7w/q9hr2vJHx7WQytP6AF0z8bNXm5a2X+M12x/BXaphi/fv1vCGqf+tI/9
         W8suYBhBIm0VjDgOGcXAy7FVWtVRqK9EwrQAMl56S6mnFaCVJ1P89Wdw4/Xx8qNMBoAd
         8ZwNCNdfueHWodbeBeQN+MFrFJwAR0A7hJU3MQdWleax1DnezuPtyD30XMViqQTfmrvV
         k84ulurdhc9GfnBxA4I/l7J4tKbcJ9yFSfokFIkS37+T2G8RZG17ahJSoPUboIvpGu4Y
         T70HnVoS7EWg49YfMBw+n3BFfaqUH3D89uGOPACSG+JusCQNFluqfXWwTqVr8yqVjhzK
         etqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231545; x=1761836345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=;
        b=XS6I2Ql+cf80FbYSulC06tGbVLyfX5dV7+P4xDTM7y9fSiQmJwIvX4fg5SJGIJFvHx
         0dslxKHKMk34jvVSNg4fBHHxzALh+fo8fCV6IZVZiXEjtTMdzn74Qux0guh8VYR47GqN
         2eMY/1jGytEe5C6XJkb+UusDSsFCfvQ17STz9tZe0ulaclX7SxlVArjRIl2NPNoAYt6R
         TzGv056XuTB9KteQTo8gLqiesttpRgcjYd6Dw0awhpRsx4+yeGr7sIlJSo/j97UpSoMH
         D03LrfcGkrYMwtwpWGx1hBbhvlXGve3uAcAzq810+hXmGZJr7A+BucMkC1qHkUwL+OHH
         Et9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHza030vEw/wXjK7KcoRuViDJP/N1+1E4b1fsVzR604edvO9246syykkkorpYF5N9xfZR2W4CgsVsrvg+zwVWE@lists.infradead.org
X-Gm-Message-State: AOJu0YwS+79t5N7AATKbq99rNWnnTwTIk/tLiU3Cj1/gLrA2vQyYiy6V
	bBymRc9ah45RHyG5G2Bo0Od098uHcjEujSTuJ0aOrnoaq/2/gjOIcXFV
X-Gm-Gg: ASbGncuoVtjdElZHljJd9hopyBYr6IqDkAu+tjnBDrIBCEjERfP3PQGOKW66BAe5Vc0
	CHkW41Azm2qydskOTkMQSwv/auLPE0KYBjFHl/65p+jO7fACgka+uET13/eOzTTww4lBHrX2qCK
	K1L5yqFgYBC9JKSyq4dlOisuwpwrPYZJ4/56fKUXjlmfsVzgpGfWNUkKV5xvj/ME00XkShnOk5f
	QLpM9SCzUA/tb7INmWcmHDN49rdy/Fb/UxPinJPzb2aIwz6zFx3A28i5wJlgtv48JyNCoAY5R+c
	iWge6l0XeOqskzgKVXMbn79OhMmPdJt2zD75oiPnN8J4lbs0CAV4NpVGK0Gqa9xzG9JOThGlU8E
	k2o6VcynG/1kz8qXo4neLclZxo60aVWQrVAndFQocjUs7wVsmpdP8JvZh0jXxD58nwphpBlzXiF
	3GKA9w1gVETSmmSHeL9FCVjkyhAn/mYQ==
X-Google-Smtp-Source: AGHT+IGQzECuos+RCLjKO2dAeV8045JWlHC0U32i9kQFj54vECVk7KXnDT+AfzmBCj2mf9NTLyFiIg==
X-Received: by 2002:a05:600c:3494:b0:46e:4744:add7 with SMTP id 5b1f17b1804b1-47117870715mr200630635e9.7.1761231545275;
        Thu, 23 Oct 2025 07:59:05 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475cae9f292sm39822325e9.5.2025.10.23.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:59:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH v2 1/2] net: airoha: use device_set_node helper to setup GDM node
Date: Thu, 23 Oct 2025 16:58:48 +0200
Message-ID: <20251023145850.28459-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023145850.28459-1-ansuelsmth@gmail.com>
References: <20251023145850.28459-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_075907_459351_4658AD10 
X-CRM114-Status: GOOD (  13.10  )
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

Use device_set_node helper to setup GDM node instead of manually setting
the dev.of_node to also fill the fwnode entry.

This is to address some API that use fwnode instead of of_node (for
example phylink_create)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8483ea02603e..ce6d13b10e27 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2904,7 +2904,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 			   NETIF_F_HW_TC;
 	dev->features |= dev->hw_features;
 	dev->vlan_features = dev->hw_features;
-	dev->dev.of_node = np;
+	device_set_node(&dev->dev, of_fwnode_handle(np));
 	dev->irq = qdma->irq_banks[0].irq;
 	SET_NETDEV_DEV(dev, eth->dev);
 
-- 
2.51.0


