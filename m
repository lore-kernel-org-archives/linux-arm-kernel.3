Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BBB107BCEA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+F+jCt1kFDUvR8I0HYpT4eKb3S23G0GKaNUjEuSXqc=; b=Gylsu4J9cHFjiYBvPWZXgY4gRW
	OvnPhb+g/9wSCBW/xv5XeTePdcMbX0CK6YHmUebYOgou8s3+RXCcxmM5atzXS+yCDHAi8m5NgMBlQ
	RrKrHBrhKzYtckVSFjcI5ii2fnB7IeiQCBQGyKL+XOj5a07vSfWfW+6SNWkmdod7Od9WY+S8rxJZB
	5Z3bHcCglctf6a0yX5sum87QNfeWCWmoQ5p0iFFURcbekbM8lFoUqwx+j1ZApHOCK6m1+T7fqj8vK
	IaXyiDInPiFtNGiwwqYn6ZV5byBeiA/RZYtmttIPFV/b+ADVL6O+ZvzLRWw8OWCCcI3h+l03M8mIX
	zIx51eDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Aty-00000001GtA-3DS4;
	Fri, 13 Mar 2026 22:22:42 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Ato-00000001Gon-2mYx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 22:22:31 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 19ADFC0005C1;
	Fri, 13 Mar 2026 15:22:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 19ADFC0005C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773440545;
	bh=2hRxoXPHiiTTfcfjiyVMbqrDc68Jy2CknleYd+4iGqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eM65V7JU0ki++LTx2bQ5be1ZdJoScWJ8H/gtIL68opfUUG1tPQB5jrBUvcX22RiIw
	 7iNubcPOj0CjDbj8+Of8nH5eUh6Phnt5F9Pju/sbTAj04jy5b+EwyFulXoiR0mNj4O
	 PP5I/4NkzNU0fLoMH7bZNL4AtI2jj3CcBBTA4Uqg=
Received: from lvnvdb8054.lvn.broadcom.net (lvnvdb8054.lvn.broadcom.net [10.17.214.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id CA93DB7E;
	Fri, 13 Mar 2026 15:22:24 -0700 (PDT)
From: "\\Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
To: netdev@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	jitendra.vegiraju@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	richardcochran@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	rmk+kernel@armlinux.org.uk,
	rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sdf@fomichev.me,
	me@ziyao.cc,
	siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	vladimir.oltean@nxp.com,
	lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com,
	maxime.chevallier@bootlin.com,
	matthew.gerlach@altera.com,
	chenchuangyu@xiaomi.com,
	yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com,
	chenhuacai@kernel.org,
	florian.fainelli@broadcom.com,
	quic_abchauha@quicinc.com
Subject: [PATCH net-next v7 1/5] net: stmmac: Add 25GMAC core type to dwmac_core_type enum
Date: Fri, 13 Mar 2026 15:22:02 -0700
Message-ID: <20260313222206.778760-2-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.45.4
In-Reply-To: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_152228_807233_201C0121 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

The DW25GMAC is a newer ethernet MAC IP block from Synopsys that introduced
new DMA architecure called Hyper-DMA. Define a new dwmac_core_type
enum in include/linux/stmmac.h file.

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 include/linux/stmmac.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 965ada809fdf..c8535476276b 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -176,6 +176,7 @@ enum dwmac_core_type {
 	DWMAC_CORE_GMAC,
 	DWMAC_CORE_GMAC4,
 	DWMAC_CORE_XGMAC,
+	DWMAC_CORE_25GMAC,
 };
 
 #define STMMAC_FLAG_SPH_DISABLE			BIT(1)
-- 
2.34.1


