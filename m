Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033E7CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLZEus+tCL11fm5pjczjLroLeFvpHRb7wyyV18rDJdo=; b=PH9sFjXqC6OTjNzF4lgiCluMFT
	5Bh6bUC/UOUVJkC4CqM5icEg49jKUeFhbg0DzEG8JfdMUW8Iez/x+ZWOzWjdhlpjY/ZFkgRgpnrfl
	zIO0vyhD08oTTCfLqSBdgoBB2wzzvSEXFs96U29fdynm/APgvucoSG6CfDLELrzlkfFVoI0qMu+v6
	hoGxG5MKYS5A+j4csbqcov6UpOu9xjchr2144wWHJ+Y53IBeL6rk9OdI/srHAqjLPBcBy0Qh0PuGx
	JpOxOEU9l0zsQajiWgQl8JiIkZCIvrq7AyOirE/Wrh7QoTlmH2P7XCFRinMlqMPn0LLsYEVzo6UsB
	/xMeCLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRn9a-00000001NID-35q3;
	Tue, 26 May 2026 08:28:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRn9X-00000001NGs-2HgY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:28:45 +0000
Date: Tue, 26 May 2026 10:28:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779784118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OLZEus+tCL11fm5pjczjLroLeFvpHRb7wyyV18rDJdo=;
	b=YPvff5e1CqWDNw0LdhWd/NJTJdY0t3d+BO+fF9C7go3km0AU9OU0oKEgMSRpEDqSGQqkrm
	bQagXu8iCrP5ZdU4Ol53J9hhDddmjY0niil5EJOM3kmsZpMBieptHfpRyzGMw7Xz+z08Lz
	223fz+dRSYTKE7k9Qo7UNvkGMNP+qxz1ePFYd42kbXBdz8Ntw1aZ8xcBXnmbH923rvaMJ5
	H4DRMBgvRQ3rF4ii0r9LJk7VnTAtBptZAqFtfUXo54g9EwkBbfgk1BiOkwq2eYxi3sAAcp
	PZ56Rxfzs/vyMeOQMK8BJDyfhN9ANrhvryyU0z0IRPJcoicCQEk3qkdAb5y94w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779784118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OLZEus+tCL11fm5pjczjLroLeFvpHRb7wyyV18rDJdo=;
	b=A8xG6QD3U0AlvPv5eFmggfqrUJ1hYC5luFTi2p5IDfdF0a88uKbba8DStU3iPZZPv21xDb
	uQMSgpIcCxrIGuBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Michal Hocko <mhocko@suse.com>
Cc: Waiman Long <longman@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] gfp_types: Introduce a new GFP_ATOMIC_RT gfp flag
Message-ID: <20260526082836.9BOv1yCM@linutronix.de>
References: <20260520204628.933654-1-longman@redhat.com>
 <ahQLVgj8zV4xQRh9@tiehlicka>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ahQLVgj8zV4xQRh9@tiehlicka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_012843_720675_C4EFB42A 
X-CRM114-Status: UNSURE (   6.25  )
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

On 2026-05-25 10:41:58 [+0200], Michal Hocko wrote:
> Before we go this way we need to really be clear we do want to support
> raw_spinlock (aka RT) contexts. This is a big commitment because it
> dictates internal allocator locking that would have potentially a much

This is only needed for 2/2 of this series and Marc didn't want it.

Sebastian

