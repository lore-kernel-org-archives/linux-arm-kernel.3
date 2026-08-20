Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE21C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eL6FQ/USBPX2RQ0Gd6bBRBvrCoiJLr6erKFtCfBdHw=; b=Rzw/GUpPDK2rbTYTM5J8DKeSfU
	Cv+DWABPy7iQ3w+U8tj6/1wE/XyxMvaSoNHPz+jCbiHV8lObtRwn5EIdC4Uu2S/VwLlVpdVfpmgd0
	KeVT0vQHFLXyqxEakzSjpJiXUPoZY/CGWET9bfunh7UzA0X2uMKWjO1oEpVN1aidznocboffO4REb
	B4cqqHegGh+jfOvUfnkNSBI0XHPR/6yXXGc7KeGkF+2xZjahr+1HsDpVIiLNbEQu4ySnIBjHwAEN/
	VWEF9dK3ivf6xFs8tg2YCuJ4H9Ua65nITRfb4H2sx6Xi1xPBa10iMis+1NSVOV//DTGKKHt1wdWuJ
	vHz5gdSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6nW-0000000Byvq-1DRT;
	Thu, 20 Aug 2026 17:43:26 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6nU-0000000Byv0-1RCi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:43:25 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-45eddb6fdccso37925fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 10:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787247802; cv=none;
        d=google.com; s=arc-20260327;
        b=ToNIZ8PACMiXyAoKxhp3AnsH4lSSnuZTdA7V0BNsw1PWac1D+NgEVUXkdRyRbBzdM2
         9HApgDBoak8gk5/G9t9hK1xTkzxwP/DNwHiFKajGMFhjM+bo20tylFuZiEQ6JNllu3nE
         3zj3tnhw6kjgeD1mPNoBBKDvB+B4FGC8uOLL+eQLBQBneA2F3ebA/7uKYXYryR9o2a1d
         0Y1BOccNgix29Vo69xpJqFbxz0xoMssIOJqWJnRl5J1aHqIqVH6RTXyeqv8lc5f2X662
         rGJQbM6ZXoWdeFoAG77HJkff78lBssv4qKR0qckZ/ir2BMLjhcmQuciElDh9wmGnipIF
         mFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7eL6FQ/USBPX2RQ0Gd6bBRBvrCoiJLr6erKFtCfBdHw=;
        fh=yTaWl60RHr0xWkBRHwlYeNEGxKQ2KBbpjfjZ7aMIc74=;
        b=JFYhlGoLUKGRehbIlCLscSReYTnh8Uug0T+vJ1qdkddEGlunB64Jlay1u+ej04TM83
         z47Bfz3etf658PTP9W4rhtdfQSjepdpL6XvYgsgS81wZ6gem/X48vouFvDgr1KR6trrc
         rNH0y/Ohm1hiPmJvRPwJorC068QDwi8+8oBnpqyzjDMzY2mlzdyIONtxm5ZGSnBplgpv
         7BMBEIKw0NYgeA4iaB7CMq/m0KAniDP5U0eW9/QEoksqwh9hmtok2woIBPUD4k+8t3TM
         ViVr12BrOefEKv4WrJZdS0ROBNd2bdfQGZJHe5BMmaXnHCCRM0vTfR6kFKTT/zsdQYI5
         7LRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1787247802; x=1787852602; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eL6FQ/USBPX2RQ0Gd6bBRBvrCoiJLr6erKFtCfBdHw=;
        b=Fl57clsIkuGMKr/TEWKDbpBwunPIlnPak2ALGgvEUdMiSpm/AapJz7IV7aFfWLpCMa
         CytdPpM9WS/CAfNMJ8Oz4RnRGt8+We+dVfYb3ZO+vExIjXvdsIBAu7eNo4v6FeBNiFdV
         QJvPQx3ZTOcrmaJYoAmXW33pf9v9KSDHQKFA7+1BpI0sUY8JbJVED+jpnoVyb633KDvL
         fLrt45dVZfwFybx2zlvvUu8JGrB6A1QUy+Fk+JYj43MrxGRXRfZTx3Y/oXBzK0kj4eAP
         skT8wt1a/EPViJjGMgzBBc7VKQohJyZjHEgpbbmcfbiyNFmup8pC7ChMEN9sGzEZgvIp
         KVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787247802; x=1787852602;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7eL6FQ/USBPX2RQ0Gd6bBRBvrCoiJLr6erKFtCfBdHw=;
        b=IOcsuFONlRqioRZGfbD/PiW0KCIbehXEykZxwrHoos4iA4iDMivZRCsu2uUde5F7eM
         O36m7nqFhugyR2l0lXD86RsLV26NU7rh/GcG6yiAUSyYKXWiQZLz1b7w+uCeckFhXhA4
         ymiCOMv/bz4gHIt0AeT/Sre5/+PsVSQBChkVF6IJBJa80mvf0zxHxo034ewWAiZZzuyl
         mb/ojPuO/dv+zlnM29QE71puvgiUix0bDLVNKHsmzsjIJ1oPlLfD5AMuFRaIAE83sytp
         +OWFZ/PmwGcHhUfUzit/DoG+YyQb60DY+CAM/w26NN0VFOeBZapOcfJ/94zyUaHiR0xt
         zRig==
X-Forwarded-Encrypted: i=1; AHgh+Rq/HJFt6sMePoJVRHArTjhWTFzX6t+NPUIDyAyRTfmqOYoOhv5NHzSFBCFT23BhMnGHzDpIAnAV6oqpQaNKlUGX@lists.infradead.org
X-Gm-Message-State: AOJu0YwC7dtn4CH+pqvjA1QgMFB+zGTTU1Mhdu75N/xECXvR+u67J16M
	ZwKwDBM1ILC6v0KJ8HS3NdJLoYQUkspJpT7H82CHHhf8i3OZl27EqHOAdqyS1AHLJydNGQrc6Nh
	4IgNmbt2i8O43yysIDIXGZv6n9pxVgogJO4FM9yz46A==
X-Gm-Gg: AR+sD13WCVUaikjUsD74AzAGpOKTCJyXQH1oU22RFa8Hik+RMslcqkMvJFU6XPme9AN
	t1L9WevX9Hk5zw4pE7esyOUzelc8etYW/AD315t/+H8hQOgFg4IFi5mxzxOE7bg1uBSCLkiuJsb
	8xn8MVtogUIiJOMAgERirvoJbtUinWaeCH1IO6dvOkuj2B60oF996Tr77JQT5gPIDJRJWEDbdTs
	LB9N4ZFQYaYCv0vSSvscSg1vFOm0PMQNb2IyqpoZiguiqMAfWLSwOD13jouTHvssReKwNe8Kvzw
	SPjgilGIUg8uKJnNbIJfBKcQwuYEZChgRyn3o+jcd070Mgi3XzpVpzmnHEChjNPJ9pVAs0yc4iF
	7SIHtkyBUpuXwf05ESJlDWmQzJTsfcD4rOt8YgxEkp7VOOsIOHE8Z6WA0ms9X
X-Received: by 2002:a05:6870:610e:b0:45e:de9f:e019 with SMTP id
 586e51a60fabf-462f69bebc7mr14233259fac.21.1787247802475; Thu, 20 Aug 2026
 10:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260820065340.3765457-1-gonglinkai@kylinos.cn>
In-Reply-To: <20260820065340.3765457-1-gonglinkai@kylinos.cn>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 20 Aug 2026 18:43:05 +0100
X-Gm-Features: AcwNN1W2Lre5-E7B9PhxwavzSSjkrGP8rkzlLuGb6eam34DkKNdWQZ4y079Jp24
Message-ID: <CAPY8ntBO5Rk6dEcRc9SgYKpgF6=KBxg7STpLT02whQ8pY-BW0w@mail.gmail.com>
Subject: Re: [PATCH] Input: raspberrypi-ts - reject out-of-range point counts
 and slot IDs
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Rob Herring <robh@kernel.org>, Eric Anholt <eric@anholt.net>, 
	linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_104324_392579_E875D879 
X-CRM114-Status: GOOD (  24.34  )
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

Hi Linkai

On Thu, 20 Aug 2026 at 08:29, Linkai Gong <gonglinkai@kylinos.cn> wrote:
>
> rpi_ts_poll() copies a firmware snapshot and walks regs.point[] using
> num_points. The array has RPI_TS_MAX_SUPPORTED_POINTS entries, and the
> GPU is documented to report 0-10 points (99 invalidates the copy).
>
> A corrupted count would index past that snapshot. Slot IDs are a 4-bit
> field (0-15) while only 10 MT slots are allocated. Drop the whole frame
> instead of clamping, so a bad report cannot update a subset of contacts.

This touch driver is only used with the original Pi DSI display when
used with the legacy, firmware driven, display stack. Raspberry Pi
have considered that display stack deprecated for at least 4 years.
Our guidance is to use the edt-ft5x06 driver alongside the vc4 DRM driver.

TBH I'd support dropping this driver entirely. Will anyone object if I
send a patch to do that?

> Fixes: 0b9f28fed3f7 ("Input: add official Raspberry Pi's touchscreen driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>  drivers/input/touchscreen/raspberrypi-ts.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
> index 841d39a449b3..bd63d95c094b 100644
> --- a/drivers/input/touchscreen/raspberrypi-ts.c
> +++ b/drivers/input/touchscreen/raspberrypi-ts.c
> @@ -78,6 +78,7 @@ static void rpi_ts_poll(struct input_dev *input)
>                  ts->fw_regs_va + offsetof(struct rpi_ts_regs, num_points));
>
>         if (regs.num_points == RPI_TS_NPOINTS_REG_INVALIDATE ||
> +           regs.num_points > RPI_TS_MAX_SUPPORTED_POINTS ||
>             (regs.num_points == 0 && ts->known_ids == 0))
>                 return;
>
> @@ -87,6 +88,9 @@ static void rpi_ts_poll(struct input_dev *input)
>                 touchid = (regs.point[i].yh >> 4) & 0xf;
>                 event_type = (regs.point[i].xh >> 6) & 0x03;
>
> +               if (touchid >= RPI_TS_MAX_SUPPORTED_POINTS)
> +                       return;
> +

Can you just abort here?
If this was with i > 0 then there has already been 1 or more
input_mt_slot(), input_mt_report_slot_state(), and
touchscreen_report_pos() calls which update the device state.
True input_mt_sync_frame() / input_sync() haven't been called to
report the event to userspace, but my gut feel is that the next poll
won't necessarily reset those events in the device state. I'm happy to
be corrected by someone who knows the input subsystem better.

  Dave

>                 modified_ids |= BIT(touchid);
>
>                 if (event_type == RPI_TS_FTS_TOUCH_DOWN ||
> --
> 2.25.1
>
>

