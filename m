Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4691125854
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4c9O2cAKMzdhEw8waFKH8CurVd4+UFa/RS9fIQimTs=; b=C27oGa6+tyDX/c5ak9k0EcqRPj
	LQ8KfSGyDh2e6LxekmNCSPzsc2+wP2BWGFUQOaN9tRYvpu/duQzToFo0O+eUZUgMosIvPPYTKMpjR
	ni13u36sYeawV0plPSNkX+kAaLBobgUaMC3+mfBat0v5Zw+RyhRAPTwKWxK+HJq0lQeWdSDA191nP
	p0Po39i4eCIyxi+xRjkW8SBLeG9dApFk6sDGBXvVRAyP5Tw6wXCUK1QiwWZCcCA+LJvsk5LB+92c5
	h70ozceffi5DYMjZXeLPR8TcQg25JIenlYKG4zj/vCW35h0Hsgl+INb98+jgaIMiU6VcyY3Dt+t0/
	6Nkd3+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MJ3-0000000Bucq-0Lvj;
	Wed, 11 Mar 2026 16:21:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MIy-0000000BuWv-36qT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:21:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48541edecf9so318115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773246063; x=1773850863; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4c9O2cAKMzdhEw8waFKH8CurVd4+UFa/RS9fIQimTs=;
        b=WEMKI+KbIbq475qu4nq8TEY68GOo5qgdYe3fcTD1iWqiN/4QuGfP3uE6q5pVff3RY+
         z/paFqQ0YGnOnXXssEoYbvNWhf5OEt/svsi2OJtFUC3cJDW4/Ssv/Pbd9d3gdvcbAM3a
         rhnGD1f2TV0+EytEiHiaXAIebb4A3fZfwhBciNrQeI2kDGjganAN16fzM6P9DOZAGaEf
         ytCV5vEnOHNap9GrBtfv03jOfFcHvY4Sf//xiLxZaKait3RAbO+zntSKDetNojw1o2aP
         hnq+OUWea7hKfIHlKAWNsgwo4/Av5CvowYhhFCzUG8y1OERVfTyKL6tDnTADpmSqY1Ab
         LC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773246063; x=1773850863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f4c9O2cAKMzdhEw8waFKH8CurVd4+UFa/RS9fIQimTs=;
        b=MvQtZPWX9OFitEqkzO/t6yFgk2VS+fZZ9TfJTa45MfJrvyGgOHGV3J9tYW7lTb5HdP
         2YTPkeD318qFKa0M46TDliEg7r23h9af8v964BPurJosUg+Ncl98DULf/LbBs7J86jxB
         HHBJC3coUSighDZeS/i+FMselJU4yiICBv4amManUz55rQV8pxIF5ppLLo2p4OVut48S
         tf7UH+sywDuoFhpQcRg868Vf4HsOtzHQbPvsPCxSMXvM/h0R4P2z/zn14PpjFcgewpsq
         xRb+MSZJF6fT26BHaylJmdzRCELhjdXcTY4KYUVFLRzsq5o9eIByvCr61kKAtaDq/y0T
         kuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVunzqZzo+gBdJwPVyrSWb73wxbiwfxwcLvJ4acnUYAJ+Hz9U5JlPcLS23omlA5s0xVf12unQUZnV0Gvgh5LuMw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5dwhW8RCyWIerq9tiCRApNfYV8Mvmzm4x5HuKbsVfyGf70EKY
	ERTtUx5GS8NDaOABNDoXFKtQBUeEhyG1KOzfrw/OpGsrmOoP1Q+LEvQQp3Q4ColMRLSAG2zV+1P
	K8rNR
X-Gm-Gg: ATEYQzx5MtS0Ynf92yc4YvZC8cTmfSYg+TV76fy7a7lNygRHO7MbJTA0DFPsE+81+q2
	RJhSA3ShVzBszVKChncOGKKansd9PkQv4AGBmsMoPjhLdt2wJHHHStjMxqT/emNJ1X1Oa+3h7FX
	9lEHqRT7vIpxwZQVcywERHiEUuxXnz5RmKuJRH/mkEI4XaPkV3Cuc+JsRWyfU+1rZDjx4q3QOwE
	q1uXpBD0trXyYpgrn5tLD2CJqF96CwE1B3ABUTUczRGv8aUQWvquk5XoDudylS7g/IQncNavVMt
	K7LAS9F5rK4Ki6DsKLkKXrHOXj2Q8GpPLb4g6/0+DvV3eieVrHy8v0ZJYHUbVWzmx/kXAWe3uU8
	24MHfVOfM+ZxCXjkePQG31n4KjovHi+vnOX8BKMciSHPra8p+Gu58rGk2aTqkzNquIAAT1lG/92
	tfU2erv7kVOvifjGfPOsh2LtoeopgMbsRexMS+h7XXR1ufTfL9isXacgmdBiXcCvb0hlvXD+Pzo
	70RQA==
X-Received: by 2002:a05:600c:a08:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-4854b0afb48mr55832705e9.8.1773246062266;
        Wed, 11 Mar 2026 09:21:02 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm283952f8f.23.2026.03.11.09.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:21:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 20:20:46 +0400
Subject: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add support for Hynetek
 HUSB311
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-husb311-v1-3-f25bcb58cff7@flipper.net>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
In-Reply-To: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2922; i=alchark@flipper.net;
 h=from:subject:message-id; bh=HrT7kgAxAewbIt6oxfECG5Zscpfe57igzugyy1/fdnU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRunJZ8Xvo8a6G29Pt9y2ZnbMsOT3v6o1DwLpPF+qncG
 46+3fkqomMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTUMdYxYuDiFICpLhRnZDhZ2FHxqOH18XsqpruYj9qKnZDZxPzhXs1q9nXGBz4cX+7M8D/VWbL
 zVPjuF3sq27Jtrhv8nzvbSLKUeQfDyfI9OT6bb3MDAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092104_838723_F0225B63 
X-CRM114-Status: GOOD (  14.15  )
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

HUSB311 is a pin-compatible and register-compatible drop-in replacement
for RT1711H, so add its IDs to the existing driver.

Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f09-bacd-0440d2c21088.pdf
Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526.pdf
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpci_rt1711h.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 88c50b984e8a..ac5917c1e253 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -18,6 +18,9 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#define HUSB311_VID		0x2E99
+#define HUSB311_PID		0x0311
+#define HUSB311_DID		0x0000
 #define RT1711H_VID		0x29CF
 #define RT1711H_PID		0x1711
 #define RT1711H_DID		0x2171
@@ -55,6 +58,8 @@
 
 struct rt1711h_chip_info {
 	u32 rxdz_sel;
+	u16 vid;
+	u16 pid;
 	u16 did;
 	bool enable_pd30_extended_message;
 };
@@ -308,14 +313,14 @@ static int rt1711h_check_revision(struct i2c_client *i2c, struct rt1711h_chip *c
 	ret = i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
 	if (ret < 0)
 		return ret;
-	if (ret != RT1711H_VID) {
+	if (ret != chip->info->vid) {
 		dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
 		return -ENODEV;
 	}
 	ret = i2c_smbus_read_word_data(i2c, TCPC_PRODUCT_ID);
 	if (ret < 0)
 		return ret;
-	if (ret != RT1711H_PID) {
+	if (ret != chip->info->pid) {
 		dev_err(&i2c->dev, "pid is not correct, 0x%04x\n", ret);
 		return -ENODEV;
 	}
@@ -405,17 +410,28 @@ static void rt1711h_remove(struct i2c_client *client)
 	tcpci_unregister_port(chip->tcpci);
 }
 
+static const struct rt1711h_chip_info husb311 = {
+	.vid = HUSB311_VID,
+	.pid = HUSB311_PID,
+	.did = HUSB311_DID,
+};
+
 static const struct rt1711h_chip_info rt1711h = {
+	.vid = RT1711H_VID,
+	.pid = RT1711H_PID,
 	.did = RT1711H_DID,
 };
 
 static const struct rt1711h_chip_info rt1715 = {
 	.rxdz_sel = RT1711H_BMCIO_RXDZSEL,
+	.vid = RT1711H_VID,
+	.pid = RT1711H_PID,
 	.did = RT1715_DID,
 	.enable_pd30_extended_message = true,
 };
 
 static const struct i2c_device_id rt1711h_id[] = {
+	{ "husb311", (kernel_ulong_t)&husb311 },
 	{ "rt1711h", (kernel_ulong_t)&rt1711h },
 	{ "rt1715", (kernel_ulong_t)&rt1715 },
 	{}
@@ -423,6 +439,7 @@ static const struct i2c_device_id rt1711h_id[] = {
 MODULE_DEVICE_TABLE(i2c, rt1711h_id);
 
 static const struct of_device_id rt1711h_of_match[] = {
+	{ .compatible = "hynetek,husb311", .data = &husb311 },
 	{ .compatible = "richtek,rt1711h", .data = &rt1711h },
 	{ .compatible = "richtek,rt1715", .data = &rt1715 },
 	{}

-- 
2.52.0


