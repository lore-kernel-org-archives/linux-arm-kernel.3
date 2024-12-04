Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383B4E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifppD8XOVrlj0Y18bnChdCi7ngFpMAIfTyMrOgFm5Gc=; b=Vjfgkt9oKn9kMD12tij17Ns1dC
	uiEJ+OsGKKYYOtgOwRlwho8Fd5IG9aFoysfDWee3neX+c2kKsZLk3hqK3euByN6BMZMR2oDBKGi5l
	yy590Yd9GG+Du/7auqnP3B2n3CRWdMPpBiAcmSExeemKtDIE92F6mjVQnL6ojhD2Nyr6X3WAvUM1S
	Xqy57SN/retXLgWFqhvz6T6kgNADqpU4fa75cJjwzWZ6KKRkPebj8ws88nm0LeeEgttW8qJEoQUQW
	PFXDMRCV52vjOeNqq5GePulT8aMtC9/EPr49s6cOuPEYyaoYWaJX5iYISdVocyljJUjvGAeeIgZC5
	2hNuJFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIutF-0000000DesU-3vLk;
	Wed, 04 Dec 2024 19:18:25 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupG-0000000Ddg2-1qMu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:19 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-5f1ee87f67aso136491eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339657; x=1733944457; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifppD8XOVrlj0Y18bnChdCi7ngFpMAIfTyMrOgFm5Gc=;
        b=1A7tH3iuBJsZNVd1cV4yyt5AAmFXwvTbTsvUYwTXWeiU97B+6p+zZS/L7q55oZQ2c7
         hqRAJ7t6PbbVB56kZ3UeAL1zPXBzNnw84k1qD1TFBuzp0wKvAl/niEcwH/lGTjvVdHHv
         bk6asrYky+UDLzJO6v79Tba9aYjnWzpbD3D6l9epLOfkwuDlmxBURoXO8X9SVb6nQ7Rx
         PMC7shoOnTVYO9GAl5Wc4YeIGCdeccLOy29KxpEiqDYjrZN22MBRYYc1OSjoxvSrAGAE
         qh5nAzPTyEMcUf6R3igeBrm+0wvNl75C0ZPfRzXtR1c+PKuDRJs3AZjTiZ26LrZNgg87
         WHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339657; x=1733944457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifppD8XOVrlj0Y18bnChdCi7ngFpMAIfTyMrOgFm5Gc=;
        b=T5yW14Sw3HV1snmcZQMMmKCZWs0mm0u+QQgxIPbFMfIkcoFE2R1NDcISoZw3mK00F2
         0byfRRpCY3OF3otB+D4YpEK0ho9jSSL9CHSlDPl35Zuc4MtRkOiHtIFds0LxC2+QfVOE
         bNl14QmyQtJWckJdB3ar5F6MQccdOgm9IkZXN86Xz5UoTFwfRiyy3DXb28vHbXbxk0td
         V/AfkKPbyTWAs3QaD88wjoQDMYkQw5qsgPEROnPT1dSpAARxF9qXar4/tc94m/C2Y0k2
         stBuHW1DNyVCJgh7dRimmchWF8ffWHw2g5lekGR3Y5zwuS6xbPVYmQ+osiGZMN2zpyWZ
         yx8w==
X-Forwarded-Encrypted: i=1; AJvYcCU3EX98mmUbNe19bKWRX5hzFAdTblhsZDmcNe1LpcocMB4+FHMOMFOljYKcfLNfdupDeoV8vYPAi+GR1BntDqNC@lists.infradead.org
X-Gm-Message-State: AOJu0YwgNxBWk6f3hoKOkKmUZpj1zf0xCONiMf1Wu3PFV8sk0nlflD1l
	QD1C0kkrpyU0ltwPCey5ttLMR3HbPMnfR6KtWedOVZI5k6TTILUBhCdUz24gKgyhc7y8zGliWP0
	nKELxrY2jflKZFac3Zg==
X-Google-Smtp-Source: AGHT+IGqVM1yUneXF0DiEvK0H0RPVa3NLvh9Vv5/V4X8bp9PJGOl+SW8n3O2HwvzvAHA/QzfxuBonL+2sIMiSocO
X-Received: from uaf26.prod.google.com ([2002:a05:6130:6d1a:b0:850:15b2:33d7])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6359:230b:b0:1c3:94:8ffa with SMTP id e5c5f4694b2df-1caeabc2133mr709229655d.22.1733339656984;
 Wed, 04 Dec 2024 11:14:16 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:37 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-3-jthoughton@google.com>
Subject: [PATCH v1 02/13] KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111418_472634_B9CF511B 
X-CRM114-Status: GOOD (  10.43  )
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

This flag is used for vCPU memory faults caused by KVM Userfault; i.e.,
the bit in `userfault_bitmap` corresponding to the faulting gfn was set.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 94be7e8b46a4..641a2e580441 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -444,6 +444,7 @@ struct kvm_run {
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
 #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+#define KVM_MEMORY_EXIT_FLAG_USERFAULT	(1ULL << 4)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
-- 
2.47.0.338.g60cca15819-goog


