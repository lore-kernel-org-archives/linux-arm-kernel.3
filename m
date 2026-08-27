Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59210C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2o8MOsuV4Jtw0bdDdi6XdQxXMsv0/NeHM6TvE/6nwQ=; b=BD9xVYQhlSNMPPeRo10Yoso+Uf
	+etdnGUukg0mK/YfFAsK1jD5cOJ2V3L1gw1mfh7lSjk03KoeqCYsFr+exIF9K0AtsRxTUJJD2MY6o
	NfY0xN+0f9UB+QIMBiFDBSuONpiy1g3IqfbzWDrv4MPOVVM/d3B6xxOU+lHnJaHlsDgIaL05pOYMv
	hrRNMWavl8JIIZtF5bLLTTDOYog+KCTZsEAbZghpLRKXjRXrA4Kf8sW/d+Ji5U7l4nIpH1A0nCuuZ
	JCnNkGk9Re2Y22Bipqa/apuk06vAB17Z7xXtEb2HwMjznxjDbJ21Cn3CXcXF4YF6GGrsCOIew7XN1
	1Q3lUGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wze0x-00000004Tp3-2fPz;
	Thu, 27 Aug 2026 17:35:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wze0v-00000004Toj-3IkA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:35:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD240600D2;
	Thu, 27 Aug 2026 17:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661641F000E9;
	Thu, 27 Aug 2026 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787852144;
	bh=z2o8MOsuV4Jtw0bdDdi6XdQxXMsv0/NeHM6TvE/6nwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bk4w13ik+oNJLlCaJU9UGdlr8LAknop2T13tjJCfGFeSmTmtry78KGtazH+HM7Hvn
	 ehSik91/x7Wz8aAfU1U25dGLgVoWUZANGcvIPueQ/Lg+0yxJ5iGM+XvBo2y6Ik0QKi
	 UnIE970PZwh+KufLaJg2PQKyLB2exuSkuxVKu2PxsGCvOCYzVT3vE8pI3P8lVqHHCZ
	 qomINzVPwcqJ2BbNmSP4VURAYLyV5H3yiHvikO/PFD0ueO9hsvB+S+5DokZp515fXb
	 dRX0vmhxPlM7Bildubr0iDMLZyL6HvhTQOlp7rcNrak1ECxViWt/vUMgdfC/gh9suD
	 3UjjQGD8NYj1w==
Date: Thu, 27 Aug 2026 18:35:37 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: artem.kuzin@huawei.com
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@kernel.org, 
	vbabka@kernel.org, cl@gentwo.org, linux@armlinux.org.uk, will@kernel.org, 
	mark.rutland@arm.com, liam@infradead.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com, panov.nikita@huawei.com
Subject: Re: [RFC PATCH 02/18] arm64: align kernel text and rodata
Message-ID: <apB1JCaNkGQMJQqq@gremlin>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
 <20260827161158.3618409-3-panov.nikita@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827161158.3618409-3-panov.nikita@huawei.com>
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

On Fri, Aug 28, 2026 at 12:11:42AM +0800, Nikita Panov wrote:
> Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
> Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
> Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
> Acked-by: Denis Darvish <darvish.denis@huawei.com>

One small note on procedure: it's not really the done thing to pre-Ack
patches in series sent upstream like this :)

--
Cheers, Lorenzo

