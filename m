Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167BEC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuV1PdNQSyB8MneYC2C/b5+2tzDpH3Gn8jsMJd/Ds+k=; b=pF9BdoX86OBB80MYVjjku7bJ/t
	KRpzZ/rmMhBbJ83mucw+6muvCk3mm7h3hhHbaY/xD2CcsBtElxYyBorbydV8qseX7LeZOhL2IjlPj
	LKvNEq2TmcUE36kmWkRxXjYAj5BOLEWwfYBxaBSdFILeUwhuPxSRpvUX8vlbkVb5hFBtKXIq7Q+TT
	1FNgqaFcO0/vTKwbkSsopTY88pWF6iLCzp9pgLQn1p/BHpjJ572Wecre0YEexZI8DOd55LB5FrVq1
	kppfMOQpzzf65RldV7p8d2YYMsllxG2/R9ycSrSA8m6SJIO2KI+YPijqnh4YkAd7d8A1NJSBcV0l9
	Fryqc1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtpX-00000003KSF-0AuS;
	Fri, 16 May 2025 12:06:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtnV-00000003KNL-2JZJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:04:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 591AA5C4299;
	Fri, 16 May 2025 12:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C165C4CEE4;
	Fri, 16 May 2025 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747397056;
	bh=KCwjgKTMuHSCGCH8zsLHrN2hAJYJKLa4Jq5iL6Vf2cE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UD8PqnZALDd4Vfg+SoKbbdSuOiBznKSTYi986eO3GsWGWrlohNVWeVQYbZSu0zwas
	 7uIrS2h2nU/BQpyTP+12jXMyejDcEiuxp+Awn+wz5QxbUR8VvYuVg5zYKf964BxE8A
	 rx9SJ4iUTUBwoUBFumOmCf+7LNwkeubLDw2hEJW8586xxaUhR77JFLkMI7CUKSbTgH
	 ZD19WjtT9RdEQeAjUtCKMARt5BVhIubtmG/+ta7my/fig0CZQ4QhAX0sNw8HmwAiSE
	 yJeL4nOtG0H0rU1fSYpsYSb8fThjGZCWtHIyYRwN02sGVsReahHMKvB/9xncQK/NnA
	 7FNmF9nlKApxg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uFtnR-00FXoM-Rm;
	Fri, 16 May 2025 13:04:13 +0100
From: Marc Zyngier <maz@kernel.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com
Subject: Re: [RFC PATCH v2 0/3] KVM: arm64: Don't claim MTE_ASYNC if not supported
Date: Fri, 16 May 2025 13:04:10 +0100
Message-Id: <174739704125.2524774.18416359728104050072.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250512114112.359087-1-ben.horgan@arm.com>
References: <20250512114112.359087-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, ben.horgan@arm.com, james.morse@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_050417_647904_7FEB014C 
X-CRM114-Status: GOOD (  10.18  )
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

On Mon, 12 May 2025 12:41:09 +0100, Ben Horgan wrote:
> The ID_AA64PFR1_EL1.MTE_frac field is currently hidden from KVM.
> However, when ID_AA64PFR1_EL1.MTE==2, ID_AA64PFR1_EL1.MTE_frac==0
> indicates that MTE_ASYNC is supported. On a host with
> ID_AA64PFR1_EL1.MTE==2 but without MTE_ASYNC support a guest with the
> MTE capability enabled will incorrectly see MTE_ASYNC advertised as
> supported. This series fixes that.
> 
> [...]

Applied to next, thanks!

[1/3] arm64/sysreg: Expose MTE_frac so that it is visible to KVM
      commit: 5799a2983fea4f22f6aaa291aee3b704db81d29f
[2/3] KVM: arm64: Make MTE_frac masking conditional on MTE capability
      commit: fe21ff5d4b46c06c4e43a310fdb781d1e6b5173e
[3/3] KVM: selftests: Confirm exposing MTE_frac does not break migration
      commit: 69018866d2baa014413e340744bfb342ec0cdbcd

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



