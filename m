Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43062CD98C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=; b=rMsi1LeGFI7EFeQcT+SoCplgCh
	9Pf8ZfKB1B2SQcR4hhdAHx1OAm717R8bOULDmJBYem6BgYMWfSKy+zt4G4q55A3GcT3p7SFoQhG1t
	JpdDJhyuNRPyJvHCDuGbFTczicVfgSvQEMg6azp+wul1DrYn+dUtOCu+QN6i1aVfuTPL7dAkkBRqS
	kQlqydcrh3hSIIOh5G+5+GDpDp5igMOPMy6IxIh6/WcXYQNVY43pzSq13kviq4vYldqoxLMX0mDs5
	CZeTqSB0aHP7KyFrfYJ/AyDOULT4Yijvyon6wS6PTogyaMfn7AWvMjOby2Wvzt42fXu+2rFZzjlrq
	8/6i0CtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54m-00000006SlF-3qXP;
	Tue, 09 Jun 2026 22:37:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX54i-00000006SjL-2FNe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:37:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0c3184c71so46943505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044656; x=1781649456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=;
        b=MIOzbsWTZEvWcqHeVsPVtO6ZPkU3FAbqFfrVdZXC/pHLv4XsIqHAUkuO/Fbg1NQeF+
         +Z4eRu4IFNgbVts0WCVQsny6B0/jEnM7WjcQRblEgpwVbW/daDL89hoNY7FLFC2TSlXp
         kySkNljhKL7yxow7fesHEvU3gBPTLjhHtqmBRM09CiW95782z12xlIrPTxRPi3UZrdrf
         o0v0hAVVZ42BpLBGRTcGlo/c9bZSMmGKII8LKG7BdUiw9qEu3ytSwqXI+dfqSd5+v9b2
         b26M0eKiFADeg87K+NS+9DQvyYUxaBQ3ebgwrEtIgHekcIcSOQb8RPCZEYV+Un2n6g3Y
         HVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044656; x=1781649456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=;
        b=HAAU1pIO4LHwDEO6lACNGtbBuz0IRUsW4PlhoN9a1CG/bTiIz1xxRnTeK4+pm0WSZv
         nGnA3ce5hwthjgGyYfQzwTGH9YHPjTnZDOedd7A1XiDsPVopa5UG6F9WMxvoOuNo1Zri
         wSsSxb5Zjhpfb8HyeGO+yt5hUrb5B+Mw/2oujq/Iy0WMf9LB2isZjQJj2hGWGppgzDHG
         fxu3VqNDdUJ/xtaCX2unL+5T4oo/Vm0kPoojTM1pevu2INtpeXeF9L12rFGM7GJBaZOJ
         I3ynikgDE0lSC7gKI1zKUZa24XkEy7gAGGQbrFPN3D7HiLTsScnR+nQWcA02YLhX/lKm
         sDYQ==
X-Forwarded-Encrypted: i=1; AFNElJ86/udIPs++Fe1YTo29R0/iHJqZL7iwS2NxwJOdeuXjvrJ+xc6pFRbgqEbZkbw+MamR/wwVrowE7FRqcY/gV3cV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyq8W4ngXUqTC4/SJB4bfU48YA0qqY3g+9R1KwO46B3iPeKGf5
	R43SJouiays9io4pcXh0HP32YZPRmnBT+zaLef8hy+2S3lBXX2qHfaKqjJiVO1wF
X-Gm-Gg: Acq92OHng1LJfGeL5o8Cr5DqHZ+ikY3MlpFbTrJ3ZPUU/QB/LDA36HiLe/ub9cPy8Ls
	5P78EQlMweNiTnN5zbqkfoqwdyNHDO/kMTyGw7z8PadpTc20Q8YI3CP2w2eJcAE8bj7VXX4eYqI
	2VgqjsMFA4ezlkyeLzOFXBjR8/+gxFRpnzY6oAabVCYOhUrkeKFuupAZtH5MSPKWuQKa0NwC6TZ
	HWJJ65RjKLxDXf+1fc8QJQnEFpa1OQ+0ZGtbmBEB7KrIjfG3Gag/G/58DjoxBEEZKLV+Ttedrrl
	c2lYqT/w2GhNv4qRPRojhuBA5onJevhBHRwHA4JhXbplvzAyxz1Bucxn+wNZOLSn1O1HkWqAMzI
	qBTuXY7GJ6pI0YAsPnWLs1eIHyOiWdvfH0/jK0ZlKrJUj6VV+rc1+xujBhm7yctmbc0hzz1ByXv
	seTaunwjPmlevtV6Xzh+EAae9ojfgv14NzNIxoqcb83ko20J33+DqjyYpxXdAS8bnTRp3aIW/O2
	uPCnMYyxn9SwH9fBxU6KT0D7wVdKgxZ1PQyoNbKj8vb/1eqialzjobb
X-Received: by 2002:a17:903:19ef:b0:2c1:5667:2740 with SMTP id d9443c01a7336-2c1e810bd1fmr283197445ad.21.1781044655930;
        Tue, 09 Jun 2026 15:37:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv2 1/4] serial: mxs-auart: fix cast type for of_device_get_match_data
Date: Tue,  9 Jun 2026 15:37:14 -0700
Message-ID: <20260609223717.41670-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609223717.41670-1-rosenp@gmail.com>
References: <20260609223717.41670-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_153736_573795_21A473BF 
X-CRM114-Status: GOOD (  11.73  )
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

of_device_get_match_data returns const void*. Cast to unsigned long to
avoid implicit integer truncation warnings. All the data parameters are
correct anyway.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..de97c0f74e7d 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	s->devtype = (enum mxs_auart_type)of_device_get_match_data(&pdev->dev);
+	s->devtype = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	ret = mxs_get_clks(s, pdev);
 	if (ret)
-- 
2.54.0


