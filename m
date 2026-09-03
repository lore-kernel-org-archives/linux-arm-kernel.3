Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14076C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wr/fjBFmkGiUNcHN/04HABTtx4e0N/soNsKKmlZjqps=; b=tmLcGKmzcR4LYR
	y8nADJGENkYBuObxsFHxdxS9H81b0Sz6zeNVFIq9ngU6t4OfRCCkuQwGfcrUsXWvAxTiQno3vU51N
	meiOQ9uUoJfBWchflgu52+nVMguhnTBsdHdwXt7dAHUlbos4Q9vCbekvlZUt4XtJ+9q5i6A+OsSFt
	FScSNFeY6bjpt6/Pldad0EiZsYQVLc8vAy8aauVjHHvjk8TdfMjCpFyRX0i99WzarxZe6y+GlwTdz
	+JmSncG3f29NqwSrZ99N7y1uQc7cYI9cuu32+4o0kAN4JZcZMxNLHke1nkuhqZG0+G47VI6qfHoZd
	/mnKbacOISNfJmpkg7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24X7-0000000H43D-3U4e;
	Thu, 03 Sep 2026 10:19:01 +0000
Received: from hqu.edu.cn ([210.34.240.11])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24X2-0000000H41U-4AcU;
	Thu, 03 Sep 2026 10:18:59 +0000
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gAXe9qFSZlqyEUHAA--.14896S2;
	Thu, 03 Sep 2026 18:18:47 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Subject: [PATCH v3 0/2] Add initial device tree support for the Xiaomi Mi
 Box 4 (MDZ-21-AA), an Amlogic S905L based TV box.
Date: Thu, 03 Sep 2026 18:18:44 +0800
Message-Id: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOyw6CMBBFf4V0bclQGh6u/A/jorRTqYmgfQVD+
 HdbXKrLk9xzZlbi0Bp05FisxGI0zsxTgvpQEDmK6YrUqMSEAWugh5rezTAvnCpPdcOBcwUchCJ
 p/7CozbK3zpcPuzDcUPocyIvROD/b134sVnn3qxsrClSzXlfYsU6K+uR8KMdnKFGFUk4kxyP7q
 7OsD9jK9F3LRPulb9v2Bgu5e6v4AAAA
X-Change-ID: 20260903-mibox4-dt-f64044d040ad
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=gvEjdanZCaiyNVusHMgfL+FsHqRb76jX1oJE4DHX5EQ=;
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmUmGrqmaWwoSf3aCbXHllzVTMr9rKZxKSVDCp
 jyRE3+UuA6JAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCaplJhgAKCRCaDXJbsSLV
 B8t0D/9s8RA8FZe0V/ceiRvoyobBKHJ34vwxVOsx2iqa96G/NqWyd9KoKgznf1yyLKEjrXRQ9bh
 DCKhvxCmFUBJPdkvMz2AoJ2VhGE+Nu11cb9LFuW9kenQWANyXZOVQcDdvubFH77tmyK4rK2Koyz
 +30f8yrPh6Qm+lxeFzxlECCw3XHpXdxStk9WEmZIEb6fAdlFyDCYXSuNi9x8kV3gN484hSnfj6h
 LPwyxx+BaLko7doonTer1CDaADFVIzVM3C70gV54bigpBfDqVhAWECn2dPmdFpgw4NK5oZD6+4+
 q+DDeGE8gE7ioxF2zPh7enVubwD2yd+bTyvb1x/OTu12gh4BKqWRa+4vCqQG7rtEPcUYN8rdNIi
 ymD6r3qLCd08kx7niafoYEZo86iunZT/y87ouKNDrtZDjsWDdS8Xhm2jYEBgtK9JsEpgVJvoYl8
 0FmIi9xiU5wkRA8yFMIr66ep+EO8k8KXoGEIxpOAOV1r+GGPT6GO5Lcy6zKKDwBk0xTOfggW+qk
 eg5HVbLOIURKq1K5gn/1ikA63N92nKKPxP09U7ZWa+8A5KpYQyWAZmBORKk9swUjLWnB42ZB7mA
 rLwC6tkS9zvKQGV0g8LTKj6NVQs6SjD+bP3Wv7cuYZIYwfU3z0BrX2i9Q1F/10u6A/8rmQrTbUb
 mieVnC0yqQTfDqQ==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID: C_Ai0gAXe9qFSZlqyEUHAA--.14896S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4UJrWrJr15Jw4xJw1rCrg_yoW8KF45pF
	WxuFyrKFZ3tF1Skws3J3WxuFWrXa1kAF4jyry2gw15Xr13Jw10q39YvFsavry3CF98uF17
	tFyUXr1Yqw4DC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x07bOlk3UUUUU=
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCOAAJsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_031857_523252_A00059C7 
X-CRM114-Status: GOOD (  11.46  )
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

The series adds the board device tree and enables the main on-board hardware, including eMMC, RTL8723DS Wi-Fi, HDMI output, HDMI CEC, USB host, power LED, audio, Mali GPU and the Amlogic video decoder.

Bluetooth is currently not described in the device tree. The device firmware uses the H4 UART protocol, while the current mainline RTL8723DS Bluetooth support expects H5.

Tested:

* SMP (4 CPU cores)
* 2 GiB RAM
* eMMC
* RTL8723DS Wi-Fi
* HDMI output
* HDMI CEC
* USB 2.0 host
* Power LED
* Mali GPU
* Amlogic VDEC

Also verified that the sound card is correctly registered.

Not tested:

* CVBS / analog AV output, due to lack of compatible test equipment

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
Changes in v3:
- Rename the DTS to meson-gxlx-s905l-xiaomi-mibox4.dts to follow the existing Meson DT naming convention.
- Remove the IR receiver node, as this hardware variant does not have an IR receiver.
- Link to v2: https://patch.msgid.link/20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn

Changes in v2:
- Drop the LED label and use the standard color property.
- Drop the redundant Mali GPU definition inherited from the common DTSI.
- Document the custom Mi Box 4 efuse layout.
- Link to v1: https://patch.msgid.link/20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org

---
YuChia-Kan (2):
      dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
      arm64: dts: amlogic: add Xiaomi Mi Box 4 support

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../dts/amlogic/meson-gxlx-s905l-xiaomi-mibox4.dts | 333 +++++++++++++++++++++
 3 files changed, 335 insertions(+)
---
base-commit: ae77d827fb0e6fb2faf8186f075c6c337f2dcf08
change-id: 20260903-mibox4-dt-f64044d040ad

Best regards,
--  
YuChia-Kan <raspberrykan@stu.hqu.edu.cn>


