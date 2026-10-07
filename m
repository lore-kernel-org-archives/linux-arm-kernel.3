Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5ADCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWznkk9Fjq/D6EuRqmF/M6hW1RRZAYuOo1VRXMA0j/o=; b=mxwLbROKceJlMpUBLLXQIpFmEJ
	/Df28HBLAI1vCAulOO5vEFWf6UIB/V4H3o6EXiRS9yAj0+1BkhBVv7YaNRFtVqYKyiWKQYO29xyYg
	1bhR1w1/ZnaStOKDIgitIRlRCOmsTRitQX3y3ptzcrE74nTJkrNjBrOIU49/JaEY0ihvpP445L2x2
	X1KrnOTQeVnA35+cRP7CH/ljv9gSbZdQ9yBknYUP6lsMG/b4fyEVCT1gZmC4OQ4Pco1Wex99W0Lw1
	kHhlLK3aOmnZ//rUTTtpkTn/zzT9m+yab8Ix+bHFtKQ3B35QPhMBLhUmNoIaZD9YNOCKNQiz+72TG
	teKvenyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELPo-00000001nWg-2c48;
	Wed, 07 Oct 2026 06:46:12 +0000
Received: from out-135.mta0.migadu.com ([2001:41d0:1004:224b::87] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELPi-00000001nUj-3u9j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:46:11 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=nWznkk9Fjq/D6EuRqmF/M6hW1RRZAYuOo1VRXMA0j/o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355565; v=1; x=1791960365;
 b=ft22gWYqTbR5Z/P6ghUoLkuaYKifTvfnmMTnLYRvOFoEmreiQ5ShXGWcO4ZkJIIteczy6xoY
 R6h372nmqImNm939AuhEjdgiMdyb9w/bapl7WL52lU7Ik9fGepBA/botEbO9ebCJs6Ceq6jAYoV
 1NdIzFFb8CP0/b/MpoUXC2Tg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 31a1c683f1fedb3b;
	Wed, 07 Oct 2026 03:24:20 +0000
X-Mizu-Trace-ID: 31a1c683f1fedb3b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba40832934so2853e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 20:24:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzG23kDHzRQLWI/m5M2g2HkWjNModCeKucROBZntZDDeO09izOJBx5dV9g86GPt6SaG8yzB8L7BjJE/+i6TyTzr@lists.infradead.org
X-Gm-Message-State: AFq9FYK3olISIDlE562d3FXjYo5lR+trgsY75P/TxJSfNA9lo3wP+neo
	ilWdqZ0BHcz0r4yTXYaeMob9Ylo3OgEB6hc8LVwXnvgZ2DnKHW4Gteg0/gkXFSZYbB6yXhD8cEg
	UfhdpgrTZU8GSQTp26rOXUKFO9tQ7kUF5j5dzC2IZ
X-Received: by 2002:a05:6512:33d3:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcca66e395mr244231e87.14.1791343458771; Tue, 06 Oct 2026
 20:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260915084441.3846947-1-fuad.tabba@linux.dev>
In-Reply-To: <20260915084441.3846947-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:23:42 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwqmQrLz5aDsCo1JFE2H6mz_dWDf=fkLsNup0cgenMCbg@mail.gmail.com>
X-Gm-Features: AclHuK_KSLUhfLp6Pl2z-XBsxbeEyfCpN3TL9UgSgX_CqN7OtwApebc1PcGPn3k
Message-ID: <CA+EHjTwqmQrLz5aDsCo1JFE2H6mz_dWDf=fkLsNup0cgenMCbg@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: Replace VCPU_RUN with KVM_RUN in comments and docs
To: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Will Deacon <will@kernel.org>, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_234609_297420_04B836AC 
X-CRM114-Status: UNSURE (   5.61  )
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

Hi,

Gentle ping on this series.

Cheers,
/fuad

