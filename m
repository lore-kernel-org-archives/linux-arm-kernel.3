Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070A4C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55QsVB1CWAv02YXQ0txILTMB68WgGo9Gi2xLiky7jSI=; b=Hj9r80OoAE0EzZ/ChkMNWy7nem
	CKJ5IaQOiSzJU1bS6jMCIweTV7sh7qoa0MPisI2telj/6GjLDXbGlI/kBGTUf3sZXQX8A7b1QgeBN
	YITHs25POUfrT55PoGSoKooDsBlgJZXoMNTg792X6bVzll2VYCgzga04sHMZlZ7E9m/GApm0bNoVt
	X/eDrLodz7Wl+shnYAbJsybLPqh8CTOpx1r5Hw0rXfyHeTWLatqYRZDc1oxGnEQad68mw4OJ17Rcu
	0XvabfnolozB9ySJClcnTY55smru5tZG7AJe0KOeW4erYLvqdWiTBG5J8Dgh1/rDTTu09z+1ox1Zu
	6Gi0Z4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmrO-0000000HE2T-3uVA;
	Tue, 29 Jul 2025 16:07:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmWi-0000000HAyT-0RhL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1EEC44D8C;
	Tue, 29 Jul 2025 15:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8581C4CEEF;
	Tue, 29 Jul 2025 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753803962;
	bh=4YBP7bjTmcEyufPY9qHcuguK4GFCavlwRWIMbl06Fws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhtoCGBap7n8cNG4zP6qLlRI20uQk5TgWxoGGHrnY5t4jncdHWAnQhas2rIbNv2fI
	 /qTDwZWbw7Y1C22F4eJX8mx1Zl6dGXY3TbCEy4cNgEkrsQIztDR/tUdHt4bGyfhXWp
	 oS3DhCkMamKECE3hWtgNzznDphfwhoFls/h+BOeeO/lptpwkx8nTjJzqJ7uIiqNWec
	 E5CssrhjQeOLeBS8p+HApEEZ4nutWdGXIiUgpAduDD/m0xIMJ1yp0LR2RqccN2rgye
	 tJh7IGVHqcTfs5soP4Gb9Sp/HyMLfWF4nvpWgfs9/RfRrEHn06XvZdDnC/MN5kGjnJ
	 MITaUJ7vPj0OQ==
Date: Tue, 29 Jul 2025 16:45:56 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v8 4/7] KVM: arm64: Mark optional FF-A 1.2 interfaces as
 unsupported
Message-ID: <aIjstHFfEoSqEy0F@willie-the-truck>
References: <20250719-virtio-msg-ffa-v8-0-03e8e8dbe856@google.com>
 <20250719-virtio-msg-ffa-v8-4-03e8e8dbe856@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719-virtio-msg-ffa-v8-4-03e8e8dbe856@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_084604_163733_DA6FB4B6 
X-CRM114-Status: UNSURE (   9.48  )
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

On Sat, Jul 19, 2025 at 02:11:26AM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> Update ffa_call_supported to mark FF-A 1.2 interfaces as unsupported
> lest they get forwarded. FFA_MSG_SEND_DIRECT_REQ2 is not marked as
> unsupported because a later patch in this series adds support.

Please add it as unsupported as well. Then the subsequent patch which
adds support can remove it again, that way the series is bisectable and
if (for some reason) only this patch gets backported then it won't
cause any problems.

Will

