Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B51C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ALNYgGIU0bOwCAXhii7PEb5qykvoBzksseibl7WN1AY=; b=nMg69WXtJPAgnep0muZfEfydg+
	qmfx/qIOOGGeE+dQMKZylkGGwIelLCAsEtpu/uDnD3m6BeNpP1srDPtkfsTkdN/U9rkuuhUkAa69d
	FrkT4fDYbase5ltG0BEWg4VLEjgC2huMLZtgKlTQjg1Em3y1oV0CXYCz1UGCaMGuIfCKLwno5Zdg1
	bNcgKudY5vHGu/B3jGPCKcRmdLWn8XzSdsRYt62Zx6X5u5yEpLXGowcegUG407S98ms2OKFp18Bg8
	z63F6huLMeWRI0+eNztvQAQj3Fll5SZuP1InvwlKccHi1n7nBu7735f1ZXDKH8LVllMYvZ59mcHQA
	RJTOd6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBht-00000002iB8-2JiQ;
	Sat, 18 Jan 2025 16:29:57 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBfV-00000002hlF-1quX;
	Sat, 18 Jan 2025 16:27:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1737217633; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ccIaQsb3BHfYH+KCA7utCbjOM3Tz98o/a/P5ePWbPTKUYJnxL/efz0uCaBCQzIkZcC
    5hAWc+vo6yviwi152FdtCkT8eGWavv8ASJKdJWuHH7BZ1C6PJ6uHg3y4ocfmHttLMjR7
    k24AC6OYSJFVEkYCDD8ne4JC7MX/NWjGFMn9UMDHw8IYLI+hwb+L5oZMpghleInAnlqN
    AcybBQBV9uanqJP5Ef2Zu9hKh0rAbebNt2e+Z5XEiO7ZFjlsqQ+7VuzFivWFJaR+t/UM
    JkBCkQFloIEXmvBQScW6+vn0HXwxl3CrQ+HgzDU+6IZ044YU09Ecn1Jy3Uvgj79gyVXI
    zZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1737217633;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ALNYgGIU0bOwCAXhii7PEb5qykvoBzksseibl7WN1AY=;
    b=DiOnJ8mn6k8KA2AUCGuUZU3aaylENHT8KyyYlBc/rXcZZXfOmgAyFyl1Xd0WcswOCn
    GSD9/SyMM3l6c94FMZXtgGvJzi1iknzPHoEiZxF/Xccjv/fuRC7Crb+wo1SFqm1zcnSa
    XPH3y/wxjDVPkB3TE4DFkQMPm/BUQuaC+Wjit6XeGSMwWZZcX36Qyy0PL8tDvnoWbTH8
    4bfAeR1MrxXW8B/GJmeYNYtXnz88F7Vh0wUE1astlUDudlSoP3QSc/j2RNV3MvJQ5EP0
    8R0jXjFMHC0QX8GsFUEAmtKAlCy5mmj0133vT2WmN3/antRuuLGI1hWoSFIHWQQNnjEW
    ecTw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1737217633;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ALNYgGIU0bOwCAXhii7PEb5qykvoBzksseibl7WN1AY=;
    b=QA/hRL0xixeYf6hjHOTBhoIk6Ly16r/wMLfl4jzweimY7G5JNl5x2uRkogpAX5XBlj
    iN2f6JZOlxcqAPkxp5EgGrb3z4p/hQ4d/d0wHuyeOxaFPk3ItbF6HUPzgsAhhM+AIPYu
    ovf7WGYDH9MtPmScLZSLn89Xg/2PDc9FEK6A8QbGkZjdl3ps5tMjju/tjedP+QFV47hx
    4eEF2XdUWKtlp2kGL9VDhYw7l2GV5QuDrxSo0ENqlBethSe6r2iZMO8HagV2Mh4h5e8k
    /50W4JpEGu8RjmwE8RrI/0DLdWt6kExLCaQh5vQFIr7Y/XV2JmOu3W7lgDsvIlOZfxZJ
    2b0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1737217633;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ALNYgGIU0bOwCAXhii7PEb5qykvoBzksseibl7WN1AY=;
    b=k9A26UUi/ySHqXwC2NyrvY8uQRpI5NfZwBu7pZok74fhcY8ONDpbk+9YyyejutQTkR
    PlWMiPfAOvBd2uhi87Bg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTwZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.2.21 DYNA|AUTH)
    with ESMTPSA id Qeb5b110IGRDRLm
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 18 Jan 2025 17:27:13 +0100 (CET)
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
Subject: [PATCH v2] Revert v6.2-rc1 and later "ARM: dts: bcm2835-rpi: Use firmware clocks for display"
Date: Sat, 18 Jan 2025 17:27:07 +0100
Message-ID: <cb9e10dfb4f50207e33ddac16794ee6b806744da.1737217627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_082729_628022_0E4E8F1B 
X-CRM114-Status: UNSURE (   8.95  )
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

This reverts commit 27ab05e1b7e5c5ec9b4f658e1b2464c0908298a6.

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

Fixes: 27ab05e1b7e5 ("ARM: dts: bcm2835-rpi: Use firmware clocks for display")
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


