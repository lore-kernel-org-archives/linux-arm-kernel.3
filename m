Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0873C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BORF2qb/YzOTRyzZ0zTQ3HANIUsxjeDLfDvy6Tmd+Js=; b=MYqry0g267yiGVYcvJBjtAzTsi
	wybwoZpTsEAfztiMlWCYT5GXLiUQV/OKRLVZlR0skx4lc3hheWUiaqKywfkPjS1I3hIQUbvsDM/sV
	A06MwmgYL0AwI/nlmcCnEjeIEYmMpWm1ihzLLKYoTTaTx6YQAK+pZvdwDbHEjzTbGf+wxRiSfiVOA
	niIzdIF9SUFRyNxzPrP3yLNZN20uZbtFTcoUxxFlyDOmuaQSvXndaf6DZ7uqT8hS2xY3rj8My/pF2
	b15uqtmdCzk5FFYEqU6EehjMmkFENkWPUzxXJpuinlDoB+4qQJBdSc1hKhMP07wS5ujmB0qV60gmY
	e+akO7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnX2-0000000DG9e-02UH;
	Mon, 06 Jul 2026 17:55:00 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWl-0000000DFiX-1SCC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:44 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493c526df6bso26469345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360481; x=1783965281; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BORF2qb/YzOTRyzZ0zTQ3HANIUsxjeDLfDvy6Tmd+Js=;
        b=YlAb3inlnDQzAQRa1YsOOIwx0laBiMb5fA6jfaJ4pT7qDMBkS9sUK9LmTL7VNLJ9gL
         HZW9p8IZTd65prHl6WNbY2jRvUr1T/2EEBQYovZ0fnd8rTmk15T1mHAGsJercLQLGzG+
         gcKlZ08oAg0+PBgzoROaLCmWXuGNt1PEpj0Lvo4cHTu9ZC6Cfm+vZWfNxtuoV9WjlsOv
         zqVQSj3DuMOpW04pJVsXC12bG+yzRNDo4j84S0otK6a/nSlPwWnOnM/HXjR3tsHL/Ryr
         x6MmuMXbRJhX7gpebM/+L9j3GZnNOtigciq55t2mnvTm5TizhOEinmK7w++TwK800Kuy
         Vm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360481; x=1783965281;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BORF2qb/YzOTRyzZ0zTQ3HANIUsxjeDLfDvy6Tmd+Js=;
        b=CZ0Q5I1+yhbv5hYrlUHoWryybLbaodRPidsSvFQ0Li44cSnfZJnn+HqaASfZLGVErH
         3Rs3Pb0t0B92KERgV9aTIPG52J+FLXybH+ScJde4YBlPBMzF9D8cTtHf0zj3Nv9oDcqx
         KHoVuPUrTfZB+Xn2wn/grOyyq8lsfmKeRIC5j82cHF8VTAwZrXWA3lYT81Aoqgo4Kym6
         tQmhOB5aO8aTu7b7egfWPst72A2Btkk0+xFitgxgdTwnYrju5MwMpPkccUTOUYqO7y4R
         ihktDvcsltqily4X02iVCbi3ByZwq78BK2ttf2vJD7pPca9HmsUQFH4R/V2OXrMBiuPX
         DC/A==
X-Gm-Message-State: AOJu0YyRfAoQCJ/WcZlNDeikEvJIxWqgfTdk9MBJ4gxyhTBDjNChPnxT
	Z+HcaVMpGNo0eUnPJODOuO/VXIJTsgFtTrPDMsq1kVqSxNlExYYJ3VSi7zSM5KtbRT4t15sEdq4
	rSlCB4Qpxnofh3SaAElLCwA==
X-Received: from wmbb19.prod.google.com ([2002:a05:600c:5893:b0:493:b636:4ee9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6d4d:b0:493:b720:ce11 with SMTP id 5b1f17b1804b1-493df088fddmr14317875e9.31.1783360480767;
 Mon, 06 Jul 2026 10:54:40 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:14 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-18-vdonnefort@google.com>
Subject: [PATCH v2 17/18] KVM: arm64: Reject hyp trace descriptors with fewer
 CPUs than hyp_nr_cpus
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105443_468174_9C0D4B94 
X-CRM114-Status: UNSURE (   8.16  )
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

While a trace descriptor with fewer CPUs than hyp_nr_cpus currently
causes no functional issue, such a configuration is invalid and would
cause the hypervisor to skip ring buffer initialization when allocating
backing pages in EL2.

Enforce nr_cpus == hyp_nr_cpus during trace descriptor validation to
guarantee that every possible CPU has a valid ring buffer descriptor.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index e7e150ab265f..6e716295247a 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -181,6 +181,9 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
 	desc_end = (void *)desc + desc_size;
 	nr_bpages = desc->bpages_backing_size / sizeof(struct simple_buffer_page);
 
+	if (desc->trace_buffer_desc.nr_cpus != hyp_nr_cpus)
+		return false;
+
 	for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc) {
 		/* Can we read nr_page_va? */
 		if ((void *)rb_desc + struct_size(rb_desc, page_va, 0) > desc_end)
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


