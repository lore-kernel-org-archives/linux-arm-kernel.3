Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C67CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=; b=s/4MV4HgHG+sBRj4KMU6u6Qqal
	QST28ma9MvtWoB3+Dty10hZ/5Mfu5bh6/fvdRujXJsD753b/A3qvAgiPXevs+mXB5U6jXyFmAV0fU
	+a8GcJH10siWGQ9PqGveI6KpWnSJ2SOks8H0F/2kus/I8tBRblu2W8XwPNRi+gG4eOwg3510N3KgA
	dRkRezYGLMYlKc9lRzE6mFxRV0/wKo+X/oE3aTTcEpSaDy0eenNXJLKAsrhuY+plDS1kcxtFTfiMW
	509baPoEFqKVTvnUw10ZXVdPvmbcRzECAkmmaH0O47SPzptQ/hgwgkD39KEoy9gYvyMstkx/q5JUH
	ugCies3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rm-00000008fKV-1fZF;
	Wed, 12 Nov 2025 11:18:22 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rd-00000008fG3-06Px
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:18:21 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-bc0e89640b9so270335a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946292; x=1763551092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=I4BVN7d6SwciGW1qzVNYtaKyTvoOE0HabTvc6el0oyo8W/1/Kgd3rXLOqYQlSr6zHq
         tbQvUYG8MXHoEnFDWtqCxlUi+YRoY/pFWVEY8hSapN2Kkptcy2lqYOx6nw2JjFWRwdPE
         UCSwxLz4SokvT6aVyRuqtTHYOFuBKj4xGID7NbeDaiYGWachV0csLrYby6/xeVSLpAJ5
         MXEG7Ygr1qCXlXA9h11j+eoo5H+7cu31BYL+uLemFIHg/Ke3RM4htnVyaGnr4j5cN+Dp
         29Ibn9CmnQD52PECvd9ho2iJgHc5i8z5Gf2+ZPYeXUlowD4fdw3PdAWOTBXbz2o0cNwU
         EhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946292; x=1763551092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=csIpDoOELQGcJ3Kr3GhjQ4LDFtAu6VrssSRMmX/SRhY5IhzqrEoxM6IOfZsVXAJ9vF
         UiYeCeG/3cgNiP7n/O/jYLcp1NCgk1cuwAuSFia7tDFpt7rHBrR5f6ujJpWvNBiH9gHg
         S4xYoziIU+1JpOaG80LthyT6TdvareK7qKjVxH8ztNhznVig1YBODl57QwTSc7ux6Ij4
         HfTD7PlT6QYqBMYOUB8VqdiEkJSl/CQ26zHggxAOE6LB069BVIUHdFokxSjc6mExVsyw
         icwzsRPlLKdWZvg8cYwE7zPDSdK4AfDtGI1LSrgqXu5FjZWeUx/1twPNJfb8grZ/N4DE
         Tafw==
X-Forwarded-Encrypted: i=1; AJvYcCVio7MUyKhtTnfHIypr7pAROEWH3QPSIHT+i4m14TtdLZtff/h64XQmhYoXvm+BnRWYu0fTDDavXDkkm/1orCAh@lists.infradead.org
X-Gm-Message-State: AOJu0YzQkcszcbWWGxOipksesPGjIDjXffTzT+LCKn4COSQg2bRgZxO0
	o7pyssWMK7mavVQa1fkQQFOd5+YtCnpw40r/EW6VUyA4wU3qHep9UJU9
X-Gm-Gg: ASbGncspVpcKl7HJG8G9Af75rdsKJBl3L+3cuzz9okDa8uaiZPzErzRugXGYiVum2gr
	9n+pmIKSSHvK74FoSdgQnRLOdaBteC0QC3umyeztIGhLHC7cdgEHMVjWkw7l+9KS1/S3lc2MuPV
	zQTTyaVAYkolESO4hxJ+7uZAv5h3AyvGlnmYEzAyI63jkCP49godkFj/I5Y3S+DgHLn8otHVcQB
	+5tNDtixQWm+37S9TjtQkI7aZ6s3zDBBHooZWVEeIS/VViEdpYvtsGRg/XNS/SM6/xqGYaUTAE0
	+AUGJHKrc7cIqh/ounENOOQZKdQa1v5gpl4TiebGe2bRienecRlLAk+ZnzGjJguiGO1+8ZhZyc2
	Zf9JmnG0YKgGq3bbn1qpPQUdPUzLdruIglhMA6/K+gtKR6ieUla6ypuKjP6Nr1nTBlxeEUM5Sc0
	mcDc9nnqOd/h0i+1k3uERr2e1JfypSOuIODo4ioES7KTnkiC8+FAubTNSCL5KGAmhRFo6Juo9Wi
	js0JdQtSL+dvO5MmVX38twYcyXE8ZanazhEhx3DewhzQ4zk+M5SJrs=
X-Google-Smtp-Source: AGHT+IELfcxDjkTjHjE9o1zeO9QJOYdqpFiv0rmTaYc64N3Xo1j3VaCkx7ujy498PmB8+3B+SyLiqw==
X-Received: by 2002:a17:902:e948:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-2984ee01fb9mr30708195ad.42.1762946292125;
        Wed, 12 Nov 2025 03:18:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:11 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:51 +1000
Subject: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6q93RqE2TlCEUP2NwG3riu6HujLsBQ7xoREhizw4YE8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUejzpjy/vkkvernsg0f1VocNBsYcmoPfGGcYNvqp
 94524SxYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNXqRgz//d6GbizPvxkYE//8vkPl+4R5pvWLTsfJFmx87tjWwd0lx8jQpZzsKay
 ZNaeq6ohQs4Oau4P32Xf26tccFrxZZXi3cwY7AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031813_071687_0089A53A 
X-CRM114-Status: GOOD (  10.63  )
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

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.2


