Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C02CF01821
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXLSPGp/onj4sysyPPKW43DTOT4dVsSHiXVBYXR5wyc=; b=iLxRT6lIDQEwiMJfo2439+62qX
	AcMf8b5oHojFZHZC6gLcnu8+b6SGMb4kq2ccUwt5CKOWosPRf5wGOLimBXEDarovZeurIgOLe24pz
	EkQItuYKctGGlGNBm8g5fMPI7SYeB2TRUaKmEpW/MoL1kPD5Mc+qJFe/An+/yQjt0U3KIXQduZ2yu
	lalVc+jH7ZDziv1DVm9vgJF/FiBMbfybteUEK1WGsFYdMBcIjeCIg1dGw57b9MbzE5BIW4oO6AR9s
	jqUbeAtfOIPyko3OvAcPry+Jz9XdHLOBHQytvaTb2VoV6vtSbN833Gv6UU3bbdvonTwPt+VotHfDj
	C7+ywbJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySjT-00000003V9s-0y6t;
	Fri, 06 Mar 2026 10:48:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySjR-00000003V9E-2159
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4CEE60018;
	Fri,  6 Mar 2026 10:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5877BC4CEF7;
	Fri,  6 Mar 2026 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772794112;
	bh=I4BLXGkdfGb0t5nzy1NgItpRVyXjbFiNT2NMk6LuQMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGIqvlDCiMEIfv7619WJJnEtIEznXnhubTs1Nbk1HfhkBuT8kb4XUYEK9UCTrGeIx
	 X3smIfUc0MNSq0O6S/h6OLaQGYrBarrWzisG3jyKJKUljlRdDJb2Y1CS/DgIPvn1wB
	 HJfSY6l22Lyu5FbGvcELkBnpk8BXpiM0DSpHwVwYlaIC95BDgo9KqezZ+9gI3Xk1Em
	 SmrBdnAu3sE/cubujhz6y/ZvGd9CTBJnc2sx4KxLdlURcTES/Z2XYNIb7gVQ0X8J5B
	 jYlJ9hZwgQimxCdr4/H/6l71G0xaI2O3bouTF96oMe+CG7aub5mYy+uM+z0DKZYk5i
	 diYhSt3M0D3Vw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vySjO-0000000Gnnr-2AE3;
	Fri, 06 Mar 2026 10:48:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH] KVM: arm64: Remove the redundant ISB in __kvm_at_s1e2()
Date: Fri,  6 Mar 2026 10:48:27 +0000
Message-ID: <177279406015.3200749.13428414885597289.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306074422.47694-1-zenghui.yu@linux.dev>
References: <20260306074422.47694-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com
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

On Fri, 06 Mar 2026 15:44:22 +0800, Zenghui Yu wrote:
> We already have an ISB in __kvm_at() to make the address translation result
> visible to subsequent reads of PAR_EL1. Remove the redundant one right
> after it.
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Remove the redundant ISB in __kvm_at_s1e2()
      commit: 3599c714c08c324f0fcfa392bfb857c92c575400

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



