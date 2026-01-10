Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0713BD25024
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ssjVYpipcbS61pLDGCrSHNTsxktheeQ8WYFF+/B4GU=; b=U+EejZxhZ/3ZGh1mra3GM9gcA5
	y1UfXINiWzEz2Jd78vFQ1UfJUlNwd1zWMJN6OgYG6Wom/MjF6eOAMy+OHA+jePXz/VlENG7m3hCmQ
	ueFFjc9bxPKA/bTlmN7mLNGv0HOS+scQKX4wfE3hj2Avbeu8EUNICLLM6nyM+20W+QTLeF/81q+C9
	4u8ZHCMoBZg8cIM4693kyV64u8bv9qh63uKmQD62BoTl96kjn7xQ0/Yyptf/W9yf9gjFAeHyeOU7m
	tXtyXp+dJi1Wd/IR+AzELdGO7zBQUcl540ABxyfPx1sWKyqHt+QorSnWqPxSSZlgY8TOCoktrmxWu
	smx2YIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCg-00000003eew-0ra4;
	Sat, 10 Jan 2026 20:04:54 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCd-00000003ecA-1YXc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 20:04:52 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so7022852a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 12:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768075489; x=1768680289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ssjVYpipcbS61pLDGCrSHNTsxktheeQ8WYFF+/B4GU=;
        b=EP8Cui/VusblCZTjgfZrOlGyLbipMM1Gs5DzbQRS/QfU8S8MADDAZsbVgTgyFWXXz+
         mrvgEZ7FqJVdj1mEeI0hEhGYQ6jOM4aJnGecXNGNzT3wICUHpe9G5ZeqGLgis8VJLRQ+
         Gk4Eti4HrecRqQXSwbaLG2xPro+8RLhJ+6ex7fOGRLH7LPugWCCUo+Lv5unuKw9P4iMv
         dqg4bzeo3xqSyCeXErOQueJOO/4aL6VOdcaSySBJyKfT1VwAfy0XCwnsQVgVYUH5z0VB
         ux9rvgjxf1nocaUPOnKAub7B3G5f7ZLU+d0KWhXWs7WLG9I9IFDtpIDwXFCnV/oV4k7/
         EaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768075489; x=1768680289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ssjVYpipcbS61pLDGCrSHNTsxktheeQ8WYFF+/B4GU=;
        b=Xi4wfBJUTyTR13UhCki9NnkwHAtqAUcv4qP0sG8t5B8pKxtoikjbNYFJ43lkZLL5vy
         K+YLpQdH9H1ElquftCMkHI/fe1GfADZnG9eHrXY2odkEnitjLmUn0yYjvngVzwIYXpvI
         fmIC75/vGHdkvPbpMZLkVFqNbkXLBRarx33FWkcsPOZ6tAj1+rfYAiCslFmR/94tLwVZ
         uhHrCV9G9JQBO83DgtXmPPsiVc7+rjV9KUZWzbRtfBkzmLJLqoLMwHV2oSVxVzLJsHB3
         4nB1Yn7HZiGRA7ztQr/2IA7Qzpk/7X6LsZ4FQMquVm+ELDfWp0kO/BRKwojPKj0TJGfs
         zHyA==
X-Gm-Message-State: AOJu0YxjgVn7oTawlQiukxbg8VsFfyHFvijd/YX5pz7YtuQxyWQjcnGo
	dzE0H7NcSJhl6CDUwBmuYo7b4dPlGdhgH1FKB8rW1eSy5BV5/6i9PGlO
X-Gm-Gg: AY/fxX7BoHJtSZBUvaSz6iCAtgXWfTy1oylU3mtPze1jsOpbd2kUGBnCcLr2u3Hd+u2
	SDVEi1Le46t2XW53bXBThrk3EB5hQBBLwvsF+KUTU++jpLWFLjKxaLBAYkOuy6bnUOCcYj3Drn0
	BCHUTfzhAkPiiiDpHIyDkr9J6T7axxlOflK9x+UfkY2OInKM5oKhPDzjK6FEnt+Q07wW9ghx6Lv
	MhZjKhteJIzhkxk/6FCy+NtHG9NznD6lI/d0YWxJW8WFxymiymnntSnzYnaU60qZQKjIqHoT0bp
	0Jl5K1UisVaenn/Pr5gdImJlVX+WxmKtz+rQN+Viks5stqNFRm+Na+qhIRezJH1iqA2IGcfWY3C
	XwcvhUIKEMJGQ/A3g2GOtDtZTAVLBw7PqV3bdHRkjDcKxNOTMjdCd/em3CZhRUySb5zn402mT97
	OtMPfEA/ODmd0y1kS+xoiIcSGRwDJw7Qd9LUWqKbl7bVpE2V6XeTXo9yRJ3VovmcbcQ09DIBSEZ
	dbvF/OXer7LVWZskByNQnGMoUGOyAX3KUA5rFR5N3k=
X-Google-Smtp-Source: AGHT+IHgSf4RPCvxj7DEDU0E/KAOwWTEok3li/D8J9Ibm4he0Pm9LnoQAzAl1Hd3E276oW9oZh/Wtg==
X-Received: by 2002:a17:907:744:b0:b3a:8070:e269 with SMTP id a640c23a62f3a-b8444cdaca3mr1447948766b.14.1768075489016;
        Sat, 10 Jan 2026 12:04:49 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-af95-6f00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:af95:6f00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a56c552sm1483591066b.68.2026.01.10.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:04:47 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	adrian.larumbe@collabora.com,
	steven.price@arm.com,
	boris.brezillon@collabora.com,
	robh@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/3] drm/panfrost: Add Amlogic Meson S4 integration quirk
Date: Sat, 10 Jan 2026 21:04:25 +0100
Message-ID: <20260110200426.1461575-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
References: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_120451_419030_EA7BA374 
X-CRM114-Status: GOOD (  11.99  )
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

The Mali G31-GPU on Amlogic Meson S4 SoCs requires the same quirk as
previous SoC generations. Wire up that quirk by matching the Meson S4
compatible string with the existing Amlogic SoC data.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7d8c7c337606..431470af0f36 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1056,6 +1056,8 @@ static const struct of_device_id dt_match[] = {
 	  .data = &amlogic_data, },
 	{ .compatible = "amlogic,meson-g12a-mali",
 	  .data = &amlogic_data, },
+	{ .compatible = "amlogic,meson-s4-mali",
+	  .data = &amlogic_data, },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
 	{ .compatible = "arm,mali-t628", .data = &default_data, },
-- 
2.52.0


