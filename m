Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2088BC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 06:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K14gEIiwRJ26lA+Mkn6qqcGlhkPWo02FPF9k8+47c18=; b=NvV2akeXaofW9k6o/Jn37Anu7j
	b35Is7ZOKl/VE0X7wYNjXxi+t+gL0OICupms46OU++mfJPFhzlKv63Mo7JhE+ri/gtVUaipUvfBzc
	mJ4YP5ZbW6s7BS284KA0FWX56gttWBf1YYhLARKrE1yWVl7L7QHbx8buWBn/OR27eHIGz0tmF4eUM
	W2fPu5CeHFAUBkBGpgZilyzxQPheXVtpl9sf/CWoRa1lNDjUtFfdSxNWiZqyT71nofPfDu0iwBVQP
	AS/utx9Rlr4D60SmfsdbsiUPWJsDr/5i6gs50+RIUgKva6RtVfYj1No8b7DbXhisFpi2PV1smhgDi
	dE7NC7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ovz-0000000G0BE-2sR2;
	Sat, 19 Sep 2026 06:52:27 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ovr-0000000G06b-40Lx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 06:52:21 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469b35601so895476b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 23:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789800739; x=1790405539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K14gEIiwRJ26lA+Mkn6qqcGlhkPWo02FPF9k8+47c18=;
        b=CDl5udMwLzdgeJG2Y81JbhHhCBBaAfoamPXitI5IF/hS7safiQ+J8kNqUyiEPAf/GC
         kxeddRurAglI5TxAB4sQGYn2eDiEj4/sO4kxiSMORrIJb7wc3cxufnwX2vHurmrv5k1j
         oRIgVRZ+WXsiMIlmFRlcwOHrW6GNuONLfiOuomkeNlWBK8PSDhMDoWgxMSkyXgYstjRU
         0RMKGIg1IiiuWceBPnJXvdluXr5CjhMGdbzoZVRTXwBXnUtDde7MXvp5G04rIal5JkWC
         DL4R8hLUQFRyc74xFy2cwliRyTPbCeNd1xXYSJ93/lk1DGC8/IqRQnfF8YyM8BP8KWIi
         WQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789800739; x=1790405539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K14gEIiwRJ26lA+Mkn6qqcGlhkPWo02FPF9k8+47c18=;
        b=Lw69HMhnyKl76wTVym4GICe/RmG0BT9Yz+Z7FyrLF/aeNhk1LCf+RuQekw9ZSJDHZt
         4Ul4L5aSMoyC8mfzxAFQ12PCVLpX3blLodhwmRdS4zprDRxWXs6Ns3PIMOv7So4A+/sL
         WS/COd7I+AJOA0DID2LU7z5iKVWDICWnWfgt8/sb6UAtYdu1ldnxYiNhsDxIfgUFC6kx
         CBAorP+/9ey4bAfY71nnQCk2ZifILD4GQPYIEKJSHOZkGxW3bYy73SlBKUtVew1LdSyP
         mOCq54aqBuPn6HkGdfUJPsanXUE2ZTrZhDX6l+q55ipwKtktDp4GYDNv2crb/xjWup9t
         IBsA==
X-Forwarded-Encrypted: i=1; AKwUvBzT0wxnhxTEu8aPyUlQS/dtU48PQrT6voyxiFWvzo2L3zBP9ZBmBhlDXVAO8MG+bxbaorrfQiOp0hBa3ukmZCPI@lists.infradead.org
X-Gm-Message-State: AFuF++mbELmh/Lk/SMMELzDbhZwLHsPVLb5qNoyRKm3O8vDte4vkkEwR
	SU9UBli5+6BBRs32jyaUMYUveyOgKNy4NfwQXj/DVz2ChtFRNpHrxP65
X-Gm-Gg: AYBFou3L/aW+CLcpWnLLWXDZIS8KhBA89nNTfVg3draS1xfby+XruRG2f/gkE86qOQr
	bNkuxrJaa6pabPZrvFleVOyC9llqU9zBjp4O8Cuyzz4TUq0F42h27BbqD+w5loHBqXF1nKHkzdF
	iWrU9MqqG7aG8Uv01yKydjQZsAKGfh1vFp0EZOZ8vb/98qVM11YgvZ97nOMa9If6Y2FZET0rBYt
	1aBzQZJBPMv1JfyRHTmSsocG838hh/XsdQHFw4YrDFHaJe8rzHrqVurF1ZfZCy2yMm8Mh+3OBgg
	gttsTG11mFaNxw6D5UnFR57oTu0Ad7EeKv8wnXtUtAmN1JXoI0YR8U2vZBaaHwzML8e8cLfYIn2
	hCfM6elKSchuYfVTaRra+SI5ue4rAJbm9ZAalgllOYLcwz3y58u5Smhz6GC2606DrdIlmKk073+
	4vxR3qY1XQ13btwnZ0aYq0OckD2+Kv/gkZzqnxHsrpz4Dy2yB2ZRdKzIpHRtTV6gYqOI616KVzo
	ctv/I8K/sqssGOt7U2zumnASCtG7i7oVA==
X-Received: by 2002:a05:6a00:2e11:b0:878:34d7:6995 with SMTP id d2e1a72fcca58-87834d76d70mr625344b3a.37.1789800738978;
        Fri, 18 Sep 2026 23:52:18 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f5464sm678077b3a.27.2026.09.18.23.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:52:18 -0700 (PDT)
From: Tao <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: Tao <gongtao0607@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 2/2] net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583
Date: Sat, 19 Sep 2026 06:52:12 +0000
Message-ID: <20260919065214.31604-3-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919065214.31604-1-gongtao0607@gmail.com>
References: <20260919065214.31604-1-gongtao0607@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_235220_019299_50C1380A 
X-CRM114-Status: GOOD (  13.78  )
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

On MT7531 and MT7988 switches, trapped frames forwarding is directed to
CPU ports specified in the MT7531_CFC (0x04) CPU_PMAP bitmap. When support
for EN7581 was introduced, it was assumed to follow the MT7531 model.

However, on Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC alone
is not sufficient for trapped control frames (such as STP BPDUs) to exit
towards the CPU port. The switch forwarding hardware also requires the
MT7530_CPU_EN bit and MT7530_CPU_PORT field to be enabled in MT753X_MFC
(0x10). Without this, trapped frames are dropped by the switch forwarding
logic and never reach the CPU conduit.

Include ID_EN7581 and ID_AN7583 in mt753x_conduit_state_change() to set
MT7530_CPU_EN and MT7530_CPU_PORT in MT753X_MFC when the conduit becomes
operational, matching the handling for MT7530, MT7621, and EN7528.

Fixes: 2b0229f67932 ("net: dsa: mt7530: Add EN7581 support")
Signed-off-by: Tao <gongtao0607@gmail.com>
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 863f2079833f..9693a55f553e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3309,7 +3309,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
 	 * interface is up.
 	 */
 	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
-	    priv->id != ID_EN7528)
+	    priv->id != ID_EN7528 &&
+	    priv->id != ID_EN7581 && priv->id != ID_AN7583)
 		return;
 
 	mask = BIT(cpu_dp->index);
-- 
2.55.0


