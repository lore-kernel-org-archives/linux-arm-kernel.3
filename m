Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC609C55172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 21:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K++rx1kgaP2Gvj5Cqx+OBSxkCsmXhtm0mAnimMEoo0o=; b=vV4jQXBWl48SLd7JjTv9ZFqxIR
	wQTcYAkRrUKDSvrfVxyqOOuYmFhdeowNZqwiGZZoBua2933wQwUO0FJM29J6vaoRwnHdL5ZastotB
	TV5Obp2QB48nfZwK0GujvT76jUzrY4/SLmzWkNcrTs25p0ZQ/H5JCDKXFWEYvRoau4NCVGkSzXm3V
	Aa1skS1Vsp2oDDO/txr/k1ZcSUmhN/I9AZHUBOuS0px5phKKr3iGVGApcEOX0/CyNmoY2aVrc6nPQ
	GP8xHSXQm80ywh7iphOCrSHPdYNkCqIB7FWiTIxRht4bdLaYfki/HBfs1caauhszFTNcf2z4wujWn
	x1pyXw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wput9-0000000Dcga-1zpU;
	Fri, 31 Jul 2026 21:35:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wput7-0000000DcgR-2lwp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 21:35:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C6D6460A5D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 21:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAF21F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 21:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785533728;
	bh=K++rx1kgaP2Gvj5Cqx+OBSxkCsmXhtm0mAnimMEoo0o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fcdh5uXQ8J17UNZiJjPZxiCcZj9kCpIZat/7Q1TNleFpevWzca4DIoFmB1cj+uKAu
	 VEKZtL0/TvjR/zs2ZH1OZSo7FiRcASX47S+6roDXIEHVvUSu+/61GQpAI1BE9yiW9e
	 4BYOEHnCjwxErnUzao/3OcAGiYy1PRNOENwhZ+BsAW+Z8dBj1tbT11GvtFAAryiOps
	 CnL64qIRL4V9Bp3cXQkteQ8Zw7dON0SX3SGfBS79wGak/CZDQEHEk1RuUzHUybsZBz
	 IjIha/gxifdk7WpY7qyq47SnYSPGCz3ptYsmSxZYYCfTwYW5nB5GHCpbRCAR/D+sJi
	 b36wZq3p+c9qA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1712a04ddaso237911066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 14:35:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrIOsUirVpYdncOfubPDoXhArPydQORd7vMNC8rEuBEAIH0sGpodrOHw63NERGXA4Em7kvG1sE9ZjB56KriruIT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0SEf79B7QEdLm4u0s9vzzgQrTHkqoDHcfT1oawVzTLpV63q1P
	sI3ewyODz4bBo7RF9/771Qss5cw8Jh3SZOouZsXxnFRqGOxvoPus1zCSNz6F59xjSrVLcuopfGJ
	fuLxwNMZ4t6UrI1OwLhOB77QI1T0N/7g=
X-Received: by 2002:a17:906:7f84:b0:c12:8664:6aec with SMTP id
 a640c23a62f3a-c1fe826eac5mr42821066b.53.1785533727476; Fri, 31 Jul 2026
 14:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 31 Jul 2026 14:35:16 -0700
X-Gmail-Original-Message-ID: <CAO9r8zO-eCz-4Gpa_FUjRKPaDj82PP7et7KON4S5QfhRU2J-Ug@mail.gmail.com>
X-Gm-Features: AUfX_mwe_OJz39TjVH0VtgPbVgoU9MwzP5iyfl-3Rd-uJd2L1ePI9CeEd3Sup4w
Message-ID: <CAO9r8zO-eCz-4Gpa_FUjRKPaDj82PP7et7KON4S5QfhRU2J-Ug@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] KVM: selftests: Add more syscall wrappers, fix hardware_disable_test
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jul 31, 2026 at 12:56=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> Third time's a charm.  Sorry for the spam.
>
> Buried in the middle of this is a fix for the hardware_disable_test where
> it can end up with a runtime of multiple minutes when running a preemptib=
le
> kernels on a large NUMA system.  Turns out my analysis/guess in v1 was wr=
ong;
> the problem isn't direct CPU contention, it's that letting the workers do=
 any
> amount of "real" work on any CPUs leads to pthread_create() slowdowns fro=
m
> the perspective of the caller.

How long does the test take to run with this series?

