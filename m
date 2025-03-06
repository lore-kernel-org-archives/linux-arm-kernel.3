Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EC5C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AD4+541pvr0AchIZJuu3S8UqRaWJvIBsW2zPu2lnUwQ=; b=KcRJgPMYJIvHuQ3HR4lb3MJqNj
	8y5x06suE/PXhHAt5Qhfo4zyxqeoKK6YyZMQuZMV7JjqvjrwtfICB1ksU2djVX3rJmkS1AwrDXZGI
	QAfdiw0fRb74FgDre8F2IAgo8jABabFVxMH89CZNYhKpUqEXIDYI+GaFT1FYQYPkt4MgMSzGU4t0I
	aAFnbVqrMhlO5t+UejNHAPsH+NmWyOpUegnCtlZUHQVUd1YoTjRbvhPockfZ5ex2stmvfOO79xBqG
	HGQMAo2/wZlRloKrqvL3zRGtbetOus8LNACAaiUyNIY9UfywEpxTp4bebcfw3dLVS7TQQo2ibk7qi
	5B1gX04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Ox-0000000AmSb-2RBm;
	Thu, 06 Mar 2025 11:28:31 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Co-0000000AkbD-3yU0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:00 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e535d16180so701973a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259757; x=1741864557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AD4+541pvr0AchIZJuu3S8UqRaWJvIBsW2zPu2lnUwQ=;
        b=VX+BAVvnMHOaJGi4lJjmgwmb5DmzKEZCmsPsNE1gKJ5RytZABDCYzzY/R9uYKb6hXp
         SLX5Lr7W01htXQNke3/oX2N5eenlo57YLs1557Baznttc271bgclTv5SuBrLqPFYxx/1
         uSPnnqiHAgkYy9b3sVd1Br5y1SDUPAU0R+C5ciCz/vHh9/+KSd/0DRckba49PpiF6vjT
         KpKngorZ6+9+RK+sOiyz7fFDrmcWoq/tNdK5/W4a4reHLHxokTquSlVsXUtiw4SvlC/A
         SXi/tTZBcWslsD+ZUT1N3Of8jOqthNfWOapAbf0pU4etFT+8uI3beQQ1LUOI2uZe0gRW
         7HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259757; x=1741864557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AD4+541pvr0AchIZJuu3S8UqRaWJvIBsW2zPu2lnUwQ=;
        b=TJ8GkZ6+qLYRK0MCa6XfUs5od38GKdeML/UM+7b0TjkYhT7Mtk/Vv4rAzw2dQnL4Pd
         GFM84pflk/DFaRlm4NuAoppvV6412nddlCTrs7EN0MarUTswOzhij7C4jcvV+0j3T31B
         bMsNgqKNU+8yR6HXrQprRuLQjOqZnVVYCDwtKvk9DcnjpkC+K536z2V+h6i9fWGPkFvS
         RORYA+Vf2sFb8xjNULQatOBJXEYxVEbP2BGUnNO0ea3YBzwahPSnUpotHg18ljCtqEm1
         KgZWTk4b36SXhuvPygxHa2Wtx4+D6UTykaOmr2i+brtS5quBV5/nv3CNvQVl0E2eQrE2
         FxJw==
X-Gm-Message-State: AOJu0YxYDhqapKC447/rVvsonE/nhZOd1hwG8ZJiReGqMY14agkEH8CO
	PtbwCIfSmGEX2pTSki0izqU01ov3Tdgtwk3/d9t7NFRw/KTUUjLe7fmIwgEM3RTfvF7PBn+kPDB
	w
X-Gm-Gg: ASbGncuFbYPWTn7XGP4pymbJwya3+z32TioGYI/xVVIdI/eRsJP9kUL4XNl7bd2AB+d
	UbAePtS9gDaZB7IDRb0VuOl6MbsxwBCECnuYT3WrYJUj3qy3H5BnveWohyzJvAPAUIxp1aDGWk2
	5oODwqA1orYXSHqraKDccc2NFryADndxsKEfnorygWa6QxgfhMpO5uMpQrOz5+yVkk66J7KaG/q
	seOfrHx2tLLIwMbJ57vyRrCMEihk13rb1/jy1pJQPewkN+dqID+zIFbC1vlOz61GC/vWC5K076m
	lXrJagFll2HP1srCmlK5k53JF5dgkbRpC1e8Z+o0sQ==
X-Google-Smtp-Source: AGHT+IGakkDRo68IlrFBMJ0rTm6jyQBbovkArr+qu4dyz6/GSFx4+sETc8W/v1I3QTmizbzR3UPY5g==
X-Received: by 2002:a05:6402:2712:b0:5de:dfde:c8b1 with SMTP id 4fb4d7f45d1cf-5e59f394cc4mr16158716a12.4.1741259757166;
        Thu, 06 Mar 2025 03:15:57 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e5c766a194sm775352a12.59.2025.03.06.03.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:15:56 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:39 +0100
Subject: [PATCH v5 01/13] firmware: ti_sci: Support transfers without
 response
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-1-f9323d3744a2@baylibre.com>
References: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
In-Reply-To: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Kendall Willis <k-willis@ti.com>, 
 linux-can@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=msp@baylibre.com;
 h=from:subject:message-id; bh=oOMPzH4LdaksoCbIxuNdPeXLXt+dMP0qmI97tgFNQuY=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNq9bO/exe8L37NsnKybG2lxeyBZxyt1PWpP5WPyCw
 sBnG1lXdpSyMIhxMMiKKbLc/bDwXZ3c9QUR6x45wsxhZQIZwsDFKQATsYhkZJj917mXS//svgkX
 eSRMP2mwhD8SMjryb9pKueW1zZxa728z/OH+qnz2WYBp1+SuFXzcET63pbX/H5ga+r7FvmRlhv1
 ZIXYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031559_020830_A11689F2 
X-CRM114-Status: GOOD (  15.34  )
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

Check the header flags if an response is expected or not. If it is not
expected skip the receive part of ti_sci_do_xfer(). This prepares the
driver for one-way messages as prepare_sleep for Partial-IO.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 806a975fff22ae00ecb88587b2c47ba172120bc2..09d11e75e14e6a6a82f6d99ab1852c142aeb7e5f 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -398,6 +398,9 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
 {
+	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
+	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
+						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
 	struct device *dev = info->dev;
@@ -409,12 +412,12 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 
 	ret = 0;
 
-	if (system_state <= SYSTEM_RUNNING) {
+	if (response_expected && system_state <= SYSTEM_RUNNING) {
 		/* And we wait for the response. */
 		timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms);
 		if (!wait_for_completion_timeout(&xfer->done, timeout))
 			ret = -ETIMEDOUT;
-	} else {
+	} else if (response_expected) {
 		/*
 		 * If we are !running, we cannot use wait_for_completion_timeout
 		 * during noirq phase, so we must manually poll the completion.

-- 
2.47.2


