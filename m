Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC61C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 01:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/wiVg/zVTmmdVAuSQhntXuT5npvM1Nuq/OCCNwlVXw=; b=Oo67z86FfpIDO94dWkMiAxxory
	zpEIDG9JlofD5fss0ObaQwKoBNSU3udvQJr3NVGTP/PP0ybKWcMAIVN+0VsVphsoyoEoKtYWvcgX9
	EiBglOkNqg40qbNAIZKoWShCNnp4z/PZtQ0LuaGQ5jnW56eFTn4HfCCdaJYwp8TFo1f1x6v/ARUaC
	Y77cooqjzO+HO47B5cQavzhw71Nnm3zjdf7UHBqqpiPRw33KaESaMrlQIi98EnBWldVRSTD4wDvrr
	kVb0jRHLM6N4zrNc5qItKbmiPyl3C4+PrJFgqO+nwFgindCQcHtChkKsQvBIjR/O3lJlSSWhA/nSa
	7iJ8D9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkCfC-00000006SUi-1d4a;
	Tue, 18 Feb 2025 01:44:42 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkCdi-00000006SN8-42gy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 01:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739842987; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=U/wiVg/zVTmmdVAuSQhntXuT5npvM1Nuq/OCCNwlVXw=;
	b=r+HfFgmlXZJoyXuXQRJg/HWLbIjlHaeJdYESoxgfEvMn+umzBNGimYUs4s2rhNBViGRUyJld/Ar7ib9b0bn21dnHABd1h8kCifgdYn7uq6XewFJx4zsse6KOl9sXIY0U3wzvniTHtUrk1HGUrfIcEnchpboiWJ8SXp1csUW3YEs=
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0WPjtOnc_1739842982 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Feb 2025 09:43:03 +0800
Date: Tue, 18 Feb 2025 09:43:02 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: robin.murphy@arm.com, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jie.li.linux@linux.alibaba.com
Subject: Re: [PATCH] perf/arm-cmn: don't claim resource during ioremap() for
 CMN700 with ACPI
Message-ID: <Z7Plpr3e3hdQJieG@U-V2QX163P-2032.local>
References: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_174311_492871_838B9966 
X-CRM114-Status: UNSURE (   9.43  )
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

On Tue, Feb 18, 2025 at 09:21:11AM +0800, Yin Fengwei wrote:
> Currently, arm-cmn PMU driver assumes ACPI claim resource
> for CMN600 + ACPI. But with CMN700 + ACPI, the device probe
> failed because of resource claim failes when ioremap() is
> called:
> [   10.837300] arm-cmn ARMHC700:00: error -EBUSY: can't request region for resource [mem 0x40000000-0x4fffffff]
> [   10.847310] arm-cmn ARMHC700:00: probe with driver arm-cmn failed with error -16
> [   10.854726] arm-cmn ARMHC700:02: error -EBUSY: can't request region for resource [mem 0x40040000000-0x4004fffffff]
> [   10.865085] arm-cmn ARMHC700:02: probe with driver arm-cmn failed with error -16
> 
> Let CMN700 + ACPI do same as CMN600 + ACPI to allow CMN700
> work in ACPI env.
> 
> Signed-off-by: Yin Fengwei <fengwei_yin@linux.alibaba.com>
> ---
> I am also wondering whether we could just drop the CMN600 part id
> check here if ACPI companion device claimed the resource?
> 
Sorry. Just saw the link
https://lore.kernel.org/all/1676535470-120560-1-git-send-email-renyu.zj@linux.alibaba.com/
after I hit send button. May continue the discussion there. Thanks.


Regards
Yin, Fengwei

