Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9594CC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbBz6UOMJpiAg21QC6WCb59iTGSeHK+XaQZanHQt5+8=; b=XydPsSSfnKCMg5cUujDm/9rtTn
	r345leS/vp5/BGheMPeEkV/mZ2kCyG9Dmx8DebSwXUK0Y6wZBGKT2AQSZM2lv3t83lWuyfIQ5S9ZM
	No2RGyXA4qZ5kM+eojIuAMQImwEAfqJfC75JMfs9WSuA3EgB4IdvnGUhy3t5hjTVgQJygVldwowqh
	pmO8k+7yL6uRJJHpf8TbrRd+osl1yB5PEdT7oVVXKm4oki7EHsV8MlU8u2V+Sd8MQzW0gPwldquR+
	8zI6ru9nr8pmo36QcqCDcwR5se5DW2e292jQ7oVjBEge3gA0sO1lV8+rsm6AHBkNruHpCJu9Sf2f4
	Y6tnZMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYhE-00000005Yet-16Sp;
	Wed, 21 Jan 2026 13:56:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYhA-00000005YeQ-2zQb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 13:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA3D844068;
	Wed, 21 Jan 2026 13:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6934CC4CEF1;
	Wed, 21 Jan 2026 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769003787;
	bh=lbBz6UOMJpiAg21QC6WCb59iTGSeHK+XaQZanHQt5+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7BMdWsscuprZQVqjgOlNMHQ95GLHAGfSruDk8Hm1EMwxIKP96InkuM3UMB7u5rYV
	 HmvbfCjC3dF3OtyAqUAGXRrOEG+6qNhEap/BNJSlBkGCK4BHHWr9hqNpbxq+i6IO0T
	 2ihErp/aMr/i01amz4uGoEOIRafJCwUjPZiVZSYo/r3Sp++Ui8WJJsESZqSn4SxkdN
	 JhO7HLuehfbTUyTtffFTnlW4eHwvTQANZr0qQrnavK1cDJa6e27sMJdmuGVwAGVsMN
	 ReeS9iIu+0tK0KErkKI0/LYvUkmH2uwk2TY/Oca1gdt6kwb5t7T3NWjrgzaMam25hx
	 0bNTu3WicJiGA==
Date: Wed, 21 Jan 2026 13:56:20 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	catalin.marinas@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
	miko.lenczewski@arm.com, kevin.brodsky@arm.com, ardb@kernel.org,
	suzuki.poulose@arm.com, lpieralisi@kernel.org,
	yangyicong@hisilicon.com, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 9/9] arm64: armv8_deprecated: apply FEAT_LSUI
 for swpX emulation.
Message-ID: <aXDbBKhE1SdCW6q4@willie-the-truck>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-10-yeoreum.yun@arm.com>
 <86ms3knl6s.wl-maz@kernel.org>
 <aT/bNLQyKcrAZ6Fb@e129823.arm.com>
 <aW5O714hfl7DCl04@willie-the-truck>
 <aW6w6+B21NbUuszA@e129823.arm.com>
 <aW9O6R7v-ybhrm66@J2N7QTR9R3>
 <aW9T5b+Y2b2JOZHk@e129823.arm.com>
 <aW9sBkUVnpAkPkxN@willie-the-truck>
 <aW/Ck3M3Xg02DpQX@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW/Ck3M3Xg02DpQX@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_055628_868177_DEF8766C 
X-CRM114-Status: GOOD (  13.48  )
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

On Tue, Jan 20, 2026 at 05:59:47PM +0000, Yeoreum Yun wrote:
> On second thought, while a CPU that implements LSUI is unlikely to
> support AArch32 compatibility,
> I don't think LSUI requires the absence of AArch32.
> These two are independent features (and in fact our FVP reports/supports both).

Did you have to configure the FVP specially for this or that a "default"
configuration?

> Given that, I'm not sure a WARN is really necessary.
> Would it be sufficient to just drop the patch for swpX instead?

Given that the whole point of LSUI is to remove the PAN toggling, I think
we should make an effort to make sure that we don't retain PAN toggling
paths at runtime that could potentially be targetted by attackers. If we
drop the SWP emulation patch and then see that we have AArch32 at runtime,
we should forcefully disable the SWP emulation but, since we don't actually
think we're going to see this in practice, the WARN seemed simpler.

Will

