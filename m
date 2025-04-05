Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D2CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 09:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZnZ1QBH4c/cR2r7Z2I0IWQDQQpPtp/xF22TjNG8zFs=; b=WhgiOKpfr5f+hoYIOGbyLb3Ftd
	6G9M14p4y1v5CSOn7qb9wQWGwhhPA4N5b0QYMdhAFDf9PRix5wUPJhWU2GsamZXJvDLQxXdS+nSou
	FvH7Qb0/dnuXYG0I5hPkQHeqydpO+gN+WgiH3dT1e8qBUMlhkI3EFCBFP9iqSuNfp2NPanfeIWaD9
	jKev85Ntmuo+UCAKhV6YE/Z5VHf9jEaU0rmHde4WF7amVRrW3uA2pejyHnjoYjEvz9FRvMCF71Wv3
	S92c1LYxEZ7OHdLrO6wwxIZsJ9WGNvs4J5QcUhHu4gtjLdEBgu8epgNrHZXLg79srd8eI31ZvG8nN
	X5CZR1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0zvK-0000000DmPJ-3Ok7;
	Sat, 05 Apr 2025 09:34:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0zoW-0000000DlcW-3MMU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 09:27:45 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso3815907a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845263; x=1744450063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZnZ1QBH4c/cR2r7Z2I0IWQDQQpPtp/xF22TjNG8zFs=;
        b=xClEUknQp9600dQRmlz6Rh852otuKkgnpoDu1IGtc+Ap83j91LSLgWtgjnI0nYDZrJ
         7SpnMS7KA5gf6vUDOALXHeGuahxutngIEdElk4Yfs66/2dfQtoBPltkrC8IsME66XZ/Q
         LJ3F1p6B1Dh1VTZqE3jX6NoOeJfS7G7finBUvm1+gv/vVJEMFfZ5EbnRay7aaF1/rzwf
         /IYrXbLBfKLGjYiZ30/AFLyyqH3NYENcqwqxUFpvBB+dTexQZQzgACz3vUtk5nh5nknl
         Nn6LLmppCm1/11kTqzNUEjDlIakz3IGAE7FSB8EPX3fIz+25Po8eznC6gWvC6Gv26oZW
         JFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845263; x=1744450063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZnZ1QBH4c/cR2r7Z2I0IWQDQQpPtp/xF22TjNG8zFs=;
        b=nmFvLeWcAjaUdsFg1YVAPsMvg5tKEocbdQPLbkp/W66K4MZ2GaPu5Mg+ORbaCLIXFw
         hnUBxD5mPgAUlQNLhk7gsKPHbUISbdFUcT9B3bJRN2i6Oc3eDCf0pruFX7DOOmGoYpzt
         pAnLE3LnZBdNEXUFww6yDjL4fpfQyV+9sUyCwmfzpzSsIvpXQiLyGIX04whb1UqassuI
         DABJ5kGUWSWzjeFzbflpUfQk3T0xjQhKH2bHiqx8yXbjeTCLQqwmtyVAmEf5ClBtGsuV
         iyV8BNFLl/x59vHcmV61NmmPhkaJbInM8ASHB7RrGerukZ8cBvnAxJMLP5vCi10Tssv3
         HZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Q1S0FY/PuMRpq8PzqD8M7ivYI04MoSmgGD2JI38kqeAYt07bW4XaVjxstSH2UhkBNsdSR+BLiDNLDhRTKmH8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx76NZUnC4EuJe59d/ymo975Nxz+lMlu1r5S+zTWyrVAHs2Ivs2
	/UlXfQAyR0NlMF4TkXxxvwXQd6hVKFQplLyZcy+GO61zF36SlZEfzLG4TUMqtHE=
X-Gm-Gg: ASbGnct4YQH0MkYN63SVX+H8TOA4sGHegtfsItKYda/UROLWMxgokpF9YbZ50wQAoXN
	z2c/5Y7Mpb5aaY8BJkFyAVjt18mdccTy4OaLMzpJElRhqRcbthwr7UYshJuES/HhP6IF0kCHroq
	X8v+6seb/68BAgq5HYKW7+MievEtjdfMeelAI/ey5+dzHMR1LBLNB+hR/nM3INOzoSSJKYzTN5F
	aCrLqlPmBpZxqN2QlVCPE2v06Q1FBY9i8ANLdU1/ZKCQRBFMSqBdMqtVVwoHYwGvl7qL000rR8v
	AKh99ggh2zFiinPXo6d1+DPreeFAQx6C4wJs4JhiS1XEFM/VZQ==
X-Google-Smtp-Source: AGHT+IGWO7dBoEwfH+vhvetzVchvOebwHG0LSEkTGJ+mVXy0B0Ix45di+z7EJEIkw1x3jHja6bWBjg==
X-Received: by 2002:a17:907:7f07:b0:ac3:8a3a:e924 with SMTP id a640c23a62f3a-ac7d19903fdmr555132166b.39.1743845263101;
        Sat, 05 Apr 2025 02:27:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfea0eadsm394579766b.67.2025.04.05.02.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:27:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] pwm: stm32: Emit debug output also for corner cases of the rounding callbacks
Date: Sat,  5 Apr 2025 11:27:15 +0200
Message-ID: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=PeMUN5MaPR/iihGuaAYk1+RqNZDBvhqS1HijQAO+fo4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pd6gBS/U7sm8gCc++Qe+H9FPvkAFOyatKX8B qZYNTVb/8WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3egAKCRCPgPtYfRL+ TiyKB/0dJZmWMtAaRs0WJ3PXT9d3VqFRF+ApoExKeBVC+2ES9YhZvF7McGhAzK48ik7Ly+LbIdd Il/cB2eBN8HrWNjZoHv/RVydoIwXGPyxm+7EVsFLjp6QVEbKfRjnonbncS3QTgmSKMIUL6e6JSC Exlph+FquJCDEjgnQZiyDNnKFMpId9mwZfG4STy0nFW4ohy/2CIVisdMr+VJ/Ku9COUq3a/FB+F QNpy10ntJAQfeJnxjycByIlnMBpPR+ouavHhm3lAae1baYZOSbounM633kPFBC43UuT9ehZ8ryi RmE7IGRwAQ/z49wXa8pqeOAbyygY5+bxUJ0PuQwUNrsaJoRK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_022744_836356_8A91C9FE 
X-CRM114-Status: GOOD (  12.08  )
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

When you're interested in the actual register settings the driver
chooses or interprets you want to see them also for calls that hit
corner cases.

Make sure that all calls to stm32_pwm_round_waveform_tohw() and
stm32_pwm_round_waveform_fromhw() emit the debug message about the
register settings.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-stm32.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index c6625f51a199..dca5d09d80b9 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -180,11 +180,11 @@ static int stm32_pwm_round_waveform_tohw(struct pwm_chip *chip,
 
 	wfhw->ccr = min_t(u64, ccr, wfhw->arr + 1);
 
+out:
 	dev_dbg(&chip->dev, "pwm#%u: %lld/%lld [+%lld] @%lu -> CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x\n",
 		pwm->hwpwm, wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns,
 		rate, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr);
 
-out:
 	clk_disable(priv->clk);
 
 	return ret;
@@ -236,17 +236,16 @@ static int stm32_pwm_round_waveform_fromhw(struct pwm_chip *chip,
 			wf->duty_length_ns = ccr_ns;
 			wf->duty_offset_ns = 0;
 		}
-
-		dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
-			pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
-			wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns);
-
 	} else {
 		*wf = (struct pwm_waveform){
 			.period_length_ns = 0,
 		};
 	}
 
+	dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
+		pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
+		wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns);
+
 	return 0;
 }
 
-- 
2.47.2


