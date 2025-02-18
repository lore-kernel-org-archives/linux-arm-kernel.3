Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A664AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K6IEI5vquogVwrhJmkiNA7kkUfSBC2YjenMZuFUbeAk=; b=0sIZAKXbX5CMCGoLZeRQZWvNST
	BHf7qh/D3VlOFN+u4MWyMbQi4KXecnamHmd+S48GjkiZR097kzL0Sox7FCukOafSBszK8YRbZVsmK
	ATggpbCtJijBA7F1Jcq1FuuPJyfF6ztiW772MhKHsSROaPVNcs9rPqJPtw4fTKbqiV0ULYr9sHiWs
	OHGlYw6yaQocGnRpGGVBYs00uw5AlHqrop94ljhoCCEm4VGUhEfwH0WNYi/w6AoiamM0CfKTYY6ha
	GQzt8ViZ6O4BqoX4nzhga6TYepVMOEKxdalAOi9aJ3u3FuXPfwH56hN2t/5aCkhfs2fPesf746u1A
	5soXGdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQaI-0000000901k-1V3o;
	Tue, 18 Feb 2025 16:36:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQYc-00000008zbN-3ii4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739896489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K6IEI5vquogVwrhJmkiNA7kkUfSBC2YjenMZuFUbeAk=;
	b=QrsqDEz1aKXLzT450Phj1TLTkqruN6W0QBsweaQkFgapWkQY9GMx/K4wRjkJ5Gv5SJJG6H
	KEWPbV3b58ostU+JP952jEMNxICJ1CpES7k61IzSeAMZK8sDDgk89QF8L/HJtBvC7qGHWR
	uoflWHok98PoDFA6TZXPAAQT6nZ78kk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-J-kleC8UO2K_3-xsU3AVTQ-1; Tue, 18 Feb 2025 11:34:46 -0500
X-MC-Unique: J-kleC8UO2K_3-xsU3AVTQ-1
X-Mimecast-MFC-AGG-ID: J-kleC8UO2K_3-xsU3AVTQ_1739896485
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-438da39bb69so49665375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 08:34:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896485; x=1740501285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6IEI5vquogVwrhJmkiNA7kkUfSBC2YjenMZuFUbeAk=;
        b=mbi3O6jQ9LkFYD+/SMC+8p0renCfDEhKK1YbA9CtSgJCG0RXXptRI9Nm5zAOeusHsO
         M95YsSK+W8V/j56xwvKAh4loDNEaeNMvxOe/TkM/91jP4Jd4S+Au4wVv/fxfPbrxjSYG
         FskVXHnMKttWPYSXUrXV2nwUCxm5cRu7A5pVTNP4LO8z6nJYjN1hPUWROaxI1ZEBiW3v
         ZgFmz2BU1AySSl2CLdr5aI1y5MDAOi8Z9h+Do7RD/UDNf36jgxxA6tWX3JT22mT664UF
         grKfAQgcbp5qsUwnkVbKelORfMhi1ozNH2C94jwZR5Z5FdsSaz+8FApljl0rfwXNhQ7k
         mAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw8MS21B8AP+/RmzE7tfwfvoVC0d1YlUFW+eUEDvC5hIp0SY88ejPuw01++tx6QYBxu9etOZEb8RUn5R2YzY5D@lists.infradead.org
X-Gm-Message-State: AOJu0Yxowi3X5Sj5r97MAuTcgBLuhlGfAVPoirjz3XKH7TX/rHHsFZ6/
	v0PFVthBoM0uNSbKBcQCHkQ+spMwI1SeBP8hF9p04GCR2AlkWqVxAtaN73y2cyhnLUbFz1cimaf
	yA8K0i1+HoZGyZ8MHqMwrM/UPhBPbLvhgksMQl9l+fJK3L+9S997FihRWTyM1A4Jclf7aY5X/
X-Gm-Gg: ASbGncvoFYn6uAvTDmMuX3ZynXl7WguMiDsVgZ7nu8g/VVrejikBLOKfpIfdN5MM/La
	SPRZywVTwFYXEsIRIbPukS/BCeJaxWKmWPg2KJloEZKjL0WzgQ+bgw12d4jtG0jeTWdBO1ZtSfj
	uPfiqkiCvg3frdo0D3PlFDW6r5B++F3qhrS6mBhN83JCruLjXMNy2BwTk904A+hP9PKC7oVkM5g
	w/u+3DwjAZ9X1kacnjrdQwVnoQ+paml1PNzm3KsibJMS3qZfArJRWryT7WQv8OImNMKLQFF96CK
	L7aCQP3Z7qPl8MMLMwvU6gAbusE20ZIrBu7SoSDM4ad0iuhElrolFo4i4bwrikRLeC8M
X-Received: by 2002:a05:600c:3b9c:b0:439:967b:46fc with SMTP id 5b1f17b1804b1-43999d8f506mr3283315e9.8.1739896485365;
        Tue, 18 Feb 2025 08:34:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2rMqgMj306LdPnffqreiahb80iBIENo1q+8mjRXF/AC5FQTrmlj/WNJxrORGdnqPcYDinew==
X-Received: by 2002:a05:600c:3b9c:b0:439:967b:46fc with SMTP id 5b1f17b1804b1-43999d8f506mr3283035e9.8.1739896484985;
        Tue, 18 Feb 2025 08:34:44 -0800 (PST)
Received: from rh.redhat.com (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396b5267eesm85091845e9.0.2025.02.18.08.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 08:34:44 -0800 (PST)
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
Subject: [PATCH v3 0/4] KVM: arm64: writable MIDR/REVIDR
Date: Tue, 18 Feb 2025 17:34:39 +0100
Message-ID: <20250218163443.32836-1-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7IqlmmZTcaq1Z51MLkbWxPD9-AjRpqMERUtzeMUqWlU_1739896485
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_083450_993865_7DE74FCB 
X-CRM114-Status: UNSURE (   9.37  )
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

Based on prior discussion [1] this series allows VMMs to change
MIDR/REVIDR to enable migration between machines that differ in
these registers. Since these are used for errata handling the
errata management series [2] is a prerequisite for this one.

changes for V3:
* handle VPIDR_EL2 as part of vcpu ctxt - thanks Oliver!

changes for V2:
* let the guest actually observe the changed MIDR_EL1 value
* extra .set_user function
* added selftest

[1] https://lore.kernel.org/kvmarm/20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com/T/#mb855bc51714095a164a7b26bb8bead1606e4b753
[2] https://lore.kernel.org/kvmarm/20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com/T/

Sebastian Ott (4):
  KVM: arm64: Allow userspace to change MIDR_EL1
  KVM: arm64: Allow userspace to change REVIDR_EL1
  KVM: arm64: Allow userspace to change AIDR_EL1
  KVM: selftests: arm64: Test writes to MIDR,REVIDR,AIDR

 arch/arm64/include/asm/kvm_host.h             |   9 ++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h    |   5 +-
 arch/arm64/kvm/hyp/nvhe/sysreg-sr.c           |  10 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c            |  28 ++--
 arch/arm64/kvm/sys_regs.c                     | 137 +++++++-----------
 .../testing/selftests/kvm/arm64/set_id_regs.c |  32 +++-
 6 files changed, 108 insertions(+), 113 deletions(-)

-- 
2.42.0


