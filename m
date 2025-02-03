Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0633C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d0sM4/RmXwuU/ijuwtLBjbi8cvcOWTlQXElR9KepwmM=; b=kYjzT2QWnqxjRailNAED0XcWQ8
	dwlXyvfTTXwS56mylVV8oekjtKCLcrPsyRtHHYXwAnX/DaKE3r9AojySmVzxkORPNjtbc/dzB9pj2
	nq/V7P5HTBZ2ztgniMnoxoMqCC2iWqGkoQ0id6Or9vZoIIF4gxNthNNDjt//tXox/SHJmIb2WTWfV
	+xkyg8JL70JEQSuokMc++UdsgdiWtiUoI93+5d+G/Bs5QFy6Lkuv8Q6r5H45wgJv5QTIDhEuCrFsP
	kt/0COAkWhk+gibeNskZX6Gmv+rdpoUA3/MoYh1OxRKQa0w9M17iM71gchPIb1f79xETA1ha9a/6k
	GQkD5iJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepfT-0000000EcsP-2pMv;
	Mon, 03 Feb 2025 06:10:47 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepe9-0000000EcoJ-3M55
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738562963;
	bh=rLWgZ6eUauYiCONMe295ObHlUI97EXwV/4fS4BXwZ0I=;
	h=From:Date:Subject:To:Cc:From;
	b=wGB0swZBkJNLieSdlrHaNVeqgtIWV8zIq7SuLSXnixGkA/pijRyc2cQ/IgmKPPpRd
	 3piLoAx026+UeD8RMhJU2jPHBqnLFGNGM2SFXJgV0g9SqspAcUgfhpo6ftSAYC5qVD
	 Vwoe4uBC3cmvI64J5fV2gl2vBC2GWOWK31Z9cUaclikhQkVMF0jU4O3n8bnZ9o3Si/
	 qMAaDozhG1tskkCYA9aXdP2J9+S2oGpIl6Dc2jAMYHdcecbyHZuZnYz94YeKCR9kuK
	 x4MD5otOK/5j1oJewE89feN/PkyfvSYMa4e5t4ocOuCaW8NzCEox+K7uFHy4dOvmr8
	 RWqZB8Iago/yg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id B1C7D93B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Feb 2025 15:09:23 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=QFG+IKsl;
	dkim-atps=neutral
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 9823B93B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Feb 2025 15:09:22 +0900 (JST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9e4c5343so11507837a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 22:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738562961; x=1739167761; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0sM4/RmXwuU/ijuwtLBjbi8cvcOWTlQXElR9KepwmM=;
        b=QFG+IKsllFm+30ENy32TNw1aI30D0VS4H58YJDh+AjkA/BkeNSIgVeOwPDNtHNar8E
         M0e/a8XFuKxZvXMy3FqS53+Fk4Ezg0CtSooFPvQ3MOjzC8mqQVubi2EYfR7UwklBxFrB
         WBEZ2ID/HKyg/3CdOX+nq48j3kJyrJbjRMeiXENTDPwaow4htmpy/v5VpUpO+vfprEC2
         o3LOcMWuywOQC/ljRw+kcnp5VzifMx3FDOTNYXC2kT/GsoDHtTHzjnEsgzW6kuV2tzx+
         /C2DaQmZ6ttJAsAGHSag5fVK8sL5+Z297ZE6uPpYWjsfmaZfd89eknTeFR2V2ey7ityH
         k15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738562961; x=1739167761;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0sM4/RmXwuU/ijuwtLBjbi8cvcOWTlQXElR9KepwmM=;
        b=Vkf29fYVDNiN9u67mxKB1TALDZxIZsSq1gqHkvxxZgMT6zfwgyy4F9KNsyc+xabw1E
         jnCZdi1BGFU5YqlUr/K/oVvZEVwsDKeTEJ31QRWyf87ErGyA2XWn9ntvxHiRHufe1QRJ
         sw/W2Ns4IXMIIrMT5O1GZG6pxTse/B6E+4yoAw7Uh0UytExDlaclzAbfbfz+YiiUyrAJ
         u5f2QmDVNCJIxAK2EjNBgSPosUXt+M/ngeYnM3xoqZCx22b4+rJylCDsAv7ph+NvJ+VZ
         xC7mEWbnnQTnNBBp/DQXGbc7hHxDbjEynaSAlW2GXW7BZxchfx6AFhPd2OZnJ7uv7c1z
         FDhA==
X-Forwarded-Encrypted: i=1; AJvYcCVt4GXNWNeEcXB8Ogl+Wj8ST3wKHFtjSopNIirU9y5d/2YzfcfSqEvhkLbp8OTUxb+Tq8xQkf4C6dXk3tVnMteH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/TXVIwq/7HEarWkUPzkT6OQF48gxldgH+3DiQn9zS1a2sPz+V
	AvJuzTRBw72IdFodvVuGr4OaDh2bEbOSB9lVtjUL3bDPRgbYG3hd9qwbb/LuoPawH3Fe0Z5VGlN
	G9Dpxon/By0k4i+Tn3Oy9wDjvFIuziv668Ay7eB/AUaQsRCqihZ3D+XFIo85jjeKuIl3lqav89Q
	==
X-Gm-Gg: ASbGncsFNDFC7a2l1yFfJY3oUw4TR8QURFRXw9MDelxXNc2Ef192DnDY16ZoctxMRo9
	3/cIHD0i0ZPbYeiZhVJOSZyJqQszae4+osMbTz3zG1S9qJj6q0g+wnC1hxvsXmQRnk6wXhuIoFr
	gPDXUThkCw/4nFqr9/BefiPPQAmMyLkI06qtGwyKqZftajCCoqMezb27wolopEWQcm5JLb4Y5N7
	bM2+3Wz05UFxEXdcRWmApgA4tJHZVCCY7JDHqx6L9ThsKpmt7E8+IuW7Xx8ma+OG7Ivj8ga0YPT
	xCVCjkfIC7iKr1FkaWnV8Hs6k2ZGePfScNBaj9rhPIHmeLVqjfApqHrHdYHkJwZS
X-Received: by 2002:a17:90b:5485:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f83abff361mr29356006a91.19.1738562961366;
        Sun, 02 Feb 2025 22:09:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPlyVzISCSESRGQK82l9QvxGtfTDK4CsmACY7TnxikBjBA5eBNIk3T/ibndka6W854Lw5+ew==
X-Received: by 2002:a17:90b:5485:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f83abff361mr29355986a91.19.1738562961075;
        Sun, 02 Feb 2025 22:09:21 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7927sm68024175ad.99.2025.02.02.22.09.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:09:20 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:09:11 +0900
Subject: [PATCH] usb: phy: mxs: silence EPROBE_DEFER error on boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIAIddoGcC/x3MQQqAIBBG4avErBN0IhddJSIsf2s2FkoRhHdPW
 n6L917KSIJMQ/NSwi1Zjlhh2obW3cUNSnw1seZes+6UR0Car7ywAtgGa502zlMNzoQgzz8bp1I
 +rfM3lVwAAAA=
X-Change-ID: 20250203-defer_usb2-ee26f66a01ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=rLWgZ6eUauYiCONMe295ObHlUI97EXwV/4fS4BXwZ0I=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoF2O3a0jWTHdw/jtTOd3PohMx324/DljYO7n+
 O+T2jfpKJmJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6BdjgAKCRDyimB/1oxx
 B4wlEACYkp3ePrAVerdSG7mZHg/um8PiPAEYvgNbS91eBPyCxdpaY3hktUcwRhuUXSUHcYuj4Ez
 el5W0YN4Gsf8q2k7SiEEZGxsUSSr47WfH6DMcKOUBmEhca6vxGze1iXa8Gs7LeSyHnzkHL4X2Lx
 QqtWr3AHrLbhhJy1DpFoaWl0Yw3agCI2z0PKp+7JGfuQ50UdC5LKq83mlhAYUccuEnMeUMRYAeX
 DodnrZpGIxbZUv1JlX6AoOYDx0qfUof2+m8yPq7LFuZbnbE3vlPRubDHJEeDjp+qWteTYZVujfQ
 kUkIkeH7xpPoDjs7DYfWsYozwCazQDhv8nFPaKfyDE2igikxm1StjAO5T4bluWKBzH/oaJTq1+h
 sdMBH2m73jBMxEfot4JOgAolJifbHi/bavXfLzhDJQDl2P1augT38S+XV0VBRpN9ssU3YV7sj/p
 PQNoOUw0eHcr85NPjb+LqI1s9SIctiFwTirX7On5U5oDOyL3OZ0/bOZ/q4BHEuoZ0B3IcuV794e
 8KlEntd5ZgzfNMQWJZnYsAFBFOQ7UChqTsRPlplU+uwmtOYwNmpWP+S8P6TtHFEpqz79AfjY8yn
 4kH7dH+ppIusR28uUAf+Q0dZYmzsNYDwIjuoQdwSstKKDyYTkH0+7gArO82kNEXdMi/4T2QwTmx
 TQVYet7/9LUejLQ==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_220925_964072_ABAAF31E 
X-CRM114-Status: GOOD (  14.01  )
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

Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
[    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..dd2b4a5633934e257e792bbd61d6748304b5e679 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -770,9 +770,8 @@ static int mxs_phy_probe(struct platform_device *pdev)
 
 	clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev,
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
 			"can't get the clock, err=%ld", PTR_ERR(clk));
-		return PTR_ERR(clk);
 	}
 
 	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb2-ee26f66a01ad

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>



