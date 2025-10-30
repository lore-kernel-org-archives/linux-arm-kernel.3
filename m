Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3847CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JhskAMSbPVlSOTNFjzse6L3MehkffYRFL9WqDX3wYY=; b=cn3zmnepmqyZsZ+iJjhu7Icaal
	N+HulU2tTJIIGJaPC2zZldnb1NFB8BbLgjI6nYAYyeQ7+rk5NkV9NDbyuUrlwnj0Lfk9/qcQNcmRG
	xWhsNzGZquQuEBE5SC3lOpygIG013Pc8lqUPaSzOqq+rOL9vfXzgSkpNaCxaTl7P+DtrrUVUIIse2
	wFIQ24Pc9Q9+jkrJsgHt58aBEyoUSEoHCyhYObJorOrO/s0Y62qMRFPSYIZUYvmMnTIEGDe9roCDx
	OdWtprn8HFENSwUjOrfQkeCbesGkRNoaIqSXKM4NmCF63glfBaZvXlhhZcSRh7berC6xd3QfvvoiX
	Xi7AYpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOy9-00000003rsv-3g4Y;
	Thu, 30 Oct 2025 09:29:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOy8-00000003rsA-0BcI;
	Thu, 30 Oct 2025 09:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761816556;
	bh=YyjGQwr4n5Ubu59xZkUEL74ae/TqjsZuDDm5YLuW3Q8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h+EBRGb1uH174RYx0/bt3F70i7EFNqYF93qQh2fbnEAFwy2dpGvFYenEKMS2c7UU1
	 ajeipmS2ovXFxr38PeuwYBCW3/8Y2ZAa5waMC+8HcTQUy6q1ThdCCuZairmfVDsPt3
	 JN7iwVBc2TQ6+gmcscpsp1jWpg7oOMPyv/bT7NIAtELUFab65OzsjNvwfsqjMAIGvx
	 7XDoageZ3llaz05qDybsO5Sn3wVTYn65Yx/EdCwv6Kua3IBb+mWyEIcCR+CIZE0/Z8
	 O5Ecwjxdm9yBpI7y0I+7X10LXc22Rlf8IMz+pMgc4HiOC2t0e07Ut1lmhwWE7EuTbo
	 ctLRWe8Ii8XDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9203217E1380;
	Thu, 30 Oct 2025 10:29:16 +0100 (CET)
Message-ID: <141839e6-1dbe-4e98-8412-d47e853d997b@collabora.com>
Date: Thu, 30 Oct 2025 10:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
 <9f5a3dc5-d0f8-4172-a4b4-867919612a2d@collabora.com>
 <CAGXv+5Ge-uZHKATOvqQF25DRTcHFJkopUk-JUXDtpEen=BwCiA@mail.gmail.com>
 <f434165f-1717-41ff-93e4-9be5b7fca929@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f434165f-1717-41ff-93e4-9be5b7fca929@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022920_248754_350A7F12 
X-CRM114-Status: GOOD (  18.80  )
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

Il 30/10/25 10:10, Arnd Bergmann ha scritto:
> On Thu, Oct 30, 2025, at 09:21, Chen-Yu Tsai wrote:
>> On Wed, Oct 29, 2025 at 7:05 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>>>
>>>> I guess I can send a followup patch?
>>>
>>> The only followup patch that I deem to be necessary is one adding a symlink
>>> or renaming for MT8188's SCP and nothing else.
>>
>> The firmware was uploaded in March of 2025, and is packaged in Debian
>> Trixie, and was also backported to Bookworm. Either adding a symlink or
>> renaming it won't trickle down to users for some time. So this seems
>> like a possible ABI break, where the ABI is the file name.
>>
>> Or maybe you don't consider it as such because SCP hasn't been enabled
>> in the kernel in any release yet?

Just as a clarification:

Exactly, SCP hasn't been enabled in the kernel in any release in the specific
case of MT8188, so this is not breaking anything, and it's not creating any
regression.

> 
> It's normally up to the kernel driver to know about the firmware
> file names and the order of trying the possible fallbacks, which
> is exactly why I originally asked to not rely on the property
> from dtb.
> 
> If you want a symlink in linux-firmware, that would go the other
> way, pointing the old filename to the new location.
> 
>      Arnd

Cheers!
Angelo

