Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F6AD5CC81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aPtpCx0bE2hy6c7hMOkAIGp+0vvTAehcVRieP5LmqI8=; b=t6d5MwTtBrKpZjLoFOQtqZIKOl
	NKBcx0V4AJz1GOOYAZQykPTQDDEuBnFnj+/VKug9taydhG+3qL91KXp3BjRcgKP3N17Lc1SZiKx2Z
	nEKeoaJQX5M87GC3R2rGjIvmXqjw1Tq6GCIUCyQeZcWOowTE0CkjK1jmuStdAYxMUsjfS0qXIPfZi
	kT5rGaSDgoovEwRTKVuYjGSuxEfRfXCdSxQmk1lEMW4VBhz1jJ/RZYAWf7GntMvQIEr6K5Y9kz/lx
	r1IMzITAPbuih0ADdmeRKXql6QzuD0pZXHmaX5+Eb/Z1ErRMp3jN93cVadA67UCzHuPG1yIQqaHRa
	ZSKy39ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65UG-0000000HTb2-1enk;
	Wed, 30 Oct 2024 09:59:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65Qr-0000000HSjd-2N0G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730282165; x=1761818165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aPtpCx0bE2hy6c7hMOkAIGp+0vvTAehcVRieP5LmqI8=;
  b=Asnq4oYmdKQU9uKfAb5XxNHBWwW7zlx+DDhzK5VBuRltxek14dNUkCNI
   aduXVUo3W4XKB/krQgKQAARM/vdtjhnTUjtB2rrnXc4CuIWhn44qTOS0x
   TAG0d43AmtXo1JU1C3izPuUxDbQzpCQ2e4+f0eBF3FY/p7YOzwL0DnBZx
   miQdFbG7dtB8+gwo6huIiSys0/K3J5a7iz8m0rnQgdPApjcJhMZgGccOp
   lwc43FVwZH1ZVM5zG05g1+YzyZKK80qi2jgsa2GJEt1mMj2D9mtY+0ei6
   jVwfKBz4RQPHP+Z4p+KoRlEHDY9xD2Qo+atnSa13E1MxXw84ptFpYQooL
   g==;
X-CSE-ConnectionGUID: ++MbzpPnSeOwLv5XgpMU0Q==
X-CSE-MsgGUID: ceWgtWl6R8uurZ1eb3nwlA==
X-IronPort-AV: E=Sophos;i="6.11,244,1725314400"; 
   d="scan'208";a="39758789"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Oct 2024 10:56:03 +0100
X-CheckPoint: {672202B3-21-86C05612-CA75E1CA}
X-MAIL-CPID: F7C9B31834748EFB307F69D08630B802_1
X-Control-Analysis: str=0001.0A682F19.672202B3.00D8,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C6D2169508;
	Wed, 30 Oct 2024 10:55:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730282159; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=aPtpCx0bE2hy6c7hMOkAIGp+0vvTAehcVRieP5LmqI8=;
	b=FL+xN7uakK0lwhfmfYEmgnm79qVIEe08IZeA/9o7k4L9nOZ2LuBWdvmYIr+Pwpi3v8ZJoE
	FCpaK7pMsnfZzG2u5dr8mWtTPVyZKcVgMvSkbVdYtgt063F0PRR3lp7JjXd2n8S2zuVqu5
	jADVNxELm6HzE85MkRWcM2ftexeEltH6gSXFxHBYIJtwfoNwlRlQzKrSTbRgU5P8l7E55v
	8annQqSHQxd3sIROAwyC43tTWJL+38I5WdbHss1AwxsrFMol6+azZuwTeWmKeWGePznDYu
	vRw1cxOfO8+SXt99P0I4MXZGx+PkcJcMoEMom+1tQFfwVLQQwqq2VKWwo9Yc5Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2 resend] arm64: dts: imx95: Add missing vendor string to SCMI property
Date: Wed, 30 Oct 2024 10:55:51 +0100
Message-Id: <20241030095555.222143-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_025606_124940_DA95B953 
X-CRM114-Status: GOOD (  11.59  )
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

With commit 7bf46ec090b9e ("dt-bindings: firmware: arm,scmi: Add missing
vendor string") this property has 'arm' vendor prefix. Fix the property
name accordingly.

Fixes: 61ed94cd54e3 ("arm64: dts: imx95: set max-rx-timeout-ms")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Sorry, there was a mistake while sending the first batch, so patch 1/2
was missing.

 arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 62bb526ba507b..d10f62eacfe08 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -313,7 +313,7 @@ scmi {
 			shmem = <&scmi_buf0>, <&scmi_buf1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			max-rx-timeout-ms = <5000>;
+			arm,max-rx-timeout-ms = <5000>;
 
 			scmi_devpd: protocol@11 {
 				reg = <0x11>;
-- 
2.34.1


