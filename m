Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F9DC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C7Nwke+aFQIchgqktAdduXcSR9uk1TvuFvMJwR1VYsY=; b=ArTUpHj6U2cufyvi/5c/QQ2xzv
	9q7PUc/K6Nwra/lsMuIKEThi/FJ46eJ7k8NjGaah+SKcqjb1Wfy0ZW9Ne4a76IBsXwgaqtozNXjkI
	47Esgg9ftD2ucQ+39wIrACSQZdPYdr1hygNPcn3VVFVStFob3PaLdreLHt0Yl9ynBYyE03uqHE1pz
	iy9NxoytwxRowctWC+Yh4Y907NLpxD6FnpEhUXR6BV6QbKCSenSo3bDQp2sOULzwfoijUSChivaST
	gIy28neB+ZlpCztAkf9+OCVPxwvB0NumYQP8ZjbsJ1frEVBQ1pTRx7Bcq0VWavqOqD5x+d3SbQ66X
	ZoxQUpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRAu-00000000DMC-0iec;
	Thu, 13 Aug 2026 08:52:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRAs-00000000DLT-0R4P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:52:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ceaf8a1265so26975545ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786611149; x=1787215949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7Nwke+aFQIchgqktAdduXcSR9uk1TvuFvMJwR1VYsY=;
        b=shfDLGosmZKXL3ZTEvOOeyNlIafzwVV7H0gG803Foj9ILNuAYls32FD8FH9BVksw9J
         6g7N9qGPNW9O3DUO6kqGuwOTJagnVWEhH7T/EcV8UawdbEeHHirq6UjxJpJ1+zheuL/q
         g0YqjKMI1Mhg1hG1IL8P3cLR2GsySYK4qu7advxov3Bt7Wvz9104RFwAkg7kDsCDCy09
         RbVSrKhJTJfYRg6vIjrLCPMb/4oQhgUeinBBUClKEOLiMOQJFYPjljXdpa6VVrM5Rnxl
         0TUn4X7SC0kVWRcmD1o0cFXqmoVjGJseoRuZ4+xHlIL0Y3b+5NylLrOQhTlmE9ExK5CA
         l0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611149; x=1787215949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7Nwke+aFQIchgqktAdduXcSR9uk1TvuFvMJwR1VYsY=;
        b=Of8FnO5V1oQJsYIyiJCII1ZDj0ic0IGWwtz0c5UiuSBOZ9L099si0A+j6A8V91U7VT
         09HTdU8xSm9fWBjnpe5FY+kx6zDkcpaZCcbQEALGeOW1L1niRLJYiTQ9dbuwiuDzrP5E
         2UFbA39bR3P+r1hpIeKrM6cY746XD2eLqVG0kNtquyuC7XzNHeLtvueKFlEv4gTCmG5F
         on7yw3HtiaTOXn0OljvU9LyJJxNxpUCZ9YXIqkzIT8J0aGN8PQnsD9iCQAHtGarivx9Z
         RitCmnDviTpu5VsEVkC0LHvlX2cyXnkDCsLo05Svm3NGSNdzm8n+NNt3Z+nHTxlfOZ+w
         Q/vQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAg1wX/+S+sqlbcQxH9QBNARKxzXgcKlMpe4/mjiKWcHZhJ60a49yd5fBGH3ZqzhCSjZltL2jfsBnhQDRd2f90@lists.infradead.org
X-Gm-Message-State: AOJu0YwzlOvD1ixDo/Pmor3oL5iGW40cAoq/KFU9c5EKj8PYQzT/ZJ97
	tQ48IflB1R1Gzy4Hg09mjJtQbjJsNQW2+wRzNOTMjLFWBA0O5RFTytR1
X-Gm-Gg: AR+sD12yN7ngOWHd7b593wmy1lUagLjrGKx4JXny01AP6acQuQF35XVDhuII06M2iJU
	eZKchl5pztv3eejvr+i5ryMg9HmkXrKUDy98Dp33EB47sxwHM0/sPMlQXr9HxYOSFqgOIH/UrZH
	0Kp9GGCY665LNbPaesugNT7h/pE3n7z7d2c91Vx/+sYe1L4jvBM2IQg47kEtIr+2F2qdzjZA2nu
	pd1LIGqkutZ1JDw20z/9rQHbhemfYzsH8Or74THZBykZw+WIEzrjiEDPAkzhURTZRMYS4qq8Hb3
	qzlVKHkIa6znWm2aU5zf1mxgO63jTDzuNslyYIIYYZFtwTvSAAqSZDsbr1hrmrc5LEvEAaFe/0A
	utj/hqg6WAtDqu7f5Z7XZ3GzrReavH+wjDdTcNm0/yQnTxBjHH41J+I0BY6czvcxdXKJvkeF2Ui
	pptcaJLCWgVu+m/B93C2V0QBiu2Ye5KlmdDTouuibM11rTWGjEK0SuRJLLUGKuTD+bEQjO7x4xx
	JTj7yn2nxb0N35C48N6BP7WkpMh+BIpUYPAsPciYKJm27dYBnyT5TB6pTruuy4NgUTI4m4sf+YO
	JSoD
X-Received: by 2002:a17:902:ce8e:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2d37ebb3240mr41449645ad.20.1786611148883;
        Thu, 13 Aug 2026 01:52:28 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec0223e31sm5465372eec.25.2026.08.13.01.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:52:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] Handle optional IRQs correctly
Date: Thu, 13 Aug 2026 15:52:10 +0700
Message-ID: <20260813085213.44001-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_015230_146410_34161D3F 
X-CRM114-Status: GOOD (  10.41  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

The changes were found through code inspection while reviewing optional
IRQ handling in I2C drivers.

I noticed that some drivers already handle the return value of
platform_get_irq_optional() explicitly, including i2c-designware-platdrv,
i2c-ocores, and i2c-sh_mobile.

This series updates the affected drivers to properly handle errors from
platform_get_irq_optional() and distinguish a missing optional IRQ from
other errors.

The series also fixes the handling of IRQ 0 in the brcmstb driver, since
0 is not a valid IRQ number returned by platform_get_irq_optional().

The series was only compile-tested.

Best regards,
Phuc

bui duc phuc (3):
  i2c: pca-platform: Handle errors from optional IRQ lookup
  i2c: brcmstb: Handle errors from optional IRQ lookup
  i2c: brcmstb: Correct optional IRQ handling

 drivers/i2c/busses/i2c-brcmstb.c      | 6 ++++--
 drivers/i2c/busses/i2c-pca-platform.c | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.43.0


