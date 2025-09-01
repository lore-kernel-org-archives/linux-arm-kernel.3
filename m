Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB81CA100E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvGFPcLRQG7NDdcutxPYCIPA441LFKGMfIhq/xAeHWw=; b=z4QOY0mlFX4UOct92m+WNbymdN
	uqhhn5vVkreP/lCVTJ/tD/csx8xuoRieNHUC+9nWWwZYNo4wUlJLWkhIS0mJadMhEUV2/YxK0ja+S
	CeOHmtCkde7Hxc+DHTcs+1gC5JKMaMY1/xnfwRcQmsCtPmFscEuIg7OrH49yJFtPCnW5l0ka44YZy
	0yMlJ2aC6YJIXrF81+s751ZfK7EGzSLb0BCQvVtrpjySK4TVJjGSHsIw6QvCckUrBmLTXA6ddC0at
	5uWz3kTnRfZYUXZy0YgDAKOg9SYqH0d5+Y744S62MnkkM+Oj+yf0DigJsPbSAjzbTk2kzzXNuC0ey
	+wJkbPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFi-0000000EXlw-12TV;
	Tue, 02 Sep 2025 00:52:02 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut78g-0000000DEVP-2bZZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:12:15 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f74c6d316so1847572e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756743133; x=1757347933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvGFPcLRQG7NDdcutxPYCIPA441LFKGMfIhq/xAeHWw=;
        b=PWAd7rTVoqTnLU7hR0YyXZj6pgESOKc7BgGkAJmofYTFK06bdWP486oIWeOBDWqQNz
         lsQZSvsW/oVY9YT/iAFs73O31l0rdQqYKaK44QeHhM2lCN0JmQ2b5S9rlFrxFSd7HYgQ
         J2LLIS+rudowE5pbun9WtZYEVrV/0Ho+VB90FBtOU8vh988BlL32ldb+5nP1Zdxvf1Cx
         VvUR/RQOtYjXA0HubHOXqjPY4mEeN7lcp1R8lC5Tl9sor1IADP8A2XaI4ZdCuWXPdNoh
         sEMNHxt/Dgijqa0ZhvddgLUOmWcAs4sFx3bTbvoy+p6kH+XELR7+z3I3J7H9xk/5eGRU
         KShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756743133; x=1757347933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvGFPcLRQG7NDdcutxPYCIPA441LFKGMfIhq/xAeHWw=;
        b=cYI9DbHThJ+H5Lmw6OFpJr9wyo9Z9tzYfQXl0BkVRc6tCbT6mT5j8VYBuw7+lIzNl0
         bwrL37VvHlF1oH0pu2ILuBblS8h2xxAGiNxlTLu9y4HOZyvWpoV1fnIhWnanr1BtRKjj
         BXZODDKgzJ7rRtM/TjCVx8yHOnn6dd/7hSI0mPA6i/x7Ea1fnDWx+RETxZJ1zVBFXZa6
         /H/PjVvFiwR8EChcPBrodwxSQq5fIphda7gDDdx2/CsxNbkmWSrVpGF/WBuEb8rZjb05
         tLidwE1wse1aPHwT+6EZumpTAbvxZBCtXMyhtsChy8SYv7DxoXt16ebc2niabaXDOSPI
         QINg==
X-Forwarded-Encrypted: i=1; AJvYcCVrb5sdioKho8rUWPU2tazHO2ImH+ZMTt8rK7SRxQsaL2hYWTcrSokmfjwbzR4sLarEDR9Q+tPKxEsK0Ebi2/Pt@lists.infradead.org
X-Gm-Message-State: AOJu0YxJMFri7x7G4ebXVtKbPeQzukqel2FCr9pZiALbTd/NyJu4BPga
	9v1zlhvhGb/VxvwU01+8OzOPyXBdXRtUm6v0WbJTDP7BvxECulC0pxRG
X-Gm-Gg: ASbGncuLUg9DaQxSMbfe8MCJNe5/2B+0/MO/VpKvChSpF0o0d2mtUUL7/HyvmLPOD/e
	YdlB4kE6zMaBTpZZdQWp14BDQKXQZxYvBlwuuT08gxgtbSQ5WfejrQF/ijIjQiPVzFXbjAmgRv6
	bHyHNGLaCmf1a/CcIUWmCzKlZDATYQm7KjQWrBlX2EInMSUJcUI9T6go6JO/vyRoRi23pJ9oukB
	jYgOTTqd4tCPot/zYR0TEM0LdHYXP4ov7k43UIxX6/Z3i2+QA52fl5sWy5Ce61QviBOAo++YC+0
	wBHwGSh26v5wf7VK2rRfqEcezuElhn5FgSBT0yw99FE6CezPuUhTMxUI6xU2+tGi11Ko4gLweuC
	SlCP1X41VrYc5LzAlvxod+XVatOIcoWSarVpB3yyWcQIasUs7J0cg
X-Google-Smtp-Source: AGHT+IHiwUTnaB7EPGGt0HbzOzE4Bp/CJPYgR1UiGBYb4q+hoCwWA9Bw5YVLHvDVa+uK0xVrCHrHcg==
X-Received: by 2002:a05:6512:b88:b0:55f:699b:98f8 with SMTP id 2adb3069b0e04-55f7089be9bmr2590042e87.12.1756743132572;
        Mon, 01 Sep 2025 09:12:12 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6771b237sm3028827e87.54.2025.09.01.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:12:12 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firmware: arm_scmi: add missing spinlock documentation
Date: Mon,  1 Sep 2025 19:12:04 +0300
Message-ID: <20250901161207.2501078-3-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901161207.2501078-1-artyom.shimko@gmail.com>
References: <y>
 <20250901161207.2501078-1-artyom.shimko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_091214_663588_425C6195 
X-CRM114-Status: GOOD (  11.10  )
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

Adds a missing comment for xfer_lock spinlock in struct scmi_xfers_info.
The spinlock protects access to the xfer buffers and transfer allocation
mechanism, preventing race conditions in concurrent access scenarios.

Signed-off-by: Artem Shimko <artyom.shimko@gmail.com>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bd56a877fdfc..6828392152f4 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -76,6 +76,7 @@ static struct dentry *scmi_top_dentry;
  */
 struct scmi_xfers_info {
 	unsigned long *xfer_alloc_table;
+	/* Protects access to the xfer buffers */
 	spinlock_t xfer_lock;
 	int max_msg;
 	struct hlist_head free_xfers;
-- 
2.43.0


