Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F849C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gi30/FEsbQ3AbW9O0SbfYnAW74ZA04PPwWNw0DWXQyI=; b=XFZ/F90x7AhQMi/7q4/CHgiDGu
	hWshg20ZJO+n21Qsh2ZmUUtQL3gnv3LL6FxDV1ffjcbdp0xJHgm0br1+AWbQys6OmlCmLk/lRa3m9
	FnMFKFO0bwJeQjMUWL6zwmI1tpeopCjcWX5gdRIC5DisspnUC+Iv0ncICpcBsk/Gd1dM/sKHyZzs+
	4vgc8AAEAnxSzVyGcFDLUqiz8vuUCkNSa8abjDNmPmSQJ1+5aztrAjSNlPNFE0lwskIgdpUZf/IEZ
	4prAT4ZrlHQqcw4+QScOQVQYwJbvBTpEtri7AZx73v3F9LMroY0VaAkCwsjQ6QKDQXuypTEUTVSHJ
	nv+y2JmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEmA-0000000BQ4F-3kCV;
	Tue, 06 May 2025 09:39:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCE1x-0000000BEGj-3Yig
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 08:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1502A4AAD2;
	Tue,  6 May 2025 08:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5BAC4CEE4;
	Tue,  6 May 2025 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746521520;
	bh=6NUiTuauuVTTWDJGRfLdUgLEoCQtYK+fPlsDsFdb7uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OWnoo6XeiUf/E7X7aaYO2Wh16ejc7WkatxpgR04nnkXPUwev+4plNxTx6AYD5nZry
	 rKM5g+jeKlRdWscq5qD9QuHgGejaznVxNuVahZB8tbRLOSOtCcriS1DBKNtC8nPp7n
	 Yhr0itoXjoEC1WXwb6dV/fmLDkXGL5Qps4iB1cs8/vwE4U8zA1XMSSNw6/XAot22of
	 5eW9RpWWKKK2ccdoPRbYq6gA3RgyNjcGcEIvLvhTayFjr+xpCq21j7JUVq/7jT7jYG
	 4qWECc9C0iWGt3L/HFnyJx6/+c16osgt56vPofuA1hNnZXbSbTBiQ6L7WQRHgqOMEM
	 +gAyGHTaKAP6Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCE1u-00C9X1-O6;
	Tue, 06 May 2025 09:51:58 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM: selftests: add test for SVE host corruption
Date: Tue,  6 May 2025 09:51:54 +0100
Message-Id: <174652150331.339671.16106130205951028954.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250417-kvm-selftest-sve-signal-v1-1-6330c2f3da0c@kernel.org>
References: <20250417-kvm-selftest-sve-signal-v1-1-6330c2f3da0c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, shuah@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, broonie@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_015201_948303_3AD01B3E 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, 17 Apr 2025 00:32:49 +0100, Mark Brown wrote:
> This test program, originally written by Mark Rutland and lightly modified
> by me for upstream, verifies that we do not have the issues with host SVE
> state being discarded which were fixed in
> 
>    fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state")
> 
> by running a simple VM while checking the SVE register state for
> corruption.
> 
> [...]

Applied to kvm-arm64/misc-6.16, thanks!

[1/1] KVM: selftests: add test for SVE host corruption
      commit: e0ccc45b056d626d4b271820faeedf3837337ceb

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



