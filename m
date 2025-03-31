Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2267C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 23:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2A1KKKyyzdpcSVMQiU3dhTgCCmATcVgptXdxBkHBo5A=; b=Lsxjt1xyd4YpwX7vSaZbTCNba/
	ImoHNiNvqIvHtJvCwhpEKVBCbAWHEsXSwFV1abSNBUCgvNC/PdoFpo2cyoMPOA82YSOaGChbaFoN/
	fIl5lYe9kHM1pi3F34ksHpZg0DY8py9MtJv+vje52eXmmDCFRUZE/JgikCD+43hsLNAvOL68SU6Nj
	7OL29tmhHh3NtPjtWuS3/ADpNiV1ewCTGeiIYBAW6RcmepTQ5Cx1PUenLLPSGfrmV/CXYKqftQDTw
	/57DkncZd3diju60TqJlHMLGBiBnxdlMQ/fD02DXX/VzH9kTIESBXJDU/cHPwhR1OppMdOxc3uyDE
	kgpLakbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOB5-00000001Z8c-2WYJ;
	Mon, 31 Mar 2025 23:04:23 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO7Z-00000001YXD-21gc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 23:00:46 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so8572300a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 16:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462044; x=1744066844; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2A1KKKyyzdpcSVMQiU3dhTgCCmATcVgptXdxBkHBo5A=;
        b=c0mxnzQjuF71WSrb7OHh9f/Hf3aq9K8M8cg6fz4FbZ9n5b9fa2/Y/beLxlF9imDSmw
         mYTjfohpoY8hlFgbJRy+af6AhIoGuKDF+MOOGOVZD7uHKYYEw4wXHaN0/wRlDB/el4rl
         pNWc0fVUovd49GW7LNLwdvsx847sJhfEE+o6kHmjTL70X87svXGsAoN1bpo57bMXyJEv
         wF2eMGdPMMYGtrsTctN8p18Bq1Wpp9rat+8DVxFgJjhGSWoQsIXH3z7ISC4VpHjU69kw
         Iu4VjnwGPIBlE2Wn9H4QEsiojhqjRDnSuA51Mn9+fZtbKcK0NYzqamnz2dYZe0iupukj
         kI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462044; x=1744066844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2A1KKKyyzdpcSVMQiU3dhTgCCmATcVgptXdxBkHBo5A=;
        b=GW3n1n0Aa5zr/+kcIV2DC6L7flEfVf09TNnkF8S8IvNrTtyg+hWfPo6/vIvQRUIFxB
         PtG1W8sAm0CtnMftIz5DqAc2+FpcZUUi+rYb5/4Q/OSmm0ZijkYSzN4vD/jrvIbgo95z
         h7T0g2KOqZ/Bvh0+CEybVaLT3x6WDh6plPyDv2DPiEgkC+HLrIEKlpt6jlt/WJLMEiXC
         HmdztTnA67zSk+DfijfZKif8Ir4eRwpJpKsaXMQE6yFzRgy8/MDamCc75YSlKw1vEawH
         JPamyfc9oI7Z0dFx2ULSS4DYXiXEDB8v8iTaBLzIpdOiX+/Up1pFWtCeew2Y1l+2jmkk
         o6fw==
X-Forwarded-Encrypted: i=1; AJvYcCXFPcXFvJ14bHGhHPxxuV3fIkMdxY25KHu1u6s1Mw1JTqKO/kjXtUPcLr8+MYOY3vWurx03Ss+sHWVetgUPs6st@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0rWzyQV8YpsuJX5sBYt/wVcmZQ4caSyAOp1FlMHwKPnIcSMD2
	awOBPeS22/6ACePuK+JxbLJXF8CllUnst2QKHwhhmirmGKx/Z0lypTKz41d6CImtjC1yPKpxPR6
	Eu6k0cMZqsr4w9baMTe1FANFQ7Q==
X-Google-Smtp-Source: AGHT+IG/ebJE2gKC/wqWBycsTxmqQFxHKcT+hLYLzDS5AFcHBpCYSXiF3vCmtkgKMTAKak4Gunic/DECRCqZWeNK0w8=
X-Received: from pjbso14.prod.google.com ([2002:a17:90b:1f8e:b0:2ff:84e6:b2bd])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:e187:b0:2fe:a8b1:7d8 with SMTP id 98e67ed59e1d1-30560949dc0mr1232407a91.25.1743462044603;
 Mon, 31 Mar 2025 16:00:44 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:23 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-2-willmcvicker@google.com>
Subject: [PATCH v1 1/6] of/irq: Export of_irq_count for modules
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_160045_520433_D40407A2 
X-CRM114-Status: UNSURE (   9.62  )
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

Need to export `of_irq_count` in preparation for modularizing the Exynos
MCT driver which uses this API for setting up the timer IRQs.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..5adda1dac3cf 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -519,6 +519,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.49.0.472.ge94155a9ec-goog


