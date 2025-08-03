Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB6CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwuwWG68g+QZ7vXSMh09UV2N2ibuGEdSUwCCEWlJHLI=; b=kJh69wDuBZ2cNAoJqa6YypsZSr
	emPPMecfnICtjuJJlc8gPW2jPQHfo0VwVF7oJUpCuRtQTECxZSrwxg32XhkNXpG2Z4EYIHcp72SR6
	5ZjAUJruh9kbBf0ZN3zKhusSuTonKmO9fVkSxIQlpvT5UIqZIOZKgZESVf7u/AXXYsTXrZp4yoB7N
	W7jdIygi5mIejqb4MPgDrQqQCps0rPSjj5AInxbiPrTCtaTfKaV3fhuhCd/1kozCSBmECU2oOfNG4
	Se+uUfO6pkehu+pjfpE5rp5IDQ/eIjnDCMOjL0yNd6ITjVlPb5l8qC/7NF9cZIWMLCB/L8gBX8FeE
	Dba+p1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRqr-00000008QXj-21tV;
	Sun, 03 Aug 2025 06:05:45 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPst-000000088l6-0Kmy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:45 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e3dbda56a5so9951825ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193582; x=1754798382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwuwWG68g+QZ7vXSMh09UV2N2ibuGEdSUwCCEWlJHLI=;
        b=RzLuTvtgxbMkVVzzb9qpO7tpgl/pl8OjnSORq0BSaykjx/NzKPg0GXw5VjB2oZ8v4K
         4z+cr62ZF43E/KJEfJu29VYAymfimqoi6hVOIMon2mb9MaDc2gHYxpL2XS6+vsCuswtJ
         grfAkmxvmU56jW2TJr6FPs1VM3Fb6sKBMyhwsO7Wp8VLKOtS31VfnZ9EKuAea3lYLt6h
         NBI5lH6auAAFEgux6xW8w5sP7eTZT8xX1wj6V7WfXmbitGB9han+q4wXHpIPl7EiW3q6
         qS4HLJNssPv0hkpbFnQ/QNBp7Xx9Nb94TDIGknYd5gqBQmVIRYVsB6JRNXwl5oM4xBob
         uDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193582; x=1754798382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwuwWG68g+QZ7vXSMh09UV2N2ibuGEdSUwCCEWlJHLI=;
        b=pOMGoUiRpc/qFBe0cHHZp6oBfCLQXfGe+WEWQ7tQ+Qw3uCBv3/8I1TQa3VAthua/O9
         ETWgCa5HbEn8SIICjCbm4kFKJz8T6/TE7qNS4tViFE42H1ZIOo9zaeRXMqVDNVzgZxij
         UFKx1pRQSEsBNcu5go0rSzC9it6pk+/xYj3MuzLyOoDNEykTVUK3hEi/4QeMnprl7XAh
         4vzMnM3xyXz6UfZhCFS4tPV96N1BAbpdvEsMi85hkraeRqmbUhrHwcbZVgqbxdnSEMaC
         FmyC5VsfcZJ4Uo+rU1u9WZlq7r2DjuWtikXsX6xy/FGNXZQ5i6BInqAzE9I6jybWbQQx
         pRew==
X-Forwarded-Encrypted: i=1; AJvYcCV41wHivPn+d9kk/AjQikLdn2xeBkEXzE2s+zp1Prj5inSYs6Y27bIbHpAF8V7r5L9Sj/m5Fd88ICK10oZxYCdo@lists.infradead.org
X-Gm-Message-State: AOJu0YzBpq6Hw1RerkStYMyDQoGOnSmHdSB3AuAxnzr+nYDRCwyVPShs
	NFzztQDyCfz2NjIvKxZh+tK5/dimeiq5xHyOvq8UFK7IQ0f17MeOMUoY
X-Gm-Gg: ASbGncs7KcXKM5+/4ENqf/g7beZTiKqOvOU+y/gn6iWI5O1XHe6U0oaGscJKlMRxHLD
	N2GXXteH9Z9vy0+b+aW7yKTaF8MY4VPrcpoeYowQTVYw8hQW7F10WI5FIfGvLW15v4EGuo8jk//
	gS5zOpxtP4LFmw01wm5SJz1yk1UKtD4T/3K2weZUCQHt9PUFyP+49isgDPfnjmTVtS2bLJ80Y4X
	1Uev4H4GrgXSOx7LGej2GWkgZRm/MqZpChrmC+7G6S3joK1Xv8GtOvfImUKmwj+YFXjCDRJQan0
	8ItnyMi02GxWDtUkVleMxc5gStwSGk27diEhoKZWVKjoG5dC4o1Kljm1h70b5sXz98MEu3DHff4
	CcEqP2ud96CRLSrv6NLDrBi9yHE1eqcF77cMURaY+oArfjeGY7V47GY5GHqRNk4XmXq4IdXzNo6
	AxXg==
X-Google-Smtp-Source: AGHT+IFaErFuUf9RL3fjjyrvGPnDiEq4WAlpEJt6vAzu9IAFkK0y610sccboRpj+vz07MAgou68UmQ==
X-Received: by 2002:a05:6e02:318a:b0:3e3:ee1d:58e with SMTP id e9e14a558f8ab-3e41611c04amr94519705ab.6.1754193582396;
        Sat, 02 Aug 2025 20:59:42 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 47/58] drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
Date: Sat,  2 Aug 2025 21:58:05 -0600
Message-ID: <20250803035816.603405-48-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205943_146836_69163EA3 
X-CRM114-Status: GOOD (  10.60  )
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

The gma500 has 126 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 85d3557c2eb9b..dc72388ed08d4 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -40,6 +40,8 @@
 static const struct drm_driver driver;
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * The table below contains a mapping of the PCI vendor ID and the PCI Device ID
  * to the different groups of PowerVR 5-series chip designs
-- 
2.50.1


