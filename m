Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A1ECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G79AwsSEkP9NYp/OkHMwA+Hki4uOuwUkISdhI+Igu/o=; b=FanbJg0qRRxk9kU7upUSLNN4MF
	ahzFEKTT+AnccaLOaTsf1TcoL4+rpSXQb1uiGYSp2O7pHXnlDqL1endpJsgsieIRov/r9trYQoMC4
	60Vao/eYE7BMkDbtEmO+nRgD/KR0ORRnTInS2JPl/Bs7s2NIFDDg249jgDNtxjg0+F6vv8ORqEFb9
	CNspOwkoMqSRKV509rvYT92pxrSi3yldVBrNajAM0ZVxuy8XJW9lQ1v/UeiLN3CzJ/8UPcXCcte/V
	y0dk3lgm6mM89bPbmqTizvQ1nBzXebPxSpZhTVo4YzT3blgYRRBA7MtaANh4hlILA+XcdfioXvUWo
	2NOmTVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEAb-0000000FEly-0Iqk;
	Wed, 27 Aug 2025 11:18:25 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDbw-0000000F6Ng-1sku;
	Wed, 27 Aug 2025 10:42:37 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7aea37cso878568966b.3;
        Wed, 27 Aug 2025 03:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756291355; x=1756896155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G79AwsSEkP9NYp/OkHMwA+Hki4uOuwUkISdhI+Igu/o=;
        b=BqsAVknaw0+gYTJlCp1PJWbTWo3854l4nGVuL8QFp8uWkuZEzwVeVRkxGtkZ4MPfaD
         VbyTOgiKuDcPHiYXagKgq6+cqgNul/hGBOH2EAKvvr0f71E/Jdk1Hhm1Q/jroC+Q1goG
         +wgOOKdQTOzfyo4gOMbuCyVlV/N2pCWIJ/16ie8nAzxzQaI9esbISxhRgJc6nwkKDp92
         LxWvd41w1Yh6cciNlsc7mtlJ4TRoyaZ1f5IcublcIZqQhp0ZabkdVqnYXZGI2xqTZRjV
         Gpa6QVJkCxFJ/9TD77pKMJX8W9AkU+nEgfT3w/gObKGHWafcCEEg5kXcsrhkIzC/3AnX
         aRTg==
X-Forwarded-Encrypted: i=1; AJvYcCXxddptxUODqEmUB4aMtiGy57xs57uVXumoFOUOMQNVPcsJDN1kQLmxaxC65SQwdeAN/XgYAkCBUQO/ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaHqkchlW/B45o5jU3TTkoS8FHz86lH7uei0hNbWNsvSQQJ/Hq
	K3sm8LeuOwaF//XNd8I3jdLudubuSdNwz8TvOfAcE5yNGBUNyK5oy8Mb
X-Gm-Gg: ASbGncvGlE0qaUa2MmbTCkT/6rWX2/iy1U0L88+U5mhrt0j1YQYBVIovecy9CiSuvXX
	q12v8Qpt0vggkiYP8F02QjVQmwLcLqPNFct7uoM/NAFtQOb2OWJZWhWdILj1nj5Rt13XlCkBrwb
	5Hewy7HYoZHSBeaanr/Cj92VCChwv7W7WyMeLq/Z+5KKkP/KtuYhH2FnAiNkXe+WMqSfvokwAUC
	OvN3Q28IBtcmaqErPKr5RgSxu7wH3kfekOI4pjMJTWGA1TPZ6UTcME7MXGCx2RWXdZbXXvZ8mWo
	IhJ0Niqk7UHlGPIwlwWQOHwuihfOZ4VL0ymvOe7+2n9orU8OS2znqLlS/bXXMbmPXbw7ehDuqNc
	+yFcgwouojkyX6g==
X-Google-Smtp-Source: AGHT+IGCNXjZVRJSHl42HEXN59RSgLMpGNWQpTXxDCqtsTc88Oi0JVJAK4fEp5EBAEbzQTdpR/dOjg==
X-Received: by 2002:a17:906:eecc:b0:afa:1d2c:2dc7 with SMTP id a640c23a62f3a-afe296ec4acmr1912007166b.57.1756291354609;
        Wed, 27 Aug 2025 03:42:34 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:73::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8e77c6aasm519657866b.56.2025.08.27.03.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:42:34 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Wed, 27 Aug 2025 03:42:21 -0700
Subject: [PATCH 1/3] arm64: kexec: Initialize kexec_buf struct in
 load_other_segments()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-kbuf_all-v1-1-1df9882bb01a@debian.org>
References: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
In-Reply-To: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <bhe@redhat.com>, Coiby Xu <coxu@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445; i=leitao@debian.org;
 h=from:subject:message-id; bh=ZtBIdZnCHZQ12LtgRqgW3EI2B93ul2ZH8koIDN46ZQM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoruEXEz5/jNTGfDniMg/ZnAHUi/RMcmE+6R2RF
 hCO9Exf9kWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaK7hFwAKCRA1o5Of/Hh3
 bfYLEACXBlAx2lnDz27xwPzW4zjmn2zElcwunujZrWs1v4Z9od/NKARCH6tvNwN20afKpZ4gIW3
 ySL5qOqXCFGmp8SICmUgtEu27vihwQi5mE912eHGfaowVn6ehUpfu+PzplkMA1smdOaHKHkJElB
 3rTziKVwLCCkKaGmYFL8sw+IHAxJySOHATGacXbu1CE60eGYgDk5d2A+aa8BgAml1iuEuCNP1vY
 Z/6VWe5imGd5Fv1lua0SdlFkQ9vWpntT1gXLqKVUospwxDgz/H7D3hcuiTZm5/ggqr9hvD8+4LB
 7GkcMPs57t1luyhKi3limgE818GFrnBJT3CNwqxIFy3pEUO+hjdtbtGWwwj0oT5pxu2HUCBe+Jl
 pLWp7tIEqg5IMLdERqOPKfcyojA2U6l/qSLx6WX84Pk+AT6jI84silv6NNYzG5XAnJQgvRCvY0x
 SgPs4xSMmkgeztXFOcuGg1jUU0m9VJEELoU9TIUAef07ss+dwSXMRzmNbf/hoRp5LlOCwUgr1KM
 cyI4eLuldyoxD039e+c2KuUsITIwwDgJXtNeqo3vzpJKU127Iu+anDRICtyp4mRZVACnKmo+nFw
 D75fz0VAeYQ4+jVEtiG5Sn2CSzpUejInwoTSc5s38P1brzQ0Lz62qtytjJI+IdB1lmT8vQwx2hQ
 opV5AljUUPp0+hA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_034236_575380_50EF6C42 
X-CRM114-Status: GOOD (  12.95  )
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

The kexec_buf structure was previously declared without initialization.
commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
added a field that is always read but not consistently populated by all
architectures. This un-initialized field will contain garbage.

This is also triggering a UBSAN warning when the uninitialized data was
accessed:

	------------[ cut here ]------------
	UBSAN: invalid-load in ./include/linux/kexec.h:210:10
	load of value 252 is not a valid value for type '_Bool'

Zero-initializing kexec_buf at declaration ensures all fields are
cleanly set, preventing future instances of uninitialized memory being
used.

Signed-off-by: Breno Leitao <leitao@debian.org>
Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
---
 arch/arm64/kernel/machine_kexec_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index af1ca875c52ce..410060ebd86df 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -94,7 +94,7 @@ int load_other_segments(struct kimage *image,
 			char *initrd, unsigned long initrd_len,
 			char *cmdline)
 {
-	struct kexec_buf kbuf;
+	struct kexec_buf kbuf = {};
 	void *dtb = NULL;
 	unsigned long initrd_load_addr = 0, dtb_len,
 		      orig_segments = image->nr_segments;

-- 
2.47.3


