Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC4FC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HR5w4wu2d/AdbodPVdlLXgyYzkKXoBfBxxBtTecxISQ=; b=Lnow3+zB49Yea7BvrhYwCLTtFz
	n2OFMoZb+7sLOdsuJMQ0hecMHdKy4Hz54MzJyDZWhbHsGOonBi2DKzEKczqw97UJOKhrjqNg4Onfz
	F0u1eMyy4N0m6pZxjBjh+8KVO30Bk+YPXxB5jZ8bHAuagwl7V2oixCa0Osl7PymoicaLha/ytngIt
	heSKlTMRMUL9M7E5aFPNUZ6eGj9O7Gq927E6p4TDbA0L5ulm7WnJcH163QzAVZYEZpprkrSkRhQra
	608lKL79Xc4yNN5zEWAgMkHdGboFoyFjt/bPwGLvLSTCghKVWnXb+jSFMqBFIjnGIPjsidhHrDnPp
	Zycxu5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19rD-0000000AYlA-3FSG;
	Mon, 31 Aug 2026 21:47:59 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19r2-0000000AYeC-3oBv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:47:49 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so29311291fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 14:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788212867; x=1788817667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HR5w4wu2d/AdbodPVdlLXgyYzkKXoBfBxxBtTecxISQ=;
        b=gTXC9Rg2ualcIMUFmLFNnflQufjPsqXHr39+VHMMx2XpgLDMSQh2MZBfvUXAhDcskK
         inIJ9X8ZSirAO1EE0QVzeVs4B1860/MXqYZYAbh2tpb4lIngrqBlTa4zQda7pitrrL6T
         AM7ChNDZbpGrUFoj4kMcbfhNV5K+dH2EkSwlBf/ilIB0jc9d3yYks2KUt3gQjQJrYr86
         0Jvkwoj5l6P78No1X+1K0X5cOejMmXasNyFm7eemP4ZPQ6UGcXBCL7puHRLrwHWo01l9
         V1ZcuEdCgmOZ4v+mSt3JMoLUc2JOpRt9GlegJCQMQWhs9tETKHw2nafeI2ajWMfAlMKV
         k6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788212867; x=1788817667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HR5w4wu2d/AdbodPVdlLXgyYzkKXoBfBxxBtTecxISQ=;
        b=Y/RRDRmJft+2uX0Rs/ePXWKOPhkUU9hUWKEGyiTe+k6LIB5d7l2r5zAx2JWVQG157t
         tsTjdMCob0o+Plf+0mZccCf+59KzLHs7KwhroyqNKmMg68CYO9hcEnbwtZzKFdHw3eEA
         ERV1LzxTXsklJol9Aln34PkRdenQ9j0l3p458W9QuPqk8r2e+SoRJKnlNbhdjGSi7wSo
         mvnGdb5usBdGFmZ4ec8VPELzPMEADojWnLyjyGPpwu6WmxuUQtmYDqvcpVMrKf6KNNJg
         SDDPT1q9HM8doYBqhuK6C9ddoIaWWUWUHdNp5jPdKQB2CEDpwdP2secZFcpQ4akaHCFV
         ZVvw==
X-Forwarded-Encrypted: i=1; AKwUvByD9LemsJrs02F/1wX/BZsDvh1HzDSMgUsBnr4kLK7PF5tFunxGZvQYczaPU8+DUlrQ7VGnO5jkGCkcExdkNTu2@lists.infradead.org
X-Gm-Message-State: AFuF++njkickh/7XkzaZLJ6fdniytVHePueJM8ewxgur2A9N6R2/SGB1
	t5NMtqgAC5sBU6zqXaxA4xoPY0b4SLIjNDmM6yp46CtZ75vs4P8t9iE=
X-Gm-Gg: AYBFou3ZvMK10nCyARST3DKueDmQl2r7MBt2xW0Y3Ti05qfCffowZXKHCTQ+iWI59NI
	fRuGj8GuF8Ft5skdXEKdQEPXj3Fmlb2lmkeXKd51e/Do4n68zyg16beA7WRreW+jBvwSlowT7o9
	pZp35WEkhXd86vCAqMIGz6V5Gvfwbq87IeKLIVDn9Ur5bHBS232aMNlBqmqHpZP2MCqDMJGfRda
	qvFASD/AwqER9ldVU6RaADV61BEHrr6EW7pDhsU8lL56u0MQKR3D3voZioVV253V05x6fgUBlBk
	KN6tOR1Xp8Bgqwkfn3E2hxvi/n3/m7DjK+cEqRrZNU2k9MwbCLs73VEwu831AUk9xbGvBeCKmb2
	utb9SJbOgCPEgYf8w2yfiK2rYLQOvnHxAeG8iAsIUXvj1eT8uybc/oo6mf8huKr2DTwKuVLtpqj
	R+0ZJUIflG1jqxzaESQzNUTr4d9aM9/EE3HrdNB0cZnaibEFsiIA==
X-Received: by 2002:a05:651c:30c9:b0:3a1:ab57:ea2c with SMTP id 38308e7fff4ca-3a33948c4e0mr10050771fa.2.1788212866759;
        Mon, 31 Aug 2026 14:47:46 -0700 (PDT)
Received: from fedora ([92.36.9.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31550cefbsm18299201fa.9.2026.08.31.14.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:47:46 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net v2 3/3] net: airoha: grow the small RX rings
Date: Tue,  1 Sep 2026 00:47:01 +0100
Message-ID: <20260831234701.206021-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831234701.206021-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
 <20260831234701.206021-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_144748_970831_8B79EFB4 
X-CRM114-Status: GOOD (  13.07  )
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

Raise the RX_DSCP_NUM() fallback from 16 to 32, the vendor SDK default,
and give ring 4 the 128 descriptors already used for rings 2/11/15.

Ring 4 is the shared "force to CPU" ring that airoha_fe_vip_setup()
routes BOOTP, PPPoE Discovery, PPP LCP/IPCP/CHAP/PAP/IPv6CP, ISAKMP,
DHCPv6, SIP and LLDP onto, so it sees the same bursty non-hashed traffic
as the rings already on 128 while sitting on the smallest allowance.

At 16 descriptors the completion stall handled by the previous patch is
readily reachable: on a Nokia XG-040G-MF the recovery fires roughly every
35 s under repeated PPPoE dial-up, and negotiation never completes. At
128 it did not trigger once across 500 forced PPPoE reconnects over 20 h.

Ring 4 and the VIP classification feeding it are shared driver-wide, with
no DT or hardware property distinguishing one variant's ring 4 from
another's, so this is not scoped to a particular SoC.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index c195dad5ed58..0b7c90940272 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -41,9 +41,10 @@
 #define TX_DSCP_NUM			1024
 #define RX_DSCP_NUM(_n)			\
 	((_n) ==  2 ? 128 :		\
+	 (_n) ==  4 ? 128 :		\
 	 (_n) == 11 ? 128 :		\
 	 (_n) == 15 ? 128 :		\
-	 (_n) ==  0 ? 1024 : 16)
+	 (_n) ==  0 ? 1024 : 32)
 
 #define PSE_RSV_PAGES			128
 #define PSE_QUEUE_RSV_PAGES		64
-- 
2.55.0


