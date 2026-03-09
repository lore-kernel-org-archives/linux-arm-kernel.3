Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A875EF417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amj6Vi3JmO2oRqniQL19eS7V9c7NrB8GmPrszxzYH5Q=; b=4+1NeM44vdVmMl47i/pDxaDqdc
	NPa+u7nqJiNIQVc9CiUsL7hxFKmfhxrJhxRB18Qm/k9ahP+yZHsCXOoujvGhiwbMv0Ee/n1pMVGE7
	Kewcp0e/85rb80UIiRrs86MZXy8jctCNlWPornxYGBwGSpgMBpVn2OCKsKHhmNABY9UIz8mmTZdvy
	6+ftrN58wlGn00Rwt38/RYAN+fm30V2PitOD4yQhD/iACvttUZHK4xyJsS7VaOIbTLZlgkKPOLQbd
	opln91feZSfJhXt6DRttdNv1aAKzCorX+dTLou7T6NVuSqbYYDAzgqguBe0jHaovQJUst9XuBeSlE
	VnRIUfzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQH-00000007ghN-1xKV;
	Mon, 09 Mar 2026 16:25:37 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQE-00000007gg6-3VXX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:25:36 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-358ed696623so4926087a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773073534; x=1773678334; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amj6Vi3JmO2oRqniQL19eS7V9c7NrB8GmPrszxzYH5Q=;
        b=az/U2XrRGgiTUT7cAabe1gZtLI69HeWJk6vqXb3RFbfCj4OviyhsGjMytlSg8owf/7
         TXV80npcyaXVfN+eLNppCvBb6paiwyEP8QYfwr9kUNkvy76btMy2MZnFIuIMwl0Urt4k
         mROm1O2GLjtGHsJd5UQj/jeQFR7k9GssRbrvAWIrEmahxy41FGyh6D2KQ8UdpXwdoZyw
         CT40gkcVts4t99IEUSqneyY2D2Zp4xA5yFnQalBm4aaAE+778CojJyG5Mro2EQWzczMg
         Lq/uWOzQbPR44Pm1btDzgBTSSfesEL8/Yik2olkdAiRIDHnPXXsWSQN7N/FLsLeffNXf
         LLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073534; x=1773678334;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amj6Vi3JmO2oRqniQL19eS7V9c7NrB8GmPrszxzYH5Q=;
        b=I9FOXBMVXwW3I9x4ISiwSmOdE7+2gsuDtay48KKLAoXpTIVv8v7IRVmNQnnzrc+kuH
         VgawCPz76jo7gMAhvNdvg1btPqkBLxNwAwxXNBVxmedO7meLp2wD50MFnuiawj0UQ1c7
         G5k1Pdhe2eUbuG8FmooI2PR1K+zhmJndx8zuMpZVSFGCnE7e9sMJ0/pDp+5EB2oPk4sn
         CkkX4+gPMH/CfqK0PCZwkrnxNbuFfscgNqvcXpFnL+0KwbnXD6zRKzdww6aACAq+IQoJ
         uXfpfsDXsr9SWBxWxzQgVOAEsI7mOcMdA/gTc7Q4GMH7pUiQLIn/sPlC49LqgvlDMoA9
         E4KA==
X-Forwarded-Encrypted: i=1; AJvYcCUaqgo7iBX6gPFqo8KeY0RpHCosFeSdjwORK6L6tqb2SOiViyNQx6Jrv8V+pCQBqEQhSdroLVZamxpbVyI42NsQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4cL5v++GNZtOPjaiyLvdL498H4dKUP96MQI1ImxSMINvO+4ue
	UUi+Z2MYHUp44clIuaZivclXkFjXs81/EE7bWCIUYIz6/B3T+B5HPefR
X-Gm-Gg: ATEYQzyVdexUUG8/x9E5G+omcOh/0VVJSB1/x493NeFlTjmfMXdPqY8euimwbfUeGTj
	+hydSi6nlrM3kaQIP+aiZYGB2sAFs8nAyRaW+I1dfPiIhaZLTPkjiZHEFfXahp6i+6JFOLX/Sq0
	3kcQy8ufM8cAS1YsszQQ2GAbmO16lGwrYae+e0v9upUQzY+hva04I9BcSHZoGZ0TI86Zf0zodH3
	W4QgGDEiA0UEY6II2wv5MGnd1FBg4Tc2tDzhSiJpTyyfbBmG1LpcMDGQF1gXHHP/nlowVBNEAjT
	+oSjtfYBzs1jz2Jpcq5HWWFWcQ7agL261lo2w5GO1x9PV7LI3OECfHeavMqC44zn4hwmP7Ol9MC
	JVgNy9VQ6tUyE8dvVSArz+VKfjizo8FEE1RSy1mv1YH8kcpE11QCytEsPMWGN2+TEChr+bzvStc
	CDKfka7xDT3OT6HFKaXHFuL5ezGjgQX66pnuFT
X-Received: by 2002:a17:90b:184c:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-359be2bfbfdmr10994814a91.12.1773073533488;
        Mon, 09 Mar 2026 09:25:33 -0700 (PDT)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:a816:d74a:dc19:1ab8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f05ee51csm93198a91.1.2026.03.09.09.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:25:33 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 10 Mar 2026 00:25:30 +0800
Subject: [PATCH] soc: fsl: qe_ports_ic: Add missing cleanup on device
 removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qe_ports_ic-v1-1-608293026561@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHn0rmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MD3cLU+IL8opLi+Mxk3eREk2RLi6QUw2STNCWgjoKi1LTMCrBp0bG
 1tQBw1Lw+XQAAAA==
X-Change-ID: 20260310-qe_ports_ic-ca4c98bd1c4f
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773073531; l=2073;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=f/RO7d/NYBpPJNaikZKFHoe0PWI37oNS5SAvFGmT8u8=;
 b=rQOMzyC4PngOHoIqO/7Df48MEyWpk4Oq7n+UJMoMvx/yCaEy1QVE4QxtLf/8M0dTWTRlNeTre
 OBK6HibNoz9BSdq5rxEWpjidNyO7PJHufEyodw+dTqpnS22U+VATvl+
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_092534_886824_2A92D4CC 
X-CRM114-Status: GOOD (  15.91  )
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

Add a devm action handler to properly clean up the irq_domain and
chained handler when the device is removed.

Fixes: f0bcd784e1b7 ("soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 8e2107e2cde5..5e3fae19f314 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -17,6 +17,7 @@
 struct qepic_data {
 	void __iomem *reg;
 	struct irq_domain *host;
+	int irq;
 };
 
 static void qepic_mask(struct irq_data *d)
@@ -92,11 +93,18 @@ static const struct irq_domain_ops qepic_host_ops = {
 	.map = qepic_host_map,
 };
 
+static void qepic_remove(void *res)
+{
+	struct qepic_data *data = res;
+
+	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
+	irq_domain_remove(data->host);
+}
+
 static int qepic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qepic_data *data;
-	int irq;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -106,17 +114,18 @@ static int qepic_probe(struct platform_device *pdev)
 	if (IS_ERR(data->reg))
 		return PTR_ERR(data->reg);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	data->irq = platform_get_irq(pdev, 0);
+	if (data->irq < 0)
+		return data->irq;
 
 	data->host = irq_domain_add_linear(dev->of_node, 32, &qepic_host_ops, data);
 	if (!data->host)
 		return -ENODEV;
 
-	irq_set_chained_handler_and_data(irq, qepic_cascade, data);
+	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
+
+	return devm_add_action_or_reset(dev, qepic_remove, data);
 
-	return 0;
 }
 
 static const struct of_device_id qepic_match[] = {

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260310-qe_ports_ic-ca4c98bd1c4f

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


