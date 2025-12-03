Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F58D15D86
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NDEutrwYYSpAqMnjGTl0BgfQuhoL1ggOgrbvs9sYUR8=; b=G3rVNzLjRcoiO20xKZSy30WR2c
	L9DWnUExasEjFM882nLgh9VH9kIUgDD/osrtAvUXhqPwv96qDBC7aagrhX4Z8ksvIx84a2yU4N58d
	urPWSaiZ4r04WQwwOFnUyUf4UR2+kniQPq8FfiVMCwIzIKgYQ5uvRY4qHY+Tv3ZEMgeMOL9fjNaT3
	g/UQmRnKxACV0GkcFPjc6aXXvnxZi66VlPXc6hllsM9yV8XwSRyDboNsaB8OgsSV/vs+1qQZ6xODf
	/KEzNRYMt3rfej7NFo5dDimwQxKhkrb+ObJk1yquNxRB8G4YR1icm5wAQUmklVnVY9BkHztt1CCc8
	AeSD2tVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQogk-00000006hOv-2BEI;
	Wed, 03 Dec 2025 15:22:42 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQogh-00000006hNv-3kql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 15:22:41 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso5773085b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 07:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764775359; x=1765380159; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NDEutrwYYSpAqMnjGTl0BgfQuhoL1ggOgrbvs9sYUR8=;
        b=nIEyYQoaSxfSrP2/cmPsV5y4g5E5vKAoqYftcfIqBGGz4Wz4NOZhZL+fTYssP8nMvQ
         QwQS12P10po0p0MEo0JxQ2OhI/zZouuaUZMPWRDledz0JxLAEGT0lQ0HIDg1it2l8lm5
         mQI6uLP7SwXn92+rIabboHcm/PZsFdiCerZsYX+QEuMRo7ts7iHgUPx7eLiu9oyYCYZQ
         Sxd34iwDq+xLQGIY8RKwW6BUEJxMhKgc6CQRUFjesB0OKKgU7qh+buBhRjUNQwziGfDp
         5pcPywMAeUhlcoJk0bB6OE4p16+tuPYHoFe8FmCbLXzUyfVtRRqzwf/y8bUNaeNAyslL
         QRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764775359; x=1765380159;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDEutrwYYSpAqMnjGTl0BgfQuhoL1ggOgrbvs9sYUR8=;
        b=OmCZrjvA/OCc3cPRzF26Mc4FjtzwqimLjMG5NCVxsVba8FXw2R6wLkz1i4sk8fQsKk
         nzqFJrsS3Ymgd7F333qk3wGfsiGlUZFUmPwggUyjx+cUiLjhqHaNxCLr0+EC0mtmZLjh
         1sOsqK/GJ+bAcVPngpWDCULNekRAwUMQ2R+hJ49b94VbqfW5RAlyWP6GeIC/oAlunTvJ
         h4O2/uh5RljxIQgFFc5zIjhGZ/hUDo0MVv+dNdZgruCsuA12rFknVDbvUvBKp4UEbB0v
         C7XMOq/RGL7Kc9QotwX1b+dtPZ+fqRZTPIa1eejb9v4MwlgFny8EFVsM6TEtKsVxVb8g
         R6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRaLj5XbVGBW3W/S7FhDs4sjDF0E46esliq0Q0KlNNs4/lO57HIygILTwhGBijnolnJ8oEFPQ4VhQLGtt7+pnY@lists.infradead.org
X-Gm-Message-State: AOJu0YyHTlEZ1aKZSKjYI2bzVy6eFqHBHXPOUtzpmbgUis5+IkmMf3oU
	gwHneQjgG9fFfkH2h/oV0KZElTe5SnKJZ+bxomr5IK/0gc+cXYFcRfrj
X-Gm-Gg: ASbGncsQQTCjCfy0rgysXafdeYmP73rZXiGWGzxNZrwgnCnb/nSTfCQdpYyk/KwL+bQ
	4YJlfCgnSH4XaVu/L86Oz2K3mc5X1jFc8kvkc4ar5mR8g/p747yPYJ2BFEljsTviMXjMRSR890p
	/UWNrm4KTyr+v9YLGeVfkJ1IKJmRf5N2jmD2KyUNG82TECf7jovJFEjpQu1ADaRlG2dCwF/dPvF
	xM9I3V9R8QxEB5QsnXQEdZPUNrtw+jj4ttKA1dC2gCmNQ37wQ6/PkKxHW2mWKQ/9YH/Qzj77X9v
	IN9x+WVpkfGSQi3WX5Mdir/rz1RyQ217vlgL/Wo57asd67fRWLbFkgd9CxHAyTyMrt6MwE/7WwH
	rXqOqfThVJDa5QCpQkD6QSb3k6nvx6HJjDKE6ROJwGLFBUXOC7aknAxt21wBxqKMcxnmGSSuhH0
	K7xEuetoGk
X-Google-Smtp-Source: AGHT+IEQUzaN10+PvCfrPIwTfI0EUNSjX0CDNB4HixfNpdOHIlbiZoepPnFatiDaFEfEdE27iJBqnA==
X-Received: by 2002:a05:6a20:12cf:b0:347:67b8:731e with SMTP id adf61e73a8af0-363f5d423efmr3848735637.14.1764775358570;
        Wed, 03 Dec 2025 07:22:38 -0800 (PST)
Received: from aheev.home ([106.215.171.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3dfcsm20590050b3a.40.2025.12.03.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 07:22:38 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Wed, 03 Dec 2025 20:52:34 +0530
Subject: [PATCH v2] arm: fix uninitialized pointers with free attr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-aheev-uninitialized-free-attr-arm-v2-1-db52b2655ddf@gmail.com>
X-B4-Tracking: v=1; b=H4sIALlVMGkC/5WNQQ6CMBAAv0J6dg0LKRpP/oNwWMoWNoFi2tqoh
 L9b+YHHmcPMpgJ74aBuxaY8JwmyugzVqVBmIjcyyJBZVWWlEUsNNDEneDpxEoVm+fAA1jMDxei
 B/ALG1hqbnpDwqnLn4dnK63i0XeZJQlz9+1gm/Nl/6gkBwV76xvR6qOsG7+NCMp/Nuqhu3/cvK
 SfMrdIAAAA=
X-Change-ID: 20251105-aheev-uninitialized-free-attr-arm-cf3516ba1a18
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=Qv9sJkWpgGEpPAGgYF93Xt7GisQr2dpOJAyb0wf7ork=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDINQnf3FL60rEo+t1dm3qX0Lfn/++1/B8sLL6m4fOpzx
 tWV2uebOkpZGMS4GGTFFFkYRaX89DZJTYg7nPQNZg4rE8gQBi5OAZiIWSEjw98TEgcOL471V83t
 i9h2Of6kRGny/Uedyzgdt2netOQyn8rwT6GHZY+j9GQlmfJ1Popveial3pRTbPpV6PnkxPtAT9F
 jbAA=
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_072239_937388_306B483A 
X-CRM114-Status: GOOD (  14.20  )
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

Uninitialized pointers with `__free` attribute can cause undefined
behaviour as the memory assigned(randomly) to the pointer is freed
automatically when the pointer goes out of scope

arm doesn't have any bugs related to this as of now, but
it is better to initialize and assign pointers with `__free` attr
in one statement to ensure proper scope-based cleanup

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
---
Changes in v2:
- added Reviewed-by trailer
- Link to v1: https://lore.kernel.org/r/20251105-aheev-uninitialized-free-attr-arm-v1-1-f7b6cb5d3361@gmail.com
---
 drivers/firmware/arm_scmi/shmem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/arm_scmi/shmem.c
index 11c347bff766763c61100f884432c2e4669e5918..dadb37557f8aee25465e1a423dfcb4a889852434 100644
--- a/drivers/firmware/arm_scmi/shmem.c
+++ b/drivers/firmware/arm_scmi/shmem.c
@@ -196,7 +196,6 @@ static void __iomem *shmem_setup_iomap(struct scmi_chan_info *cinfo,
 				       struct resource *res,
 				       struct scmi_shmem_io_ops **ops)
 {
-	struct device_node *shmem __free(device_node);
 	const char *desc = tx ? "Tx" : "Rx";
 	int ret, idx = tx ? 0 : 1;
 	struct device *cdev = cinfo->dev;
@@ -205,7 +204,9 @@ static void __iomem *shmem_setup_iomap(struct scmi_chan_info *cinfo,
 	void __iomem *addr;
 	u32 reg_io_width;
 
-	shmem = of_parse_phandle(cdev->of_node, "shmem", idx);
+	struct device_node *shmem __free(device_node) = of_parse_phandle(cdev->of_node,
+		"shmem", idx);
+
 	if (!shmem)
 		return IOMEM_ERR_PTR(-ENODEV);
 

---
base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
change-id: 20251105-aheev-uninitialized-free-attr-arm-cf3516ba1a18

Best regards,
-- 
Ally Heev <allyheev@gmail.com>


