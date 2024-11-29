Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04786D6EBFE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 10:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjOK0zywSeokD3DvA4azctX4cWAnxYzpu0R5TPG192g=; b=jvG5kiqG2cWjxFckvlAaT1qYaG
	B4agtjkyHFVbqRBEbrpyCKlZefRp1d6YB9g4urfvHZdR+4KOUjY2VmpWMOrH7iTFOopUmwIUCPAyB
	ApOn9XmNpotr9rVwM+tmkt8nJTPnM04qfhKh0BQyUvsCIUs2nla1m5288sd+lDuosA/Gb83UW8FKE
	wX0/lMysWEVaACzxob54he6Jpy3vn4BveGXWjRIhlLXiYXvO4onJZRuP5P0yFaoqyllJklfjEBUTc
	vrWaBP9gQ4yw4P+dnGXavec1mkUmJYthLEm9NXfMBRxsPmCGiCeh/DnvCTf2r5dg/RXrdhzngXoNP
	W8OySLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGySD-0000000HSZQ-3hL7;
	Fri, 29 Nov 2024 10:42:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGyRF-0000000HSQQ-0aAm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 10:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE9B8A43C54;
	Fri, 29 Nov 2024 10:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BABC4CED2;
	Fri, 29 Nov 2024 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1732876888;
	bh=hjOK0zywSeokD3DvA4azctX4cWAnxYzpu0R5TPG192g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pYJKblk+fhZ7TJuHqJ10qD1WMfJRsstNB9mSpwXkfGW5OWEmKthLmc2XlmhfJK0z9
	 D5/TNREub82nIMd6n0kVWL/jtm/qP/wPTvsOniF6BgbDySRZY4TBAFLTNnck0cTsFY
	 S2RH9/LtiVzVFctHpds8WHi8Ww0mVf9y1nv7wsho=
Date: Fri, 29 Nov 2024 02:41:27 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Zi Yan
 <ziy@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, David
 Hildenbrand <david@redhat.com>, stable@vger.kernel.org
Subject: Re: [PATCH] arch_numa: Restore nid checks before registering a
 memblock with a node
Message-Id: <20241129024127.a150e574c57e05b3b3b2a96f@linux-foundation.org>
In-Reply-To: <Z0mIDBD4KLyxyOCm@kernel.org>
References: <20241127193000.3702637-1-maz@kernel.org>
	<Z0gVxWstZdKvhY6m@kernel.org>
	<87y113s3lt.wl-maz@kernel.org>
	<Z0l6MPWQ66GjAyOC@kernel.org>
	<87v7w6sa5s.wl-maz@kernel.org>
	<Z0mIDBD4KLyxyOCm@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_024129_241504_551C6113 
X-CRM114-Status: UNSURE (   7.68  )
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

On Fri, 29 Nov 2024 11:23:24 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> @Andrew, I can take both this and Marc's new patch via memblock tree if you
> prefer.

Go for it.

