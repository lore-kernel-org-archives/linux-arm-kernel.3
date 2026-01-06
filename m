Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC2EC47BF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDyomPMwSX0nUznUeSpIGPTPKXqo/Pa069JTwjCcRpo=; b=Z52XJDUSfg1SUtbjG7TeWZ513z
	Egdkpmltu8WLo5dq69S/i0ETzvNNQ5+udO2THp63ofGt1LKVqnVNAk1nf/k+iydBYpa1nHlGNu5Ma
	FRAvfYljoZcBJhML0LYRC/m4gbjBkg19gUV/mqrvojilcVMy8b6KjG+QQBdDKjdDOe/HsETeGlEsH
	hFVu3BTeUcz+5aVFx2z/fynR/Zl9QHMxT5zE+pgsCbqTyr2GKH9d02XN51w/xtCY3zE94LUiU2qdD
	mS+EgBIOAUkHdFbZ6yOxTkU1NcJA0F0XVLB8CHCY49yAy3JFKCPpxCuQ+kLYq3EmPTiGZh3WlTZhO
	UyHV7DxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7tX-0000000DGhW-08oo;
	Tue, 06 Jan 2026 14:18:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd7tT-0000000DGgJ-2Uqu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:18:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477632b0621so6158565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767709120; x=1768313920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDyomPMwSX0nUznUeSpIGPTPKXqo/Pa069JTwjCcRpo=;
        b=Is7VFiU++Zf3zYDfgqdwVVlkFZkNDf3SmgTn69oKBstcrsrQ8bLzBI4dfsqJCCTOR7
         dUFFGajW9NVC2QNjnktM/kWbvt/iAhAUN9eNGr9zmlQ0lAOnaE3AhUCCrB+f3kvrv16a
         +F8QCXl6MFmBPlxNrX+N7yp17UdOPh+54/pX5MGmO88CtQkQzz9HzE1slOaI7GdHma/E
         DODiwt2SWKGGrkzJ02MvwqQtFn6xARZL4LaGDee/BcG1O5jLR9QcOpQYEE2cK1M8yyDK
         +IwA7sSfOUrKHMXrvCFtsAH+eWZsYfMqkWlDjQYu7sQwPLSbxw7vIJI5ILD615ftz6bl
         M8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767709120; x=1768313920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PDyomPMwSX0nUznUeSpIGPTPKXqo/Pa069JTwjCcRpo=;
        b=BDqT7SJtpDe0BvXSjw11gKNP0m70cjMotyhANA8+OPeq8Ac4FB1cByc2F5kjl/EQNc
         Z0LOpwY5cq8a2KKaa71a2MiM1mFyy5X2okuwRZrWi7W/SbNTBs0k0o1zBywpKg7dU9a/
         QkJJCeo9SLSmC7Ym6t9PsC2n4tX2Odpho/m2vttnhx3wvt4HZbRqDYTgpzfNZS8tfP5v
         NH6lBxfp+2unIg8j7ahHQkoI22bAM1SDdtOih/UGLmwQEUw7NdzZ4m9nSXRjfTfkG0RX
         SJICs/5tEd6qw2ha/ckV3RdX5HD38tG48wVBqKyyF3536897F6eCg/ZMLrdpcbb0x/Dh
         1hMg==
X-Forwarded-Encrypted: i=1; AJvYcCV91ahMgQOb50JjOu3A2SErh4o8SbrgoJpl4cHSHNgLlrB0JfnhSJCKiuAy2B/kph965QMlCnqrIRxEc5JLP9fb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3PdZ2vCoLpvPmNT/FaZ26PIttUF1IDV5s5Bix6oC47ZlNqhip
	2PW7BxX0gTNtr4bXSgY8S5tnBirSbcKAsxmaYiIE7PMGCGP3iKy8IgItRWvtB66Lbbc=
X-Gm-Gg: AY/fxX5h/3osOgHQGjprNCEgbqYgudyRmqOyXsMJuC29qqpagt/CpyUzkcgaYVKzW7o
	pk7uHNSsjjbEnyhXuO/IWuPiCQRPy534Q/f869sUvbmyn4rVnH2Fl/IbUZSsdHb38rcA2Y/ynL9
	iBugQGgdCPB3RJif5CPTR426FYO9wIYbLK254VFhwpyaAxuqinJyslOVUFUEdP1AN7IXMfwl70W
	6Fgb4GCS/WbXiJi8EliAfnBUhgN4xd/vHDmUu7mMEYyIyUXKSKSQdoM3SNQFJjqgQhJfVOjup01
	2znEr2GLssMy/o5uIBgqCtYYX+F0P7u82Y/xqRFNnCobJ8uSPWFUzRgR3M/Z4rX4Cz+YWWUW5oQ
	L/GcEmBIieGnVIfnZ1fTufnBMDafWbsqRgc4DnMsspKwsr6ThmHhKJ31SO215JoZzQeEgyaTwbC
	ErYESive2k+H9YbzMS6lZ/
X-Google-Smtp-Source: AGHT+IG4RoI4YqTRfLqMtHqERY+dKFavuI8R+zT2rhNFCJf6Ipd0EyH0ZjVfMEfxdwK/NE7/Y+RH/w==
X-Received: by 2002:a05:600c:1d8c:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-47d7f0a324emr36773525e9.31.1767709120058;
        Tue, 06 Jan 2026 06:18:40 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e488:b673:7409:68d0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d7f7035f2sm43558785e9.12.2026.01.06.06.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:18:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com
Subject: Re: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
Date: Tue,  6 Jan 2026 15:18:23 +0100
Message-ID: <176770907988.1004563.13571465521875416136.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_061843_882423_4BA042C6 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
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

Applied to clk-meson (clk-meson-next), thanks!

[1/3] clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
      https://github.com/BayLibre/clk-meson/commit/5b1a43950fd3
[2/3] clk: meson: g12a: Limit the HDMI PLL OD to /4
      https://github.com/BayLibre/clk-meson/commit/7aa6c24697ef
[3/3] clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro
      https://github.com/BayLibre/clk-meson/commit/2fe1ef40b58c

Best regards,
--
Jerome

