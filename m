Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD286C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdAAxDDaMxvpNAjV/CctTPs/H4RQbciZErv8mqLhoHI=; b=WIpSCQQioo+CvLKXbZya4hbY8C
	mbCL4GHTxd1Zcrw1PNPOsAY2i3yx9Lk5PtThf8V4zrHVQwmUY6AEevKHnVFfTFPnsPXhefbluTxqa
	uR/Fz54OCiWQfPvyVQJKrHdLnVborOI2kJmqPGo0gzx+TweoUnWWqZqgFg2hgiTBcCrzQza3Tp5v4
	XAzRhGVHj1wC81XtFiBiVvd5XkDjtPkS36j+HhNIcYabW0Zgf3jq+g63hXTDAAvo2F9yCyy6WBqMS
	bfN4+0geJDBdJZ6g5mUXQb5rQC14lTIFtkpKKH3vnHy3ocSIfzZBt7Rhx1Bxrawkfba+9lSuIYPSY
	4anFtX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMat-0000000DSmS-0pVO;
	Fri, 20 Feb 2026 09:14:39 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMar-0000000DSm6-21Qs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 09:14:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-824af5e5c81so1842334b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 01:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771578876; x=1772183676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdAAxDDaMxvpNAjV/CctTPs/H4RQbciZErv8mqLhoHI=;
        b=j24h42uPyCobaoYsv/WTDBG8ooH2opgy7j5bWH/FL/SZ3L//AMzpOHgLBReN3TRyRE
         WpmhDtLxdcm7FQBkUvcLhfRtwlUY5Rz/F8cBDCax4A5bvl/OOusUZL+8lQN9wMObdsQt
         KKw4jchkSCP1cb5NkNhwLGRmWbYBrrYOFUwEdz/43UW1+Op3aZXo+roFuSw26hd2eKsy
         pkGJV3Cyi6rm9seTBMgHRQjHN7IujDQC6EILO0QBd0GyZ5mbYc5OzrgvB/xWFYkJLhmP
         vwuAYB03nsqou27719JgHg9C3mZ02og6Blw+KHGO69z2evQmAcg9KbRAzWcNqLkmW9Ow
         npoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771578876; x=1772183676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pdAAxDDaMxvpNAjV/CctTPs/H4RQbciZErv8mqLhoHI=;
        b=G6i7Tb06+MYOQ/9SPvqjjAnWhd2KgHb3+NEPPuIg3dwCRRmTwP4O6V1R8y5MYhBhu8
         MypjVYK/deFXfeRjHiiV16Awjff/KmcmRS5vPGWN/XyyeFUo8j6ecEV+Zz3+bsqBAJsu
         LG67OF3kmwTBkFupBaU10doTpaoOD9pkK0H8l2kacpIKYgK4HMsSGbM302XopMfb09k8
         9lEF1GHD2KLPiCBjhYcNsLWt+IzMgfKkqC1zq8SX0PvtPZkdHEriMQM+3wUJl3sONcFH
         og5WhCnGfxHdYDSJH0rMArrkwPVRJZ5AD0tp+rDYHu9kCY963fNQONYcRiNmn+zEYCde
         cDcw==
X-Forwarded-Encrypted: i=1; AJvYcCVlpt+6bT51ph3f+G7+WGBCfyQpfNh8D0sbqZM6sYVoHMVURtEwIPV27pYsz2zIn9lG/r9JYDZkP0DG6tBt8xCV@lists.infradead.org
X-Gm-Message-State: AOJu0YxMzZ5lsByBmv+o85j8Ak8Eghi3HSaoTo44IrAeMm35fphsfiGv
	v3U8zsNSDb2vUNVqyMWeOr1LVMdIfqgvvD5I4o/VPVgoP8sYIHsARtzo
X-Gm-Gg: AZuq6aK3mBQU6QnROphmzW5zIYuNitmvjLwHeOdd/tiVOm1Y2870Cw0vNjPVWZ7gdLg
	VXR/uVoDSEn1VZLWHsVT+VZxlEYADA/mg2kvwL30hEXyil6RjU5KTmRLOl4MSr18lNi3dGQHM8Q
	GzUlvcZ8afKFBDvNYvlBV8HQRSMldJFYDIy06vpwm4ZsaHmtBgky3sKkOGGriOwfV5IZRibKXEJ
	QzSxvOGW7sSkM8OdHKGFK1a1YXHkID38KyUgFfp9o4vIZs0voRjKWQzDrUsxjMDlEiQvRw/Zq+0
	N4xr+QfwSmKBb1J49694K9NkZp7rzOLRIvGYlhzx6e2PJHbVW551xr86ObtUXbUyLhmcgEeBbRj
	AdlVajsqXjbtyeNOeNvY8g6WjCCrfBDUK2dg2PDGjyBycJDkgqOkw0pfDlBGG/6cN27OQm4kJAb
	YbN+G3OVhHM68Vg6L7095hExPFJTqffw8nOny790O/iw==
X-Received: by 2002:a05:6a00:1405:b0:81e:f623:b9fe with SMTP id d2e1a72fcca58-826d06fadd0mr1246766b3a.4.1771578875931;
        Fri, 20 Feb 2026 01:14:35 -0800 (PST)
Received: from bsp.intra.ifm ([123.252.218.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69f2asm22230802b3a.37.2026.02.20.01.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:14:34 -0800 (PST)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Fri, 20 Feb 2026 14:44:09 +0530
Message-ID: <20260220091417.5865-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_011437_522750_ECEF5E43 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

From: Rahul Navale <rahul.navale@ifm.com>

Hi Folker,

> Posting this as RFC because I can't verify this actually fixes the
> regression as I don't have a ZynqMP. So Rahul, could you test if this
> fixes the issue and report back?

I tested this patch on my ZynqMP platform.

Unfortunately, the issue still persists. Cyclic playback
fails after the first buffer period.

Regards,
Rahul Navale

