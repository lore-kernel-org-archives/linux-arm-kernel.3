Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D2EC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=; b=h8Ho4BT9pJ20cLtOO975vY/6P5
	jOyDxbYQAdH6GoFweK0CIx2fHsPhNicBClfyKk3DdJGpEkS74AFaOGmkZmTZtVNT3wJDJgAinL0Cn
	K8+3HuKzU2B3C0BzBgeLi2SE9sviq3dlGZ83Dt7DZ4/0BaE7F1CwPwS0+LKGEi35YMSWnYkWUhgZB
	EEpx6M4XoXyv8nqpVN3COp89BffsmER2znB1RsgHQkcWCVj4OH8yF7Myp60TpZmwAt7lrUFoB3ITO
	BcYitI+KOSHvz/uVSS8qCjUFtIvardJQWeLJekCEN8mQuOTczzDaglJi+ZReRZJ0gSXntIKmqTNjO
	KXh+WL6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PXh-00000006e5t-38nz;
	Mon, 28 Apr 2025 14:33:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PUh-00000006dia-0Bp6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:30:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so43240345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745850600; x=1746455400; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=;
        b=XIlOcg4Lhc/+a3B0sgjndGrcA4Mj5j86frI0rx/1UitcZQ6xhNeUKUEpZJDmdKQ1En
         xM53DdxSumKqoyHS62p9TQg62d0taNeL5nC7s5iIwwLInS7uMJexu5HTAUFhyfTFhJDw
         NMUDcSuJZLqYpfEkjTGQ2Itivw+SAmUZm/PIN4RAmwCFStC2/3jkjDXViE+QO96zu22K
         jzzmBHvwyXSRolKe8WOhUuamQAz1AFiT3iuVN173J7vdtaBJH2eV9EskkbR5VnucmyeB
         jmkLuFeOi5/3MZse/xo7KhuF6o1d/aDQWbgNsB1ILCy2LZEYtzoMCjgDfGi7QGMgQ/DP
         flIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850601; x=1746455401;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=;
        b=onuAMis+gk6LjOJko8yczMb0GB/lpYvP+2CcEHS/wheEa+3Gp8YB1qASw6HueZKY+e
         hPEAXSKB7eW/p+PghEuucijEs2N2GVt1ZMQHqbCK8oUIFDnyG3hMg9yuA1MIQeYHEHm5
         zaeYlVSyxvFXAPVjHnqY3P/kHYmIyL1oOQajt2TiW/k/0itNNIApT7th+GNGNU/Oss32
         sL/rVMArG742yD0zLyGfxH20aPugOY9lVNhxxaxmQIdzb54g5sdiPyWaN6W82C+w1KAa
         Cn+Gt8VGo8AGD2ly4wxIcHd4UtKnRP4VDlweoa6HvT6So0kYMBcx8uWdEzKdtbAW7Zj8
         RDbA==
X-Forwarded-Encrypted: i=1; AJvYcCXalNI9IN3pXaU/0f5jIKwhVvmpxw5Meoo0KzGUfUlfByi88nVfb1aCOsQSeuNAoYJK4On/eIPrYosL+d3gMyRt@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcxwb+o9fosB/I4D2QBboxfCe28Q6VcRhxykKroEGF0EBp5etK
	+78yI1pd8GAwp/oT1o7nUMPNS2CxGPJ8G532OldMBhyDTg41kHjr9p0OnoRMRTY=
X-Gm-Gg: ASbGnctIMsI9jorbgw3CTRmxL7LnuBvWRKtk8Q+OW9rnNI0YlBNm1bcGqU9EZlRCntn
	j1/co+4ivizqDh/JplJI1Fi5JGWQrm1uGE4KNaOxlHgce7eiRGdZxkmWWdbSBCpEuDbaa0NbHcb
	ZgIDIZn8JcBEXgfogzpvMUSGIx4w78DtZySxMyqYl+EfSqOgIKFvkxAbPJH2zy8uOO5WCkLlqGc
	FswwYKXt5ihtubJeLMYuhknLihNh2vDR+1oYnGrHSqnkd75YuwCr/A5yjlD4NhGDEpHAct6RQpL
	HFaYY4L/dkYFxEhGFsfuukHksN/unAelUdwiWOZL7GANMkNJu805XbDmFyI5k7qPOlqBd9iBZsU
	rdZfI
X-Google-Smtp-Source: AGHT+IFMzYA4rBwAp8XMm/VmBHtuPN7YejTTJCLHH0ds3UH44CvH+BTUCP1eWOoIxr4fWxmL+Mot/Q==
X-Received: by 2002:a05:600d:3:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-440aa5c57d2mr71982045e9.29.1745850600617;
        Mon, 28 Apr 2025 07:30:00 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-440a538f4aasm124616395e9.38.2025.04.28.07.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:30:00 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 28 Apr 2025 16:29:55 +0200
Subject: [PATCH] rtc: mt6359: Add mt6357 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOKQD2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3aKSZN3cEjNjU3NdYxPDxBRDoyQTi+REJaCGgqLUtMwKsGHRsbW
 1AAzLrJhcAAAA
X-Change-ID: 20250428-rtc-mt6357-341ad12b48ca
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ruIK2ZYu6lVtSOA1q39QxovEfdKMM9srBG4DrMyVUf8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD5DnDmynJWGB3fQ71YEwcfouWK8V/j+TJRIOazo6
 JTbxnCqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA+Q5wAKCRArRkmdfjHURdFbD/
 9SapbkaXzKJQv+9ANc35lhlI2QPX54DfEfjZjVAsUPn1ZRjXdtm9WR41IyzztGdGfpRmT6JitqlK2N
 XSue5F/P7bNCF1nboTy8/bssi5w2NdJIJv9onhgr8e+VJK2IWTWLATwdJ3IIdI8b/g9V06yUkOZr9A
 8PRLwmOu3hkFBqh279hQRA+DVclO6MhZbMUkEYkLoOrqCAnlSOoHW9XbFbbT/4/heej9DCwJLBBBdM
 KLJfufLks3tBLoU/e1jJwHenVVTAL2R5g29cnknxL2NsSMJOxM6giESU4jKrf6BP7pcIVB0YJpqzqt
 CxFysyaZEH916/YYkpj3XZ76uUfqFm7WzR8yVOXBLbgLaB/M51msZSyAVj0HDU2nmC3qaQ9NZ1sngL
 +2uiLVXZj2dhNFuj/VMFtojm3KI3Cjd6nIymlOOV8ZTU/OhHWMHYvPYEwlPpZ7nuH+nl2vj/JIhlyv
 cuVGNJai+xMc25fD6pJ4Tm78MCePjXxAORRDV3TWyF3KbAtyxTvyKwpnkS6Ghu7/hVw9ALCl3T2cDh
 wX/PiNYmdNqBLIhq2InUWrPfuyAhEnv6rhXW+b87E6u+FgMHTH+0CChOb2gno3JR21JwTYbj8o4+pf
 0GTaX6z2uIjtLHzQmQ5phDZVJ+ML70x25abikqmGttA4S3mTKaZzyVw9GOEA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_073003_355489_72D595DA 
X-CRM114-Status: GOOD (  12.63  )
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
The `arch/arm64/boot/dts/mediatek/mt6357.dtsi` file already contains both
"mediatek,mt6357" and "mediatek,mt6357-rtc" which are documented in the
`Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml` file.

This serie come from another splitted serie [1]

[1]: https://lore.kernel.org/r/20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6979d225a78e47f73b7652159e73f70c43b4fcde..692c00ff544b22b471b51f115dded9fcea432de3 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

---
base-commit: 424dfcd441f035769890e6d1faec2081458627b9
change-id: 20250428-rtc-mt6357-341ad12b48ca

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


