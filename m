Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D9BC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:To:From:
	References:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Se+wWjKIJoaEi2lwJRboAVHWUDI/GKAKI+okl83Jtg=; b=x21P0O2zGzWNkLfSeMkkPnHpI8
	p7GEx7lu4KklJTuv2NQAF4CURLKkA6LGYbVbHJ6RqqwdEE3qDd8yUboqSNUndAQIpx+D3nc9REp5s
	Fw2MPE+VRFy2oQDe2NlN+ImBzFfIsKgZheRuyFM5EDVn5rF+uNHddX1sZFWhqfImZ08IOC8WHrOvO
	X9h/SBf+M0uKrNHgzKbauHWL7hG2c14Xhuw9TZSu9QXxlc6R5MWHTGVscX84Qkl6zojrtR6NTxWC3
	EYkxipXl34iFE1Nr15tDeHhK0PCy3Jj7SN2swY1LM9e4Tn8yYXFv438SO4YQO2CUFAXx6Rdpiq9dE
	uYA61rIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3UZ-0000000Byui-3HI3;
	Wed, 15 Jan 2025 13:31:31 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3TK-0000000ByfX-0Epl;
	Wed, 15 Jan 2025 13:30:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-540215984f0so7395740e87.1;
        Wed, 15 Jan 2025 05:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736947812; x=1737552612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Se+wWjKIJoaEi2lwJRboAVHWUDI/GKAKI+okl83Jtg=;
        b=RlDFJFhdG38TpO1kGDQy08BwU7D4tZeK9EYm8xnOvqnPm1CfOQG8p3NQzvrtb9M1MW
         895HhCq+N4eXyPRADhoFdT+XsiO6h5nnZxo8SCylP+aT2rpLLt0M51FPTzyQsaAw5jLG
         uIeetGwbMstl102lmCRlzao7rY5Qu6u1SQJorUkfQ0dUyvbxfeYFthPeD1nx+p23aOu7
         iZB+gwshcu6olURr1ETjZ8DTBtN6KEPNGucRepoDSD3QDVKyqLyxujr4DGKts+o1Lv+x
         pZ8utBkj23rHnzu9CJh9RWahw8VJdn/A5TAV0wiyDGCRcYyPNx5pUV2bk/wjymrHV6V7
         OGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736947812; x=1737552612;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Se+wWjKIJoaEi2lwJRboAVHWUDI/GKAKI+okl83Jtg=;
        b=FBO8HExrI0PS+gZMCn0aNjxvnluESJBzv/H4a1GUVABdIfg2m/iK1unig4xAnC7iTD
         xdQPXZx0wD4IjmjwlRIRLrTfAnQvtQM9Fq36JjjjCtu4BhBCzwppXidp7vnMytW79LrD
         Fq37c+rCy+PzdwBm7eK3q1ZmBy4mPzhah5c2M2C/whFwI4LC7MHHsE6x0Deu00XkVXqY
         elXFexWcnzXe2JEO7mJS8XoBIViARti7tBjgENCwk7cLMTRWdHCFW1PylGKqhDXNnmpU
         NsHytxk7WZgNZqmL3JVmCN3ZxcQV+cK4GpoCiVU/dw3wH34UxAFL6JQq1oujD17SVP9B
         sWYA==
X-Forwarded-Encrypted: i=1; AJvYcCUmiFUrOH7wWvwWsy7fVN2wPihZas2fol/9IBZKaLeCfTKKexUpOCa/f49BLBZmigkZRuQgxehznmmMU5Krcg0=@lists.infradead.org, AJvYcCWUr8RGIk7MD5kuH6tKwOAxJXYjcS7qgSkBChERXRrmghI51vZKD5LjbHf8Y2I5oydS53VKM68vH7AhDauVtok2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+iZqNXErI7iH+H17FMdQfVmbBhEOV4pVumDwj2su2p5xcN1rW
	rFCM2cYT9za8IKVEmAcf9p3sGw7ovmp4wKUgW4kGgFWRGkYdQiLQ
X-Gm-Gg: ASbGncvBmpgHCyj3kKq0bZg8R393E1RD0eISuv5G1zFx2Em3mrAKZLpc8W7eEdbRT5j
	EDzvZFnHV4oQV6IlTXyWyNqUzaG1MJ2Lyt9SmazGu2wTw5AQ8Pr7yiG+wP+HizITfAl37umAUnA
	Sg0S0uq729s7C1r74dZkqq0pwWSAXcDb2muIpNY1k+7xa2YTa4VPUf+A9OOWXN+ljB2Xr3VaI/9
	ycqwpqbs/b9IC10Hw1aLiWwVhc71PKP4P+6Iydv5VNWXtmRH7oR0D6QYgosLZHSAfpJHy4hp8e+
	4HdO9EwpAYsoXo8ZxvHnvJzt3s+wfvcNuepNDWx/hVCH
X-Google-Smtp-Source: AGHT+IE9z+a9dcE8SStrZJMI4+H/Sxq/mNyV61u5lE4XZzuS1iMzAADr7X2mm8/UuZWGBbfmqP84Bg==
X-Received: by 2002:a05:6512:3da9:b0:53f:f074:801c with SMTP id 2adb3069b0e04-54284815c7dmr10284744e87.41.1736947811750;
        Wed, 15 Jan 2025 05:30:11 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49df1sm1994330e87.57.2025.01.15.05.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:30:11 -0800 (PST)
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
 <87bjw9s4s3.fsf@gmail.com>
 <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld
 <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Date: Wed, 15 Jan 2025 16:24:36 +0300
In-reply-to: <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
Message-ID: <877c6wryqn.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_053014_094143_409C2F41 
X-CRM114-Status: GOOD (  25.34  )
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

Hi Tomasz,

On 2025-01-15 at 17:31 +09, Tomasz Figa <tfiga@chromium.org> wrote:

> Hi Mikhail and Laurent,
>
> On Wed, Jan 15, 2025 at 2:07=E2=80=AFAM Mikhail Rudenko <mike.rudenko@gma=
il.com> wrote:
>>
>>
>> Hi Laurent,
>>
>> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonbo=
ard.com> wrote:
>>
>> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
>> >> Currently, the rkisp1 driver always uses coherent DMA allocations for
>> >> video capture buffers. However, on some platforms, using non-coherent
>> >> buffers can improve performance, especially when CPU processing of
>> >> MMAP'ed video buffers is required.
>> >>
>> >> For example, on the Rockchip RK3399 running at maximum CPU frequency,
>> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
>> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
>> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
>> >
>> > What's the time taken by the cache management operations ?
>>
>> Sorry for the late reply, your question turned out a little more
>> interesting than I expected initially. :)
>>
>> When capturing using Yavta with MMAP buffers under the conditions mentio=
ned
>> in the commit message, ftrace gives 437.6 +- 1.1 us for
>> dma_sync_sgtable_for_cpu and 409 +- 14 us for
>> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
>> buffers in this case is more CPU-efficient even when considering cache
>> management overhead.
>>
>> When trying to do the same measurements with libcamera, I failed. In a
>> typical libcamera use case when MMAP buffers are allocated from a
>> device, exported as dmabufs and then used for capture on the same device
>> with DMABUF memory type, cache management in kernel is skipped [1]
>> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
>> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>
> Oops, so I believe this is a bug. When an MMAP buffer is allocated in
> the non-coherent mode, those ops should perform proper cache
> maintenance.

Thanks for pointing this out!

> Let me send a patch to fix this in a couple of days unless someone
> does it earlier.

Now that we know that this is a bug, not an API misuse from my side, I
can fix this myself and send a v2. Would this be okay for you?

> Best regards,
> Tomasz
>
>>
>> So it looks like to make this change really useful, the above issue of
>> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
>> solved. I'm not an expert in this area, so any advice is kindly welcome.=
 :)
>>
>> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf=
2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
>> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf=
2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
>> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf=
2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>>
>> --
>> Best regards,
>> Mikhail Rudenko
>>


--
Best regards,
Mikhail Rudenko

