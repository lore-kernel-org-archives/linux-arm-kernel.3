Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A182C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62TGT2cJ8N53D9ZE5FWVLQuLK0YScVrC8nxALy7btwM=; b=lh6z1g3gQ+A14l90meCNpgI0X/
	UFphRNaZXj4iGg6jnUa0PSljHERD/ZKcUrgaUzlXW7e1X/aVfBoxSMSdgjVZj20FTyJlQbRgT650k
	Ncydf0L9ai7onnQ517SahBE5WDORh94O96F7T1+FgpoHL6oU/zNYWiDOrV+aobh66uNaJxM5x9qpg
	uC48oXARUYr1kPmw5xrrQT8tKJScH06CFTcwoC539cSGgmd95p1HDYVM9U1aZM6I+/fME0n62yUbG
	9bIkfUMPGjYYWMy7XL2ev2THxOZM9lhTP/xjFeib8VTH28931O4FDcXQvYgGiL+0wxCSfGGby0NJ+
	UzWMsyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnyj-00000004kXP-0eoo;
	Wed, 05 Feb 2025 22:34:41 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnps-00000004j4L-3W7h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:25:33 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4affab62589so75032137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 14:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794332; x=1739399132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62TGT2cJ8N53D9ZE5FWVLQuLK0YScVrC8nxALy7btwM=;
        b=nRIGfPLNAJx8cXBOSMO4Qt0g82g0iy2T/Qv5SnvbBW/IFuGeD8G2++w4igMlqXFXJU
         LOaXsq9Bav48eaQZ4adCwfjt/3ZzkV0WySup6m5Yr8sKqRv7+jlBBn8v2FKos63r9lTa
         IQhd5NgmpzcnYmlBvyYEqdbAZ8U/6HWOXdnMgAc3V2dAd7VbaHhRLN5oqAxEI1VEkMN1
         RWgIq2a1Z0ZgKtCZ/oPMfUldh8X4+Atjeh94AoRZ5fm29DJX2QTJ5PFjY7RX3/Jf7ri4
         3vLDffZTlrK1M3ZXMyyx2l1NRxYiFW1MpPVVf86ARna5OGN42GmVTPBIyojZVwRv3fsA
         DxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794332; x=1739399132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62TGT2cJ8N53D9ZE5FWVLQuLK0YScVrC8nxALy7btwM=;
        b=X8+wq8cqa17i3iCcFKXtAw5GTlHaZg2VuroT1OuF58c1HlcNkyuOxkB5QOh70WZeKO
         zn/RMGiKaLkKhfncLMihUCe7QQtECP8hjRZLoVoGg8NhaAXmT/yvZO3QGtoPc/uBOthT
         tOlNzx9fy92HC1gO36A5xV7LFJ8YFzNYa9+UiJLHeEiWS+yiVwwxSCl+GO0XMbcEE4Y+
         d2TCxvftiixfmlHQMrcaD0I9Y4+VBrRJNpieMv1sOMG/KJWlTN6mSOA+pGDqVbO7Qbqz
         9iTAz+QqEnlQ92c/EZBOPkM52AZ7vtDMWBEaWa2DjSH/Laz5ycALHGc18LpfhqKzaBo/
         aI3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnElO32v3YNN3rnVSu01o0mk0ZLm6DPS0XRr8Tki3w5O93mimfEk0fzBfArNu4O2N2/gxixnINzrWqAxcM+eM5@lists.infradead.org
X-Gm-Message-State: AOJu0Yznz6hcjq0LULOeHvLcwEde+KMX4na8Iy0KuFsvlnFbI24xzFW6
	wkBUsy80wSUh0HfbKXwfDFF0qJoFAjznpU5DxGNTHzIWq+eCIaWz
X-Gm-Gg: ASbGncuANuQNonMqD04K7XGtdkPm3Hvv6RMCfQOBAM+42hz0PMPw51FrYS0k5VMGA8s
	Ggda9wrrSR3mT2WQkfqvMJrla7dK28bYmqBra1UI2RyPkPuH9pQu1S1t3XkEtdad3uj/DiOxb0K
	xYoXC9a729cfNr+sxGzBIpKklo1uu0MtFFnTNs+DRK0mva/ul/fB8Cf8B+b+uZoPgkN7OneknQy
	Fk/dKOWQ2J8Xkx1XIGvDsNqpoTnreibfxFpTjS9if5vTLwwZBxD2QE9ZurjSxeK8mulT63sP4Aa
	88bvKmRCh42Mv/KpGfYlGGlfUdNTSihFK6m76eXrWco3gk3VjWiNcrAXJqOl4yRxkMhkXneUUT9
	/Kg==
X-Google-Smtp-Source: AGHT+IGvdgPJQLNk8VYsJILY0GbhobojYDagFzi9U9GlfgWpk9agg+4Z4umGvcSaLY4EEXsdXUXAcQ==
X-Received: by 2002:a05:6102:5121:b0:4b2:cca7:7d51 with SMTP id ada2fe7eead31-4ba47a68d02mr2571561137.19.1738794332017;
        Wed, 05 Feb 2025 14:25:32 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:31 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 6/9] dt-bindings: soc: samsung: exynos-sysreg: add compatibles peric0/1 sysreg for Exynos990
Date: Wed,  5 Feb 2025 22:22:20 +0000
Message-Id: <20250205222223.613-7-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_142532_881125_31D62EA5 
X-CRM114-Status: UNSURE (   9.92  )
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

Downstream from the Exynos990 kernel source it has more sysreg in flexpmu,
but for now only those two will be added

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index a75aef240..6ca3862b1 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -25,6 +25,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
-- 
2.47.1


