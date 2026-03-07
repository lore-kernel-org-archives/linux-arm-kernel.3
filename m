Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32945F55103
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 18:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otNb12BkuMueEPdITPyW6N2Bsr+BtWR55FBBzFloQOw=; b=w4jQ24JCjxvFHIrwWp0odIdch3
	MFjMk9a1xOhFoXNZDZabinDFvv1mZ4x6shp2wm06lMNMr8A6uFHll6iQGfKHliW/xD3oV0ngPt5+a
	6ujlVfRGAAIlxElNlXSKEsbrRu+4jUogTMRFZeYnfuinF0KjfbYh90BfVIIoHk3dcS1lUSv4LtBjL
	k2Hh4q85GNtSCjQoR6FLtww1ziK58lxBHrMgoLRJAfkzyIxJiycuZFRjr6tl8yvbfUP7MkgkcLnMG
	k9GAPmBosa7Ty4fSifDHCJhNvkfg2FC3kbeLp+jSY/TGy8WPckmkdYfEy2blr61kTaWacSWnEvX5e
	ONv8cd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vywOq-00000005Qf0-0JFc;
	Sat, 07 Mar 2026 18:29:16 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vywOn-00000005Qef-20Ig
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 18:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772908147; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GsdMfGCfoLoSf6FDErk0QF9+yrbJ4gjm2iXg9rKJxwKsxZsIfwyKes6Z8HVi93mWTCtzw1HI5zmbCj85Me4AViOL2e7blEDnfxYnov/HcFvnWPIfj7Vj5kwawDsVdgQNgBegNl3ljPqglaR+T8YLYYthJxov/W5qTX4Nh0SLDug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772908147; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=otNb12BkuMueEPdITPyW6N2Bsr+BtWR55FBBzFloQOw=; 
	b=KcPvHuWovV2BH7dgtj7hy3SSTGvIllj9yDm46s3ohzY4NSnv3ABfUtNjdcuA6RNegUvriuPCk1ZUkJUftS9STfKQzh0CC+N+YiEideMV3bNCerS8wnMLcdo1bigzN/YUkXXvBMxX+rAFXL2HkONV4hWl/WH33BvghiF1vvakvdA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=valentine.burley@collabora.com;
	dmarc=pass header.from=<valentine.burley@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772908147;
	s=zohomail; d=collabora.com; i=valentine.burley@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=otNb12BkuMueEPdITPyW6N2Bsr+BtWR55FBBzFloQOw=;
	b=d/qfmH4GoZ+5Bgd+uq1JU/lSAY8AYqx2XMxE6jZLgdHg6Fsin9gG7o4O11WXCbR8
	Y0JyPrQ3ytC1DCyBevcHFCxbUXQTr5vSxPcwG/iVJPo4ClDjCtOhp93dCUDP5wseIBs
	BN4Ozs7WQj+5kLftUvd+p90Y+FfUZBCZB30ZQKek=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1772908145625135.82383304834843; Sat, 7 Mar 2026 10:29:05 -0800 (PST)
Date: Sat, 07 Mar 2026 19:29:05 +0100
From: Valentine Burley <valentine.burley@collabora.com>
To: "Marc Zyngier" <maz@kernel.org>
Cc: "tabba" <tabba@google.com>, "broonie" <broonie@kernel.org>,
	"stable" <stable@vger.kernel.org>, "oupton" <oupton@kernel.org>,
	"joey.gouly" <joey.gouly@arm.com>,
	"suzuki.poulose" <suzuki.poulose@arm.com>,
	"yuzenghui" <yuzenghui@huawei.com>,
	"catalin.marinas" <catalin.marinas@arm.com>,
	"will" <will@kernel.org>,
	"Sascha.Bischoff" <Sascha.Bischoff@arm.com>,
	"sebott" <sebott@redhat.com>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm" <kvmarm@lists.linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19cc98f6bc6.30a0020a4990004.9101239855762576863@collabora.com>
In-Reply-To: <871phveh17.wl-maz@kernel.org>
References: <20260307115955.369455-1-valentine.burley@collabora.com> <871phveh17.wl-maz@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Skip interrupts in LRs during EOIcount
 replay
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_102913_602949_5FDEA26A 
X-CRM114-Status: GOOD (  16.47  )
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

Hi Marc,

Thanks a lot for your reply.

On Sat, 07 Mar 2026 17:33:08 +0100  Marc Zyngier <maz@kernel.org> wrote
 > I can't reproduce it locally, but in a crap integration, where the GIC
 > is clocked at a few dozen MHz, this is far more likely to happen. I
 > should dig that Lazor out of the bin and put it back in the test rig.
 > 
 > In retrospect, it is obvious. I just couldn't see it until then. Many
 > thanks for going the extra mile and pointing out the core issue.

Appreciate the clarification!

We also have a few Lazor boards in our CI, and the Trogdors are indeed
legendary for hitting all kinds of edge cases.

<snip>

 > Could you please give the hack below a go on your setup? It seems to
 > work for me, but given that I never observed the issue the first
 > place...

I've tested this on my sc7180 Trogdor setup, and it completely 
resolves the issue. The Cuttlefish VM now boots reliably.

Tested-by: Valentine Burley <valentine.burley@collabora.com>

Many thanks for the quick solution!

Best regards,
Valentine

