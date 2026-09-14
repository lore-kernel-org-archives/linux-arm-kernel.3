Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF750C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a6EI5rX+MYKMYU0UnF1Il4E9mul776cfp5306LOEsvs=; b=jAGU7n+SNjjWeVPuFOW/TdqdDl
	DOOU8HvH3ymn5gWuRIBYOqYcM+o4lAhFM+74WOk9ktabvY/IW8WdAQvUO1weqoN+0R7HWJpoWx5t2
	jAZdR8Vc7joP854zLzJZxOpD00MD4cZvCzVE6AJnRqUekAmEA9x54DXALq3ea6qbcW5IdGKMORZyc
	IXI4JX3rhYE+ecBgcTtKL6NmiCVEGUPTHiHcEQjX17W4MkjxM9h6uoP+yDMIctDCzU4jGu91ZvKFc
	3bJlCbY2i8Vyv625qq61AOKyguf1Sm7DdscCpZUJVMDQehDVansWAh9RlWJrRoIPKmTygq3XWt7ao
	efww91iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66gR-00000003kZP-4AJJ;
	Mon, 14 Sep 2026 13:25:19 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66gM-00000003kY1-3Vpx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:25:18 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1389858a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392314; x=1789997114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6EI5rX+MYKMYU0UnF1Il4E9mul776cfp5306LOEsvs=;
        b=c2islAxyRDDV0FI4W3aUDHo51w0p4k/+RWSCnWKduG0tNOZQ9ig/QD4RvDxB9vhxOI
         LIdSViH50TUs7MWdKu3LZGfxPqeleaZswm4mXPD3/hpJKjPs5Nu/iOK2/c7hQMVAvFsn
         yk8LdkthiEx5o/g187r9BsDlBnCs2y6ju+hj43WX7HMMUIzA6LlRccwq2Sl2KbHUOzv7
         JXPKSaP8TMXlVADqtkFpcHj/OMfP+HUL8pJJaEILdHgry59BgmqR5L11Us1iHxmzSIfL
         WZbe9f11HXpaw5wB+t466IDHQ+Bt+9FQey7cpXlGaiL2DqRHMXyNQyBFUmRzytQkacaP
         PsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392314; x=1789997114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6EI5rX+MYKMYU0UnF1Il4E9mul776cfp5306LOEsvs=;
        b=ZoUvvmuUsOkOjzAC1xj0dhtn7o3Ly7EMzJzd+5bdCDbsDCQewXaYRyAMQoJPessXZj
         weSZs4UtgDm4bBgW0z5EoBOt9O9BsD2TdfAbwJkORVP54YFGvmP8k5i3jzUrWtU5naQx
         d5hTsUibeIQ7yMYNYqbs09snyidybktnm55yTnxFDJLb7pjtj4UzDnTQNmM4crx6qZmj
         HbmYEyE9byO8ZwG9PUzdUO+8X4Q9nPJ8ZJCRAjIi2u0h+pBf07xk2aNr8M6ucOcajGih
         5MccTdDUFKUHd2apJk4l1X8FHktBmCLjWm/RZxYEaU+Akn1ArHj/3XORKuo9bjU3LTAa
         2biw==
X-Forwarded-Encrypted: i=1; AKwUvBwqhL4bNNuanYCvE8tIwCHGslVJLN6LOag7XUNf2Js0N3NX4maTOZdyDLqiU4PWPDEyHf61W7Ay7N6/gU8AMkaj@lists.infradead.org
X-Gm-Message-State: AFuF++k9T+bPk3We0s4kkkUWt4JuX/tg4FbML5MyM6J6lLTbX/i1Ul1u
	BHWO0qIuuQPk7EcnopCt/KUHhkteBnr3yLo7pEKl2Bm6qnOtpe01zBVN
X-Gm-Gg: AYBFou0e+CjziAsXL5eSGq4Oje2StI58qQxxcoK8lM1+vq6FUXbO9WIfqgH5AhwJI/L
	eHoBnaff1Tftr1NodNqJXMFkufvLtxLa+bs/wwplSrz6fX8AiUSrqZ0NtKpNRD0bBACX13rC2C6
	3f+56FUYsDs+SQ0Klgr7lqOMqwE0kt4SgJ8KgZMhn72JKnlh/RAIFFs8sD5IjxSZzB3SyNDMRuE
	WM1FHt5Q0gG+ocxUedvcVfWR8l/ih3hK5AC46V2q0TREnxjC4GHuIPl5nqHupP6zTrN+bXQEZpR
	XEG78/XorimD9SLg6t7pqHy2XTrVn1b7x5kGJTxKNmkVtp7ZQ33VsHxF0K9LnyER0zrWiDpGsh+
	r2DnLo/lYea0YpuXeUP8ORGZnFOA606/iA85bL3C/OFIWElsyAUVqDxZ4LtDiFeGfJNNz6YD/5p
	SPAadEY/Q8J0CjCxU9BT3qDgzu9R6kZf32WyAcyeGAtOPNBgsJQVhoUxTaHTc2lbDchX1cx+jFD
	HK6ASSadcguKOAQ
X-Received: by 2002:a17:90b:3b42:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39debfa6792mr5368605a91.9.1789392312963;
        Mon, 14 Sep 2026 06:25:12 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm20872894a91.11.2026.09.14.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:25:12 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-rtc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mxc_v2: fix clk enable-count underflow warning in remove()
Date: Mon, 14 Sep 2026 20:25:05 +0700
Message-Id: <20260914132505.2356970-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062515_615616_BA0C68B0 
X-CRM114-Status: GOOD (  12.31  )
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

After probe, pdata->clk is left prepared but disabled -- every RTC
callback enables/disables it transiently around register access.
mxc_rtc_remove() calls clk_disable_unprepare(), which disables it
again and hits clk_core_disable()'s "already disabled" WARN().

Use plain clk_unprepare() instead, matching the probe-failure paths
which already do this correctly.

Fixes: 83c880f79e88 ("rtc: add mxc driver for i.MX53 SRTC")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-mxc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index a07acbbcfaeb..93dcf18abde2 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -365,7 +365,7 @@ static void mxc_rtc_remove(struct platform_device *pdev)
 {
 	struct mxc_rtc_data *pdata = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(pdata->clk);
+	clk_unprepare(pdata->clk);
 }
 
 static const struct of_device_id mxc_ids[] = {
-- 
2.25.1


