Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A480BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3QaL47zgHLdcs5EkgRrAkLY9U+KKlkChilDN7QnXbQ=; b=evx+u2MasjMF6k6c+lAh83zK4H
	ryj7QCeQ2AoMSjpRiRUPpQLZZJyU6/LMaYdDxqHv2xw1Wuj+Pj2rA6jQdCFX9Ztta0tBUDfdwJ1bR
	KiJcuJk/60PdY6x6RTwu9t1SX3r1IWfDxpsVyxEvCLNqU9SmoxPSG4ELoKWii6es7pkgefveOtsZd
	rCknq5SHBt87gmm9IzYsV2giDkL5HSlpDmIAAA1gnNE6ZkOl4BoldTQrKuXrXocv7ArrhtLOpY7wv
	fBWVNNkjAvyclKLaAw3htOnvgoi0pw/kUlXkloDS9WTIZgtH9qA3k9KnI9RaLriJjLnB5ObMUWEn4
	gwGPPNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj5FE-0000000GVRS-3ORq;
	Fri, 14 Feb 2025 23:37:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj5Dm-0000000GVHM-1qUU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 23:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739576143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3QaL47zgHLdcs5EkgRrAkLY9U+KKlkChilDN7QnXbQ=;
	b=arupsSGxIsN39X2NPbGZ3b/DVoGNDtKzjVJXxkj9QZkc3wgCiUQh4KpVP7hgqJ/XbPdsIU
	NsAbfHZl8GeucG3S8UkL2Qwq1y51J6Aw9yBRascsRDpNobVne3E/6yU4oqO/24gp4nZp6M
	99WxlLBVSrq4z/8Vwxj3IYH96wN1/PU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-sN5QKZS7NdSC4nTTaLpX-Q-1; Fri, 14 Feb 2025 18:35:42 -0500
X-MC-Unique: sN5QKZS7NdSC4nTTaLpX-Q-1
X-Mimecast-MFC-AGG-ID: sN5QKZS7NdSC4nTTaLpX-Q_1739576141
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dd533dad0so2245327f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 15:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739576141; x=1740180941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3QaL47zgHLdcs5EkgRrAkLY9U+KKlkChilDN7QnXbQ=;
        b=F182UvAfcfGW/c3lUKgdg1HYFKUtKyLexMgXbxivfpkPL3KI9sRGLdN3VeKNsg6faz
         S8shf9GeA8riB1krbn9vd45gHUXa1eQw+mtOotbxmJY9jZMaftc7sGRa6Bhxw91J9Z5u
         GVvVhD7EiaO0Dacfl5snufpgj0YTeaxkB+g6sKUBX+vI0SaifRoKAAMy1VKOYY3uzgzd
         r0UklM7kzAGYo9Lg43GDMuKhJwktH8YmI1SWSX8LR5tW3h/t0Mu071FwmZCblHsSRcp4
         Y0IXf6zn+YxIwfEsE2lP942nlLCk3MXVg46NPvwWR+RfhSih7myuovR9XWswKZYp8Njh
         3vzw==
X-Forwarded-Encrypted: i=1; AJvYcCWb5syI2aWA1K7Q5L/k4LeKzHSYqc5h83vGSVsiM96ylupK+iDH3D2t/o6CnCKui41FtVNeGGio/4L9ibVQnrbj@lists.infradead.org
X-Gm-Message-State: AOJu0YxSKwvbudhWbyOMWV9iD9jVhuKwgnySfqPpB/lGXAcY0Lob1ueY
	qXQcBqJ8zUZprdaAE/hKuAOqfDW8NPxvXgo99mFvCiASb3YlcZ9h0cxh44dhFJQvhgt8YxkBMWu
	dQc/IDuMHb8/znl6nnDdtTofbMCL8LTRL92hDgPK1scK6E9B5ui4JnFp98yGLDr4J+zzULsS5o+
	C71Z3PtcFXGeFuHDU1G1+GqjzNNxXrpmAGhtf10NHg1eJlv94=
X-Gm-Gg: ASbGncsJKJxR3sefwSxmOww73tF6jI8tCI+ofiqqpgJcsePK1k18q1vFmNnmpgopMh2
	JwYQzpe+glq7hsyxH/rOLZW7wrt3js4sviQc2SszKRkOxwOPjKQUUD/0nqb7+RPBb
X-Received: by 2002:a5d:5f4d:0:b0:38d:de92:adab with SMTP id ffacd0b85a97d-38f33f34cc8mr1062579f8f.29.1739576140978;
        Fri, 14 Feb 2025 15:35:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRPUHm4YOOqYgdpQa1/Abpu1FH+JFzeebiyjLQPAuWs6N1wd0ZHNkh1THgVdQ28g3L0vPQ1rQihV3c/JaDpbc=
X-Received: by 2002:a5d:5f4d:0:b0:38d:de92:adab with SMTP id
 ffacd0b85a97d-38f33f34cc8mr1062544f8f.29.1739576140537; Fri, 14 Feb 2025
 15:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20250214115608.2986061-1-maz@kernel.org>
In-Reply-To: <20250214115608.2986061-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 15 Feb 2025 00:35:28 +0100
X-Gm-Features: AWEUYZmbJK9XoDAa1oF2aoN2h1YAezNxqJci3v-I9zFt7JUER3UJjYZD2898x9w
Message-ID: <CABgObfb4sLa70-_1_+XQ87Uy8Jo7GXc=ta2FaoM1K-q4YOE9Dw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.14, take #2
To: Marc Zyngier <maz@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Simner <ben.simner@cl.cam.ac.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Eric Auger <eric.auger@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
	Fuad Tabba <tabba@google.com>, Jeremy Linton <jeremy.linton@arm.com>, 
	kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Quentin Perret <qperret@google.com>, 
	Wilco Dijkstra <wilco.dijkstra@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dDIZwFIG4KpJsXASUXi78CNYwVbZViPkQwS5DRMu6WU_1739576141
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_153546_559588_EC64A888 
X-CRM114-Status: GOOD (  16.83  )
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

On Fri, Feb 14, 2025 at 12:56=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Paolo,
>
> Here's the second batch of KVM/arm64 fixes for 6.14.
>
> The most noticeable item here is a rather large rework of our
> FP/SIMD/SVE/SME handling, mostly removing a bunch of fairly pointless
> and not-quite-thought-out optimisations. This fixes a bunch of
> failures reported in the wild, and makes the code far more
> maintainable. Thanks to Mark Rutland for doing all the hard work.
>
> The rest is mostly a bunch of fixes cleanups after the merge window
> (timers, vgic, pKVM...).
>
> Please pull,

>
> The following changes since commit 0e459810285503fb354537e84049e212c5917c=
33:
>
>   KVM: arm64: timer: Don't adjust the EL2 virtual timer offset (2025-02-0=
4 15:10:38 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-6.14-2
>
> for you to fetch changes up to b3aa9283c0c505b5cfd25f7d6cfd720de2adc807:
>
>   KVM: arm64: vgic: Hoist SGI/PPI alloc from vgic_init() to kvm_create_vg=
ic() (2025-02-13 18:03:54 +0000)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 6.14, take #2
>
> - Large set of fixes for vector handling, specially in the interactions
>   between host and guest state. This fixes a number of bugs affecting
>   actual deployments, and greatly simplifies the FP/SIMD/SVE handling.
>   Thanks to Mark Rutland for dealing with this thankless task.
>
> - Fix an ugly race between vcpu and vgic creation/init, resulting in
>   unexpected behaviours.
>
> - Fix use of kernel VAs at EL2 when emulating timers with nVHE.
>
> - Small set of pKVM improvements and cleanups.

Done, thanks,

Paolo


