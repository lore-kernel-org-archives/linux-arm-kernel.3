Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB84CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 04:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlEaJjXuqoZ1HAzBjMXk8fek5DSH2Rnu+HHF/ZX6DPI=; b=aCHtJmMqollIUs7k/Imf1wEqXT
	wvpMyrqmy6hrdlXHQ7HHqyMKbJJFyxYdLFDI5mG4Glsu1rdEtys0fgo2HiDkFo1TyPg+kZBGgI8PU
	9wNHdF5Y8psPSE+u4l2cfwUGd2ZZytn9sUUJvEOGZVsGi7isCKTEVGwcvUQ/QMR4FmaFXtIgtYrLd
	KOz6trLwj+aq+ocjdLfr/YnzAWjbdbztIh41fhq/IHOaJ9FYm91fCSlMqH+PwWBYrzkesnPyy1UPR
	PRlMTmolNBABqYon6qppYrDo3q5CGJxq6sxF4q4evNRdIKAHPHfFmqDoaWn/zhfwhEBL7F01WQpRI
	1X4PIb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umm1x-00000001PpR-0ehy;
	Fri, 15 Aug 2025 04:27:05 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlwj-00000001PJj-3o3G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 04:21:43 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-88432e20787so45958039f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 21:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755231701; x=1755836501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlEaJjXuqoZ1HAzBjMXk8fek5DSH2Rnu+HHF/ZX6DPI=;
        b=VkAia2lBcME6FdqqMjQ8ggSKybXEK8zE2sxwzHbNh1fgr/imO3QtNmD4onbyyIOIuL
         YSrHgt5AGZ2d9Wh10cvZZoI3lEwnm3nam5z7gbE6Gt0uAorSmcy8K/3El53hWOz+GRQ3
         0qH6cnpw3UYCJIDd685xl1G8nnL43bdBkdeXwJHAgbrrnQtbTaaueNmlRoNHMC4I2qrB
         I435u7KeY14rYcbiDPif0mXyVbgTvANgmf7WjZqAucOsZ+prQBWwIu4p7SRDSNKW0yMn
         /LVRVfxCYb6oyPwXe9yw8Vif6Lu1XGc2yihFhm15FekDWoGcNMK4B3FGyZEvg4XNcvcz
         6B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755231701; x=1755836501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlEaJjXuqoZ1HAzBjMXk8fek5DSH2Rnu+HHF/ZX6DPI=;
        b=NHwBMQE4dsliCSqjBV4326urxxwDtY3ZWtIBWI+VeV6lBUM5VEQ/sY5XXERsekj6Oy
         M3V4MiQSAoEffnsosSHDN0zza+Pp/pGDcs8ttMZhsCXcEBjptlqYl5sQ0Kle7mdRfs2Z
         2j9zg8ELvqmqSs95J8VF8SlkyzKp9vOGfjz3eG9YqIKqVeg4A0o4CU1mn77ouApX1HYU
         1yzREuDbhtitF9YcboN31YNQ/yOTrs2EmbO+vYl6m4Gx/J9SyH+gAr9eoTB5anuTpNih
         bYl1YPOuggEySITjbL2yHYUpvSHnIbpvnDIx8d8Bx00wJxfAsUEohsOQB6e4er2m4PAh
         6ySA==
X-Forwarded-Encrypted: i=1; AJvYcCVXP10ieoC+LooCu8Hc0iYGiPlMsWQmt2Fw0235cZm2bghE4ijTCtNjIXWOGyUw/JkWoUv4996Cy1wptz+fgSka@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ZDBhWJU9Lr8oYkA1MCJodW7/lPrpDe4Him7NufVk1qwuOK/M
	t2IfKUYh3XYwqn7nMQzqi+gK3ZRC3HG1EwURkObQnMGY0vfCaGPdC8yc
X-Gm-Gg: ASbGncsd/2rdWbxEQqOW2Uhoqq6M5pc+QV7uoowfpfqn4JU9xP64cOWF7VcQ7HhJuT0
	SwQV1DVvorRQUyo2v7Bv9aI6yWOnGnI5LpT0Q9iMiidpELDouY8++QkVpK8kReLOIsWlJY9bmXl
	Q+ly2vtQBeT2xFoixDNqqchhq2c4sLH2/s1o4vN4yw8VD2IIYDQcikYtIkIsazCjAJwBRN1k+5T
	bG+4qrUe0j6TM9nEGfxRRBT7GzagmcYv0wqTzYIedG0zHjwB08oRnRzhrlyWQ/0ArcFFA9GE29j
	SpmrlPFcIoWL8uypXD4ms0tdU6MdFE8Gbd4lnkXjHQo7lyPsUEiGseWkk/5tSNr1HYG1eYU09Ox
	wsbPS8LAQB3sRUlHL87z0fR089EKXbg9vs5PWeDvgdu2BfBhqCN96aOa6ey1f9zYszGY=
X-Google-Smtp-Source: AGHT+IEIJY5yuuiRjS3rmxW+Q4bh6AhCH/5DK0O/b/9BcnO1EB5P9I1mqCzp66//AjqmuCTsfBOb3A==
X-Received: by 2002:a92:ca4f:0:b0:3e5:6882:6604 with SMTP id e9e14a558f8ab-3e57e8a7acfmr12847365ab.15.1755231701056;
        Thu, 14 Aug 2025 21:21:41 -0700 (PDT)
Received: from localhost.localdomain (65-128-248-47.mpls.qwest.net. [65.128.248.47])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e57e5a585esm1689365ab.16.2025.08.14.21.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 21:21:40 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shimrrashai@gmail.com
Subject: [PATCH 1/3] ASoC: es8323: remove DAC enablement write from es8323_probe
Date: Thu, 14 Aug 2025 23:20:21 -0500
Message-ID: <20250815042023.115485-2-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250815042023.115485-1-shimrrashai@gmail.com>
References: <20250815042023.115485-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_212141_949528_8DB7A5CB 
X-CRM114-Status: GOOD (  11.23  )
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

Remove initialization of the DAC and mixer enablement bits from the
es8323_probe routine. This really should be handled by the DAPM
subsystem.

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
 sound/soc/codecs/es8323.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index a98229981..194720e4d 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -632,7 +632,6 @@ static int es8323_probe(struct snd_soc_component *component)
 
 	snd_soc_component_write(component, ES8323_CONTROL2, 0x60);
 	snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
-	snd_soc_component_write(component, ES8323_DACCONTROL17, 0xB8);
 
 	return 0;
 }
-- 
2.48.1


