Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC152C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQhuxUhRanThkxdEOXasCJ4w6JBVmta7BprVKmAc0/A=; b=WA+KKvAQmYpWyX6Vzn8SzAK0pX
	wU4GwDgL4ez4VDPAtECMtaMwbR8DimBEuvT0ZmDLETD/xSd/I9gX89D0VBpaQXAc6RXmJKooJ04jL
	8ZLJ7xhYOzbpW/jCBIiZ0SnjSJeWqk5eYjYr3haMdKakre6G0t2oOtHyp1hvDNUGQQpB+6C857Yjh
	JgufCFmdSACP3SUn/J5gBdM6QMFx06LzSCEhUPb8rLV+GO0W2YWHd/XBYS5it9jizlKVw5h2VTzFo
	sMIhZm2oUGcmwcInRJ1YsMdrEYelso10Sca1nctOVqbUol9dEHFxHX9gykuiGog6q4DqFW4mbzTk9
	UaKxZFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOQt-0000000DKnI-21Es;
	Fri, 21 Aug 2026 12:33:15 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOQp-0000000DKlj-1P0m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:33:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2caea3f742bso15540225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315591; x=1787920391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQhuxUhRanThkxdEOXasCJ4w6JBVmta7BprVKmAc0/A=;
        b=Wb9+pVxRBtWG+GAkjduXOq/MKNZZSPyyZU1weGrQ3egHR2kd6d48fGvW+m0gHR3POH
         wXCzkdfLabDRkJsByBEp72AMbTD0hCOtUxZV0KSCuHYefV4OWFWD06lyHnkivGIgi2Ab
         bp4rQN36SyNlgH1Rj4G7GY36kxcpWRQOh/68w8GuH6Wh1d3Bnn/NeWaMuGwZBZ7Ki3iE
         Rpf1JtxXdlpr1xJc3qZbKWJqL9+d/86F//HEukuc4tYUMqTl1bj0d+DQ3TEZReTdRWmh
         zVkWnmG3sIef3ftUfYbEgrgXCv1I6oG3xQ7DqU3BdsBT1RfxmdkYMDV4s1Kzi9qSUdqX
         QvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315591; x=1787920391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQhuxUhRanThkxdEOXasCJ4w6JBVmta7BprVKmAc0/A=;
        b=r2frzb6x76g2ZG96QU+TDYdwylU4/rxeyn7vrS/RuXIBRFdc/Ew41fXsblX9fmWT3d
         35kcLLvIxk6hygHthHJv7yCKIZ1eNrzkGYWpQuWXVmUj8TsTEOml4EK22oUtpko2PYER
         2U2mBXvwuM5o8UpWuy3B6dNBh3D5AAnTAOrFRRhjyoPowngcQRiQuCx1KOEIBHCpv5Oa
         O5MsZzlf1MREm/17XmtghMov3iGVVlZzae87PXVWcMXpm//Rgm95ufXdTaFeZB9HOzqQ
         +8IBgx4oLG1Sa/9YH+gdNB7E3PAYPI+22ogqjFDyRLh4kI6jKLp093mb+tj1BbPP2HWz
         TKNQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+IDaYfYhW7shzJ0C2+S0UNigWjozO4PZx4w0/gIFL6EUvRlc0seIvNIxbG6PtoKsFrwNVO49LI8/CHEAD5vg5@lists.infradead.org
X-Gm-Message-State: AFuF++kmHtJ3Jh4h5MwmLGO/Exq/aFBHv95POLbJG3+FaP7W5J/uaBQJ
	xeNfMeJzlxZGnpwnA/c1vdOgDjjReLyhFlcpkGbMRkCRZMU1oqHCI8RH
X-Gm-Gg: AR+sD10nrtQ52nEHl03GuKNyg4Wy+TVP8fCfiZN0xRrR5r3j1Cm1FqcTSsre0rbnSFP
	IW6cPtqoY2QjHz+RCN5uYscBK87R9oZvX124BAIppdlPwdtrNkfM/HisHMdRB/rj6j1I30puuTe
	oNS5/4t8k1DhjJpm68gCu64RJRBvHCjkCPi001KLrObQ3v+B9BibFnIW7WGLfZqri3c9UwAtLwB
	Zdqvhg+7UQo/xyik3UtjWC6B46UVO3CO8c6plLQ4K2wfAqb6Er+vnxAjy7tmbzberxOJ5Rr+iIg
	nUV1gGkQW40JII39RyQlkmQFOPZ9D54nQfKpb0u3KlSGwYAkarMZRWJTi0hAO81KYa3uD5Oswud
	Yw/iBbGYzbwGshKUWWp2ENRlroQYIjAeqN1fNP2eRm8LnhmTz3+j1yRrRijSEB4ybPM5v4vPR80
	bnGyrkFcS1j5Di4xrdppalmI7opDjijsmoA0K+XyMEolu5/vIqdSXZcnoQRole5aTh0SmIB7+te
	nZfrvhC7NBU4dAISkONPu9i6T+rZ47d1C7MXXQsVpiL3B+1iUc5q2xOF3ZTNDP//42pI77BoyNO
	U4UC
X-Received: by 2002:a17:902:ebcd:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d64afa4e37mr124259535ad.6.1787315590698;
        Fri, 21 Aug 2026 05:33:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1d8sm18402285ad.52.2026.08.21.05.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:33:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net v4 1/3] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Fri, 21 Aug 2026 19:32:47 +0700
Message-ID: <20260821123249.41527-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123249.41527-1-phucduc.bui@gmail.com>
References: <20260821123249.41527-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053311_404277_40C9AAA7 
X-CRM114-Status: GOOD (  12.95  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Another call to platform_get_irq_optional() in the same function already
handles the return value this way. Apply the same error handling to this
call site for consistency.

Fixes: d6349e3e14c7 ("net: axienet: Mark eth_irq as optional")
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1722b7038f34..207aecb5f8b9 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2975,6 +2975,8 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not determine irqs\n");
 			return -ENOMEM;
 		}
+		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+			return lp->eth_irq;
 
 		/* Reset core now that clocks are enabled, prior to accessing MDIO */
 		ret = __axienet_device_reset(lp);
-- 
2.43.0


