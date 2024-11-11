Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25B9D3ABE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PcG5Ghtfgj5GW/5qfLw7yewkg+yGj/V/bjMocxCMdSQ=; b=Ahf1i726fvHhOa559TQZkP6SP+
	hMjHsbzSL6X+Siz8vaAs2125Fsy/Y3ErUg0e2WI5mUJyrq3UTh9BH1ylwn7iq+5qIppN61mJpm94z
	f6fW2gj63xTKnQYHx3rbHSLwG1FgA7Ci0mQpTCSa+UlziujQhevXtiBvE/dIRrfYRkeCzHNdhC+Ap
	QV8XrQlEXHoQjuQlC9KLKjTYx7ke/LTHtJGT2C47kRmfCPOJ5SxsfioR/0W4dxvvkb0P8cweQ6oH8
	aOgPQp+5XRAvhD48ZxI33KO8SV85gu+rlRO07yMXX6FSGlF/dSThJ22ixZOG9415Pnp7g+UqNKtsB
	vOHT2l3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYxw-00000000sNP-308v;
	Mon, 11 Nov 2024 18:16:44 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYw6-00000000rxP-2nEA;
	Mon, 11 Nov 2024 18:14:52 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e52582cf8so3757310b3a.2;
        Mon, 11 Nov 2024 10:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731348889; x=1731953689; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcG5Ghtfgj5GW/5qfLw7yewkg+yGj/V/bjMocxCMdSQ=;
        b=LISpr0g7AfJkcCwdrhTXPxREa+t2tA5a5WVM4v7xfd3ZAXPu29ofFWvOTnD2F6c07S
         vP+oSCkTFCXuvznU9zmC9kGuDfEG/DKnhVAqeBCSsO+lTpuROMf6dsys27VkIFTJPhd/
         Qm+56ZriENmlAwfUMjMBLw2+Y9YC93onRtiA5zvFB2i9Y8kUG6NpZ6vi6RAq9hwo09No
         lCg+78qG/VxVSbuQn4TmKjRRiQj1IOIjVyeV9KVJNA7DfMtR5ltWeYEv6kOczgMAmrR2
         /98ApTIgxPybEP++lYzIBpRfwyL2ABw/ctkQPvJGgKkAoazFFM/1vGL7rF8z5p+tTdqB
         /TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731348889; x=1731953689;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcG5Ghtfgj5GW/5qfLw7yewkg+yGj/V/bjMocxCMdSQ=;
        b=rFmLF+jNYcZI+/bw7G19OwR++WDXMLSGkC/c00JM0dqA21S/nQX12yC7itHM1swLYx
         sPpum7VEGvZqlnWlD5ERBEgkuYq9q6ioDE3b67+oAtY/drcCTrPYB7HkdY0ABoTSAWFk
         VgfRkweVJEoMvhKP3PlanbbU/zDbCuqlMIMccj83jyjQ5Fhxnc632fm0eR0/egcyFmvb
         DFhmfkPRSsk0cRfHchuAwLrigXAlMgbND1gEWck3v+6r0ZTdpJsTMQj6z/8r0Ke0UONL
         4QSPIlNR7GzkyqCOyr/vpJnGorVyNlZEGiok2LkB7F8SesZwQCm8N0F/FQ/DqOVtMJob
         74kg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ70Q1iTWKQ38XU7xGz6CEcZHYFXokj8bG8ig1zrRskEQRonRJXSVa9b7DDdL1D6t10KQLVj1UQiCnD01BA1w/@lists.infradead.org, AJvYcCXDy4kARmkkIcljJnGieXQO7mFQdWoJbRqoxuFmKrxOfFAscYSo0pVoKukVgUczX+6+acTETdu65G/iO6sOcsE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFh6fAevF8YmL0Rvv6GSklk3KjHUnBQcXNwUMFgOyLKN0fT4ZO
	4fw0hJuHxsybVpsV8JaLzF8m8QWB+bKdUz+/WVFhWo/f/eZnnO0r
X-Google-Smtp-Source: AGHT+IHRY0yX/5Z9BgqASQU4ZZ39SI5JUr83H/XUjHQ21anzAVa6uoUX7kOFpkJY9khvsfngWxmH4g==
X-Received: by 2002:a05:6a20:a10e:b0:1db:ebf4:2cb8 with SMTP id adf61e73a8af0-1dc22b38e98mr19023560637.38.1731348888950;
        Mon, 11 Nov 2024 10:14:48 -0800 (PST)
Received: from Emma ([2401:4900:1c94:38cd:5054:ff:fe53:2787])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5d9460sm7537614a12.35.2024.11.11.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 10:14:48 -0800 (PST)
From: Karan Sanghavi <karansanghvi98@gmail.com>
Date: Mon, 11 Nov 2024 18:14:43 +0000
Subject: [PATCH] drm/mediatek: Initialize pointer before use to avoid
 undefiend behaviour
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJJJMmcC/x3MQQqDMBBG4avIrBtIotG2VxEXxkzrDzJKYoso3
 t3g232bd1DiCE70Lg6K/EfCLBnmUdAw9vJlhZBNVtvK5NRPIFjRT9g5LDNk5WhqbZxr1OupS99
 Y52sfKB+WyB9s973tzvMCtI1RQm0AAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Karan Sanghavi <karansanghvi98@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731348885; l=1580;
 i=karansanghvi98@gmail.com; s=20241017; h=from:subject:message-id;
 bh=2TXJ1EmXXe6JGcHq0islC06ZuiS7W6be+KOSVMPiOMY=;
 b=XnSsGvh9arXwU0TzFneIvfBvnhGG3ywcwXCrVXSmtOIjjRf655y5J6qAlm7chmE39XOFBDzZe
 nUFfZpHEs26DRSdOnEKnl4vOjiv5k/rnxZz0tZkMGvmD1Uwys+tKhXs
X-Developer-Key: i=karansanghvi98@gmail.com; a=ed25519;
 pk=UAcbefT1C06npNVDJHdgpPqTm4WE9IhaA1fmJb3A37Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_101450_743679_58C5114C 
X-CRM114-Status: GOOD (  13.13  )
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

Initialize the pointer with NULL as mtk_drm_of_get_ddp_ep_cid
function might return before assigning value to next pointer
but yet further dereference to next can lead to some undefined
behavior as it may point to some invalid location.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
---
Coverity Message:
CID 1601557: (#1 of 1): Uninitialized pointer read (UNINIT)
3. uninit_use: Using uninitialized value next.

Coverity Link:
https://scan7.scan.coverity.com/#/project-view/10043/11354?selectedIssue=1601557
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..bc06c664e80f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -900,7 +900,7 @@ static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path
 					 const unsigned int **out_path,
 					 unsigned int *out_path_len)
 {
-	struct device_node *next, *prev, *vdo = dev->parent->of_node;
+	struct device_node *next = NULL, *prev, *vdo = dev->parent->of_node;
 	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
 	unsigned int *final_ddp_path;
 	unsigned short int idx = 0;

---
base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
change-id: 20241111-uninitializedpointer1601557-9803b725b6bd

Best regards,
-- 
Karan Sanghavi <karansanghvi98@gmail.com>


