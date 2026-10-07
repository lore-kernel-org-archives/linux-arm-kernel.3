Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3817FCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtV7a276zer7HYMM0Pe6JvprlfytjauFNj/avwGxv1M=; b=ohiPIv5dD5c+2SnYMqMnY2ZYWx
	7AGYaAWwfyOb1DBb49MqaRVZZKLoVPmX6vlxFnxH0NRYNnan/gVE65V7u0kwzAATaKrJwjMbYFpI4
	LuuUmmeAfp2S0LsOrjAXrwKJl2eTY/+/VOOWntjL+zQ8C7vRhWrW8ycS6h5i2INVeq4wjv6Xuwhhs
	q7G9PskmNf201+hCZpQKyJKiX2kmAmkVokuOiNvzQZz92rkBxdwAga5ZkmSmg3E/0rBsEOO+7otzM
	w7KRg8jsuHbj9jaWNPUyHZ3whPpIH+2Qn9MctOYkkC7OZ2rmmkmgna6iVA4685KFghsT/5UsKniFD
	RF2jv+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPON-00000002G12-1ac6;
	Wed, 07 Oct 2026 11:00:59 +0000
Received: from out-90.mta0.migadu.com ([2001:41d0:1004:224b::5a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPOK-00000002G0L-3QJt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:00:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7AAmUdrhI1yAcj5z7olkLM57zlwGodlaq9p9uBBFRNA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791370854; v=1; x=1791975654;
 b=xdJFsi54TlvMK1VzM2yPwgQNa+7qvJIzJTFtYIUEckY7Ii2GCdOZIRZ06UOdiWBqn+D1b19N
 RqYLalj+SIFIVtywnyeYCUEf4oIP4kKS3t63CIf0/XdBTeeY63RL75xtyUX2ejZtbTOidWdZQ61
 50Q3ybgFfteNRsuOzYHe/pOQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 888a8983bd3bcacb;
	Wed, 07 Oct 2026 11:00:54 +0000
X-Mizu-Trace-ID: 888a8983bd3bcacb
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7910e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:00:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwk0Wvap3T26OAiUjWlqlr0Yh/c4wuwIwdK4QX1q2I6jhki3J49wJe/ut+gSZGdXeiQPzF5FIoV7J3q/gpxC9f0@lists.infradead.org
X-Gm-Message-State: AFq9FYLPRs7fw131i1suRIm2/nlKW+4NRgbmYGkCOxJAL+sDkyPNcDNJ
	/8aB9jaRI7tUpHrkDvdCIHzovYxDnY7O744gkLa7+ESXrEXobs0DKj8TPc3b+G1avVdkSbh2B+9
	YGg8sSfZXCRP8J6gZRYNS34dCZL5RmbYdoKX73H+C
X-Received: by 2002:a05:6512:10c4:b0:5bb:7b34:8e00 with SMTP id
 2adb3069b0e04-5bcca834338mr303502e87.6.1791370843101; Wed, 07 Oct 2026
 04:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-4-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-4-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 13:00:06 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwdoj8k8-To5ywwDO18Ek-sET5OHbKuawatTNvMc6gyGQ@mail.gmail.com>
X-Gm-Features: AclHuK9kFsM0C-8314xeyKxj7wNCXh1xIF58U3OrNPCRgmPj5uaBmkaoPd_Q9sw
Message-ID: <CA+EHjTwdoj8k8-To5ywwDO18Ek-sET5OHbKuawatTNvMc6gyGQ@mail.gmail.com>
Subject: Re: [PATCH v23 03/14] KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_040057_021845_1EDDE409 
X-CRM114-Status: UNSURE (   9.95  )
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

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrot=
e:
>
> Fix a potential build error (like below, when asm/kvm_emulate.h gets
> included after the kvm/arm_psci.h) by including the missing header file
> in kvm/arm_psci.h:
>
> ./include/kvm/arm_psci.h: In function =E2=80=98kvm_psci_version=E2=80=99:
> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>    =E2=80=98vcpu_has_feature=E2=80=99; did you mean =E2=80=98cpu_have_fea=
ture=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
>                  |             ^~~~~~~~~~~~~~~~
>                                |             cpu_have_feature
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

nit: If you respin, could you update the commit message?
vcpu_has_feature() is in asm/kvm_host.h, which arm_psci.h already gets
through linux/kvm_host.h, so this error can't happen. What arm_psci.h
uses from asm/kvm_emulate.h is vcpu_get_reg() and vcpu_set_reg(), in
kvm_psci_narrow_to_32bit(). (Sashiko, confirmed)

Cheers,
/fuad


/fuad

