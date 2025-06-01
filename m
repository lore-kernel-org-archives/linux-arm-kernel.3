Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ED7C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 22:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SF7cA4E9BN3hkPat2YYsHMJ+T/3Iu8BTo2+5VoN0ds8=; b=UvslnhJmbBYS6XRq5n56Ijq+s8
	/6vi2cfuUjtkaY45od2J8BSmFGhLXA9Jc02X1to6aA85stP/F5rscB8f4Ids/1CQ8PLVaKRwnMPtY
	0m0ibVQvsncW7KE2r1D8VRvZ3VndjDcAv62z47IBIWJWHpWYZ9PabMr+B2gJHMRxyxZG4Mf2cMPR4
	VdzVB4U3FgLYoYm+b1X1xnUqhq6pJ+0+yMDo1P51FHLkAPhNE8IWOXpO92+McJhYcW9DFTEj6m6y2
	RP6mA50VeUeTqJl5DJLi51rWVKak0XRUiFdiq3ZvxMvApjQitZIGKKK5lBaOBQVVAe8WANEom9JZk
	8SZcnW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrQJ-000000060sP-0ERh;
	Sun, 01 Jun 2025 22:44:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrOB-000000060iS-0Xb1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 22:42:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-450cf2291bbso13104035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Jun 2025 15:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748817765; x=1749422565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SF7cA4E9BN3hkPat2YYsHMJ+T/3Iu8BTo2+5VoN0ds8=;
        b=gQ+H93qw64NaUlCqMDjfmB+xSg0uCzj2Hru2nQVCjLrwL+NfGv0BABSNtdNBGuZ8zb
         pOylMgKK2sj0xvMsUjxIP92f/4RdewQuvAz7Y22b8Z0k3k3Xu2NB9KZdhYU9ss9KsNkW
         Zlkm/o8+QV2LH3c87+Rz4POKEtonqcnhuQTWLAn7qUu5fg/HpJxN69uGdhGiQUP7fNL0
         PRrd/TuW4qj8LfbUIjkYt3LVtmupAfqthnOfCmzIsMYbyuvllyvvgXnAkVjAJZDE2W8V
         QRvqdKSZp/pulTSsDccSMSYghmAHuD9mto5WhjjwTJwCzPO5uCJRyJcP0CaLm6CL1LHs
         EDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748817765; x=1749422565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SF7cA4E9BN3hkPat2YYsHMJ+T/3Iu8BTo2+5VoN0ds8=;
        b=oaS+txNr7CXce3zyM02KG4AaCeam3JPLqnIlS8F476zlV53H0JmacvKUt2LxSTBW6K
         6RlZ08W34wNOXv04pOhb7ZsocG3JziWjnFI7CL2TY7oW3EVoEwrmR70vl54c+QDUqqO9
         p8gRPkEKU7jee4kV+5TSptQeTTJ6JOSy35pCfeCNKPbyp2lX2A8brlP1EVFPswFPN8af
         FigT4bF9S+PTvEGsGKZKuVvamctzRnk9mh8IAFxdMpTYcaE6uIVF0qP8tM+LkFWvkx7B
         pH2MbMWEnzJ9m+i+LblOwKOu0roVFyU+52yoSJY10p32Ff9R96vs5vXBqFOd6Fm+YQwT
         3wpw==
X-Forwarded-Encrypted: i=1; AJvYcCV3x7vgrL6VSQRPW1Eu/K5SU0j2jE7KVL63UIOtn6DkjHsQknJWqfRLBoZGLq7Ir/J7MvuKIDkYoQYZYmcsWh3n@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ll3+4kz+oo04SZf2UCJK0JCpstnk2BROYBk+RB4RHCQoH3NG
	cZeH66dePogxfTA9QPxeMV28NVtx7ooZVBiuNWTQrsLQg/lKGpGduANg
X-Gm-Gg: ASbGncuuAC2Ysf0OcLoJ+x4g/j1OzyUhjF0qIbxWbY+RDGgqMUSDq9pXqD0kdqjhJnC
	mnXbhaPfr9izZWY29+8RxRW4fLeSwO1Rb85enuzqRt99DwqEgxxglFi7JrTPdFZaUwMwwQpu+pU
	nwH8ogaZkoJmuyM5nNJAvHrFLY5qPPw6KrptJYVBqhaO1X93iyT0bn/OijRan0uudrRQ6+W9rAL
	Y9p5BB3JsHwpzAqAM+/Pn8nQFZuG8mpwrkpRyj4dFX4gK9sANjlA6DDaeDSea+088dTcb6BvY83
	zyE9As6x7+dYxlCmwdveTUMNrO2fT+IjTSb1RtKFLXDZ620zEZIm
X-Google-Smtp-Source: AGHT+IG3zYFoACQN9M5H7HAo4tuvdifGw7budMeC1WAUHcB3EAdv/pcs7cNuCuhFCjbc82yl1vfYew==
X-Received: by 2002:a05:600c:8207:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-450d64c1bd9mr91267365e9.6.1748817764868;
        Sun, 01 Jun 2025 15:42:44 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:4518:757b:6751:290f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74165sm12916554f8f.53.2025.06.01.15.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:42:43 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>
Subject: [PATCH 0/2] dmaengine: qcom_hidma: fix memory leak issues
Date: Sun,  1 Jun 2025 23:42:29 +0100
Message-Id: <20250601224231.24317-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_154247_170192_B6A13E31 
X-CRM114-Status: UNSURE (   8.50  )
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

fix a few memory leak issues.

Qasim Ijaz (2):
  fix memory leak on probe failure
  fix handoff FIFO memory leak on driver removal

 drivers/dma/qcom/hidma_ll.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.39.5


