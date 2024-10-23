Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D45CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZD/0/u7gXlxe9du/g//Uu8khQkQ8pf7JdM6R0YxrK8=; b=FrNVA1YDkM0wvZXnmC47O14Zf7
	bJsEGMARCN6fgB1nHT2y00nupKrZvVU+SLhyO5xMYf/8QSGpsivuFjhZSaiBWFYEiknjIXAkIYrzc
	jPN5MNQeIuidC9fGbbP7GoKQleantH9F9pg06sL5uA0KFqzgiE0uSBzWTWjovz/nGCjoyN9kfduw/
	naZVtgPJGq/dyZusfWnAFi0U/PyFS56aW4JmNSvRhF4RQ0FqlEcxhN70uHZWWoCte9vnKRBEhOyvp
	wnvUjzIJOceTsYoxWT0hmzyuLry49+gDOiQi5kV7xjQMMnmo+AKCVkUcHNmrLmh5NN1X4YaMdLzKN
	bmha9q5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3huN-0000000FpA9-39pv;
	Wed, 23 Oct 2024 20:24:43 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hsq-0000000FoyE-0uxA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:23:09 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so242227e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729714982; x=1730319782; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZD/0/u7gXlxe9du/g//Uu8khQkQ8pf7JdM6R0YxrK8=;
        b=Tbm20PsNdkq6Ro+KvSLiKPNMQiNuSmpI5+z6aSGg1jc5nt0IFRSmb7LFr6KZimU4Vj
         OlvuTecbmoKIn9mQeNse5AUjheX48vgtbBPcrBMSUkUL5Z8Iz/q1NWZckHB/vFxPfCKE
         QpH+0HvsOmoxz3G4N6jazW27pUz3lOlfvQw+pYFzwD5BIwj5OsirChKJgjB+prBrCBVa
         hHFvIW9O5xyKWO55z9IcigtnlSkkAU7a+VR0NfDKuNz9d3X3AUlhwdXuyIr04/LFlX6A
         DuUI/UkuZr3w0euCfMDWSN2nCp79CbsT9hPSE0nZkY5MXkm64H6BphbpcyF72gXq00mn
         187g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729714982; x=1730319782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZD/0/u7gXlxe9du/g//Uu8khQkQ8pf7JdM6R0YxrK8=;
        b=X7/IYl32svMwzFyHbJU/+x0MQxoyUp3WXJokjSTl25V26/dHhBcnAqriU/5XYCbXqs
         YtX8CGtQI+OFbXofW6cs5Bn7iSv0j+gZhnxLW2SJ+FdjsmA8av5jxofiEGA1Cosfi5D8
         vpVUFG7F0gTfPG2wZFkIvNyp7WSU4Voux9KvLMGbfdee3Q5zX8IYEQzjul+L1ZGOUOzt
         UK2UW3zAaUWnxFWDeQuXYiRLtPRJkzADUJ5vTXzBXah/O7v8ExDvP7HIG5It6eESSTre
         OAqO+XYh3JJIWB9eO1TPEzIb6W4h4KQfnpMoF4az+jUTNCqWj/bIUTzdAvFfbq0Ksgxb
         PgLg==
X-Forwarded-Encrypted: i=1; AJvYcCU22FLb3IRd22X/tENXeTxaOQsiId7kBZiH/6WxT2ff2RH3bntgQD2ltKHWLU44fr9xmnoFk9dNF7ctQfjAKrcl@lists.infradead.org
X-Gm-Message-State: AOJu0YySA83G2xri791Gnkifs93QWT2ujW5oJot458hCZbUUlsK8hNpo
	lWk9DgVn+qZ6rqmrMqtBNWoGnwx+mmeWgp8qyPETdZX92CyOiAeenI1mZQN5CX9AdyXJT1Bd234
	r82euNr7GRgQG1xR5DD/npYakeBclAwH+soqC
X-Google-Smtp-Source: AGHT+IGlNI9WaWM+QrYiA17yEQjL8bNc+Jh3lkHinNfgg5TW9AlhOnLoOjeid2kRXVqKu2tTh2RpWrDZehi1hSUFULk=
X-Received: by 2002:a05:6512:12d2:b0:539:f4a6:ef4b with SMTP id
 2adb3069b0e04-53b1a3bf229mr2388184e87.55.1729714981802; Wed, 23 Oct 2024
 13:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240704142319.728-1-jiangkunkun@huawei.com>
In-Reply-To: <20240704142319.728-1-jiangkunkun@huawei.com>
From: Jing Zhang <jingzhangos@google.com>
Date: Wed, 23 Oct 2024 13:22:50 -0700
Message-ID: <CAAdAUtjnWqDUFfZri10HWk=U+Bsy1_Q8zEe7oucwGzNDJGQYGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] KVM: arm64: vgic-its: Some fixes about vgic-its
To: Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Eric Auger <eauger@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	wanghaibin.wang@huawei.com, lishusen2@huawei.com, tangnianyao@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_132308_272422_BF221264 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Kunkun,

Do you have a plan to respin this patch series?

We encountered an issue during the VM suspend/resume test that can be
resolved by this patch series.
During VM suspending, the ITS table saving is called multiple times.
Concurrently, device table and ITT table entries are mapped/unmapped
due to devices' suspend/resume. This leaves some free entries dirty
(valid bit equals 1).
The table restore starts from the first entry to find a valid one.
There is a chance that the entry found is a free one, but with the
valid bit as 1.

Jing

On Thu, Jul 4, 2024 at 7:23=E2=80=AFAM Kunkun Jiang <jiangkunkun@huawei.com=
> wrote:
>
> There are three fixes about vgic-its:
> Patch 1: A data length check is added in vgic_its_save_*
> Patch 2-3: Fix two bugs in the scenario of continuous save and restore
>
> History:
> v1 -> v2:
> - Replaced BUG_ON() with KVM_BUG_ON()
>
> Kunkun Jiang (3):
>   KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
>   KVM: arm64: vgic-its: Clear dte when mapd unmaps a device
>   KVM: arm64: vgic-its: Clear ite when discard frees an ite
>
>  arch/arm64/kvm/vgic/vgic-its.c | 44 ++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 4 deletions(-)
>
> --
> 2.27.0
>
>

