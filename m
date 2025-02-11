Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC6BC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZoQgH8y9XMOLCDCfjmngqj84Bs20C5H4G6N3AWreEs4=; b=3RkSdDUaoPwSvG51NuOFVOQGSL
	KUBBDbNkpRUz6CdWhigFi9DwtnGtj/8j8MjAmZG1MjZDzLdgL995AjeSycjeHBOmFS+QKAkRhKBZg
	4PmTohXbO9jI5wk7T7PcF6wBYWV29RoNZrwZYxZXA+ggihpi4zsMMtTrdIgWiC2buVx5TPcNAxjtu
	q89jJf5NH6N6pHsW+TbL4QuV01MTT3aSA5YhybdVhcAPXqCJgzRNi2M6PkXnuFyPjn+xifWDVSdTN
	pabmvq6tBY3bfhaohPEd09ABVBWhv+39kYA3RyLfcGnRpHbvSyk1X8J2ET0PUdUMoYNrRBmVrRuI9
	a7ktfOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrWM-00000004Aux-3C6x;
	Tue, 11 Feb 2025 14:45:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrQ1-000000049Yh-0WPI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739284760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZoQgH8y9XMOLCDCfjmngqj84Bs20C5H4G6N3AWreEs4=;
	b=KKYHvmEWBMphh6SlIyz3eIRLLrPhK15RnG1CP2U5LJcRiAZIJRMtvIQOXoB9Ehqn+fXwXz
	ZTI9llFhcFWpMUyPqeLd7NgPQiMmXVbVjwb/7MqwnGuz29wY5LCiSS3G1WFqMI3FbQg0l+
	t/Mo+5l/nfwADxMw05wTwxUw6OOQbdU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-6q2kq-qPONWrN97P-zOulQ-1; Tue, 11 Feb 2025 09:39:14 -0500
X-MC-Unique: 6q2kq-qPONWrN97P-zOulQ-1
X-Mimecast-MFC-AGG-ID: 6q2kq-qPONWrN97P-zOulQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dca55788eso2450451f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 06:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284753; x=1739889553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoQgH8y9XMOLCDCfjmngqj84Bs20C5H4G6N3AWreEs4=;
        b=G36K3tbyCIXk+/ds8ommZBNW76yPDcuRvnY4A32+ZavCqs0OL2CVUW5UmK5AqKpoCU
         o6tXDZ3snE+lRFg7zag1cRL8t5CBV2+FJ5/lXIH2d9iLY8D07ou5r9wVK/jE8kb1auxb
         BYolBoai2JgJfGZJWjJwbcvhnkh2W1CO/ZnZwAJa6MH5rGA86OVuTlJ5vK75F5ecg7J1
         /rbWIxVhCQlNHmBfqwG+G/TzvPT/ccYsKdCgndIt2j7NIyOkZHMVlYUSrAQlmzR4dDmO
         IY1bPA8Fmioyrg2K2vABgmahECERIYDLZ1VXNz2WoILXBY8oGCkQj8bzhIV4+OIExcN5
         2tTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPBIV2UBt8FXpSO/JIGj/KMSO5rxNuMAbmLf8DThLqS1dvcfeX7yp4UAqQPE4HDDfCD2ILefoqDe5SdEvzQOpG@lists.infradead.org
X-Gm-Message-State: AOJu0YwPccsIziXuDFVvWYgOVF/LgzIAdKXHc5F9QvcJbaNx2jdRIt3J
	4XvWuMBUmN5f/ahPhmMJ+AW6Db8X18AwFXogYaw9CEFW0uvIn4qR50Oi6tjB4ATZd4fQzLURAT+
	uU6Hl1AksIVHfsvUJK3G1fa4bzKOJZ+n5PDSmiRaZLvPorONY4X2KgRuhMyeTmTEcbZwKzcIh
X-Gm-Gg: ASbGnctdYtVF8WQeN+wKkltAkZkgW1tIVArOEllXZfn1AdWqYEX05ypXw14l+vWWD0m
	MEbm/N2VXgrj4Oiy3TnNcex2FYRy8ew5VSvynJ7MIHiqR0U8QRpMl2GomWVJDI3bVE76rwjUpxn
	4rvv7CCmwKAitHvSq7xJYeFI9qCPRpDL9sICiGjdUpxYMLK2mpzqJLvQlocG2u0WDqjhGc1SJ1K
	PfyGMvzffwpjyyOXTvqGSqHZLDVSgBZjkNcFxPO1XiZrhfqqt3Cl6O2qF4MevtbKKbBOHplVCjb
	UVoLuecX0mGw3u8pOP1s5ZnpsEqSvfElkWSqEnelHuTlcmIKssNT/ToUFoLwVqn1wlw=
X-Received: by 2002:a5d:6c65:0:b0:38d:e21e:13c6 with SMTP id ffacd0b85a97d-38de21e15bbmr5428380f8f.42.1739284752797;
        Tue, 11 Feb 2025 06:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnmCgl2Neh2gVGj5aqOcVFIT+QLH9P2T4wOLD+vmwJJ0KUgupsifZ5q/dSypBIiLmFb5E3VQ==
X-Received: by 2002:a5d:6c65:0:b0:38d:e21e:13c6 with SMTP id ffacd0b85a97d-38de21e15bbmr5428350f8f.42.1739284752401;
        Tue, 11 Feb 2025 06:39:12 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm11745833f8f.9.2025.02.11.06.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:39:12 -0800 (PST)
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
Subject: [PATCH v2 0/4] KVM: arm64: writable MIDR/REVIDR
Date: Tue, 11 Feb 2025 15:39:06 +0100
Message-ID: <20250211143910.16775-1-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZdCUqW50gKvJ0nQHRheoXg2H7B1eljVZKWgC1aDp-YE_1739284753
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063921_237086_21FC11E7 
X-CRM114-Status: UNSURE (   8.20  )
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
 arch/arm64/kvm/sys_regs.c                     | 151 ++++++++----------
 .../testing/selftests/kvm/arm64/set_id_regs.c |  32 +++-
 3 files changed, 100 insertions(+), 92 deletions(-)

-- 
2.42.0


