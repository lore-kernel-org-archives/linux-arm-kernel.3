Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA6DCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 23:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CZN69W5Mtb3V8lrpdaa/KxTeb9Pg1cBMFpA8nrb6jkM=; b=A98BD0VrrCBvAMRSAkayBOfCvl
	JyBudsekQx8T15Xv1XjmDmnggpgjF3qduKz7Dv5J23u1sI4RrRd/iwjvpqAn1Awir6Az7U9kHJ0QJ
	tq/qVW9Rz65uyTZ1QOv5ldjsYqecoTIXWY8BIy/tabW33+67D2tGNY2DShDf1Ucq6CFiZCLQ6IJ2v
	J4JxIXP0HTues+XelkoM0A4HN0V52sqkslQ160j7V1I8BNgc91nn22NZXd4rnLhhW8hxG+m8/zsXA
	BgpGPJzXah2LuXij1i35JCZakWEuzfG0bW6dUbDYKBeqsK3OyLw5eAqDzQKN25Yj1yPR96Gie9V5G
	ZjR8l+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Tb0-00000008P0h-0THD;
	Sun, 21 Sep 2025 23:35:54 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Taw-00000008Ozf-1bTN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 23:35:53 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4c794491480so12087691cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 16:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758497749; x=1759102549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CZN69W5Mtb3V8lrpdaa/KxTeb9Pg1cBMFpA8nrb6jkM=;
        b=fO0KJP4XMG4imbmGRMFvdCxxs3QvYYwnSMH1c7F8B8jVlQm3N9pGjcDvVOjp8KBQ4+
         wErVjaZhUas0AQS0h3Me7xQptALM3OdMD5H2/+wr61D9pSVoMXlkCqqwwxCh0DnS4wyq
         lUpRZszq2W7FbGsc9sJXMm2xEkqFKXeGD23+/z6MhlZFIS4uO9Sw7Uk+Xlh//Qbj3TE9
         HsA83bp4F6g1AWXJk3qiFUlEXQj+8/MLykLLKfHvJk3DCO/gjBP4h0e8HS1fKktnDE/r
         8Zw5OtIb2qUSb/rImqr3ggyWTHxWQg6tCor9NyGhOUOR/wMpxDM4BMo/52Wc8iniDfuk
         bW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758497749; x=1759102549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZN69W5Mtb3V8lrpdaa/KxTeb9Pg1cBMFpA8nrb6jkM=;
        b=CjaXKFi3YsrhzgYNIb1ErEE88oCdkssfpdXza2nQvJGZxREfBezKxw6N3T8gspJB9L
         MbliHcC1427Yau3hh6wpVR8iaEZH/L2sOoMgionHX+VF9/A9fFhOvPn7QBFvc9xv0URl
         JvWP3PmNNBY62QmfRzGfAacL+zFbSyrl0c/MjOiXPzTPaSW5bhbFimrUlvyS7jcJErq5
         O6n7nC2O+T+tAsZQvXYBfPLKvZPjBmVLXwzKvEtOuL1APpAeTfCTnIMcwe7AOaPsKb8F
         4o20LKhduGFxNA2FjYRlyVFIHm5tSacxJSkiDnae0u/moAFe/f/FCuAW2eCQGZQHiLz4
         4KXg==
X-Forwarded-Encrypted: i=1; AJvYcCXwZiRbYYgjoMan34w6GhiuPcDS4mKwt2GACsb2s4iqjz976c8ZwFFNdHgYbRXM7RuPLjOQsxq9L/bxqkqfDQ1w@lists.infradead.org
X-Gm-Message-State: AOJu0YwVjzy3oUfaMX7TdZzuaiD9l71hP0SB2Ikw7fW5qzZLpHzr56Z8
	a1oIv9nRZmgpo1/zuWe+Ju8FMzarQ83egKSRhgm2cW1cJOw6n8NtWnnz
X-Gm-Gg: ASbGncvDuCmlT+LdsslWmGB8f1Kq90QDMzq2sKcdU7CU05stNFbilmLtpaOixfLiBAj
	XMzctWGtoXud6ktREz1R5F2puxpDQTVOXWue3zSPcnRcJBjgKsC4ELE2uTGeB6SrRMvB0UHcr2v
	LsW4JUsePO2X840LajBZl2zTA0a/lxtGNeNJdHyRD24admweZPLbhRpwMW93VUehvUh0sq8n6DS
	/nHKEsDB1iUNVGAzP6e8LF7rmOCYGcrVN3ZWQtHotCkhzRItHIttJa5b/J6n7F3pihf7e7Nv3Un
	cJry7C1CcCvZM6TPnbg0owfwBCiNjwqp8ew4vIa3fWRRgKEL+lKp9k7ULiuFGxTj9uqUgNqPIHE
	5wu3ry5qY4tUAa3JO0mx0rqNHsqRFnpNMyn4tcbtT
X-Google-Smtp-Source: AGHT+IEuX/rG6D8K1mfoAz2r7noBHe6o05XMZUMyqXmXpDmWRhPab5YZzhU8CSDkzsIHOEEXRhXr9A==
X-Received: by 2002:a05:622a:1103:b0:4b7:929a:2e49 with SMTP id d75a77b69052e-4c06e3fa3f6mr142548381cf.21.1758497748814;
        Sun, 21 Sep 2025 16:35:48 -0700 (PDT)
Received: from rogerio-laptop.home ([184.148.194.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83631a8095esm725949085a.49.2025.09.21.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 16:35:48 -0700 (PDT)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: xiaofeng.wei@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Sun, 21 Sep 2025 19:35:33 -0400
Message-Id: <20250921233534.838680-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_163550_426085_BCC72C7F 
X-CRM114-Status: UNSURE (   8.49  )
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

Add device tree compatible string for the i.MX8MP FRDM board.

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---

No changes in v2

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..8bddf1f8a78d 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1


