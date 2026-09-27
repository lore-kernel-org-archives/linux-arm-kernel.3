Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F35C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOLbn1jnQFiFSgxpC+eYo1Hv38mbuS419e9eJih/QEU=; b=wba5lbLamNKyfc/8GKxEgVIFid
	nDO+x+idGPP12P3vInEqeWF3J7bqirg0in3HCZbclF2XikxqAiBTMT4mUh7lMC7t29TbHKQvSW08M
	ULSmH+kc7f0aDGB32KRAcsEFkNs0ZyOVTd3b21yrP7s6bI7AIOpPoPvZyPGJ1atKfBD5nDZ0xGAOt
	MHKh+BgnGwezqDQ1yx5m+c+3oGhprPaDuddlpam3oUeCDUp59qEVcFyR9v065sF/OFEp+XuIusF4T
	PtF7BMAQTFb80nu1VW8maXOkuNihtzuLnW7Bd/337N+fO97opyYZWPqHZzuHGfdOTu6SQnG0khZlC
	tRbIDChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqIf-0000000GTJk-38gl;
	Sun, 27 Sep 2026 14:56:21 +0000
Received: from ci-2003h-snip6-1.eps.apple.com ([2a01:b747:3005:200::4a] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqIP-0000000GTEi-0IkK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 14:56:07 +0000
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-7 (Postfix) with ESMTPS id 9E5051801066;
	Sun, 27 Sep 2026 14:55:58 +0000 (UTC)
X-ICL-RepId: 01a0e35d-9e64-7ed5-8134-ce24affd0e72
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0gZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwdSAEcITAZYBFMcQgpLBlkPRgBdTxFdDlIFRl5aFFwYQwJXAnkRUAFYHlZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790520961; x=1793112961; bh=vOLbn1jnQFiFSgxpC+eYo1Hv38mbuS419e9eJih/QEU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=ANv1yiAPeBPJCfaYHO92hiOt4pJAClDbm2J9q6ZvfnPYS3V8ACJfa8WtIlCnTuLrXzNuc1TaCGeuF3aGXBrbsfQ8suLyAo3f4DBuOdYMAh5q9s2dZT2z4BWy4sbGQF708SgCQ7+0LtlJFHp2VG3SivYPDnG1z74emQMimaJy9mo4gARtpThYc4AFHe0JNtwG7i2SFKYeZcDAudMYsMz4ZeauasIEsUN55KObLvl48SO3s+q0sUUAeD3p/a+CAAoge3GUOTyWMK0X5XmBc4K1hxLeZYI/O6QV6TMfap3RjOhczvxwPPqUfL9XidWbjtYsNSV1wjrJo2rYHZr6STb8jQ==
Received: from bigre.tail98293.ts.net (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-7 (Postfix) with ESMTPSA id 4449418002E0;
	Sun, 27 Sep 2026 14:55:57 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: sre@kernel.org
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	shawnguo@kernel.org,
	agx@sigxcpu.org,
	angus@akkea.ca,
	Vincent Cloutier <vincent@cloutier.co>
Subject: [PATCH v1 1/4] arm64: dts: imx8mq-librem5: Remove invalid monitored-battery
Date: Sun, 27 Sep 2026 10:55:35 -0400
Message-ID: <20260927145538.233548-2-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927145538.233548-1-vincent.cloutier@icloud.com>
References: <20260927145538.233548-1-vincent.cloutier@icloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=BqaQAIX5 c=1 sm=1 tr=0 ts=6ab92e80
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10
 a=5j__JWfIoqoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=_-FhWcXjAAAA:8
 a=nrsuy9JVKKtfWTm6JsgA:9 a=c3Bybt16QQbktBXcOhN1:22
X-Proofpoint-GUID: 2g6l57dVJmbFiv48J3yGrRr-y6I4hDgv
X-Proofpoint-ORIG-GUID: 2g6l57dVJmbFiv48J3yGrRr-y6I4hDgv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1OSBTYWx0ZWRfX0XdBR5pTvSU4
 3V2cXCLpxYY3sZ/iyBYKNPn5HdV2yQ/8rwlOv5kF+eDKSu+N0dnk/CfJms4vLYQzkeArLVwwtqd
 5qB40xtJwpIeqHrhPwRhBIzO59tFrV8VU6YY0JCWf/ZjDngWoaKJfd9NAcbO9ndi+rMXZN6Hfx+
 Kp5Ba5+n/3IDDhlZKG+IjzVXnxmM6leh9asmn5zlighSc/CpS6LBVSCTjpyJ8PqjDQJGNK63x7m
 dpA8PkGB27qXiHZQ4R8Bi2pfkMyRpMQX+eNYTGGuNSdQz7m5p/sn3XuU0KzcJiWswD88sG18BWv
 UWtaSwvHFR+wtO/GKgoyQLc9D/Ks5MvlWOCdTK4b+jLUTlJpQm7vSEE/GCkg+w=
X-JNJ: AAAAAAAByTRhRa0g/bAY4J12S4Su1Mvxp/farNAGbYVWFrzD9qnnEsDcpE4fik2cnApSp53QMElBBnUROAQxaO/U2airQj538zYcly7/jWcdzaZLT385KuKqy8dGEwedjsCgadEeAVv0xMibm5vKbMDICKMrVIz9gyIZPGdjiWJCDQ/AaOSFNy+PTh0dViT8MjxJAYyd7czZVMIF6qtLl1Ur+OdAFK1Hj8JMEdmtODDtFeNbgbTTGpTjQkXeOSKVPs+v6bOsxiiJJwZIvdMiyC6YmPY7RKeFZOi1B4ggz0e6T9OlfeM218qaxwAwhNfCaYAcjQV4hEe0mdINbv2hkDIPDGNKZja8vrhSrjwSTtZVb9mL4QKZK+SwhwAY+D/Szta4z2Zz8vNvQnQV6pjXNpC5ZLA67rDUlCu0wD2N6QT2li3c3Ye5F2AFkHhaaggK+U842qzM/pKdWUkCY5nKIxDFp3ubF5oyliVhUBeAG6ezkJuMTijRs5jB2HGVl2ldw61J0B5W/kkx9BI+zT4dgau49UOAHjRCWIioKfji20kPEdEWXweNkJmzQgMYR/cBWR8JqlUTPZ/xu6edTFlSkzXtg+GvWdCa/ymE+h3b21IDJOBI3V/4kgph3z85iacTEChNiygY2m6wyMxEWvxtlcebZKP+I5cwUGAlIcZUcT3jvv/OZFCPegtn/Cc+EkR9pAUgPryld4jpFF/ZJpfqB0OVOPvKh/JhVn25VoNDwUrTN01CqWWrTEynCn1D1eia3+KydbZrkJl7GpqsnMQRZOKFIcOjaFLrxKKi7Foi4zQ8PIU6qEv1javcA3ArrYttgd6QHGnTKTIKy46QYoUYT2huH0LfSDPbEoirKWW19WzZ59D6h5F/KKc5kUHkTXcRUOxnXIp7VyGKFZ7eVx6KVvgQXtMWeU0QM9wsLy47V60nvY8Yw42XAM/vuepQubQjwDg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_075605_157843_D1490682 
X-CRM114-Status: GOOD (  10.04  )
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

From: "Angus Ainslie (Purism)" <angus@akkea.ca>

The BQ25895 charger node points monitored-battery at the MAX17055 fuel
gauge. The property requires a phandle to a simple-battery node, and the
upstream BQ25890 driver does not consume battery information.

Remove the invalid relationship.

Fixes: 8f0216b006e5 ("arm64: dts: Add a device tree for the Librem 5 phone")
Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..099195279e84 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1201,7 +1201,6 @@ bq25895: charger@6a {
 		ti,minimum-sys-voltage = <3700000>; /* uV */
 		ti,boost-voltage = <5000000>; /* uV */
 		ti,boost-max-current = <1500000>; /* uA */
-		monitored-battery = <&bat>;
 		power-supplies = <&typec_pd>;
 	};
 };
-- 
2.55.0


