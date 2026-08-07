Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACF4C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=; b=bIkpuCYHOyE0cZ6640uxl5TXJ9
	+6SN5La6M30awlI7NCvLNKhpsUomJXiIA9JC3bIztwm9/j49cD4QUO2BhDWBfsaSlHkPRRlNtqxxV
	IWJkffzYnHrslTWJEkA2Z92bSPIy7Dw2dniFBC0BkUi3+nIuLq05ZNFjjSpPPlTwwyf6lkfIePCAK
	SjjYIGyoMROO+eYD4Drlx6kkg+L1XQeDVCgX33GZxfRL1k/bB+dzyZlHq01hDw4M4xqwkkC6JutWi
	qqYErDD5MfLESesoFE+qrcr/Cq/rNifpVNbMfxZld2AqkiyKo2ZlIpWMHSKZEfU6DLt9+EgFo+lZ4
	zCEopJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGan-00000007UNl-3HpE;
	Fri, 07 Aug 2026 09:10:17 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGak-00000007UMS-2Fho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:10:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8487088510aso4555187b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093813; x=1786698613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=;
        b=k6s/LcGobHyzA/YYvqyKPlkrbGeksLNjeZE0lKAfKaA1dREu/nKwB3rFVOHAWqP0hH
         tV4GmkP+kxfpp9IbmdUa7hmHm/uXjzLvbsFQiZNKG2BHtYkciPGH4fPWm6OmrpeCtmrV
         anyEGFEpe4Nex8KEJo3+6XENWeVZVrpSYDtyADCFzOQRqc9k9cC3bSWo8yLPe00dEEF/
         sB/tcnxDflKsSi1saNVVikWky4Skw93YsCgnpccHP0Uj47TR6+uN8xyh22pc4g+7qFga
         AAw9/kcQstx08wpeiZBQSEP4jO/j6WDhFjODGXY9pVe+ACb9ETXDX2gX94n1V/bhMI88
         v67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093813; x=1786698613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=;
        b=DZPKCvAEi9hSOjh2wZRqtU2KMsOv6sIMKuiuYbRB74pDL6/7T3azAXbNns+ynqAl5B
         YOOlLdsikoSXaRWZIpyfUm5ouBf6zYPERHr9h8/vPtabOpva5aiIaYKitCr0Tf2N23Jb
         ygeQTlFXhZNr6TenyfvlNeeJ/ZKdkZZDO95dxPnmhbe5A2+LeAXf2Y1kJSODpoavTomC
         C2YWfbylag5EyTEBZ8H7VdkaStasYf60hqCO6YO2eaIosh61GLJMWs6ENDEJbGsG94pJ
         h4Yrrk5zlQ34VaVPa43whJerkJQPa4j5NgK5Mnrwo43xVV7t1cgogD/vjkwpripF9ACH
         tuJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLMxeSEvK4TUC/qgKMODqBPgQKptasYfS3QN/ufLKI/T3s9TsoFIvn44q6ZihYKxGkPmfJW3DpsXqP+XqAK0Pu@lists.infradead.org
X-Gm-Message-State: AOJu0YxyUDZr+TjElokyeMh+rOVmZOLbKC2/sVL9+marJ4G1OOzvs1UY
	dcGOSQl63RmNaHMzmUV8vYGjZZ6CCA8f9qb+3uHb2MA/4BU9u9/RPNBY
X-Gm-Gg: AR+sD13mNpwTVGJOmL5OmBDrYKaTG1grkkazVkf/2bI3NB5cvkvsttsU/vXQsTm1vaY
	crmRaodFUKwHq4ALSYzK5Q8UibiSj01Rwpfw0XGrggE0/unz/azrjdGpKtmKW6oTjk1bT3Y3eeN
	+ssAVtuBMfExJgjq2JLA0+y1S9N7rAeJFv/0kCX8D4KEgHRs4RWGWAJlZuqe0EykCt16+V/P+ff
	0VHguv7TW6Vnbu5ApcO132hMyz8zbd8G0Zv1kWFASILk58NCF3CP7IipPUS6K9O/8wSQBP5QNto
	9/EsI6F4hpqLZbn96bOj5np5pyZ2Ise141qHBN1fxOZRePVU5IvudI8AwsZcMEEB+T/EPAFnbZN
	T/as/y1FMQ3695t16dn0tMH+KKUC0v1OKA0HwJTF1pjIZ23jpEyq30anx7Exzd2hAmvzlmdpNf/
	y9yUGWOhgi5fzKOuYTbwaSsAJrO2glwpGo387BYcT+KQgpn2UlvziUN4+h+7h7rbHE4q12azN30
	h5wdtwqJP7uUXAOKWb41OxV4F56AAaw0/lsa/6beV9xfOA6dEvAfrL50sdGRUDT6iRuTPGJlr7V
	4a6PU/oOEzuJnSE=
X-Received: by 2002:a05:6a00:420e:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84f2dff7c61mr26343835b3a.9.1786093813505;
        Fri, 07 Aug 2026 02:10:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Zong Jiang <quic_zongjian@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aniket Randive <aniket.randive@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] tty: serial: imx: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:44 +0700
Message-ID: <20260807090945.41690-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_021014_575755_8E24D5FB 
X-CRM114-Status: GOOD (  12.44  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/tty/serial/imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..4224454d360e 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2463,7 +2463,11 @@ static int imx_uart_probe(struct platform_device *pdev)
 	if (rxirq < 0)
 		return rxirq;
 	txirq = platform_get_irq_optional(pdev, 1);
+	if (txirq < 0 && txirq != -ENXIO)
+		return txirq;
 	rtsirq = platform_get_irq_optional(pdev, 2);
+	if (rtsirq < 0 && rtsirq != -ENXIO)
+		return rtsirq;
 
 	sport->port.dev = &pdev->dev;
 	sport->port.mapbase = res->start;
-- 
2.43.0


