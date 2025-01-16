Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF01DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 03:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kG+kMfLfgCnFcb2MQxw7I0LDYokEdblnCGk75vkECw=; b=vP6Vmlfn+6b1uMwGVGX7nlBq8z
	Oy1sI9LvCw+K3L7RXqCQ/Rah+mkIlTXlYFld/vczJhLxNVmo8thFrcEpeCQexuXeMRr+9AN9YIBS+
	RGIN2ljuw9Fiw8gGW4J2dubqBBEC3JeIsZpU5BjxnwqQi+A+HlUoMNFSPg2t9l5NBcTf9CtghTdlY
	46siRDi0Nd9Ftu/tZntIu+T/pvcqDim6KfU7o0K9ZsCaxUERYghUSV0yd8/CNthHPmGgmAJ1w860q
	1uK9MLlo/HMntxX/ErhoE3lm0hwRhCHasdAQ/uMtDvzv7vbbCR2m+DH2ozp2auq+2Sr2eafUDItst
	804IETOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGjk-0000000DkJT-3GYZ;
	Thu, 16 Jan 2025 03:40:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGhH-0000000Dk3W-3NHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 03:37:32 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2166022c5caso6266085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 19:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736998651; x=1737603451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kG+kMfLfgCnFcb2MQxw7I0LDYokEdblnCGk75vkECw=;
        b=cmIzbiJTl0ZN7vmC/FVZjcT0uOh9aQystjaEoJRFE08hxnOsNHqggwdzwRIRKr6D8q
         h+VpWJanE8afSwJ+OpnQK6ZR/5sF35u7WMvy96+tF5yPDF0p0bGMaCkE8kVKt4INEX2u
         DIPCbNXa+72Qr+GT5gnYtj44UtawSGTtcNyI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736998651; x=1737603451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kG+kMfLfgCnFcb2MQxw7I0LDYokEdblnCGk75vkECw=;
        b=nqLTaMnGKnnIq/KBQRt+eWbMLQ1/cLgxk8HryODKcM/y45rbk/MclXGncGQUAQqDmu
         Q7zUeHepVolLID80O4TjX6SXOugcLxc+g8eYEBWEbjgeoSmvmtBQ313rpvCwHAvBLXue
         dwcX2eCPOcAmSuLAKE4XgKKqbav0AVj3UQUVRq5IxFX8LsoXnpOYL3ZSrX1z+aD27kCT
         Fq2U53gcSnp0H5s4CfSw7xV+u0Nr/nenzKIU9cb1DHtbv3vc5qMAFDbqTwbO3oXR4zb/
         qeRY3BNW6usvnakyTNSroYvauGgkLGhg+SaYiVWuA+vo2MGnx0G930pCWaFl3PsE3IBv
         ZYrw==
X-Forwarded-Encrypted: i=1; AJvYcCVh/sVMt9QVpXhW5ed42PAmSHLpt4pm/cC3MxCNKOZstdfB1yeU8uUqLgGLXDsMkgaWEPT2djWWEvVca+KPQ0Xd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdrp9o+jI9Tpjq51mJirfX8vZatefbjxSGCImzyL89X3KOtunr
	7GZPouDYMU/r0GFd7tUcGKBpsyPozeebLpecMmiglg59bfUjW+QyDMbt6prMNw==
X-Gm-Gg: ASbGnctAi98CKS6idOZj2/Y35Q5COQo3AHIREbyoztvEU0RHmVIpu07y278fw6HP+vW
	yS4Vsgv1/dUauYqggWdO3NxWHZ14sjkDnAQsrbmfVae+rxikq7MGcgRpIT+J2hfo5DWPXRjoJ/Q
	VQv66Uy+EREj27PRLeYtDOtoTAhVNtrhz3MzCY3fgdFrMPEO9Fk2uANu/oQj5DvaC43TZvOjUl3
	mj71r1o2I8H45jwT3iL09YWa4FfAAtE/7O2yRooZ35rn6xjrqOLsW1LoaGKVro7BebMxTM55M42
X-Google-Smtp-Source: AGHT+IFmA5Gr4C+Te1MHWaygBwDL2sH6qF905UycWpwXiB4qOSlE+Mwnqw3EiqVpy4SvZI3CVgEcIg==
X-Received: by 2002:a17:902:d4d2:b0:215:9642:4d6d with SMTP id d9443c01a7336-21a83f55157mr459471665ad.17.1736998651180;
        Wed, 15 Jan 2025 19:37:31 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:534a:ac09:3752:7758])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f2339dasm87714485ad.177.2025.01.15.19.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 19:37:30 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] Bluetooth: btusb: mediatek: Add err code to btusb claim iso printout
Date: Wed, 15 Jan 2025 19:36:37 -0800
Message-ID: <20250115193636.2.I5b800519fe573164417bbd14674bb811222826cd@changeid>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
In-Reply-To: <20250115193636.1.If8b655b5c6877bd9a1136ba0f1cd61cc6a4b6e9c@changeid>
References: <20250115193636.1.If8b655b5c6877bd9a1136ba0f1cd61cc6a4b6e9c@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_193731_839568_1710E002 
X-CRM114-Status: GOOD (  13.15  )
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

Add the error code to the message "Failed to claim iso
interface". That allows us to know which error case
usb_driver_claim_interface() hit.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/bluetooth/btusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index f69df515d668..df8889e8759b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2649,7 +2649,7 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	device_unlock(&btmtk_data->isopkt_intf->dev);
 	if (err < 0) {
 		btmtk_data->isopkt_intf = NULL;
-		bt_dev_err(data->hdev, "Failed to claim iso interface");
+		bt_dev_err(data->hdev, "Failed to claim iso interface: %d", err);
 		return;
 	}
 
-- 
2.48.0.rc2.279.g1de40edade-goog


