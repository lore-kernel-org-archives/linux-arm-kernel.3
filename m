Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E34EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+1h/BQsqY74flNV7K6I6cQt2Nw8Fe1oJBqLFnkhi3Q=; b=RYd+nrkcp+IE4D3iVFKzkbtcag
	yZ6pFFLxg+B1TPRcT62R2jNzmaU/DfFBVwBjgldX+LTeYsVNQ0dvKapWpiR9DwJikFsWZIejUa2KK
	4JL8Zr6a52weUYEuI6DpqB6TpxbCaCfvpo9fy9W3Vm1/IzHrzKnPaBRyQKjK61rtzpk7fTdOfCO5X
	d+xWw+JsWQ2yHT8ihICc0fHygh3i6VYdbVNeD6zUP2dIqnkqjZRyiN6ZlNASgql+hYhKqvr6voUz0
	wKikeJjAkl/OVbNlW+zzm5rTHvB1UfcqRR4Kd6rNc7M23gW7ltLJ8fSl/bia7j3lRsQLLBESjjnyd
	z+pJ3hoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHWo-00000002FlJ-2GAH;
	Tue, 04 Aug 2026 15:58:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHWl-00000002Fkp-3E6z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:58:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44FF71476;
	Tue,  4 Aug 2026 08:57:58 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8074F3F86F;
	Tue,  4 Aug 2026 08:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785859082; bh=KhwAtM0UItUER3IXbqDdE6lFQSu0rls/C4cvOSiwBqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcTL6/enZyscEbetKmwZQI4x0bObIGbedbdFRkHqzrrWh99MWPF4qZXLAllUzW2Ts
	 hlQk3JUZY7Acwc3s6S7+rM4zpar54T7UdaPRifuum1GsaVFDWdbibYGX5ZdpTEOGat
	 1Qi3cBITNrwwfYcseriAQhhW1egTZHyLFgQo0irA=
Date: Tue, 4 Aug 2026 16:57:54 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Bradley Morgan <include@grrlz.net>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC]  [Question] memset.S old code stuff
Message-ID: <anIMAh8nL5rWS6d9@arm.com>
References: <F8EBC118-3F46-4A47-AD0A-A68E8688938F@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F8EBC118-3F46-4A47-AD0A-A68E8688938F@grrlz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_085803_931667_B0A0FCF5 
X-CRM114-Status: GOOD (  10.94  )
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

On Thu, Jul 23, 2026 at 12:17:15AM +0100, Bradley Morgan wrote:
> Hey folks, sorry for the crazy asm emails, I see that in memset.S in
> arch/arm64/lib/memset.S, the code is incredibly old code, like 2013 old
> (heh).
> 
> I was wondering if I could say, adapt it from optimized-routines (same
> treatment as memcpy.S essentially.

I think Robin attempted until he realised the use of the Q registers in
the Cortex Strings library, mentioned here:

https://lore.kernel.org/all/cover.1571073960.git.robin.murphy@arm.com/

So that's where Cortex Strings diverged from what we can use in the
kernel.

-- 
Catalin

