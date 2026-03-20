Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387951098796
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZOHGPk5doVf5PlHGyevPKUA2fqHQSdmXOjKYw+Hc8ik=; b=lBXGPfa0ZvOCtctEqRDtAXBfrZ
	sP+ayFpMTFvJtDWSL2YgTdynuP0tnbJbY86kef6ilpUMNvjdCPirKm2YojX0wA4nAvoKnK1pATRKn
	etKNpZ3IM5LUl+dN91Gx8q2iqzC5luNRZKryJqtmkTuLjcZglsWrG/JPVm5iGas7japOEfy1q406U
	rqz51zHO2JQKgPvP6pdGR0pZqkY/kgCS/446i/goDGlbAej69sVgQxBL6iXes2G4lotFJ3/Xkiuza
	QwpuLrMJs1IAHL/2gde3xg32692nKbk9q/sWD4D/JtuKcXlzplCKG0UyGbg5vW1JFFpxO5vgY6F6E
	nM+YqYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bZk-0000000D1Ia-3OzH;
	Fri, 20 Mar 2026 15:15:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bZj-0000000D1Hm-0fQd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:15:48 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-35a1cc6e478so1434415a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774019745; x=1774624545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOHGPk5doVf5PlHGyevPKUA2fqHQSdmXOjKYw+Hc8ik=;
        b=LkYn/AQb/hcN1/8iezR42M/8RPXEaZhpnuyMIXguwkDtqdS+Hj5Ryc5UGrrqthfSWD
         itvfgxuUfvxbNx4gzEJNnRU/xGQjXofhzkkPc/C5IBtxaV3F2FrISunwhbosl4JYKIbw
         H1kjlqIR3NXKMQR4iWw12M03E7PPROY+AZQ2T6UKrnw6SfZZGOdS2Kgii6UJ2cOI4YIm
         dmwAIJCKaBC284xzczbOVzVnvFa5MKmbvv3tlaXeFIKbIl3csnUxd/bp8/XDxBX5cFNN
         tH/iR0PsGAC7UofbG6Gy3Yn9onCzQsqQ4rTE00XzDBCd2JXi6qiaU/fDNR8/wRWyWnWP
         DdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774019745; x=1774624545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOHGPk5doVf5PlHGyevPKUA2fqHQSdmXOjKYw+Hc8ik=;
        b=TShGc+lExkYeUIwXgEoM+u3TzqUUzsFUL4elDZVAqXjod6zMkz3o631vAFctIvtnVS
         uiz6iAGESeSVEjpiCBN5g/u8ePYVhSDwkR0y0rmeatForLC57/Yt07J3k8tl7ktz8jgC
         w1T9ikPGKWTrI87VlkW8sqs6wvLE+xHeooZz8wpW3JOYY0RnsjfgFjeWZtDM5HnIi7kP
         DKcFL2km6LbUj06WPTRFffMOR4piMZ4DoDmduF0UbTFghBTfoI6Hxxj1dKIPdt+HMIkI
         WTj2+/7qAI/93tFbiWVOWBm8IAxfJr/tzA+0FPpSDheCuT4MlR9aNkvOB3PjYpRkuFJn
         1FYQ==
X-Gm-Message-State: AOJu0YzZaeyHt3dO3qHKYXXYc1EG0jmRNrHQoKS131c4kjFdsl+01jJB
	qS4G+MwFmN/bPcBNhRlxvedZKhGmECO27FlnhA2FqEHfA7IhnIRwrvW5A/c4Xw==
X-Gm-Gg: ATEYQzzb7ysvukw5LY9ptvypvE08/dXj9jXScJ4ecpqfe5SttsI+pYCGm3wNszMXIqY
	G7oERGCDWkjUi4hbDFs1cyklUwGgObtd9MRRKpRO9satfwfsJvylzlRga7usY5SKxQ3xMhVb7Zi
	gjfl8HQ3rgRdlJ5T68OPK9TOQdcalBA/TZ49pmyTUCv1nD7gEPWi5vqCh1Dfudxj+sAHwv2aaJH
	kGeOYwXXLMCIgGyGucOKSk/CWIpnVDmOs4eTRrnzNkH+qBVRAPhmMIeORXCk6CSNwBqeQ3or7zR
	NcErhMfCbc/fgLPB5aA5pojWhaIT5PH5eUBl8SBVnRj+u+Zmk+m7XGOu2axAfczbcqRaU74R4r2
	A9OPote5u80KsET5IyAjGMDdpl6iDh9i9u4y7flmfkJqqMH7fOAOkMIP0WaDp32nJMerhNC6Fui
	8KN05uR4YD4D/YxC54JPGNdmV40g==
X-Received: by 2002:a17:90b:5603:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-35bd2d35149mr2773896a91.33.1774019744963;
        Fri, 20 Mar 2026 08:15:44 -0700 (PDT)
Received: from Vivobook.. ([2401:e180:88b2:f091:d2bd:d651:8e5e:9b62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd3eb4bf5sm2284699a91.4.2026.03.20.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:15:44 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: linusw@kernel.org,
	laurent.pinchart@ideasonboard.com,
	matt.porter@linaro.org,
	syin@broadcom.com,
	csd@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2] pinctrl: abx500: Fix type of 'argument' variable
Date: Fri, 20 Mar 2026 23:15:06 +0800
Message-Id: <20260320151506.10679-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_081547_228306_8ED26416 
X-CRM114-Status: GOOD (  13.94  )
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

The argument variable is assigned the return value of
pinconf_to_config_argument(), which returns a u32. Change its type from
enum pin_config_param to unsigned int to correctly store the configuration
argument.

Fixes: 03b054e9696c ("pinctrl: Pass all configs to driver on pin_config_set()")
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
Changes in v2:
- Rebased on the latest mainline to fix the recipient list.
- Updated the variable type to match the commit message.
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index fc7ebeda8440..858fbaebcf8e 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -852,7 +852,7 @@ static int abx500_pin_config_set(struct pinctrl_dev *pctldev,
 	int ret = -EINVAL;
 	int i;
 	enum pin_config_param param;
-	enum pin_config_param argument;
+	unsigned int argument;
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-- 
2.34.1


