Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4253D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=; b=k1Uo2b/wYC78W1TKiaGf0fJB6e
	WNMufzQhmUvehJLFe4uza9bk/qHzDHJTlsBCPYRMDr9YBf35IBN3O5CRl4gZ7U6u4OkkVFNbLE1rq
	9xVgFqAimVOUQisKplBAYo2v6t11Ty+wncv9T+4/OHniYOYyokTu1zt+fWOIyXfyK33xB7t3GvWD7
	FTMMpIPXZpX9f/ZUkcYmh6pwcFjhmgAlDGOg50rT2NgZtKPUP1br9mtig1CeNgOwW6w6wy3iEIdh/
	9E9BYIgJQ9A/fq6YTLIwIg47BjS2k3nXt1vQ9x7gP9btzmVuwHFhnuiTiHODBKkCZqDsQvhdVSPBh
	mNfKiI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52K-00000003NWs-2yv5;
	Mon, 15 Dec 2025 09:38:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV52J-00000003NVz-0Cpt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:38:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29f1bc40b35so45974665ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791514; x=1766396314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=RrVIK+pdCn60Zbv9h/n97w0rNqs0nRXhUSHQW0g0uq5CJDXsRM1ZQWf3aAVPuW0+ch
         dFELU5YfO+QN+ixQRlNNEQeFzyKVSeybN2iydVm698ZZpHgYuvpz4UhpiuT+Rdi0yeAy
         jSs+aYSRuh9MQOYwCOqteiebm2zLAwOp0geeWa6vNJH2SNXhNwYWgMYDk2qK97YD9DTO
         +l6iNe/AsD1jMQkGyKBFOA+DOvt/4/4T4eRqUUmhEh2TXIAX5cRw36yl6d6g7V7341sz
         PF4UeyvgUY+J3t8M0l/z4ILAZMLQSD5W7RClfn82X6pESV4knU1pQ1cGIyaXOzFkPECj
         4+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791514; x=1766396314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=jxQvxNbbNc6lmx7tqJxzTkfR9UfbIkLt934OnXTWcZyCW6CNr7B+BET+Exek7cbJBI
         N7y4RWwjXshDAgXW8TJvo19N9KmN8ZBOBSbfo4kIrf1XSZ26MgBSnVvA/vWsfXXCymsf
         CQ7p9Xqx73374yxb7fpsnMf0OqL9ebMGRP98wdSYiW7N6Z/oTqPeOngpNKlcOfd/9Q3H
         e4Csc7i7ugGrmGYlgKI4nz2DFIx2joKzPAc3oD9hPJM/IyRcrGOR8Lt3jGb5r7OMGMbD
         Y2PWCMdsYlNDJcdiR58TJf0uWZV45nl1GkyIOU3QAzEUEju1CaDxzSRbHW/b+FtTWx3I
         i5tA==
X-Forwarded-Encrypted: i=1; AJvYcCU0WSmyWBcWqzcKucpl1gYUNk+/RJMI8Fp2KxDVEY3ak5iBYWOSh+WTuTEEUMkceeEJT3Jx4TgvRQByYYTJ8CQj@lists.infradead.org
X-Gm-Message-State: AOJu0YzoZKGzuNnWQW+kXdM0vUkPf6gYFkTG98IpnHFevMwfPaE/N8RG
	TKfGnz3ZG3FYBQTubTxRu9fvlV6iomLZtU5HCXrIJDRSg4qJptkHWdsS
X-Gm-Gg: AY/fxX5O0TOtrQiIdumnjXxxEH43meQQKy2qxYVQS6RAYZwKVm1sLu/BTd4siD3DZvc
	52nTr7Miyo1BlABFlIx43kU33T7zINGwOTrJOgI31Ucc4/Ybzd3829bN2r5581jGUDINYDW/dIX
	S7Yt40LseNOtxcMTH7ay3AKzh+PFH7M/kB2sWBqXt1AP3MQwyzOeEvowQVegEL4l2kpW0qn9nj/
	TzsYt9eOtDHGUpoatg05XVPhoVKsQPL9gqny7fllNWAv7FhjUyov1WvmpwRhHdoCRQxxPN7IZN0
	8yBN5LWbJ52WGh+RV9DSJPcx+ejXqr4Ib58B3wVc8Pzu+k9qjj2sd2XatjSpXM6/wscNA9uBpTR
	t41CGMteRL6VDwn+aoCcN7MwHTuEqGhueq11qaP+rhkVXrk2mFFUjW86/tFN5FxjH3w6AdS3rcV
	8eIeVygx6FhkgOqsQsfEMyWXUSsUXnUWht0eyPxlhfdpsHG3mLn2pB8coEsx/GKAeJk8SdYcZi/
	L3xHlBwLiYpyIuCEYAdypRRamoQfEYgVjGALznpFkr3xkHcgiWyio21WUUNZlwRqEo+UebqCSQ+
	lgFY0/56ylDERVXKa4Z60h3lxfALNQb74IJbO9QMUmkH48Itxh4=
X-Google-Smtp-Source: AGHT+IHCWcOyM5Z8EFFrTYBLBI/0yDbLna48TS9+7DgDOr+UeDJqde5BU1SxSQK1fSOkyBfxFjFufQ==
X-Received: by 2002:a17:902:c40f:b0:298:6a9b:238b with SMTP id d9443c01a7336-29f23d12fd6mr91903265ad.51.1765791514107;
        Mon, 15 Dec 2025 01:38:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:33 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:46 +1000
Subject: [PATCH v6 2/7] mfd: macsmc: Wire up Apple SMC RTC subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-2-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
 bh=zrs/6kJawMZ2MFguV+AuLC+A2VRjOPQuG4CKOsgbB0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215nvvLy0yve6ff3amrhrC/MEs/XVOlOearId3L73z
 ZXPa/xqOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFMtVcHIcO7jXJNT6ydzK7gs3uBz8fN7s5dxvHcn5/gV9zZPuPmj+Q0jw5UGyV0
 R228vqDuoltO+7rvPRi+Wc5+OZAcpMMaal/3s5AEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_013835_109592_B47D8D96 
X-CRM114-Status: GOOD (  10.76  )
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
index e3893e255ce5..9099a7a22f1f 100644
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
2.52.0


