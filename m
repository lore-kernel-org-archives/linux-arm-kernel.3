Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C044AC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 18:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfqueyaH+mhBPzEvPoFlpFsysHFc1vTBvhNztT9Pu68=; b=S/ka3j4Aqh7IYCvwOtiMpbeBN3
	AVHPf+8t/ojieUlAjHcHkvmoNRia+dx/7q2YG/hez/zqvzk6QyiAQqPd4wrsUpsXd6OX1vb9DQqEy
	0ICMONGCK9kv9xzd3RFDamOG5vZkYwBQMtjDluN8Pahw3gJZanTWnB/KlovT/uBjFnVflSNj/I2gp
	/+aMeEgx5gmAeekbvRs/+1w1njDmeIExw3hYBiHnY81J1DSvWLpmE9EBnBku8GPWlZaW2frZRsgFv
	xzesBl0glj4GErDWXgMcowKJqaLdQpMwR5XOv9Ejn9wr6DibgWeoDQBF6Oq4W5mkMVhYgCtu0v8p7
	2jIDGrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucThJ-0000000AwOn-1yB6;
	Thu, 17 Jul 2025 18:51:13 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTbk-0000000AutV-1pln
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 18:45:29 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-72c14138668so562142a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 11:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752777927; x=1753382727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yfqueyaH+mhBPzEvPoFlpFsysHFc1vTBvhNztT9Pu68=;
        b=Hzu8JlAbSLJ1AK/IfdG8C05n5c0s8H/KVhf4376A0oeCH+Tpp0KvUkVuba/EusH1h/
         7KZHX4NQK2qc/6dxSF9mai7cBOws8PCbLuuem3tKJahMby/ifqjQJ1wR2qYvXuMFOHK2
         8c3vJsJFXQH/BAW/GkNbxN+O3rKLatBjZccuisOA5K89FSJl/64VctjcCaPfMG0Koisv
         ripmRozrqUM/TKBN+lf+SqOl/Y3zj4y+cCrKn/tJ9rKqIAtI6JmO/yTXLUZOdQjBC65f
         h+2u4gTMVCtfXJcKilTa49ho6RvYI4FlHYmWVcV574QJoxsIvYrF28ywuk7b4wYUm+3E
         M1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777927; x=1753382727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfqueyaH+mhBPzEvPoFlpFsysHFc1vTBvhNztT9Pu68=;
        b=XLnxzCDg11OgBiK3Own7DnehTTdnHHDUGtDfoHNBHOWgL17/TlH8t7yZyP/r9KT1Dp
         58t72WZ6/nSt709ZjLMpJJjqXpuqOk+LsaH7NYd6P0lRp+pmivadhQjnugyl3vzKSiGX
         RrSJl3edzcx/C6XDaWx0UspTPgE9IcWEGibq40/2JInISHWr2v3odWU+Fo8FQDyBua6z
         dEeGXiFYWITaoTbRMM2FJBRfCccWzbM26Sx8VT0EikBLQxmD/nABPSmAvatSNUVG1Wkp
         dkFE2I1ZDeEq3NlCqqs8VybU0wnlcTBAKbEeywiLS0sW2KeA88o2fj1YV6DFEdlFIymX
         IUwg==
X-Forwarded-Encrypted: i=1; AJvYcCXKMNBg3MjHK1dFPv7FjGRSHptROC71YNEbNixBPlx6jdVqaFrBXO0UV22sY+cYOkdq9zD2QDMypX97cgrNEjgJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwBJ3zmt5BsLMnjF6rVhb17lIswkq7wF6SpEmpxAIloSXdSy095
	gf4gGzkqGgSDyghVKvZGCXj+FG6bFTm5Zi/4BNg0TRWAPOD4jMyhUC7oIvjjILhfW8A=
X-Gm-Gg: ASbGncuzbnUd4A1VpbG07QceC6XC/RqziY8L8eakLuxtBx7qfwjel0znP5efmov7fMS
	rgg6zxdewWQNc7XMxSnQEPyR3Quk55knIupy6ZTJhZ9MmCwhd/hs/4bHsm4fG8H3UdJmN2H209k
	YBNoz1k00WmER0adAgwB1pdvKuk/BSrdz0ZZ8xXzH4POE/DKwwd0+WU7Nr6QwiNyi///z6ewZM1
	RUFOFdh9ob34sD0mD/ROFCrF1/2GB6hH39zdLyQ4S69k7P27u/U3WIqvEpSj6xIPD0mQxa57Sfn
	Mv4+JiJ4dbIKN0zbwc81AlGHYSbnmnvt8/rzwUE+Dr6SrB57QmQCt/DjTKjvB8hSBiXX9MevkoQ
	XZAVLob97SLSK5ILGq6nCQDaO4UsW3g==
X-Google-Smtp-Source: AGHT+IEPPSIFQhNfbay+212JW96etw3WPLZiv0nsf1+owv4B4k6WIOAb0+YaPANLkjQNpWntTlrA6Q==
X-Received: by 2002:a05:6808:30a0:b0:41c:4f7:1929 with SMTP id 5614622812f47-41f9886f431mr53285b6e.21.1752777927466;
        Thu, 17 Jul 2025 11:45:27 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1982:bb13:46f1:2e60])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff116872c0sm4690824fac.29.2025.07.17.11.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 11:45:25 -0700 (PDT)
Date: Thu, 17 Jul 2025 13:45:24 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] irqchip/gic-v5: Delete a stray tab
Message-ID: <670bb1dc-7827-4916-84f3-bb46ee408b20@sabinyo.mountain>
References: <cover.1752777667.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752777667.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_114528_477886_328BDFC6 
X-CRM114-Status: GOOD (  11.92  )
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

This line is indented one tab too far.  Delete the tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: no change

 drivers/irqchip/irq-gic-v5-irs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index f845415f9143..ad1435a858a4 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -568,7 +568,7 @@ static void __init gicv5_irs_init_bases(struct gicv5_irs_chip_data *irs_data,
 			FIELD_PREP(GICV5_IRS_CR1_IST_RA, GICV5_NO_READ_ALLOC)	|
 			FIELD_PREP(GICV5_IRS_CR1_IC, GICV5_NON_CACHE)		|
 			FIELD_PREP(GICV5_IRS_CR1_OC, GICV5_NON_CACHE);
-			irs_data->flags |= IRS_FLAGS_NON_COHERENT;
+		irs_data->flags |= IRS_FLAGS_NON_COHERENT;
 	} else {
 		cr1 = FIELD_PREP(GICV5_IRS_CR1_VPED_WA, GICV5_WRITE_ALLOC)	|
 			FIELD_PREP(GICV5_IRS_CR1_VPED_RA, GICV5_READ_ALLOC)	|
-- 
2.47.2


