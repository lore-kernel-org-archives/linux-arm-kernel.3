Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5DEC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgF74Y1x7cdnEZ6zTA2j/Rn/3r7hmq1Fkr3Xk5+i6o0=; b=LF79B69bJ37X+q926ArHjCGf5B
	DcnB/MdKL9067Lh7s2JmIisZJ3ZkkmPlkH7UUbilbqBHNOMWwR1qYXERdPRT4S782WtgqRo8RRhQc
	nfslAgSjWxNNEw2CcgrR42pXhfChI6xsYyna8Barfstxq8fCxHhjfRmLW/YSGdqqFyM+HMNTir1Wb
	uRp1QWQYexkAnkWZvF5t665u3QQPXGc7gxVBcGi6Fr7sBabyP/4gyjBUwb1XlKQZTj5xi2+53VfSl
	mpx0Yn1wePxej/9v0S6Q3QLtu9qo/mbgsCrEC89OD34paST47sCpuuoVyGDpvu/weRqEnDJcW1kjk
	ymPIkZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TQX-0000000DvRP-3ucB;
	Thu, 17 Apr 2025 17:53:29 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sr9-0000000DoDa-33nb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:16:57 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-727388e8f6cso618197a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 10:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744910214; x=1745515014; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgF74Y1x7cdnEZ6zTA2j/Rn/3r7hmq1Fkr3Xk5+i6o0=;
        b=z1G0j5N610mfJPCmlZoNBXDZzgpxLs5q+Mi1rCuFmYGwg8z/S/1PoYN3Lu7uL7Ed5S
         Q30xRVk1btr00u7xKY16Hrciuv9cllDXI827K/J49YhlPjzSdpn+f0ulwh9c0ezw0AL4
         88C8ux1AKd10I9NzeMlSZhD2QgrzXwBxwVtwXydm7Uu3XLMGG+Dsq5YwHk7Smg1xC+gk
         r7FGS208xdCx4RM5myt3sSPTT3YGoSQa0ttyCS72KG8M22sm3QV2eAopkt+8Alcg+EWx
         kRauAURVTK00g57YnLaVmSGR92rWbbWvXjI6+wIRyJr4nX4tFI+j3TYio3DAaglXPDG+
         IHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744910214; x=1745515014;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgF74Y1x7cdnEZ6zTA2j/Rn/3r7hmq1Fkr3Xk5+i6o0=;
        b=R/5rq2ItatCKg8776iyTMorFyytWJmJDmttnSqGE8neRIj8zsxS3GgJnW7FLgndC2E
         UvOT0JpJsDgaAEncIBLdZMsIIcYQKv+qQ8x3RaBtFH3L7biPIjfCVTQXZ8xEDV+yNuwm
         xg3WVaOpPnYZDobk3orYQ1V1JsotzQwxH2AtLCjdTgklke4XXbsQ2dE3VZUMKwk9UEC8
         zNpoxAs6RcYoCoa7H3yZ1vW3UBvJS5Sw0Pzhh6DeGiW0PWi5XaF6Gm0wse2cvHMpb9Vv
         2JzGjwhARVFielHYPFgbW4hjV1/6smMUNN794bXDuBwqPKzICpk66Sjc4bVm2KyvRThu
         vcOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvrVzmVcQER8gIvIICsIqoEKx/f3fMsAv/FHmo+Jasvvam76g/aoohW+PDYQJIdlKEASzb0dSHJaW6oRGM5v5d@lists.infradead.org
X-Gm-Message-State: AOJu0YyquB88DNbP1mHvtIUVe53OCjtU5X2HoCoD6fvt7Ro0EfgYSO8h
	ML3vQLhNJLS3feIJTKJm+D7m4O8r5PgWU4liw2SYekjrccrR2ZaXsINjBfaiZGw=
X-Gm-Gg: ASbGnctN+71CZSnEF0i1Q+MShlrAOzyRHXUDthfMCHo5EuRhu/tdzjsR+MlSJKT3wjp
	EVf+GVY8LpSPRSiRflLTUhCj8PFDrGreSHVES4Du2z8eQpxdlNmnVAdA05HCZmQcTYWuzBHYKMF
	2dNXxqlqBuvd6vvFB5bopXEIcgdHV8WmGEW6EVFZSCp58N/SlVA+9reApOEL/Eqp+mSHcFnPCbD
	35/1J2s6aTjAmQXCpZ4yEO+EtpP6btM/BQJIMwHdsk/O8xsdiaDkggRbG76NTB/eeDV3X6uJziM
	FdNHkIJzqbkpkGfzVZp9z7J0NifarX6Fa0iYuW/leWNUmNB6hI2xXRj2sMyOHuMsSd3Nrhk+YQu
	Y0H8qXBvlSL/ry8Sg2g==
X-Google-Smtp-Source: AGHT+IG2ya+SWKqWkEWn8r9JpbAOf9gOHMhtRFWZIjuKx4wF7uh2Oa75D8nMaKP4BJF4mMuOP+61ew==
X-Received: by 2002:a05:6830:61cc:b0:727:3f3e:53bb with SMTP id 46e09a7af769-72ec6d200d9mr4250103a34.24.1744910214661;
        Thu, 17 Apr 2025 10:16:54 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047caf24sm22509a34.38.2025.04.17.10.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:16:54 -0700 (PDT)
Message-ID: <6ff6e3be-6193-4977-977b-24de89c09153@baylibre.com>
Date: Thu, 17 Apr 2025 12:16:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] iio: more timestamp alignment
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_101655_766790_1ED16D5A 
X-CRM114-Status: GOOD (  10.93  )
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

On 4/17/25 12:01 PM, Andy Shevchenko wrote:
> On Thu, Apr 17, 2025 at 11:52:32AM -0500, David Lechner wrote:
>> Wile reviewing [1], I noticed a few more cases where we can use
>> aligned_s64 or need __aligned(8) on data structures used with
>> iio_push_to_buffers_with_timestamp().
>>
>> [1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/
> 
> 
> Link: URL [1] :-)
> 
> This will help to maintainer with b4 as it manages tags.

In this case, I don't want b4 to add this Link: to all patches, it is just
context for the cover letter and not so useful long-term.

> 
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> for non-commented patches.
> 


