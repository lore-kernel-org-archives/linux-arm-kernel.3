Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C31C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=; b=JJER6wcUDWCnqX+HTUo2EdCaIc
	jxTUqinwsf7CUMehfZJObovnPqvszThKrRLnH2orDHuZdnPeDkPOrXpPprvyrqpOrtrMZLyTj+1OJ
	pQgKrikemH/wgigG1MautuH/hDvkMgveh8VIatyzEhZh4l138ZceZ6oBILNcaKFr9xrIVUpNqL+Ab
	BlcDVj5H9HpdIgULglbk5l5HmxKLUHt0mIC0me/nUtPVKb/R5etce2kH1Ic1l+M8QdMh+wG1NTC1V
	W9EFNy2oqO1J348VpM4nZxTFylRm6SuvgHSsQNahlW0kK3c4uwbT3AQYBMI2i1ggQiDrLoXnQHJ9q
	MSxkrhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CsA-000000078xp-3Ckc;
	Tue, 22 Apr 2025 12:37:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Brg-00000006xCf-3jXK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 11:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=; b=GiGTPqjYzNjgT9Y/C70xz+dMR+
	jkov66BxMGl0vgjYHNr84RbVqzK0MuxN2Ruz9SPMcKBNbxW+VBXkka/2C2cDh4dLrppDrIUQuZW1m
	gniIb+nX9X5A1WovgcZClXfOHYF8TbkL5YOl9BGbpbqxloJAv05x+Y5X73hBMY1twDnwPIq/uPtUV
	S0wHD5Y7wgfpE0N1tO38lsev/GbAqtF4WQZw5si06tvmiOV/KGsDvTdAd4tOE08F/GoOykp3jP1Nn
	QQ8vr+a213VLYHSwwrObTPCz5ssa9rHLshDPV6/HzdVPFRBv5IrjkD1aQTkgl/kDOvbmmsxH0Pm/n
	1rPNFIaw==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7Brd-0000000BCN4-3exf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso41588935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321552; x=1745926352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=;
        b=WCbymPUpsYhPHyxb2xJb2jyZWFpoQrYdG+7o+IyxhDyDXSNjqoC14nzZWeZUY3RvrZ
         SOK4YmcXTJz9qjSY7Z4x1J7pwNXSxhbKuyLPHetK+aWoat0BtmJfkuyOYgcSCGp4ih5A
         3DyX6N8LZUjd5iuh+i88Qd1tJ8ws++QHpwzrpR9ZEOIDsW8vvEVTGUrcCq3nJSUmb5NR
         Ct1VR89S5lGZxjKZoinvIKEmciTAgfGwzzLivsZyzGVcvR+4op0WIUkPd7YRkHp9Hn80
         88M8BjUuHqwBMWPrCCzRN5HWU4shw+/EoxMw54lcqoiT8InMeEPt1JhmbzTqcCMyNEb5
         vqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321552; x=1745926352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=;
        b=mnbWk5NKMkTluqc8TCL2V+Rr35us9pNPDMM6WKjah6QzGbWCM0F7cWQa6QYr2kzj7b
         22/OluomAkwd0J/NxCrTgRO056flJoW2Gu/bwcfKZ5IWxmTjIK4RTeYrI9DbmQUbVDB8
         LKbgXk/d0+7iJF6e7FaOmD2LpJ2apWdAGKWi9/jjEnOr1QvRrB88lfEbep/GCWVPfr40
         AzX+fdsUL6kIg6PEySkiHfLPnle67nrQxP+O9t/Hdt/GRkHFKHOj/fHTsT0O5LB1o1Ow
         3rZsii/a8zn1IlNc7Ndm5+UlnbQgSsU4tF+SkoBr9tEDx7r9I6Dn3F4bKd1hcdo9U3w3
         PxAw==
X-Forwarded-Encrypted: i=1; AJvYcCUkHL45E7E3YLP9ko+AobO3LxMT9J0e68TendhbnVTBR3sV0D+5j4o6yKpg2QihJYvJSc50+1YlbqZ6eCdVNtur@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ8lKGwtxkqhQsLGx9cQmQSLy5dRH+KlCxmGtImoPkmbco1iHR
	sT9YO7Zt/metbhtPqqbb4UOXjoLOOqjbHfBLV8AWJw5USJc1L1DXHXi2eMrcNzQ=
X-Gm-Gg: ASbGnctBs8hnt3Rqlk+nJypkkmfOytV1vSjZsL9eo9siPzfgLNx6ArvFhe+AMsVPqfn
	CoSkcfhCwg04xy0kBbOz9jswz94jGQSDQkMg4owr9LKBqfFGIodkED6Y/FgcYrFXyD3fAoNItp1
	mlG7A41B8Kp4rkYV7mmd3shX6lDk9yZwflcP6Mj7AMdlVXVcB7IeMp4nGug+vEPXJszP3fGcGwu
	BIjgv9FDf5MBeStuzLUlveLbMO1NIkyEkRkzpSylNvTkPkuBKve09MfCcoDCfvvZ3qe/74uZs69
	Ma857k19Q85a+3vsd//1sqrR8SgZDDcdDraViKH39DWK84mvBM4O
X-Google-Smtp-Source: AGHT+IEtVC5/hLkXP7uFg7Zmm5Mq0Mlz2uLSiQFUOQWsm32IsnbnTjBX5PadrzYjNG2TCCeAvltguQ==
X-Received: by 2002:a05:600c:1ca8:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-4406abf94afmr91474835e9.22.1745321551609;
        Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 14/14] kmemdump: coreimage: add sched registration
Date: Tue, 22 Apr 2025 14:31:56 +0300
Message-ID: <20250422113156.575971-15-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_123234_034260_42A5813F 
X-CRM114-Status: UNSURE (   8.30  )
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

Register sched info into kmemdump coreimage

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 7f3b089b5739..2be396ca0495 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -78,6 +78,7 @@ void register_coreinfo(void)
 	kmsg_kmemdump_register();
 	irq_kmemdump_register();
 	panic_kmemdump_register();
+	sched_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0


