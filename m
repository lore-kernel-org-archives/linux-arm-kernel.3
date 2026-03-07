Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53378F55105
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zBkG3bRWjfaR2r6dkEHen401YtUYDgTYZk5g8WjyLg=; b=NFiUs0M9u3XetndtBLqXPCxNzE
	lJeYpDJ8reOi1jO5jqGy6ZK2ZW+bT9Quq+yYGw6Rj6UzF+UnPm9YVfi9D1Cm02rFF0pCd9usSxxsu
	xDu9OZrwTbEORDLn4McOl1Kfy/gBMayhG9ZREWHYi7Offb9joA3LukOu8Qubf7GnoEeQonb08sH0S
	PTX3ClPPU2ARwFQ7hm5v4dWBJBO4wv8vYB/dVM8I1gqS2BMOYUj3h1jOB7B/cJ0yjdtDI+i/f3M5B
	SFneX8Yn53V3RvTNHyfsdDN3u4z0VrgwHt132sIzdgiRpMbeddkpjnqWRD3pOXKrOJEra5DpqpPlR
	erp2QZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyhB-00000005VGF-1OdJ;
	Sat, 07 Mar 2026 20:56:21 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyh7-00000005VFu-3T7g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 20:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772916973; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IY/JOUjU0BSbHYgyUE2n1iSklSZ3vUVHq/1oA0/9b1oQK7eWx4IPIxsCHBJhp9fCW1orHgLy526Yfq4eru1++JGqP3wzDYqYqHjHtkW2VsP346TiZPIZf5LVnPYxJcIwT8Y5YcU6DRiuYhjSDMJWAjVtKezhhk1L2pG8RqFE5IM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772916973; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5zBkG3bRWjfaR2r6dkEHen401YtUYDgTYZk5g8WjyLg=; 
	b=ltu7QXqkbCS6apVNzObPC3bbKgIhihcP0QfESvRyaQlj4TOAgqXwcEXmjHvCAvqBH9+NHVDbdqboS7uhcdIc0xRNuJPUCewBOPJaiZij9LQISCKCkIVtCt+YE21W1TThvMPKwrGSgxtiuruVQShecpYK3Q7TnIH01QLOa23e8gA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=valentine.burley@collabora.com;
	dmarc=pass header.from=<valentine.burley@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772916973;
	s=zohomail; d=collabora.com; i=valentine.burley@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5zBkG3bRWjfaR2r6dkEHen401YtUYDgTYZk5g8WjyLg=;
	b=hBVBPo9s5YJbTw2rBZA4HkfnRcaVB3KV8+Wa21ppW/bzc6bs1gATHfGIDDPGGv1M
	IfoS5Q44csFDMkiYbz3DUe561Heuq/Qgi3EYrj2+iKxMx4vOUVbg/jVbISfnxo+pYJk
	kRhnWDZTJUdNKh4XxZhRDez6we5/Gz53ZYZ8Y03I=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1772916971944637.5840052500968; Sat, 7 Mar 2026 12:56:11 -0800 (PST)
Date: Sat, 07 Mar 2026 21:56:11 +0100
From: Valentine Burley <valentine.burley@collabora.com>
To: "Marc Zyngier" <maz@kernel.org>
Cc: "kvmarm" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"Joey Gouly" <joey.gouly@arm.com>,
	"Suzuki K Poulose" <suzuki.poulose@arm.com>,
	"Oliver Upton" <oupton@kernel.org>,
	"Zenghui Yu" <yuzenghui@huawei.com>,
	"stable" <stable@vger.kernel.org>
Message-ID: <19cca161997.6f32ad1e5004303.2690428975656613167@collabora.com>
In-Reply-To: <20260307191151.3781182-1-maz@kernel.org>
References: <20260307191151.3781182-1-maz@kernel.org>
Subject: Re:[PATCH] KVM: arm64: vgic: Pick EOIcount deactivations from
 AP-list tail
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_125617_952390_9B4132A8 
X-CRM114-Status: GOOD (  16.52  )
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

On Sat, 07 Mar 2026 20:11:51 +0100  Marc Zyngier <maz@kernel.org> wrote
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
 > Solve this by tracking the last interrupt that made it in the LRs,
 > and start the EOIcount deactivation walk *after* that interrupt.
 > Since this only makes sense while the vcpu is loaded, stash this
 > in the per-CPU host state.
 > 
 > Huge thanks to Valentine for doing all the detective work and
 > providing an initial patch.
 > 
 > Fixes: 3cfd59f81e0f3 ("KVM: arm64: GICv3: Handle LR overflow when EOImode==0")
 > Fixes: 281c6c06e2a7b ("KVM: arm64: GICv2: Handle LR overflow when EOImode==0")
 > Reported-by: Valentine Burley <valentine.burley@collabora.com>
 > Signed-off-by: Marc Zyngier <maz@kernel.org>
 > Link: https://lore.kernel.org/r/20260307115955.369455-1-valentine.burley@collabora.com
 > Cc: stable@vger.kernel.org

Tested-by: Valentine Burley <valentine.burley@collabora.com>

Thanks a lot again for the quick fix!

Cheers,
Valentine

