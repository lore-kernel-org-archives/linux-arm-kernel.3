Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51A7C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KnO3es45UTLkftum7NUaaMCWaK1KKXAtuBnraxJuJY=; b=pS3ygX71WghLtHQlm6n7cL2tYs
	XJc+lNwGydSP2awLWHjdboECBWycai9ObV1xm4AlNfvfLE3EVZWAPXKLO9lNdc5KofNBqIH527hly
	Upy5tukaollD7YQA2XhBwcbr5rr4ABOHFFifj/tgLrSvFl4HT1H5TPFVoDkmQTXZq06gf29dhrDvR
	nfjJaXa5q6hnkhgxsknpQKcHqPZg9jWdbRmCqhMCdXDkcoT2R4KJTJU8kUrArHedX91KRdAQHRujW
	l1n7gdcFiFZHd5/lEDOBddcR66y51WanvTsRm860bHSObvIIu7UMsS9XpeLGN3j9DlAdy+s7W5Nby
	qZzvfzzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZ5-00000001eCZ-1pXF;
	Mon, 07 Apr 2025 18:51:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ptT-00000001Jmb-310L
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 17:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6KnO3es45UTLkftum7NUaaMCWaK1KKXAtuBnraxJuJY=; b=P/QtKNTuVIbthq6K9XVPGDxwNu
	KvLAvVCEDUbuM+A4AnueAXGDkqx8G4EsMfyw4vK3szuLYBrKWXRJFDNAjBWllb1rEZVEAkNP4gbxW
	S/+pJcmsnMu/urEVKmEgtcQlXgUGryLtaExaaS5BIkdsO1BFEA1fwDqGjIRP9tc8gjZZsKawe+/ko
	NMRp/V9sn/dAhzdAIf4GLGdParb4yF5Gm4/V9dN4DsayTjVZuXQTOH71J9TF3oVEr77nTPNW3RYxX
	i4T08LX1oRs60IhTgQ77O9LWZxgYzBm5YXKPUbkYfWuOafWyvgdkT4d4a/yDtfTVwg0sWvGFXk7Du
	yhuag67w==;
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ptQ-0000000852O-3hLJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:04:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E38D9444D7;
	Mon,  7 Apr 2025 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744045453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KnO3es45UTLkftum7NUaaMCWaK1KKXAtuBnraxJuJY=;
	b=PLcj/GgInpfzrX5Zzqtqa8joMUfDBp3WDL74t0nbyUARrE6bl6IKviOmfgf7HwY2Mcs4m8
	QH0QF6gll11QPKVRSFYoRiLqk5QTR/g10yMjEid+s1/quX9zicutv+a9Qoc9M35HCvcVkq
	c6HXXEZ3O5Ji4GKGJDdxt+m+Ua7HbfD4ibHqsMxHji1hricm+0YsjbSW8vZLV9ynAKRcUP
	DRwqSV+GbmTErZwLHUwc/6iDyVjiZmAcurV2EKjbawYyWgG5oRRJ8ATYLpk4o0sZ9PVeZt
	ILe5OSVtpZVD6Vl2B2Iv617MKE7s3Znp8vuYo555o8b4+1HHjlnBIA3kzBcuQg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 07 Apr 2025 19:03:25 +0200
Subject: [PATCH 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
In-Reply-To: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvr
 ggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_180417_027575_FCCEAAD1 
X-CRM114-Status: UNSURE (   7.90  )
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

Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
watchdog block.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
index 8b7aa922249b..1d9f15ec6657 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - fsl,imx8dxl-sc-wdt
+          - fsl,imx8qm-sc-wdt
           - fsl,imx8qxp-sc-wdt
       - const: fsl,imx-sc-wdt
 

-- 
2.39.5


