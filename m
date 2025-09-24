Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C687CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 18:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNSZoFZNDR80URdz36YBIJ5OBNfDxN1RufFh7l+ri0I=; b=HPZdufd+AwFPZinYyJG3lFlqRL
	Sos7mxKhT41FbtzbtrP/42V+JSCUyTWha32bwDzY73Yq4OybCP226EI8NTwTpLyemiCK1rgViADga
	sBW+mZBjZ0X83eLiBLpXnw/kbFTuSjxR97M5jV/OZx50WZTSJ5rn93j8q7CJNE8ifoB3FIBX1VUuY
	n6C5PDtFCsPqJj/xIZzB3OflJDy5EG03WoHobHF4wsy0jQ3J7e2lvaiWnsAumsVmt1VS/kvaBpcBU
	VosX2kYf9nwDwGmvsCd2EI3k1p7P1/cUPIt1GlOHFoQX1Pefid+CjXyVcqibdClVQU1/O+uaN1zjn
	qtlWBHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UNv-00000002hIu-0Ium;
	Wed, 24 Sep 2025 18:38:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UNr-00000002hFn-2fiQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 18:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9669A40964;
	Wed, 24 Sep 2025 18:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2A1C4CEE7;
	Wed, 24 Sep 2025 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758739110;
	bh=JIUwIwvyK28kGXsFjmWwmTqUM0qtgo11UVD4GpXU9DU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QS4gQZ2ut/p5CX+SDw9+RK/9FA9j4cDOup/uPL78PwlLRA+8Az8iC5ktHnQ6FenUz
	 n9UEmWIomcmPGbVdGsDQO33pNlFPpPll8WC51BqC6C7pjq2IY4NqJw1crh2kh5aaIO
	 DYr/7zLh7ZcCFb6xIkYIk/Pl9m1DBiUt2K7bz2x1h+Lr7rFiYEl0BCOHQAvzVyf8QS
	 D/+IshKU7j/9s7SU3sCmrYQuAlZwVuP/YgQMoJVOSd5m4hn6UcKxwACPBm7dhtxDMr
	 DdlavpKVCrxuFSllGp4YSkc0JTIhfaRkBLVUd1e6GgimrNbNOerkrcgJDg7raOlJbL
	 IsVVZwk5NrL9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v1UNo-000000097OU-0ZEg;
	Wed, 24 Sep 2025 18:38:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: selftests: Cover ID_AA64ISAR3_EL1 in set_id_regs
Date: Wed, 24 Sep 2025 19:38:24 +0100
Message-ID: <175873910389.2373233.15017711229799268342.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
References: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, pbonzini@redhat.com, shuah@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_113831_695887_A84D18D3 
X-CRM114-Status: UNSURE (   9.71  )
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

On Sat, 20 Sep 2025 20:51:58 +0100, Mark Brown wrote:
> The set_id_regs selftest lacks coverag for ID_AA64ISR3_EL1 which has
> several features exposed to KVM guests in it.  Add coverage, and while
> we're here adjust the test to improve maintainability a bit.
> 
> The test will fail without the recently applied change adding FEAT_LSFE:
> 
>    https://lore.kernel.org/r/175829303126.1764550.939188785634158487.b4-ty@kernel.org
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: selftests: Remove a duplicate register listing in set_id_regs
      commit: 5a070fc376babc7efdc8288b97431e43e18f4646
[2/2] KVM: arm64: selftests: Cover ID_AA64ISAR3_EL1 in set_id_regs
      commit: b02a2c060b657296c080cff1b54ee4e9e650811c

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



