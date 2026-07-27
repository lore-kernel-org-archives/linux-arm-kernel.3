Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A9AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwsttPieEvyPrTGKzEYr9m1Cr8j+zwTvS+cA4oapoyo=; b=cPGroFjioNsaKRK9L+KTE0aZOk
	5P7ctk1u3xOG/0ivxmKG34bs4b0tTiY4rgbLLv5+y0dGMqE/Jy78vaMSRzjzIafNhk0+0xJKHZAan
	0yD786xoTJltG4g/x6AGtn4OSxvKfo8MLy6LS3nEHpm74qwhi+Lr9+Fg2jrvOEBDyM16gUsQH655c
	bM2kYFgs49yiTxAxAE4gfAGDAgpc3yGDIKtmXk0MAqFJ6y6LH8K1RNS7+4W+QvCpDKXnnJGSoPcz+
	hpS7S+tGeAno+rSb3ImdrE33H1+olZ5hP9+p06NZl+L0pEowEvQ22n9piegfZ+xIco68qjuVfJjql
	130Nulfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQB8-00000003gJr-3Tys;
	Mon, 27 Jul 2026 18:35:54 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQB5-00000003gIi-3CVM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:35:53 +0000
X-Gm-Message-State: AOJu0YzTtjZc+ipGPV1Xq4nR/vNjNfb9Iik7EmuRH/nK4HMI+6mWKiIt
	Fz7fAeyHDLQ1iyPeJDpdAZsas5cCkqF6znkJJzxmkTTfaNOTtg4KV1Lavzs17EtjNon54qaQ0yH
	UW4mgT0FY1UchaDIRl+XB2en7iqlWPCLv1kWkS3Po
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785177345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KwsttPieEvyPrTGKzEYr9m1Cr8j+zwTvS+cA4oapoyo=;
	b=XFsjlrMz1WF38Vfzvkn7ERQg1vXOiGH42SynqwMHNRONi8GxMysg1b7FhkiSPrMr+y5jfi
	3tZeaIKg/yGLL7ImDGdW6yz4UleybfcXnJT0vuHc/X3tSsHdE7YEu1qxlVMHeVoS5mq5/K
	EMf7uCs9hkRnB2T8Sdum0FYIaJ1/8sA=
X-Received: by 2002:a05:622a:354:b0:527:f08f:56a2 with SMTP id
 d75a77b69052e-529a5f15b56mr40755811cf.8.1785177335476; Mon, 27 Jul 2026
 11:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260724104819.1296803-1-sascha.bischoff@arm.com> <20260724104819.1296803-21-sascha.bischoff@arm.com>
In-Reply-To: <20260724104819.1296803-21-sascha.bischoff@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 27 Jul 2026 19:34:58 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxtSGHO__O6V+Km+3f5ASJepA=5cVHs8BdjJoLbRwbLpg@mail.gmail.com>
X-Gm-Features: AUfX_mxf8D38n9yuNlqRG7bxJInR1aSDZxlbsMy4SmN-tvZfAPBS-ChXFUbS8uQ
Message-ID: <CA+EHjTxtSGHO__O6V+Km+3f5ASJepA=5cVHs8BdjJoLbRwbLpg@mail.gmail.com>
Subject: Re: [PATCH v4 20/48] KVM: arm64: gic-v5: Add GICv5 IRS IODEV and MMIO emulation
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, 
	Suzuki Poulose <Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	Timothy Hayes <Timothy.Hayes@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_113552_279543_27D69588 
X-CRM114-Status: UNSURE (   9.21  )
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

Hi Sascha,

On Fri, 24 Jul 2026 at 11:54, Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:
...

> +       case GICV5_IRS_IDR1:
> +               value = FIELD_PREP(GICV5_IRS_IDR1_PE_CNT,
> +                                  atomic_read(&vcpu->kvm->online_vcpus));
> +               /*
> +                * IRS_IDR1 encodes IAFFID_BITS as N - 1.
> +                */
> +               vpe_id_bits = vgic_v5_vmte_vpe_id_bits(vcpu);
> +               value |= FIELD_PREP(GICV5_IRS_IDR1_IAFFID_BITS, vpe_id_bits - 1);

I think the advertised IAFFID width might not cover the IAFFIDs KVM hands out.

vgic_v5_vmte_vpe_id_bits() sizes the VPE ID space from the vCPU count,
but the IAFFID a guest reads from ICC_IAFFIDR_EL1 is vcpu_id, which
userspace picks. Two vCPUs created with IDs 0 and 300 give an
IAFFID_BITS of one implemented bit, with the second vCPU reporting
300. I could not find anything in the spec requiring the reported
IAFFID to fit the advertised width, but to be sufficient to identify
every PE in the system if my read is correct.

Cheers,
/fuad

