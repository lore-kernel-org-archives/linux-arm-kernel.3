Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE17C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dKrcqvuCa7hLkb9aXgavI+iHVopWZMF+9K0J+lFAun0=; b=asv+CwA5IeWE8V
	6AMw2CCCJ7F7YP8c4Y1886j3eO2zDOAysjytXG7tgSrOKJsqet0ty0vWunciH7ZJUKiI3dKUqdzef
	LWfsyuKFvj8j47AaG1MYGLwX346+4uvAEE5naUORtmMOuH9xkWM/cLDhfYkfpyp7sP03Z33gvIr6t
	23hUdTxiyKIJ1+U36THafl5GpUvoEANA4llZYGcYGepc2U2y/BxFy6mtnBogcQs3UUPQGH6n9LdZF
	WL0Hc4TaDj4FBL25nywJlT+J6xPNG0YSomi49KAchRMJL02DqqiB50dvXSFNhn2UOAxxwpsBlco/y
	t6hVWvwSaeTx0tboIvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21ah-0000000GX4Y-149n;
	Thu, 03 Sep 2026 07:10:31 +0000
Received: from hqu.edu.cn ([210.34.240.11])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21aY-0000000GWyy-2RQO;
	Thu, 03 Sep 2026 07:10:25 +0000
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gD3WtpGHZlqUQYHAA--.14782S2;
	Thu, 03 Sep 2026 15:10:00 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Subject: [PATCH 0/2] Add initial device tree support for the Xiaomi Mi Box
 4 (MDZ-21-AA), an Amlogic S905L based TV box.
Date: Thu, 03 Sep 2026 15:09:53 +0800
Message-Id: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QpAQBBA4VfRXNsaTIpXkQtrZxnlp12kNu9uc
 fnV6QTw7IQ91EkAx6d4WZeILE2gH7tlYCUmGnLMS6ywULPo9SJldmVLQiKDhJ2B2G+OrVzfq2l
 /+0NP3O/vAO77Adp5QFdtAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=5MVe7VfuMqJuWslnLm09SLHDBTAzqM14xKpvmxpGhVI=;
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmR1HDYoTl8GGOpU5d+pHiJjQZIN7zF67oQ6V/
 Sehnwk27mWJAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCapkdRwAKCRCaDXJbsSLV
 ByuJD/9UH6WkBxHivcqo6EN+k1+iGbCfi7o0sVT+QAGEhX7AlCjjg8Nsv2f/83+Q34w2WiwO45N
 +/eCuzViFmYJeJtetfScdY3m56PPy45fuGdY631ArqrnTrLE9VApXhVoGABWnBSeKrz88R3oRi4
 EZLrZ9uksOb64CNCVWYz7SHe2b+LfzDuIrsabI7H9vpkhkZT12FRSMKCDUrzDreoUL+GNRUHRef
 EdOrw6e9Cv0eiTXeB2Yoqg1u9WWYNDIY4HKo4rpCcuyu238U/CdjQdwVvisyKJJqJqpG0EBUnE4
 7H0MQy3giR1SyOw+D4PDci08MCebDd3UujD7iSfBT/zrbOLGRL2uIn6/gp16W/1T0spZsMNRTKR
 /H6ZiwKEUtELTiZnzbUyoMyej7vhInrS/qAkjTsNuHkOY254/Jn8nla/+XkDJfGMS8n54g8BmaE
 1cOzt8uicuM/NJrcb4IFI45SB4/tlXeTI4ghwBS0HG2yIzE2NWs+xlEuh/NKok7QpuweNXcj1wZ
 R0q8SetCLDu1ibOXbEVQ5QfL74wPfPwe+X5nIHRSYnHa+fyTZXxryvD9Zw0bMZ0DV1eah7XHpCs
 pHzZjxMozIwpKt5ogzqpe5lvfr8ozTN1Z059lFpLpkgaPz9XwH+xHkPZtYhM/oWQUSykEzuCa0p
 jenn5neAUUR8IHg==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID: C_Ai0gD3WtpGHZlqUQYHAA--.14782S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4UGF4UtryUJr4rWw43Awb_yoW8JFyUpF
	WxAa4rKFZxKr17K3WSqF48XrW5JaykZF4Dtry2qr12qF15Ar1ktrWa9FnxJr1fCF93ZF1U
	tFyUJr45Kr4DuF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCEwAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_001023_103685_6329187B 
X-CRM114-Status: UNSURE (   8.17  )
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

The series adds the board device tree and enables the main on-board hardware, including eMMC, RTL8723DS Wi-Fi, HDMI output, HDMI CEC, USB host, IR receiver, power LED, audio, Mali GPU and the Amlogic video decoder.

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

Also verified that the sound card and IR input device are correctly registered.

Not tested:

* CVBS / analog AV output, due to lack of compatible test equipment

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
YuChia-Kan (2):
      dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
      arm64: dts: amlogic: add Xiaomi Mi Box 4 support

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts  | 340 +++++++++++++++++++++
 3 files changed, 342 insertions(+)
---
base-commit: ae77d827fb0e6fb2faf8186f075c6c337f2dcf08
change-id: 20260903-mibox4-dt-f64044d040ad

Best regards,
--  
YuChia-Kan <raspberrykan@stu.hqu.edu.cn>


