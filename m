Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D727D1BDD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=la6xj5vR8nTJ73x2ZaTngF8peM8uUMZUxIbbvjw1ql4=; b=eePXbXT+OAh0uqY0y1Py0m3fFj
	AKXBW+46w3R136surNvVcB9pahEfUwXUyAwptJ5vMWL/T7JMBa1Or5zub90rraHY5capkw5JG+hWg
	lN+xRP4bYCvXH7RftYkWQEtbsnZupl2kCYTo3j5CWWKb8jPxs6aGq2kd9Vc+gBOkbh0AX0yK7zXyQ
	Tm36tQ4Tw25QMDRy0na5chYy4cpStRda6Paxx/o9Tx2sahMiffQBYXhh2s4Y7XbHj3yB+vJCsLjj3
	dIdBpT/hqoP2nzQf0+xGfpcDewlWHYPKQfpKISO2JhtYheuPnSh81i770CL4n1Zg8ncq14Xhy2S4h
	QhjB5SeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81D5-0000000EagK-22s0;
	Mon, 04 Nov 2024 17:49:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80gm-0000000EUtX-12sC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:16:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4315eac969aso27170875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 09:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730740585; x=1731345385; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=la6xj5vR8nTJ73x2ZaTngF8peM8uUMZUxIbbvjw1ql4=;
        b=rz8PIYP+f1ZQjXiQu/rRJp1Enz3ROwe2F+gTv1xTZ8zCNuWModbs9z3WnQwE9+Jfbr
         URLSLhWnbhSkWz376tJf+3NS3IWOgJ1XxOO1T2zoABVgV0ddffEV583gNxKBMWQ8Xhio
         SPIr7URCsNibqmMfxUVJmx26BAXQEJk7o+eEeWhkE7yAk6yq2GBKJTNPfNEcomuM4hUy
         6RWo3vQc7Jhwlbu0V0ONfgO/Az8ZR88bgg3OqaPv0MOCBElN/t4BuCZ6FZ6vlpgZdDPZ
         ufzbsRXJ6PwUF8Jb3MRJhxrQdv3TqjKmXWuCR1V0fPa3KSRUx0d5/oYLqigXaD/uvLt/
         W5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730740585; x=1731345385;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=la6xj5vR8nTJ73x2ZaTngF8peM8uUMZUxIbbvjw1ql4=;
        b=nwWSZnDwhTiluLOr0LFTGlL5nWr6gOghIKOevCH2Vse0pb0+TTxMlzU2souJ0X9VwU
         lN8v+RNWwYLJf0JxhRb6vPylOJaftXS/kcpMfBpiKLjnguUQibqBZzU7V1YzjGDCAmn9
         B/dUz84pUPhjRESwsIw46oMxoYFiiaQuTRA80XJsPv+KnsLG2lkZnRnbQMEd+TkeuU7+
         mXB2geZMq+6fFFUTc7btsUO696N3OnYu9HT3Ci2LiXaGfnqYeXFsLPBa7MVc7OQH31xG
         52vcbD0oFvaauJFq0q6E+Yne9ue40+gL1wtc0fQnqNYbOpVkXnYGi1l3jMlRPrBBQw/c
         gJiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG/8Wf9o04vHktLFKPoYgTn5MFzLXI7+2HjhDb3xFy5cDjvXdwsDp7Bl0L4+r32lcY/SLT5GSZzm5RjjI6IyNN@lists.infradead.org
X-Gm-Message-State: AOJu0YyOcyr9iZiSJdHLFf7hKMIJ+SyrNPRfob94HIkJf+SAvh+XEnCw
	c+7laWJU0L8wSiQMt+J7ceeYYVqznvlFCDqYbbXP2ezmc5oTad5oeCmAb8fUyG8HJkHEkwat6VG
	a
X-Google-Smtp-Source: AGHT+IExVi+NfBAt2whjsx+0Pt93IxelL6rLzuY/ubpqgPe9heWtnY82NiVFj7fqgDFJGWhQtWWPcw==
X-Received: by 2002:a05:600c:1f92:b0:431:405a:f93b with SMTP id 5b1f17b1804b1-43283000cdcmr104416805e9.10.1730740584601;
        Mon, 04 Nov 2024 09:16:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd91096asm194139975e9.13.2024.11.04.09.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:16:24 -0800 (PST)
Date: Mon, 4 Nov 2024 20:16:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: xilinx-tpg: fix double put in xtpg_parse_of()
Message-ID: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_091628_337167_091E3F66 
X-CRM114-Status: GOOD (  11.94  )
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

This loop was recently converted to use for_each_of_graph_port() which
automatically does __cleanup__ on the "port" iterator variable.  Delete
the calls to of_node_put(port) to avoid a double put bug.

Fixes: 393194cdf11e ("media: xilinx-tpg: use new of_graph functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index cb93711ea3e3..7deec6e37edc 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -722,7 +722,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		format = xvip_of_get_format(port);
 		if (IS_ERR(format)) {
 			dev_err(dev, "invalid format in DT");
-			of_node_put(port);
 			return PTR_ERR(format);
 		}
 
@@ -731,7 +730,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 			xtpg->vip_format = format;
 		} else if (xtpg->vip_format != format) {
 			dev_err(dev, "in/out format mismatch in DT");
-			of_node_put(port);
 			return -EINVAL;
 		}
 
-- 
2.45.2


