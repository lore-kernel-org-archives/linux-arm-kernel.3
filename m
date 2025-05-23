Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C9AC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 12:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=788C6AM16+RO/cYywCWLAznLOjBQMBMvOvdVttkXvAw=; b=OVx7tE5gVokMISJ7yQ3V5DsbDX
	4OaGUTNNf39pukJ26Q02/O1xGAmtNuN4Pr2fhxqHmzJc9J4X/iWZL4L7Au8tNBTXWadEWrylkzKrf
	7XQIqAXJbH3wOEA38MVxjjfUxT3p/oBZAd+NC1JeaTPCTAiU6V6WP4oSAZajhnHYhEpNEDYbS5Erf
	70f5WEt5JHks5GC0yObA6wZM/gAg720VshEDlirt3toLccAGX70J0D5RjH0xie+ne5MQO52BQx/wt
	J2OrvjxgxCyk3dygKvvDUwDoCxCiD39Isf4cQRVc/cThvxQb4RFQPIbdru5WCxUMrPmIV6+rryTVI
	DkRjFrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRCL-00000003m7G-3W3q;
	Fri, 23 May 2025 12:08:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ9h-00000003fDN-2RY1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 11:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=788C6AM16+RO/cYywCWLAznLOjBQMBMvOvdVttkXvAw=; b=KHs5NjUs5b8H9OCOII/8m8PCFd
	S2yU4bp7SHnrqrvN9RHvHbRyVP2elA7qPQ1DtY0nQ/mwmwg5224lKDScMNZKktfW34DTCdAeldbWI
	LjgMOSwIJkdsixVLjT9PpiQfdQgkrlm6zuBW0IJgyXx4Q7xqrJfUr6RqdPDKXqO4fovU/8VTcF1zJ
	qa/g+Gn6VIqr0VGv7ziEhyJspDDmjSnN6TaQaGfUFsFPdzc8CV2JLv0ubtGjy0pBfEiKtkZACGJiP
	qS8DBDWxCYi70iiy9iNlLo6OVnTx3kmrS0wbe5cv8zt0ZOgW1pd27svQiKsjunBAhwrcolQd6eofK
	iMIzqVig==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIQ9e-00000001HTA-1itz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 11:01:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1D4A5C70F7;
	Fri, 23 May 2025 10:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CD4C4CEEA;
	Fri, 23 May 2025 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747998090;
	bh=9loMDs0wNC/4CPZhZBtMbb/MHaiUqpZY4NUO5J6p9hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=azERMFURc2zj0S9nkfN3BwfhmkzPD2mjGXbz09oWMrdp45wveeRoLUdp3O+mfAOQ0
	 MoMuLbDm+erizFRZByCx3qmGuqOCeBHbEx+dOY16TvaeDOgF+EsZr80bQlYcI41OV1
	 ejYqdvD7UNgG1sel7m5mSOaUwlREkBMqNSsrS4WHra9moGxWdN0NkOP8iX+9QrJ+eW
	 0oL9RUrcMLeVHeYV6EKTIFgg6UhNfn8e+ShLjEfOKSG5E5SRdunFHbd+3463uQnYqq
	 sZPiSIAPv1XujFexFOFdMnJ8GbyWbV/hDfdGmbsZZ98miGy8h9W3QHgt5dbnEba/wZ
	 Z2APcVvApywiQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uIQ9Y-00HYcR-Kq;
	Fri, 23 May 2025 12:01:28 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: nv: Release faulted-in VNCR page from mmu_lock critical section
Date: Fri, 23 May 2025 12:01:13 +0100
Message-Id: <174799806251.145825.13963857244128795511.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250521110435.66273-1-maz@kernel.org>
References: <20250521110435.66273-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_120134_665033_8CBFD1E8 
X-CRM114-Status: UNSURE (   8.46  )
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

On Wed, 21 May 2025 12:04:35 +0100, Marc Zyngier wrote:
> The conversion to kvm_release_faultin_page() missed the requirement
> for this to be called within a critical section with mmu_lock held
> for write. Move this call up to satisfy this requirement.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: nv: Release faulted-in VNCR page from mmu_lock critical section
      commit: 538fbac74019c13dac341b20fbcc1e96c9a8d01e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



