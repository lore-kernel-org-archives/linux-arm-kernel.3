Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E97D0C5FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+14rsoDnpAU5TPVahAWZNaZb+eP4NYQnwXlsAb9tek=; b=LWI0SA6djdh+g7NYHeI3JcDUIH
	2XKfvGJ6feHBZSCD/W6E+39/C5yYGuVSDnrC3xX6rHO/Hi0mD2ZnYBkximifI2wDiEK3X20f+l0nB
	NqkUpFNGxyANsG9DKSh5VzJ61sdgROY+1YXpUi8fUnyYDJDwmmYpshNH8/Py0KGIYocE4SoHJvmSh
	9TqDuH9AYjxpnlzbI0Ag3D2V22DizaI/22B0/NaradMq8eF810UCdQK2FYY4OMzPt4GP0qIHVOhfG
	j3wTY86/tztE2AMLfkBwqJIgdwFDixR7Nv9JYYltvIpd9Q5mn4NHaSgUyjGR924YjeYEIa+9vvv2Y
	6ph7hkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HwP-00000003Q63-2H3K;
	Fri, 25 Oct 2024 10:53:13 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HgR-00000003NPa-0ogK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1729852591; x=1730457391; i=wahrenst@gmx.net;
	bh=v+14rsoDnpAU5TPVahAWZNaZb+eP4NYQnwXlsAb9tek=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jUodZzfvzwpiKmlGXMpLSoH97D1zgHwHbx2V8+KyDn33tgz02c+gDZh99XogEztY
	 R003ScT7z/RhrGoNxalshdjIL2zs2CY3wAqrH/+Jiwz1acnDDGrf8I4QtT3If1+JY
	 HFnXWGgVZ3haIqwU51Iir/HujzNaCM1WKe/PHiBQm4UQsql6l/xjNpO3H8+UspMGe
	 sVsAtUVvhp+6T7/C8+w4rvL+Zz2xtMnxFGqQhihXbP9I+23DX3M5b5QSQ54yYZLHj
	 qQDrbp5dkgJOFcd+dpGptt+TAzm2G4Vgx5r/jICpSnFM8Fx7QX5Ti9uKXsBK3xzwt
	 vvu/r6QgH1MTSXYgIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3se8-1u3uk30fse-00rpzY; Fri, 25
 Oct 2024 12:36:31 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V5 1/9] Revert "usb: dwc2: Skip clock gating on Broadcom SoCs"
Date: Fri, 25 Oct 2024 12:36:13 +0200
Message-Id: <20241025103621.4780-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025103621.4780-1-wahrenst@gmx.net>
References: <20241025103621.4780-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LX+8Udr1Qy1uJJyzFF2uxnDdg+ofpa5QFQ9ka+i+Kss/gycsAWe
 3hnFUfPesfEL6STIaHBvghNzUsjux7yOLBTHROg5Ou6oA47ndq8Qky+rBig8N7YHkTfUD5b
 ht97F0d7YpMKBUucH+BbCv8Xd+k8hfoaESvplXfnz9l79u9VujuvFW5Dot/+++6XG2X2Eq5
 LtQGX0miVmZdeXO9OrnMw==
UI-OutboundReport: notjunk:1;M01:P0:pfc7vnUSVxM=;gwkxqYXBNhdax3MuMrQlEjY7i45
 036JJjqOSkCUD5zDxCWaErzpJxPMnT9TrHdDa+DCI53WbazV7FYrKTYkZ7oBfamflLDpRzVtK
 LfXrq06m2k9Mh5g7wy7Pf+wK5V5jpVdYzPQ99pJ/ggcMJbIZu/SNtLxEQ8WzQ/slXChQgsgQ8
 suoXbq/OmErwpOxjTC9BVMHtKTEHCmyQfzBv+YeHNn8QL8ApNjzDFipKN9WLAYvEPt4I61Edz
 so0NVLguBnfgxPy3T8a2EtTgDkqAqIu1bIS3aMAAHKpZXesnZFYTsYGUG8PGgR9fzi5X1hBFw
 3k5bvXrNqmrH2s3GO3MHwV5Orka00TmSRm7Z2ZXdwzUxG1a4dLauClNH8QsLL+yW3ZTu+9yT0
 vfgPdETTvACNeYcOiBuK06pc0LQk9nN6v7DiDYsjEqOoINjnQwpI2HF0+/AwHwgxQ8kiQTuQX
 uMEBd7g9AuRBp1gwFn7in3AIvTzSmgWgeR4kC1qjOud1oHs+OzSxPv7RFal5FTatI62jpTmWo
 VHm96VD2OkTtkrqBDHSPJ7tiU8gSjo4i34Aac0xD0GJxeFt0p3zIJM75IfwWDpKTF0K65gtB/
 xc32PBNUJQ1f9w9gnHdqTL3dihNf567SyGeMi9YHn9LRPDV6SG8ns/2c6UB5nqjuUhUk/wa0Q
 5fcbmCnAAuPmhdB4vZ2gqBS5BKNmzTKH8e3IQVrZjLykpwBrPz+xCmopalI0IHB/3h8C7bU48
 5//Rz4iFHJmAaKbdra2Gr4QJndlNqnMBbG+DoGIofgsSJnVhPegT8j2BwRXSag8r1lHdIxxVY
 O37G7ccRpwJuNiB8yGwPUeB/hGi1SDFrMsuR4boMQoSPU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_033643_583921_4D530FFA 
X-CRM114-Status: GOOD (  10.22  )
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

The commit d483f034f032 ("usb: dwc2: Skip clock gating on Broadcom SoCs")
introduced a regression on Raspberry Pi 3 B Plus, which prevents
enumeration of the onboard Microchip LAN7800 in case no external USB devic=
e
is connected during boot.

Fixes: d483f034f032 ("usb: dwc2: Skip clock gating on Broadcom SoCs")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/params.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 68226defdc60..4d73fae80b12 100644
=2D-- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -23,7 +23,6 @@ static void dwc2_set_bcm_params(struct dwc2_hsotg *hsotg=
)
 	p->max_transfer_size =3D 65535;
 	p->max_packet_count =3D 511;
 	p->ahbcfg =3D 0x10;
-	p->no_clock_gating =3D true;
 }

 static void dwc2_set_his_params(struct dwc2_hsotg *hsotg)
=2D-
2.34.1


