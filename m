Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1988AC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCjYLQdx1BmxAeW8uae+DfbkSuHn2ffhF/4FzkxWyvI=; b=KerD8ftkzDpqpWsIP7vtSOENJN
	AWw0idsvuRyZT33sXCYumXnRGYHRDmyTS+P0xft51ZpBFHnY8yLY/kQD3x7mrDXBTxzby9RDv5yRE
	YDBmP1HXjuj3e1ua+FUE/YhGbKd1v4G3VKFUXFi1N+R1KowwF3f01v9Ha6WUO8YAPEq9SfoGBiQzH
	l9XKr7tTUn+NjPvIE8JalauefhxTI8SCc3AAg/EGVUQ0sEwPMRfy/O9Gh8N9cHaQNr3d5biugFlD0
	5AwOq4c7p/dhATypG4p8z0QT0dmHvLqvnxG17PdnkC8WafFWEForY5vDwM8QdAKJ7AmoqZKCs/mv1
	zH58u14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPUx-0000000APnR-1gIy;
	Thu, 30 Jul 2026 12:04:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPUw-0000000APnH-00Uf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:04:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15B41600BC;
	Thu, 30 Jul 2026 12:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39FA1F000E9;
	Thu, 30 Jul 2026 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413064;
	bh=wCjYLQdx1BmxAeW8uae+DfbkSuHn2ffhF/4FzkxWyvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=maQ24lWjVdvwS5tu2QP4A7MHaS2lo+RRlDELYhoaWu/ROi9KJE4BdVKcKER619gSG
	 uRpQaXZheS6nm6HUYNAcODnG12EIUuw4JH42pnNRnJFvrgqaGo8VSDpP/o1w++rtNZ
	 JGesTsTTccy0RSIPdxHiTgqfcfjy236i0rkNtbOkbdBOZ9TOSeghkjEaa9cw+jgnwo
	 laSZzCEW07LTj2Hfls9HQuReN2bsIxqseojidnYna1JrLVXrcNVWW1h3pom+TkCjjz
	 oVtMeygiB5o/aCdn8+iakgs0Li1oL8uDDtD7j8OkftEtXuP4NhjIf8odSrgXa1msCz
	 Uv9lrLjhTt34A==
Message-ID: <554e73bc-2aa9-4caf-8d36-c1f550500d9a@kernel.org>
Date: Thu, 30 Jul 2026 14:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Paul Louvel <paul.louvel@bootlin.com>
References: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
 <178539922190.574381.1359588018451529893.b4-ty@kernel.org>
 <fb520f00-1331-4136-8421-d82bdd46c48a@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <fb520f00-1331-4136-8421-d82bdd46c48a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Krzysztof,

Le 30/07/2026 à 13:15, Krzysztof Kozlowski a écrit :
> On 30/07/2026 10:14, Christophe Leroy (CS GROUP) wrote:
>>
>> On Wed, 29 Jul 2026 16:10:36 +0200, Christophe Leroy (CS GROUP) wrote:
>>> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
>>> proper platform driver") qe_add_gpiochips() was walking the device
>>> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
>>>
>>> After that commit the discovery is handled by the platform core,
>>> therefore it is necessary to call of_platform_default_populate() on
>>> the par_io node.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] soc: fsl: qe: properly scan GPIO nodes at startup
>>        commit: cf91e5909e620b77164b53c9b316a5c1f11f9ea7
> 
> You left very little time to respond to this - one day - and introduced
> undocumented disallowed ABI. Please drop the patch. I will be objecting
> to the entire pull request.

Yes sorry for that, I thought the reviewed-by: GPIO maintainer + 
discussion with Herve was enough.

I'll fix it up before sending pull request. Thanks for reviewing and 
providing feedback.

Christophe

