Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E782DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2dV97Swt4/e5f9g/Rqt4HIDaRD6uODi3JQK+KHXyCU=; b=U5huNsn1j+71ANWF0G63aTLgfu
	ESh7MqqL3KP0xEQcXh9Bv5HU1Pgq7wCWv35GxMoZLwR5y/Sh7rlmKkVZsfolzTc0Ix6M7+t2DO72H
	+t6pT7sYnu/CP7K4fIYdP/pb1nQBE+aOK5/B8S97zz2I5P+RzhSqysLhu3gG4yeb18Bit45CV/+3v
	OH9olWrXGROed5a016sxBnDS5gMPMcZ01zbTyWQCa9MxhF1vTJAAVIBlRjAzl0iAfzhccL2FrgIgK
	VKJ3mWxg3RmXAdEtyx+qjvhn68OQzQq4sbEH1PnbKe+3d7W9W4cOpo+Y1b4N+/ItSiMP76ZSfZ10f
	6rcyvrAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBE4-00000003jD5-2YPe;
	Wed, 27 May 2026 10:11:00 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBE0-00000003jA3-3F1L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:10:58 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso19484932a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 03:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779876654; cv=none;
        d=google.com; s=arc-20240605;
        b=I3zY6hMI9t3IFHF3qHg+qt4Mv0vopwb1mPc0baIN+lO70wEiq+BTXU7Qk9zqcafVyc
         NnO8yy7Y8BS6xyV0A5y/A9fowdqm8bfK9d0AmLZyqMOO78VmcZ9hFbM701VercSjZrup
         8oastnxcir9MjlMh0i7dMAZ6R/t5L65nczd/BqMxS/HpLOi6xHY1HJnDXN2Qa9wdZGfY
         nNqrZDqDmANOJpBuFyFhJIUrfAHLp8Rei9zTHLdNIdm1GyXBzXbNBnUsQLnQcCAG8Gw+
         uT/qQoPCntzLjZDTmv7Hsm2zcEfzEX8FwUq3NYESU2uYMt2zcaFlOZbosM85Jw3LJS7g
         tHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G2dV97Swt4/e5f9g/Rqt4HIDaRD6uODi3JQK+KHXyCU=;
        fh=fRNKpybCnFwq9eV53L+0q4TDFyiZHo5f+qsHaXzpXzM=;
        b=iWmpM+xQ9viODy9FjpghCeda4F6zIo2v7OEkHFbbwQpCp/bWqU5wRtX3EJZpel38uR
         EQNf/37GvagFQvtrHRPzRiqw5ogjg0fPjvUn6rCDb2sG6Kj0Emf56F2Mqa0aQlWMaaHb
         ycIdUzqmueqh19NUAZdXcZXaY1awEoNSJHxn0Pd390+gjWJsUGIUW6gZbB1QGfplNYRM
         Y2nWmCyT9Fq1J9WNvmcB5thmQKEVzXdZA6p0+hk7J52FeFIcfFKtwBY9ziQNm4YOn620
         MNUI+OFQH5SEC1ais3dnXVp8CU/v5td7Kfa6xEXAXB3NbZikpt1wkrmUJzgEifnHjYxe
         V/aw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876654; x=1780481454; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G2dV97Swt4/e5f9g/Rqt4HIDaRD6uODi3JQK+KHXyCU=;
        b=c1yhmXnhrBbTWScUEace1dQ0VQF7tQ6K2gnzKkosnqDujbUa1+ifxgqBFfFShKyi1V
         DgNi9ck+GqqNo5tYlbwoqTsZCuvGiEBoujHpE6hQfsxokRh43gA88ThFzo4U4ODLw6As
         MRy8Tyb7dhym9iB/aCEp0wl4xCoAeKqV7lz7mySYjDpmW0AeHW1AxvPaFgGutQNn5EC1
         +AB2pq+h3DghKzVU/YR7iB/6TPliiJOEG0WgR9RHugI2I5vqdFGT5cJkR18p5PsQrHg/
         Pqwq1euApjVRRVMXM2vMMySNiL4jPmLmD5cSgqgKLH8f2paIcC/Hjgmk7yBWMZCeLODO
         7juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876654; x=1780481454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2dV97Swt4/e5f9g/Rqt4HIDaRD6uODi3JQK+KHXyCU=;
        b=no2W+aeO7PbvZU4Hu4pN1PsCsVZIhWG9UqzYeeVhqSKjuQsiMkx7SFEDAwMAtQ1zjf
         JKEj8rBkn3IkDGrHVNzlGS2VVljuaOWr9/UrIE5VKozzLNgbYyAYyD1glC7Wye1fcZ83
         hIFA3rD1wnwwQ8tK6aRTIgMvFRTPMY1e5r/ArKQRCKkMcWd3c8VYzrdKhUGH8P5er3ax
         1hdoFkAIGk6sZL9weMAdu3LBEICzKrHTLsj9fmomqU6PkugO6PbQ9eNAOBiSt78v1pQL
         w9dpCHxvUvX+1yLzDbpg+V1FqWUUKMqBaDj66kkLpCeZlmQc33k2EUw+PivClxw1Rj9b
         iuQA==
X-Forwarded-Encrypted: i=1; AFNElJ+xP3r1teCile3r89YkatNy8NnH5FbWXKvPy/wzqDGpzJmgrYlvvDQPDoMx8qxxwpyx2d42Ih0B1or6oSem1fTw@lists.infradead.org
X-Gm-Message-State: AOJu0YwOIjUKPFOFPkFrzD2bDAg/bXGPNU+YWxnqbKpP3oCZ977XJOOz
	kVmOLW3ZcSmXqTnq59t1d1fxRL9dtoj+wtACfJoSPylbgm+97J5OhtZrz5iqxUikBN8+OqHhV2U
	L4Rrx8XT89notGgKOPzefAy290upH8I4=
X-Gm-Gg: Acq92OGAfVFeMgnMAHQGMZ3b3Xp3ZDIaokbR8svr0cFgOOjeJ7FAtKHT1O0VHGQ1e2W
	Bu51DgX0R8jLM9ujA2GS7ExdrOUXk9OBe5qk1ZN6C9fVdPnJI+DMSBs9LWzIz1xaJeemulhAepR
	h9aLq9ynxiImbaPkIT/ud6NIwgvlciFDEba7D4OF3wvG4vyRqEJTD+2d6bKf5TTImKked3i+Hv3
	bi9rspJn+TnCPrYE1+Uu9rBvecTu2WERDfWHkvNP8yn8deY0R/mYAW94BXdNmJ8i7Ctq5LT8aaw
	2KgkhyM+NAqH1kFaCTOxBjhzeVLAxGhQiMxTRoFis/PYR6ScaxCV6opgf/hzooGZk48LRQCIw/j
	fDNapEqXDc9CtSns08GAq08vSt5A4sHZ8/z5W3pj/6oPG6ul8fg0Z94DSWFyyiS5G0I6u8c0tEU
	Z5+1746M652yE=
X-Received: by 2002:a05:6402:e10:b0:680:ccda:55b9 with SMTP id
 4fb4d7f45d1cf-6889c47031cmr11491623a12.16.1779876654100; Wed, 27 May 2026
 03:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260527100439.2507-1-always.starving0@gmail.com>
In-Reply-To: <20260527100439.2507-1-always.starving0@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 27 May 2026 11:10:42 +0100
X-Gm-Features: AVHnY4JlPoKqCIKLNNrN1rX1iqDaxTF9BRFdMP8ybmx0B9GH7QE8opWQ4tR49D4
Message-ID: <CALeDE9O74SBUR_ciurgvBC=uXyHELHab0du024CysWQUMKUEiw@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: bcm2711: Fix typo in gpio-line-names
To: Jinseok Kim <always.starving0@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_031056_829278_D1DED0C3 
X-CRM114-Status: GOOD (  19.35  )
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

On Wed, 27 May 2026 at 11:05, Jinseok Kim <always.starving0@gmail.com> wrote:
>
> Replace "RGMIO_MDC" with "RGMII_MDC" in gpio-line-names.

The bcm2711-rpi-cm4-io.dts looks to have the same typo so likely good
to fix them both at the same time. Should probably also add the
appropriate Fixes: tag,

> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---
>  arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> index 353bb50ce542..5469fa663526 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> @@ -110,7 +110,7 @@ &gpio {
>                           "GPIO26",
>                           "GPIO27",
>                           "RGMII_MDIO",
> -                         "RGMIO_MDC",
> +                         "RGMII_MDC",
>                           /* Used by BT module */
>                           "CTS0",               /* 30 */
>                           "RTS0",
> --
> 2.43.0
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel

