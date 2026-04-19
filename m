Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE0BEA71AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FosC665WE8Cy1oOKr7vEfeLdTUyUScA7y3vdV3aiAok=; b=tGvbCeZsxibzutvbfLMY6Qs7Lo
	ew7u68uRvmzc5vu2jS7y5FIAFqCH+HJbrEHIFITUgcjHCx1VY9KZ/wtJpy7auGu/vHroJ2t9U4h3F
	6FEnkMFdlhGwONgQLXjk2sAkpNfi1qj8AmfG7W2oMFxb1TDf5sRDYj4iWGJHHeaY8YL5Ik5mrYjV6
	okwelVJilHjboX2gTvkY7kaE7Aln3fj5lBbOzzN80eisvAjhEWYMAjFMD6pwObdph39+zX4uwvUjH
	HUHc79EYHaGBDRQYUfI1zdy8RMvpbmNYV4hw45+iaNnehokFg7WFMxxfZqLA5xBhVhzwhswQ7HAsj
	V9k2XRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEakm-000000068G5-1olx;
	Sun, 19 Apr 2026 22:36:36 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEakk-000000068Fk-0FhY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 22:36:35 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7d9bba96f7dso1377601a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 15:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776638192; x=1777242992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FosC665WE8Cy1oOKr7vEfeLdTUyUScA7y3vdV3aiAok=;
        b=QS+JXUbmARP7s66Qc6nqlAHoPVmvGWczgfBJOnxLLGSmN5H3mXVAjScui393h2o5WA
         KOG9dlL9Y+U7HcXdN1OdOrUcRV/xsWDE8Ds8nyCTKk7fqW+F4ry5aWX9IJdpbG3jlwFC
         taxQ7JmTxglZOm96UH2n+q7Kcg3f+M15ZlmsEfTEAx2j4bhwB0u9vPfpBWZcHmUAep3e
         FtOHHOI7p4yOV5OfW6xbpW/6vuxZzPiae9EFRSQu4uAKfp2i3HvP3BtKyy6MIJf77GLl
         benSSlo3VmmuXc3GX0kKeJGWV9PS7PzSUkhOdo/5LoGoEbNSwGfd/pgJ/gCya90aBk0n
         U1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776638192; x=1777242992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FosC665WE8Cy1oOKr7vEfeLdTUyUScA7y3vdV3aiAok=;
        b=qqFAvsnFW+f5tAQ8giJ/OF3POcha4f/AoW8mYtTk47NK5meeq1kkQAsV/MgBA8clRK
         qvNLizFcx1W8x1cmuVM+NWK4jBxbMXiF7DvnwuMyjiX6QC23/lcXpE2JlG3ELls3wUQO
         KH3FJCL31eAW+IQAVDQt9Zv/+Ncf+XrbooSIMF+Cf2U50ETxxRIK0V8AaEfBbDFKLv1u
         4NQvDtWAHg1KzYgoW04sol5ogRSguFG+hctsGk2e+3VF/cAsHIitg5K1wk6TUaQ17Qz/
         y2673v19tHlHRCDOq895jSwPr0a+oOfG0J3EL277DXVwy/C9MRVheh9JMUO/+9v+eBUg
         Xv9g==
X-Gm-Message-State: AOJu0Yzp3coYltJnfkcEsblg/ToTeV7OWUmKDWZQe/DXvIZvuWpckJVe
	D9NppmvXivTetM+bbmzEwYtn2xxTrlEbGhWPC/g8bWS2yEenkI/2YZ64
X-Gm-Gg: AeBDietN7AoZJSwtYGl4+RkN7Fx34riBpn7cMuTvvdDq4akJY9vLWw9U51owFLNst0O
	12KSIKTJjTKCz3efv0lwmhcp+GJsxYAyLNsI4VSlpxrLt008UyBl2udviGuoQlTeDaSFtRieDmA
	jCVCLscvBIBm/nsLsIRjYEbIskIEL6nixZf5QEbNYc5LHfjTlaE4OkUoH3JmNfz29kSY86Slyhm
	Ozx6xa8wrGMjqiQdQrOBTqa/9Ko2AJN8vCQvTLgpX9kwubEZ5NK6UxY/4UeuTkRdVP1JmmzPkwE
	jOSg9hiVXCnx2UOyyBAizS8wHMBBVCNNek9RIpB1a+1Cf7ICXbSnR/IoBT+62ZX2R0zOTOWSujR
	tVstu9qsEbFwH9dxF18NUP6AoUnyht3HErEWxfz/LN8zT0juzmMNZU7a/edkMgZq60CYGblASXR
	rb+mJ1J9K2/qFickjhsnLnkqQrnDx/TeFCxLh1GrJ9w895RIlD6of/oseBLB3JDbP491NZ
X-Received: by 2002:a05:6830:8d1:b0:7d7:5b78:ef31 with SMTP id 46e09a7af769-7dc94fdf204mr6753657a34.12.1776638192241;
        Sun, 19 Apr 2026 15:36:32 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc975034f2sm6979077a34.4.2026.04.19.15.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 15:36:31 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	alexandre.belloni@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: ab8500: replace sprintf() with sysfs_emit()
Date: Sun, 19 Apr 2026 17:36:30 -0500
Message-ID: <20260419223630.67644-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_153634_136987_36885F34 
X-CRM114-Status: GOOD (  10.37  )
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

This patch replaces sprintf() with sysfs_emit() to ensure proper
bounds checking. It also simplifies the return logic by directly
returning the error after logging, instead of logging, calling
sprintf(), then returning.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/rtc/rtc-ab8500.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index ed2b6b8bb3bf..c6147837f957 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -284,11 +284,10 @@ static ssize_t ab8500_sysfs_show_rtc_calibration(struct device *dev,
 	retval = ab8500_rtc_get_calibration(dev, &calibration);
 	if (retval < 0) {
 		dev_err(dev, "Failed to read RTC calibration attribute\n");
-		sprintf(buf, "0\n");
 		return retval;
 	}
 
-	return sprintf(buf, "%d\n", calibration);
+	return sysfs_emit(buf, "%d\n", calibration);
 }
 
 static DEVICE_ATTR(rtc_calibration, S_IRUGO | S_IWUSR,
-- 
2.53.0


