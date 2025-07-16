Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721B2C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qFkfRv2cl5hUFZspKL9XJMDg1bK7UnJhQtpquS418Do=; b=d7Ss3bCR7/6LzKGxrcXStjWsSf
	55tHbUFXHCmhCFyXk34qDHZcKMkAyMkqKJPG0tlRn1ckKfXCMqXpauHJbxr88kqnxxsrUg5PfUrsa
	aZ6iV+mDHkRT4iyHlbS1VTE2wXTW5YkSLDL0TGGtDv+eBeu7LVcg+/3cXKr8yZf5yeUHWU8Poot9u
	jD6vPA6XXABNwgC9iY4+jsL9Lv+PTHClkQNI8P4vfV+8cCGsCnv+Q4arW1LnCvEarBUKLTDEFfBWk
	F7yuqEO2rG9BwXyO0anZ2XSGWAcGaotmuGsY7dXrvDN8aAR2MA6M9grW4g9N3cJJnzy1Rpv2c6Utz
	Z3GthZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8u9-00000008cu6-39h4;
	Wed, 16 Jul 2025 20:39:05 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7wN-00000008W2m-2oK3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:37:20 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-41bebd9dd8dso77324b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752694638; x=1753299438; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFkfRv2cl5hUFZspKL9XJMDg1bK7UnJhQtpquS418Do=;
        b=b9vN2llHL2MPa4V2FzZ+5M6/qQVffd8SfvLQtEuSRc4JGMifRVWOdBJJ1e1bKNlh26
         1AnZ13l4/Iak47EBjF/n/D7RfONdVqP8oYAVM5VbIS7JiFKW5NhIkEdZ7z+pa08S+feM
         QVv7Ki3Bq2IJbTAGtAXaotReyZod8Sf/GOIebfDrSsroHPj9a93SbKemwFSBX/LiJ68D
         SwxKZ+nH3YWesnbtZFCPm04VnL+4dk4FMl6Esdy17BPUa869y5FlesYs3ojwnEC92aYs
         EbePqGyAq0JNhhC48K4vjPp5+t4O2h1CUTUj96wGJYQU8oRtIFkXkZrlJaGyExGuMVlq
         5WlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694638; x=1753299438;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFkfRv2cl5hUFZspKL9XJMDg1bK7UnJhQtpquS418Do=;
        b=HMDQ92mp8LkB154WO9nGO0MRQrYxY+hWvKGwVXQexuVP/YEvss6ksl74AYy45hFHFh
         LiZy6kpYLWdoIZpqCY9f+xM1gXczbd7TgAEidcnX6nEjT5Bp/t3FBnZk73yoroEG5u2D
         opCs5CjGhryBHpTcBDKvLRQ3Oqa+FwDXSji8TmL2zk8523TswuijBlP4YKOKa6GXJ4al
         IqGXS62O8OGpldLIVLhK2v2N4mPw08rQGWUNzYpBX4noe+pFxI53htnNLKNuffcvPD0V
         sp73T3SKNRm/972KzLyT3rgVs8jnbRqIRFo8b8Eb1Pi3XnYkC4wVyh6S+yVnh9fUvhEn
         Gsdg==
X-Gm-Message-State: AOJu0Yy+rCQgmUK3RuHDPAjx+/zOQBPmGRqzF/+NS0IwSCOXvR5hMqfI
	EXlt1zVHI0dB8WJoqhT5uiTmyq5yM/0fe/XP9hAd3AkT2jc+SUtaVFscWS4N9fapfgUQuEuIB/0
	tjPqA
X-Gm-Gg: ASbGncvbT6QKzjsVAJgFBQH6aM5q83B5IxK8K4D6stJKXCUz8MgNn1vzOaV4ViMby4a
	nlfIWS1unDGQ1U0cwyaq5/Kit5xr7yx8b9CE/le6zZPlVXUYOixkZSLjKAK1tpxm5VL1HmyM+Aj
	hmCjJH6K4uVjYAu7Z2qV10vsHQADlERwVVC6YLrb+i6+7ENC4P8CENH0rsyhdqdsSHfA4Cg4ABF
	EOaCy4Db/aXPCjWYyxd5E7o8C7uCP5qt2/fMD+PPG/PGwvUBsEzwmW1CGtbmMQMhoK3753sK7vF
	DPIveeQq/G42frkZspYJoTRXSNvbMJ4qRNfjsiIz99q+EbFhBBSqVupbsIvkZw72iIPck8274v0
	Xp9Us/WkF3+zKP2CI6RVVly39bUu5CF+YOHUcIBjx
X-Google-Smtp-Source: AGHT+IGVW/Hpd/xCktrXO7wHgnYK9QY115QI+GbTzeXpvTW6lSyiR1JIBdsoODH8tH97WLglzM6acg==
X-Received: by 2002:a05:6808:14cb:b0:40b:3816:6637 with SMTP id 5614622812f47-41d04996d5emr2622802b6e.24.1752694638543;
        Wed, 16 Jul 2025 12:37:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-61598384872sm995165eaf.9.2025.07.16.12.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:37:18 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:37:16 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH 0/3] irqchip/gic-v5: Fix some static checker issues
Message-ID: <7feeb4d2-1033-47ba-8730-150993491ec2@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123719_716721_6415A23E 
X-CRM114-Status: UNSURE (   8.55  )
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

These are few things that Smatch complained about.  I have not tested
these patches.  Patch 3 in particular probably needs to be reviewed
more carefully.

Dan Carpenter (3):
  irqchip/gic-v5: Delete a stray tab
  irqchip/gic-v5: Fix forever loop in gicv5_its_create_itt_two_level()
    error handling
  irqchip/gic-v5: Fix error handling in gicv5_its_irq_domain_alloc()

 drivers/irqchip/irq-gic-v5-irs.c |  2 +-
 drivers/irqchip/irq-gic-v5-its.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.47.2


