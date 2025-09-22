Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9DCCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q65R4wtI7rKWrIB8Hpru/7LhZExxGYM5TnlXns4ne/U=; b=TlldEebKIyDAaMIoan9/U1lT9g
	erX5J2MvljwXZ53wvnT2dp6LNp4vCYdCq9JvZUzLDKAknsVbUzGJSap4Nd1Pwp80aR1+aee6BIizQ
	PbIQu7Zh3MI8xXVRV61dPTi6DCYpaQc0bdsgzi4JabjcBH3QhyyPInWQTrvvlEmWegewlw/bfk3ww
	l25skrtKSFGVMVGz3pRs7k2fqqzmLSfCKuxcS3vxUe5ZaR1QOkD6GMK0WhD4UgMDvhm7Dg/z5ZYsV
	47SfroC05VGxCvEmcem8evKYqP9YS51GFE58DUHKgmzYtDzb2zFUQXjXt/MjFW95v+tS8gycv9D//
	l6Fk79Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hBM-0000000AbwF-2yZx;
	Mon, 22 Sep 2025 14:06:20 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hBI-0000000AbvN-3NNb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 14:06:18 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77f3405c38aso958525b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758549976; x=1759154776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q65R4wtI7rKWrIB8Hpru/7LhZExxGYM5TnlXns4ne/U=;
        b=aD/BtWmAU3hXnus+wbWXPNhtDy298MdH09WRqBrhPU3uVGmuxLU2kI15KM/eSrRdPE
         6mkFTw6cHjPHnyV7Gv5hmRZs1q4123IqWACKqOzmZ5qEnrKzgijGzoAk9ljAtmR8SVF9
         rVmlG6HL6Y2LYz3L6zzSh7SJNok80vhD7kY2304J6mwU9mrDbGUG2Ft9WAT07F1TWZ+L
         YqLgMVWoBuODS970UYaU9amf7cVYeJ0tYK45J36aZwoefCo2wxd2kNb/swxuDU1tEYBj
         yovdxas8s10AkXpo4IRCfvbRY5brp1DojpLdLJggRvn8jIC/UT6EZz3eHAp9dJmQ/II7
         jUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549976; x=1759154776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q65R4wtI7rKWrIB8Hpru/7LhZExxGYM5TnlXns4ne/U=;
        b=SKTXysW0i998kTAdXkE6rOO5QnSXCLyH0wf4zRDHMvgE+5W/xn7dCaiG8HfhFVXIEk
         DDQi8hVgsfhvYpN9btlbOmqjFJQ0ZLAMIaPBhy4VbDTXa1coLY3BN/QpHS/PJUOJ8IHY
         sibVu9mYKPwGYPLvjffpMwAjwrnTQg0IPrq3PUWj73Zwf1b9adDrIKkBaFACNZJclKnG
         muMCOxrr381T3rG3E/VnHxtLCN2P4KB/2x8potB4rvN3BOlPKhmg4fcgzKcLOhUsh/zt
         vDnRKk4Ia0spSLr/LVus0UHJuAvh5D1q4ngtz5MzDOxUjdLItLSJR/CZsVrpuVD21lMV
         Zn4w==
X-Forwarded-Encrypted: i=1; AJvYcCUo/mPz0XRqUJCm+69aSS1JF67CbloYozSqKSYHUthk3szFfTQ0wBpwFBFCuXhVInRurVwBEzrAxCNujIyPQQfH@lists.infradead.org
X-Gm-Message-State: AOJu0YxuR008wgjLznIesXW9DwZzLe6ec+Cs7MmNn1o8OBdUvai+xbM3
	Q9bEngS/bgWkpyRMjDxbBC4rrVoO9YC0o5bduUCbwxHsAildfIVE8Fi1
X-Gm-Gg: ASbGncvVW731OaY8/5J27e9OekJ0KFpMaYZuxnY4TNxTqYgI5k2oaW9VfKF1a4A/C6B
	S+hKUTezcLlGO+wob/OltMriK5C2pH071dD2Uc+2w9OgxiaRIdhXX88vlRcbSfkdqKgb0uyRDj+
	0UK2H3AGkhue2VBpAp0f2Ddgkn3tbsUpPginheLhoON8In4pCYXCqKzR3IzoDmyhib6Zr63020/
	r+N2k3gTxJYu513Xpo7dMYHk/yCXl/YGBKWPZT/bxNsYeM6vYMw+nVIuOGWvtgp3rxgBl24gP/h
	bFxVQJBnUsRZB39qCza26/JbB8u6tfTLPef0tC8YY60YkZ/0uK+5fiYGA9AmGxtD8xfKBRST9Nu
	EQUxwTc3XjTo/MqQUtZI8pPpv
X-Google-Smtp-Source: AGHT+IGut+RghUbyFn2F4fwYbZuwj/DFVn5Cf89eveAp7C+mVNUJEdBY4DbdKoQyXojSDqZ4ufxz5w==
X-Received: by 2002:a05:6a00:c85:b0:77f:472b:bc73 with SMTP id d2e1a72fcca58-77f472bbe3amr1851305b3a.6.1758549975348;
        Mon, 22 Sep 2025 07:06:15 -0700 (PDT)
Received: from lgs.. ([2408:8418:1100:9530:3333:9fe1:c4de:4cb8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f188dd4a8sm7177799b3a.39.2025.09.22.07.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:06:14 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in mt8365_afe_suspend()
Date: Mon, 22 Sep 2025 22:05:55 +0800
Message-ID: <20250922140555.1776903-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_070616_839569_C56DC8AF 
X-CRM114-Status: GOOD (  13.60  )
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

devm_kcalloc() may fail. mt8365_afe_suspend() uses afe->reg_back_up
unconditionally after allocation and writes afe->reg_back_up[i], which
can lead to a NULL pointer dereference under low-memory conditions.

Add a NULL check and bail out with -ENOMEM, making sure to disable the
main clock via the existing error path to keep clock state balanced.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..eaeb14e1fce9 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1979,6 +1979,10 @@ static int mt8365_afe_suspend(struct device *dev)
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
-- 
2.43.0


