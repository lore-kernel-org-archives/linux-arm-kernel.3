Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03899C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bidGXEhWbEsWi+5Sth126LejibvpIMLA/P72ifY2Y/8=; b=tU77aGFxiMNYSt2U2FGtHLvqjC
	YP6iVc7KUwx8KLrRI8HB0pa95BIio225mF1GxKEdGzy4ctl34o+r/uv5Jg20CTyyu2YQgb6KXncLu
	xqLn+fsGD9934thHdfSuVamm4AYcXaRYKIJ+Ay8/jfdpk4hDV959FGLnV/m3qrXl5sgCzvPW6bkbH
	6U+B9t6hC2Bd6XOGCkoKIH6dTJmL5T0AwRmgDRnl00vdDLeRMIpXU1FcCZSEZgaN5Bez3IudPpYyv
	suwGiUAhr1hdoRMemzBSpnKj+r1EidR/hunX5G1XVMd1+cll6E+n5ku4FTjpEB9fsTh+29HqAVPoD
	SdinGBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavg2-0000000CNr3-0SE9;
	Thu, 23 Jan 2025 11:47:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavYU-0000000CM4E-27qe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:39:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso1175487a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632366; x=1738237166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bidGXEhWbEsWi+5Sth126LejibvpIMLA/P72ifY2Y/8=;
        b=KKK1VOzichGv42zXVnI09nSbiAczw7PDuAJz1umzHWqmJuiFo/3iqOJHJ2jOcHT5eU
         6rlCL5DV3Xf7yWoSB6LY9N1gO1rUeC+9Pk1TpkNnor0uygB7veTDaHGuk86H3utXlbXC
         BxH7zABXpQ9GscjvN44KSZnyWLdojKRfmv90c9+6wgucnapjx5V8+nT0QPd9OIvk3NhA
         91wXF/dvnS/P3oTVPjzBcdXU9Qac+fYsoiowK0j4ft4KmGiNZ97MMV+gEcLc/EYqZU7q
         tZt9Ur6P/gWsbVSFVomVxC5SHJC9WbzOKGiBA9EzrtgzubNNnFsobMXBuhZXCpUGOQC4
         Vbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632366; x=1738237166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bidGXEhWbEsWi+5Sth126LejibvpIMLA/P72ifY2Y/8=;
        b=scEAqJlNZ8puKFKb5H/v4n7HnsjbL6W320dyZndGAQPdnvS/La2eWx+y2et2v6wWcl
         nn/9YlIXufQR7JH5if5Q3n1mkLlnZcX1nGZ9M4hJspImXN3S6xzFh7MbXfDAUkUJxjnC
         X/TV+5w55IB0UzliqUMhsuZbLi11OUNT1GRG3mDM5MMSvIZUhf/+Oe+NIi1/mpev9qcN
         WEywAsFarEyoR8WDo1vGS0b4MWQ4fxMNpDWewXFhgxrluiaPQTWvZeoRb30sMonmX1Gv
         CuiuVZTpLFEw2dPXjsmsMM+NiS3og+PFP6H6vKgqI2AjbcZsSKm3sinTgShNdtLOh1et
         pPOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqwmmiYrmkRWiT/W7Bf5WpQIOSgA7ovhNAozLCT92nC0X2Eptv216n+ZXVLwIwVP3xofrzjXGQt6FOQPp0I0/y@lists.infradead.org
X-Gm-Message-State: AOJu0YzXNm4SWafGWOjOX6Wf9VbM4+5WwU4AugqqhSgBpbEYux/KqMuQ
	a9JM0SHn7X/emKMCDKGxIu0sJoEYVyLw9XATYHHT9iimbuaJaxBWftnS6mz85hI=
X-Gm-Gg: ASbGnctv0bWopwoSVMgooUUfe8FXdSGMAY3cnve0OpjcNsY0gy01FjObaEAy06GNtyD
	IsKjZ7ptWK35Fgc92ZhOfbITaHwqOXvxATtkQlAI6DIcpqZCUpkcFaO1/gZionRLLXzaPV06GBz
	AtAnvoft8MvS85UEGcn+5UkZrzqzonydKEc8lEocYYa5u56hXwUzyh79wIZOToCy1T9ZA8DDWm9
	1TvoqMazBgZkzgOv/rn12Zpp9xgP9dbopswTv2tJZf1yc6Oo12EVQCRatBiDd341fH3/5R1YNeq
	u4bipiM=
X-Google-Smtp-Source: AGHT+IHMoaj306mgy718YKGGZ2ZKiv1T27I/McQDNCDh5aizBvwSBcMBEOMZ/suJHkPkfqgWyPwUEA==
X-Received: by 2002:a17:90b:37ce:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2f782d6f0b9mr39599393a91.33.1737632365880;
        Thu, 23 Jan 2025 03:39:25 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdd309d91sm12546450a12.48.2025.01.23.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:39:25 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/33] cpufreq: scpi: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:06:01 +0530
Message-Id: <2b89078adc1472d5ab9377ad7675cf4c07a8f7cc.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033926_541423_B21A8D96 
X-CRM114-Status: GOOD (  10.19  )
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

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/scpi-cpufreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index cd89c1b9832c..54574978986c 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -183,7 +183,6 @@ static struct cpufreq_driver scpi_cpufreq_driver = {
 		  CPUFREQ_NEED_INITIAL_FREQ_CHECK |
 		  CPUFREQ_IS_COOLING_DEV,
 	.verify	= cpufreq_generic_frequency_table_verify,
-	.attr	= cpufreq_generic_attr,
 	.get	= scpi_cpufreq_get_rate,
 	.init	= scpi_cpufreq_init,
 	.exit	= scpi_cpufreq_exit,
-- 
2.31.1.272.g89b43f80a514


