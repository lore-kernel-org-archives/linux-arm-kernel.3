Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C22C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 00:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Yk5W8YMQMFUnjqW7SP37P8eIRPlwXT5+5U93q8LYb8=; b=eVzllNrwgx2NpFGsvTDrrdRIfe
	I25NGsUP8NkUPwxZMPk+Prt8ZfvWwm76xxVzo44rc3nmdHWRfr5VcY9Qkrwm9LfXYOdNbLgV6K5AL
	9aYEAHcxiB3tVorKScOHAHemeF9hkn2L81m7Ik5yh+mo+0+T0POHqZNg7Ps8dICPnZ0wnGuRjlrjZ
	ESzEp5W9SlHhZvalPHLAWXH3+GLSH+fAkoQv/a6IIZFHgt6Npbgf21AHehJRVxmeXzcpOMdZYnlHP
	50Ez4NvZOWiSY46HgsRLFyKdLVOsxzbdFCrTmJtt9amB7t/R+55zBCCIIRYAeoyIzOka1DzYAmCwp
	dmHNl6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Z1j-0000000Daon-3Bgs;
	Wed, 02 Sep 2026 00:40:31 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Z1g-0000000DaoT-1Bbk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 00:40:29 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-ca8aee88725so676034a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 17:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788309626; x=1788914426; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Yk5W8YMQMFUnjqW7SP37P8eIRPlwXT5+5U93q8LYb8=;
        b=qbh7iY0cskpWLmO9isJNfsMQuPGPZY0h/cw9ELoqivGY3yNCaWqCJEyZIdOIuWHWE3
         6ayco5VTzHGVWEDvW1dYmiIHbRIYp2pA/E43TkLG34bETIYJs2n8yMfWTke1UNQSyUZl
         KaD9sF4gT7KYGDdwHtHpsO8cD0OIFkxfiy4YdE0auuDKjVM2CCouMlJLGjKO8t0FhDtP
         2WXZAeQP8wxrR9FezIu64wk+l1GhqLUBJcLWrwh0bsRq/v/IX826SussBrgO+fgjfZ99
         e/VdyH7RT8sdhDrPp+iFUSsbu1lMTMap4vUfKDmrPXvct8kPuBGaz30o+Xbu1imBI4AW
         9GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788309626; x=1788914426;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Yk5W8YMQMFUnjqW7SP37P8eIRPlwXT5+5U93q8LYb8=;
        b=C6nE2Ef4yCWFuMjsJmvaCrZVrBdkhG8UqaWYKyQiKT6nRdqg+EskmdKuF4mkhxlcq3
         DGRmpiDLbD7J0bmTCMhZCafu5XL859NzPUmk23tu6C1RlYPYMD/iaq6P6agBNgxlH7LO
         fyc2tBqtm6mEn2GCevR11mbQk+48DaCcwXjQSolbuGUb2zIJE2l7iykcTxXq+bbSxs+i
         ayW5lqtfndskDgM8jiBqdQSladYvdfqvn/yXrFJaZhgsOGw8VaRMTXSEQKISOFsJTyt7
         OFHi9JVKf1K9suKVs7zXzgaOh7tQPBy4SdkEWue6aSvt+nTvzTu8vqX9OZ3h9DTddC1v
         BKHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlsTl7x/FM5c1I7GM/JRnOvETe0acGjlsI/amDHc5qUDS9pw7dz5D/LVPOEDbEiNOGRiUrZElM8aSWyZoIFwTY@lists.infradead.org
X-Gm-Message-State: AFuF++nACkyDvFzhG8phIImD5eOwNozfkPf3rlBSYXnFUFC2Zv8IVc4U
	dE1AEMlPoPlBo1UoJoPnsZhgG1dopmNrn+o2R2olJfZCF44aguERrLPHSxK8Zr1mCKXlvpAQSKk
	XvgPHHw==
X-Received: from pfbi25-n2.prod.google.com ([2002:a05:6a00:a519:20b0:84f:4ff1:f767])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ab08:b0:848:5cf5:5040
 with SMTP id d2e1a72fcca58-85ed23e044bmr2745937b3a.10.1788309626365; Tue, 01
 Sep 2026 17:40:26 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:40:25 -0700
In-Reply-To: <20260831144802.834315-3-seiden@linux.ibm.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-3-seiden@linux.ibm.com>
Message-ID: <apdweRfqt4dTxcU9@google.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_174028_319966_F91B5DFE 
X-CRM114-Status: UNSURE (   9.58  )
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

On Mon, Aug 31, 2026, Steffen Eiden wrote:
> Allow KVM implementations to choose alternative device names. This is
> especially useful for architectures providing multiple KVM
> implementations simultaneously. Architectures providing multiple KVM
> implementations must compile the KVM common code once per
> implementation and mange symbols.

What about tracepoints?  Or do those show up as "kvm" and "kvm-arm64"?

