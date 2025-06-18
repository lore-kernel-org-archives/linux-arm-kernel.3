Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C65C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N+qv1GHOU/ShU2OJAJa6dB0bDSAG6lFZVxU0lASK27k=; b=c22c/rDWYe6Dc4LG6cjUEeIni4
	lkoBBYhyONwVFiReSyMHOGRY+512JmhhIaeYe80bMM2qhyn6YIXz23Ig2woNdIREtQde+0i49mibs
	Ailo55wdJO37lKN/jLrBFWpL4BlIpsEHdIORh5G5AB1rNd5D/ZOXi/okGJzUJDUmVg5Dk5oO2RTIW
	jmW8E10RgedLS4eoJInSzRGxENjxLiGIcNFMPwRlfIrksx22fOR3PSCXA+fGXQdE0fijOhg3ozYJl
	AqtPxsmUDQnlqYvVaJ/AuLHAt+HDiZx8dxabw//YKrUnZT0n9iULfdIIWv599IswnPc+iStAlU//K
	Z4I6WkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwsV-0000000AvSg-0Kp5;
	Wed, 18 Jun 2025 17:47:15 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvx5-0000000AlUk-3Gde
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 16:47:56 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ade33027bcfso1181567866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265274; x=1750870074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+qv1GHOU/ShU2OJAJa6dB0bDSAG6lFZVxU0lASK27k=;
        b=MJZ+kzJPDqMVXv+90cvc/RsXl+Qf029rgDKO9WN6/ASLynRv0hKA9fMdeN8mUYdnOf
         NkD6HyiDH3fCxHz24L3Bq6XmhMVbosnS+DGFQx2lAqwyA7i6i0aRdbWrqI5knc73cogi
         M02DJsUoNXiAn/bZ6t/ZNeS6Emg2g+ydrwVQDceDI+ZQdqF0u7Lvhowf2RAMUT5Zu6Nz
         mADGGjsxxRoP67z1GoNE/1a/OK7iXTQHf06bTE4461K04k7iaTsXgYvODW7K8ULeoH0R
         DgIdn8502g99u/TiYIUfUFgJjc0K84JvRqw+D27fbLstlNP6TuNp1uL6BXWLVm0Kxa1S
         dWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265274; x=1750870074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+qv1GHOU/ShU2OJAJa6dB0bDSAG6lFZVxU0lASK27k=;
        b=ZyCD6GuRsrOW5CJuBDfcW1u6eZFwAs1i8eorybtNFfdDgnDfxgqE22DCCeFij3+sCL
         4x7RhAlXhTh0H81mRqV3cY6FACAIdllYlCKo5xW8vkgspcZsQ2f6pPb0BZ74kdGUo4eb
         xD7H69XvCQf2lO8FaNJ6VegsNah77zeWIyg7HBhp35FIRuozzvfSYSpS4MaEdENHCNjI
         6UOr34eOcqaLOmp2zAdqRsPoD1on9d6/yT7H0QdUQaN2uSDhHBVKNMYroaeVMFo2r7yx
         nNpst1zUUyU9tewa+dfK3sAMXSrsK7aLC+8zN2qg1kZcyblkoXZoSKVIBpGBLHBiyTno
         bZNQ==
X-Gm-Message-State: AOJu0Yzzgkvcnvv2sqCyTLg2XT/jr+QKQAXKqIdEUgCOTj+NVpOe7h12
	dh9URypdDlZ89sKMVzMbJ60y4IAveu8e+Tn/XaCAqMCH3qNKDZa1Mef7
X-Gm-Gg: ASbGncs7FYjrINIfXT28LaXiIQV7t4iV0szLLb2cY5XVPAcfML3l0P3k870dhQ0b3IR
	aK2AHhNVkzGVYibUUzNxOEvbsCJ29pyLHfNzUnqiDwpeTzeJ6V9IE51lS5+1UuKe1A8DwVfL/xX
	/yLWSPpkdA3FqsO3G9dl+XIubwogXOOPgSG7VOlPXfedNV3BiS5ca03Sc+N4jvF3GWDHc/OaAWr
	zpDTBZST8qSI4C5AsBabDl5KfZoQdcepCSqNNOqTGQE/hlAYutZWjZJHcTgTySR5Y0lA9kkE9xa
	Iu11VRp0k3ACOiRhBrj15RU0rceRfvJBzDuLmrjwrkcmZKFPA2fgc4CHxQsJzD+ClMEiWRcWnn8
	G4olEXW4=
X-Google-Smtp-Source: AGHT+IF7CCKVAgk6WUozUwLRY/+4SzLJ63FajrazwZc0+Ifd6OQCqqeNXYovSAUeenIgd24XLetrcA==
X-Received: by 2002:a17:907:1c08:b0:add:f62e:a300 with SMTP id a640c23a62f3a-adfad29f4e2mr1862867166b.2.1750265273477;
        Wed, 18 Jun 2025 09:47:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:3030:ae0:5873:67f3:9dc3:7778:59f4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf9ad8a155sm935481566b.84.2025.06.18.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:47:53 -0700 (PDT)
From: RubenKelevra <rubenkelevra@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	gregkh@linuxfoundation.org,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org,
	galak@kernel.crashing.org,
	RubenKelevra <rubenkelevra@gmail.com>
Subject: [PATCH] include: fsl_devices.h: drop unused, misspelled FLS_USB2_WORKAROUND_ENGCM09152
Date: Wed, 18 Jun 2025 18:47:43 +0200
Message-ID: <20250618164743.1916838-1-rubenkelevra@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_094755_819208_711BD9EB 
X-CRM114-Status: GOOD (  11.12  )
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

The macro was introduced in commit 69cb1ec4ce4d ("mxc_udc: add
workaround for ENGcm09152 for i.MX35") on 2010-10-15, but its prefix was
misspelled as **FLS_** instead of the usual **FSL_**.

Its last in-tree user disappeared with commit a390bef7db1f ("usb:
gadget: fsl_mxc_udc: Remove the driver") on 2020-12-10, so the macro has
been completely unused since then.

Remove the dead and wrongly named definition.

Signed-off-by: RubenKelevra <rubenkelevra@gmail.com>
---
 include/linux/fsl_devices.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/fsl_devices.h b/include/linux/fsl_devices.h
index 5d231ce8709be..49f20c2f99bf0 100644
--- a/include/linux/fsl_devices.h
+++ b/include/linux/fsl_devices.h
@@ -118,7 +118,6 @@ struct fsl_usb2_platform_data {
 #define FSL_USB2_PORT0_ENABLED	0x00000001
 #define FSL_USB2_PORT1_ENABLED	0x00000002
 
-#define FLS_USB2_WORKAROUND_ENGCM09152	(1 << 0)
 
 struct spi_device;
 
-- 
2.49.0


