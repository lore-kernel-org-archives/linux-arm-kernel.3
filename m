Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B206E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+j5h+YkJ7i2HP+NZ7UjemPCcM3A8fRFb8TQtxZtE+k=; b=QnrGcBwkB4Gm2mxNVE7dZhz2Qp
	XRrlejvwmxbWxw/6XzZadjhVCU+A4HcnB3JqoQwWNaiCd+estFY45sFVdi7uonvfrL9T5LyaGO+PK
	N839MiMHxKFWGjTXzKdO9eH+1f5/3IX015WM1TCjv6f2FsT+TshpkVdpmlu63sAT7+F0CHl03/1GH
	boVTMma8FZFy3RPoMiqZjMSVsOAZgu2CpYxG6qq7J6zcaZJGKtMhLsIpm6yeu19H3QU9QcA1wBB8g
	GsFSQfJmganAcsK+SLseCX5TXmnRptYhRJlUzswZtKi2k+Nr9L2SbELG/V1R7Sdxn4zTR/+F8KdJ9
	/dBvsI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWd1d-00000000xbY-4AG1;
	Sat, 11 Jan 2025 15:03:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWd0R-00000000xUj-1H0a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 15:02:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB2045C481A;
	Sat, 11 Jan 2025 15:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC61C4CED2;
	Sat, 11 Jan 2025 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736607750;
	bh=7lwQfD6yq/o36zvjpn1IVBMjoiNqqFbRoqIKQisG5CE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FlCUxOW5iwaxmJzmOHL//fCfotRXp1y6qS72ZkHgufM1LwU6zJHYZU0d6dUJeJYh7
	 LNAewkX6CBBlWGQe2t6c6SUvhCDSEaMLQztGpi2tnq21/TSqQEB7uxtLMMPwQ5qBp+
	 kGBdWWVBxzY/5+NPfA0kKh9kH43CA4VlpaZ+wr/DmDaK604yVU6SZTF0t2G1HXmrUE
	 lKdxy6u1kQ4qa9WT8xaaPnWlUMAizMaSDNa37sRRCUPDz0PdyQHDQta635sROZp0X7
	 dTnr8PwKYMHMm5MrNwsrYdmvdiQ6nua/XNnjDDny3bKiu95o+qHbqKg4EdLae1LL1T
	 KBoC062f8EkWw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tWd0O-00BBeR-71;
	Sat, 11 Jan 2025 15:02:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Ott <sebott@redhat.com>,
	Fuad Tabba <tabba@google.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic: Use str_enabled_disabled() in vgic_v3_probe()
Date: Sat, 11 Jan 2025 15:02:24 +0000
Message-Id: <173660773860.818546.5098329135149930806.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250110225310.369980-2-thorsten.blum@linux.dev>
References: <20250110225310.369980-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, sebott@redhat.com, tabba@google.com, thorsten.blum@linux.dev, christophe.jaillet@wanadoo.fr, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_070231_388011_43E4EE2F 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri, 10 Jan 2025 23:53:09 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: vgic: Use str_enabled_disabled() in vgic_v3_probe()
      commit: dea8838128c580cc6b563c901576b580f93a703e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



