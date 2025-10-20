Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A73CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8gJn2OUvcIkPy6QCSqdpnGjV/FPP6FYgGsXIHiCIgns=; b=J3Q72Gb1pUaPx8Z1/q/OTmSxIR
	HwNpA/znOQSVLU3wq/4kSKAHI7Dn6k45tJSEwWm2h1sLIsDGGn/MKr6y5AAyYaU/9dkOxD2Jzt+nD
	MrZ/1Ta4pMCsIvC1vMy+P3K8z5DSxiRQmRXZt6OLVH+tgajax89wYR3KAgAWVbpmeXaxcwiHVw2s/
	hux6hR5odAmDksk9Lzahln7fXBtO53ceXZNA6HMT5heAdHuofFgGDnCZRtpS38sNUXWQL3yNTN2T8
	xbPj3Sx2zwjmGdoyN6qaLBdtbttbFgv4sVZ5H5Hr/wfT5GbMBLZHWiSj6yr30UeGclW1ZdNwou17i
	zyn8DXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqTr-0000000DtB7-0xOk;
	Mon, 20 Oct 2025 14:03:23 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqTo-0000000Dt9v-2kxW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760968982; x=1761573782; i=markus.elfring@web.de;
	bh=8gJn2OUvcIkPy6QCSqdpnGjV/FPP6FYgGsXIHiCIgns=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=h1PvOpunp5HksT50QboXl7//gpScppJckiK4FOx7G2VDF4FQKfXyi3EM0rRj8ka1
	 LVdemtaZTVgQhKyiJwstRCwuCZsb5/WbmbJeWN+H8MNxk7d0kQdjblcASg0C4CwRq
	 o9fpiuoyykvdmJlPfyIgbOyLioK9E6y+zwa+FRmAeLnq/hu0j5c19RDxtt2//bTCA
	 L3T1Ewkx4hJApLD1fLvB6Xjpx+sJzPnt9LfaBLPjJekzPyeUskag0dl90OcyJ6ZoH
	 LzrXqpDgYEBbOR17dVTHH2shf1xcCF1pQe7z8QFwrd7xtxswa97XT6eFtCeoKGCi9
	 0ONWBXLn2Qz8ueOJQA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.235]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1uRvPt3BZM-00cfOm; Mon, 20
 Oct 2025 16:03:01 +0200
Message-ID: <71f7daa3-d4f4-4753-aae8-67040fc8297d@web.de>
Date: Mon, 20 Oct 2025 16:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Byungchul Park <byungchul@sk.com>,
 "David S. Miller" <davem@davemloft.net>, Diogo Ivo <diogo.ivo@siemens.com>,
 Eric Dumazet <edumazet@google.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Himanshu Mittal <h-mittal1@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 MD Danish Anwar <danishanwar@ti.com>, Meghana Malladi <m-malladi@ti.com>,
 Paolo Abeni <pabeni@redhat.com>, Ravi Gunasekaran <r-gunasekaran@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Simon Horman <horms@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH net-next] net: ti: icssg-prueth: Omit a variable reassignment
 in prueth_netdev_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WT/cfCHxI+zlN2LtSHpfmcDwFenjFLUzvYKS7OIftCBe1WpB3pQ
 KB6688YUKoHg5UVzg8BbNE739r1A4ZbMZf6SkCf+w3GGxdshBR0eMNp6mNDiQoEbTF7jn3O
 0Tb4LcRHASjI2lQg+JamLiph/qunvjgaQAT2YQ1fzgpEzRwsaJf4o3QYaKDqDdAx0WK7BUX
 Q0+X1sWecfVYzc6nf63HQ==
UI-OutboundReport: notjunk:1;M01:P0:supwJH4Iip8=;jWX/no7EhjVDIe9LF1lBhryCbMs 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 G9l5A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_070320_975908_0BC5CB80 
X-CRM114-Status: GOOD (  10.72  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Oct 2025 15:46:11 +0200

An error code was assigned to a variable and checked accordingly.
This value was passed to a dev_err_probe() call in an if branch.
This function is documented in the way that the same value is returned.
Thus delete two redundant variable reassignments.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/ethernet/ti/icssg/icssg_prueth.c     | 3 +--
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/et=
hernet/ti/icssg/icssg_prueth.c
index e42d0fdefee1..0bfd761bffc5 100644
=2D-- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1248,8 +1248,7 @@ static int prueth_netdev_init(struct prueth *prueth,
 	} else if (of_phy_is_fixed_link(eth_node)) {
 		ret =3D of_phy_register_fixed_link(eth_node);
 		if (ret) {
-			ret =3D dev_err_probe(prueth->dev, ret,
-					    "failed to register fixed-link phy\n");
+			dev_err_probe(prueth->dev, ret, "failed to register fixed-link phy\n")=
;
 			goto free;
 		}
=20
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/ne=
t/ethernet/ti/icssg/icssg_prueth_sr1.c
index 5e225310c9de..bd88877e8e65 100644
=2D-- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -816,8 +816,7 @@ static int prueth_netdev_init(struct prueth *prueth,
 	} else if (of_phy_is_fixed_link(eth_node)) {
 		ret =3D of_phy_register_fixed_link(eth_node);
 		if (ret) {
-			ret =3D dev_err_probe(prueth->dev, ret,
-					    "failed to register fixed-link phy\n");
+			dev_err_probe(prueth->dev, ret, "failed to register fixed-link phy\n")=
;
 			goto free;
 		}
=20
=2D-=20
2.51.1


