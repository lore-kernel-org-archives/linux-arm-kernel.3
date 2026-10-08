Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CDFCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZDQiChJc4BLUjPTC5GATFlDtxZirW0FNEhzwWirWTc=; b=kSkNEjgfRTo+6Skmr6er7Ff8zE
	84jFDvys9+YHDLOfzixEPlQYjB5niGyCgxvuoqyDSaIcKWBUtB+D+x3Slhed06Ne6J66H+aVMhOmt
	8s6NbQtpOFi+YgcoddxpmBdGpP79GzJCpdeYKJAGdXQks6FX1cpulFu+WpySel3sXoPNmCjkqHLm9
	xUjNeGYZ9z8x3hcLCEGbFLC8DvhEJHuUEMiifmTlMLJCYYUHPD0EWnfnCJTkoYXKLsOblZfEWjjcz
	ol5uvA0VR6NTwL+qkUCLQ6+5/+R47Jd1uyiXskhbgNCHvk+PKqyjJyrNZz4vI/73FG/B7NsrzDKB5
	grp9KMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEm8k-00000004Dg6-1ylE;
	Thu, 08 Oct 2026 11:18:22 +0000
Received: from out-190.mta0.migadu.com ([2001:41d0:1004:224b::be] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEm8g-00000004Dfe-2em4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:18:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=RZDQiChJc4BLUjPTC5GATFlDtxZirW0FNEhzwWirWTc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458294; v=1; x=1792063094;
 b=uaUQKRrcHk+/AojuDaTFyTkpupgNBwuIsz59wXsMnztoPaZHgXvL5hG1PJRALGMP1jmOwcKR
 cmHwwGPmEcjw+2wY4f5D/GvQY8s7arLksirfv4UDxCfcwP2Cf27iX0cwPPW2jv0TQXilbUBePRD
 gZCuOtYCd00/QQtGmNz9KSKY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3f64a94895a25200;
	Thu, 08 Oct 2026 11:18:14 +0000
X-Mizu-Trace-ID: 3f64a94895a25200
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5932e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:18:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBozOSzSuFE3q69rm8itH2SINGn/z4FMHJYnS40g2yQiflu3ZxWLSIxMv12Mc5mZu1lIT34FVUmdtxMlhRKxye@lists.infradead.org
X-Gm-Message-State: AFq9FYJQFHhdAzcLQck11nmabetWum3ly6d1Ose+SCWqYcyRBEja/Dti
	L2XOyWsHNqbWIODppxHI9YFuuRqt0QEc+W0yRTVLZsc3VgVaxn9vjAOHCNtxU9MTOP3X22Nd/t1
	2/G0rPnidLmc3N2oQaHuJYk2QLK1BQI6V6zOJ5Y1D
X-Received: by 2002:a05:6512:2315:b0:5b8:cc2e:2fe6 with SMTP id
 2adb3069b0e04-5bcd41a3c42mr122649e87.5.1791458291477; Thu, 08 Oct 2026
 04:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
 <20261007073537.2454351-14-suzuki.poulose@arm.com> <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
 <4cdd882b-832f-4968-9838-dcc29a899121@arm.com>
In-Reply-To: <4cdd882b-832f-4968-9838-dcc29a899121@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:17:34 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyg7QM9+XtbQfAf77zpyNGh0rvEjMBm=mD0694Dtk=rGA@mail.gmail.com>
X-Gm-Features: AclHuK8P2lsNGbFWtbI77W6PCd57-smcbil7-006btPRzP0RGDfW9UFPgF16p5I
Message-ID: <CA+EHjTyg7QM9+XtbQfAf77zpyNGh0rvEjMBm=mD0694Dtk=rGA@mail.gmail.com>
Subject: Re: [PATCH v23 13/14] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_041819_254204_5BBA4BE2 
X-CRM114-Status: UNSURE (   9.65  )
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

Hi Suzuki,

On Thu, 08 Oct 2026 09:51:56 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> But the second part of the changes are required for pKVM today, right ?
> and you requested that here. The check as such is useful, except that
> it is using kvm_vm_hyp_is_distrusting() rather than
> is_protected_kvm_enabled(). I don't see this as a problem as this is
> not a hotpath anyway.

pKVM already gets the -ENODEV at KVM_CREATE_DEVICE: protected mode
never sets can_emulate_gicv2, so the check just above yours in
kvm_vgic_create() rejects a GICv2. The new check only changes
behaviour once a Realm can set the flavor, which is why I think it
belongs in the Realm series.

That said, my tag stands, and I don't have a strong preference.

Cheers,
/fuad

