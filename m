Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB518C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1gHEnus99pEhhk1X+Z0rEei8S8+ToTCVA6TNsBFI+8=; b=E4VqqZK/1TNck/sOBuhX0/AXyf
	Jvk5q1EQYdwdUsCCiMFGfy7QiX5RPQJ+C5ZXHBFwSqYAIu1uSAlD3Nnjk0/SSUauopdzAGL2XG9A9
	yJff/bFXsqu/DuyXOAyK+8uKZ4wwY9Xhn0sddOcAs7X/GL0Psz+ubUsldaSZ/lt1iOF2WgKs/qFJl
	nj1mrFKocxk6uEvXgzKeMgZBQX9nMGBF8SBCwF1neIwYdMMJNu5mMx+8FpQU7jmpW9dgT8eTceOJT
	p0TLYH7AtZQeX9Liza9tkq8O2XRTVmFHWTh3L0B4OAEyJNyxRF5ooFCiO16m2rzQ3kxAv+EQ/OV4H
	4RyKFJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAo-00000002dU5-0ERy;
	Mon, 27 Jul 2026 12:11:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKAg-00000002dOP-1UsK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:11:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so14454315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785154260; x=1785759060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1gHEnus99pEhhk1X+Z0rEei8S8+ToTCVA6TNsBFI+8=;
        b=TyWB2Qaz5hktm7/FoMpT6Rxx82wtesKqM5y8tGGvCcJEia+j6KMpeCrQW8183Wd8k/
         bps9kZAIJVAOwFD7lt2D4ntIutxbN3KqGu+cKyja25jeGnU+OvNlMtBMoII47xr7yzMF
         N3IXhKLy9uo/BkvfPsrXibmR4ORuz6c0BmRW60ukyJLU/TJSwhnXa8ze2S9VvT2KmFUc
         7pqe3acD0nZ/7yVwA3Jra3t4uBzjcH+jF3Gy67WvCHAfv8q1VSXH9fq14x/INIZhbsGU
         TZFJFNDdXt0ijuvCRl3cUr9ottcaxrSKt+D22AIPaY5lmnzqRQtywhulYfFpaEVat5Fe
         d6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154260; x=1785759060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1gHEnus99pEhhk1X+Z0rEei8S8+ToTCVA6TNsBFI+8=;
        b=JyqRiCVOQc8YITMszZsrAHxChsIq3fhsOHeQ18Gql8rhtg7bcbddtGOLSAWfLpAOCp
         YdMznuhqFbK+X/+00mLu6/7CmglQIv1XA6pOeNFhkU7d8KHr5eZvJ16UCZOImV1Gl+aq
         ruR63+7RotbfTj1kA9vocPRdggduwq/ff3Yb0wEXnWopJcDteHSEf3B5lLdFn/4joBfx
         pRKVUoFOqX+Je8aQYktni7bd5UcfXsQtBz2DqFnFXi9KtPU3iizhZ7cV63aLq/XC8dir
         ZDpfXlKP/QCKSv1V8IfwmVbKB+JfLQMVcu7uhf2iE4OcsqqlM0GEdsb0hxU1LMyK8jsQ
         Ewqw==
X-Forwarded-Encrypted: i=1; AHgh+Rrjaxcy2tTo/wl0IXa39ouzgK9j1L6Ix4UF5UZ5J2zxQfaUe2mu9LdbHf/ESjsSl2zhlheoHF90OADS4R4u51uS@lists.infradead.org
X-Gm-Message-State: AOJu0YweJkoxBcibo/SvgYogw60DKk4OWu5jsHxm+oy1ANwgZ3ica1XO
	zsurdjn/wWEaHsEy2Wn2oBtVv3z3o2ygbMeMQthTwGAmH53QwzIW7IYG7beeMR7fj0k=
X-Gm-Gg: AR+sD12az9i0XhTHiDGMta8X9JJ2pHkDa5m5g5+4U7fffHdL+foVKSUlEIvArWJRdVO
	GVOyEcK7YpAYLR/hLfxo7jzB1u7nTPnBpFb66Rndrha1Tg6a3tUPJwdxZiMnDbf9umbymXdXbAY
	lqet4A7WXSxfulViWWbDCF2JpbUGOI8BJobr/cTg9eF992iie6L+hO57PVv4bPXUwvx+rwZGwXw
	4gHcusYzJLGagB1qcpjB4RXFLVbcNNCXMSd9GqOCwKL8jBM39UxaFYP93GrB9KceqSIrCpnxsVS
	qaL/+isZzZ7LBWKb+VDsgBnJjdIPQD1bf5uBm2RJxr208tCoJdllSqGYv2qRhmfZlj7tl3dlCTP
	WSPtyLGW/eljYaePbffPVTAoPjz76dOYxOYWQ4iQ0iAjD9NfD9qgVBbyvWmvZQS8HSnPGt6L714
	sRkd93pFUtm+3mGGtv2lYeb0B1fJPBkw==
X-Received: by 2002:a05:600c:1906:b0:495:6b8a:5227 with SMTP id 5b1f17b1804b1-496b56ff17cmr116342545e9.23.1785154260529;
        Mon, 27 Jul 2026 05:11:00 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:7aab:bc55:e039:4aac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm211778055e9.12.2026.07.27.05.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:11:00 -0700 (PDT)
From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 27 Jul 2026 13:10:42 +0100
Subject: [PATCH 4/9] ACPI: ghes-nvidia: use a named initializer for
 acpi_device_id::id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-acpi-refactor-v1-4-ff900aa326ee@thegoodpenguin.co.uk>
References: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
In-Reply-To: <20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
 Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, 
 Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shuai Xue <xueshuai@linux.alibaba.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Ira Weiny <iweiny@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 nvdimm@lists.linux.dev, 
 "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785154252; l=732;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=zrA6C2Wn6O6irBjX1A7U6/j0mruV7VakTyxcAWQ/gzY=;
 b=S6PIbfdwzeRS6uAnwlEAg/bFB4cywsN5K95TfQqHoJbODLCpFQlWBQM/pWKmzNszJMLADygl2
 HXSTp5kuGaRAoubKt8FGxqKuHW3tvNk9iqIksjW5VI4dh0qwHh6QbLA
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_051102_669410_AB2721D5 
X-CRM114-Status: GOOD (  13.65  )
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

Use a named initializer for the acpi_device_id::id field for
readability.

Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
---
 drivers/acpi/apei/ghes-nvidia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/apei/ghes-nvidia.c b/drivers/acpi/apei/ghes-nvidia.c
index 597275d81de8..1d3a6997a019 100644
--- a/drivers/acpi/apei/ghes-nvidia.c
+++ b/drivers/acpi/apei/ghes-nvidia.c
@@ -130,7 +130,7 @@ static int nvidia_ghes_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id nvidia_ghes_acpi_match[] = {
-	{ "NVDA2012" },
+	{ .id = "NVDA2012" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, nvidia_ghes_acpi_match);

-- 
2.43.0


