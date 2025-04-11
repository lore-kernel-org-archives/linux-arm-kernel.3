Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44475C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=; b=Ae4kh9moByn3xfSk/0k8Z2TXQj
	kuD1GLezjL+xPtcM0m8/Po1+waILuw1ZXbmZNMW2uifzoNideaf5XoH4X/CsZcn5dJX7dZd8gBZZn
	QYAm+dpYobGzrdLGwCpOn5V71Q7DkFu3o5Vrj1yFwzUxzWD2LgKM9H1dewOl2vJ1b1D6MWf3jS6HI
	MY13SghHE+h+6JacfNnRhDoDGC/xE8xHSq8DuMkeDljqYLt7k4byR4/q+IRMunCoQnqvugwCzCAZz
	ZV6zvToXy6q6rtHeeL3hweXdKJilcByKDyKS7++eVnXcV0Kjy9p0HMVMMk0CY9J5IALGZAmxKlMYR
	gynnXGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DjW-0000000DmfM-1QXO;
	Fri, 11 Apr 2025 12:43:46 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DcT-0000000DlE9-154L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:36:30 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736b98acaadso1823049b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744374988; x=1744979788; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=Y5UBk9uTo2gbjABcC6U6Xn99numHPfDC836nOtG6Sr8Jg+7JrL24wpnOdikKLTSBju
         2raYsh5LxtYq+47NX0tm3bMW+dv3mqUokBkPIvzYe6o5N8s1dokUlNKd70LrnL8lb3YI
         k+njEIB9Hi9PrYOYmicEsYOb4fuW5Tb5fGhiMI6Zgi3JBjvSjskNtZHIeNHW2rdh1rt9
         pkAJUCKVC/+DkXYEuGJiEQrn47PfEMjq3q0niKuzQ3WFmmlDRT7nEar25+Ug3sPEm/zO
         7nGr4gch2qXDXgL4bFJjeFWj0tqRQU85fLGyQQ1N/NlJyG7oBnckXQswOHNni+rP5klr
         +IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374988; x=1744979788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=mQIuTRfHCXN5Q8gfgkXAW/mLJualm0gs0Cy7eshk2nvV5PmSg7EKP6tWOpu+7O+9XY
         ZsZPLp8jPkuHTylfhcj8JShd7+Ce5i2jKXGXswBYUWVUJHRATCDoBwHS3xRuZI0gfxum
         Z2DPL8gBBgCAR73I7UsrFN6zJzyexLp0lbumga4fG82Z2jwk3JBz4RoflV+xmV5Jg3E2
         gkD37X9UDJ1IhTMCthBkJdEL+etm1ivAZ/jPIR/nmauoCtKxnAU6Mg3AjPB3q3x4gmX+
         3TPsDizTiYTT7E30a1xeUt+PICZDixRkYRZWpnExe/NPwmeaMm86dksD/stmgxvCClds
         c+hg==
X-Gm-Message-State: AOJu0YytvUREm0AiCEJdy3c/VgmT2B/y9JiDK71F/KWk+pkcxDDcxvSD
	dxMSmCF/1w6PXKdMYhHaan1yVKT0EZdBdXvLriPQqZ6Wef227TwB9JgpoSP/SfM=
X-Gm-Gg: ASbGncurvJoHnzf8ZztOJMUf6ixpuWRkr8b/h1Zvq1ToBfAk1wqvOlVC8wq43Bd/1zl
	AQN2fT0CjlXEhk+bYsnOMJA2KowHFs7Hepd0IpUDY1pN3jFWmgK+AM9ujzBaT9QuC7AXRaDR+Ew
	9aFoDPe5OatuP3Yxqj4PweMrd+BhFfa1eIR9Z02dGRAAMGTzRlWy3tU3GUieU+4aPDseqlysvoj
	dwe1a3+AwdEc8o26+UN/5kUsLp57jcDqPzPqYiW0ZtGJwxs6jUvVDFaTfctCbaSh0iubI/mzLT+
	k5jEYt0pjDJa7QpocNX2Gq1wlCH1wVMzati5J/oYweo=
X-Google-Smtp-Source: AGHT+IHQwIeS61ZHw7ELcaetMk1hxBxZhzt/gB3vL7AAjlG4usbaBhvHS6AeD5lvUMBQjtxiLN9JMg==
X-Received: by 2002:a05:6a20:2d0e:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-201799908cemr4162219637.38.1744374988404;
        Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:54 +0200
Subject: [PATCH v3 1/5] rtc: mt6359: Add mt6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-1-f003e8144419@baylibre.com>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+TYlfRYrK9qBDtMoT67TK2uUDW65YoKt+VK8q
 GnOGMrmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURR2DD/
 4yLxGKl9OOCFSJeMkLVMWu8AstKcIkMWXfnsYBqGiG0y70mV141mnz9uA1Wc0q0e436oYHlfRwILuj
 8vaI3DBOZWPdM/vUXhxbr06wjzwcYlTSrvVEQD9mwFWuVcRma8pnf7iinuqfOQAl0xsdZ4vs/gn2//
 5Fxxc8ddmo2NGUZlrxrgFhYrn5FZe7ICGucwwYbHE6aJQVKSCv7ndCXIBFUs6hUZ0ZU9a2tPcmOemT
 WTVdyPhr+e/DT0LtIPnaqlgRaFEepcVsClWO2gD/TNvOoEakEuhUryURlyDJkApbyRme6GolKf4mCG
 pOT6Tf1mgbrGy1+NfTixaf58L0ePsfbhAUBXYotRpddCYUzbSTjLrFNmT1fpVzSfUvb4Bt6QzarYJC
 iiSUZwUappYupYyPDSPVV9jq17rxTtlRmXCEdJEjSBUmjaIt+0D2hPmSoJVwG2vhvSk6I99CJpRkKF
 IGQiqU9unaNRqaO1LK2nUKL9o5OoWDgs8QzyPglItnNxE3AdyMqLysqQENtPq3zEpQJq6QznOFOS5g
 D5bVbSKVNMxItR+mw5dlkJ5V5UuIleFlsoTvFThtHRjdfUQ5pFM5Pogs7PR435ybYQp7/MZwKStj2L
 y23u5rPPoMo2O0aFe0vMVu2TUB37HGnrKMbmKoVXX9l61d7LzZQfDbpfD1Bw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053629_303735_3F87F9E7 
X-CRM114-Status: GOOD (  12.50  )
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

The MT6357 PMIC contains the same RTC as MT6358 which allows to add
support for it trivially by just complementing the list of compatibles.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6979d225a78e4..692c00ff544b2 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

-- 
2.25.1


