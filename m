Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A2ACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=; b=VmMb2Z7D6XPFoJEY0Nv1Xztwer
	lGPYCRmTbNekH3gLRUrObG1TmFH6TBE9joCB85itaA2AqFAWm7ZEFZTyEYYx9V+4FsVvGNhu2kpyK
	/F6dK0Lg+sAq2fbeFsrt4DxVCb8uy4IU8DJ0Bfh/vtRobSZUxIQ4vLVBxAWul0R+WkRkPInKmtqPT
	U2QZRrnrxdp3EH7YP3uJdmrW4Hq1dKcCJ3JVlSnPnCkbnUYJXPw1ubRNWrtPYyGXwdheAR15ELV3g
	315nfy2ec+eqy24jXJoCMvyIPS02iMJ9m38aH6ze+7vZyWmJ+BtEros9fPXM58TZ5d88M43IHv3nX
	jWqDGN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsq5-0000000BZQL-3VSR;
	Tue, 12 Aug 2025 17:31:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulns9-0000000Af04-1GoA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:12:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b7886bee77so3903482f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000776; x=1755605576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=CEbRgd+0D4KB/GddV9WrBK4txOc/ARbuA81OFSBSm3P92uMVshgKxX+pngyHfo5bNe
         dWf6UE8OhiAZDqaM6Zb7gFPI3aYn2zWYbF/jmsetKhec6EA9GdoOGs7+ivfjEkhIz9cW
         z3+/ZEcwJCJZ3L/YXb5DKl8oCY+9l67ZrXgu8dd3RQVxt9U2p4TE/rgZaZ9cMe6Bl1WU
         LUK7ESXFNROL5RUrV8JDaU5YbwWs4/0tQSgWfTpUMont1WY5ce+6qi9q+V3QnR0YKtiS
         28ICRqYRumAc6vx3o7GefcYuwTtbNPAiK6uffEpm6kZl+oWD1ZTT4tPm8SGrZ71rHd9c
         CX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000776; x=1755605576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=u/T46M3gExiWtHhQ7PcRB/jmKTcXzVvYnFsfOTaJLX26cMgc1U6IpJ3so3iV67ti+c
         25DT+1Bm7Hk/A4ac+qqhygat9MUbAFwo1p8nYHcaU6bhDBhoZuTaZ03RX4x938DEnF1K
         HsaI0+XBSeh9Kzo+gkgFTJO9d5bNdoPwNhKHeU8aI2eHo605vyGpuJlJOlrGFKQlPwrs
         R1LC/hDE9tzlJjoMahBOKnk3LlU5i/wdYlsC/CR2iETqXndB8434rIWwZTwvEhFeE3Bo
         MAtxSEPjX5tyeQj4kNE94hFPd2hovJXt/DRcuzzvP2jI3ecjYqyS4GTyjXPWUTAXvD/l
         fNFg==
X-Forwarded-Encrypted: i=1; AJvYcCUR0bjFOBik+YZjN4q0xezsVQx2VHU33GP4+BVdU0kCD9VlQF8jvuRuDBbdkd/J51LnSVKtsyG645etK1tWcszn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Wd8oPM+s7xazgVDju8ZWp2QKNkL02fRCcG/hDmTtpwhERDE2
	FoQbUmFfn1S6tWEx0FCnOCoJFw3yp+yfVqbQ2Ld74Pqxh5yA7chbXVvnZxC8Uvniav4=
X-Gm-Gg: ASbGnctuUzOYE7KfZ9AyMTJoE4o1pjuiIXwbvFfsYAS+cJZYAA2Lj2Crr/omgoX+yee
	UywRiufaMM2pFPeBMYov+afIyi9x+jTFD/kqtftiYwco/4gi8Wd1xp0ErNSkQRnVRvFqVu2Aegf
	u2LO5L3h1+lSWlUIWSDmffPsTq6PPspbHmE3AUJ7mm1Ypm3TRVo6lHVAhn1dRnOtx7v0WHWCo3v
	5sPEykkN3kDm3jGU0xn/SRlUMZbYxE8jc53buodB4IBP8x0jWLMaD3ugYcHVQNJtYO9k5GrRshH
	A+HRk3MBiPFtIYR+lOXmAQaSIApx7NxwhJzSqsHIOl53JtklvPcM26zLn+His28CobIEleJCEbn
	GPvvWdpXuiT/+r5I=
X-Google-Smtp-Source: AGHT+IEGQDIavEdwAVseF7zTTEBlsP3iW7+rCM7AvFwCujx1KCDQS0QsNDaVetuCN3LIEKies+x0jQ==
X-Received: by 2002:a05:6000:4283:b0:3b7:b3f2:f8b3 with SMTP id ffacd0b85a97d-3b911007702mr2510510f8f.38.1755000775696;
        Tue, 12 Aug 2025 05:12:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:46 +0200
Subject: [PATCH RESEND 04/14] gpio: ts4800: remove the unnecessary call to
 platform_set_drvdata()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-4-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy+/9er37Ak/sFPPdUpU+bYimsPDTN2yc6x42
 FQ8FY/oejWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvvwAKCRARpy6gFHHX
 cs1kEACnksREk9QmO2FhzrwUyQY6DFqRCpWOw11t0IdlkTmT1crGP48e6IKjx54SKHyp4sN42jo
 stgwcLRvwFedR2zvmHej3NLE2HegxIm4m7iEfrgRnaPO3fLODyWUW/lMX114rXBqNa6GrspT2ne
 dP5ciZfuBXiSlsOVW16bgOErzHt187wcG825R98099jTmshxHjqsrTUlIsEsTtrLi3FEN4zIzv0
 hr5+6atZ0zl9joHZx2V7PTzwKZGbgzWcQrs6PieTOlLSiSCvWomMaM/tZhuro2JemTnb476JlhH
 //BD0Iw7ncTNdylkaDpA3Xb3JTcbgipc3GNuhp7mJhdruTE7AfWI0V92/a2P4rWfWSHPvAurGnC
 Nte/Q7KLeNVJzz1rv1O/6Phap6sCLBL7Brkop+kaa5OQPDW2wWX6fBTiC+UiYm0E5WwP/JhhxYK
 DGTWaHo7PDMXaxR9zrtJVnPiPLa/RRbAx4MUpsbEFx60d6vuyTkBFj4iDmVILm/a0fd0BxssCA5
 GvKxj0iXDd3zlORV3S3Ux716TyKOEVfwghYqPxOs5ZI84XPMKMuo4zsZXniZWfY+Cr690AiYvcX
 f9lCK5D8o3flMW7LKN5i2yjOd5DAJAHljz+naFZ34U5udYaR5ywzIftABA2Q0648whgtGJ0IEGM
 uS04lz8L4PvZKuQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051257_338990_3191720B 
X-CRM114-Status: GOOD (  11.07  )
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


