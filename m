Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A3AD49C91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jkAWFuvv+ArDCGSdOQQBmz73cYAuTCEAPe0J1SHf44Y=; b=RVxx1XNyYeitC+nZszfya1Lrm8
	SlSia/vF0Q+Vfr1NsDZMzZnIoaqzZbAMVeMazv9oZx4bsiZSbCLtetAV9k3b2CdUxKmNJ22SSCLV6
	IDC8lp8jFos1ZJmV2yedIGDYfDoQBB08OJEsCNVdVPTCXQ872zatr63luMh19Kt19rbEJ9Wz5aJ0X
	+M6leNFrkzEEMDbGgQCdUk6LXw+dfOtXSlrPfJ3PcBHwbDNSVc+yM5nd7pv4BgDI4dbYMMl3JJe6A
	3+0kn57oRAHbbIutKvP0xOByICGb6tMjeH/Q4wh+BpeBg6WxenFNkVlOYd12y1e8VD2M+yjyvSTY4
	VRkXTLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vll2T-00000001HIx-2Nqu;
	Fri, 30 Jan 2026 09:43:41 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vll2R-00000001HIZ-20SS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 09:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=jkAWFuvv+ArDCGSdOQQBmz73cYAuTCEAPe0J1SHf44Y=; b=TkFTZZJyWe2WVDrtacx55jsTxk
	zdcg1FQUcJLM2dL2DBEjClFfYdyP2W1IBDL+Cabw+WZImmqc4Z7qunpceZdvRnWpQSvzH/lpGHT/C
	FdAQ+vzQg1enEifEf+TDV0LTYVeHgJOCzaliJ+Mc991HZ8DBfZK9pNGjGWjSusA8V5GKpC+CtWFe6
	dYQLf1lXsbvuGAU9VV2FK2XQVGY/EwWfLkD4aorH3nBx4vk9qAoTtUiW+20d9CGQc7NQ0aV8JUZy4
	YHiFqQkwEn5KZoqmVo0e95tFZ19TrOiS8PuW39MW6Yt7zB+N9QLqUl9kH/NswNjaq5rBsb8MHhPoR
	3bNHa4jg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vll2J-001cgK-EL; Fri, 30 Jan 2026 09:43:31 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 30 Jan 2026 01:43:09 -0800
Subject: [PATCH] arm64/gcs: Fix error handling in
 arch_set_shadow_stack_status()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-arm64_cgs-v1-1-c9b6942b6b70@debian.org>
X-B4-Tracking: v=1; b=H4sIAC19fGkC/yXMQQqDMBAF0KsMf20gCRprrlKk2DjqFGpLpi0F8
 e6iLt/mLVDOwopICzL/ROU1I5IrCGnq5pGN9IgEb32wzjemy89Q3tKopmzCxdXWV71jFIR35kH
 +x3VtT+v3/uD02QOs6wYC5bf7bQAAAA==
X-Change-ID: 20260129-arm64_cgs-496817025d1e
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-f4305
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283; i=leitao@debian.org;
 h=from:subject:message-id; bh=eA7mwDVLiBPMB2kYbxKutbeesRnpbG5OSbNE9qojkc8=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpfH0/rRhjZ7Vh0Y39ry5XIxGVsCmjNUcfBQvkz
 oN1AKzufCGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaXx9PwAKCRA1o5Of/Hh3
 bdyMD/9nKJcrMHhm2IpB0sBYiK1IR7u2erqzh7eIIoC3f7m0O6Sqh3Ug8UIOU/tfuqe0IgZpL+1
 vRDla7uvaF06yNJN5MjuM6U//K6kJoRmupxxd643A0GN1IJvm0Auup3Y19gocd32usBc+N0sVqu
 /295dRn9GJSytg+JBcd2+udZQY/8vJnUdrEj/awGuBY0PTxJ9Vy23byCOzIO/twFuyxb88XQrAD
 ysmVXpm2VzzkYa4ZT7v1KpP8pZ33ZxYtzwLWq1kAGbT9v6osj4YjvX1XO7J78NZstWVSPFQPX/w
 N2QTTkdEwoQvVRemGvnba1PZ8NfWSRqBEiiIsTpoxnC/XUUXPndSiZQ9QJbHQwCJ7wkG88NdZKt
 p7l3uZNTG4SHOOKcBRD+Hv4qz04c9AEm0ISOYSvBm7et0CwBUcqfuFVaviK742OG0iOyx7rwDBI
 QlJWCU1DWDwDi7muXQuW7i00YJXsYFeFawe167hUI8y85jcac5S5vcIyY5Z3IrQ5pihodGi1+9k
 68HNmobORUOFxV2okcogtAu0xwzSq1i0h4iLCvtruzGB5hBMVGdF9Tnm1fFTTEfeUyp7QuFZ7if
 2oBjefa3YQJlkaydoE4LHVvQst1R+kSVFXui+kH8dZchBZljvlRiVj7AUkTj1XUFEuxk/yBUCaN
 p5Q8hMqF6cxHx5A==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_014339_550266_31A7A09D 
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

alloc_gcs() returns an error-encoded pointer on failure, which comes
from do_mmap(), not NULL.

The current NULL check fails to detect errors, which could lead to using
an invalid GCS address.

Use IS_ERR_VALUE() to properly detect errors, consistent with the
check in gcs_alloc_thread_stack().

Fixes: b57180c75c7eb ("arm64/gcs: Implement shadow stack prctl() interface")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
PS: This was compiled-tested only, given I unfortunately don't have
a hardware to test on _yet_.
---
 arch/arm64/mm/gcs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 6e93f78de79b1..efce7642b1d7b 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -199,8 +199,8 @@ int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
 
 		size = gcs_size(0);
 		gcs = alloc_gcs(0, size);
-		if (!gcs)
-			return -ENOMEM;
+		if (IS_ERR_VALUE(gcs))
+			return PTR_ERR((void *)gcs);
 
 		task->thread.gcspr_el0 = gcs + size - sizeof(u64);
 		task->thread.gcs_base = gcs;

---
base-commit: 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
change-id: 20260129-arm64_cgs-496817025d1e

Best regards,
--  
Breno Leitao <leitao@debian.org>


