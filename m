Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981E1C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpVXuYPIOo1AMkujzDGS3Xg8DYJdil+zOZbNi+qKPE0=; b=z1+Xm9BEQmvw30vzTfrlSbqYgu
	grSdWlQVWyD5T5GwUyR+XVzrjYBhi9jXNwxfcSLHGIUzlsbKmH6d2799IqkmjcqfqKEostBkU5OV3
	3u4VCCrg46Gou5WlE3vosmbxzJcK9yuht4Ag5VQyzFukmu2QC8Z9jj5yIwFdAdqaBJO2/u7WXMDK3
	IO8tyk3bvRFhTIXyAv/DDn6FNA3H8y9zh8dbNq3GZyJI0zfLuEEc33FNO9mliHBPrifU+IVh99VS1
	RhyrI9/CQJuGnPIY4x5kN8cwjmcXl0SQXlBbQrCQS3/Ipo6Q28GcJOgTDmieIKkagk6LOAYWu/a41
	PQl2LqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavax-0000000CMdy-2FOu;
	Thu, 23 Jan 2025 11:41:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavXR-0000000CLnQ-3AwI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:38:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21649a7bcdcso12430695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632301; x=1738237101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpVXuYPIOo1AMkujzDGS3Xg8DYJdil+zOZbNi+qKPE0=;
        b=OaQWOknh5w4nF4Do5+aKw2XY66Dyqa4HWbyoMpbq4UEoEsv0ZPeqQlSDyUKJPH3MKP
         fPYIvU1r1vl8o7znJ1Kikk28a7sgtRCAvUcTDEf1rehZIgJ2u78/fq3nsG5/dAuhetaR
         zzclC6cpjko/dv0YDve52SAOoB+uZ9NnPzPsSLqEDs7S8dAKcODA3Jb6HG6sm4YPQU1n
         OnOGF+aoMhoUz1BWouhgtEQfFj4knZ2dANyF+xsP7uZk/yAOt1rDYqU5pzhfdvfoAI6U
         mYH0ePvNmIKdENMCEDVy1GR6y9Oze+SMRdHUuS1sJ4bVk6UvS4zr4YrOiMuXm0EnA9ip
         3uBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632301; x=1738237101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpVXuYPIOo1AMkujzDGS3Xg8DYJdil+zOZbNi+qKPE0=;
        b=ZBborRTgsB8MkBN6yEVmyOWqXrD1FIksfhtH6+qz3r51axJAj8U1UEOaSKO0meQVdV
         G4QMq0iiTQkbIgQWJ3jCKocaan8OrizjOgM0qWzjIJfsPNZYxEOR8x3O1rF2ZNg/mMnX
         vnhV/FvHMCbZJqIEb1wb3xejvx+z/F95lKYfUcykoxOpszBEpd/iCQtHGZhRRQH9Jg+A
         jkqIfM02IYXP7eZugaewrs4EgXjUBP+C2Q2BN+lhuWQanzeVsWlYPHLfK4b+Y0iz+622
         TUVs794bH6uXMwjgjIWHyGVO7frdDfsqWX6rUjTL/UWdJ+6mlqqBxKrN0WFW1u17tccd
         fFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdf8UJ3K1CspqzRWuNkFbxpV3yToyAcZf9bIDLAeLcyNcjJb+F63+ic+enNEtg2skFK0r8jBQwSPzZavQWpEut@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtb7hWIiq3UTwE+HKLq1cAvIS9zjRPCKUIOfi6J9RUaBTV0yIu
	KLorrF4EycU2EhybO3usw5Hf+fMIXXQvwGmlLLQxTjWfiO4AhxLC/gZooCQWXq8=
X-Gm-Gg: ASbGnctK1hYofuXavLIpc+AeBCBI8cAh8jKX4B2omxGJYLkZFaK5ZBJQKdVmKOdR3kl
	zIX/ndWS1Hp5j73uGkji9BWOpughR4OScr0yDn/gTXCKQQUmd7vTiPWG+9jDjicoAwDCGMntFmd
	6kdP2pGWEl0KMVYj+VoARrDBvgRgOyuWW4ewOA1W8rWDUfB3pyUEJU/fIjFKHfqNyXTgnYYPCCM
	A8E5moDVlm35HUJz7aiGwQAYz9s5Xqrwg4dMGT8Vfhc+c+SmGRXcUVIcdfi8UVA4izmUdyws5Kw
	ibfcuyQ=
X-Google-Smtp-Source: AGHT+IH/XL+a1IKlocNRJcPr/DB+WeQS0VytU2SOKmpvEEPtNpqG4MYiPimBgaGTBbIa0Va5cHYLyA==
X-Received: by 2002:a05:6a20:4307:b0:1e0:c8c5:9b1c with SMTP id adf61e73a8af0-1eb2145cb94mr39891344637.9.1737632300901;
        Thu, 23 Jan 2025 03:38:20 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdf0b7041sm10951980a12.75.2025.01.23.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:20 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/33] cpufreq: brcmstb: Stop setting common freq attributes
Date: Thu, 23 Jan 2025 17:05:42 +0530
Message-Id: <3e6d8f8ac58727a8ca4d2a57fd90600618085936.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033821_792007_D96254DA 
X-CRM114-Status: UNSURE (   9.97  )
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

The cpufreq core handles this now, the driver can skip setting it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/brcmstb-avs-cpufreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
index 2fd0f6be6fa3..7b841a086acc 100644
--- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
+++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
@@ -720,7 +720,6 @@ cpufreq_freq_attr_ro(brcm_avs_voltage);
 cpufreq_freq_attr_ro(brcm_avs_frequency);
 
 static struct freq_attr *brcm_avs_cpufreq_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
 	&brcm_avs_pstate,
 	&brcm_avs_mode,
 	&brcm_avs_pmap,
-- 
2.31.1.272.g89b43f80a514


