Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB3FC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68IKPCSD45TUbedcch7fsQcHfPv+DE8pLAQ5PoKdxtY=; b=FzzHDrMxmMcuH8b89iEK431X78
	qG+V4rZ1+gwhVa5T4ZkYObLYA0AtMxVjceBt19XM1d5CwUdzHnyjO7eKrVODy1m3YoI6N9Oz+blzF
	PGJDq6zZu+/KyOoSWS0bsWqGuOOAaUzxkQXPfh/GDpQ2EsWglnG7DWw8xoUcJrp5wgUFJSaJMc39q
	9uhZsDXsY/Tn1eFClyetP2hE3u94UI0PrU0fXPEpTKm4IcnV7w/zvWhdXs0CjOl9+sKE5JKzARUv7
	PW7k2lbFyLNAV8N588XPECI4nCtaxuHdfVQGRsItefc1int6Gt5Oz4dt3pOMvhO9oNXqZp6ouCava
	FKZ4LTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZN-0000000BDAI-2ws8;
	Tue, 01 Sep 2026 08:10:13 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JZJ-0000000BD04-3gHv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:10:12 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so29637895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788250207; x=1788855007; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68IKPCSD45TUbedcch7fsQcHfPv+DE8pLAQ5PoKdxtY=;
        b=RpntPAW1FPCfjyMtHsmYOLZ/iaIPAUOGV9PTJ373alVv2PzTjyGPNQ5FSHrT7GeK2u
         oL0JL6jjpqYrjhk63v64KP5/0zrqkP6NQj7L6VR6ckw9pVDk2xzzlFCfdRu1W4dCeDap
         4BCj5CjE24mAF3Bdmxv0xS3+wFYinvmDL9wrI/Cver5OqhsjrmyB9hoINE03KqVsO49R
         yrdRbwSnURMum7VpQNNKsWIKbmPD5Y+A88EddK/xewZMWLFFtiruzY8ZgIbtt5Tu+54G
         GAp7ZHVOFH2NmRPbpwH0wmAs81siL9ZEqH3reF7KPcwIbvmApk6qX7DKz7RfZBe7vt4A
         NheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250207; x=1788855007;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68IKPCSD45TUbedcch7fsQcHfPv+DE8pLAQ5PoKdxtY=;
        b=QxrAe+oGaq/jl46kVkeQ89uZ9d7k/s11dHaeO+DeCto6MJzGUT/hAVW7A2XK2LsKXV
         PgMXXeMRK2F3qEm7D6ebT5TptTgM1zemMA9A/E2RF0w/2vJ0NOiugWEYNf2VmIk5OaRd
         95bhoaXwXIe0EmR5En4b9WuWUEzVB3ef9I5pTYYztQuJKen+V7AAN6WEDe6Br0zoRUbu
         6IUSYEjVcoyPrrcO6qNtRPbhQuwuC4GR2qClTj+HTnuQcpc0qdq4PmMd4bJT0UPInflr
         nolCUDyMXK0WrrnvJQHy5cob7UUNHR+wcrfhD0go0jfg9IAlbjqRZSZQNaI8rptvT1Ne
         LGxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwzPzzqalvfrtcrCff1K/1xsz8ghdDPBfPLSi7/FfwQX7OysV9CdneQKY0XsO8UUSMStyZcYttitvAXe7P7/85@lists.infradead.org
X-Gm-Message-State: AFuF++ntBlMRNu0+0iw3qp1jEwYX3p675/2YJCKzqQ4UlzkEtcf9W90C
	LYHPyf2FSHLDprIE83iiftEFLZtei7Psw015fy4lPsQ+UG8tbGEwF66F14gkWO5lAc+6AVBJqL7
	DPLfVwF17JYtNIxPwZ7i7TA==
X-Received: from wmbf8.prod.google.com ([2002:a05:600c:5948:b0:49c:d385:6ce1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8411:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49cdc405494mr118324005e9.1.1788250207366;
 Tue, 01 Sep 2026 01:10:07 -0700 (PDT)
Date: Tue,  1 Sep 2026 09:09:39 +0100
In-Reply-To: <20260901080941.997769-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260901080941.997769-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901080941.997769-17-vdonnefort@google.com>
Subject: [PATCH v5 16/18] KVM: arm64: Reject hyp trace descriptors with fewer
 CPUs than hyp_nr_cpus
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_011009_930665_7EDD6691 
X-CRM114-Status: UNSURE (   9.15  )
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

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 65be6c9fb379..59349892b1e6 100644
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
2.55.0.897.gb25b4bd76c-goog


