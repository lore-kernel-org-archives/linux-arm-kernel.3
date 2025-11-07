Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21BACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsuVQU0kBLri6hmaJgWdFh8PrREavrj/lIeKnMHCYnk=; b=tj1XRFA29nP+YV8C6660pgAIM+
	uBGLppUj0EhSlBmm0mMYpOSb8/QA+U0Tl47Je9xOHQ5HhlJJ2L1SHoRJjKsVMrqZ0TQaxHO6e3KZO
	FGqpX5ys3EJl7Dbc3dUYZpM6i37bTZNyavjEuMaE5wHXJrZonTtzJ0BCbz1Nq748buzYDQGL/yCgP
	qb9VJngl+55Cjd+WldYway3cNTdfiJJDr8CIyP0WPDCfEkQpg/VwDZ6f2/cGLWvU8uj1XPAYsDcLq
	B55m2JVNVqJxLDrM3i9KG3CkJaHntgVRH/LWeMHwasT7wkcwKBlsCVvM/5J/Y6ShprladnQrh1lw3
	m1hDX/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHe3-0000000Gr0F-2wCu;
	Fri, 07 Nov 2025 08:16:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHdz-0000000GquG-2T6Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:16:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477632e4923so52505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762503386; x=1763108186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsuVQU0kBLri6hmaJgWdFh8PrREavrj/lIeKnMHCYnk=;
        b=kA1O2DA4oQ0RifJyTm99be47MVMigC8K3cWIeKWXgjGaLVTMdpT/JNlMI9TdeqKIoo
         2B/0VPUFe6sCqOi4I+Xpli/fUY41ecnmeYSWe15asf7GExQ+ptVZIDVG1wKpEtO7YYfa
         Ylg+MGhiQ0Gkkw2Y4g/QeUr6zg36jMlNRF52hBkS3Om7OavqaZk7KDTWldIQ8E/49AKt
         mtalfUFS8LExFQIbU+jp0jIqBML7GKuxCJiJmCMvXeQM0vCstXJZKe9orZ9xVSfNCnZr
         aB6utIjLHameYvNFytqt8XW9+1pGBDuP3WJBH5zQxEqp1ndDHyIkDwn3Nw0gXoDeJr7d
         Ckxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503386; x=1763108186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DsuVQU0kBLri6hmaJgWdFh8PrREavrj/lIeKnMHCYnk=;
        b=OqEI9QJCnBOkS9GxHc5Wp8Y8PSzPlJhojm95khYO9JQs2zf7hK4hyJnmZCJBSGWCg1
         R0iqjEOOLqTlMQRkHZd12kFszGMczZ4T331yJcWTTigdd+/DalG8Xd4rjkzNWUoldnhN
         wXAUL14v0LshN0mEBQ7QHAf/ki0B3HMPb0PBd+y/i4wf3r0JD8PowVlbX7NFRju8r3+M
         QvZ13HJuHEBcc4GkmPVBIhhtCI4ahTOL5mmR6nwVa2aCp1EH27CsM6GRWJCI/LgY1U9Z
         wOzsp6o8jVbNn07N9K3xh46S4xP8z7pfUGNVZ5Fjtq+496akMoByQdRJe9bMxljkoKcC
         b/vg==
X-Forwarded-Encrypted: i=1; AJvYcCWBIqNd91Nmd3DrWw6BV9nVhx5q+QOLryEsVMCQXTtTwcjtRuimFd8oJGD/5ctNGFlyD5P26yoxT8dj5lkRS9bd@lists.infradead.org
X-Gm-Message-State: AOJu0YzU1lCrdRlhlEDMNGy7GHu4cWPstKgQcbUZiCtxSjUDcpQ1l34g
	GpxbHg6hnwLyvX+HaXv8vo8DdAJTaLIIZCo5h+vZzycrC3/zLXuP/zFMKHSF+HkcRf8=
X-Gm-Gg: ASbGnctcQxBKt/KwbSzJqUDLBMSXxNS5R/oSGXPIEKEWN7jAm0+pYKoy9bKNcKa7QhW
	GSMTBo+X6wfppHejgYymQGW75y3uf4oOmdysHVbylCMpuCn0gzC9UxE3dZ0LHVJ9U1eW9o1uI10
	15Eo3rflGrYJTrxa9KqOHCCOhB20INxp3foOivMkYaItr01n1yg1/+URhjZdxjhK/PQOZF4eH/e
	vQzrjw5GjAEXxpFOm3kEuQvl9KFG3REhiIe4rBdpLFHJ3qUap509iIasv5TLKzqpF26iZuH4XQZ
	HwPDhHNVjgMRmLvAIheTeQ+ECyGRJkaCjqZqnk4m6dUBE+4u+f/3/mAQeEBizh+ZUDFyQacpwT8
	0oligRrph9mGXLH2NBouhWdju0lGyOvNjHTY7pbJgdIqxfCVA62L3ODCXGHeYQDDxUoYJWjF0ir
	/HHKLjuR7iatzK7SKj
X-Google-Smtp-Source: AGHT+IFxgOKWXdA9hWEwZIFjaH0GhucMIF9IisWZHUQzXCyuXWttToL3uxyrxQ7VCO2D5ii7OFEQqQ==
X-Received: by 2002:a05:600c:1e8b:b0:477:10c4:b52 with SMTP id 5b1f17b1804b1-4776bcc83e6mr9398415e9.8.1762503385654;
        Fri, 07 Nov 2025 00:16:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm4058381f8f.46.2025.11.07.00.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:16:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 07 Nov 2025 09:15:51 +0100
Subject: [PATCH v2 4/6] crypto: ccp - Constify 'dev_vdata' member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-crypto-of-match-v2-4-a0ea93e24d2a@linaro.org>
References: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
In-Reply-To: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@axis.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uTmny2khUfJwBOWnPIYMUA8TMxpeqbiVOa8x77OKjl0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDarO58OSSjeZ/MbkGRG/cmhslRbHT8xse2e+1
 3RK3Y6qelmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQ2qzgAKCRDBN2bmhouD
 19qxD/4xxZP3XPx4HmiGMoIT074VwmZlKVGWBPALUzJR00KUN6qkjf6aQiGyi0BJz003r9FHokB
 P0LFjUFRrWfWAJU1zXKVFaSOpjH8bUHhgrbmhvEnApKXXUJ8uz3c881SYC+Pj4yAOFJyzQNvh2a
 oNkXjeha5SsBI4tPj5Rg/+KnO5YOZbeZZBwICbXJP6Mp6IpukkOIC4TRJ12D5e8oJdd01JmIs14
 TOQRnkSfFYuswcyIKYpx71MfgG519BRUl9mz6M9OzvCL5Eko0+y75Cia8br2hxcaGFTmLpJgYFq
 DTjvd7uY9iL6xyexLutvlVVXirAUtfdV8oXljVl9u97k6ze4EmyH/OCDq35yVBoq5rfF9b6F6YZ
 pnrum7tp+9BqGkUgPz2WBavP9wWLq9XMbvHm//4hVtxm9UrNyiKZXOds9VKQbV2liGu85jFuHcn
 63PDdsOQeR1l0p1CzTwc2rEWweOtct3GnKtZuQh7QYgM558EW6bUhB5RKotm73G+G3WG7iJe562
 xSE67xCo3+xfbFfGVCAwI4fqnyFNKD8HTtBNmhLiecv3+fMLJcv08C7aieloXxXG15HhnG9uYry
 uqKL4SWxJA40IEQjKxB9U7zSfNprRvNFNuykzVhhAfJ1hg7RWDkX3Z4w4Gvd6qNhvIBIcidALKi
 ubXzajJ21fyB7+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_001627_696412_C4796D2C 
X-CRM114-Status: GOOD (  15.16  )
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

sp_device->dev_vdata points to only const data (see 'static const struct
sp_dev_vdata dev_vdata'), so can be made pointer to const for code
safety.

Update also sp_get_acpi_version() function which returns this pointer to
'pointer to const' for code readability, even though it is not needed.

On the other hand, do not touch similar function sp_get_of_version()
because it will be immediately removed in next patches.

Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/crypto/ccp/sp-dev.h      | 2 +-
 drivers/crypto/ccp/sp-platform.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/ccp/sp-dev.h b/drivers/crypto/ccp/sp-dev.h
index 6f9d7063257d..1335a83fe052 100644
--- a/drivers/crypto/ccp/sp-dev.h
+++ b/drivers/crypto/ccp/sp-dev.h
@@ -95,7 +95,7 @@ struct sp_device {
 
 	struct device *dev;
 
-	struct sp_dev_vdata *dev_vdata;
+	const struct sp_dev_vdata *dev_vdata;
 	unsigned int ord;
 	char name[SP_MAX_NAME_LEN];
 
diff --git a/drivers/crypto/ccp/sp-platform.c b/drivers/crypto/ccp/sp-platform.c
index 3933cac1694d..de8a8183efdb 100644
--- a/drivers/crypto/ccp/sp-platform.c
+++ b/drivers/crypto/ccp/sp-platform.c
@@ -63,13 +63,13 @@ static struct sp_dev_vdata *sp_get_of_version(struct platform_device *pdev)
 	return NULL;
 }
 
-static struct sp_dev_vdata *sp_get_acpi_version(struct platform_device *pdev)
+static const struct sp_dev_vdata *sp_get_acpi_version(struct platform_device *pdev)
 {
 	const struct acpi_device_id *match;
 
 	match = acpi_match_device(sp_acpi_match, &pdev->dev);
 	if (match && match->driver_data)
-		return (struct sp_dev_vdata *)match->driver_data;
+		return (const struct sp_dev_vdata *)match->driver_data;
 
 	return NULL;
 }

-- 
2.48.1


