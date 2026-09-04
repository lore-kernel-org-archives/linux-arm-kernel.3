Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669E9C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9g3ixuSdmQCpOEGBBcnV25oj0cDJNzVy8Tk+QtmySWs=; b=22Jkz8nvaGmVar2l6eESEry7Fc
	st7UlXWTYTFN6widR/YGAnBooa2Mv7nG/yNUaiiRMpRd7X1eptlIlm7g9hwCv//3knu7oob7sz66h
	Pb56CNAShIRksSprkVsztvRakmD8ZRVaykXx1BGrSepSIZVUno9IK04Yxh3r38JJJEld9FTCCDUPp
	y25q5AePw3DKg6F83F8giPwnN0L9jhwn2FUv4nKgkQKoDH8rO1w20EBBca/0C1+8+wLKof9slD2SZ
	NyV2YYwrHx5asPAhx+cV2v/3JExXsUhNRM262BDcthiMkMHJIPMUNVsxxvHhY1a7z9y6epxbKhaZA
	mDGz/QLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XWX-00000002qJr-0ixj;
	Fri, 04 Sep 2026 17:16:21 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XWT-00000002qHr-3Ozv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:16:19 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6a6735afb87so1167501a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788542175; x=1789146975; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9g3ixuSdmQCpOEGBBcnV25oj0cDJNzVy8Tk+QtmySWs=;
        b=Ufxvg+5svMoONGAMDgPCzZ9vSEnzSaT7jpT4Sdij0UjnMJtpJ43HrDixmJrH9MMlEV
         /rFcX5G3W/3Uj1Zv/mK2GD6GgEoi4iXkc0PxXgxnZrE2kYozt1SNdVKOrGc+CAo3qSTe
         FRyMBaWAeqmOnJTHuy9giAHlLYh5r4/s12+k9kKt+d7+Z4/DDdBeBnanIqcuTOSfHIQZ
         q4s2qoCfnYjvTIuXALnL4Z/2UbmbvfEVNL5iiMa7ghM6DYcdQC9JvySQuOnLoqBwyjo8
         r74x2WELy85Yt0YTLkXzwpxFwK0AyGkY8h2zJI+23BnOr2XdTEC8U170Zi138f8igEzY
         P4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542175; x=1789146975;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9g3ixuSdmQCpOEGBBcnV25oj0cDJNzVy8Tk+QtmySWs=;
        b=LvzHe6LDxxTwVNmK6cNNwPS3qJYbn26iDYmD86LEmUdzD0MU2hPneY42NI+mE6/zxe
         oxBNrbI6z4iej9Sh9dRGTpkQhXPtaM/O8WklJuDEkAAUsgbUn9StC3zlzx6XNijluI2b
         stp+9iyrXnEbcR5Q0SYf+V2JfgUABJcRhwmwltKPsVhuJP6x7GnAXOYeYhu3Bz54KEU+
         2ceXeYwsjXnd+qXmlRE0pBx+L407uo2I1elHAc3rF1187K6PPop9utQ7WIzGxg3P81F/
         ZRwETxHGnOYKlpbr1p8twrg+s7VGJziogjgDuE4dYy2XBRR/H1HKMHSM5uGrbU++2Kdw
         VaQA==
X-Forwarded-Encrypted: i=1; AKwUvByhq/lHR8Cf2MuwTqceMHH5JLGk9lfvaBlX7LeG0W/LRvcAmM/3VQQD+eeO3024/rmCoPKz+J5afN0TQKzuM507@lists.infradead.org
X-Gm-Message-State: AFuF++kYPD95VJwZ5iw4BhxGvUDhoSCZZB1G44pa1vGEap7wMHidS2vs
	5Av4lUGkO/V5m9aGWwDqxYoY/Yp6TdPtRwuL8HloNPb8fjlwR1W0y9ukoKWUb9JAUHMbbmtNzAw
	EIg9uGux+mkEYhNNztA==
X-Received: from edgi4-n2.prod.google.com ([2002:a05:6402:a584:20b0:6a5:f01e:c622])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3203:b0:6a5:f9ab:bdfd with SMTP id 4fb4d7f45d1cf-6a7e8cb104fmr3745516a12.0.1788542175250;
 Fri, 04 Sep 2026 10:16:15 -0700 (PDT)
Date: Fri,  4 Sep 2026 17:16:08 +0000
In-Reply-To: <20260904171610.3342398-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260904171610.3342398-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904171610.3342398-3-tarunsahu@google.com>
Subject: [PATCH v4 2/3] firmware: edd: Fix kobject reference leak on
 registration failure
From: Tarun Sahu <tarunsahu@google.com>
To: Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Masakazu Mokuno <mokuno@sm.sony.co.jp>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Mackerras <paulus@ozlabs.org>, helgaas@kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	sourabhjain@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_101617_852009_EA4CC5DA 
X-CRM114-Status: GOOD (  11.95  )
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

Per kobject_init_and_add() kernel-doc, calling kfree() directly on
error bypasses reference counting and skips the kobject's release
callback, leaking the reference.

Use kobject_put() instead of kfree() on registration failure to fix
this.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 drivers/firmware/edd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
index f980c5b56858..763e7b16d517 100644
--- a/drivers/firmware/edd.c
+++ b/drivers/firmware/edd.c
@@ -748,7 +748,7 @@ edd_init(void)
 
 		rc = edd_device_register(edev, i);
 		if (rc) {
-			kfree(edev);
+			kobject_put(&edev->kobj);
 			goto out;
 		}
 		edd_devices[i] = edev;
-- 
2.55.0.979.g7e5102b832-goog


