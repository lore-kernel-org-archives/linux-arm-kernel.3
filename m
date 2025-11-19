Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D6DCF394B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=; b=iklWrBgKs2BqOoaDPH39durUWC
	/uJna2byCiIWYZu+j0UZW1mo3HR7/dOCLRV/4x6DzJTdXayLURpV54BBjEZdXwnqpPL77w+0Aq34i
	5xdcSF/KnkfVFJAF3twMrxDFqzU9173TYF8UCDwkWugVO2E51vLyOguq/rgj7/RR0NUGBsgYqUoI1
	lWGpp2yoWlo+TL7MnJlcKL9A2j7QhCrZU0QCbDUAahJkcSdUsDOu6SCwSEBYd+D7TC/iZe2QnaGhl
	7lFX9MCmnbSSPou+P04UjPwN+RZ9B3H8DeB32VCYVWBN/5iPv5uwOkfeNG0/4lAmrGgDL22YhMwmt
	Vpmm2HuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNC-00000003W8O-2pfR;
	Wed, 19 Nov 2025 15:45:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkN5-00000003W0v-1qIv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Nov 2025 15:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=; b=pY+fz1J/eFyTgNyb3ibNHj/dIv
	N7SBj0UXkUHKpBDIGcBpV77booj46+T91hHUGxVkHjmNIclT+XRn3LcUSPceiMdygZi2fcGswqtag
	skDvPWvFn9DvP9VVE/JTJO8uoqeXLmLNjjLMzRo9J3BVPhUq651PM/pYmMfd0/4SYqR2AU5JAU38n
	T6YXHtaLkBpiuK1hwggF7AMSA9lQbSf7xMc675HQpJx3+ZBz35nIwDPR86ugRkfhDToUdf6y/TYkU
	P76Cjnev2jFIRraw8lvEe8PDuIFzIqZUfoBrOfkW2LNGlmbORd+/aSaAzq3dGu2lLy8fpSEUMHTDC
	raXrLU0w==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjVO-0000000CYbd-17Oe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:50:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso38459485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567122; x=1764171922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=;
        b=YeXHaWYLjboGJiKQwCLjX6nrwVxSCsM7/TeEOp+gFZGxv0pplwyNNpxj6hXRUwdVY/
         I8nlqE90HHW0nEVSBnomEVYGqSZ7IsrtzcM+IzT6Fn0fhrGvjZJmoEsVYi7aDlCQVBzh
         M8A7b/LNX40uLxSbeOeBcBJ3PT803GOhJP2MTSvW4CLtUyQi3Hdr8uZ2J64yctViPRCD
         QKYBuLeLGVjQMg5ljcSc8NrY9iCjdZ4gnviRmq1+BEo80J63Ry9uvKLgeE5V3RNrbVvw
         T/xRZhkkPq8QbNT0vujq7LnAMmky/ARmX1yRnMkNekP2O40BvN11nI1uEtsMGXPQlV3C
         vP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567122; x=1764171922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0blJpzJVpLViS6yP++1+Q3N2n4IWObMjESar9bHwcO4=;
        b=If0MgxWco0ItCpAE+FC1DUz50sqtkUtvXwf71LQSRlGIjfVocle0mS5opCGCfQbqQI
         BmCg6Joc5aNTfib4GF+f7w7yL6RbZ3XhkYTsV23l4srLVx7XlFYVQWxkucflUSXkwSII
         YQ+MgpEk63wxo2hJwAebZwkhrZjgdrULWNIZwbJ04pKm20WmCf/rBc1/SARXYyQFuVu1
         uVePVt7mTAb8HAMGVU8+AQ3bgN11zdZkDDoSPIbzC0lPwsr6eTjdJ/xilMuQfJajR1qo
         QfW3FGmKIW+Lw/sfyOKzHJVgOD7Qi+J6SdTH6Xd1bT/8zPWFPs4I9HfE0yfGViJj3MBd
         NhFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd7q1a78sWQAE6LCFSZmCiy1DEYwplxPw5yZZsEFRhpV7+NOvNZ9l5qRIB91/Jy4N47/oorFheVh2+TmFoa9gG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5HKxwv8omhoseowbCyxkQiXCRwwLemDKqbhbEMMxAkXnZ+GX9
	eVP7ziAM98iATCQ2YbKC3aDFDJCGR6y0085jwiMqSwKzOKKYTG9gFV0NStVF9QYmsjY=
X-Gm-Gg: ASbGncuMlBc+4vuP8ahUhj4RrcAPhxwnrd1T5krkOJfV4ctSUdLUm4prmXP8n8LmYvi
	5wVawns0Kym0+QvVb/vWEhoWxiilY3Ll/MOmYuzJeFtKa9CSNow7p7lOyS5SLNJUKMw2EomUtHa
	ap3Ecy499nfF5hnUC/OKTXLzyxIhXeGa5wipjzCblypN+I6SPKBpTgN/6pLBCGkoGzCNNnqPrx7
	JnE7UUeYrnriq4SP9w6XK9EehBRPiF8HI2WLeGQPfpWqI/+7TpYuz32cSiHYrhYRg+Cfax0ZsA/
	o0YFdR+dZ99F0YkXVLYpLEonmqLBG9QwjDPWprlCJceRmSh7/KkLEjTN0lDZWImz8DYL4plZg3g
	O3XA/N4d+0l0FdHzLsYnhRRDiLXCdtjnBJ7mP+bzU+OsKeKrhMYA0Yt33/5x8PXBXLNaQrsKFWE
	f+jX3ici5xfMliu6ZqwKs=
X-Google-Smtp-Source: AGHT+IEf0A8SfCPAIU5Y+01ECXL2jbadglpozgNAZPe+3fJhQYPBk8r7h45IbtadEb3Wt583O3k4NA==
X-Received: by 2002:a05:600c:3587:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-4778fe522f3mr209598755e9.5.1763567121930;
        Wed, 19 Nov 2025 07:45:21 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:21 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 03/26] mm/percpu: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:04 +0200
Message-ID: <20251119154427.1033475-4-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_144959_419556_9D33F948 
X-CRM114-Status: GOOD (  10.10  )
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

Annotate vital static information into meminspect:
 - __per_cpu_offset

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/percpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index 81462ce5866e..cdc5b30f6a99 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/meminspect.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3346,6 +3347,7 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *
-- 
2.43.0


