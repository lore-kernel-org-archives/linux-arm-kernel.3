Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE21C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 06:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z16CFT0X6xgp0nREGCa3KxiUGJB2mesoFi2mvUmMQZE=; b=eBiDmnbpWUHQzLkkl+UU48DKtk
	zQHjZIToKaCBsLnV3ogcdByevNsALd6N/2ND4kHnTnUC2DSf6MSk4BYrmx28s7ytOirEMWYDW/EdJ
	I5yQFRfDKbvibiM2TzM0GGtC1ezlhQKMzSM+awMBCdK77cMVU2kOhJ0BEo1ormhIlA4L7ZovA8DQP
	tqD8tMMtRMmG5tLib9c8N+36MkG3grSuP89x+omTCARh5UBKsFmuGbjklsgSXZAr/YWWlRj9NJKsf
	wE6mW8zUSnokVfqI6bvv/4w5HVmo5ljdubXqssM8315FgWRMTlgVV5Nzs7Pcr9rfUMzqXxnUQdyq2
	7nh0HoCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2Ix-0000000Dfa8-2Gl0;
	Fri, 27 Jun 2025 06:11:19 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2A4-0000000Defz-2D1l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 06:02:09 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2ea2fee5471so1033736fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 23:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751004127; x=1751608927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z16CFT0X6xgp0nREGCa3KxiUGJB2mesoFi2mvUmMQZE=;
        b=Y8ne71oX1FyI2Si9+k/E9R3144Zb3Lo8XRkdtk2nrAMTCl6/cLY31hhjG2Nn/TMc/l
         euXrq9PkZXhCAM3AlgA2rtqoHJFN1xmYASfsb2lctgNUC4Z9NQpxWjB1JZVR+HTIycZ9
         9Apt3++7d13BsvwdQdnTZVP61dGIcqwIILAdBPfZ7+J3tlJjgkyQrPVkM0+2/0H5iNif
         vNAEC+gHdCQCtpTgwoR4QVvH5h2cpgArMl8bfjEkHGwPxdsaztZJ3TILjz+TwtSl8Qjo
         lltBHB+ZIUZpOlDX84x3AqKVOPFPErpN7nCq187tSspslpXWSHf6qtEEaIBW24eYHYoh
         IdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751004127; x=1751608927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z16CFT0X6xgp0nREGCa3KxiUGJB2mesoFi2mvUmMQZE=;
        b=BTQDug66DrdwcA3vtOnqmji19a3M3Pg25liSD62yx5XftqpxacrqfK42zqhZYRe0n0
         hgUsKluGcB8EvlIiFVQP6Y8h5zvX42p06mjCiwHsBd9mFSVDnxEkO7pJ0KnlkJmnfVLU
         kxJGHvEziAPcMPrBEfDVOXjXPy5C2+OdqFJ2UEC2RFn4P6Kvxddu+Pu3Ymh0McjxMfOm
         s1CAmt3blHDESy7bfMZtlY3DhJRM1Quev7rPuUbxJg8e1dqfuzdxNbCjosHhfwsGlmds
         TC95tlzXUwFXlhbTBC+u9Dt8XU6pGiqd+tuQg0hnA2Ze9AqNU0tVDNujisrLpY5KXSC0
         sk8w==
X-Forwarded-Encrypted: i=1; AJvYcCXy9++ZeWIxydCxfO7r+c6bWjcJxqPiz56cC2iuF8bNuSLQdH+gj3zxln/ap0jvT4ANQpgBA2nh0iL5qUCksK2T@lists.infradead.org
X-Gm-Message-State: AOJu0YwcFzTOm8bO2i+1IQvc7/q4affykwuL2Sx3jiip31RHpW1+4yNk
	97XEvxogd29O8BuYwbZ7xeSElWpS5iP+XWS/UmtXuc+FWrDf25ipS3ZW
X-Gm-Gg: ASbGncu3jytt7vTsYWejXWPwqR51DdMeVgrnPO0S54B2cCGwFnpmo401+Up9Yauvjhd
	emX/8flZxO7A6tvQ+0+NVND6tSskztIQV675w+wAKf5aHwsxwSz5F+lcBOYHVTN69S7Kg2RO/0W
	NiLBL9WGsjclILJl4ZHXuh/PQhGe4C/+T3M7zrT2TtudAcEQT6zumO5RQC8sDJvR4JiABvFjBQb
	ChzMGRUhodC8yLIzmv4c+RAn+7WPIW9qnBh7l1oI+bPDAoaSX87IjA7Lf1+LvbFWK7zRMGkK3tJ
	0qJgOG3T0c1ikGEMDDbEUX2Yl8ZHHB52r/0PRRldZ7g3VSS8xZIskT+CSOOyLrk1
X-Google-Smtp-Source: AGHT+IGDf5B3X19G7dGXS0IC17ZqTS+7dOnmBelH5PQyqTyVwxjOWGD+13q1TS3hyyCtPCJMgMSHxQ==
X-Received: by 2002:a05:6871:5b20:b0:2ea:9932:f1ac with SMTP id 586e51a60fabf-2efcf0616famr4235808fac.12.1751004127129;
        Thu, 26 Jun 2025 23:02:07 -0700 (PDT)
Received: from s-machine2.. ([2806:2f0:5501:d07c:4b96:6387:264e:4984])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea6b86sm748729fac.1.2025.06.26.23.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:02:06 -0700 (PDT)
From: Sergio Perez Gonzalez <sperezglz@gmail.com>
To: gregkh@linuxfoundation.org,
	michal.simek@amd.com
Cc: Sergio Perez Gonzalez <sperezglz@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org
Subject: [PATCH] usb: gadget: udc-xilinx: validate ep number before indexing rambase[]
Date: Fri, 27 Jun 2025 00:01:22 -0600
Message-ID: <20250627060125.176663-1-sperezglz@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_230208_566384_841E0CF4 
X-CRM114-Status: UNSURE (   9.42  )
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

Issue flagged by coverity. The size of the rambase array is 8,
usb_enpoint_num() can return 0 to 15, prevent out of bounds reads.

Link: https://scan7.scan.coverity.com/#/project-view/53936/11354?selectedIssue=1644635
Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 8d803a612bb1..0c3714de2e3b 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -814,6 +814,12 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
 	ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
 	/* Bit 3...0:endpoint number */
 	ep->epnumber = usb_endpoint_num(desc);
+	if (ep->epnumber >= XUSB_MAX_ENDPOINTS) {
+		dev_dbg(udc->dev, "bad endpoint index %d: only 0 to %d supported\n",
+				ep->epnumber, (XUSB_MAX_ENDPOINTS - 1));
+		return -EINVAL;
+	}
+
 	ep->desc = desc;
 	ep->ep_usb.desc = desc;
 	tmp = usb_endpoint_type(desc);
-- 
2.43.0


