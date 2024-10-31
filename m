Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B265ED5CCAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xblh8h/kAs6iXd31tRjqnAQ6XZmMD34sBupGmOL7KPY=; b=SRdSwpIHAOAIiN+o4zLRXqNJSq
	PNsXLBGxeOoWBCjaCyON2ZzJ5b+33gNb/wjxdRwURLXxAMc+rt0UG6AKqfaHNddFjAw1M5vUiBHGT
	B3LmRg4Ovd/6i7Z5rQaugU1FTBGlW1Xe+ZxduKbDQbMhwsFNRRKW6e79FKe3qCeZQIOJPrbQiHpFP
	ETKLMbts5ehi71FdAh2sESDX0s/dlQN1fqLa/tbT8+2iMpfIuOaFwlnx4rBqC6dL1UB4fMzMyXbF0
	jlz0TxgEJQVQZXI8nL4Yfv/HTlqSyu0VYPmONtEhyzjnOiJiJJYSJ9lmCIpoO+IkpE1h7SRu+ACIX
	6f0NmOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UOe-00000003XYP-07Qm;
	Thu, 31 Oct 2024 12:35:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UMw-00000003XBG-3I28
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:33:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so7019655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 05:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730378021; x=1730982821; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xblh8h/kAs6iXd31tRjqnAQ6XZmMD34sBupGmOL7KPY=;
        b=SuGqnzpDAmuetmpOvAWCCl/xV9d7cZMir8fLwMJfguUbCB1EtdbXru8nbh82lqQy1D
         Izh2fUcS/CKBzAUa2V3L6SApCnTOo9UtZ9J6ZFwg67/htX0rUfPfX7gTfibWv0BYloBT
         /RM8hiTU7hw0H/VbRChWe4gLdwl2K/VCKwNlWV6R4YtYhpb5gE0koGBXXHjafSj1svSG
         yNb8Nvfjd2vT+Ikq9/2DeNGLjU53PMdsvu6NbUg1410VIZ0/iDZFb0FYGreN/C6Ks7+m
         U5QbLOpYYAiUE7Qt3iBVSiSXmHRjkAJg3fJyTS22DcFR4bOKpVHyQ0Dyofbe55G8JnLF
         D46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378021; x=1730982821;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xblh8h/kAs6iXd31tRjqnAQ6XZmMD34sBupGmOL7KPY=;
        b=K4dqZBBcCZWSfjBXxl3lnIcwyXgIrUZA/8qpWd9QTOf7xR5wnttARnNkil86w9iZvJ
         cSUJZvtmr4oTQhogscB6NUaMopQmNsWru2Ya+WLN2Ngqb/uNw8eHusEem+1qY7K3khpp
         07DXHKNO3VWBJMvfa3mkLMNc6x4hVRB1bGRG3nJH9hyhSKsZ73NRxuiRkfY5v2Ijh7Bq
         XqoAbPYSMdV0hCkm7gmNFPcVITvZBqQSbEL4UXQWw3y+YDs+xYBVjVEGPPsYV+L0/vE3
         mlz5WQE3mC4hp/UV2nKRaimUbMRzBW/gtOItNqeL4+/jKZHg/zO50llBcsOvKPK4UMZ+
         sStA==
X-Gm-Message-State: AOJu0YwI/yP7mmTz3AlDQiKwcrLAbPIlbFKamnX9oQa3M4XCTUzxHdE8
	AXpUWNAcdttaFVfRfccGwxBhcAnmWQJpK7TAK1cI+BKl+H71Mw24
X-Google-Smtp-Source: AGHT+IFeyhhAwD+U7wvpGW1to0bqTyogY7pqH01jXa1OXe1oSVmcsTNTQEvgBNoc9bsK9FR5T/WTMA==
X-Received: by 2002:a05:600c:5114:b0:431:60ac:9aef with SMTP id 5b1f17b1804b1-431bb9de94bmr64537225e9.29.1730378020647;
        Thu, 31 Oct 2024 05:33:40 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-d7b9-afdb-c541-d023.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:d7b9:afdb:c541:d023])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ac002sm24703855e9.5.2024.10.31.05.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:33:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 31 Oct 2024 13:33:36 +0100
Subject: [PATCH v2] soc: atmel: fix device_node release in
 atmel_soc_device_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-soc-atmel-soc-cleanup-v2-1-73f2d235fd98@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB95I2cC/4WNQQqDMBBFryKzbkoyEdSueo/iIklHHVAjiQ0tk
 rs39QLd/ffhv39ApMAU4VYdEChxZL8WwEsFbjLrSIKfhQEl1kpqKaJ3wuwLzWdyM5n1tYl2cIO
 W2FmLLZTtFmjg9+l99IUnjrsPn/MmqV/7z5iUkEKj7Ug2jbaqvo+L4fnq/AJ9zvkLeGMpqroAA
 AA=
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730378019; l=1518;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=XY/e+qqPS7e0meMx5s4+Qz6L5qELEoWgsNV6AMJ2Cko=;
 b=qqq3DIRvNYIGMvKD6DUlQ2EMYsP2DULjMXQz9qGUrSWrumJ4JKW7+uyvvZ2gOy8GQsxB+7V+t
 5pKfY3wsTniCd7wWKjfOa1//T6yOwSbdWIlkym1nnYMcyaCGb6m0pqv
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053342_881551_B887AABD 
X-CRM114-Status: GOOD (  14.13  )
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

A device_node acquired via of_find_node_by_path() requires explicit
calls to of_node_put() when it is no longer needed to avoid leaking the
resource.

Instead of adding the missing calls to of_node_put() in all execution
paths, use the cleanup attribute for 'np' by means of the __free()
macro, which automatically calls of_node_put() when the variable goes
out of scope.

Fixes: 960ddf70cc11 ("drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- Squash patches for mainline solution without intermediate steps.
- Link to v1: https://lore.kernel.org/r/20241030-soc-atmel-soc-cleanup-v1-0-32b9e0773b14@gmail.com
---
 drivers/soc/atmel/soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index 2a42b28931c9..298b542dd1c0 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -399,7 +399,7 @@ static const struct of_device_id at91_soc_allowed_list[] __initconst = {
 
 static int __init atmel_soc_device_init(void)
 {
-	struct device_node *np = of_find_node_by_path("/");
+	struct device_node *np __free(device_node) = of_find_node_by_path("/");
 
 	if (!of_match_node(at91_soc_allowed_list, np))
 		return 0;

---
base-commit: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
change-id: 20241030-soc-atmel-soc-cleanup-8fcf3029bb28

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


