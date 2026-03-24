Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B164FEC0F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-reply-to:Date:Subject:Cc:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYMnchnB/TeeKyI/1Ye/NWdU8u0hSMm+QUE/z4pDCe4=; b=LR89fjyJdo+2gEML0XYtqohbpb
	RGF1XVTuVeeGclzoMbJ0D0ZGNuOVMnxKGDDsmaZkPNs++BjW0wJ3c8oQJJx9IA2K9r+tqAv4kuE9A
	6lpJWk8SgGeOWvni6NuBO1uldphiUhWG1GFANJP8p3ZZ0YYhCpoqAnDiWDddcC7Wy7kEUSJA4HRO1
	hR4D3RtzhDQ/bf6k9njOSFPimR5QwLjqJG2Gs4w9q9uATkbH9TlSWZHitfPEyCAhLeSNE+ZEXr4I6
	WKk5SJvhtWDoj7zrHI8WlUdkB4GL88GS+s8XY6igOqXIzPVxECIIXWDmDj07nejQKPcem4A/uNb8b
	Zp1+sjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57MC-000000028lM-1fGo;
	Tue, 24 Mar 2026 19:24:05 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57M9-000000028kd-2BMW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:24:03 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-38bf132993dso14001951fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774380239; x=1774985039; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=wYMnchnB/TeeKyI/1Ye/NWdU8u0hSMm+QUE/z4pDCe4=;
        b=ij2WbRxkjBbSzvA5BFJKGOmqTcxH5XsaNVIhpuBsAmwpxswM6326/+hyT2LkS6g84O
         OaUaGBM7+LuPhKIW1TVpRiT2aTF+zrEUoX15OLv/gao3LlPhqtQcymcUg3iUhTKRUk+O
         cno75ni1od88wIAYJZRrv3hRtXhCSuSpHZno1XLN/HvEQt669Y9MAYljR7xA+m9qn8an
         HS0KUlyz6e7BeoIucqcmyoamtoDUZNnsawEBCmjXj11xL7vwdXIT3/6ncN4GFM3GovUA
         szyph+dtK2rGau1zEmZXa87Fj9IRS9yblwrsmQGzBqr0MFxIjXNzyhzeN9i9NO9Fe5wu
         5V7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774380239; x=1774985039;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wYMnchnB/TeeKyI/1Ye/NWdU8u0hSMm+QUE/z4pDCe4=;
        b=nSdT9EitY/CFs67SPN5FBK+2C3x3vwsa7ij1JVxLZ2G/wk7rsnbxkbvQ3WUnSX28fv
         rxik3BTAQGErgFoa4eOBrrsz3sAMQrbUJ6hBO4Cm1m3bpZuYWjFKakio7ncXdvxYyYiy
         dPKeN6Prkx5lP4b/jrD9N8A0yd4eTM+ByjTNzEYuJUtyxchzgNvaGl6VN7TQocARV/6B
         3ycmdMvScy61Ngmjvqsgn9vY2c2bsRCMylclV9u+bVTMNFGdfddQwX5TTNP6QVu/S0wx
         asfr5xTClFD6EF/kr6BMc5WB7muWV12rb7dem1bKURqBOV/gkFu7ZLmG+a65+uVp8FQZ
         Ypdw==
X-Forwarded-Encrypted: i=1; AJvYcCXT5bU8bieRTrZyjm4Kl2uyHl2jazohYFgrVPwTruCuX/6RoeGvdY9yPs2z1m8UEAFurfCdzxsGshycutwgSaLE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh9e8PvP7OL/XsD1C6VRiWrLGcA04GTBqmu5MeNZQXmw9sxanp
	MVUnLzU6IQCVXvHfhRWtrWWzvL3n+CXq2mkhpOA0aGjWYb8v7LKIkLT1
X-Gm-Gg: ATEYQzwTE7N30D3//TlDIQUxmEGa/qY6+ePWPuAZiBVVssNul+pQDbdbZQuQ7xKa7vt
	Im4LoWVPgUDhq4hqvBVRkHwY4Tcq7/S2RoHmRf87p9WWzCVtq0jHhs1ZtCi3Sq8HEXlb8IPxgrB
	WDgcD3b06N632YO37DWDztsGeGNC4qDcEsXkwqMeGvisjqw8z5Wm1DkgGnsyk2LaSb+mCnkVSiF
	d6jW4Zk+ZncuG80omSQOs2em4iFbJuv21ldeZjCSIB7iuP7p8IEf46ASbvNOSw93MBpHDwrlkCx
	TkglvecdyffCaxlqN4ZmAzD6jr4eNHBrwvgrpIgyXvI/9rKAh5gnktOb1lf1q+g+Qz8wygO5s/S
	RFD86kSI/AMj7XdvYHizzGD71dfireVaIczq7kE1YYxqOTjl1YORuJSunQ4841Z2oDW1TW2nuUW
	gbA/F5G7GGlGGQQtypNF8=
X-Received: by 2002:a05:651c:4212:b0:38c:4231:91c2 with SMTP id 38308e7fff4ca-38c430c33d1mr1974511fa.10.1774380238610;
        Tue, 24 Mar 2026 12:23:58 -0700 (PDT)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c34a2db0bsm6416851fa.21.2026.03.24.12.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:23:58 -0700 (PDT)
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <acFkAPreOFBvoHid@zed>
User-agent: mu4e 1.10.9; emacs 30.2
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Hans
 Verkuil <hverkuil@xs4all.nl>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Date: Tue, 24 Mar 2026 22:12:33 +0300
In-reply-to: <acFkAPreOFBvoHid@zed>
Message-ID: <87ecl9f2uv.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_122401_577838_06F6F353 
X-CRM114-Status: GOOD (  17.22  )
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


Hi, Jacopo!

On 2026-03-23 at 17:03 +01, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hello
>
> On Mon, Mar 03, 2025 at 02:40:08PM +0300, Mikhail Rudenko wrote:
>> This small series adds support for non-coherent video capture buffers
>> on Rockchip ISP V1. Patch 1 fixes cache management for dmabuf's
>> allocated by dma-contig allocator. Patch 2 allows non-coherent
>> allocations on the rkisp1 capture queue. Some timing measurements are
>> provided in the commit message of patch 2.
>>
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>
> I regularly get back to this series everytime I have to reason about
> the caching policies in vb2..
>
> Is there any reason why it didn't get in ?

My impression is that all the review comments were addressed, but these
patches somehow fell through the cracks. I can rebase and post v5 if any
maintainer is interested in picking it up.

>> ---
>> Changes in v4:
>> - rebase to media/next
>> - use `direction` instead of `buf->dma_dir` in dma_sync_sgtable_*
>> - Link to v3: https://lore.kernel.org/r/20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com
>>
>> Changes in v3:
>> - ignore skip_cache_sync_* flags in vb2_dc_dmabuf_ops_{begin,end}_cpu_access
>> - invalidate/flush kernel mappings as appropriate if they exist
>> - use dma_sync_sgtable_* instead of dma_sync_sg_*
>> - Link to v2: https://lore.kernel.org/r/20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com
>>
>> Changes in v2:
>> - Fix vb2_dc_dmabuf_ops_{begin,end}_cpu_access() for non-coherent buffers.
>> - Add cache management timing information to patch 2 commit message.
>> - Link to v1: https://lore.kernel.org/r/20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com
>>
>> ---
>> Mikhail Rudenko (2):
>>       media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
>>       media: rkisp1: Allow non-coherent video capture buffers
>>
>>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
>>  .../platform/rockchip/rkisp1/rkisp1-capture.c      |  1 +
>>  2 files changed, 23 insertions(+)
>> ---
>> base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
>> change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba
>>
>> Best regards,
>> --
>> Mikhail Rudenko <mike.rudenko@gmail.com>
>>
>>


--
Best regards,
Mikhail Rudenko

