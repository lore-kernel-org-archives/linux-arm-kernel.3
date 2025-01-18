Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7EEC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 15:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DpV0Z/Ptfym1f8BBR+xdJmVJ0zJrXdBpxO92bdBAsdE=; b=GcC0krlHqbPQSM6wmo19lzGxva
	vvC0txC/+j9O0r++I4mYfZM+TqBBTdGP98+RwqiAaedQMkm2qBozaYQArrwYDtBvxjcejBb51hd13
	WU2nknVCewgy/699LdBJDmwSY1zNGn4+9WSr7zu/H4WAwbucet6nYa3RyjVkB2YSX+xx6r7lwe0yF
	7r9AHMFg5EwOZc/BZ1FfmjB3Dd/HB1yoMcp8UOxqVA8FKrmzgob7nek2Vi2dNqmlGJpLbX2JNrb0A
	qFbjxDHD/8WyBq9prjwd04T5nBJYmOM+woVF+JMYGfIRv2kVAAR17lcpKOmkQpEMzlCXpSCI8dXlj
	0OHsKSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZB0k-00000002dOu-3T1c;
	Sat, 18 Jan 2025 15:45:22 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZAzC-00000002dH9-0JOK;
	Sat, 18 Jan 2025 15:43:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1737215000; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=H3EQAMP10XQjkBVfkZYL7ELNphlDGPqaW3lqcm5NgwE4OWzoRLk/pl5BIFarkurF9x
    8Eelk22QHG4WDM/xRmJ4e7rdLjVRyI11SQSoF2FZEeZ+vT+MLFdvQuqb+5G8YFsncoJY
    n4tUM+TP0qZcWnFkA+AnLO54zU6d6eYTs5OEEw14MCqaQFzmeadl4d5uEdsVJxFhFWd6
    smYaljqM/OjM5WdCN0azc0X61uMRjMcOIoXGVWEFQh/yVrBHZgEvzvDysoIY2qJ9jidO
    oS/xfG+AQCRBCywQdJ2tW2i6qzN9DPoJiZhGW9h2QcsOX1y8hD9ZR5CVsXrYZRh3aYTJ
    RoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1737215000;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=DpV0Z/Ptfym1f8BBR+xdJmVJ0zJrXdBpxO92bdBAsdE=;
    b=d3AuJ8azc1X/FAtrxGMqAlDYsrHyERci/l11SwS/1f72pbmgyr/2Pe/cx+eqeeGpLI
    wDnTT/rKBoOfhzHWZK0vYl/1wGFbWUjlK38H8TGqYuNPurCkcG4jk8+AAZMFhGqZnppl
    3XXTCpptLFoT2kGmAU2OBuQEm6yRf6/dyfZQ9SuUQcO8sBu/trve5OurSwO4ZnSjsXWY
    8hE63t3a0E9+sTt6bllAUGM9u8xYYOySJWyhjHjN/nm1Be3eyJ8G2bN36PKG1CswD/gu
    Ta1djeUdsFAsAuI9JOpmRPf+BgTFVzYFnuj0MZ+COa+YBxhJG3BjD2GzAV66yTGR/Lvn
    hfLg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1737215000;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=DpV0Z/Ptfym1f8BBR+xdJmVJ0zJrXdBpxO92bdBAsdE=;
    b=BG5lu52VrTrq/s8hw8VuA9TVtukTRpPh+v81Gfz8xO41C6nG+oCyHal89NeqAZ4lMI
    ZWfimDbGl+ae54J3suE9MraVMeSUDs9k+Asj2LGWOu5AkW96qyu1p0Sj1COuJZ9W1xoR
    naRCm5KJPE2suTq9vgikXIsNsC5f88YjPUL9Wu6L5iCjoayWwqUq5F35os7cfTy9QOf6
    tIm9GpxwQMQr53JXYXD50Sqgly6srLrYBQAM1LyVOp9x0WGiH9HM5e1uf5C/dq0hfINm
    eBTuC02dfrCQrsn7l4XiVKMkfCFpFgP8F+oxhZxKvLMT+ahX/9PzwT3i3hbeeb428OPm
    xiVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1737215000;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=DpV0Z/Ptfym1f8BBR+xdJmVJ0zJrXdBpxO92bdBAsdE=;
    b=MPUhhcqMoTKdX2oNBJcZLbH19/6hzS1U3w1894mfZ21FwPDkOF2e6WMqNPe9sG1oQw
    rmMBg2hpD8tvuHiSf9BQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTwZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.2.21 DYNA|AUTH)
    with ESMTPSA id Qeb5b110IFhJQlS
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 18 Jan 2025 16:43:19 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	stable@vger.kernel.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] Revert v6.2-rc1 and later "ARM: dts: bcm2835-rpi: Use firmware clocks for display"
Date: Sat, 18 Jan 2025 16:43:14 +0100
Message-ID: <7ba92b281cea785358551c8de99845c6345a2391.1737214993.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_074346_373368_8778B8D1 
X-CRM114-Status: UNSURE (   8.76  )
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

This reverts commit d02f02c28f5561cf5b2345f8b4c910bd98d18553.

I tried to upgrade a RasPi 3B+ with Waveshare 7inch HDMI LCD
from 6.1.y to 6.6.y but found that the display is broken with
this log message:

[   17.776315] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_drm_unregister [vc4])
[   17.784034] platform 3f806000.vec: deferred probe pending

Some tests revealed that while 6.1.y works, 6.2-rc1 is already broken but all
newer kernels as well. And a bisect did lead me to this patch.

I could repair several versions up to 6.13-rc7 by doing
this revert. Newer kernels have just to take care of

commit f702475b839c ("ARM: dts: bcm2835-rpi: Move duplicate firmware-clocks to bcm2835-rpi.dtsi")

but that is straightforward.

Fixes: d02f02c28f55 ("ARM: dts: bcm2835-rpi: Use firmware clocks for display")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/bcm2835-rpi-common.dtsi | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-common.dtsi b/arch/arm/boot/dts/bcm2835-rpi-common.dtsi
index 4e7b4a592da7c..8a55b6cded592 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-common.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi-common.dtsi
@@ -7,23 +7,6 @@
 
 #include <dt-bindings/power/raspberrypi-power.h>
 
-&firmware {
-	firmware_clocks: clocks {
-		compatible = "raspberrypi,firmware-clocks";
-		#clock-cells = <1>;
-	};
-};
-
-&hdmi {
-	clocks = <&firmware_clocks 9>,
-		 <&firmware_clocks 13>;
-	clock-names = "pixel", "hdmi";
-};
-
 &v3d {
 	power-domains = <&power RPI_POWER_DOMAIN_V3D>;
 };
-
-&vec {
-	clocks = <&firmware_clocks 15>;
-};
-- 
2.47.0


