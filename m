Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFBBCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/dEtmAwKr7ZR+4MeKQdc3RXVW7UjGf5ICaRVp/tj/E=; b=JQEDSG+rio+d04x6lDA5nkDc3Q
	Y2l8T3jgykenuMT26n32dyRYNgzB8uKJUDHHU9C3OnM+DudDoIEZ1Ef/gn4d7N7I0bBcj5RgUS/Gv
	oT+8NuKbIUUW5noFuACIcPCbs1mZD69Mt7y+mZ7+5iUdnpKrrJvpaLue17k1fEwB1F6ljy6aUoon4
	vkDJrbsB59udqbYh0LTpI7WZ3wxpcCw/En6V8haWNoeN1kVorBLDylxYI33LGyyqMxpXn+gLk0tiS
	NN5fsKLAp18hl+a4xBt88SugKLHEg0pZk3qlm2lH0NkbgVnmais+qDWCXFSomUDSRTKl4qpXtJiN8
	s/ioOFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQZg-00000002QQx-1Nyu;
	Wed, 07 Oct 2026 12:16:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQZd-00000002QQR-0JRl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 12:16:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF94F40B95;
	Wed,  7 Oct 2026 12:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16731F0089B;
	Wed,  7 Oct 2026 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791375400;
	bh=3/dEtmAwKr7ZR+4MeKQdc3RXVW7UjGf5ICaRVp/tj/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FDpQx/oQpMsMNBcFozRTE9j18Y8+LtZvEx+RvXAloudQWUXoyIC54g4fa6GqrchtA
	 /NgtwQalk8mSo0f+Zxykozo/txYdFwePH8tErTcMftJvaYP6Blh19Q9yseCT86vpPW
	 ZHqzmmKhJru5DeLyVg6YPSXYt1Hsrkwnriaqlc8NZAi44H7ssDwftCO1XHfvjAnl37
	 nLUJ+m1S1WBh4PpOvBnVA73Ef8of1GnR68KgngzIz30ZfzFol6VuWIltzaVJTqdzgc
	 M6Rym7XMPww2XXzEaNIqrhJPmFafof3iW4w7HHf/EjAW0FloKoLZRKqJjVDiSH04HX
	 Arv6sT0sIe4Ww==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xEQZa-00000000GHs-2b0w;
	Wed, 07 Oct 2026 12:16:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	vdonnefort@google.com,
	qperret@google.com
Subject: Re: [PATCH v4] KVM: arm64: selftests: Check the pending SError state in external_aborts
Date: Wed,  7 Oct 2026 13:16:34 +0100
Message-ID: <179137539018.699295.11516742459649413558.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006092841.2202109-1-fuad.tabba@linux.dev>
References: <20261006092841.2202109-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, vdonnefort@google.com, qperret@google.com
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

On Tue, 06 Oct 2026 10:28:41 +0100, Fuad Tabba wrote:
> None of the external abort tests look at the vCPU events once the guest
> is done, so an SError left pending after the guest took it, or dropped
> while the guest had it masked, goes unnoticed.
> 
> Read the vCPU events back at the end of every test that runs the guest.
> The SError must still be pending in the masked case, with the injected
> ESR when the vCPU has RAS, and no SError, injected or spurious, may be
> pending in any of the others.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: selftests: Check the pending SError state in external_aborts
      commit: 49664cd0b1db434b6bbf9e37c84b3f448a545dc5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



