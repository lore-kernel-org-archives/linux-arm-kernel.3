Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B04C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTWLYjdgbzHqJpZ1UgqhE3ddioxPi+X5APCbgrRIKAM=; b=tYIHevCpFYoyWAO0Lnbsf9xMHs
	b3Soj/Oea5ayy/VJRboFlqqBJmdzEeD6LCvgDR2dOkKyP9vrJcp080CM9VvBJ6uHc0IZp9mnPWUjM
	uxlfdk9PsEylAH8jrGNJdiceM6qoK4FXBq5w3ifia3ohkmHdGZgQ2+hs9+TTDMHs1CPzPkGsvhhDn
	HbDnra5SLJtzkGkK8iPQ2MfmukO7bU7nIb8EXJgeyjjYfcuShyQqDsFREJAl99zorHU/rdWrUcaW/
	obFMlfdl6mMRs3cz2F2fSy2ID4+zxclEKVk2hooGMpQyMv2qvV8HFO58RiqRzQqJuoELgsQ2HUMzk
	5NSStDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBVT-000000052GU-14uQ;
	Fri, 10 Jul 2026 13:43:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBVQ-000000052F9-39cs;
	Fri, 10 Jul 2026 13:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VTWLYjdgbzHqJpZ1UgqhE3ddioxPi+X5APCbgrRIKAM=; b=MU+fLHrCTy5vRdOMD9FH3w2RGN
	hECCq8uevcPfomhKkp9eRAadvXsDVWPPbK/nRKSMYi99uhcRuaO9qpkdlYA4eJHrJpDQEeGXWQtAf
	gXhGEed22qTptnsXusJbntmkMNb6zkBLm/UygpjYHgAmU/qEYlztvwlSNLBqBG0cRBSBVRf+7r9gK
	S12opPlv+soMAE+FLbnx7UbO8aOa4BGcyAVp+uhd6L6Lm6/NVahgQhhqLENxKnkICszFNhp89qeYk
	/3J+l3LlhzCXxlj+jl6yTt888um3CCDdSh9zlfzJK9IRa64JVv0I+eY+jljXzjAE+uqfNT+5NqYFS
	jIZU4AKw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Will Deacon <will@kernel.org>, Jiaxing Hu <huhuvmb88@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/rockchip: implement .flush_iotlb_all
Date: Fri, 10 Jul 2026 15:42:46 +0200
Message-ID: <12654012.zAa99ISigo@diego>
In-Reply-To: <20260710111508.917486-1-huhuvmb88@gmail.com>
References: <20260710060513.863714-1-huhuvmb88@gmail.com>
 <20260710111508.917486-1-huhuvmb88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_064304_864187_1B9BB1EE 
X-CRM114-Status: GOOD (  16.34  )
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

Hi,

Am Freitag, 10. Juli 2026, 13:15:08 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Jiaxing Hu:
> On Fri, 10 Jul 2026, Will Deacon wrote:
> > So I think this is the wrong direction. We should try harder to remove
> > the function rather than add new implementations of it. I'm assuming
> > you're only adding it for some out-of-tree code that calls it?
>=20
> Yes, that's right. The only caller is the out-of-tree RK3576 NPU
> (accel/rocket) bring-up I mentioned in the commit message. There's no
> in-tree rk_iommu user, since the in-tree consumers all invalidate through
> .unmap and none of them call iommu_flush_iotlb_all().

accel/rocket is in mainline, so I guess the interesting question is, why
are you expecting your changes to be (stay?) out of tree?

When you show your changes - even as a RFC - on the lists you might get
helpful comments - like the ones here for the iommu change.
That might also prevent you from going too far in a suboptimal direction
and thus could save time.

Additionally, you would show you're working on that, so that could
prevent someone else starting a duplicate of your work -  or at least
pool resources.

There are a bunch of people working on the RK3576 for different projects
so there is a pretty high chance of getting valuable feedback.
(like what happened with this patch ;-) )


Heiko




