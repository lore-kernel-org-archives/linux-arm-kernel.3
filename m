Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BA1C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuqTVRPLKoRQ9MMQfRIpr7bVrZKr95Rn2p1k6sNWEZ4=; b=mWBBSuuHKhNvSLoZxT2M15Yfzv
	pQnxGQUcujhtCM6qJtjRFfH3RgJtkmuZ43O7HGxwE7gqppVWk+qm5FGUhx0cCwsvzr7Su57TlOy/B
	XF4sb0us16k1FesAih5KwMAvW0Yi/A4ZXa8XvwTJUAAOwwc0VWUwBFbAGDI8Ft/fuNO7KtX2jUhi3
	j097eAlfCyOlszfr4CFntRUUBnTqP6l2oD/eNe3M11vGJ+K1YspdU6xxCgOqRO4Jx0oTNvyPPxu6l
	9q9rHS8nub+2BV0iVxMQCWXrIr09kFaQL/9a38WaOJg20oySnlNN/RuKL8gGOBhpOEC8lfqQ6GMXY
	ry8uReWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WqJ-00000006Vpj-2ci1;
	Mon, 07 Sep 2026 10:44:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WqE-00000006Vp7-1rle
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:44:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00AA21476;
	Mon,  7 Sep 2026 03:44:41 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06AD63F7B4;
	Mon,  7 Sep 2026 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788777884; bh=2hwh2AcBgKyWd0n5XC16XKeNe6QdOcojhz3vll/P+iI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQfwqAP8b+aHItcwXjywNmynrYpqGvxro0RgNz57f9+y/bIZ2Ko+vYNdYo3Ndng7T
	 2j045Ab8wyG23buFPl6o1j15B3heUSVyXPKJEKJ7MjPnh/ylqobglIId2D/zwxSsTb
	 Mw0GJnuIWISSUrV9By5+UfFGN5KgyE8TUoDDF4JY=
Message-ID: <a82061f1-bb23-403f-b772-d5adf7acb871@arm.com>
Date: Mon, 7 Sep 2026 11:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Borislav Petkov <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>
Cc: x86@kernel.org, james.morse@arm.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
 <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_034446_534945_F48A46A7 
X-CRM114-Status: GOOD (  11.23  )
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

Hi Boris, Reinette,

On 04/09/2026 18:36, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 08:37:51PM -0700, Borislav Petkov wrote:
>> Lemme have a look.
> 
> Sashiko has comments:
> 
> https://sashiko.dev/#/patchset/20260709093111.367851-1-ben.horgan%40arm.com
> 
> Please address them: if valid, fix them, if not, explain why they don't need
> to be fixed.
> 
> Thx.
> 

Regarding the first Sashiko comment.

The documentation change in patch 3 includes the sentence:

"
The allocated bandwidth percentage is rounded up to the next control step available on the
hardware.
"

Sashiko rightly objects to the "rounded up". For MPAM systems this can be up or down and we test in
test_mpam_resctrl.c:test_percent_to_max_rounding() that it isn't too biased to rounding one way or
the other.

How about replacing "rounded up" with "rounded up or down" so that the sentence becomes:

"
The allocated bandwidth percentage is rounded up or down to the next control step available on the
hardware.
"

What do you think? Should I respin the series with this alteration?


Thanks,

Ben

