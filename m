Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53985CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=; b=3d2mvW7aj3MIaHz+U+ov2R/NS7
	FTmgYQwIZnfCWVpMA1gtkIg/k5Qezk/roO4NKQcFJ0DGSv8fZ28dM6j1Q4yq8oO48ILo+dnUR7m8d
	Rno4kJpjg6XvzCLUmVLlD/l5bTvQ2cDJESdzV95Bb/6A8BOr7HosPXDCpeFD1nElTFs4+qYpmgJOo
	Yrr6gtwSv123PuOW+dbNwM0X/+nwqEhyc+oRDnZEH0m6Zn7sdRcN9OjH9ff3ZTx4vsYct9fVPxyOe
	q4LV/31KIM/wuM+eqdg0+xN8CIxej3MtoY2nq7uuDgSZzMJA8DNU9GWSO8rflAaDciS/tkVbzZ/Pt
	tqp5Y8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloKQ-0000000Ap6v-0hmj;
	Tue, 12 Aug 2025 12:42:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulllq-0000000ARwM-3clK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:58:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b91325d79fso201554f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992697; x=1755597497; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=ZkBBYmN0bdhMdOXj+eZYr0N96AcAN4g7EB4A17CwLO9s4AqAVmhaYWC4cLGYTlHlq6
         RJWMz/3Jr3mJkV6wBGLjetxPLMvVTqzLytkJ25gO71WzNxMzVsmn1HORJTtfXSm/3dER
         Rf7wDlp1mFt0fUfmpvoeSegJIOds5G8aJkquRlLVrvwrdgHxfeBKAbJlTom8Kzt5ME2W
         zWAE6axy5ljG1cb8epaYhUpM8b71b51Ao1bkVd+uhMHkxxIXDKrdKCFXluclN5NzZyD3
         K7V5T1P+Zac3DVKmgmbKflX/RrctTxzPND3KX6sDUlsIo8iIjBubb/2O5j94SpjBPaoX
         g/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992697; x=1755597497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=oLhiVBdAOWT90urRr6oQ3FJwauejhVXsAcBFoeTysclbvC5nOm1/6L6JuBS71Y4N62
         FhFqHK5eNRxGMVqa/C+/k60VS5rBDZiGw+762ymSFpAmgli2NKireM0inlU2WqF0gaqm
         +n2/nQC6IQDQaqRxKE4FgK3r53RbuFFqcSzF+XyGrg4+hkspiHzA0bmXYKYycLuO65DB
         0Pr5GuB5vBeMju/dZ8lgRY/mCw/DJ3v+LOVHCdVY1Lk8LHhLOFFBLCyeshifsY0wJgeR
         I/cW+nPMgWtm0AL95C5FA0nK+Rhi4Fnr9JbkbJmPiqG24AZ3YtAQn/JtqcLIXMUE0uPo
         uyRA==
X-Forwarded-Encrypted: i=1; AJvYcCUnXarR6Bm6vzYQe79tUxPiIizuSXCoSZkfunMEwujYKnk7mThmxruDau/B7XdyZI0NHrQqyuGL1ap/7yF7q887@lists.infradead.org
X-Gm-Message-State: AOJu0YwvPxZgr8JMNN72B1NKvuXo+0RXKxpnTQ4QXUS6DRH1ICwgO34T
	hpPh+qwqLZewilkbJoO+pH2Co+wML4SyjgtQ/mI2Ys/03gO2kdSCuayavq94sP47Gic=
X-Gm-Gg: ASbGncttRms097w3TGioq9X8tdUCHWbbSjQPcloWswWawdv+TB9YBjedWJaOTqaXg+l
	628Kap0eCdy1pZK+bvmjIWNEFCAj7JFMtim9GAjxfw8bRzq/D6sFwixTuj7xOw0ne6Ksz6VpUWk
	CfVwk4bmYBeEi/UB7UFjkIjChmX3Htr6FofH2vnKW/PhBy62oIRPPch5E3MKyINjPIikSquerFo
	Wsnu502r1jKAsjTyQ42YSJE2DRRx1xMsyCf0CiPhhfKoBz4jtymA3uwJBjED8XfV/HcuKIdBQlm
	OB5E3qXim9y03XV9ulHCzluHXMkR51HlW3CJed5CrNjpcDCmL1sD9TbsPo5UCGPmL4+0+tiSpib
	+iNRh/0vEGEdmRg==
X-Google-Smtp-Source: AGHT+IHRuf9Zfi9PzGgyPVh37Xgjydvr8aSXzszpGWT41zFLYyVLO6nnKW/PTOyONBw+Zn1PxnpakQ==
X-Received: by 2002:a5d:5d0e:0:b0:3b8:b33c:b8b0 with SMTP id ffacd0b85a97d-3b910fcead6mr2198938f8f.7.1754992697329;
        Tue, 12 Aug 2025 02:58:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:57:59 +0200
Subject: [PATCH RESEND 04/14] gpio: ts4800: remove the unnecessary call to
 platform_set_drvdata()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-4-8492f4a4c1e4@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=l19XxlCMzrhQb7segGk57h4S+g8U8d8cxgGqBJH6nF0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAmQ8VVYuLPJ+NvtCUKxwwpTeueQmO+apEl3
 9TV5OY00wCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJgAKCRARpy6gFHHX
 cvc3EACcX7GU/Pwn1Ldl+Fkg7yiQq7EIoMITm0XQtBUjEbJIax7rXr4Dv7Sl+4dx+FGx7VTPaE2
 IgRMXoRuaiwrI2Yama71TDv/xC82l07VLOu/ep6S1/QlBq5KJxAB2tQ2+zhl/+8Y/3rMcIDkAuZ
 lFt3A7zioNi1u1zAczyHPhW+A7VmAXkCHowsbkKLhgDtJo7X757uodlPRQY7ri09NiAYFH+IjOb
 /Jz3W0Pz/9sz+57MM/npiFL4nFkOcFvSm9kQMpQJYLLrn76qTDsBXioSSSoh2qd5yjT5ifLKFRc
 8++qj2iSLg4fF20xtFmvXxnBB9bllu6oEk4FsRRa3jGq+ow22c7ECKOFd+Rxx4aDmcSATsbL6wG
 F/Y1aBcNanJA+sY9ZVOWRvL+w2YiP/bD1PzHoDOSr2+x4KslWYMwMs0PaZjXQLJKGmRyxAxD/U3
 n+zho8Kh4R8ll/O3gG4rg0EoIxIERPJH81JR4Kxjf7gWgswVFRzUlZJA6yDI8MLYT7ybKE/ZEEv
 VDlqD0Fhbeajkc2AfxcxshGQyTNHG3W7V4Q6v9gKWoREOfr8Wt4WCbkYUT/1UTceTe80uGIBioS
 9gMmlinP1g7ZxzDtKx/GOvC3JRkQ26l1jjk82a1WkrYJ3xeoSLRYhA1kulgQo1QBrsH8CLKHyLq
 GIG305w3i1K9fYA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025818_894989_05AA7072 
X-CRM114-Status: GOOD (  10.97  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no corresponding call to platform_get_drvdata() or
dev_get_drvdata(). Remove the call to platform_set_drvdata() from
.probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 4748e3d47106cd2db6a994928b20f76921540a60..86f7947ca9b2d23292c1e6660fe93c611e0cb837 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -51,8 +51,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 
 	chip->ngpio = ngpios;
 
-	platform_set_drvdata(pdev, chip);
-
 	return devm_gpiochip_add_data(&pdev->dev, chip, NULL);
 }
 

-- 
2.48.1


