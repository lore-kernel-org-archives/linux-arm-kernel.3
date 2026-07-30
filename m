Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79922C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJ/yD7bE9ElkxiDxco8+gMprXLT5uuDnRcZMiLa4j+w=; b=rBLPBOQjaVhgEoxVO59utqa2pH
	ULlHcm3dERr9IYFUnZnlYz6HdFxRwqIR6yI2Q3tTnxQdPGKD0NdYfk3KnT2yGHD4xEFNhwc83H05e
	aIsBC21vc1PkGiELMWA8ypE8yksgtLbjRcVZvwfMJX8mGQWWaZeIDyzHYKBOFh7Z/XMa23iWTG0i+
	atspTH8VCry2fIksi91rOnPQJ8xZd37II7sRxHHoDIeaPB4E8sA7D1V5vHGI6xztsDLCyPiqxmQxH
	NlwDhb4DIy3z6ItRMSodWAax4Yqq068lKfAUiloDrdOm97J4INAsVvYqK4uw3BAkWVmaYGAJ9B6ag
	9Fcde+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPaL-0000000AQxq-0bcQ;
	Thu, 30 Jul 2026 12:10:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPaJ-0000000AQxR-0szd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:09:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA9AA43B01
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AE41F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413398;
	bh=VJ/yD7bE9ElkxiDxco8+gMprXLT5uuDnRcZMiLa4j+w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=R9RGaN9qxG8rQzQTET92hake+Nl3JUKqqhAcY50GV11EAws3tNE7P5I1kNXxc3p96
	 t2zdJbf6OA4LInTeZTF8WUS3gZ+YZO/CRM/c5mHWtEEahxJb4b4sbSb/t6rJ0yafGh
	 ykgxxVE9yb2tfDidMQeaSngfT+I3IMEVIcLKaR5Mk/VC05N7lu3db/Id4QVddEjCgB
	 ZV2htEghVIMKF04iM2AYhVyQlycoKwOU8yguD2ka0oS/g0z5roLdBZWH2tHGFnt0lT
	 UIoBoP5mBe44nsx8i79BjmQkrA3E1ZkIpUWN4Gt8+ku3dVm53APqVE5t8UzGdFydig
	 odYqJ/91uwwPA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so2556553e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 05:09:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpmS5WkVTkWW8NEXHVk7IeEy5R4rxbMrOvs5xYriXOE5qwsfzIrbi8NKf44cOc7XIkCQsBdJrHFUiNdkaYNHKLX@lists.infradead.org
X-Gm-Message-State: AOJu0YxkqZpN6PjgssVRVLYfNt80wP8OknQQcVwz9g8AK8rgK6gLPysj
	yIXjC/47OvPuQdB6zmMPPucj4bT1eOZ2dDfMIasFlaDDxHDqg4qvH+aX/P+ozvTYRtFaep6/rbu
	kzPqCh+rheO065OEudT6mlhWl4Da+JBPgdEJtTSSSiA==
X-Received: by 2002:a05:6512:3195:b0:5ae:b0aa:8f07 with SMTP id
 2adb3069b0e04-5b2db34f39dmr592659e87.16.1785413397400; Thu, 30 Jul 2026
 05:09:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 05:09:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 05:09:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <fb520f00-1331-4136-8421-d82bdd46c48a@kernel.org>
MIME-Version: 1.0
References: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
 <178539922190.574381.1359588018451529893.b4-ty@kernel.org> <fb520f00-1331-4136-8421-d82bdd46c48a@kernel.org>
Date: Thu, 30 Jul 2026 05:09:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfj_JPQiomau+WLSzb74fiYSbMLarP56zqCDfZWcgbgqQ@mail.gmail.com>
X-Gm-Features: AUfX_myTbYqVPzvlsNuejrqk3GuPKunBm_-wZJ0qoMrboKDcj4pxXoHQW0ErbbU
Message-ID: <CAMRc=Mfj_JPQiomau+WLSzb74fiYSbMLarP56zqCDfZWcgbgqQ@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Paul Louvel <paul.louvel@bootlin.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 30 Jul 2026 13:15:25 +0200, Krzysztof Kozlowski <krzk@kernel.org> said:
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
>>       commit: cf91e5909e620b77164b53c9b316a5c1f11f9ea7
>
> You left very little time to respond to this - one day - and introduced
> undocumented disallowed ABI. Please drop the patch. I will be objecting
> to the entire pull request.
>

Hi,

Krzysztof explained to me what to watch out for in such patches. In this case
it's about an undocumented node name which now becomes ABI. I'm of course
retracting my R-b.

Thanks,
Bartosz

