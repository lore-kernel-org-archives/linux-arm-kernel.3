Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B94EF3D5FF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QVjoQBkXiGI1oWD/lbihuPbS4PWSjwfos2KaFS/Ehss=; b=aB8JkJWuUZfYK2L+ee2dTDmMPk
	m17ENd8SQFZVI9LkbAUiJ+hQrpnfLEhi9cUJ9oRPOPhxFVUXltu3JhCMItmBQYWkABZcaqOqc8Pah
	Skc77wsmfX6P6XzWRYJ/gxEvIwTRNkoLg7dTBXdc413m2TpAHf4kAkjlP8tbBqax+m65jQk9EzuU4
	RK92MGQWM1j+iGWS7v6Xz9LuzmMP1WJFQaSsZXPiBfATnSFWcVALkS5p9BrLLZcctrmclcZs0cymC
	iVus++iWeExVd9js2KrBNSvUFLHUZpl6/xCdRpOI8gVNYdnTLRmqPGeD9PMbmp9mqV6xjXJcPEgLl
	DQ3/pN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6o5v-00000009rPO-1h1t;
	Sun, 29 Mar 2026 11:14:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6o5s-00000009rP2-1jJJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 11:14:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82c4b5dfe6cso1653264b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774782851; x=1775387651; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QVjoQBkXiGI1oWD/lbihuPbS4PWSjwfos2KaFS/Ehss=;
        b=UDlynl3TygzsVCUF0VcKrDPiiQI4s8Q3K8X/wWHrdsg/I5sNp1HtdHoiu3IgjaU37R
         Ldv/ze6D8zcVWi8kNmQkvB5qWDMcg4HqsDwwnUm+GSRL4/39k8+Hu+NrGPXyZ47om+O1
         KSG6oIRd1SdRdEPdMD2gXCCPkLy1xNihTiAjyV431lUbexNyQb2LwzUEvRjk3zbhxjm6
         qfbnuOzIRSnH1FCwYS4h+GkbYHiGBIpUsBlABTKBvfr0zN34qhgEkhCjHqW63zw4l+jl
         /QUTXoj7sQARxii+9joKJyxUkU/pMAUScpRwePtqETc8oppag8FBH+deiou6ssJ5vRwO
         dEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774782851; x=1775387651;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVjoQBkXiGI1oWD/lbihuPbS4PWSjwfos2KaFS/Ehss=;
        b=EoOS+XIXF2GcRIaPRBHbO9SGH/L8vf5LXfar6Lw5xYWXOBBFA4Vc8V7KSg1QEJFKYn
         fJVSE6BaJo0JFv3RCEPppB8LSvEEc3TZiVAVEcauguEaAYx15fk3G3d6DYINir2wykZS
         YtsbUjJb4WFy4nWuCQYE5FL1HvoUHa+OWvV19I9Vbd/9eKgRAGLbIfNMPLm10JzyX98u
         dPpm9CTTc8Oxjl7LIUKx+WxDycSw7dBgo7dHVFcVU7B2OJn0i/FLNV0pN7gcu0LCwM6k
         kQsYxIjxdPkPBbzXNns6icmUmzgixpPJ09j0L6/lbdLjKKXTmcNflzENXQONgCsK1dS0
         EXxA==
X-Forwarded-Encrypted: i=1; AJvYcCUoN1LdzdrQmDzY1hgK261OpCqoawEsN8nQslD+pirxrkdYVTWkZF+k2Fu4Sxu23PpIXZcsF512KvgK381+3r0Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi2W5rKfLreo8RPoZIdyR4uVf4ypZZ5qs4jbv4kWd413YL7WIU
	IwbIMhGXl7nU6pWb4/Brn91bBHI9SzvtajOxFc/3bFRv9+Zqjc25OWIS
X-Gm-Gg: ATEYQzxHmSJdzvw+56u4+lCgzJfhC+eedtiLu3vqmtmgCHeGn68ZvabxkuvJB/cjSH6
	oxbLY4pSPKGfFwZy7gtzDiNtEWWD5LnBrG1hOJeO/KSX7ob6TSqv/5JUbpukQkJQBVK+g0dLsoC
	w79DazBf5BDgSI2D8rKjcQw5pMBTVv7KZEhjAGYsKMItIzN7OWOKGk4tpBoMkf/BsbfYyT3EkPe
	oL5N6d9XOKujDBg3Ph2h/rH+HGsq6tbkg1RAQUv8LncWgkdnwPIYUKHeliMh4FqTCjlv3JTDIlV
	VO3Hc4He4KJed3FCpcC2msXiatcdRWEAJy6QJHncD3va8ZJ/y2AdSAwY9RDTaMcACY3vBASnUqA
	iwwEPmZamlOksmeL20rE7/jsnWl48M5GjOGmxWTAXAGm2wcl1T2WFXIpvbus0preLVJ+txIQ5j3
	pAytPmfDRyndGAsXJ4Mzt+4FEk0DU5lJB+1U0r
X-Received: by 2002:a05:6a00:2395:b0:823:ad3:4ff4 with SMTP id d2e1a72fcca58-82c9605da6amr8434908b3a.37.1774782850914;
        Sun, 29 Mar 2026 04:14:10 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc72asm4266744b3a.48.2026.03.29.04.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:14:10 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 29 Mar 2026 19:14:05 +0800
Subject: [PATCH] spi: stm32-ospi: Fix resource leak in remove() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ospi-v1-1-cc8cf1c82c4a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH0JyWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNL3fzigkxds8REUwMzgzQDS4NUJaDSgqLUtMwKsDHRsbW1AK/8AIF
 WAAAA
X-Change-ID: 20260329-ospi-6aa5060f090e
To: Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774782848; l=1157;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=u+hbg2H3lOYYW1ebDQugMjdlCQVFZ+T5/ivVf6GLPhs=;
 b=Wc+RgivG/glkyD6BlqKjX69NgtVzBwdBy7l8yiL6UpV2oi7bjj4Pt1hW9blTiLqjXXkYTkr2Q
 oNytratwqJCBjE2tZt6rpcUGtyqOf5tFXsRvhdA1IK+XuVfSZ9CeaiD
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_041412_491900_88D12BF5 
X-CRM114-Status: GOOD (  11.55  )
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

The remove() callback returned early if pm_runtime_resume_and_get()
failed, skipping the cleanup of spi controller and other resources.

Remove the early return so cleanup completes regardless of PM resume
result.

Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-stm32-ospi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index acf2d182e8b1..192a20de1ae6 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -984,11 +984,8 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 static void stm32_ospi_remove(struct platform_device *pdev)
 {
 	struct stm32_ospi *ospi = platform_get_drvdata(pdev);
-	int ret;
 
-	ret = pm_runtime_resume_and_get(ospi->dev);
-	if (ret < 0)
-		return;
+	pm_runtime_resume_and_get(ospi->dev);
 
 	spi_unregister_controller(ospi->ctrl);
 	/* Disable ospi */

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260329-ospi-6aa5060f090e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


