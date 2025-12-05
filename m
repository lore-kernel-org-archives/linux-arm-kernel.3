Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CECDD2F7EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 12:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om/cMeG15+uH3BDN4RH9PI4d5N4TSJ2+dVbkHS9xaeo=; b=qcTzeT7ovCFe0SOiFmVxJ2HCOM
	a1SP3Ldlj+eBrIXlwOr9viJTSIpLSiAWeNtAntTKVguDGMNjVWpFlUc0jEti1Wehqh3AiOeVindOk
	NieK2qjpOi+Zed6oDQj42ItIKtOac+DepbZHj9n+6keViUnyUWMinPly26bWUQfl067sktxmGrQcK
	ZFmQP6pBkDutssUwm9+uDlcajc8g2CWDJJwDhCYPBbnPIo3Z3CtszsZJr8czgHteEH22q8YSh6gog
	sWripkKJfRJgQ4+ArDAf3NKbGFYDeRvOD2qNTiQMjeATMRF3Y3a0hssjPbbS1tD4HyGsEcMTFAq6l
	iZFs9n5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRV4w-00000009UEI-3wBJ;
	Fri, 05 Dec 2025 12:38:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRV4u-00000009UDl-3Hib
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 12:38:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5958931c9c7so2502771e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 04:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764938307; x=1765543107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=om/cMeG15+uH3BDN4RH9PI4d5N4TSJ2+dVbkHS9xaeo=;
        b=DnqvYyI1fvV5C/4GhJBJxpLHA6TaTOk2rlvyzcPZpFU04TJJTLcw/vv16AGM4ih6Cz
         bdhCssS5OP4bL6y72/gChdhybNbMkiwu2qMd7tAw79kE6occ/VvTUJbsG4WhZCCuuQ/i
         yY0VpWdumaa8GfjLK3jz0GpJ9O8Y+oHSVei1ffwKc6rNDot4HvjNf76cXzpA9+SZJHaX
         8obm11feOE1SPPTYkTBEtW79r72PIbG3bX/OCaJans/IsEB8VTO44sauV3cbkEig4JxR
         h3dKS0b8s96RE00ftkIYrWu68rlbCSWmb+Ymv05t0Ol200b9H2BYgpCKecRZ/RVs9o6W
         28NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764938307; x=1765543107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=om/cMeG15+uH3BDN4RH9PI4d5N4TSJ2+dVbkHS9xaeo=;
        b=NB9yWXFH3I2BdaX+sABwHRy8f+G+pCgfGybRNPq4VphzaJYF9XqdrQlD5u4nujIRJ8
         aMZH/mFmXn/L2G+E+Jszpu01lILfx1pX7a8ueS+rQvH8RJOjKxk/+xmYYmDCEUnH3DBN
         MfIoFn8GwwBT63NnNz59BjxUX3AskWcepq3c9hI7ZN+m9EWWplG+6uY4/FQMCzNKNC4E
         32VzUm0r9NKtr/XOe7EseyGjqiH9id4265fJfBw5wzV2r24x/wBUgQeMwil/7DscYzhs
         vYCHZ4DIx3p09QKM3Wg5cZhI3T6NVGN+PNy9hl0plvC7hMP1pXXaShIZlyOVJKFa/4f1
         tGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1NuvKzZlS4DqTU3z8XuQ/K1GCd/4fFSyKrY9/7gv9qSr7TzZQqqyDPi06SJTRYPT99MSLM2PtLSvTx0aeKlSE@lists.infradead.org
X-Gm-Message-State: AOJu0YwR9wWH+4nw+5mWVRAqfDKr+g/JWusUKo/MFSDsmlR87I/eS7f1
	lRt09ZTBEwxj/xZuxy0GftkWooXdT9KPZxOE6jOkJkmDB57yvOEG2eW2aWRwOB5eE58=
X-Gm-Gg: ASbGncs3ysreerRZHb2WkqYpC9bYf0qakzFASZ+nl7nqqQGllswMSAhEIJwJ1fqzlkI
	LfMTkn4vEAZXf/5Jsh8R+z1WYqx8rrEXozPeChMz/emi1J+kqeicZpQAKCGpFhXWtnKidDXAFJ4
	BHqL2NPYZS31Qut6Fkx76u5B55oX4RzCTdH+epRy1zhpQKXahVqYZDKjPKJAb1flsNCRzj8i+5u
	g6702smBZEthjfT2BTEFPsi88kDisH9y08IfC4i2HznSeucnBif6RgAx/bMsk06P42SQ6VX+q3U
	z/I2Tk9xarcdkUZA3JPPAH+z5rFSIVP1DTnmZoH2hprRgY7m6ozz5UcYLPpjQdymcFhXcS1eL0L
	zDUeh0T6woMROjfiNd8apFmV5F8W8NQceC4UVnNavI+2rYOgn5M8MtzNJ3+tn6MgFc9oUjZuJoQ
	/GU3aZ61Z9108qquN/qrBL8H1ggBiBd4Tnzgm4OMckpBfh
X-Google-Smtp-Source: AGHT+IGtYnj9jiu7muloz7dbfG4ZFq4BxsOy0KSiABI/FVyASbXwFy6IXZLRiaF5QzQ0YklTxWXgoA==
X-Received: by 2002:a05:6512:1558:b0:597:ddd8:cce9 with SMTP id 2adb3069b0e04-597ddd8cea8mr420850e87.25.1764938306636;
        Fri, 05 Dec 2025 04:38:26 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a3d9sm1462351e87.4.2025.12.05.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 04:38:26 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Bill Mills <bill.mills@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	stable@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
Date: Fri,  5 Dec 2025 14:37:50 +0200
Message-ID: <20251205123751.2257694-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_043828_840860_B4636A2B 
X-CRM114-Status: GOOD (  11.58  )
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

From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>

Use RG16 buffer format for fbdev emulation. Fbdev backend is being used
by Mali 400 userspace driver which expects 16 bit RGB pixel color format.
This change should not affect console or other fbdev applications as we
still have plenty of colors left.

Cc: Bill Mills <bill.mills@linaro.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: stable@vger.kernel.org
Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 2bee0a2275ede..ccc35cacd10cb 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -525,7 +525,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 		goto err_poll_fini;
 
 	/* Initialize fbdev generic emulation. */
-	drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB888);
+	drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB565);
 
 	return 0;
 
-- 
2.34.1


