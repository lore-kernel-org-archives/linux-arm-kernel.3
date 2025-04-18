Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4951C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBbnOR+pK/NQQPxjQOqaAi68Gr0DiKxfb3ev6ayzfjM=; b=ObZC/IM+7I+eTK
	oWwWABq95XJc3JYHVsfhkMF/fTev4uQ+TCfB7Ip6Z2bgPqlYK1i0BH5aEizjmKeGzp1nkPB2/O2TI
	/yilLdJ3G2Tmr+Ca6CpWnJ+YQcIii0KPWwXPzJcx15rp31L6s8Y3OCSG+JDM9WgCpwbJ7Yzdgc1Kp
	JG7GZtjAmkOPtL3ZG9DhW/KyyHMpVCD/JbbG1hQCYeTF67fxeNgO2y5ulBQuf5hxpKJYEH/baeM0Q
	cg00j4R9ize8gEp89mcqTZKm9UdnFg/Y2Tb6kWwOEXV7Dc6lEAhbxFZyKjz/lpmjPR787NPySUcea
	QrdLmikCdaLNgHWXbGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5str-00000000H10-1iRS;
	Fri, 18 Apr 2025 21:05:27 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sru-00000000GgC-06MI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 21:03:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745010202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wBbnOR+pK/NQQPxjQOqaAi68Gr0DiKxfb3ev6ayzfjM=;
	b=EWsIZ38yznbEniiZGQE7EMP7r8kUsFq30pSXcHiq+/+9+BbmgbDvgIUWjbYsCRjf+EHhwU
	7exYEzXLHinW56S1YpT8o46coK+njzyfX5KF0QvAjcxyg5Vmi2IoLNJvsT261P/5SoP6nD
	xTNCip6Q88YaTmyczOiZXnm7qDmGi38=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] arm64: Rework checks for broken Cavium HW in the PI code
Date: Fri, 18 Apr 2025 14:02:55 -0700
Message-Id: <174501016555.1215576.8158550633479811313.b4-ty@linux.dev>
In-Reply-To: <20250418093129.1755739-1-maz@kernel.org>
References: <20250418093129.1755739-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_140326_214085_2975BA24 
X-CRM114-Status: UNSURE (   8.66  )
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
Cc: Will Deacon <will@kernel.org>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Oliver Upton <oliver.upton@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 18 Apr 2025 10:31:29 +0100, Marc Zyngier wrote:
> Calling into the MIDR checking framework from the PI code has recently
> become much harder, due to the new fancy "multi-MIDR" support that
> relies on tables being populated at boot time, but not that early that
> they are available to the PI code. There are additional issues with
> this framework, as the code really isn't position independend *at all*.
> 
> This leads to some ugly breakages, as reported by Ada.
> 
> [...]

Applied to fixes (and off to Paolo), thanks!

[1/1] arm64: Rework checks for broken Cavium HW in the PI code
      https://git.kernel.org/kvmarm/kvmarm/c/117c3b21d3c7

--
Best,
Oliver

