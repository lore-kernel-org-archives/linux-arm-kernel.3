Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99388CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/eRLZnBLK9/UFXseyxkdguOqrI0bV/Kovak2CJBkqU=; b=sESCdPROr8L/tIOndeBCe7htb5
	L6M3nJtsDnpwFqHlstLw5xv3JSLTk5AtXwuPct8GbThgQTmQQ9wcXRPu8k0iRcXDGOVCEoBFgUkVD
	TRHSQHEZlET57gy76LSVYOnTyUq9mETCw3eijx7b/LoAIhqngKGjNshD63u+xn9VaW3FJW6fjaw8C
	EnltMPsnlw6DpRW2kjfW8VV2CPOxGPtkoC+OEoHNBUXO+mbrSpZm9la7luCwj5b4sAlICb/O+tZXH
	nWxoS+Gj+mL3fFfHq1egnvXzsjnlCNxQd4NZ6qxSzUs7Vk6cVvZL9CJcQbT0wIvSSipwo0UZOqhng
	XhHBzIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDu0-00000000lyi-0MiW;
	Thu, 21 Aug 2025 22:37:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7OX-0000000HQZN-2LJl;
	Thu, 21 Aug 2025 15:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDDC641942;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A3D5C116C6;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790804;
	bh=YOUvjA7ZxBoWfbdlcJU7aVjGOvnp3BfxTVe9MsnlukQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MabXnc5ygb9IfJn05RWLX0FIUPq74OEuDXN4vXihub4HoC8xY4VcP8QsItt24FCkp
	 uQYeHV4kzjtaR3lsEmb+o1+t+LosOW4y5lbveM3GRA437n5/qUf2pFGEuPNsaV0IN8
	 tuxnWIU0MsWIPjQrXfZr7JU4v4D7YpTsPjNgUQXUeyNSjSExtQLpXgiLkbpIq78Eze
	 b6bwvEqAh9zcmK0IH6uEqQCOzQGBuc+81VKeUos0J2OQ/usJkX5pP16Vyt1UVjGCeE
	 /AKlo79zZIuh/o+4D0qQt9YFJfYVop6A4dTb86s5y1tay7nr+yoz2n813Qo/iCY7Po
	 yHJjxt75JBibA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E093CA0EEB;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:10 +0000
Subject: [PATCH RFC 18/22] usb: typec: mux: Introduce data_role to mux
 state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-18-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=JRN0Pkcv1Gw9Rq/i5eF+ACOnqAvxuHK0oC9pDd6cKvY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy233WGZb7kycy/csIv9MoWLJLr6P0mWfg/jSNDxKST
 q8L0z07SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABPZOpWRYRk3h9t/k1k257m0
 GFvPl7k9vnvu1M5pF6/eV9nQJnT2WCvD/8ItJ1ynXdys4DJ9nmP53TPh5nHccsFrAx2X+30qdlx
 8mREA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084005_711750_CCDC2277 
X-CRM114-Status: UNSURE (   8.40  )
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

From: Hector Martin <marcan@marcan.st>

Some muxes may need to know the data role that is being switched to,
such as to direct the data pins to separate host/device controllers or
configure a unified PHY correctly.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 include/linux/usb/typec_mux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index 2489a7857d8e10a73450a66ee85b5068f401f047..89b64ed081aecaa70529aaa717579c0dc7a5f961 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -45,6 +45,7 @@ void *typec_switch_get_drvdata(struct typec_switch_dev *sw);
 struct typec_mux_state {
 	struct typec_altmode *alt;
 	unsigned long mode;
+	enum typec_data_role data_role;
 	void *data;
 };
 

-- 
2.34.1



