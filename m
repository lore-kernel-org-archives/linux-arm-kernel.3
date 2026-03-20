Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E5E1099B40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IChQ5ujyo15x/Z76xewZNLulpuCEP/OX/j0mXf3uGI=; b=vlNoe3HLfTsxaldp9WPfXmqfwL
	LlOIusKPrn35XADXi5aCIfr4p2NsVhwp44C73SFB0sWXe4V1ubSrki3kBusC3ppgqAr6JMjc4LSN5
	Y+8yqd7u33b03PB9LAiLGQV0vX5JXcgv+vLELon1pVlA1QCIZXvPnlmO+CoK6RL4tasmzg7CqCCCt
	CFJDxxhUenpXEEL54oD2IfObrfDQWHtF1qU/7kN8vcKXx7fEX4FDaF1BvCQC4MRcTX7HQVgfPfDKB
	/tjutOJOsTM8Oz+AUfdh2Tcnw7BiHJT1otTn+tnkH1DDRegKfIiialPVhs6goOr55BI7d8aI6Lnnz
	cxBQ/ECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hG7-0000000Dbms-1jYP;
	Fri, 20 Mar 2026 21:19:55 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hG2-0000000Dbl4-2cRv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:19:51 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id BB60CC00081F;
	Fri, 20 Mar 2026 14:19:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com BB60CC00081F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774041589;
	bh=Qj0VCImCrWJnC20PW2Tcs//uU7c7cuxI1j0MHoEqggs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ArQ2Nktf3jVtIbnxmMSl9mPe+MIhMBWmUQtghIm15+GbJnJBWWDVsjEb29flyJJeN
	 ElqFmI/U0XHc3iv6h3NWiB+PzDW9aAGDy1UJINileumZHhOSJHt2WOQgFVIzOrJLzz
	 xxLgPJRFv/ebBYJQCbaA5UaIhmVUiQbXhhOPLY8A=
Received: from lvnvdb8054.lvn.broadcom.net (lvnvdb8054.lvn.broadcom.net [10.17.214.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id C6527AE81;
	Fri, 20 Mar 2026 17:19:46 -0400 (EDT)
From: "Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
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
	chenchuangyu@xiaomi.com,
	yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com,
	chenhuacai@kernel.org,
	florian.fainelli@broadcom.com,
	quic_abchauha@quicinc.com
Subject: [PATCH net-next v8 1/6] Add 25GMAC core type to dwmac_core_type enum
Date: Fri, 20 Mar 2026 14:19:16 -0700
Message-ID: <20260320211921.1202058-2-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.45.4
In-Reply-To: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
References: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_141950_732443_3D216D67 
X-CRM114-Status: UNSURE (   8.83  )
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
index 72febd246bdb..464f4f2e366a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -197,6 +197,7 @@ enum dwmac_core_type {
 	DWMAC_CORE_GMAC,
 	DWMAC_CORE_GMAC4,
 	DWMAC_CORE_XGMAC,
+	DWMAC_CORE_25GMAC,
 };
 
 #define STMMAC_FLAG_SPH_DISABLE			BIT(1)
-- 
2.34.1


