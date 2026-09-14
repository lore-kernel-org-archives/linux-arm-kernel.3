Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0A7C88E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYmLbrJKIZxgwGEiZIbHSY9qUwUWxupEK6wMeeExcEQ=; b=RKbn2x+OmxYdfz3kW+K0WIddek
	yC9ys6wtsxIn9U2mp9O8VTFmQggbdTsmhZDWiO/ru2hT6jriZ31xFcBK6Q38B8eaaPy4ZgBDpLISF
	gekzfqc7lvgIqKaKg014rdLtJ7FDx3XpM97I1XATs3ZNiHY+uH/EQG5x/ZZfRhNqnTER5HcqyNwtt
	DbJ3L0Ewq+070VR3ktcsEOEz7N5avYO1MZIwBBqsn6z8sBhslttFbfv/lmwk9T012jqlB5AT9vjdM
	uaQFzArNQIpYsGuEvPHe0Fx+TrInd8f37Q/CEdhSGJhTGGEu0UX2rkNEB0ZfHYTIBsi4vOclU+mbB
	59gfFmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69cU-00000004IYC-1Jcw;
	Mon, 14 Sep 2026 16:33:26 +0000
Received: from out-226.mta0.migadu.com ([2001:41d0:1004:224b::e2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69cP-00000004IVt-1Rbq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 16:33:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=W5+NjNc2Yvil7nhmREpSKhaOG865kOQghRODVtnSokk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789403599; v=1; x=1790008399;
 b=BoHdHkuOKTjYYTC+fUMYCygbMU2KtrBvqWYjKnVaE8UZUiVUXre+1LEbGilV1t6SiC5S2xYS
 vxZWo8Kl4tHX2XTPGG8tuPvwD3GNk0FbJ/lsNH6OzqzU8A5cFhwPHtRsu8DzglLAIi11IIiRRbo
 ANA4vtjsHyZAHLcb+V4gXkxw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f7abb67a740cca37;
	Mon, 14 Sep 2026 16:33:09 +0000
X-Mizu-Trace-ID: f7abb67a740cca37
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so9651e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:33:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx52pRe7Fc/OijOcz+J1HwJc2kTtL/259eV0X2gRXJbWSfXzKmAjrkB/K2FQfvqZQO2TyAqteoZgrkpZlSSKpEw@lists.infradead.org
X-Gm-Message-State: AFuF++kqYzGnXbCeGHacwVgoxbdc97eTpWbfKxsFdb0TqrlOQVVSqmVH
	hWa5AXEU2K5OaijalB21kXloqfKEPgLmS0nL3aFWGVNCBUwhownEvtw341CKpmoDuM+4z/8DsEf
	QhEpM8NntEryiqB86kgd8hXI5+j8I+BPP3jeXMY5y
X-Received: by 2002:a05:6512:b2a:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b8af7a5112mr81906e87.3.1789403588069; Mon, 14 Sep 2026
 09:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com> <20260830-host-direct-messages-v7-2-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-2-45f6e6db72c2@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 17:32:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwCrh3SXggD4p9BD0A4tUe0Xc9bPREw94uAwrEizgygeA@mail.gmail.com>
X-Gm-Features: AcwNN1U-PrGVaJ7CGsoLsa0purDu4_JoU58bTFRJLLpJ0ZCVxT7qQm_pkVz-m_s
Message-ID: <CA+EHjTwCrh3SXggD4p9BD0A4tUe0Xc9bPREw94uAwrEizgygeA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Sebastien Ene <sebastianene@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_093323_531144_5340407E 
X-CRM114-Status: GOOD (  11.85  )
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

Hi Per, Seb,

On Mon, 31 Aug 2026 at 00:08, Per Larsen via B4 Relay
<devnull+perlarsen.google.com@kernel.org> wrote:
[...]
> Allow direct messages to be forwarded from the host. The host should
> not be sending framework messages so they are filtered out.

The patch also rejects a sender ID that isn't HOST_FFA_ID, which the
message doesn't mention. Could you add a line for it?

[...]

> + if (upper_32_bits(endp) ||
> +    FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != HOST_FFA_ID) {

Rejecting a non-zero high half of x1 makes sense to me, since EL2
checks bits 31:16 and then forwards the whole register to EL3, and
handle_host_smc() already does the same for x0. x3 to x17 reach EL3 as
the host wrote them though. Was the intent to stop at the registers
this function reads?

[...]

> + struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];

This relies on struct arm_smccc_1_2_regs fitting in the 31 entries of
regs[], which holds today at 18. Could it take a BUILD_BUG_ON, like
do_ffa_mem_xfer() has for its fids?

Cheers,
/fuad

