Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696D2C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=; b=pw6Bwh88n27DHJD3ZG2KG3EAEV
	JhMKqIQ1kShQuByOJT01RE8ufSEuI+sKQ0eDiOXphRTbX0ULfuX5z5Sqzl1mV5N1uemHZH8jKhcST
	X5IKoSk8TORlr5kL3OAgjIYScnO541L4S6kmn/Qx4mMZzqfS8RJBtkB6HPZXZofhkQFSvbz5id9bS
	jXkF5KQqO+iJFGFedm0P+rP/m57ylSJKKqWrAgg13kFsv26ekY/CT/EleS3P/OHYXMEYtPqJw+Eac
	i7wkkcVm/2Nxymjiwo+m5j4tnVUdXZiKA8R44cQ2E0JF5A2QZe8onf8rl8MDMjXGKlUy5qjAQ/Jlv
	PweDdLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGau-00000007USL-456M;
	Fri, 07 Aug 2026 09:10:24 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGas-00000007UQm-3BOO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:10:23 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8487088510aso4555322b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093822; x=1786698622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=;
        b=QtEzOetAoWnIYuLK/Z3FT7ZAcdlAp5csAuQJYchdLe+ZoQyl1YFxSYiLkSpCYmqmO7
         MQBGKjjilcyVHvdbt1TLZx1VvUAg82RvphZHyO2iuDZdBGNwAG2nvaDMERA7BHR6h0OC
         VWRMqmHNyXIvuSQcTJCu1IsT+W90B1kwWwuKcc5NzPje2NZSryGxHAnqsB7RS6XaCwq/
         /MDsM3UWMolr22uZXQQnCrW+inSxvDXohhIOyHN8mfpqyWMfA+RatD6022MXXpEHLuLC
         HN0fU9+5iUjzU6TrNEvHkJ0Y4aieB6RseSbYzziS8r+YNPjKuXmSFrMlYQe2WBOviKbL
         YNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093822; x=1786698622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=;
        b=lh2ZOgm6s1PzLmKG8d5cNfitW4mGkW6yvX4jwLu+b1emj0cK1FUPA1sW6IShmUX1l4
         eguatQguVcAtRd7gXI8Nx9NOFInRFJfib6rCH2ykEAm4pe4uaaHisdD2H4f3+Y0kdXFA
         8YZNTYurvPdYQfCgpm8o8u2kwZf4jTWL8EvwsApbcT6UrysnrCwCWD+3sjIH/FsPWDQs
         UgwJEOtDX05Xn4fjTNO37WBOQ9E6mT0iYl06SwOIrcC0HCqk6nJ1+bEY+b8RiXytXL7f
         vzj8z+SuV6QX3JzV9FFZujsfVpkFAh8+zbi1V+kegVRczmU2OBAA3Ug37QtG2mktFJYO
         k4YA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2D6iwYvX+nzRMYu994s4lZo4HpA86F1kH2qzDxDbBFLhrBGjQk7gvfWf1HdtuqExZTmOo8RAU3H+EKUESVp/H@lists.infradead.org
X-Gm-Message-State: AOJu0YwbDsU7CmxylYQpkPSsC9ldId3lUlZ8crVhRd0RrsnIzaRB4AYk
	vRo1VcmWNJPdIZALqNK6sHzDaNadFJ8zrpslaAhaOQYwXPDKFKQdY8hE
X-Gm-Gg: AR+sD11+pbnTsQCpubt/RXtXSI3914AtEUfG/68U42Wj0vFWV4Hp9mMe2WEMMZxfYub
	7vWBlkTnISFm0RwjzdqQyYhTVqYGUnEJVSTiG4mJP9zZJGqAAbOqGsEELWyUJ3wZrk6r0ntA4sV
	VkMy6ZJ3iCRcEmTah4Yq9xKrVn6xJ0lKtbaBoejdKpW5SWfN4fkZHNEF9kzFFfQy/0Yv+Esm6Zo
	+rDWPJ2NqqRfHfpxzw5t/X3/d3MV2wnH9qHaHxlHIHmanoNqfITBN15YFtj47C8qirL5gwVGdx3
	s6Rm55ak7bjJOaYGQkIj8Mc0k+WBrZ51Ba/lrRXgadvh2r2T8z8lzfBCR0smhGhAiDxuYIqkoRJ
	tilehNAItvAQsF6124NESyZ3tr9l5fuwAr3vr17YYXNNnIgFb/qWhFGgTivLU8V3b9xCCM3VbIp
	bYsVL7Ux+IFqD29AXY6B92c6VQR2FPpy5+9AyPq0ukWrybGK/ne98WJOzikzkT+ZPS2cBv7WenG
	FJILkN6V6v8B32RV1+3Kpa0tHGKd7iwRkgAFi2HeMCfyvGXNT6OU5l81B/GZDPTw74huQxC4tcT
	LNzZ
X-Received: by 2002:a05:6a00:f99:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-84f2e03954amr24222618b3a.23.1786093821837;
        Fri, 07 Aug 2026 02:10:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:21 -0700 (PDT)
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
Subject: [PATCH 3/3] serial: 8250_mtk: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:45 +0700
Message-ID: <20260807090945.41690-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_021022_791334_84ACABF9 
X-CRM114-Status: GOOD (  12.55  )
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
 drivers/tty/serial/8250/8250_mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index e6a56cf54ae0..d0d2aecf9005 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -587,6 +587,8 @@ static int mtk8250_probe(struct platform_device *pdev)
 		return data->line;
 
 	data->rx_wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->rx_wakeup_irq < 0 && data->rx_wakeup_irq != -ENXIO)
+		return data->rx_wakeup_irq;
 
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-- 
2.43.0


