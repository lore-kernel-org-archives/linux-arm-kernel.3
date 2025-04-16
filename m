Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0205C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztpfrrq65RboKoVCNPKCaSBonp9V4OT02BBtVtoD/uU=; b=FoUGGC8fZiCInntI2pFgSpbWQ5
	KBtfC4OPiOSjhq+KIxCIdDRkeAOw3oXrrjJDX4Q6kpRcCvX4YiJV4XA3YCgn8r1CssD5zLue289Y1
	OUm5KaBmMObRfJvuS7rZo7wD//A4lgP7SZi5oNzUpM7L7su/2UfKW7PtaUfRxapY2F0ZOHmXdhTZd
	Ie/TQ2aqyih41qyWl4XL6ON0TYayxZ0m+3yvFCxrRb7dsONa5DsPaxrLrbLua3PNladOUuTija5ud
	tmT4O6b1C4hB3d8G4GtCWm6NTfnN3tQsmMGujf/+INCP/YLnilTTxDsU1X4TXWtKouBG+ZK9PXYoI
	bNwkrdew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qJr-00000007aoZ-1BsO;
	Wed, 16 Apr 2025 00:07:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qEJ-00000007ZcT-46nR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:02:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-736c1138ae5so6056818b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761735; x=1745366535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztpfrrq65RboKoVCNPKCaSBonp9V4OT02BBtVtoD/uU=;
        b=E8MRNwcwiBWn4VDPIsvl2vI9GagaD1lBdLvQO2KTz05t1EO+jOHIUcpagMW20vj61o
         09EfIQ1NYeHqVUJzYg/t4Nm8w24ktx58LYwSmyVSJNWPOqw1LQfgwe5xFioI8AjLOnv5
         IDezinyIIuB1vmlXi3ipsLhI8dVEuB+z7K7D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761735; x=1745366535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztpfrrq65RboKoVCNPKCaSBonp9V4OT02BBtVtoD/uU=;
        b=r1YTF6Yo209Uo8DubzkdSxYKAvOnEghOj4xzUDsfOLgMIdwMUcsB60anfM5opPAGXN
         B+HPt9tLGh0t6lhjqPXuYTr/0t7wPjglh4jTEK/c4+dizrcfytwTdZ0j33gbGqDNDhQX
         TMJVFlOBP8IrKJhWWNVZtX9A7+6+nVePfSpTBWnUHWvC4CdMV1MDDTAZKLdj62QlEUzB
         XX1vU/ULAIQJctYXoRiWIdOXTwJfY1PL5jHhpSQ++06fNYagYUpSGEyk6S/93BDLQo2y
         AIlV86w4AXnW0p7/1FgB3d89cKmu7+Lm1IBB9Jt7d2P8ch0AFv0wHVbC/KQMCPmxAnU6
         uYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvE6E6Pn6vWoFYuVzOu2ernv1p9f8ju1bQ6LGSJYZPnLrIaoLfsKfaqZDonDQ9/1lOPHFiOImHU3jKuR0+oPY+@lists.infradead.org
X-Gm-Message-State: AOJu0YxZIiKty5+tC8iEv9vr+XdFAlRp6m4xys7D8sCKJnI2kH4ZnIrx
	g7U8k19zQ1A6ffh2hyjjir6DAwbgK0tH7zK3AZ0QKjcEsODhKfZsJ9yXs3P4LA==
X-Gm-Gg: ASbGncu0T7xud6b9bjlqwxFhmE9/D8Jcabv2GzJLdcMnlbIm+jTya2vLH+6gTrVBAy7
	wIU0OPAgVSEd0sZRF0T1+rozhENFaS1BXGG+VAYiLora48G3OaPvv5crxyHjQMd8W57YqR757Ap
	8CtYC6fkOu0A3eIADwREQuqRrzWem6QH6nlDT1M7mxsI6/w9sR3MSoxXgtY1FIKz1eRpoGHtYjy
	tu/CSjQtyWYDGPKQOKUYvlXJZzWDBHOg4VRnlyKzhWuMD4Kq6Hxs7dKB2EoWrAqhofqOFqfVJI+
	rajsV2EBRi6lPm6seEODWFyJ8I5Z6q9nlGbAz9Ut+woZrSyUOA+xD4jtk0/IXNOY9EKHObf156b
	5wA==
X-Google-Smtp-Source: AGHT+IHkUQNhj55ArcxMsqdZ9goNzK1iX/oCF1gdLXwsnONXGZV+o45RA+2MeBctZXHEWSSuaXlJnA==
X-Received: by 2002:a05:6a00:2e29:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-73c1f90d688mr1947843b3a.7.1744761735002;
        Tue, 15 Apr 2025 17:02:15 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73bd21c3216sm9157830b3a.49.2025.04.15.17.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:14 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 2/7] platform/chrome: cros_ec_typec: Allow DP configure to work
Date: Tue, 15 Apr 2025 17:02:02 -0700
Message-ID: <20250416000208.3568635-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_170216_017246_40E83F3E 
X-CRM114-Status: GOOD (  14.87  )
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

The DP altmode driver fails the configure stage because the status VDO
that is spoofed in cros_typec_enable_dp() is missing a couple flags. Add
them so that the configure succeeds. This has the nice side effect of
properly reflecting the pin assignment and configuration of the DP
altmode in sysfs.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 6ee182101bc9..2cbe29f08064 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -531,7 +531,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	}
 
 	/* Status VDO. */
-	dp_data.status = DP_STATUS_ENABLED;
+	dp_data.status = DP_STATUS_ENABLED | DP_STATUS_CON_UFP_D | DP_STATUS_PREFER_MULTI_FUNC;
 	if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
 		dp_data.status |= DP_STATUS_IRQ_HPD;
 	if (port->mux_flags & USB_PD_MUX_HPD_LVL)
-- 
https://chromeos.dev


