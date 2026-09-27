Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED9DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sWFvs9jcAbnIPCvsVLUf2FvnlKcEx51RgjL4GFBuUs=; b=A1sfMI1YRUq+cHOuiioNGd+Zw6
	NRwDA+cfXHFaoCcSdLIo7XAI+AD2MjOQ5r9YQTEypkWUvXRIlFPz+FOqVqCUVKhp21c14N80x4rJ0
	lQRSf715jZKtByUNM04YWQOZ/gtF46c44qXl4/LLq+xLMMQry5gHwBmFqO1x88I0i6W/5aTe5+Jk7
	9VWxzFAES6WWf2R1O24mpxv+aRnd/+rNzfbsnWfetriJTqWAI8BfiPSTXVDznKUysMsqnYJRUmCre
	vHZ4vMc+fXqd//VE3v7IXiUWrb0javfk4Jrurz7rEWaOToOOpq96GWVeP+pOUItiLnrL2FGm8clEP
	3UW3saag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqIf-0000000GTIy-2K5K;
	Sun, 27 Sep 2026 14:56:21 +0000
Received: from ci-2003a-snip6-8.eps.apple.com ([2a01:b747:3005:200::b] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqIO-0000000GTEm-3XjI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 14:56:06 +0000
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-7 (Postfix) with ESMTPS id 31A3718001AD;
	Sun, 27 Sep 2026 14:56:01 +0000 (UTC)
X-ICL-RepId: 01a0e35d-a860-791f-91c2-79ad026e9876
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0gZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwdSAEcITAZYBFMcQgpLBlkPRgddTxFdDlIFRl5aFFwYQwJXAnkRUAFYHlZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790520964; x=1793112964; bh=0sWFvs9jcAbnIPCvsVLUf2FvnlKcEx51RgjL4GFBuUs=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=AVdOUrsmCUVT9N5dFwppyEBCW4bQwk2ZQ4Ji7aTXAXs7fMasZbWyn/M1pnvJKKUZsSjDfuoO+H5eUo1TmkvUBmVYfzQiVIaRji3YarsIz97kPEnQ/8wh1JjioO8SOdNjDGmQSIgX1ANDGWOBTgS/v9QxZFDvWf1mUgl9uZsCsvqrwO5dYjWNcObuMm6zKDKvWc2iNkXy6Fxw6iyeV9LM34Yu6sJnIGqasl0Iht6d1JLeJhDUz71aQqn1ny0XhFaC4+lO/UDcwlno2d0mbjmX2cl0lRjDtZg3SAsDeOKmJLXFYJ6+FxC4kuF1+szUquPj29kYxzU0gMb0Qm1DLSRS6A==
Received: from bigre.tail98293.ts.net (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-7 (Postfix) with ESMTPSA id CF2771800101;
	Sun, 27 Sep 2026 14:55:59 +0000 (UTC)
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
Subject: [PATCH v1 4/4] arm64: dts: imx8mq-librem5: Set BQ25895 input voltage limit
Date: Sun, 27 Sep 2026 10:55:38 -0400
Message-ID: <20260927145538.233548-5-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927145538.233548-1-vincent.cloutier@icloud.com>
References: <20260927145538.233548-1-vincent.cloutier@icloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1OSBTYWx0ZWRfX6PGhkr9hh8BC
 MXaGaJppbOycdipEdYBv4XzULmXixLQyG5gZCwzx75IseyTUO1h8S/RF5CIXgp6qF3mh+akPNEg
 oR4xbMgkGTVqcZoDzO7yFqT2EY4yXgS4sZj1QVDjx2mb8YIXwV+P3xcDvscBP4v6GJ5WpmJDzAv
 AkDrWRZKRIb/lPax256TexayH1mrmvvtFGbwSN4+P+v5aVW+UPeh22Xne6UjJCTMx4jEg0adl5y
 JIRcd4cQGWM7N5eZ6GVwP2hJvGFDJpJn5HM3NviZvKqYPV4laTNaqywAgANmRfGCRPLEE8+N/+P
 JAM7fxUY/2rQ5s4c/f/q1uV25boL7XS8ofhWGJdRV5gNSseJ1fIcdcRm1eX6AA=
X-Proofpoint-GUID: QTEQCjd7c7jR8u7ym1r8_K71LmCWqNq6
X-Authority-Info-Out: v=2.4 cv=ZdAQ98VA c=1 sm=1 tr=0 ts=6ab92e82
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10
 a=5j__JWfIoqoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=-L4RI-O3Sy8stOntbg4A:9
X-Proofpoint-ORIG-GUID: QTEQCjd7c7jR8u7ym1r8_K71LmCWqNq6
X-JNJ: AAAAAAABrJvhxWKjcv/pct2SEpSWHTv+iUMuRRpS7G5d5dIYZCPF8+OWuYVaAWtSMFI2AZO3gEwXvSaAOEIPYaBsSPlLQAvtu0euzU2bvmYDRJwp/U1SbeuMHRcP5OKgXRJg2ra50xlG5qOxb8vyzPMIr67akLa72bb3hEXV07x+AEg8sn3Df5Qo3UqD7bVIvuWNxcFspecabJH7befI1sMKseIwq8Ucfu+CBqTfJszeUNPuJjjWolVG/N+lUvSPf4bCi2Atuztaoj46NkKnn2AOhVPAeH4FjvL8DfdenXw63KxONPHkPwq22fI8/gyWoya7rvH1tTA87Xw9Jjv2TlXOk1p5STHBOj8e6hN19AVgpegbj+Z6xSOWHrLP9L8HZc78LPDnak4JlTLDC9CHBElO5dPTxBu1Gc3dP4pncpeCL3sYj4u/X0C6IxZZvun9/ugEJhST8PwuwzbFC7GkUa0S5TlFVHpdJ1yLqobSDR5ra/UNKORAryOUDjfaXDIatxq+mu4K4TQBq+bythwxL3SYOlYrMQP511PU6z/Tey8HRiV6h/9R2HpY7SPbhilEYQVd7d0eMhkwFvNPmMYsrCfmvtVF7HBcmtkZkvGLfGyzsZ074ypLWZpZy2EBVGQwWGUfT6RMmcRd8MNN67sbK2F/t7yokihV5nR+Nrk70WiCjPQ+i3ivQVJ6DXzvmDsPV7adzhEXIy8QMwstPWab44m7h+x6w1uTLGEXo6RffdXhpacz1TuEwDXrWj1g6neb1wqGJ5BC9XntK7YGvvU9HNoxuJESibAzbxtPcGSuf9zdxvCBBuz9HkOK4dxz1ft8AceB5n88N2yHM/HkLG0qt2DeiyYt0p9qaM0Q6OiV9PxsYNhxXEU1SRaiA2ngF1ns91W3bMTIP+4sxeiahXQBu/6W5pMYctXg4RzbxOx7405z5jD/Kxm3YKoiN8n53SMxPqTrWoxbQG/uIw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_075604_940624_DC78BAB7 
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

From: Vincent Cloutier <vincent@cloutier.co>

Purism's production Librem 5 kernels used a 3.9 V absolute VINDPM
threshold for years, from the 2019 board support through the releases
preceding the March 2026 charging update. Use this established board
setting for the BQ25895 input voltage limit.

Set input-voltage-limit-microvolt to 3900000 to select absolute VINDPM
and program the 3.9 V threshold through the generic binding.

Tested on Librem 5r4: REG0D remained 0x8d across an attached boot, unplug,
and flipped replug.

Assisted-by: OpenCode:gpt-5.6-sol
Assisted-by: OpenCode:gpt-6-astra
Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 099195279e84..8badebfcdbb4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1195,6 +1195,7 @@ bq25895: charger@6a {
 		pinctrl-0 = <&pinctrl_charger_in>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		input-voltage-limit-microvolt = <3900000>;
 		ti,battery-regulation-voltage = <4208000>; /* uV */
 		ti,termination-current = <128000>;  /* uA */
 		ti,precharge-current = <128000>; /* uA */
-- 
2.55.0


