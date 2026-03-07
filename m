Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC716F55104
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 21:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aV56FIn/w0hjVO78zZPuHp2/9LWepwy44VDkDoSi+RU=; b=ys2bKY8i9y/kscuMo/jOxpFSRj
	sKS/N9PlkuxlPD95S2sNG19kLlTJNGNagvRm7cEGpN00s+znKiTssYkBJmU/Xia4/IeW3IYozBMMo
	O1e5Yh/TF0OAH/FGSCTqKANZ0CjrsIzMGnYTnNl2JfNo4QNdAsStjfP5RN2m8gPBE6E+JOh/EOrC7
	SMipa9xInFbM0R1d0X4hyXkJnKaCWmam4Tn1e8YrUlsSMKWUr1w/V9FizmPbUqMBg1qYCir2FDTjE
	u455tZvA7Ta1Kg+Hcw4T4h6ntve9cAcc5lyLcKyBp3SKtR5KNeQ1A838NdmV4YmEFfQmmUwi6rSqJ
	Th5XsEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyzWO-00000005Wz9-28JW;
	Sat, 07 Mar 2026 21:49:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyzWL-00000005Wyn-3Osu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 21:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C4FB44293;
	Sat,  7 Mar 2026 21:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16919C19422;
	Sat,  7 Mar 2026 21:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772920150;
	bh=JWLxBlGMmNnVczOuCHRUgXf0FzVigXkQFSML94D6Cx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQCA5/MlBKXDR4oXT1l9H/9pTCP8+w2vPahmkWTT1tPbTrstPQnMQEQvlGG0dp13w
	 UeFQ7/Bk0n1Gi9YpGSkBsKKwEU8KJh8z+yo1tnxm6xwAPZ7hHoxmrVrRdKKf9Vk718
	 HzBWarD2cwC2F0as3IUOiRQtnxEMvkXtmTX2x+JrhNQB0SBDRJ4ep7einjzlyn/xN0
	 iLm0ye2Hy7JmIWp+BElVNKJzXUkQ/dbW6XCiI9Q6aNgtjtrxJEARCFPXuL8dOrWf4q
	 x5KvsAsYL9QM1Te8c2oEdL+TuIIamrE8558JayF2RRYzsCUl0ca1zlmHD16Ihnfq8Y
	 cemFG3saEpgRw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vyzWF-0000000HExA-36SL;
	Sat, 07 Mar 2026 21:49:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Valentine Burley <valentine.burley@collabora.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail
Date: Sat,  7 Mar 2026 21:49:02 +0000
Message-ID: <177292012643.3782537.4761110161677625245.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307191151.3781182-1-maz@kernel.org>
References: <20260307191151.3781182-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, valentine.burley@collabora.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_134913_864818_E845097B 
X-CRM114-Status: GOOD (  10.70  )
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

On Sat, 07 Mar 2026 19:11:51 +0000, Marc Zyngier wrote:
> Valentine reports that their guests fail to boot correctly, losing
> interrupts, and indicates that the wrong interrupt gets deactivated.
> 
> What happens here is that if the maintenance interrupt is slow enough
> to kick us out of the guest, extra interrupts can be activated from
> the LRs. We then exit and proceed to handle EOIcount deactivations,
> picking active interrupts from the AP list. But we start from the
> top of the list, potentially deactivating interrupts that were in
> the LRs, while EOIcount only denotes deactivation of interrupts that
> are not present in an LR.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail
      commit: 6da5e537f5afe091658e846da1949d7e557d2ade

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



