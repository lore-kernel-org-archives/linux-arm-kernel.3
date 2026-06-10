Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AC2CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDZFA/XJVv1lEwaX7z09NSQIhGALV+zbSDqdbk5QFJI=; b=vHz/d5G68Ebbh9XEsXReaNFTcD
	TKFycFsi9ydZjg7WezhevQZStOL5WLAVDrrwapxwItWZRDfhJcOA/XpiAXoBO4QklfZ+r1klxWWHi
	j6hM0TpnDKD0I3F8X4spp4x0OL8GF5BvxsVOQAGmolfZJhyiyAOo52AZM7l/YINaYKw/Hh6jh2meJ
	Lf79F33IDmJTs1WI7MyJDCuXLqG3ALHqBTYCSBlEUKwKM67dndVEGw37/145jAYRy+5B1+VMlqLeo
	w4vR21+BrTvDqw6TT4goenpa5SEDuxKqua8zdZP4Ftx0n4ngyspXLbN9mlE58fHgYgn++YZKsT/EI
	ZPbfrOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPt8-00000008Lx2-2eod;
	Wed, 10 Jun 2026 20:51:02 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPt5-00000008LwT-3BQA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1781124657;
	bh=aDZFA/XJVv1lEwaX7z09NSQIhGALV+zbSDqdbk5QFJI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BbILurq3uIm5Z1u/a6gcvWGeyx77v5p/mGcvCb9aKV9oZb1uFtP2b39dEw6Z3+3Sd
	 AO7P3v0h0eE3mpFFmiu+n9jbTNCrMt7ho3tH46FVTOXxI0MjolIaSof6k1e/6CZEzs
	 z2qDc3wNCxE9K3AIvOVniABqXhn0UyJQvo1P0Jwk=
Received: by gentwo.org (Postfix, from userid 1003)
	id EA901402E4; Wed, 10 Jun 2026 13:50:57 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id E54CA4028A;
	Wed, 10 Jun 2026 13:50:57 -0700 (PDT)
Date: Wed, 10 Jun 2026 13:50:57 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yang Shi <yang@os.amperecomputing.com>
cc: catalin.marinas@arm.com, will@kernel.org, 
    Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [v8 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
In-Reply-To: <20260609214205.1260279-1-yang@os.amperecomputing.com>
Message-ID: <3e28d896-a99f-4bfd-75cd-b77ab09f043a@gentwo.org>
References: <20260609214205.1260279-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_135059_829593_759777E0 
X-CRM114-Status: UNSURE (   4.29  )
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


Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>

