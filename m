Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21215CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMer0xijIl2lTL04iKtshfq8Fg2YOiTXFJyKnSPzMUc=; b=DNxHd0ueCaKU8KLBaF3XxnvMyW
	t6mSiP7AiCaHr1IdYveIcTpIZVzDqkfH0YojmZU0wfKCYPKE0ZRTmak35Yat8WlPF+6oRSndsAjIK
	zUJ8QisWXGpQJ5b/IKztiAlUpsidCsNQ3sNBKmvIZeAqfbsBTEHXyA6fufO/i7xurpKwgrhuGnqJ7
	c1Sq9ruEIsx3CghfyBpHfqA5kZEXqf8UaCfZzscTKm4dAGiBXojCyUBoU/fxx48Pnl+Km65V1oFr5
	npzbvC9c9fn/Gn3Wv3ljT5DqmGz+lldj5CNSg51Ngwb+k2nSW9kgm4B7jSrNeDy3GkKplImYJLyKV
	Z24fGbpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvBG-00000006LCM-0X58;
	Thu, 23 Oct 2025 13:16:38 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvBE-00000006LBh-1Sgu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:16:37 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4csml444B3z9t5M;
	Thu, 23 Oct 2025 15:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761225392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMer0xijIl2lTL04iKtshfq8Fg2YOiTXFJyKnSPzMUc=;
	b=E9V3DDoUbx5FyYIvx8G0YsATqH4+QGhWhoITs6hxMCrVxpIePSXEWX1IAeEtscxZ8/o3Vu
	qc6QJLHcNQTyx1KcX9vWm28ws92IlFu5xHDlSYR74CvwqQdix6gemneKwmbVIcqAKFZs3A
	/+LRBjFg1CqnH7UAZqWUOHhqDLtjcgRkqPR9WzZhWWr1VU9qCoFDUGW2aEy+NbJzZGaXEH
	wfAuNoKpgAKNzWx0EMAihlpV905pbEkJOT9ZWh57WkF3wryBneMBz/cjktegXHncIwwCuw
	E5Mf7T7VWp1d+6RNQbY2Rh495/kVz14Nek+o7SGWTdvlj/lxsQtO7u7CKCQOPA==
Message-ID: <31e56a8b-bfc2-4516-9c3c-2377a8e316ce@mailbox.org>
Date: Thu, 23 Oct 2025 15:16:28 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Yicong Yang <yangyccccc@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <632d6afe-40d3-4632-99c7-b098967bd649@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <632d6afe-40d3-4632-99c7-b098967bd649@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a1aa58c112299b2b393
X-MBO-RS-META: gynmh6oujheewxi6h5cfeo7xnzz34ci7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_061636_548955_3CD0C7E7 
X-CRM114-Status: GOOD (  10.15  )
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

On 10/23/25 2:01 PM, Yicong Yang wrote:

Hello Yicong,

>> This patch is mainly meant to prevent a surprise in case someone does set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register access.
>>
> 
> then I think it's more proper to guard it with CONFIG_ARM64_AMU_EXTN (I think you mean this above?)
> rathter than the cpu cap. then with the patch kernel won't touch the AMU registers here if the kconfig is
> disabled on you AMU supported hardware and AMU unsupported firmware.
> 
> move the guard into reset_amuserenr_el0 macro will be neater here (personally I think).

I can update the patch this way, sure.

If this is also OK with ARM people, I can send a V2 like that ?

-- 
Best regards,
Marek Vasut

