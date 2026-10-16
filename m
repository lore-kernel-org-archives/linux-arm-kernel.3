Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068ADCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 11:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgmnL8mkzlZYj6mWZA/tchnETE3V3TFCY3ed+26L7nQ=; b=xg9rfzycza0t1/aOsk/ihmfuik
	miZzRCy53LD6CwRCvQT5goLV99KCakT/pG/E526VORm9sSZIaCPj0dJxBlEInpBO4hzYVaiSE91j9
	5bevr3T89ZGjyGSyCWfQ9bG9VmLeaFxiH1Nj+iRuNTDDPv9qmHzByssF/kILC15V7DDm3KxWQVYK6
	5QD1fVreUblzOCEXIPv/Z9MmpIzuhp5Bk9taPeee05BVzCQKIfQLN0PZUiziAA4Xt8T8cbr/c87B6
	lFV3oA9Bknyb5yiMgGgo0B2ExkGgYoGeSEe2PXGoMbI4YFQJMeBFN7db8Olj7Wo3BS8D4sdd1/sAW
	g80fUV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgGd-00000002mIQ-1fBs;
	Fri, 16 Oct 2026 11:38:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgGb-00000002mH3-0XlF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 11:38:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so54680285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150707; x=1792755507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgmnL8mkzlZYj6mWZA/tchnETE3V3TFCY3ed+26L7nQ=;
        b=AxC31Nl3VV081uJhLnQmppqVgMosHPkkKmGJPScsOrvT+bpS76JAhAkgih87ziPpXK
         hd1DNcHX9IjeTMPqxRFG6QU2Qn2adQK2v5DJ1YYDiA0NOHBgG0U7kqphZrCY4xs8eIZh
         H6TZACUbOm/dpOEw1rjcRbb7KLqi54DujrWFDmk4r+ROewOKdi6/oZZG0ngDenF8FBOW
         JPtdURaGIvaOITuzR9baWKUYTeLmnETpGpCsFOdeWeDKdy2UN0LJ/8pfTJyJZ/UK5w13
         V08L9q/m2WBGs1jxGzgpdWEHjIxwtMda9Z0V3ieWerv4OwIDYDIz3KbjAK22bPutp5sV
         lKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150707; x=1792755507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgmnL8mkzlZYj6mWZA/tchnETE3V3TFCY3ed+26L7nQ=;
        b=IAXvcdX3ziVbI6gw8si12Mr5hOHuOic4nTgY0mKlomRsqhRrocFCYh8tecuw4NeTtW
         DdicpEpNKXMCLAxKqftFFjjXY5i2G/aW5HawYbL41zkAT1TkEnxZ6PlICyUP7CweZQ4f
         uwdlQnrxbuMchNuS58LyU40nkIWAKHDPcqmEQOgNIax3z7H/ywfwUTYUjlcQ6l78wUTv
         WXf+bALOkUVEmhViAh4T/1XlFkyvUdIs6R/vzNG2rJUpppY4g79VcAPm0PdyVoFC2Gr8
         PKJVnDpkTjeVt1oDpVmhIqCKffLkfq56UtcFCo22K6VEKQ9whcNlKs+EDnQDnWdLMwty
         zedw==
X-Forwarded-Encrypted: i=1; AKwUvBxmV5DlhrUvaHNrazpZ8KnCiwuFzE6W5+Wo5pYRPU4k6rUvsZM6qWwSjH4lMhYLLz7WqSO6+/uUJ7EmVWoWE0Db@lists.infradead.org
X-Gm-Message-State: AFq9FYLaLHRJMDMA4C2nmgCnU5OGa728Ngc+6D0N8J67SuMHErzk9w8O
	HZk2bMKZggJVE3mPQCCwz1vx6qVjiooQTjeql9cvxjNSywlvkw1xFAH2
X-Gm-Gg: AYBFou3C+Dv40mLSQNj/Nu2eMaSE1y2j6OH2dQ6iP7MBqe30t20LTYc9ggPknPNntOm
	4xflW0/qn1eACjPKLi2Jq2s7Slke5Ssk5n/0n1qR2Qy141M4tPH4KPR01UbWkl4FgARbKvLGDDI
	KBl+Ra0+YrBDYXtVSd+tdivWObK4bJdm0NyeB9xwuDzGCNCY+2p74W4j2AR6fGHSFFY80Vai7UT
	dculvRDLJT450SMPUYRhrAHrd4dufRhWHRLaY0c/S9SDRkj+Aep5LKo3XnyCIFC9fLZAX19xv6k
	g8qjDHEV1qZHCNT9L1pbEJnhyn038cDhE3r6fFjCsnfbrTnhRcHOuGg9YlLqqOTC1tuCT77HTFn
	ypk+GU2DMfaWw6ktVU1bysoXhxvxshy16ZX3vgDTW/2dvY3nvLoUU/3xZiW1jAmDL+ct6AqH6+d
	1bxYT7oq0vN1xJrzdlN5ZMFZaoF8ff6fQDTy/4BHquhXkNoxi1aV8G70W9b3RxYdm3Tri3FgYqx
	3Xhx+yWq40Dzx1xOAMPovhr0Es49MB1QWLxJf/9nncDMmWRmzTxuki90w==
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a18e4f2221mr418624145e9.32.1792150706893;
        Fri, 16 Oct 2026 04:38:26 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm36169855e9.5.2026.10.16.04.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:26 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 3/3] media: sun6i-csi: bridge: Remove duplicate mbus format entries
Date: Fri, 16 Oct 2026 15:08:46 +0330
Message-Id: <20261016113846.8602-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016113846.8602-1-arash.golgol@gmail.com>
References: <20261016113846.8602-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_043829_184821_4C54FF5F 
X-CRM114-Status: UNSURE (   9.37  )
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

The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
codes.

Remove the duplicated entries from sun6i_csi_bridge_formats[].

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index f9ee94fc1293..0331b55f489a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -93,12 +93,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
@@ -123,12 +117,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_1X16,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_1X16,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-- 
2.34.1


