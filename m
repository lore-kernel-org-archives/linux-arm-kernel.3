Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D330C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gcS051l6b/8O+Is0vrcSeaFJGvMI4gz5XJTgTf8jE8=; b=gz3b+nxPDRMLQf0ufHBaKja3P8
	2IhoCPTCXKQ5yhkUb7gl4uCwUBiEVmP4uqkld8xg0E3o5lICb0iR1ZHO2DZe02hjxlTrDbXYNRVCX
	+CPtTXBnD9E4IujIZ/iI4xVPx2qJUAZithNn1PpLk+hGyNsHQb6o004QgwPSytTsTAOk1g3iNlGMa
	CnwwnHfZc/libYAXWKBEb0QbylRqlnSldVny2+sod1EgQ6GR91M2uyWj7Y53jTqo+l7UwHz7EqQnW
	b8oUykIrZL1yh4CmMP/KdPn/ghVCHFAiVZU5lI9dH9AvFhIfjCvjKfAYTTSwBxIAA1zPR5XVL4fTx
	eik5GJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Uto-00000007Cc0-07eo;
	Wed, 09 Apr 2025 12:51:24 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Uqt-00000007C7l-3mn8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:48:25 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-ad51f427054so4514423a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744202903; x=1744807703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gcS051l6b/8O+Is0vrcSeaFJGvMI4gz5XJTgTf8jE8=;
        b=Pzjyf7O7GpK5kres6F7GOc7iRQ0StiAYmNDqpeeUyQqxxXhvKg0sGs9skR0edFPkS0
         198fgQ+AgPQktS7hsAR0lzh9vW/GkmF61xP1+ryD2cxVUHXd4EUMgxQT+CvfTLqQ2hTm
         gjJf83CWhepoM/7l5pbIM8n8pX2WAcZ8PorSH2tZ+NI0A8GhxUSO2qHxeY13JUDXtzG7
         P5tfKmSeD0kc3+ZN8wrfAifcpIyEop9AH6papGI8PRvTVTf5PSa/k9MdEiZdylNigPC3
         5uuamQFern3UguvEREdz9j+0pH8zPIzlsqyfEVzdOn5TOWJC7f1a6/inXslIl8YTwNZ9
         aa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202903; x=1744807703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gcS051l6b/8O+Is0vrcSeaFJGvMI4gz5XJTgTf8jE8=;
        b=Q+1eqELJTXk1cMNwkPyU+jvfMml+iU2/mpZGM1orkhNj+OqFl9CYOHQX6RG9+kTjfh
         m7Winv0chWfpSA9y86K2/CMN+XAmpDweIXLa+5QKLb6WnZWrGnd9jhDXh8lFezG6zDMI
         H976AzlgoZDzTu5nE0OSkIGrq+DNRPTgFrZ56DRyD4IpS+FmrUoDvH8NQKhrbJQXJafq
         4SYAi07uLeH3bzFZc2drAONOxKACa9S0UibZ0OzBc6KIr37w63IfhTZe4OxZXaPdNJpi
         Oz5cRK8a7mwQr4PHMSJZeihwmCoCYbYyMxx0+N+xAPz3iwGXwHcJRCB2YPyYBXwKCRfI
         w93g==
X-Forwarded-Encrypted: i=1; AJvYcCUxtO3K1o0AGCt1DKHON+P0cwcGksFDsKdCcG0nToVArJc85DdyoFs+dgnLzxpFP76KWb3PziDNX5Lp9yO0fg8P@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7thfEv1hLcwIHuzW4ijIF2nvmQAdSNvWWuTs+YpwNo4iowvHg
	XA1yiCYY+0lW7wCgFSRTgqV5g6DpmmFBLFKRgb5NizdCbSThJfHj
X-Gm-Gg: ASbGnct1x2IM7RhS6GzLrwKuMrHY8mX/tlOUVXDEAsTebdkLmELZlUurXLy3+DJrIVB
	9WEpQwpoPQCPsoEX3Ja7PG18eJTHcrm0Bt5ui0g1Y6yjHvyFwXipRqEfxE3JuiOFyUY46KjBV0o
	tUiFyITXojjww7uiN53Np0+3DPNirDI5yLOWCXoVx9fUloS624EANuaFb8Jt2nW7LbHOAxrfzp5
	VjuZCyCvOcA6kIA8oruYJXtG3CmCX1aqi4vkHAbTProN1iv6vp82G0JSK/Yf7xB4Omo89TTUKf9
	P6MCJvA23yspDR8hzZo3VlvXkNZwQXbOoLWwkxPdmckLc+tFzF5u9bAyjut9h53k9M0=
X-Google-Smtp-Source: AGHT+IFsp1KO7SpkI4Baqzu+PaivIakGq5Ke0rYEIizxnBYl7OLpEKVhaHzNjOfd00JduABwQS6jww==
X-Received: by 2002:a05:6a20:d490:b0:1f0:e3df:fe1 with SMTP id adf61e73a8af0-2015ae8f37amr3086206637.4.1744202902625;
        Wed, 09 Apr 2025 05:48:22 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a11d2654sm1103588a12.35.2025.04.09.05.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:48:22 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: sven@svenpeter.dev,
	j@jannau.net,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] cpufreq: apple-soc: Fix null-ptr-deref in apple_soc_cpufreq_get_rate()
Date: Wed,  9 Apr 2025 20:48:13 +0800
Message-Id: <20250409124813.47193-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_054823_938886_C192FC43 
X-CRM114-Status: GOOD (  13.59  )
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

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. apple_soc_cpufreq_get_rate() does not check
for this case, which results in a NULL pointer dereference.

Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`

 drivers/cpufreq/apple-soc-cpufreq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4994c86feb57..b1d29b7af232 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -134,11 +134,17 @@ static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
 
 static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct apple_cpu_priv *priv = policy->driver_data;
+	struct cpufreq_policy *policy;
+	struct apple_cpu_priv *priv;
 	struct cpufreq_frequency_table *p;
 	unsigned int pstate;
 
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
+	priv = policy->driver_data;
+
 	if (priv->info->cur_pstate_mask) {
 		u32 reg = readl_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
 
-- 
2.34.1


