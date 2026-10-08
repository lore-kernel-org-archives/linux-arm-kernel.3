Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E528CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sJxEIraSPOLWNZvCZSoZUxwKzeKR9+5tZ/1A97aGpYs=; b=eLvZB9U3MBBouU8AoGJ9eInBR7
	6i2z1mzhNxulgwxxDRFRodvIlKBClyyVONfRccuy78FpEXVfXCaVBZYS8Z+xk/szlKfgcJkKDK/ez
	AhHMLkEFMJazemmg6C9mUcYFbgT8jU7KHY/TW28eohFgc5GXx5Ge8gWNPMzLYNSAuzuRYu++JR9Wp
	ujG4HCgtMSOfVjZLgFqGIfjmMW1i7bWtI1AcdXAD8LAOWpuCfydYanehKKZUiWmACV8X+mJlz6Seb
	R+kAITumbzGxlci+gwvIkqGL9C8Fs9MGh04thovT9E89h6a8x38R93WbUNl3YcyYI91+auXgPGlio
	/8e2gm8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtbZ-00000004uWO-0lX1;
	Thu, 08 Oct 2026 19:16:37 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtbW-00000004uVJ-0i1p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:16:35 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3149342eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486992; x=1792091792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJxEIraSPOLWNZvCZSoZUxwKzeKR9+5tZ/1A97aGpYs=;
        b=FEbWhMf3IduuV8uv9LGWEHPxuRfBMA5vwTsqtfmclJ7vXZNG69HRNlZ06YQ0Ohcu4S
         xQf/ev66/h/Ej4bcf4emUuYHDPCDjXlynoOPEG3xVnR82Rb+ur7HwxlGJ17d6AEJhgYG
         cIJELGNrTCQIasxR76Y4DVsIP+CzUo6gdUgypz8J/mJbjT9cSTlAKltttfkKdzy+JDxh
         6hT94KowWi5unkKSY7auMfOqMabHTOKFSE23Dye2U3KD6qs7Rnwsttxnyh0SWtNReswY
         hoV/XBwIKT58jtF7khTaS0/xxDd9v+DcSUehzQd7L9/iTT9OvOs//FykB4RXKqXLz/fq
         dGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486992; x=1792091792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJxEIraSPOLWNZvCZSoZUxwKzeKR9+5tZ/1A97aGpYs=;
        b=T/mxqzdzmekkZTmobfLW+mjfxVHqSs8g1BUjMkppbVM0rcw5rN/FWoQN83GMuEmj4s
         Tdce2DMbJmcpZ9o5eEf25Hu2MhMzMK33lSy2ryXeG4gl5+Q6sPedpMmz212h6m/22D+j
         xiQVdWSL06dU3qsBGlqCat6HID5G2Ll7YnFB6tMgpgTdbfAB7mQwdijOHpffi/1ZEtaI
         Vse6fRBlm6blpqrfC2gvfoIafvFwOEPcp1jSZ0zrLFZAvUMO/uHCOQMF5PPnEuzA4VNp
         FDKsv2FUlOyCyYf7XF/dftlkDYIfVavBV6es10ry2neJv194+HSUYsMvTto4H/7KEEr5
         qmEg==
X-Forwarded-Encrypted: i=1; AKwUvBxCadm3SYcVpGe8gwoKGWcAogaw3hCpG6ncOUq3/5eXXagDFtasNjL9Ma3ubG3fXqSCgn0ntDflG9zhnR9eAIlx@lists.infradead.org
X-Gm-Message-State: AFq9FYLP0ZnlkRwtnlMlUq/mqzL8zzxjkR7Qm4gOtvGG+j9tBNp+IK0J
	QxLlI3MEyKnqzCveaq3k+6IHKUMsDY6+jpeKuegosu0jXvNxvnb1yRWEfSRoJL+ySb8=
X-Gm-Gg: AYBFou23BQNKafmzrv9KWiUqqFO3fMixzVhGBthUJi32hUzeN0HT+fn6Kbv4XE0uJn0
	M2Sqe4IM1jia2iQsRTMOxpwWt46XnD4PF31+hdQvL+kQovfvbPk9xF121I1tm5JYlIsjrZZbZ0R
	KLH7Xkh+BH+ofL9wKX7BOLzyBlX8V5EHRyhukFRAtiGeqm5ecpEHwjSII6eFIUF4juEtZuhgFhN
	7YQifcP2Ysp8GUzZOZuzL2+hqEOG82onNcN5gJyl6Fl8FNt6otVD1Ljq+Qmrnq6BXqe6AtIdiAS
	J/OkhtZjvZrsPDPOG0zbyOaLX2VIKOht3fnINtBReDJktW4GvSCQ8rEKPWuTB04Ak9UbDddbk50
	DCMoxHzWqRDj7Ss4rejk3dlAvt5fgJi+ScyEVbxkKcf14FsYwsuWGjqCSY5NnpdxzL9kygKvcC5
	jM7D7H0JeZLbHOHbWBkpaFuP9fgEYwKomB0BUG9nKIeQvHwdtkHRXy5w+rERBQ1otblHiQ1Y+7H
	10l+gMHFV5GzhFMQuQymt7rjMwdS79itx6rdvHi3MS/LbD+sg9pv45TyeLCtkTN2KHkSvAlrYcb
	lWvM9Q==
X-Received: by 2002:a05:7300:881b:b0:351:207d:bff4 with SMTP id 5a478bee46e88-3515db9c789mr8494154eec.4.1791486990854;
        Thu, 08 Oct 2026 12:16:30 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm54053eec.20.2026.10.08.12.16.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:16:30 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	viresh.kumar@linaro.org
Subject: [PATCH 6.6.y 0/2] firmware: backport CVE-2026-93083, CVE-2026-93093
Date: Thu,  8 Oct 2026 15:16:19 -0400
Message-ID: <20261008191624.98532-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_121634_213916_E8BE775D 
X-CRM114-Status: UNSURE (   8.96  )
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

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2026-93083,
CVE-2026-93093. They must be applied in this order because the later change
depends on or completes the earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.
Patch 1 also affects 6.1.y and will need a separate backport; this
series contains only the 6.6.y patches.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. firmware: arm_scmi: Publish channel state before callbacks
  2. firmware: arm_scmi: Unwind TX receiver mailbox setup failure

base: v6.6.157 (79643295eba17affbd16ca97f3ef04c90266b28c) plus stable-queue
revision 958ddf240a33ef26b1771be944f0ea6c3b597472

