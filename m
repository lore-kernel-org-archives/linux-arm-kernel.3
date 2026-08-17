Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0B0C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ibAJzElUUKot6lni8N5t6jdT1WBvVXg5lJjweeU8WH4=; b=NeIYHqglNsCs+FD/Kn85Fg3Qva
	PDQvyAL4+4ILTFJAUn7iO6Dxq6VE1R2TG7y0er3ZpOvLyu7GY5cNkewxeNHR5Wtc9OAeb2khDjzah
	oyvQIIikkw8VDlCJejPJcP5WhNj/e6wpDymRalSL3orMmwJJmjnT/1wrWMi3/xm/GN+URIoNXdbrg
	l+gFuV/s75BUT4H1y2I1eQCjNJ/bjdVMMa2pwJDMUSO1ysMNlZ7Bm1rgdPOrXEYxx7G4BUIe8xasa
	65Zz0mxZmSqLGAjct6zlplo4qQDGEdomLOTKXXF8txF3UfHWS4MS1zC2yGLP9+/3fCDHItCl/PGXv
	ElarkBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww06N-00000006VGv-3nk8;
	Mon, 17 Aug 2026 16:22:19 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww06L-00000006VFx-30K3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:22:18 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-51c2cce930cso35635401cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1786983736; x=1787588536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibAJzElUUKot6lni8N5t6jdT1WBvVXg5lJjweeU8WH4=;
        b=jvQ/91i0pHzY7QcRj3vaAEv25Qv2j8mBmfvvBv0fSAK7/MgobfW1fw40P3Vky60AjP
         4YO746UHHGDBpI6AZCUClZa103tTCUeUktRxH1WY3Rk3EK/enlOhAnMROXyzNsZob5Vs
         aDgXjRpKo3+CipsR+YKZbRa3vTeA+yVHF3Tox3SfSsM9kzpWOlW7RA8zzmPAMQN6DATd
         tGIClpu5AQitsvqG0MF9mMX23+NX+oFU8pcNa4FJyx65P0rVzKpsA7WgKnphYkfqArTV
         CoLd6YLeXM3lk7XkBqd7jf7u8JHoPZL8mt4vBS1LO4/BM1aOUQRyxrTQ3XpEi7TdyMSr
         JkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983736; x=1787588536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibAJzElUUKot6lni8N5t6jdT1WBvVXg5lJjweeU8WH4=;
        b=AbM5drE1gaYZtsncM4/j4ziUIl/GeP9itBolblnxk2ZE1d4rnFq/7YBiyIUJ6+O4rR
         qO6mVy62RL+O+b/KfB17v5LJDrpRDRai5PE3bXwcVkO/eeF8uwhOu4Iv3X1XD752KnPO
         oEZMq+1C0TPR85fGwVq9fmGRTHFTFDipKYwfeDrF2vHeB1xARdILIYLqAq7NICYjKY14
         N3MXNZ7eYcBKEqWbAVT85mbzcQ1gFqPyyC/kQiupGbqDbBIiSP7z92dRSRNYUPo0soc8
         DmZxB4IC8KpaEdC25F7HRcnroKUA4qZuc/U3cHhG1XWRV83AbYpSbJMmFM4JdQB+tr1Y
         zCJg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8RnGrqfKctk1CE1nxhBfZUAUprimc+4wmfacssBNafwbBVcMjEZ0y9Mpe36srotxbk9mIvBy3FvEFEC2/2SKW@lists.infradead.org
X-Gm-Message-State: AOJu0YxU9E0wHeeOYEKBM7N5f1ORxj9Ban1Qotgln1YZV7CQlkxuEyuy
	UlVZVmelR0ScAHrGu/lrygltix1opPAD63/sYHAVv/bzpvs0L5CZtVKaSOcSuwcQ4IgkbuZGR/H
	7CskaEdugnSUxhckMFD7vFXsLgsPd2DZZtAczs79dV75LUUtrnsrAL6oiVpvls5jeXsdo1g==
X-Gm-Gg: AR+sD10KWUNWcjlHUlSP4BRYEQ83dAjobRn9XLgNlpbdF7B5mAIXtbDFGPR147NGiKs
	WjNPXTDS0suPw33hoqfG7htuPReWNjE/Cgf0CbfunNJ/vpwRnW+qQiBngVr1nHXGnn9T+JOe5uJ
	wESUm3ca5UehV5VEFiPj2SQPMylK1yn+k9IMdqpof/Tz/CWd9uytUDjgFxt2Fqb9uFAG+Gdqinm
	vVaOsgGkLw7Dc2Jk+jUNfiVWgbIts8+RJnLewtedDXZ2R3cEQqWjHERCPTKnJXZ/opsmhPDaulN
	jN7YvaFFi327NNcbLpV1Ehm1KG4EJHLWoDirJ/ei/ugr4dgCiuCvYUDx6GBhyW1Z2X9+0aoV+91
	TSJIrRPJLg94LEcFHQZWIl7okmWLwfMRGTjPvoLdaeF2hwhXVEYhEBEKEKpixkxLeYUAATvjLpi
	w2KjP8lkR47Gg1CkdXzVcoFgwx+Zh3KOg5sZwsv0hn/XdsQqH16uY43aJXp/qLiMvNWtZzWA1C/
	vIS9/VxS6k3wtX7RySCnmfXW43V7VBQEgqxtpY=
X-Received: by 2002:a05:622a:1a88:b0:51c:51e:661c with SMTP id d75a77b69052e-52d8543f3c0mr276688621cf.25.1786983735767;
        Mon, 17 Aug 2026 09:22:15 -0700 (PDT)
Received: from strozzi (ec2-54-236-161-35.compute-1.amazonaws.com. [54.236.161.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db6136569sm18142461cf.12.2026.08.17.09.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:22:15 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Linus Walleij <linusw@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Qianggui Song <qianggui.song@amlogic.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sean Anderson <sanderson@brivo.com>
Subject: [PATCH] pinctrl: meson: Fix typo in s4 group name
Date: Mon, 17 Aug 2026 12:22:11 -0400
Message-ID: <20260817162212.1890616-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_092217_749613_EC80D3E8 
X-CRM114-Status: GOOD (  11.90  )
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

One of the i2c pin groups has some junk at the end. The name should be
i2c2_scl_h1, and indeed that's the name used by i2c2_pins3 in
meson-s4.dtsi.

Fixes: 775214d389c25 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/pinctrl/meson/pinctrl-meson-s4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
index 872948699e9fe..365dafe457a9f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
@@ -854,7 +854,7 @@ static const char * const i2c1_groups[] = {
 static const char * const i2c2_groups[] = {
 	"i2c2_sda_d", "i2c2_scl_d",
 	"i2c2_sda_h8", "i2c2_scl_h9",
-	"i2c2_sda_h0", "i2c2_scl_h1l,"
+	"i2c2_sda_h0", "i2c2_scl_h1",
 };
 
 static const char * const i2c3_groups[] = {
---
base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
branch: meson_pinctrl_group

-- 
2.53.0


