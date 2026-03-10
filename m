Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D89EB1040
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXSLHFTDe/z9HdL+15JiLmPPZjdjwbNvabjtjXjKC3s=; b=ZkKY49IhxGqDMZt8HqenK9iqW7
	NJKm66sgI2fi0LDyzqkOCvQYoic6geuDUDTCQM4uWiOHijNIATcC8SHvvrpuV5/aE3KzIXlS9nU3Z
	n7+D2M+65L73D1n9M1sQderLR8rIqARmuI8DMkC1ZzWcf2LZlnT7atTX9NJ355gJKvScT+K3M1eDa
	/yHCpKN3FGQiYIdRvVKXeh50bgVMpIWdee5FYCWq71d0W0dVcI2emekSlU/0ABdFLXTSckliYfBdN
	yXmIdiFH0KdAAh6luIc7wvnibxoh1gVoTpPvagxHYsJXI2stJLhlurhN6T0r5AOufjXEiHNQjzSOq
	2OA526lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzu9q-00000009B6W-2lD3;
	Tue, 10 Mar 2026 10:17:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzu9p-00000009B67-0QzA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 10:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5661E41914;
	Tue, 10 Mar 2026 10:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADDCC19423;
	Tue, 10 Mar 2026 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773137864;
	bh=Qxw/VILjMxL5tYwGisG8wNcvLEzrIZL+mg/GMioXi5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RsGrawZXNEdMQp+PaZuDU43zWRxHbjZ8j6fyiolG3EvTxY3PQSyWwM0w62zV9iLHq
	 k1P/46kZ7BTR61yQovXhshPxdztGJv00n/T9XbM3Ziyvy1TMfN+jB5fHKtUfOwcVM6
	 DVRRd3Wl7JfjXQJjGQ/j4Aa4q7LSH+TvZg81ckMYk8hAcIzAk6i+QsjlrGDTK9IMY9
	 NtbAW5w9dkgQKzEfJHyZxmKFG0lC3Ybb6/0GyEHhVzsg6bx0NaHEgd2L7BVlUFcwy2
	 pzTHWdWo/TrJ0i4LyxTabPS9KMsMUY97/h84+qNLVofeY2kawD96kic6GFe16Mo0i0
	 nd7Rh/QmF03xg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vzu9m-00000000NyC-04GK;
	Tue, 10 Mar 2026 10:17:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug
Date: Tue, 10 Mar 2026 10:17:39 +0000
Message-ID: <177313784323.3940002.13678040844049570488.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310085433.3936742-1-maz@kernel.org>
References: <20260310085433.3936742-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com, qperret@google.com, tabba@google.com, vdonnefort@google.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_031745_165050_A7CFA565 
X-CRM114-Status: GOOD (  11.05  )
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

On Tue, 10 Mar 2026 08:54:33 +0000, Marc Zyngier wrote:
> Hotplugging a CPU off and back on fails with pKVM, as we try to
> probe for ICH_VTR_EL2.TDS. In a non-VHE setup, this is achieved
> by using an EL2 stub helper. However, the stubs are out of reach
> once pKVM has deprivileged the kernel. The CPU never boots.
> 
> Since pKVM doesn't allow late onlining of CPUs, we can detect
> that protected mode is enforced early on, and return the current
> state of the capability.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on CPU hotplug
      commit: a79f7b4aeb8e7562cd6dbf9c223e2c2a04b1a85f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



