Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4E2D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6npgSCSljI1jrpntYRig2rdWG53oGjgIHhHgeY2CZ1Y=; b=xNAwT/MqApjX8nzNniXlLgpR+G
	+hlCTGxHJLp2y4XEmLL6+dzybZYRCWdZhIQUqYtyXxWSwQBdZEgCvSjeTxtmvGdXCsS5+36alM1Ni
	VpVeeN1QoM5TVlizaEeQ28ig+IELdP11jLyS7UblfiJuREIhnmZh9vgz6tVsU62pxMCW2WptHpopt
	Ym/VxOxvIMmHTr7uYbxcLZCLNftrucdV37v6bgCaoLLZOq/jAjV3rHl8bUPGcP3RKAPxG499uBmTg
	gz/Cktff7mdT1Jt0XUZEaePiIaCe3eT5aUXv1f7bNHbTL1CXs5kq3w8Ryno5Ph0Kbjng34szHBiWZ
	BpI2zHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLx-0000000E87B-0LPP;
	Tue, 09 Dec 2025 10:53:57 +0000
Received: from mx-relay90-hz2.antispameurope.com ([94.100.136.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLr-0000000E84I-1fMo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:53:55 +0000
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6npgSCSljI1jrpntYRig2rdWG53oGjgIHhHgeY2CZ1Y=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277614;
 b=FsQxAzsxPXCN1SqeSIgELaAqnTRQvMSzggQOaXlJoy1roZOEGPUIEAltsjdCQVmv2GGd9dUH
 uuiofa+OFm3FtVbDUWwW66wv9SmlAgpElJWsZbrwwshM5h9jwDGtIr0KPMz4XjR18UCUfalejUK
 kXQcqgVLJfy4uxf7lkZdRkBUBDMZAdpKPgF5D3wIwkv0HokQjclfiqrezC/AwBFQhOUv0srkZ6S
 krPg5toip58w5hLizQUwxxJ4R0wbe2lwtAURnU+P7RFXrH+nl1lxWwszutTtFzyslvZwVUQBTu/
 WERZbLKCNfNOtQ6ShzJ13ze1phc4g3k+HikNF9j0a35Vg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277614;
 b=tPUwhI3CUIZvE1zCV/5d7NE2DclX+wg1YDAJ2OAXsjW7hdW6o7tJsUs0vTPBth3mt7bMQlsk
 Fof/YYxlnzFUPsn1olCLnq13uu6vMbyH5QxviCrEv9P9i4805tW7PmGsFKs4FXbtGbl2bkjwTs4
 dvLXOkkwD49TrhAu8r8aPkOrTy/67amjUV/cJeJEahMyVdZyuP19FCKEZ8JEIQhJYTGjdXnbzyt
 jJnHUU3JBfhP2MdUtXPlV/OzNvmhzYVODCY6t+zByWQLFin+PGEKEeRECQUyoQXIS8IlsGbso0h
 l/lcfumU/6MT4bhbfxvW8gWjaaDaEId5HUeQGaa9Q+7/Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Tue, 09 Dec 2025 11:53:34 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A89F5CC0E8A;
	Tue,  9 Dec 2025 11:53:20 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 0/8] TQMa8MPxL DT fixes
Date: Tue,  9 Dec 2025 11:53:06 +0100
Message-ID: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4dQbL93XFFzWw50
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: f63f4ee375f07f63483e39071c52d6f9
X-cloud-security: scantime:1.678
DKIM-Signature: a=rsa-sha256;
 bh=6npgSCSljI1jrpntYRig2rdWG53oGjgIHhHgeY2CZ1Y=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277614; v=1;
 b=WlkJs758amSlZSf+r8Hk44LaKxnITvZOYIR0LGAlFWlhQ9q+/dahq7fGAyEGDs0Wjm2Vkt/I
 su/fuBGcVEDXAKhzym3jGndQcjabzbR/3yQgKgFnXVG2bwi3I2m9jtbiN9iJlm0IrQNXzHyvftG
 b36BHGXNQNW/zGvqTTzDHDOkO5SpiXxeIEkQB3KRhMEb2kTQHCnX/4mhgjy0JU3sQYktMFKWmV0
 u0ekSUDgWno16qnqJeAAptEgMSRC4/JE2DsylFWyyCzIgNJPVWKcB360ls7fC4oWIAe1be2A3oM
 h1pFUki8a9axMKRlA0OHVPKByQ7F8PKzbmabZfALUILjw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_025351_919239_F5D03864 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi,

this seris includes small fixes for TQMa8MPxL both on MBa8MPxL and
MBa8MP-RAS314. The ethernet IRQ type has been changed to level-low and CEC
pad configuration has been fixed to use open-drain output.
For both boards the HDMI audio output support has been added as well as
the ENET event2 signal on MBa8MPxL, which can be enabled using
/sys/class/ptp/ptp1/period.

Best regards,
Alexander

Changes in v2:
* Collected R-b
* Fixed typos

Alexander Stein (8):
  arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
  arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
  arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
  arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
  arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out signal
  arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
  arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
  arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support

 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        | 21 ++++++++++++--
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 29 +++++++++++++++----
 2 files changed, 41 insertions(+), 9 deletions(-)

-- 
2.43.0


