Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023CECA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqp/F5X9LxA0C33JNKoqHu3o/kFJHNN5vqXjhS8yNm8=; b=J9jVvLP3ashu+kwpI5raLhWYWT
	dmCSJuTCITnc+CldUzbqkaKy4bZLUCh82VRmyNfbZTbXaCXF4zZgsjuxGE9nU5cI15lCh06ArJTNh
	sZ+/lGBFfr8Ifu44GjfpBQkl0WmJ4L6llN/Qd+2ydMJ9Qz7sd2zZTYyKFoxTvrBZ1k2y6rP2a3BvC
	66tM01Gu0yiKGmdkYc1UcQPs+x1sp2DzhanwUZ4ZmaE50ETw+thmK4OQt9YmpX6/iF6qI+cJ3NLll
	Hgo+kKzsXeMpnCOiUKKSMi3z4jEfIx5Mst2eiji/QnrqllHH9+xieuJIrTiWjrpOuDfJDKeGvDsFu
	CJD+EH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmp-00000009NbK-01Dk;
	Thu, 01 Oct 2026 14:29:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmk-00000009NUj-0w2Q
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 14:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dqp/F5X9LxA0C33JNKoqHu3o/kFJHNN5vqXjhS8yNm8=; b=hrvCbBx0qxUTSVauPfpupClpCQ
	o6vPiDdQGD4AxlG0CXmb1SRySryx2EHSJja8LeuzHeR5e/Pn+oaGMIFqptxWFqP8bnfYEJLfQqhd1
	w/ihoYssKibSDbpbAFon9N0uaysDOpQT03/LciGbLiQqD0cD5hOCwsGlvmJ+syz5VQZ+x1MZ259GA
	inXAxMMblBfuza9P4ErccuR+WED0YtlZs5gY9plWGjjzm+dFx9/yW/1bHQviAoJ94vivWc90eC4XD
	A2+6g70uB+YtxbLl2KwDrWRR2rm5bM6QO+dB396AHGSmXKghoRtAh5ic4C7ienSJTuoU8bLeeHwiz
	tGujU/ig==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCHmh-000000054kY-1MMn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:21 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a01ba12198so12448665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864957; x=1791469757; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqp/F5X9LxA0C33JNKoqHu3o/kFJHNN5vqXjhS8yNm8=;
        b=tA6M6CRcaQHLLAGtaRJsMBk3ymhQqUTqWakwWYr8DNvzHNX2BKexp89d1Q5bT4G+LA
         3N6xJ3x9dGdpDovUQIlLKD/TfV4GqfK+rDid2Io9h5d6mnvTsS5HYl9At+y65Q6dhbQm
         QZarXOUJCFzmW0b0+KSZSR03WMc5pdUnXLf3IXU5SzhMgNV8zqHTbAx2PL8lRuUx16EI
         RkYqBwgwjqusFLWDjFezd7wm0HnIb/AQRWRGGv2rH59rKzttAXN08xsisNrzRDeRLAmr
         ttcAYNrDQVPJvXQSEkVbKpxRmKgk0kY87W08Zty2v8vJHZN4+R1cmHzRjSEsxPZFm5ej
         x9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864957; x=1791469757;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqp/F5X9LxA0C33JNKoqHu3o/kFJHNN5vqXjhS8yNm8=;
        b=HiPyUf1SX9peUJ95V3E5BLmF+upTUkgPzCQZe8HgD2yUWGxeCJvcrZtdeWlARmbXE3
         MeKBN1py6LK+hEH5+aZ2smopSxooyGaaN+ijgk11OaPUsM+vWQjEHMrfCYgWbYnemXl9
         luc1bEN09U5XH+0tDRej499YJaQlBSJqm8Bt0RwUMsH4wahyaWrCNTRqmzxWnqkIJO1Z
         URkoUUmzA8BgK+rB+ZwcOG3f4rpJeb1jmIkFiHlJ+5Lavr1hsKuiMpZ3fb57xA2SgdM3
         pOqMtvEDMeEsAQUYyTP6Es444ovxD19Aq2Y31/q2omM47/vo2STfBCNnqmATlv5aTKtS
         UCEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwhgx2YqPm8S7U4YXjwWO5KLwS83gaj1oHMx8iyk/0ocdTqdYxcolpey01Y8ODj03/kC9UqhLPOU2Kd6rIJeoy@lists.infradead.org
X-Gm-Message-State: AFuF++m1IgCApsIOIJZIRooaaDJzEiPN6N3tosfIkeFDAXynhninkZh1
	KxakM2GQpTTD8FBr/3bvDESrKGKj29jyEqLft9GAx0Re9ehraaN3NiWCnDPzk5/78TL1EUAxrNr
	IjV6KQYIaYXO2vdq5sXV3+w==
X-Received: from wmmj23.prod.google.com ([2002:a05:600c:4057:b0:4a0:ff:4fee])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:c313:0:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-4a01eb0c24bmr39706405e9.12.1790864956984;
 Thu, 01 Oct 2026 07:29:16 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:47 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-17-vdonnefort@google.com>
Subject: [PATCH v6 16/18] KVM: arm64: Reject hyp trace descriptors with fewer
 CPUs than hyp_nr_cpus
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_152919_496220_A9B83316 
X-CRM114-Status: GOOD (  12.15  )
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/trace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 47680a949f61..e9e584694506 100644
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
2.56.0.rc1.315.gc6ed9934b7-goog


