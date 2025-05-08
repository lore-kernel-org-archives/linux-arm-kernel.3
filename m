Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A8BC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNHOSukK1UcSrlpey88fVbHswOXSe7CxCfbANrroJZk=; b=Pc4P/ouzZ146rNSgebpNj5cmtF
	y9r7TrH58/sikmbjgMQxBDrEE814BV2zSpiV2mWyckNj4kQ61/B4OfO7HLTXf4H6t15aHcwImqFmt
	6D/sYjosy34kY/QB731oDGSXbifxjAq1EVH9JKjU//xFraRnjhk01/6CXlvdOMchpNl0B3OEMIxdq
	K1Hh7P4DvYQeOXWPSAcP6u1apyXeQ/ZybS+Rf/r/Ifuhgv7uvkT1W5BZJhD5RvUXcQxjNJzBjeU0V
	wbOgHHGOWBFeERDdgEVPzjD1ZzQQU9VAoaw9IWdiHKodLulHyYfHlQ8Fdr7zD4HD1lldZLXNfBJkg
	OxZU9Rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwjO-000000008LB-3HUE;
	Thu, 08 May 2025 08:35:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwT0-000000005NI-17Aj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 08:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QNHOSukK1UcSrlpey88fVbHswOXSe7CxCfbANrroJZk=; b=qhuqoshudxOazFe7SeCL+v7jy2
	3ysyajxhSO5LQOzUBHnS/yxwDC7bYXArkQddTQmXarmbKq+IYGWgnb6UCrx2KD/3MmW5TK3TO8uLe
	HyOoJIOxiQ6yJWkek69P6Mskr3ozccPz/7FVbXSqPm7JjkhvUntlCqcp89sqorr/ZSEPgyz8QnctQ
	sU8QKQzcMArw0sQtv84vcNIorJBScBfe1N0fabkjNxbQfvUqGNE34FtZMLZzFATzm774XDlq4xdNX
	Wy6BBQS5uXZwXycqQX397GCjF7vNPGLtmZXyHM/mhCHSISNeJOwQPVLVXaByqDUIeHIdtdZTPWkEe
	M9Fl0jWw==;
Received: from mail-244108.protonmail.ch ([109.224.244.108])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCwSw-0000000FzjV-03Ii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1746692317; x=1746951517;
	bh=QNHOSukK1UcSrlpey88fVbHswOXSe7CxCfbANrroJZk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=R3ulwkpfSe4mEFDXNGvGmr+WwEJOcMYAs07M4nB4EBAJKxQd3Kri/eM8D8rRSutwf
	 XXohYvddj44SrrN6ptWZAfwhgS4R9J3PeQ2k//AwiHaMhJtI7B1vz7vUoJNvPGV1gv
	 y2tePcG43syU0fNczuGaX9kPnI5uVKB8S9RiZe8rKNRGsrP6qCOgnHBuHZuHJodP9U
	 nMlxN44/0MNIcmOFzsvUsYTw8fYv9+xatjHN32g5qbX6PVaSBZ/RKFCDp5KvOc5TBb
	 o2sm8jHbusjyV2OO3n9XD7b8hFbwumtELqY1wrau8bOUmWNCgMmGPyPuZ7i2NHvWNd
	 D3COFkyCUieZA==
From: Esben Haabendal <esben@geanix.com>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,  "Will Deacon"
 <will@kernel.org>,  "Stefan Wahren" <wahrenst@gmx.net>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "Shawn Guo" <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
In-Reply-To: <7023673.LvFx2qVVIh@steina-w> (Alexander Stein's message of "Thu,
	08 May 2025 10:07:27 +0200")
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
	<8259306.DvuYhMxLoT@steina-w> <87ikmby52x.fsf@geanix.com>
	<OcbHk6MrExXjxyTadV3NcE9xJDrgio7H-_tyJ9Gg3Nk95KDJa9rKDbVBh7c7pZp8ZyBe1tmmvriFglTBKbyI1w==@protonmail.internalid>
	<7023673.LvFx2qVVIh@steina-w>
Date: Thu, 08 May 2025 10:18:35 +0200
Message-ID: <87ecwzy0pw.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_091850_870829_402EC110 
X-CRM114-Status: GOOD (  21.94  )
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

"Alexander Stein" <alexander.stein@ew.tq-group.com> writes:

> Hi Esben,
>
> Am Donnerstag, 8. Mai 2025, 08:44:22 CEST schrieb Esben Haabendal:
>> "Alexander Stein" <alexander.stein@ew.tq-group.com> writes:
>>
>> > Hi Stefan,
>> >
>> > Am Mittwoch, 7. Mai 2025, 16:30:33 CEST schrieb Stefan Wahren:
>> >> Hi Alexander,
>> >>
>> >> [add Shawn and Esben]
>> >>
>> >> Am 07.05.25 um 14:44 schrieb Alexander Stein:
>> >> > Select PINCTRL for NXP i.MX SoCs.
>> >> could you please explain the motivation behind your change?
>> >>
>> >> Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to
>> >> disable pinctrl")?
>> >
>> > Ah, thanks for the pointer. It might be the case.
>>
>> The goal of the patch mentioned above was to be able to build a kernel
>> for LS1021A without pinctrl framework enabled, as LS1021A does not have
>> a pinctrl driver.
>>
>> With your patch, that would not be possible anymore.
>
> Why? LS1021A is arm, not arm64 which this patch is touching only.

Good point :)  Sorry about that.

> BTW: Commit b77bd3ba762f3 ("ARM: imx: Re-introduce the PINCTRL selection")
> is actually doing the same for arm as there is some fallout from
> 17d21001891402.
>
>> > I noticed that, when using arch/arm64/defconfig and disabling all
>> > platforms despite ARCH_MXC before running make olddefconfig,
>> > CONFIG_PINCTRL gets disabled as well. No platform is enabling it. I
>> > noticed this when building in yocto and non-IMX platforms are disabled
>> > for build time reasons.
>>
>> But is that something that needs to be fixed?
>>
>> It sounds like quite a special use-case, and why not simply enable
>> CONFIG_PINCTRL in that case then?
>
> PINCTRL is crucial for any SoC to even boot, so this is an option which has
> to be set if that platform is enabled.

Yes, but PINCTRL (framework) does not by itself do anything meaningful.
You need the correct pinctrl driver.

Making the various SOC's select the corresponding pinctrl drivers makes
sense if it is required for booting under all circumstances. And this
should then indirectly enable/select PINCTRL and anything else needed
for that driver.

Having ARCH_MXC select PINCTRL as such is mostly pointless IMHO.
Enabling a driver framework without enabling any drivers for it, when
building a kernel where no SOC's requiring any pinctrl drivers is kind
of weird. If you want to do that, why not simply enable both ARCH_MXC
and PINCTRL in your yocto recipe?

/Esben

