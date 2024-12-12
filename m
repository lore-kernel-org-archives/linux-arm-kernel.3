Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C6BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+xNT9o8scJSCGD7/hX9myZPXhoesiiISnOX8ftRSxw=; b=YpNvreEoFyD42uRWgbbOhsNhBG
	auY70z/uJjkREDnoKvksqbQfb8b9SJw/szIxVkGXCXBqIRmRfJ36iA5cg45GSNfQz3Sp+gUA4wXqH
	qTjiiB49o70yBvP712bnkpLidqMS42Ma+Y1NBLPV08KZgSovbF+ccXqNwAIiNGF5r+I6WgNvYLgg1
	6k88bBmn3qRFWHLdxGUgYLWs0HnhEI3Qyn+7vomlcO628GiyhWs6RXTvV9zQzS7pdrnvIBCOaz/Ta
	S4Bygm5qugYyGgfDEazdBEuTuakyZQUnxAHsuvmFbDh6c/7xUuLQoztNjpBVx0P2uHBSvcc5HMzSV
	iN9jKtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdMo-0000000H7uB-3m3A;
	Thu, 12 Dec 2024 07:12:10 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdFr-0000000H6Wx-2fmZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 07:05:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-728e3826211so213044b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 23:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987099; x=1734591899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+xNT9o8scJSCGD7/hX9myZPXhoesiiISnOX8ftRSxw=;
        b=FOwWzLA1Yn4EuaTg2ypO74QWOSEXTZ5pAdqc4SQtfgsFQMKkpsHU2zP3ys2+ZwiXWK
         2qeqXc+Ji6oBhbcXDkRb4zp52W6DopmnU8ckyzWw34kGg8Rs9zD3vmO5f0ifv9jSmibw
         OdTPp6H8pP+nJR4P2kKc3bmsJUYja03clBxz0eNspILdNCLxsu/WGGjwWmpuF/Tn/ejJ
         HGZ6KWJpgMPw7uOKrlEZnhjMju3TkzmLNfh6zm4pJBQJjiaSsT4CkMEnPTeDrgdSk7pp
         XUbEkwdS2AEBe2B+7tqvsizqFLczTgG+gj0Xo5AZ+xhqBOp6iBsiZvS4FYQcKV5QFnbj
         ZlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987099; x=1734591899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+xNT9o8scJSCGD7/hX9myZPXhoesiiISnOX8ftRSxw=;
        b=pG1jKsaihWfUFA+EMZf8iyZMsepTKQQh6vtX5s6Y03q5XMtQ9LErhuOzDQ/OG5pHN6
         xA+TUzw/0U685EEClZfWkmdBvz30MPXUOB+vRwkFtev9lizJOfEfctiFb7aEte6oWCGC
         fHUQAC7INkr/Xl978MyROAzekfj4tjIyx5iLU+ARfArYBk0YpfQtZIDGS0SoRfwa7/z9
         8isksBxF+YikGCJklkzMPLN2L2kTvz9TZxFz1dxl/xqzqK5MqmXXYB84cTKmxU6KMxkA
         dpS9ghKiOZTuYsblHbl3ccDkedMZE2iX4NTmzPgEmz0M0owd6A3DIVf5BK8XmG60KNo+
         AsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXApnkkCt8aI8movDgzewAwYyKfxoCYLfsV94ozrVbCEk4EMvVRkENU7A2mOXU4D/ySDUtfko9A3218QjNPxRxK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt1ydM91iDuElYJfYqY2EBI2kJaxwJM8SNMA/hvSsxPwDLM7d2
	WXebaEVNINT0fYbyLBIU+2tr8Z5w7cxKwrffXr0cbDlnYr2cFlgC
X-Gm-Gg: ASbGncvRmOiDnXm5fHpnxYsI3UB6l+6uWDUR57aEAbe+Bno0FFQygDk/YeJ7G6P24oq
	ejlcHudBTVomOoYMQkN/w6izGcTnuLV5/zN+zZyzbFNykQ5ZA78+alOfMp8EZCHyvH1cyTIOtU0
	BwzPQ9/PQGMz53A+I06Zhe8Pxtd5p7JdlqXGA9AMmDCXFyDZ6mZ+dMUxuHe6I6QDxTPa9a37zl0
	jkoODmxX2I7Cu7OXeGAK8zY/XPbiqdIXKdcnBzzWDoCSQr33FowemBnjz3B12DQIYNnLK2A
X-Google-Smtp-Source: AGHT+IEWZFABNU2cmsx9g4Vfkxtd5tDRV33KNAhW9o7B+oCf+G6xKL0qxxHdO05yjrF+abxzB9dUcw==
X-Received: by 2002:a05:6a21:398f:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1e1cebb7f15mr3582956637.30.1733987099042;
        Wed, 11 Dec 2024 23:04:59 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:58 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 6/7] cpufreq: apple-soc: Set fallback transition latency to APPLE_DVFS_TRANSITION_TIMEOUT
Date: Thu, 12 Dec 2024 15:03:05 +0800
Message-ID: <20241212070344.3858-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230459_671694_0F00C5C3 
X-CRM114-Status: GOOD (  13.58  )
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

The driver already assumes transitions will not take longer than
APPLE_DVFS_TRANSITION_TIMEOUT in apple_soc_cpufreq_set_target(), so it
makes little sense to set CPUFREQ_ETERNAL as the transition latency
when the transistion latency is not given by the opp-table.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 94e57f055a5f..c9f31a3653e2 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -291,7 +291,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 
 	transition_latency = dev_pm_opp_get_max_transition_latency(cpu_dev);
 	if (!transition_latency)
-		transition_latency = CPUFREQ_ETERNAL;
+		transition_latency = APPLE_DVFS_TRANSITION_TIMEOUT * 1000;
 
 	policy->cpuinfo.transition_latency = transition_latency;
 	policy->dvfs_possible_from_any_cpu = true;
-- 
2.47.1


