Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB10C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnMEvypJ3Ha2bDjbDxvE5Gk/KNs3bBY6A7SZqpIE6fo=; b=sdW++MARQpKNC90FnvrJCYwKZO
	TVk1SStTs15bugYCtPiwKSVWUWTfQVAQDFOJM5ZP358OrQpy3gvYfUmIBUJUdDjGsT3svzZE+rApG
	UN3yhyCvpqrJ1xvY4Apa3kBf5u+7zyeofpVK+Ma06UFxwNoVtFUAeswew0Ezwh0R6XZMeZZgrccfU
	e3z4hqP4ni5jBEeDXJISC6+fK2vFPrpj4TuDjGcKwbENuhhOZNlDqD5DN7AdR7ezZdw1zQgW4VvtP
	n2/wHUZQNeJN3QWoNTxq+TkmXk27Or8+tjZbAfqDVyJAYJrNJtrm9wmlh57pE8GegZefyjbwaCti6
	1lFGKNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fsy-00000007CtO-3mS0;
	Wed, 23 Sep 2026 05:51:17 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fsq-00000007Co2-3MLf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:51:10 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469a34908so413420b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142668; x=1790747468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnMEvypJ3Ha2bDjbDxvE5Gk/KNs3bBY6A7SZqpIE6fo=;
        b=Z667LpZ2ELkQn1czkEJU/mryF0/zAbyPTYBnGZoxpHAHusBU9qb9mEZrUwKk+hnBm6
         BiO39z0qLe1ENoJnnneFdjM2xIJ+fqxsOAMBjDMH75zwCP4V00MAo3urF0RuRoRbKfYW
         DwZmDlrQ2zboEI0qMALx5IgFaAM5OLR1u8KmTjx8mKIuIif5FSpq8wc+oy0HBtguxUD9
         IWdCZF6qe9yYzroXKx3HrXqItqF4dx54WsKZLD+fc+tiNtRDtQLP14EWTic4sA/1IbCi
         oY3bgMG8C4DlgDpBivmpEOCQ5T9iQhfZpKO021g2JVa5ScfzMTUaLEKTLikd9g8oi+fn
         YbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142668; x=1790747468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YnMEvypJ3Ha2bDjbDxvE5Gk/KNs3bBY6A7SZqpIE6fo=;
        b=0VyaU8sb4bpSsjsUvBzEoroLoIRwaFtMzxl8jfZer43i5+vo5VeC47INFPvvw/14n0
         nd+ahbaLYZJ1q/sRezVFX2KYLAJkEur5bVBXyed2dJHAALvS7AWUtp/ppC8YE+uuRMux
         TskrPEUd3AdoJWX+HzmfJ4XydY8ZWuYxTAc7ek3Liidvkgv3DQAEJqaX53g5Np7FBKbQ
         B0MFGs4VZ7YHYclO+HhdObghV04y/XNRU2v1N1IcAi3sBrbIHP4ESv0uGFdgnIcDPbYu
         7u2osUxw/9oilSTw+PSEAmpWHnE8DgNoPwB1M2zRjhspTYG1DsHPPkv1gMnX1Jn5XbTj
         fKuQ==
X-Forwarded-Encrypted: i=1; AKwUvBymFwQb/WADcyUHalFmOwTMZwFMdjqKpC31RmJ1845zWdLyQhfFyFq/WA1mmlZGDAJnXFN6DO17cn2xjK6fSICk@lists.infradead.org
X-Gm-Message-State: AFuF++l0RonUtMAqpy689BHgsFfB0LlGgBRkj9eBcyvdGobrkU3Yw+nD
	Z+mfY6EHixBN6AgYf70OELRKta5Ibf2VY1/o3PVuNDLdexy+eoTrUAij
X-Gm-Gg: AYBFou2EgL9hyu5ETEajwGWtFl7hEJZnoUHxRppOZ6K2UHGtaPoRyK42nuntmHQzXHQ
	KmryWCLV90YdSFrFxEqaGD97EPhTKXMLLYUIKaKd+9aI7oq7zMOthBfwufeuDA3/YDXvmTKi//D
	IuiKv9g2nhopTB3tD6A9YN95mlefaLBzrz2RsIr5ZXHWWGhmFRnHrNnQrPFBEtqY5vZBevDPaP3
	wgZeu+HvxBgpTAihvzDuM0fQQaQKBQbMlJcpNRpA4zb4H1F8s7un8OZhlmlBQYXaDm5kAyEkgMA
	7EovRefF9jBmpQP9THGPPGzarFNel2FGUwSm5VZMaY0Joyu7xhJPmGu70nuXGqesEeR2rqlORcl
	xe7crQXDguphV1O00RUHGgEe2ULv3Zj7vMFUrNQL028jDoxgVlGCqZlFp6dTu2jpGqkKvy87Cmc
	bkMLtXv4QhMQ47bHPDxLVdbKrRl0Q1wId1U3UPxx7doioe1Krv22spcfmMIV2/1WBmqDLgtkS+n
	FlRHuIahtVKnpku0QRTB97QiWiWIVXVIKI+aEUn9JjC
X-Received: by 2002:a05:6a20:c78e:b0:3dd:a007:cb2b with SMTP id adf61e73a8af0-3ddf8260c2bmr1610115637.39.1790142667977;
        Tue, 22 Sep 2026 22:51:07 -0700 (PDT)
Received: from abs.sf.dndws.com ([50.35.86.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dffd6ddsm691486b3a.48.2026.09.22.22.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:51:07 -0700 (PDT)
From: Tao Gong <gongtao0607@gmail.com>
To: netdev@vger.kernel.org
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tao Gong <gongtao0607@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v2 2/2] net: dsa: mt7530: trap frames to conduit in MFC on EN7581 and AN7583
Date: Wed, 23 Sep 2026 05:51:03 +0000
Message-ID: <20260923055103.949540-3-gongtao0607@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923055103.949540-1-gongtao0607@gmail.com>
References: <20260923055103.949540-1-gongtao0607@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_225108_899781_6360C775 
X-CRM114-Status: GOOD (  13.53  )
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
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Tao Gong <gongtao0607@gmail.com>
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 20bb07fac0f7..92b5e949ffab 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3338,7 +3338,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
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


