Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2678C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 05:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg48OebW8O5DYM3I5rKP0/NygxmXw5dDjKnd0RIjz50=; b=wTUDhi35qaIaHlekses/C/X/3v
	Rc7xXSWxJnGfuzX5spzVt4VBpwiRQdyBQidvExr7pH97x042ebjjAnEWbMhN588aSQIO89BD3LxWc
	VV+E2gRkgevHH6t47uv9PdwsXrzyJ/lhQZ0t9/oR1v/6hijL1/HwWcbj/VFPWqVe0YCHS43yBGiB5
	RF0/pwI3RkE6L4KmhsKmqcntlynEGBO0uytMsajqEMEfSQTRXrDUTMnki8nbZHHq8P35tQQZ+Lv/q
	91FZncK6wTjw/3BUufy0jGVtphhE+ZeeURlfysb7LKIsrM/URsEG0g5mDBEHCpUy+yxIQg5gelxaN
	3TMSozaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5E-0000000HQPa-2lsC;
	Thu, 13 Aug 2026 05:34:28 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5B-0000000HQNl-2vCw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 05:34:26 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38511175ad3so1644147a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 22:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786599265; x=1787204065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg48OebW8O5DYM3I5rKP0/NygxmXw5dDjKnd0RIjz50=;
        b=IW1RbcGK9ZYClVg1gWPxihkEmNszo2fsm9AVyrQrA1pfaGMWMMCR7fiw+COq301c4Q
         WjwSSPslxiayOW61NZc7YpYwYGGROXaRacntJ42inZv3D6ItmVrRzA1034qxyHoLGMpE
         pqlCFo078U5cbtKYmgoVp226JNPE6TY7H0gNl8n6fmEK5Ou0dj12omHVNB7zLAMfpaVM
         3SO/B/b2eFw1mRKfIJP1NkS4Rid0192ccV729vOKd0KVdDjDIV2pNLk+bdIiK03LJPXj
         QaRGtMP0GNTavXeuTnACe6Rgumd3aTeF83sNoLEBRgWMHWecFWUkH8x6E+O0wtOARUSJ
         AO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599265; x=1787204065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sg48OebW8O5DYM3I5rKP0/NygxmXw5dDjKnd0RIjz50=;
        b=AbvJLqJcjsRvdUmKNIvZ0ptd919zzeJMYJEen0foCnKXs4AdMp87dIzWVBFmql7ptd
         0G5feYm1mXoO9m0RlxGBHvYvlCGCKKddrL9V/05pC2qfi8VBbVbYqhygzxQxZvtgp2j2
         G+iJ/TTuaUdUjI+24ZcdpWxmCOG1xYiSlBuIVksqooibjPxrJoSkPNWmFNQNC/9CTpWB
         6d+RJu9TvOdwhTAaqSMhG306+3bF3igwP2Lrcl+lGHKAWJDFjrNsfBWItc38eWm3Xl7W
         yT7ej1ix/U5vc7L9Tg3H2OvdA0bx9ZPC8TCaGSP26Mpul4EssaXjwM8XyUxOahJL4Ap4
         6gpA==
X-Forwarded-Encrypted: i=1; AHgh+RrQspo+Xyg4P6hQehuyr+7F1neYxGoIwrFB4OS/HsYw+sihGQnAuLhKY4LJKPRL7q9LLWGX3ZRyRXoV9sNP4AvG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy79C8hG7FzmYkw1jUe9jO7zZdxnNvjLirSWBG/0NTyPU1su4pV
	KaAlalV4UuHBYpg+7brBkBspqDvb4ebX4iuiEDSpT6Ucl5bEkmF418VC
X-Gm-Gg: AR+sD123Q3NZodPw6DyWUsYo0H4LrogP6E8oi3bTdlyIudkl/EVSJqPY7PxUyk7mX5d
	dWOYGYQEsuCEdIRC9CO/9YGH/EPU3C9EBaQlF4j7ROv93sf34G3Yrn2q6PKY8pkFVAjhAoDa9Jv
	ZN3CG1jasZJRRKU6cExltorNo3ctcj3cQttoKElyas93h3dGEgTBqJts3+fmnT8vLxv/sQOGiAz
	1Z8P4y0cJhTSOPI1Ssjjj8yhK5hu/wIlHq7AhFV1BcO/9svUOsZHHl6z7rZmSkPftfUBsq7ACg8
	gDpWU+33lJvv5B/vswcEVghK7Uqo3uivmtxTlQE/x22igb6hB8GEl5vzuQVmg/pwwJlkjEaJOEU
	etgcvYOfjGJr5azj8K6W5gdE7zAaQDQYeiwPS4K0bYTc1Q9ww5C5mlqdB04MqBc50K1ux+CTztV
	1d1Dbvq9u7Rlu0lZpaw9bRvCQDpxN6x2drNud/ZgvGACOA5XdXge+klC+OUZjX5Ifl15xH9P1lA
	Op0x2a+W5GvtlqQY8kwwgK/COT4JOnaT/kEHY8UVgjAZgUA/c0ajmHvwWZ1TLUg+7a01ib9Yh43
	dtn8doVNrg==
X-Received: by 2002:a17:90a:d40b:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-3931e058763mr3777372a91.6.1786599264874;
        Wed, 12 Aug 2026 22:34:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d872ec5sm594734a91.0.2026.08.12.22.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:34:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/3] mmc: meson-gx: Handle errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 12:34:02 +0700
Message-ID: <20260813053404.21553-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813053404.21553-1-phucduc.bui@gmail.com>
References: <20260813053404.21553-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_223425_744277_55126B8C 
X-CRM114-Status: GOOD (  16.28  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

However, the driver currently stores the return value directly in
cd_irq and continues probing.

Propagate negative errors other than -ENXIO, and only assign the IRQ to
cd_irq when a valid IRQ number is returned.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Initialize cd_irq to -ENXIO.

 drivers/mmc/host/meson-gx-mmc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..d2903e3dfd6f 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1141,7 +1141,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	struct meson_host *host;
 	struct mmc_host *mmc;
 	struct clk *core_clk;
-	int cd_irq, ret;
+	int cd_irq = -ENXIO;
+	int ret;
 
 	mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(struct meson_host));
 	if (!mmc)
@@ -1185,7 +1186,11 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (host->irq < 0)
 		return host->irq;
 
-	cd_irq = platform_get_irq_optional(pdev, 1);
+	ret = platform_get_irq_optional(pdev, 1);
+	if (ret < 0 && ret != -ENXIO)
+		return ret;
+	if (ret > 0)
+		cd_irq = ret;
 	mmc_gpio_set_cd_irq(mmc, cd_irq);
 
 	host->pinctrl = devm_pinctrl_get(&pdev->dev);
-- 
2.43.0


