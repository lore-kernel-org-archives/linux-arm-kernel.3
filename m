Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF848C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96jSKrblNa/MGHlSRt22d1bqrg1HZKp/dYSrKcWfd2w=; b=uyRF+TTEcA7e4AHGq4qOIeJX6q
	Rk6lL4U+enXH4wcqZFxHzvpTS47VflolbaK07ksj1TRp6hwIAqINtAnCmrtsQs3VnS1mslcnIHnml
	R79H2nWS/DJCi5pB74NBl1WutJ0W8RkFtLJKwngSV6XJWotrYqn88b3EHwQJEZtd6BdRoGktj81hI
	NfsLAeDOIG5MYScnUWyqawyPbHVYhfyurhjHFn169+WPuY6y/AQrlW6T518TCCp9pPmwGLhxioOzN
	qNsdb0HYEXIPpV1lZTCc+/J5ynuysdL9UsLswqgNpJnZFfa32rgxKXD7ToENb0bdWVFNAhVhUV3ty
	vb6aJ/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AVO-00000000Bx6-1ELD;
	Thu, 03 Sep 2026 16:41:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AVM-00000000BwI-0aSp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788453694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=96jSKrblNa/MGHlSRt22d1bqrg1HZKp/dYSrKcWfd2w=;
	b=bFN9NjMB1PGgROZP967lUpqy3JJf2a4AmMd4ONO5zYagyE2tW8LqlwAUNbApu20qbMSV2f
	j9lTNQw+G685Ct/Ud2hgJhgLS/M6hnFTgg+vX3xTCAi2+infDng6QbGEyjuyuPZPWpUCWz
	1VY7BgbOqa5DuyKc3geMZZWmQahgarM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-1X1zazIpOeKt5QoIf_hlhQ-1; Thu, 03 Sep 2026 12:41:33 -0400
X-MC-Unique: 1X1zazIpOeKt5QoIf_hlhQ-1
X-Mimecast-MFC-AGG-ID: 1X1zazIpOeKt5QoIf_hlhQ_1788453692
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843227cfcfso739868f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 09:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453692; x=1789058492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96jSKrblNa/MGHlSRt22d1bqrg1HZKp/dYSrKcWfd2w=;
        b=HbpWyQsIOFivAvge/Fir812+sAYQdP+pRdh8lNvg6/bqhrAEl+wqwdfMntm+rcRfgp
         opV2Wejsco88tcg0V9a0FdxHF4jLjMlolnI/r+UC/YS6/qb+4EY+9qHAD6EL4Ow+nTvX
         yUaU0RGPwb4gifFY10pUJoCmi6ptGBDHZ1WzFrstEn2SgnF+rFP56p4UjfCAnwMsQFHC
         g+Josb8ztc62eTFpJnb+RSLyWxRkmKZh5BxbY/SmQXOuuwdoji2uNSIufBBDyYodqfbR
         BOm6d1z3jWdc11n/kyQEGD3j8yk6dNIKQzOVJ79yBcwNp7jKFzsT4VpooydJ3Oy9dBV+
         mv7w==
X-Forwarded-Encrypted: i=1; AKwUvBzFfwuFKa6drFBn7HmNntJeAeKhUYBUXYjoziWQ29OBhiTyrMz1eItSkQv5S/nFG4QEfbAKMD5QmgZLaZ7jZRON@lists.infradead.org
X-Gm-Message-State: AFuF++lXPABMG35PQ4IPdKjqiMhiOzP62QiyBumWIoDMInCdugEeB5Rn
	6CBDgDQrBqdMTIc7517kcUwCZTCNCwLgbsVLz/7/0NXnQpmFx86hovR0ckkXON8aQ310wLbhzkK
	w8sm0aZSLTD70sE5eGGe2td6mwK4hqdhszlqqAbyEOx+BXzoiC1u+YP2wzh/kvx3NVwxuKgA4ks
	hzSJ2Mk4Bg0k+D4i8CGQ2VCPt/eoL95XsOjyh8He6B6cdcIzaz42g=
X-Gm-Gg: AYBFou0WbPjdLgXR6ypCiw86d1FLUogzeLShwu8fArL5cTTaPBFDmYhJzwVZ63XgLBZ
	c509BZtCoKbaL7ORN8dnwCF+NcOvo2lQP3sLtV+aEqOut9R4GIX5TE2Xi1Tjk49V1LAJGd8dOH9
	/U8a9o368k84I+i8sqIVUE8bX9PUXJSigAZwuNcdOoeF59oJ2261pYNDs/EaO3I3CQZM+9J+A0L
	ZULRSMUbwLoYG3FAXrYTKPWmoAZf8iB8dL/O7qWlM5n0w==
X-Received: by 2002:a05:6000:22c2:b0:484:3147:49c9 with SMTP id ffacd0b85a97d-48582315a47mr5571233f8f.2.1788453691895;
        Thu, 03 Sep 2026 09:41:31 -0700 (PDT)
X-Received: by 2002:a05:6000:22c2:b0:484:3147:49c9 with SMTP id
 ffacd0b85a97d-48582315a47mr5571189f8f.2.1788453691502; Thu, 03 Sep 2026
 09:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-24-seiden@linux.ibm.com>
 <aphMx5hsoXwIpNjt@google.com> <20260903083857.33034-B-seiden@linux.ibm.com>
 <apmHrnxRLl9BuVhn@google.com> <20260903154317.246414-A-seiden@linux.ibm.com> <apmhX8H-WUc3U4_N@google.com>
In-Reply-To: <apmhX8H-WUc3U4_N@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Sep 2026 18:41:18 +0200
X-Gm-Features: AcwNN1UO9-vCqk6RvEI48oEKpR6Wrb2Fp2swzaiyckPlKKdzDRVW5sMiBpGtdhU
Message-ID: <CABgObfYUYCRtmJkh1Ns4VBbWqk3ggnDu294G9rZ6tva56=F11Q@mail.gmail.com>
Subject: Re: [PATCH v7 23/23] KVM: s390: arm64: Add KVM_S390_ARM64 Kconfig and Makefile
To: Sean Christopherson <seanjc@google.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm <kvm@vger.kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Grapentin <gra@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@kernel.org>, Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 749e0gxLHpuaib2vekysoeToXADbEjMRliRBXx2Z1u4_1788453692
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094136_244105_E397D079 
X-CRM114-Status: GOOD (  10.50  )
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

Il gio 3 set 2026, 18:33 Sean Christopherson <seanjc@google.com> ha scritto:
>
> How many people are running distro kernels on s390 hardware?  And how many distros
> actually change the default KVM settings, e.g. to build KVM as a module instead of
> baking it into the kernel?  My guess is "not many" and "almost none", i.e. the
> actual impact on downstream users is likely miniscule.

RHEL and SLES *are* distros, and I am not sure which bank or insurance
company would be running non-distro kernels. :) So I assume you mean
"how many people are running non-distro kernels on s390".

At least RHEL builds KVM as a module for s390x, but it's not a
problem. I agree with you that having the equivalent of INTEL/AMD, if
possible, is a desirable self-check.

Paolo


