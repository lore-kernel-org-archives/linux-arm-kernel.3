Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4733CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v18KHgchpDa59Dj+lG5xZCQYFi/MUjP6noXpqro2Smc=; b=VtE5/DZRY+Mm68hXxZoSeszec1
	MLE87c97B96Gjo3jMsU39+oJb6Rf5iDgxxDkA0/dgPIKD/8KsAxjiRJ7lCWF05/oGveW0skYKK26j
	8pHEkn9ul8E0ZQ36Ehm6Mt9LlDLl0otEmcYgJUnAGCQGImNz+qwe0GPrsNBt+R4m1nrNJi3Bz7HDH
	kThuB811y856hSp+Tluvjw7ljMiIBtoxgUs1+yGSbwQX79HwPTwApcNokbzFlzxyuoHxvFr8t6vFA
	3YN3V/aNVhMPgiQplKH7EY939r2MAaNiGjQ/ZNKRLpPTBO28LRKsi/FmPOdxakV/mxhu9e4yrgPVg
	hqeekOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Tq-00000002dsK-487J;
	Wed, 13 May 2026 13:18:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9TY-00000002daw-3tF3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:18:14 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B1D82FDE;
	Wed, 13 May 2026 15:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678283;
	bh=UiQCLW3CogQyfPKHqhuaL51eoRfncuB5Jy+dPeyp4cY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DB7zQIf/nmW5q4dAWD05vg2TAg4+8HxVgD7hH2G9Pcoz9oEr7acXJIH1mjslu2UsU
	 Fw6aRskByaqHWs14ExTEBxFnL2h858bzKVKqaU+S/z91zdCqX84R8HTtKfVWhSqQdl
	 CIwvxN6ZZFQdJY0UjyENbB5H6+qt+rydedmZEQFk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:36 +0300
Subject: [PATCH v2 14/16] arm64: dts: ti: k3-am62p-j722s-common-main: Make
 main_conf a syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-14-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=UiQCLW3CogQyfPKHqhuaL51eoRfncuB5Jy+dPeyp4cY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHoB4l1YpkguDETJu0LpPAQGFNbaYFPgpAEmz
 JrY9prgNA6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR6AQAKCRD6PaqMvJYe
 9TePD/oDcWnDUi4dpTb99mtAQMZ5Tc6yx0MIj8U9H17SDAdzND7A7oTRftjLeUecccRfHcMLdaQ
 ISIH3lDtFx3dumH4AN05Xyi8KHSSHbA7+fOBMbHkjAbNYfbIB2XcVElo3EeZlmyd+qSQdKu7EfR
 XpcvAJcsYl9N4+LwwSeBG6Z4O7FfEyzet/nVg5ahaqhxDba9jwi2L4XtiTv8QRkQu6kJOhRChaO
 Q4zYwRj0RoHbVtbx5R6vTqbME3H//Tm3VUMJAXlBLx63k3b9yKeW6T8wKkjUYzK9e/BnICyGiaF
 /jj/nwSAnw4vfSCLWGd+aYhKi7VYSBBLJdNnUGkstksZTcgFgQpw4FQSlVzEgP/J9qiEaUFRfHY
 jPBMbj2k55R8Sy10Sx0LHe9ZSuMLN7Bsq6Rns5XrKPP3AS1j5/D5AYW6kcI1XFXz3+07BMbEQP9
 VYBPxeen0geMHbSZ3E23CsO+PaDn3lIQ1/eLy6zNacypgPa+RNZV69HauCDOCXx27yNu7rSSxUq
 dvRobHIAK3fOzUEUq6DCmecxZ5kPgi6MHSvvgENSANd11Z11DJFjczjSjg5PXC9n0JFv/GtJuKU
 foBTaqnemmr7Ckd4GYRO04KGwChuvv6FuhWkRLZlYL/AfYc0/83esZEqcQOl2VECzfNuI8tE0i/
 lt5Gcs+Nhd18ZAw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061813_140867_6548F431 
X-CRM114-Status: GOOD (  10.60  )
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

Change the whole main_conf (the CTRL_MMR block) to a syscon. As the
main_conf block contains miscallaneous registers for various devices,
this way the drivers for those devices can get access to the specific
registers they need.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 0e1af2a69ca2..41067f2f1425 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -40,7 +40,7 @@ gic_its: msi-controller@1820000 {
 	};
 
 	main_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "simple-bus", "syscon";
 		reg = <0x00 0x00100000 0x00 0x20000>;
 		#address-cells = <1>;
 		#size-cells = <1>;

-- 
2.43.0


