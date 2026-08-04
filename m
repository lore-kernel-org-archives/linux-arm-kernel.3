Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB5BC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1XdpXzCqeMfT3gx1+GfQWAVnbTVzSRrQini9XusnHU=; b=pbfkcm6aOXGRvpPBedYTPy3W6d
	bCWgGrmOg1MMeh+ePS0zJ5M6w6dE64is+yU3r5K/DD6HEdOOLWA2pImQ2O64s8/Zbe5JJfggXMroa
	DiQfHlC/u5RfBOZd8/gzxWL54nTdIy0ZpP3TCH0DInogxqUOpHKoQ+ZYpgBvtYO2pLwKyrZnu8DKg
	9QYzuxcowijP+gX2Y2ef2cgyOPyqVpVk7OVJRq7/0RJYMnPQ/s+Ts+mliVSc0T6MFpSKKev3M384P
	mrhVnv9rz64PSN1bI6Lyknxmrr53mXAg20yuATNwFUKFf08jUkJdAva7A9bP98kKKrhdNIhAQPLPY
	btL7vQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE9b-00000001nsm-1di0;
	Tue, 04 Aug 2026 12:21:55 +0000
Received: from out-167.mta1.migadu.com ([95.215.58.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrE9Y-00000001nre-1qst
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:21:53 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrS4bsgMjFJOba+qwD/QyUaGA/Kv3r0zJ80gxyJtq89DIfbO4NlDau3/JVyQRhPXBLVv5dxYryHUlpNclxx6ZZA@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785846109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K1XdpXzCqeMfT3gx1+GfQWAVnbTVzSRrQini9XusnHU=;
	b=tb/UwU+JMSkIH7qkYojH3enT1P5+oKROCD7UJqlIHOnoXAPuvOqYWTpH1FoLA6glGN2Ipc
	ab7xsjflw2cXjO20YuegD+KrNvFjPocX2YEixLpxTkkDmXIp2bE2iIQbp58htQlXINA0vS
	CjScit8cYmgrpD9Qm7dvuMlkCE2TcFM=
X-Gm-Message-State: AOJu0YwuXSg/G5w/45p8YhHbJMBwTUSjkICCiWY6Y930r3dEbn0xRrY1
	c6Uj/meJNKc6HCG1o2WeevMLWZlGglGZHCg3umUImKFEYqfDjF5R/4DGIYJSZzNsHWZDtO6Lq9o
	2PoNxcBY+4hANKnEZaz+dDQVQxwp65MgnaQdCAhr5
X-Received: by 2002:a05:622a:8349:b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-52ce3f3c749mr201921cf.3.1785846085744; Tue, 04 Aug 2026
 05:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260715142841.80544-1-steven.price@arm.com> <20260715142841.80544-16-steven.price@arm.com>
 <865x1rcvfw.wl-maz@kernel.org> <f971d029-84d9-4c66-9875-36fa8f1a2a1b@arm.com>
 <86zez3b6ps.wl-maz@kernel.org> <7beafe29-0c5e-418b-8797-190f1850b18a@arm.com>
In-Reply-To: <7beafe29-0c5e-418b-8797-190f1850b18a@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 4 Aug 2026 13:20:48 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx751071VhZPf6ABaZngTqOdPG+_aVLCTct_G_ksfYviA@mail.gmail.com>
X-Gm-Features: AUfX_mxGnxORLKO8iAowkYu9tpNhSCXZ535sQNq-ffLHKfhzkRZPZxsKS-feAzQ
Message-ID: <CA+EHjTx751071VhZPf6ABaZngTqOdPG+_aVLCTct_G_ksfYviA@mail.gmail.com>
Subject: Re: [PATCH v15 15/37] KVM: arm64: CCA: Handle RMI_EXIT_RIPAS_CHANGE
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_052152_615613_5BF4CF03 
X-CRM114-Status: GOOD (  14.72  )
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

Hi Suzuki,

+ Quentin (who's on leave, but for when he gets back)

On Mon, 3 Aug 2026 at 16:30, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
...
> > I.e don't hack into the API. Use the information you already have to
> > decide whether you need to use the existing API at all.
> >
> > If that cannot be done for whatever reason, then you need to indirect
> > the call with a set of operations that leave the existing code
> > untouched.
>
> Please let us know if you think we need to explore this ^ ?

FWIW, pKVM already has this kind of indirection: in protected mode,
the kvm_pgtable_stage2_* calls in mmu.c dispatch to the
pkvm_pgtable_stage2_* wrappers through KVM_PGT_FN(), and the callers
don't branch. It is global today because pKVM owns the whole host, but
a per-VM version would let the CCA backend handle the filter and the
IPA aliasing internally, keeping __unmap_stage2_range()'s signature
intact. That should work for pKVM as well.

Cheers,
/fuad

