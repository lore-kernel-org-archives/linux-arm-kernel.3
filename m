Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32134C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6EjHBZibILbBUp2qJIWYHcXS7kn/hLDSQS+TJg877Y=; b=DpzhlXbVVTe9rQm4FoZxR+gQVO
	IgBIthFfdKE+U+MyyKq3RXqyL0w+PSzx6gopYyxonUUQtCSq1uAdln3sFLaZw3hzEfGW5v5oARiva
	i6kc6mkn/1E1YQN9mpCLTdxn8K40zn+gmE/9ms8a4STdc7cJsf3dsHGdQ3NsTQd28OOeYYMyShNnl
	tvdgghUSuiO+58Ui8KRvheM/lySy70Vx/4pjBMSL1ogaNipvGJWLGxmczMM3XK8ezt8c3FrD+Ah5G
	1I9QG7YNNNeJagu62TUkvkDH9T4V9Tt/81G4JWiRWrf+x/HzbMjv9fzu+upcmDKjABvTcEQMk501u
	0HLFFM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrR-00000007r9j-01iV;
	Thu, 24 Jul 2025 15:27:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR1-00000007eoR-0nVa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso7182155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365394; x=1753970194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6EjHBZibILbBUp2qJIWYHcXS7kn/hLDSQS+TJg877Y=;
        b=dVdpxfZmIgnVJmp6+hPJGr8DYb91kqyL1z4IJn1gszJSkIcXjgpXnwXAyT0PgGEQk0
         ahNQ3jgkxN4d5dx0DvM2jZXfJgn9/JihvVpZPKtymhxfGS0WriqzOQqU4S9OkkgZMSpd
         DoEP18O9yj3tig5Ha3ya5Nk06/PqvczGdw61QNT++80aB/4sNoZhgBa6HdK9phY+ihwR
         yKMe+mQlfW6IgM00PKLPOB2cMyGf3S+oOBfh+QYYaTx0ICy//OTMUFu/mwnAL9dmnVHh
         UYe+Q3NO9QNIKrApvBKxsatnS1SPMaiwZeSo2mM9vEMYB3C8OJISKnHpu5BHQd3a8oip
         gMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365394; x=1753970194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6EjHBZibILbBUp2qJIWYHcXS7kn/hLDSQS+TJg877Y=;
        b=U8DEQSf5cQJambAEAmPDOfShTKUbvLb9AMk6wgf0YwmT2FqxBj/6EeQv/7oo77c3Lt
         jOGJrAD9bxWU79SdydbhhqRvfwTzpQ7vHnNDHq4piSZ5jqmxpTut2WHulrX8mtdzgQG7
         72qZ1LleyxWY/CN+nHCqa9lNj+AxLuKFPQw/mJC3LDrAr3VOQDBelZwbP+2f1GknXv6P
         Zizn7u0y2H30+jXDfIXEVj+Vd9A0pmMKnrk5K/i9FnSfk3FQvQGnmrqkinzgIXaC7Xvl
         +aYuhuzyb7ikA2lZTCiXy8412Kac13U1+ajQiV4kt7Fj421xAviizkcgop9YaW4sEVQD
         sjQw==
X-Gm-Message-State: AOJu0YzEevsDAvOTmfVETAp8vGrARHJI+16q1S/k5DOOJf3msaQtmqjs
	P7cQmboHzSaFhGeJWb3wzdwTFypQzLJhSRomO92SZaoZxLxDZGdSScf57OmBnSFyj80=
X-Gm-Gg: ASbGncu4JcZjSn4lvBOZZLNR9lMGdQi8/dJ1sRX8wI1+R9bOPntFe2uqTfu8WROJnOx
	bHCJQnj6ZYJ7QFXqgc9BB4lW2RJoIzBzLfX0FiT3fFRTvzTyl1ukz4mIEJfHQf/8qAytOMYggLO
	nUwjpuFzutbyWUL7nyH9p6F+Ed0g/+zxs1rDW0MuSDGWutC6ezCAS/47prDWUhE6yEUCQFKnEPf
	tp1jPUroMf2TOJs1q3NdGNTanZfgECcBTJLP9ULO+xoX5sFdobygJN/qNnIf/8Ma4xDODLJnDju
	E/dbPzJm7Ma3uIG2m6HxG8EPzHh3qdN6ejnt0f1///a9wqjAtNF0b4cDfotECx+7e2zzb8+CZ9K
	psHp1z/Gdvv3xvpsA9wr9RxXbkN7t7opGGOSjfqim5RW/5u2sfijnwuo2pYOT0CHoQb80Zh/gWq
	z3Q0PU80AiYFb6
X-Google-Smtp-Source: AGHT+IGRlGdpZ28v11nrKuEy26SoaDmKeIQI1w12F1VyMMK6OUtkgi6ZkZkyO989nTl8PB59Q+K5gg==
X-Received: by 2002:a05:6000:290e:b0:3a6:d7ec:c701 with SMTP id ffacd0b85a97d-3b768f1ab39mr5321094f8f.30.1753365393821;
        Thu, 24 Jul 2025 06:56:33 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:33 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 13/29] kernel/fork: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:56 +0300
Message-ID: <20250724135512.518487-14-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065635_225035_ACC054B9 
X-CRM114-Status: GOOD (  10.06  )
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

Annotate vital static information into kmemdump:
 - nr_threads

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/fork.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index edc6579f736b..ae8ae9b9180b 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -105,6 +105,7 @@
 #include <uapi/linux/pidfd.h>
 #include <linux/pidfs.h>
 #include <linux/tick.h>
+#include <linux/kmemdump.h>
 
 #include <asm/pgalloc.h>
 #include <linux/uaccess.h>
@@ -137,6 +138,7 @@
  */
 unsigned long total_forks;	/* Handle normal Linux uptimes. */
 int nr_threads;			/* The idle threads do not count.. */
+KMEMDUMP_VAR_CORE(nr_threads, sizeof(nr_threads));
 
 static int max_threads;		/* tunable limit on nr_threads */
 
-- 
2.43.0


