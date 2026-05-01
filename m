Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FBBCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeZa2vTfQTPPy2tE0AELI/CywGdS8lzsR2UtuqDGCz0=; b=kItx4ksh/6ymNa2GDNKfULiXQ8
	BtpRrqgFxYym7cdT85OSqPvXfEJnIg6mFu83di6A1U6BZEfueq3hinjLG91S4ZCNWqYgUrGgLWnS9
	+/eso0H+AHmR7WTiBwZyImDV7awHVD9XlHl6PWZkZJSSgkUSYNY5CA6kx7egFH1Rj+G7Ob9ZsdBj8
	rD2tbq1emU+hy48cn//+3WkYdEwpqCZ5NDpTRc3TSjLoIgr63Bp8AQM5Wp1eHsXNzbjbgp03Qv/Ln
	imxQ8Mdm3lNT69ceA4PYKBZm0JfxcALO2qG1aQOsC+y/3EdZXcKpChCxC9ALSur2timrVBpN8FlPE
	YGVOftZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIt0x-00000007avc-2hT2;
	Fri, 01 May 2026 18:55:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIt0v-00000007auz-1mQU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 18:55:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58E4043CD;
	Fri,  1 May 2026 11:54:51 -0700 (PDT)
Received: from [10.57.66.223] (unknown [10.57.66.223])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E07813F763;
	Fri,  1 May 2026 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777661696; bh=dcheq2gtdulc2g0JlS68aZSwyoZSfE7RjnC9DAk/F0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aNxXli3g5wTSmB68mouLOemRqZ7r9XmhaJ3vpcb1cXd/NR2ZYumUCRzs56bjdHl9m
	 NhJ+RRJXPMaQWsL7IvWopUh0VTZgks4+TmLAZn7H3YIzYwRf8ktqgJnzqK6xW53g+Q
	 5UyVe2BtQt5J7i2tPw1lglNRCuITeLN91QFNi+Gs=
Message-ID: <187900ec-4585-42d9-946c-e6de3111552d@arm.com>
Date: Fri, 1 May 2026 19:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/43] KVM: arm64: gic-v5: Implement save/restore
 mechanisms for ISTs
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Cc: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Timothy Hayes <Timothy.Hayes@arm.com>
References: <20260427160547.3129448-1-sascha.bischoff@arm.com>
 <20260427160547.3129448-37-sascha.bischoff@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260427160547.3129448-37-sascha.bischoff@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_115501_598592_BF6941D9 
X-CRM114-Status: UNSURE (   9.34  )
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

On 4/27/26 17:18, Sascha Bischoff wrote:
> +	tmp = le64_to_cpu(READ_ONCE(vmte->val[3]));
> +	host_id_bits = FIELD_GET(GICV5_VMTEL2E_IST_ID_BITS, tmp);
> +	host_istsz = FIELD_GET(GICV5_VMTEL2E_IST_ISTSZ, tmp);
> +	host_l2sz = FIELD_GET(GICV5_VMTEL2E_IST_L2SZ, tmp);
> +
> +	/* We always use a Linear SPI IST on the host */
> +	for (int i = 0; i < BIT(host_id_bits); ++i) {

IIUC here we iterate over host's SPIs and save them into buffer provided
by the user. One thing I noticed is that if user set number of SPIs via
KVM_DEV_ARM_VGIC_GRP_NR_IRQS bellow 16, say 1 (btw, it seems there is no
way to set SPIs to 0...), it would be rounded up to 16 in 
kvm_vgic_v5_irs_init(). So from user perspective it needs to save just
single SPI, thus it could provide buffer just for that single entry. With such
setup we can end up corrupting user's memory. We can argue that it is user's
problem... perhaps we need to spell explicitly requirements for the buffer or
provide interface to the user to query required size or respect nr_spis set
by user or some combinations of all :)

Cheers
Vladimir

