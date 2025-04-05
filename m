Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FF5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vhjgPM25WIrJtvsOvWD9TP3Lhl6m8KVBdL4zwgprPU=; b=NpTbQSbHUJR5mMcZo/sqjzc0fS
	FtK4ZNnJD4Joi+0dvNrcbsa2snPrpO7uSs0pU/9j1ApOUU2dEAAYFq9ogdkhKC+pGc3ssxCH4O1jB
	h9ow5tqsHfmJPcglA5/XTR+wjCn62PPAujYodIlevfDGmnIstR2vq0ebQcoVmsXiLhJTgYCfV7nxG
	hCtqyhosp5W1dcf4cG2qOyPgarCxe21a6VrRkbDSOk9Tj4eSPCQh/ljfviSN5fLjsOGy+HXSx8cX4
	jZJ1gRoX2MYH2DPeLqmCeTiZwhNV7V6ezi+HuZMPQsLj2SpC2NGks07VsNWCCjfRtEvOv1+AgU+qf
	l5XQgUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0zru-0000000Dm4L-1qPA;
	Sat, 05 Apr 2025 09:31:14 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0zoT-0000000Dlbp-29wl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 09:27:42 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab78e6edb99so407408466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845260; x=1744450060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vhjgPM25WIrJtvsOvWD9TP3Lhl6m8KVBdL4zwgprPU=;
        b=DfgQHYYH58lUqh8O3o5/0Hy5IHRFiIPhq+9vkM+YqWWeknscE6ooWCi0IZhpCcnLu0
         7x/KSG3gy+HvGR/HGECgjhDjx5WyKkGW9ulV2bB1wAs5jUfQlNco/nInuZAxetn/6Sg+
         /Hnt7d3BThiUBGQ3OcKVcxgJ0dT70nxGSohvw+j3AP7frckyl4kIM3RiqoJtOnC+4M1C
         LjmqSfl5w91ShNSHsiSzxv9/lJ6kk5UFaOVG/XxKcYec4Haw7w5Xn82A0yhw3h0jNF6n
         QGnzH8kb5LOfnriOQSTdd/ykodslkbPVhGt8PAckOfI/6+welehYkipJ/l2g4NaSqhff
         o0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845260; x=1744450060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vhjgPM25WIrJtvsOvWD9TP3Lhl6m8KVBdL4zwgprPU=;
        b=o5ERWfEzcp9rhi8VnJzMZlNrz4OvzlHO779YeFu9CjlUOBi5nBiWfpxOyfhAkLv21e
         2oG4ZaCuI3dcrWW38BhZfgJeWTEgcHxObA33zxK4PXldwA/U56Y/zLOq1aBUaMP1L+Jp
         UukPvnb8+u/bkwi+rm+vNsExJtCj5mFV2tEe4SZBAylIFVix+oVjPfwG9UOab8LJzMFk
         nj0U3fdXKJ487nQqD0b2LS7++8YQmiifkvyCuu0hQcisvov62/66RIyH+7JQjVbbCiW8
         O+Qg+jteMtS5GLdiU6O/wiSv1uLyczk77bU3b8JU361CjD8M0RAKKun8YL38ohyNBuIu
         4QTg==
X-Forwarded-Encrypted: i=1; AJvYcCV3OuHEzSb8gUq6FvaVZq2d3wEjwf9mu1k8s0BzZ9sd1pOGNW/aUJGGOoJCIMjZdnCpyoAAECspS7Id4atcsrQD@lists.infradead.org
X-Gm-Message-State: AOJu0YxYy1r+wDUEKr/KOwokaUbpmgYO8Tv5hVNdH05bFS2sndEh7ZNX
	w2x4VEnEkq4xgFWRlYdRi2NFbK1hbOYXVEQetuSBSADrw/JGizBVy7kU4UoOuaw=
X-Gm-Gg: ASbGncv60vNu0qRURrHYXV8QaQymZov8WII7KdhrR9KnjloPtQUdJsw4PeYp4sIzvAm
	PF7uvZNHpEH887D31TO4UWENzfQvfZLUScEDDx48TiJoQRnRiVmTMPO+Ppr8eY1l6TFL6xZGu0W
	BzSmfH63sCt4nFniWN2aa/czR8D9/wdHeBJM/HOp1WR/bbaLyHdl55Gh679rhA3pCCYGoC30m8E
	bBwDhA3JfKOjs3iLxFQX+3Qrm20cMmeBjOO08L9yGSFWTvrfBnoSvfa/L/OlcI5pQEpMLc/MW3E
	x4FJJBtCDrNZ5WjHooX/BuMP/Ie5P20y5l+2vWmnAB1ij9n6Bg==
X-Google-Smtp-Source: AGHT+IGxU6AQk/lGxA5BuJalTi4YDJdWHCrI3Gxv3qwNMs4ENzrJKR1Xxmjq53bryBeUQ1gqPpBg8A==
X-Received: by 2002:a17:906:f588:b0:ac7:7526:46a7 with SMTP id a640c23a62f3a-ac7d6c9f9f8mr456183566b.1.1743845259603;
        Sat, 05 Apr 2025 02:27:39 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfe5d3d8sm392574566b.31.2025.04.05.02.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:27:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] pwm: stm32: Search an appropriate duty_cycle if period cannot be modified
Date: Sat,  5 Apr 2025 11:27:13 +0200
Message-ID: <f0c50df31daa3d6069bfa8d7fb3e71fae241b026.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=kHydnSM0ULFQvWKEWgBJvoEZ4DMOWEDjsKpnVZckxBc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pd1OuSd8laVmWsGMsZDQ3jElzoOQdmOU0iVj Pfwnc8P+kaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3dQAKCRCPgPtYfRL+ Tkw/B/9jCyatQhCnULqdSAYE6atXCRb8xNFBivDhozOExipctqkbMkUxZN9AKJ1YgwFfWHLNl0z PUSP8gpGwtEQUxTzzp2s5toba5GXknwV0rO6+9YdTjf5SlLRVO9Vuru9m3Z6I67iUD7FG+8/20T hftKLgmwm1MFOxcN1nEr+5L9o9Il8jAkXqLMNWPtkiKBFDz3s4WDY6Utex2YaiDmbUdYGJTUOuM 3kXU1Dbmc9xQDzmoJPIU+ivoT7mGih87U1/i4W7s2iaJbgDM7KXly4D591nvm3oGGu9BMh4DKEn 9z21R0ghSUi0Z2k+g2BOV3Esx3ZQWrT//64X88x1buPhHoD6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_022741_552757_F14C3B7A 
X-CRM114-Status: GOOD (  15.33  )
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

If another channel is already enabled period must not be modified. If
the requested period is smaller than this unchangable period the driver
is still supposed to search a duty_cycle according to the usual rounding
rules.

So don't set the duty_cycle to 0 but continue to determine an
appropriate value for ccr.

Fixes: deaba9cff809 ("pwm: stm32: Implementation of the waveform callbacks")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-stm32.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index a59de4de18b6..ec2c05c9ee7a 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -103,22 +103,16 @@ static int stm32_pwm_round_waveform_tohw(struct pwm_chip *chip,
 		if (ret)
 			goto out;
 
-		/*
-		 * calculate the best value for ARR for the given PSC, refuse if
-		 * the resulting period gets bigger than the requested one.
-		 */
 		arr = mul_u64_u64_div_u64(wf->period_length_ns, rate,
 					  (u64)NSEC_PER_SEC * (wfhw->psc + 1));
 		if (arr <= wfhw->arr) {
 			/*
-			 * requested period is small than the currently
+			 * requested period is smaller than the currently
 			 * configured and unchangable period, report back the smallest
-			 * possible period, i.e. the current state; Initialize
-			 * ccr to anything valid.
+			 * possible period, i.e. the current state and return 1
+			 * to indicate the wrong rounding direction.
 			 */
-			wfhw->ccr = 0;
 			ret = 1;
-			goto out;
 		}
 
 	} else {
-- 
2.47.2


