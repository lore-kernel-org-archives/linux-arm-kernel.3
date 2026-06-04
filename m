Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF4BCD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/B0Oc7JSmXys6K6XrBYqYAJwEgg7OwJ60KqTMEqOXs=; b=xSFtVD8OMGWCZKbNF/rK6vDfFh
	znUHQZWKEaOlt76z/SSE2KE3PNe4lKIYsC+ktUMzP0Hfca9x+iR1vhy48r0ET/2FwkyLUW30sAdwi
	ruhnmL1p+vwDnHMcWMbzMmv0sZm52kAfNXOy1vyK5D5ReBjLechjCTLtBF9Lo9G+LHIFlIJV57hQZ
	RmK71C7xVvLVObp+XrJ5an0XVmhbnDsyPeQuTu8RPxwdCifaCAcbvALYWGVVMfSr9L6p3cYAPCbz4
	uD6sIDVtFR8L7wPREeb6ldK8EFaGOmx3VbfWYi+ajxxlTbYHVnqYErofFQk/fib/7q1jWcoaf03cq
	2m4KnqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2GX-0000000GI7G-3q28;
	Thu, 04 Jun 2026 07:13:21 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2GU-0000000GI6u-49Sx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:13:20 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8422f148dfcso177128b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780557197; x=1781161997; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/B0Oc7JSmXys6K6XrBYqYAJwEgg7OwJ60KqTMEqOXs=;
        b=onK4aKPjLrDF0O5uNZViRvRGkeH7MwpD+RIpPF3KibR2184mBKxTqA1kuoRmNh3kP3
         DjALHg8oZppJrCEKewhYeTcsGMIwkSDfiGGHMrFHdV2OHoaug4mWRxP5bTF+vROPtbiZ
         eZ5P+lGixz10v5wzt940SIRRSVGb3Bocw7lGabWfgjbjqBZbBFFaeKTG5EEbbNUXdrhN
         rQ/lcLG/DdEnggpigaaYA3hdIUHA0AYAWH+Z5uTHAG4CdZ+YFkKqomdT3CNw2pTFr86C
         rgGYAl0Xd2y/Q+S/A9SntRamFWlNdi3PESqka/M9WA8N7bIg9E40EIrV8U3weQnh1WJ1
         4Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780557197; x=1781161997;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/B0Oc7JSmXys6K6XrBYqYAJwEgg7OwJ60KqTMEqOXs=;
        b=jUHKEL1jKg5NPr6YZCCQiPpCKayuMjY02VQEle+cKTv54xV/80vTH/Yy3Sj2EOiRjU
         /wDENIsy2X/WRD35eg1doWhlJxjzj/ypB8VxnWwryiCYY2oi5+heqw8vBHy9VQ5l0yhG
         KpzXQCb80uCVwl1fYNhY6+aV8osKx/RyxLEYhIwoNxfVB6PUvTOJzXm+ojB0e/4lNAXr
         bdspzjbjHCgRuYi3Ikm4SxJR02vLY3vzMI6IQ/zSyRUFEt1D5VOaQfiwfIon7CI3HkSM
         zILJfDBRI8h3XA3BV8eHL3al0FJY5blvi2DbDUtppzn/Ncl5zx/mSWSc7SihFqIaKed9
         m79g==
X-Forwarded-Encrypted: i=1; AFNElJ+LcGsrQPj1vxP7dC4eA8RLO00im9feXvB6k2G1I+sHHdE25z+s9xgGWITIWU+DmwvjD2j/XPnMxBVWWsHpktBU@lists.infradead.org
X-Gm-Message-State: AOJu0YyCSrWNx8F8qdMDie4bmwGVM2w77m5vBwL+tkJXlvwtj78D+vkA
	9AufSLsDwhcBPS3o65UnDqkZJ8fiRhqKWJuv2mV6K9WP6IljzTw65Axz
X-Gm-Gg: Acq92OFto8s5dzlnUbgiyuC17aokPDGREYT6JWgd6dzXZPRXhzswoY0B21KXr0Php5x
	qcJw3X2WGLqY8EJeyytPFS8QicPQYIW9jo08JNW+OqQIsRSVFr+jsZ21MhZXY8H/TwDQx7/dW6G
	RRgqSOWaUtDaC9XyVbZWYLUYtO+s5v55Jy1iEyfwC6aFfW5Ub1oujy0J1gU2MjTUodEubtk6199
	eSACdMDYOQnu1Gq4Iok+FD3nSwRkqaDbHAPSTosljNLwguMXBqze/6VaMayhlvVLwdsOCRC6QEx
	hH8K2tjM4iEqW6IoslJY/lWaA1VBJ26BThLuDV9mw0fMadSH6JzfOGFW4M12jvpJ3xWQYRTJcKn
	4HhEJObV0iEmNgdAaaA52L/fKSHNffdYgNv/n3u6RGO2dqnWxzndxL22sVD1YEOic9RoeObX4yL
	n6CYWiuA7pFztvfqiYVHmfxj3dKz5sMf8SnF5lKKtZsCCLsnUOU8BUJRm9p1R1D7mrLIfwBo8t0
	zsnIXR0Pbx6AXqv+Hb/JDIlM1lQOacKxuXbe5wSb2c+q0r5h2U=
X-Received: by 2002:a05:6a00:4088:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-84284db3e9dmr6388043b3a.14.1780557197386;
        Thu, 04 Jun 2026 00:13:17 -0700 (PDT)
Received: from localhost ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm5288169b3a.42.2026.06.04.00.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 00:13:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 00:13:15 -0700
Message-Id: <DJ02UJDHW927.1ZCLQQ77E0I95@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
 <chleroy@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] char: xilinx_hwicap: replace in_be32/out_be32 with
 ioread32be/iowrite32be
From: "Rosen Penev" <rosenp@gmail.com>
To: "Michal Simek" <michal.simek@amd.com>, "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602035717.623208-1-rosenp@gmail.com>
 <878fd338-b4d0-4e46-987c-5a0ee52989dc@amd.com>
 <CAKxU2N_U=Wk4f9ankopVBMRGH+YdTn8FOuyoDs4Of04o63bTHg@mail.gmail.com>
 <e331f8d0-11e7-40c1-b4f5-76a591e93bd9@amd.com>
In-Reply-To: <e331f8d0-11e7-40c1-b4f5-76a591e93bd9@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_001319_052718_A3AA859C 
X-CRM114-Status: GOOD (  14.05  )
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

On Wed Jun 3, 2026 at 11:30 PM PDT, Michal Simek wrote:
>
>
> On 6/3/26 21:52, Rosen Penev wrote:
>> On Mon, Jun 1, 2026 at 11:22=E2=80=AFPM Michal Simek <michal.simek@amd.c=
om> wrote:
>>>
>>>
>>>
>>> On 6/2/26 05:57, Rosen Penev wrote:
>>>> Mechanical conversion of the ppc4xx-specific accessors to the generic
>>>> portable helpers.
>>>>
>>>> As a result, COMPILE_TEST is added for extra compile coverage.
>>>>
>>>> Assisted-by: opencode:big-pickle
>>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>>> ---
>>>>    drivers/char/Kconfig                     |  2 +-
>>>>    drivers/char/xilinx_hwicap/buffer_icap.c | 16 +++++------
>>>>    drivers/char/xilinx_hwicap/fifo_icap.c   | 34 +++++++++++----------=
---
>>>>    3 files changed, 24 insertions(+), 28 deletions(-)
>>>
>>> I don't really mind about this because I think that we can also remove =
the whole
>>> driver.
>> I looked into this. The problem here is that there are actual users
>>
>> arch/microblaze/boot/dts/system.dts
>>
>> and
>>
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dts
>
>
> I can't see users of it.
Hrm looks like I just grepped xlns,xps and found system.dts. You're
right.
>
> on v7.1-rc1
> $ git grep opb-hwicap
> Documentation/devicetree/bindings/xilinx.txt:126:
> "xlnx,opb-hwicap-1.00.b".
> drivers/char/xilinx_hwicap/xilinx_hwicap.c:733: { .compatible =3D
> "xlnx,opb-hwicap-1.00.b", .data =3D &buffer_icap_config},
> $ git grep xps-hwicap
> Documentation/devicetree/bindings/xilinx.txt:125:               - compati=
ble :
> should contain "xlnx,xps-hwicap-1.00.a" or
> drivers/char/xilinx_hwicap/xilinx_hwicap.c:734: { .compatible =3D
> "xlnx,xps-hwicap-1.00.a", .data =3D &fifo_icap_config},
>
> Thanks,
> Michal


