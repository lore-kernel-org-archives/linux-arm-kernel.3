Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C54CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3GT2Q59z7jRgJeDRmMHoLHVswcssOZ7ZZ/HLhh5BeQ=; b=IHmXb2jj/EUG41EqsWZ0G9tM3P
	yuoKx4A//DjB4Lm0hwySZhwyH3pZ2a8lZYjQm8tRdfilykR/FbIhzj8aZJCBkThltS2BWoWO3qQKm
	8Q9UkUwGMGmSariWuBC254jcDeygjg/PsDvNEMzVK6X8BnOMkSdunjr1/fh1NyPyCvaOxUZyzfq/2
	pxQFzubUkFuz6uCC16b51w0dWYJq3nasqyuJCbCSPFYbFlxDOzOp876C5WZILYWQhrcOqy2T+sAm6
	mBkXxqMJvF0bFQkXejy9Vozu4zpoAVQHdWkGyqE6wVsHQVcndnoiI7N6bGGhJ5r8hi8SeC1yfyMem
	+axDzmbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjk3-00000008ZSv-1fOG;
	Thu, 27 Feb 2025 19:40:19 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhFw-000000089pH-1alb;
	Thu, 27 Feb 2025 17:01:08 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1740675661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3GT2Q59z7jRgJeDRmMHoLHVswcssOZ7ZZ/HLhh5BeQ=;
	b=qrJ9xGeRk+ZoCCKaNXMPs6xQlPX39ci0CumbybmMrC6mVweHQH5PlKL2yj8BheOaIHOcB+
	+hzhs3pexdg3aZotFFKWOuVzAJxkvGnNkrBJCTebjkY75j0bkdK1V0Lu617yzD7ilnGPR7
	i0B4Wz8JrDWwn0UbWL2eipuZtE/JJNjPA3D+YyFFRPAdON/aM2VBiRDYUFZTb4ER8XcswK
	SxrOvHM9owPT8JX7pPnBznvCtOWsTC48wicoLtxgmd8kcQRUYFg3wocSb34Z4fZ9wovthg
	YXH+fP/2PHByu/Yxjffx8F/sGJW1fBQhdgHVJrRdUkhDQ87a8tMRawdv5G7Meg==
Date: Thu, 27 Feb 2025 18:01:00 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org,
 linux-rockchip@lists.infradead.org, rui.zhang@intel.com, heiko@sntech.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kever
 Yang <kever.yang@rock-chips.com>, Diederik de Haas <didi.debian@cknow.org>,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH] thermal: rockchip: Extract TSADC conversion tables into a
 header file
In-Reply-To: <8fcb202f-d1b3-4989-9777-5bafd6fed59e@arm.com>
References: <08d2fc6e1972f1f90c900542bf66945d6dc6db63.1740577122.git.dsimic@manjaro.org>
 <8fcb202f-d1b3-4989-9777-5bafd6fed59e@arm.com>
Message-ID: <f13f480aae41e7d893bc6b285e3ad95c@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090104_712660_FC31E217 
X-CRM114-Status: GOOD (  18.85  )
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

Hello Lukasz,

On 2025-02-27 15:42, Lukasz Luba wrote:
> On 2/26/25 13:42, Dragan Simic wrote:
>> Move the TSADC code-to-temperature mapping tables from the Rockchip 
>> thermal
>> driver to a separate header file, to no longer have the somewhat 
>> cluttering
>> mapping data as part of the driver itself. [1]
>> 
>> These mapping tables come verbatim from the SoC technical reference 
>> manuals
>> (TRMs) and the downstream kernel code, [2] and may be updated at some 
>> point
>> in the future, according to the manufacturer test results, [3] so 
>> extracting
>> the tables into a separate header file not just improves the 
>> readability of
>> the driver code, but introduces a clear separation.
>> 
>> Improve the wording of the moved comment block, sprinkle a few short 
>> comments
>> over the newly introduced header file, and move the already existing 
>> single
>> stray #include directive in the driver code to its beginning.
>> 
>> [1] 
>> https://lore.kernel.org/linux-rockchip/7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org/T/#u
>> [2] 
>> https://raw.githubusercontent.com/rockchip-linux/kernel/f8b9431ee38ed561650be7092ab93f564598daa9/drivers/thermal/rockchip_thermal.c
>> [3] 
>> https://lore.kernel.org/linux-rockchip/b4ab86b56177a234f3738c477693e858@manjaro.org/T/#u
> 
> I think Daniel was more thinking something about saving the
> memory in the kernel. I see how this patch can help the readability
> of the driver code, but that doesn't help much to not occupy the kernel
> data. The driver will be built with that memory and the distro would
> run on some platform with particular chip. The other chips data won't
> be needed.

Thanks for your response!  Yes, carrying all that data in the kernel
memory, out of which only one variant actually gets used at runtime,
is far from optimal.

> Why not to have that information in the DT?
> That would save the memory and be configurable for only needed 
> platform.
> Please have a look into the generic thermal ADC driver and related
> DT entry, which is used e.g. here [1].
> That table looks similar to your info.

Let me have a detailed look into all that, please, and I'll come back
with some further thoughts.

> [1] 
> https://elixir.bootlin.com/linux/v6.13.4/source/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi#L136

