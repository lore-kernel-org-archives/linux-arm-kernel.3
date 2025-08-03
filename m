Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37599C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elSrGuxO7Gdrr9JiYJ8JX6gnRfA3s/NTbfdze1JVBo8=; b=Mt1T5ltK9wd3DQ80G51+LRphZK
	pyBDgGXw/A7eitb4esH9oGcL6poyzQNc1Ef43HTmQmWURZChzwZPHzto2FSzzqdYhtOzCIc3Jq6F4
	4ZjQUET5sghjDzbJ0GuGznJ+QkNedCffOveh+CDC1a+tABqZPlE2zF7dKw8gZf7lD/PQuPX28svSK
	ICNNatj7PxgjOu7gh6IgyTE1ik1Ahdk07aQ/ghR/7FKCffKSo/9k7QZ/h/C0PqL/q7W6NJlo65W8L
	Rj2qZLOhhnsq3Lnjm1JJS0muXoh6eRLNneIj/Bq+KcRBpKsI1aWkT/SfVIg6YbNzPnQ/6sNXTSgoK
	VUb0ctUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRvy-00000008QvX-0Chb;
	Sun, 03 Aug 2025 06:11:02 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsw-000000088n7-0EOJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:47 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3e3d7b135c2so40564575ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193585; x=1754798385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elSrGuxO7Gdrr9JiYJ8JX6gnRfA3s/NTbfdze1JVBo8=;
        b=juLC8dV5VodtAQvQRIc9R/a3KHhYH7+dBcLqtiiAmbFzmRnSpIWRx/4Ux+3hsqCSYh
         BPaKyv5hur0piZzP27TSgmoujADDiKsfkhx2VrPXi/ZWCF3CiTZ2HfeNoPe3VWjoNLLG
         d/TzrVAvZEv8f9m8RNHXWY0gEaMXMzDxFZKJTX83eCZTps9BE8MDUFIdcsEPFkacsBDI
         FlMNH0760h8lE+HIW/iflgzfi7lqI0NXdk4L/KFuFGv4ndAt4Ql5BNKDYmLHEm8PKVIo
         HqCHdaFxXcMnjBlNQuEoEjZRzIlsjuS/su4SFoACyKjUtq8yP1sJpSncIk8h+NmI8Fbd
         NhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193585; x=1754798385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elSrGuxO7Gdrr9JiYJ8JX6gnRfA3s/NTbfdze1JVBo8=;
        b=h3tP8BHfAeL5PDb2af6BC3aHfTEA2K7pVvwMFBsygd5tVQ5/R1rHYkx93ogYvRZQNT
         mkhat+6qipuXvCOcM6jEvCi48GbFH8WylBZTS+lzKqnA1K33y0ScVKKwTuPcKRchVWko
         6CArqUodXtfWqGxlVnezzDNuH4clKE79sPLaHSuEPnXOqb6sBkXvkvJMReKbLdzQsaol
         IL/hghPV95fuRfMLwJmZTPV290w3v+C5IBQsKOu0X9a+j8IwCPc+qBRw7a6xxJB9uOUu
         oeWWy4ZSdjL7peygvFVJ8TLxSwiVIjTVAw7X6/Jzz7h6zSebNcy6WZFZIIx1zrGKw4Wy
         t90Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqu83qjKfOX1JVPjizYJJ7Pd1nEVtvq7KJHGoO/jf0sMmJLVjUD7uEjGQoAMOkJlVywSy8lCd2a9JVCw24Qjbb@lists.infradead.org
X-Gm-Message-State: AOJu0YzGdc6U9DPoxhpFGD/TycyHLNVY6wUgR/1Pax3q27FB1tjIcJPH
	TDF58OgIICy2GH6dqyjFDuIufEiG9ipyU/frZxaao3w8bU3lCPwNN2ec
X-Gm-Gg: ASbGncuI698WE96Lueyycw/Xc3XzhoB198OE2qM1Eq/qCyom9LogKxM4vZIHEoOe+gC
	jqGkyjilBTsST+GJBMl31JnyLQHKK3+rs0rOvcJD8XfEUkv3v6gecseee7amayRT6imASutAX5B
	8ptlRlfbQAxgU/E0ocdY3Jkzth8+Qs1l5tiHyjiX+Us1UOs8kNSw7FjFJslKS3usjMRF4nIuFSu
	J5UR/A7jkYsDg3Id9NzUMxxrm0KDcqXZBPYV7O4yVndc/z2onee5hQBpIfisKtEFGj4i2BujAAt
	JvhJy/IMNnWc/nIG9arW6x7ps0mjFzvGnQjp+BG5Edf4jdIMlwNpvYOhoQ/cFr06rDxWDrZVa+F
	QBI1kXDvVzM7Sl0pomxZZlL8GJbdL15rOPJVcqjaFW3aXPzzXuHgbYgYVaJ6+Nr9uaMMroG93zD
	NJxw==
X-Google-Smtp-Source: AGHT+IH2v/yHbrftOiZCv+3aNfsvxCzIweIV2VBjxfjxpqhUxRJcHX4wYrnxPDdmodWbE9uh3slotg==
X-Received: by 2002:a05:6e02:1f0d:b0:3de:25cb:42cc with SMTP id e9e14a558f8ab-3e416192458mr92390555ab.10.1754193585333;
        Sat, 02 Aug 2025 20:59:45 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:45 -0700 (PDT)
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
Subject: [PATCH v4 49/58] drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
Date: Sat,  2 Aug 2025 21:58:07 -0600
Message-ID: <20250803035816.603405-50-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205946_091362_C37E3A59 
X-CRM114-Status: GOOD (  10.94  )
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

The vmwgfx driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 5205552b1970c..24e9f6fde1bbf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -259,6 +259,8 @@ static int vmw_probe(struct pci_dev *, const struct pci_device_id *);
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
 			      void *ptr);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(restrict_iommu, "Try to limit IOMMU usage for TTM pages");
 module_param_named(restrict_iommu, vmw_restrict_iommu, int, 0600);
 MODULE_PARM_DESC(force_coherent, "Force coherent TTM pages");
-- 
2.50.1


