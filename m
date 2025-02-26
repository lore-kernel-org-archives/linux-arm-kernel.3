Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC8BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t7oIbL6Oq4nSHg07LEL+0/DEW8r33JxAc53XxQi3IME=; b=IYZ8FH1ZveRLnA5T2ZjQr/G8iZ
	IF20jeYXy171VMBq3kom4COYqP6E5kgpxcbD+DmPhLqa7g4wnK0JClWKctp6G4kZetf2h6waHRCQI
	W47UEJ2Ls7XGNKPSoxB9QaixC1uDXqMfo6t/vcVbJz8Iu4SdpPQOnBDdHstWqN+08r6m7AUnLAw0U
	5fSR/uDdb70gVB3hkHNxIRRDXWQi1pTuIPzSPCjfQ2eHeULIb3qN3l8TqyRllwI6T7lDDnTu3sEeR
	8kYeyyB8D2uHD1SM9DLEwrrCp3SBTyNP+dzJ3DckRRtM8NJzeRDq3t0ENLf6l0ZZNyxSMDR5ZmL1h
	L4Sofjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnK9j-00000004Vid-2u6X;
	Wed, 26 Feb 2025 16:21:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnK87-00000004VT9-0UHp;
	Wed, 26 Feb 2025 16:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=t7oIbL6Oq4nSHg07LEL+0/DEW8r33JxAc53XxQi3IME=; b=U4njBkD7yncV00t5K2CL1/Qvly
	VUbP2AtH8NGXZ/Cy8j211L/iYykJ4+6GvZzlPsuzGYYhh5tydNLk/TbgikR2RXcyZO3SeWszRjqLr
	cNoE5xhXn+B4l5akNV8WL4OfpZ1mXqNrk62M1MQ1NUlgyW7SFn2mRXNdf05mNlptvOo3bmD4YIo7j
	yCu4+qWfmG11sVu2egIZIAG9sUk1gY0CMid8ctAC26X2FeGHzSMKGjjNDTz0BJzS37Eng7MlG9OXY
	cYcWUQFZHGj9vPx7an63BRZBrpVQM2zjUn+iA4hgDXY3kn4oWhUPltNyFXSBN2NI/K92TN5Wso2x/
	hdOuRS9w==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnK84-00000003eSZ-1LKv;
	Wed, 26 Feb 2025 16:19:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso58005e9.1;
        Wed, 26 Feb 2025 08:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740586761; x=1741191561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t7oIbL6Oq4nSHg07LEL+0/DEW8r33JxAc53XxQi3IME=;
        b=HGDWrvbOrCQCztmn8kUY6duBL6XCp1mL1+2wAnLePn31VDSu9X9CTEhQeuj4Ssah7i
         xeU0kF4biC+vMYYSLO8n/fr1DDJ3k2uOCVb7BYjBqroKVCBh5leM8rh3DF691AE1AfKl
         NkzdOi4EO0C215C6ixZFCacRHABFfQqOvpYUR43Tztx67FBFo3FZLlfJyibijSniD9VE
         LfywYSsIGyrSmBLF9aauNzrF3OS2l8lwJYWDXD+BGhOl+ZYnmF8z/ReBKSr1H8Sgggh8
         q7KqToYVKFERySRXAjRrj0vVbP4DlCPd8urVTPuNTl342t0fBhDyUzix+hf7Nvx/O9oS
         30Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586761; x=1741191561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7oIbL6Oq4nSHg07LEL+0/DEW8r33JxAc53XxQi3IME=;
        b=BMbdEKtwrYtCcbJg4R0fzslsJb0YN6TehiNqOxCJ80yFIrbNtTzyXY0RVT1oIRrAmg
         lS+ocyraz2noSs214inddT2yWgge/pn25M2XieAvaV4Gq7QS98B9JR44BQ/Rg0uNw5mJ
         4vyQzYtJVbMhoJ/vlPR4k0PQIUQhmuSzMs/mLk6bTY0p1iwCFW/cCCUan8DHDNEAKOw6
         zA89SbGfqZAMG0aKqLk4RWsG+NBwtJMlLcYwi9sm6RY1Lj5+zKVHcLpmBQSF7Q5Y6pY0
         ZuLt520Vwf6Irh2nuQpJnnGsc41EkAG1SP9eOVtBrJ7A5c+Pg0jPb+zumLQlyE3k+jpL
         8HuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7MuZ6gGEheJwA97P9f2R2YSQjlXs6F2sNQhcq4So8Mhq/ens1FN20H5HY7KRmOWJ7Maz7U3OQggk4jI9D46H9@lists.infradead.org, AJvYcCX8c01F9+lCvkG0LiUfS8Xbk0HkvuhuASt9rs29tgz9JNmWt124nM2N6zB/ghNKG0j2/HXAD5rpxN/hkg3Z+5M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy39wf+afZm3m1Ze7hx2pKN/+HXYt6yjJCxl4KKFpmtpyda1MGF
	R8exioK26GSQGmc2DQwuzgHku3cbJ10JVtPIH50s3F28PwlI1GJV
X-Gm-Gg: ASbGncullrZhxtRKY/5nIeBcFiqZ4nj2U3PQ8BfMTSxFPkH9IVRqOGMwZgoj2+qzCRH
	zmDonRZEN0cw8xAlUMGKGnOGnHPQyVs+Y7VatUmoN22Yl/EnM5DicGCuZZF6n+gpTvFvTgBmKmn
	skB08XbIQwEpNyb0DbY1JUvlXKboIXTZ+xh3G4Nit8TDxXLg6wrmA5DQqQNh/WPoXhkQvXRwQSb
	viVC8ocqleDgGcWV9wyPSvsOnfmjlPYgZ66w8jjDTOJHkMFTM3Qwd1toHHvpYd5Vn1VBh02NhI0
	rLZLOXilCc5X1HDNLNI6Be9exMM=
X-Google-Smtp-Source: AGHT+IFCHrP0DmNTDiQaKF5lTigPtiLat3d0zHJOGbPCRd6J2ldYAIFvsJPwNG1s+zkxJZVh4LfRHg==
X-Received: by 2002:a05:600c:154e:b0:439:a0a3:a15 with SMTP id 5b1f17b1804b1-43ab0f3c907mr103513685e9.14.1740586761203;
        Wed, 26 Feb 2025 08:19:21 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43aba5397d2sm27064705e9.22.2025.02.26.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:19:20 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: mediatek: mt8188: Fix uninitialized variable msk
Date: Wed, 26 Feb 2025 16:18:47 +0000
Message-ID: <20250226161847.567160-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_161924_496491_25A74EC5 
X-CRM114-Status: GOOD (  10.79  )
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

The variable msk not initialized and is being bit-wise or'd with values
in a for-loop, leading to an undefined result. Fix this by initializing
msk to zero before the for-loop.

Fixes: c1e42ec04197 ("ASoC: mediatek: mt8188: Add support for DMIC")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-dmic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c b/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
index 4cfbcb71d2d9..adcea7818be2 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-dmic.c
@@ -307,6 +307,7 @@ static int mtk_dmic_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		/* request fifo soft rst */
+		msk = 0;
 		for (i = dmic_num; i >= DMIC0; i--)
 			msk |= PWR2_TOP_CON1_DMIC_FIFO_SOFT_RST_EN(i);
 
-- 
2.47.2


