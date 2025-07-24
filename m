Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2EEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfpJaY0i9heXv55+AsXvn41rTRtAfctbmZRtuKj65Rw=; b=wS0YSYwZhhpMvKrJsi0DzPsn2y
	1CES71UIdfyfoNuMoLprD+0IcL6AnzTWWi8bvDAdY0ZPKwfNARdkGu9IObTTIDmIqDcY/7ziJ2jX+
	5AARkIYVwTpWBAqXiDrJ/YSyIj+uuf7ve0fd8VHknjCVk8wfP0GFc0AHGr2sOyveJouSgkWkqjxoc
	GrPWT1TWf2HIrCtdpInKzFtjPUQ7uGQ1l1TY/nd4dcU0d2Bv9fG8IwzmsKH1OE/xYIwUlz0HtpPYa
	KZ67a1xWa0MqbJ3/5v2sgCrzfULOeZGrJ3wxs05+En6VrAlvB+b7hLfJtZxVy4nItNsp9b1DRbDN/
	lx3B2hsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOb-00000007bv0-3H8n;
	Thu, 24 Jul 2025 13:54:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueuZw-00000007NLU-48Nj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 11:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753358260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IfpJaY0i9heXv55+AsXvn41rTRtAfctbmZRtuKj65Rw=;
	b=ZSXhprgA2DQ4Q0WiOsq3patCoqyQ1Yv/BC6fslA9OcHliuNslfQs8cxVxLnT1dOZDZACXG
	juhQVpoZPCtE4KONv2zm5PFcKC12wRE9BrRcltAcl6127Jq77e3kyitLvrAJjaysIKUMBz
	aCsx/TYfwFoAJ2eOGROuU3TyCyzbyfk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-eB8eDn-oMGWkQ1fwt99tdg-1; Thu, 24 Jul 2025 07:57:36 -0400
X-MC-Unique: eB8eDn-oMGWkQ1fwt99tdg-1
X-Mimecast-MFC-AGG-ID: eB8eDn-oMGWkQ1fwt99tdg_1753358256
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a52bfda108so477650f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 04:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753358255; x=1753963055;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IfpJaY0i9heXv55+AsXvn41rTRtAfctbmZRtuKj65Rw=;
        b=NnqIZHM1kzcK1KBzdHJxq5NA9gNp5la4rWehXduGTs10h7XDdsFJBKXvscSL57OiYO
         aCXVk7/6sKXzlH3ENtAGZysGPuuFOuKCXIapn4NPdORCReUDA9vqjOPlppnMUoB+rnRj
         eV6VGQiAFAFpEjmXcf/l1qaU0RPNo2GnZl+4/74NZoFsDiA8a565Vm7DD2/lNf3sYY+t
         rnWMMt3JA8irjcPSvD34+0WTmwYLc9Ucp6rbOAcvxonIo55vo3g1LFn/cV9STgN08ZF8
         uB9k9WQs7m7KdlcK6V0uhPiFOMXSMAEuiadHhE3FNXnYZwBq69Qnu/D5BudFV3YccS30
         8zTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Sj6INrq0gcuM+/OrmYa5X+aFQfBxszwRuHt17FTVkbhCp75b8vjJVElAcVMzbtDemt863r0dEmaOte8m/onX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/0RH6ZS2E45x/dhNpoOWqg+FXty7hTOtPGZUITFiuRYCU0czD
	DsRrYqJ2Mixr/pr0ANf8lR8d+ctbFBZ61iTpXxrb8dg75m/joKwdDxZpir6o9CpK0wJoYvmirWU
	+aqUuhUAnhNi/Iw0KQBf2B1uXE9juV915a6ha7aWwE6EJ9z1a4K1YPFQbHLDmYskEfeWGf+eVgC
	qw
X-Gm-Gg: ASbGncs4Xw21T8Vlxsx6+txMMUPuFtTseIsWwg9VAhJqrUIhVi+xhr7/yxBB6U177qS
	h+1793joeY8zvPd0PLwdXnEbEO6aL8Grn8Kj2F+NGYp4bYGESEqPen3LPrl8CcD19S6oAxzNljm
	ttkNls1rhRy0L32pmBdDoP3bRgFVPqmarlt13BDXJBOXYfHzt7pSSZATyd7Aatr4H77UQrDqsSL
	Y777JEp+/kJO4uhkCKlXwxPy6dzHD9AD9yMBXAdkXTGj/FnR52xWuL4pY+HJKFtMRsyS0Kf4Rt8
	xz4tK2TDxxP6h23yC1EJP4F7P9Urj1TvBg2HrHCFc7aQt5AazcRfEpFig01oIWmmHPd4XwSWB+2
	yixWbCCGJJdKUNigrLj3bub17w0SMVSQCzyg9Nh7ULr7Xen7FHHCj0gwcSojCMczl
X-Received: by 2002:a05:6000:40cc:b0:3b3:a6c2:1a10 with SMTP id ffacd0b85a97d-3b768c98f7bmr5578785f8f.12.1753358255336;
        Thu, 24 Jul 2025 04:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3CNg0Q8ekhpe4If+ptwIZaS02E1ZZYo7XDg+YeCtzQ4aBATaJ2jYa5KVbphllNjRL4gIyZg==
X-Received: by 2002:a05:6000:40cc:b0:3b3:a6c2:1a10 with SMTP id ffacd0b85a97d-3b768c98f7bmr5578740f8f.12.1753358254762;
        Thu, 24 Jul 2025 04:57:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:5e00:c941:d6fb:3e30:b42? (p200300d82f1f5e00c941d6fb3e300b42.dip0.t-ipconnect.de. [2003:d8:2f1f:5e00:c941:d6fb:3e30:b42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870554a02sm18071815e9.21.2025.07.24.04.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 04:57:34 -0700 (PDT)
Message-ID: <6c17dd99-43e6-439a-a30a-194311eba889@redhat.com>
Date: Thu, 24 Jul 2025 13:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
 <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
 <CAHp75VeWbhuL1pYvEza44Pnb5YUufgY=1WYXSx2nNMJVfcytTA@mail.gmail.com>
 <5c7edf57-bf13-4633-8348-791e0620cc79@lucifer.local>
 <aIIef0MDcZiElgN1@smile.fi.intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <aIIef0MDcZiElgN1@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r_nuCwrL63cvixOkFI-PNRoclEIR44h2hXN6gYqnvtw_1753358256
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_045741_102088_6120F6C5 
X-CRM114-Status: GOOD (  14.10  )
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

On 24.07.25 13:52, Andy Shevchenko wrote:
> On Thu, Jul 24, 2025 at 12:15:11PM +0100, Lorenzo Stoakes wrote:
>> On Thu, Jul 24, 2025 at 01:12:49PM +0200, Andy Shevchenko wrote:
>>> On Thu, Jul 24, 2025 at 1:10 PM Lorenzo Stoakes
>>> <lorenzo.stoakes@oracle.com> wrote:
>>>> On Thu, Jul 24, 2025 at 11:24:29AM +0200, Bartosz Golaszewski wrote:
>>>>> +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp);
>>>>
>>>> Please drop extern, it's unnecessary.
>>>
>>> It's all over the header. This should be done as a precursor patch and
>>> I know that usually people push back on doing that. I gave up on this.
>>> Kernel is going to rot sooner or later... :-(
>>
>> In mm we just update as we go, this is probably the best approach to avoid
>> unnecessary churn.
> 
> I agree on the idea of eliminating it, but also I agree on the consistency over
> redundancy. That's why I prefer to see this done at once for all (in the same
> header) than doing one-by-one. And this approach got a lot of pushes back, while
> the former even more pushed back on the (in)consistency matters.

No new extern where unnecessary.

-- 
Cheers,

David / dhildenb


