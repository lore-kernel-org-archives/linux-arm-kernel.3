Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7042FCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7XA/vKBHH8dmFPLF0CvhcWERh05nFE3P6i58kyZClA=; b=NqSu47WbjyVaDjhluirZnxGIIf
	YEYJzrFY8+wvbF9K5aZuTtS/FsoldW7uzzk3MWR3rDSSLQDdX3sJex2LT06SnyXpmhO9e5HoBno1f
	uAsDHzdB5yC8Kj1LAIzIBfpbUBvgIAPzQ8iUnsBvMij1Ggx2FI9DZmMkcheMcGJSaeWxd43ISVKWj
	BGc7DYROSL5gIR1bfeB83j1+o28715m4w+W0IPjebr4y42lBRPFSAARF1lAKYiNv8fmWlH9kQOzdh
	Bqn5h8rcrNtBh42ZOAvnhp8JIzQRsIigV8Upks+bWjUbNV8HL66RgCxcTNfrz7UMjhl/W+SlY9d5A
	C0fdR38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19Y-0000000DiBO-2Ewx;
	Mon, 15 Jun 2026 06:50:36 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19R-0000000Di5y-38lw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 06:50:30 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-304ec41197bso3267424eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 23:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506229; x=1782111029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7XA/vKBHH8dmFPLF0CvhcWERh05nFE3P6i58kyZClA=;
        b=kOzHXfUTULZJE7Sw0iyI72C5doOqxx+eta1BxZll+vTU8sVFiWDq5NHPiIyDKM9drM
         dOztzV47o+pTmNLCRiEPJTb66k7mfGVCL8sBduF9RPjaGCNtuTMg79SGxmH1YL36pDnu
         M4vJGMcrEzTE6hC1zpN6c6w60N+b8JfFCcjA6iSBizHvaMVUFNLu2dCQEWPI+yQsZIde
         JlCcQX4OhuPgwv8IPMXKd3Jy4VHubPoXd+IGY4pbqmnnjPnHtUZfuvUL/DAeXBEDwTaL
         0Iod+fE9FlxkvpK75oSKsnCwWICpdfDncE8CeFkjVdecey11j1JT6x/OH1zYYo3EapXX
         OE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506229; x=1782111029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7XA/vKBHH8dmFPLF0CvhcWERh05nFE3P6i58kyZClA=;
        b=cp2+ICUFM69UjwZDNbYYbdePYEyLUPrChsl8cRNRipPCbsBj77wZoey7zko1S2gfe9
         62U9FXse7chYVwHq8EtxjJ3Wxm81HvC5pI9Xa/rKlTocOY+Aw5pZxUEJmYqPjGUxpDYE
         /sPNUgN2C8Grp4irPkfO7jW8MtdeuXhob9bQ1ei3dsMaDvJ8lMSyJ27avXhwHGVIPQvl
         AvQNEFr1I4rRb5VKQAVdre5MXvP8wMpRHgeT9H+IqPAy5ABjyxoOPLCafzyUAttFBUZW
         T/sur0puRTcLqAh4E8auV9i35d9jNxHuQvk/vFKldigIGvG7X5RBOD4UpdWvR0ynx/at
         qWTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NZjKk3TO1/u5+VVUjG1q/EsK82fg5mMLPNh8DwtC2tg6TGBtSOmHaTKCWg0MQmde/sojtJXVUPnFN5+H/8jR2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6oFPUlJR7CiXKX+C9VARZc5tXRer6NdK/p4NM+RJSMw6mDmpQ
	Zp99bSgtYj1V3r2cJrHm6MBpkQBdxFsiT8bizSODelmKpErtdDyf5ORb
X-Gm-Gg: Acq92OHXCPJXsOeWH9SmAzCsn1Boz5d2YKCH2S91jTe1EduLXV02T4sYuieqlFyRqAV
	r6jhazmL1Zjj60ZCRLaB3FoMCBoAZ9eJs6H6v108CKArqTvU/HZWF33aUcr4fSjzfkIETisDqxf
	wXVU3n1f2T/ZPJGE2gZi/9sDIrmS+0MlrbaWiB6QkT2SVWAWj/0ukOkB6PmYV83uD4LXMWNl8Bl
	Pcoz+pdeEMJho2Ol95JC1y5Qdw3xOUH5Nfel9CN+t1kw8yo5rtUTLKOfk6N/Gl/b1BI3yJWX8mF
	U0abelAlOM4UcIazxBmcaqhzHKd9bm+y16ZOWkevnCwg9laCHiNCn5YAK/YQZd6rxUwFV42AkH6
	bvo8er0q7mXbfagcU840F0u+4rGWtkNonXVbthqDylzGhQZz8Y2I+HLqv/18XPtKlnvW17KUdYC
	GuHyDWZHk+btZatUQcZmbpVV+YJcJhZJJEc5kZp9YP0S8Ii7WkEFLOebkUebBU4Ur1CnBl9WNUa
	VPFoYO7r5eQ
X-Received: by 2002:a05:7300:6426:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-3082004a336mr6289586eec.16.1781506229088;
        Sun, 14 Jun 2026 23:50:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:28 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 5/6] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Mon, 15 Jun 2026 14:50:02 +0800
Message-ID: <20260615065003.76661-6-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615065003.76661-1-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_235029_795416_C6CAB5E2 
X-CRM114-Status: GOOD (  10.96  )
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

Register the Nuvoton MA35D1 DCUltraLite chip identity in
vs_chip_identities[]:
  model       = 0x0   (DCUltraLite; Verisilicon uses 0 for this IP)
  revision    = 0x5560
  customer_id = 0x305
  generation  = VSDC_GEN_DC8000
  display_count = 1
  max_cursor_size = 32

Placing this entry last makes it the gate that enables MA35D1 hardware
recognition only after all the supporting ops and DT binding changes are
in place.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f778..7d630a667a3f 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = 0x0,		/* DCUltraLite */
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.generation = VSDC_GEN_DC8000,
+		.display_count = 1,
+		.max_cursor_size = 32,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
-- 
2.43.0


