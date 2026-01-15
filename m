Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEDAD41177
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vd8NBIV5k1J+ofSbtxBq3UZvFwWQdduQtXbUACB6jm8=; b=rU2bZ85WwsAsMAZenlp9PUiqC8
	5mEC6334yv1RxlorxabJ/dFLbaPqyxvSqv5esKkcG/sMPi3cFs+j0nR/LNPfzzKbYPCgdPxkaRfgO
	xQvwPuxNzm7Hr6WQuz+HjCb0gzXq08UMV/CL6BdklsVlPAhjrtbYlGH8nzCy4sJPkVXZXiyMKS+iL
	xDu/jSsHtYrTx+1QBURpeoGmXnC8b1UqJ8cimqwQr+EVBU09hzc5nu7o/TgvLpBXFGiYsBtJHvz8L
	v6Q7A5lCDBOfhfypRBRJZ1HgFcEGKx7CW7WC9K5uaVwJMQmNxd+O25/o1T8p7GT8Fq4vNYgHWGRc0
	1rtDAP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLqm-0000000CGUd-1iWw;
	Thu, 15 Jan 2026 11:49:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLqj-0000000CGUD-2UPX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EB47601AF;
	Thu, 15 Jan 2026 11:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFBCC116D0;
	Thu, 15 Jan 2026 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768477752;
	bh=b5MwZd6IEwDZvkIBVY2DBQ3kAUAx76ac/X+w5A+//CI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uBayVj/nfVUeKP5xuoOl/hqvGbfAlSTDNpCkRC4vmTamfH+4cHQXpSspH+7ClelXY
	 Kd7LCVJ2WqFtgCZDAd3oMJUnKO66tepzxTGO7MIzzY4QqQIWAAU9K0KDvLchhd4qdk
	 EYYjMgHIDjh92/oyfw4PRFEa7g9YsYx91zYivm9iEt7Sxds3GvMCSfepG/evmTjidY
	 U71xn1q85ZcC4ukEvJH0Iq8chmqWAAgAgbCV3TZtp9ALCxxfnaxAkfHTTEGIPFbVPj
	 moA1by4q7rvYqWIO9Zfx68rsh+TJFGgKgwngTBSVuZcORwQAS4tjfbMggLhq85IiHS
	 w1w0pJPZdnMHw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vgLqf-00000002VhW-35WM;
	Thu, 15 Jan 2026 11:49:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 0/6] KVM: arm64: VTCR_EL2 conversion to feature dependency framework
Date: Thu, 15 Jan 2026 11:49:06 +0000
Message-ID: <176847771285.3689365.14003323952807162943.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210173024.561160-1-maz@kernel.org>
References: <20251210173024.561160-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, alexandru.elisei@arm.com, Sascha.Bischoff@arm.com, qperret@google.com, tabba@google.com, sebastianene@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Wed, 10 Dec 2025 17:30:18 +0000, Marc Zyngier wrote:
> This is a follow-up on my VTCR_EL2 sanitisation series, with extra
> goodies, mostly as a consequence of Alexandru's patches and review.
> 
> * From [1]:
> 
>   - Added two patches fixing some FEAT_XNX issues: one dating back
>     from the hVHE introduction, and the other related to the newer
>     stuff in 6.19.
> 
> [...]

Applied to next, thanks!

[2/6] arm64: Convert ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2 to UnsignedEnum
      commit: f1640174c8a769511641bfd5b7da16c4943e2c64
[3/6] arm64: Convert VTCR_EL2 to sysreg infratructure
      commit: a035001dea37b885efb934e25057430ae1193d0a
[4/6] KVM: arm64: Account for RES1 bits in DECLARE_FEAT_MAP() and co
      commit: c259d763e6b09a463c85ff6b1d20ede92da48d24
[5/6] KVM: arm64: Convert VTCR_EL2 to config-driven sanitisation
      commit: 9d2de51825598fc8e76f596c16368362753d8021
[6/6] KVM: arm64: Honor UX/PX attributes for EL2 S1 mappings
      commit: 80cbfd7174f31010982f065e8ae73bf337992105

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



