Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9664C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D8QP+kbZpQDntP1Tn0kRj3eRn2VrXYnQZO0ZaU5rhW8=; b=rvf3msA0EsmgXhV9AUPv1TlLmW
	MSL4mjsVROqzDtXdHRkMVWQ7lopJuRsS3WDhQfhq5y35HY95wg6iGkOppH/w82VUQiZtMBlDg3dqC
	6V6Ljt5K7iAcJ63ijOO1H3x4vYMso92oLdtxcgAGx+9AkW9c1l5hKHakgxfOEkdJvkl1gljEZOyj7
	2VzT3wd6q+SDFRnp1Z3Os5v1Tq7xKlFUNw7POtAsgXARwSSzCV9edoohopdYosIXzRmZg4vUHrQvz
	4Pk/iigKrdDw9ZTHvJ65aTdNWg91fyg1ojxZu/ZxcVVBU8kupXoAxs6Avem4NbyyZje/NRUlXBRb+
	lL+mkplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VEj-00000002R4P-3Zm4;
	Fri, 04 Sep 2026 14:49:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VEj-00000002R4C-0gut;
	Fri, 04 Sep 2026 14:49:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E5C2600CB;
	Fri,  4 Sep 2026 14:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8C91F00A3D;
	Fri,  4 Sep 2026 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788533388;
	bh=D8QP+kbZpQDntP1Tn0kRj3eRn2VrXYnQZO0ZaU5rhW8=;
	h=From:To:Cc:Subject:Date;
	b=HrZrB6+XKVeTKBRp6ZHAm3pMUVe/b+VHffHbaQ1TFnLcC32ptUS5VE6USRIWadLFN
	 ZT5AJp8VcE65mN4oEiJOcTp8s0+yTarqerV7mKCo4LvvrtlqQaX25R7fQrQMJ8RuWU
	 s3tWmp2vxZeP5tCwWd9IMXICnSpDXeGWmCPUiTjSe2ARmGu1YJ5a6rODeHs0FA13xO
	 IuTf3f5fNCaG/djDUVsLv5Ai6BeUgDpLWQo2s0/ADPf8kXmSdvYwaTytkTnTpszC6x
	 kHaQypMs/4EmSsxJIU2AGQ1DQ/ZpH81vplkqu2n7VE/2RbKdOgagK9SchPns9IwStM
	 bpyGN0Ouoyxig==
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>
Subject: Interrupt chip driver maintainence
Date: Fri, 04 Sep 2026 16:49:44 +0200
Message-ID: <871pb9841j.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

Folks!

I'm wading through my inbox full of patches for interrupt chip drivers
and I'm thoroughly annoyed. The way how this works today is not
sustainable.

Patches end up in my and Radu's inbox and all we can do is go through
them mostly on a formal basis, but it's out of our scope to look at the
correctness vs. a particular hardware. In the past I just picked up
patches when I had the gut feeling they are remotely correct, but I'm
tired of this.

I've just marked about 20 patches and patch series obsolete due to zero
feedback from the relevant architecture/SoC people who were on Cc.

And I'm going to do that from now on very consequently. If the
architecture, SoC experts can't be bothered to look after their stuff,
then don't expect me to suck all of this crap up and then deal with the
complaints when it breaks.

I'm still going to pick up obvious and simple bug fixes, but for
anything which requires deep knowledge on the underlying hardware, I'm
going to just mark them obsolete when they molded in my inbox unreviewed
by the people who understand it for six weeks.

Thanks,

        Thomas




