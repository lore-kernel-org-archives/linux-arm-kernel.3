Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96579CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnlFAVoCjOytx6Qrpgy/4Sf9XW0KPkCm2GkfJqhmFe8=; b=ObCodAgealhS3FGf/h7pxar63s
	tybGHGybcgNB3QrUMbofxJpQr5Xc8kZOcggiVyFvoCIsH6N4mz9XYAe4epDBE5BFrwKPIYpa+7DBi
	ZCPA7E+VFNDWbgHYcis7gjyrqOeu6ceglMkWsFnJ3EOjF/eLFXVVeZisvBNPwFcXkT93ZKOY6q+9X
	fdIPqpYP5ZmzV4XDl4fz+olkmEZOPLqar7RQcEx7eVnLW7mKIwFJshHRPOMhQxjNG4ElTMwX+6FQQ
	s9a7UQ1Un10TVyW/AhUYUHZBEnGEwSEFNBCx3IKvHdiAE0VG4TjpsnaWqyPc3G7KdoR72AkSEcK0T
	qcgzvDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo5m-00000003gvc-3LBf;
	Tue, 09 Sep 2025 02:28:22 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgWn-00000001X6v-0R5c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:23:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757355818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnlFAVoCjOytx6Qrpgy/4Sf9XW0KPkCm2GkfJqhmFe8=;
	b=WVE9Ic1V1e40Rj5dce1HfALRsDV+uAObb1IUpr45wv2v/s/9lmu3pFajN3+z84O7eRwkii
	N1lg3UWPEd9U6b5EnJ10sMHAlSw1k4rJtMOWHUGkbqVKszHFRtmgz0zo/IHm5Jmklz4zk1
	PZAidQYANPFEkqm6qj6RO5EiMVt2V8A=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] KVM: arm64: Remove stage 2 read fault check
Date: Mon,  8 Sep 2025 11:23:24 -0700
Message-Id: <175735577928.2363175.2398747869709964992.b4-ty@linux.dev>
In-Reply-To: <20250908064806.4093081-1-r09922117@csie.ntu.edu.tw>
References: <20250908064806.4093081-1-r09922117@csie.ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_112345_283571_36900AA3 
X-CRM114-Status: UNSURE (   8.69  )
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

On Mon, 08 Sep 2025 14:48:06 +0800, Wei-Lin Chang wrote:
> In the non-NV case, read permission is always granted when mapping
> stage-2, so checking for it doesn't bring much. On the other hand,
> shadow stage-2 for NV guests could potentially have non-readable
> mappings when we align the permissions with those that L1 set for L2, we
> shouldn't be checking for read faults in this case either.
> 
> So just remove this check.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Remove stage 2 read fault check
      https://git.kernel.org/kvmarm/kvmarm/c/756491dd8329

--
Best,
Oliver

