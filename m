Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337DDC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj6DipUsOyvMZKPZE3nzhUz8hwwRWIeek2sdPfK3r6U=; b=IAdGE8HjxJiBFeeQ4bfEQVN7Os
	RgH1PRnbOaBC/70BmXBNz2ADXQEPnh2BUomGpexVvMSXYR802ri3L6+kte3aM7AvIwy8cpt8cplCq
	HF/Gx1f5VVD9SN/FD2dABOtI7Qs7a3wUUZd12Zu8eAWxbcWwl0mnLXPfh8LLKxgav1NORTY6bq1d4
	I1zqjd7sfrVD5lH57QPfrfxGibZpSd5axwI7+qJ60fAfVkAAhBY62al+auRUPCnGhT1VsPQ4piS5r
	CybO+h4HLl2bG0Fw41s+P5Hpzk29gn8FlxJvEDmB7L3LlCqPaaPkez+3Df6vTJ9x1EdmyIs8ji9+s
	gnIEongg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz3r-00000000QBU-16p8;
	Thu, 07 Aug 2025 11:45:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujz1M-00000000PlX-2M76
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 11:42:57 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-240763b322fso9384525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 04:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754566976; x=1755171776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj6DipUsOyvMZKPZE3nzhUz8hwwRWIeek2sdPfK3r6U=;
        b=Ta1wFtLNnp+Ush/Z1WDCtAH870xjsbdWYHXxXCUl10HPEFCqcQaIuryRWERD2C1PNT
         FX6RPjKWZD+KN2pyQSw6ODkaE/q07wI0Vunuw2WiRckHsSqD8cnmtRITIY4C8OMUezba
         RYKUDGUzW14cJDjoXTWEsC5yC1+yzp2+TgdDzxrVYKx9+aqGdRvkoJ2D7y8sxIUzSzi7
         Z2t0DDJ8QARPwexzHMokIN78vYwRnMVtjyA4EaVgOJF5Q53QSg2232O/bSrE3HCiCnM8
         5rHYImrs7Vt7CHzwMeeG2kJ+Vkx3FtTnsKJnTyXFEJzul9LC+jZF3kk3wieFIXJiE7Id
         MLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754566976; x=1755171776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rj6DipUsOyvMZKPZE3nzhUz8hwwRWIeek2sdPfK3r6U=;
        b=ubzUcDcCMeY5sV9iKBLqlMLebAkaRlxWIdMoVbS9TiBp+tKl2kXMabLH/5qsVF7HEi
         ifL8of8jm2RUmEA8SGmVVS1Y07wQmkqhG5yulj2cOCzw5hWVK4wxZRTChkLx80lpp1A/
         Tbx6sEbsHma66KRgs1VHBX0pLvidoxendXMiQ4KQH0af8kYQnHczjvVE9fL4YbB1Zzrp
         L/I34sBBo9vDg9iczrsRocurAdDezzW8wfJ876VN2DueYTgPC+oDUfQliDwG1kydTPki
         DC3fAWaCyQAMDlTTLYNj6Is4vhE7LDzH0lVxWdFs5IHBl5c1WvX+YIIhnVdykHmPHTQq
         Akog==
X-Gm-Message-State: AOJu0YwcViCNLlZo5nbheM/r3RvX4sOD8WtrTkALrtUDX5AaH3RTlT6c
	81CoDtdZNd5qx6c6K2mWifZC/ViPzPPC4dHTlFOxbWshksCvcF9Zh4WR
X-Gm-Gg: ASbGnctzoapvKyDmeTazRJnwbEc4wAo0wzF/YR/fYPggROEKNuIuR6xmWTf92AopPeH
	RuamJyBysKrb/3hrEufawmiyANNREoSzWl2vo1x8afgl7vlNrzr4a4IqMjKkoyPNvbHTk0Nz0qt
	uhXzDmqHSQ4gNyhVq20U/5/W9hZ6g2CY7JKTXHSQzim7fno9/kV10Nd3LMbZJuFqa6h6MzF6aiL
	OnBiosjCblGvUzwK9JyYE6b5czar1m4aaeVRUPlSqXE1DX/XckAvDXgUtSNUcXSgUKfbQLOImd7
	c/WvxTyEjedNMiuqpLosjy2NZfVjdyq9cHK/PGobshQ9YeP9griKGooGG5qttfl9eZK0F12LjGR
	O1HZDZeXakDizN7y/MwlwBlwEOnTQArp3
X-Google-Smtp-Source: AGHT+IG3ZtqzKCP06yrA47lTy/NFZemMNJP3yjJHpioJcwNNrqfVvMG+/ltRnnS5KI5VbeTgXna0iA==
X-Received: by 2002:a17:903:22ce:b0:240:1831:eede with SMTP id d9443c01a7336-2429f51e3c5mr118816725ad.32.1754566975705;
        Thu, 07 Aug 2025 04:42:55 -0700 (PDT)
Received: from server.. ([103.251.57.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21c65sm185729405ad.73.2025.08.07.04.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 04:42:54 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: anshuman.khandual@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	broonie@kernel.org,
	yeoreum.yun@arm.com
Subject: 
Date: Thu,  7 Aug 2025 17:12:28 +0530
Message-ID: <20250807114247.5915-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <005af416-66fa-4222-964d-e20bd2eccb7f@arm.com>
References: <005af416-66fa-4222-964d-e20bd2eccb7f@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_044256_599201_83FD172C 
X-CRM114-Status: UNSURE (   6.35  )
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

Hi Anshuman,

Thanks for the feedback. I've added the warning text to the commit message
and included the Fixes tag as suggested.

Patch v2 attached.

Best Regards,
Bala Vignesh Reddy

