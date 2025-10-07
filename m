Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88F7CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=; b=S2fU9fzRSED1mKBnJKcmPjIO9t
	lG8RmruMz6xXzCAA+9nvEBON+E3g56Sy20Unj5MyVo9flubKql+hXILuBd3omGbnriK5bkH/iAQFE
	UoEQADKo7Vgn2jSr/FrrPvXKecyLFdasju3LgwdXPS7xwq2l9wMOd7UEqnzp6qhHA9CKXqN+2eR5s
	FkV5R55odDdpKeU9FCHtsf9KFalt/FC1OOSH8zkYakxeTpXYR8UnCTgrGxrJf0zcIaWfEoCeNllU9
	p+dzyFjA23Ft5bA0OH+StRpDa9ysWhXGGI9qEsEqlvNFbTOjGFJnzDuIf3PJ58seFqWcVfmxnUXUF
	r1zfMYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65hY-00000001rOI-2Fnz;
	Tue, 07 Oct 2025 11:17:52 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65hW-00000001rMQ-0lTW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:17:51 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b57d93ae3b0so4148517a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835869; x=1760440669; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=aT12caChNCYzIOXjmm2Dr8jeZFWuNQEUiONGE++/X5Is7BVKuLLnUKXnyXg301uNod
         MCOdXcGcdkluvp7VbWuJpIAB/esnGa/F9RemfUSvhs2+mlhISQTLyW+hBpW5QKbyN147
         iorAqXr3/g1WId+FR8PK7xCAHF8ttbY7CPbYB0+RZ5avguQKX+cn4Ws1e+K+2bcjKc3x
         fHLEiHq7+Sf4NeburLaKk/FZJHvhcpOK0ZKW7HX8h9k4tOz91yJrY9VzSz2Z7Heg5fDf
         SX/WCXO+sBYhoVEs5Wq0IGVyeSUzh7W0yeE36I2EfgZPZ4ECd1l8v4hS6Lbw18VNJFPk
         HGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835869; x=1760440669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=j1Qu77YqdzANf+R2sBPqEzaMiRu38Pj0SeYtCUyH3myK4Tn+wI+mNQtCR2S9EkZJzY
         ElBn+nPB03ENEZVelr0NdssjbsDGpKM+5ZwnTBBcI4m9fvDHvCFOWx7wxa+eLmaQ227g
         mAoJIjq7Wm33UXkiEn2ef6FLLvqfAy/8GrlvPDOZjwjHSIAcEft3svtXsKwZhWMDwtZz
         i9eFnK3zr+BQcWZcWCESj5kAXsEm2vK+kD8xWnV2pnpRx5M7dTqJhi95vJThCaxRUdN1
         FoNPqshK4b2DMff+5f4iHOFFzPe+ylvd7BlZDNgcZBA9HYq2mb4DomQ/uZxNrjU48NQm
         8iZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKcoeJWjeEJ0+wgsqrHYQVKn/ejKA96TnmgpHvCYC0RxwF/VgpjEXrsCplzEccAsEIc28Qb0vt+5cBnURuK++s@lists.infradead.org
X-Gm-Message-State: AOJu0YxeV8HLla5T53mbcKbz6HuaO0xXXkLZaeMdkdNvBFX/xnqUhc5S
	vEyT4A0l9OJHW83S5mVromkvCPaDjSd0RWUpDNXIWvUspE1g93nrTmI8A6Fn4RV9
X-Gm-Gg: ASbGncv8ihNRoiuS8N245xK5Q0Mc4TMWlznPRdiv/G4lVo++I9cYeWsKv8J39ItQeyA
	r2I2OPrDri2rln2fA6WN/Y6z+14JFCbbhUvSIwsH5x2lYnGd7V5/Q5K/spfpdGXu8OsVLAqcVWz
	2EKohF1Y8CfgWug5w7zlaUfy+GwMXEFmMBzLw3Lx5sad6N1uVq7uFTc0UYLNj8rr/oUWNNlfTZS
	FMFK2qYOaFpmYnH87Xb7E7QwaJvVnmwqCTFtUDKchIg7Sxaqm31KU4QlLynRcr2ZmLH9n1mraWw
	Z7Ky7YCn6NPRNMW3XPUCL7QXOvLtkCLj1jIIif+FPdhtMW4BbGxnweaXoLIcCTo29xjexTY3EGZ
	3wXY3Dkoi3rgkJxjatQrJAKy0DpCL4qIxg3d2Gmmu6+sPjtZHhGwtfwnoj+S9xnnAUDtD7iXVEP
	z+3ujJcx/1ufDQID5BhhJEolaMELfZ5PRKUTGjbkjLtA==
X-Google-Smtp-Source: AGHT+IE9i3oBNg1pFLD6d8BUkWX8cKqHfuFNCfFyKAraBK4jd7pEhvOYjoDhX88W2UnS1BhGRC1x1w==
X-Received: by 2002:a17:903:384d:b0:246:cfc4:9a30 with SMTP id d9443c01a7336-28e9a61a7c2mr170446145ad.35.1759835869301;
        Tue, 07 Oct 2025 04:17:49 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:45 +1000
Subject: [PATCH v3 04/13] mfd: macsmc: Wire up Apple SMC RTC subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-4-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3dXJ9ryLp7td3nvHxlMaf7RhekWtXnO+6u1a+c5
 mTokmDRUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwERSZjD8z1PXCHr/tatuyhNH
 TSNzgQlHajhkjBo4Ti3YVCZ8YAHHfEaGlXw70kPW1837I/xvyoyIUz7S/9bkft76bqvHpKeZU39
 /5gEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041750_228218_04B4A7C2 
X-CRM114-Status: GOOD (  11.28  )
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

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e6cdae221f1d..500395bb48da 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.0


