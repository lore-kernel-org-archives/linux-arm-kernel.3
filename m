Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115C3ECD6E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdmckHOXykZv4Q2iSO3Y/ko+Sekk6KZzLLdXZC1M56k=; b=TXlzuLUoBAyD36bYAOsSwTqiLl
	kEapk3nEl2b5hVM+1t10aGbAeZd1GWYM1adCug2QkCkF0bdxz/SayUBjOvziB3f6eyZyje0GSfdcE
	6tdlL540XpyQKiQBeA2sSGFt1AXZS0J4SaoRBa1G5RYNJgVMtubLCDZZp+i0RYX5d0+v1CQ1vh6P5
	clHZhtq/GYN2+bhO2TgVogQRDoQO/2EstQ4R09TRZtW2KnWxjMkAVCT4R5yVcdE0P1GGvvwZu9G+y
	9drGw+pOZnsuIy6LOhU4LUsVQsQXQv2H/v66ScY7VeC+9ir91xyok8wF9Q4zKrYk87ahgFhMtpjvP
	l5ZaugRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFY1-00000000xj5-00pZ;
	Wed, 11 Feb 2026 19:06:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXq-00000000xZq-3rDK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4359249bbacso896277f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836797; x=1771441597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdmckHOXykZv4Q2iSO3Y/ko+Sekk6KZzLLdXZC1M56k=;
        b=YJD8WrS9qCzqkdIWVH0KyGSjBj7g+u+1YxoomuLOHlWKDvB4KSvuUX5A6VAryL47uK
         jMujZnvK+I6qO2taKUTRHexjg+wE5FJDbjkHET8iOeHuzurxtR6nKGon7ML0JjlLMTVE
         nhz/0sVDEyc0NsdDvBWyMBbMbRUd6ksff/nrGOZZnYfjjH6mgO2IyMTv65fuTHnHAgZ0
         YN3/QxVUi5FDgD5KHXT3PqSHAMtmQuYUAWtAMe9tkAOSCWhwqsTByLwwnGtAuyYWyacU
         wTZMliY7Nl5kNUWptAjwoLqxQmOmEoWXXSZ78Ino6pL8SMSA0yQCwNwR/sK9jlwLR/z+
         BZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836797; x=1771441597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hdmckHOXykZv4Q2iSO3Y/ko+Sekk6KZzLLdXZC1M56k=;
        b=QFNR5tYoYbqo/BDdXj0kHXGQGzZPkplr+gajIgyv9PiAky/mJyEvJ3HxvCjDKG0sqd
         hfs5+jt+t6oc5gYgh2n2u0TEpLjdtxRk8FPA1Utv+yZxqUZdV6cKXCjVogvyNTXqOMyW
         kSiIBOqyB4l0oyyhtdMZGhdpfscAY/IkelQvg0hBExvJQXKHgt19LDlHsTEeOF2aLlag
         RJg0tATGm2HGiCo4MyY3jTIjefhyeq1bRMG9Vhk++Kfa+EIIJh2zy//Ctn+BfnBaQQmW
         7AiYC3CwXVUrTE1YxmdfYOyO+QWa7cauzbyVcf4UIx0dKEqzyjfyNeIirrRhB3c8RDmP
         5Ulw==
X-Forwarded-Encrypted: i=1; AJvYcCW9OYP2xdbpvbiR3lo9Ziig/h4kBUCsjpL97ppfYhjiF1Pwg1ZPGzzv1yi6foxv4V9oNqTbFWIoI2y4dZLbG7gp@lists.infradead.org
X-Gm-Message-State: AOJu0YzAG3KibHxthtg9LY9dWt5nuoYB/YDEyRcUUizcL0t4L8ffneXU
	4HikCR9H9aH3jN7eGxC31E2WfTeZq4bl4oVlg/GjRRRrBnycF87gSA6K
X-Gm-Gg: AZuq6aIPBIsicfTQdoBk1HPUf/OsgG6jZSfkzgvCDtEscLoG9Qp/QTuq00v4OUYOuVz
	b4DMacyqNt7tv1pREUdUb5edPISADN9T3ZtosLwSgODSw/K/z3mlarkntFhr4y4mwq/xkaxLV5o
	SONy5I1RivzyKkmCqdgTl1pl4Vt8kH4L9trxUiDJG0tqC5udkhL25/2+5fDgPT9NDizQLgfwkor
	+Geik53iqeo16H1J2kckbN0959z6ludOLDtKS02q+H/sUNr1NVMJR+ujooZwzmUuHuZbRp/sXXi
	SYAFo4GPtfPDUsRbxuCF6yP3xKNzSOmWKFmA3WjftucHiWmVTE2BAxnA3rKHcHNhMn0k83vzehF
	pbC+ICcQi126JMNRSiRo8kc5yQpi4X9HnMLuhrDi9eeN0lPDB3t5C3mZTZdRaYHaqJg9gmoSWgN
	9tQvuV4RRVQf98/1dNDmo=
X-Received: by 2002:a5d:5d0d:0:b0:437:722d:5c66 with SMTP id ffacd0b85a97d-43779ead6acmr12591005f8f.16.1770836796836;
        Wed, 11 Feb 2026 11:06:36 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:36 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] arm64: dts: mt8167: Add additional mmsys reset bits
Date: Wed, 11 Feb 2026 19:03:28 +0000
Message-ID: <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110640_288748_D6A65FC9 
X-CRM114-Status: GOOD (  10.32  )
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

Some extra mmsys reset bits are defined in the Lenovo
Smart Clock kernel sources - file cmdq_mdp.c

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 include/dt-bindings/reset/mt8167-resets.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
index f77c2ca897cf..b379f8f023d5 100644
--- a/include/dt-bindings/reset/mt8167-resets.h
+++ b/include/dt-bindings/reset/mt8167-resets.h
@@ -33,6 +33,15 @@
 #define MT8167_TOPRGU_SW_RST_NUM		15
 
 /* MMSYS resets */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB		1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
 #define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22
 
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */
-- 
2.43.0


