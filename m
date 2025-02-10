Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AD7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLF8Cf/xB+6V3hagRkehtOvA3nhCvcxfhJ41oAzlRW8=; b=2o2NRD/KVxxTbxeE94kfVq5t8H
	nQtIPQYKCMHpQhZBSHxmUnw1xoGh14jlR83Qcyf6EWt5lWdkMYJSPVyAI4TZ1QXWkA6t/B9S96GD/
	DhwyKyttDF9DuuEG2kbhDjuXh0pcANS08HwTs2nA+AqpN2d0ic+cTiWxkE3nbsxji7UhUVLnZX42C
	w3Xv7pLRaj7+KEAGNTkWeyNmpAhLa56GeFOo11wXX36O1dro000rQtFaORcAvsQZnUph7OKao/O3K
	dNhCP9cMWEv2Mc8MRQFfDoUrOmRgl9sgi0kA76pfDNr1SxhZhDcvQcbmdC1ONUfXu2JeVCrh9UxB3
	dvAWfTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thW8u-00000000OWz-1zQR;
	Mon, 10 Feb 2025 15:56:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thW2t-00000000NIi-2LNW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739202602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BLF8Cf/xB+6V3hagRkehtOvA3nhCvcxfhJ41oAzlRW8=;
	b=EJEuodLJmqHABJOlJ51CC/+WNKsk3ulb8Szasi8NvECITCkCoXfLeCANefko8O4YZuKNds
	tD/FfDo19yrQECSnnT4CCl4039KQKnxE3Z0+Lsnut0TOLyipQopnv5d1KlA7/QjVKcE9cn
	CbXfTEkCeVZOfiUuJ484lLYCK6+IopI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-Dt769quzOpOcs2Y-8AyoFw-1; Mon, 10 Feb 2025 10:50:01 -0500
X-MC-Unique: Dt769quzOpOcs2Y-8AyoFw-1
X-Mimecast-MFC-AGG-ID: Dt769quzOpOcs2Y-8AyoFw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43935bcec0aso15331815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 07:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202600; x=1739807400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLF8Cf/xB+6V3hagRkehtOvA3nhCvcxfhJ41oAzlRW8=;
        b=gGutUjj+91BEsYkS1xxn7TfXU5TzL4XJRtGRfIAhkGjF8I6uco+HzlbB3mX1Bq9DHl
         hIeiGt7AU9Pk4VBVA9gtWCwx/nF0P60TuRv86UlGPuN5KXYmv5IKrvnO1p3QdA1gycxn
         xexs+aJVQoT57xhYfft7z0BHd16TCvqO2VCgqf1c4mtz1qLDZ34oDNVxjT8oa8vo/jWY
         T6UePH1a9MaK8gBzKJ5nRTXRX1nrIvCi3K5+gmgjTtkaDYqM49ivnbk2X1zAhc6ZX+vG
         fxwBCA4u8JT3v0cVG2ne80lDHQTt1FiBOms8L+y6EgqnrGm1bG8oOoPbvsYFHhiZ8DE7
         Oh3g==
X-Forwarded-Encrypted: i=1; AJvYcCV2DQu/W/smZT5t/BzYSgwS0+CY/eX+Vjk7YSlB3aTvm3PsZpy4FehKLZE7HS687oRAjjWnm+bwbMnHYIAdO9xN@lists.infradead.org
X-Gm-Message-State: AOJu0YwOm9mbWAa/B3SjZsGTeYdr55r6Z8Tla9GsAqzInoNM4bdvEmaL
	9+1xkukFwM0+7f22mfN3VCPZjOEuDKCyvEnEM7b4A5nXRWust7wZg1+r+Ae4QpLqkxcWg+t7Yy+
	rknYn/Mn0VEMcPD8mYN0RiNQSplvRKS1AGYBEd4IMGSEWvFDMgwi4dabjxHptIzFl5gKyOuxx
X-Gm-Gg: ASbGncuAjcDsuI0KAWTjOTE0wXrD1LVuzMdUzG1QZiPhOiY46SjG/cF0IiNjdmOO8wc
	ehoEpvvn8eS0Ur3cbnp98t8xOkmCxZZ1rndOl+WIujRMvAP2USmYotVeIMRCD23kNR64/pdYWNS
	OO8ji0yNe0c3fmHQICJL3MuvzRznR1kD3jUMtHkvb4RpkMFfI9ahmZJr11zh7WPn24Sl0xxjAOs
	3FbL0yQn+6ye8VLE7DGI+IwHSKHNAs0phmToUwNQxl2Er02CwPtv2Ze/M/0OBJ5UU/ucDWElatp
	2vGyDACDWSz6sOI/54xd6v98i53w6zILzPwOPujfvV2Lu/MxFozkYIzazhV+h5GBh+U=
X-Received: by 2002:a05:600c:3d06:b0:436:2238:97f6 with SMTP id 5b1f17b1804b1-4392f1b8e78mr67201615e9.1.1739202600499;
        Mon, 10 Feb 2025 07:50:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHO3zxKwhpNf5G9RIMWhyWsZJwinpmx8lRLWXcdVcXxH5R1Bp8BJUV0bb9Jd4M71qBY3iU3wQ==
X-Received: by 2002:a05:600c:3d06:b0:436:2238:97f6 with SMTP id 5b1f17b1804b1-4392f1b8e78mr67201305e9.1.1739202600117;
        Mon, 10 Feb 2025 07:50:00 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96502sm153559395e9.1.2025.02.10.07.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:49:59 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] KVM: arm64: trap guest access for REVIDR_EL1 and AIDR_EL1
Date: Mon, 10 Feb 2025 16:49:53 +0100
Message-ID: <20250210154953.27002-5-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210154953.27002-1-sebott@redhat.com>
References: <20250210154953.27002-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: whyJg7974VYzqS4eZ-Rfgv3uXCMjDHUksniqvbE3M9Q_1739202600
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_075003_665395_8071B57D 
X-CRM114-Status: GOOD (  10.51  )
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

Setup a trap for guest access of REVIDR_EL1 and AIDR_EL1 when
the VMs value differs from hardware.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/kvm/sys_regs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 7d588fedb50a..2918872e3d2a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4910,6 +4910,10 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
+	if ((kvm_read_vm_id_reg(kvm, SYS_REVIDR_EL1) != read_sysreg(REVIDR_EL1)) ||
+	    (kvm_read_vm_id_reg(kvm, SYS_AIDR_EL1) != read_sysreg(AIDR_EL1)))
+		vcpu->arch.hcr_el2 |= HCR_TID1;
+
 	if (vcpu_el1_is_32bit(vcpu))
 		vcpu->arch.hcr_el2 &= ~HCR_RW;
 
-- 
2.42.0


