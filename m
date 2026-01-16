Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A3EC98303
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGbPPoXy/VbK4qXGtABm8Nu2UOw6xSYC7oeE8YmhQMI=; b=MnwEia4tGeqOTJK5thEnjLTamy
	5sFbEWzxYFWaaydWGqHgl++JCyukXDB5O/Tilp4piPYeyXn6T62GNqKhyG6zzNNtorqs5or7r5svJ
	/rlQvHY6mwXCmxmvssobQeTUwfNqGQrqqZyA3W0Cayfwo6h8jcmBIQqa5kcP7n5Tp0wj2GshyC1BY
	FJ1TnCi+u9jKhEekE9LO5MVh8Cf6osYQCWRGOayUxR79sDMBFt65eGKagdSljj/UMGJMT6N4JTA/J
	Z1CkjSxB1zHsPbtiHHN5iB60/w8BEy+VD2bLsEEO7ERp6v4UMTUY1j49ZasKQSChmrRUK3VrWhVwz
	B5ZC8/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq01-0000000EjQX-3Yoa;
	Fri, 16 Jan 2026 20:00:49 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgpzz-0000000EjPw-2csG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:00:48 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c47ee987401so1010886a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 12:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768593647; x=1769198447; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGbPPoXy/VbK4qXGtABm8Nu2UOw6xSYC7oeE8YmhQMI=;
        b=DwEZtprTlyFsDYJhx4F6B9BNnTNjZtYdwdeE2vHgYpL6cpen64vmMPOHcjTiTt9Db9
         mo2SFkdYBwhBVBmIu+dhbgtDP5tPRbrEhzMUkZkWIZIgfeEgjZrUPC0n+E4x/Aa8xIJx
         inNZv72UG0yOfRa3dvEnQkOz9p627zURczDuklyfzf4UWTL9vdYushOcPN47eaxS3tLR
         HzQ45ErdSmis0NSUKN8XSS985TBsW7gUj/F2jo10jLAM5fpQBZr9GDD0qR6Sz4d8TbNo
         TFPcpxCO/7vKf+B0uzuQ/S39SAD8f9+LrrEhi1+Ri9KveyZa331EjUDJlpyKFVGX6804
         ze3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768593647; x=1769198447;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGbPPoXy/VbK4qXGtABm8Nu2UOw6xSYC7oeE8YmhQMI=;
        b=ZBj725T2QWxU7D37k6IyZCokePGlsPTyYrKXs0pun1OAEU/Sl7f35TQoiA/lyCsaKp
         bGE5cMAoeMc3UUMJpIUi2B4wOsdk6D9IeHW3MRnx+g/z2LNTVDf4FuX1aVg7Vky3KTNV
         Yo8Go2dkDb7wvZAZoCWWkdgjfFRBQR+CtDS3yx3B8lyzn1KiiChiYNht8B0fF+MqLIXF
         3iI0V13r7I9KcZMHxEfcwfunN6Hymb4Ht6PM6wkOR3HuItuAkyvBRQyJRZGZ//9RKIpz
         i2mwK7Fps2ob8GhDvDWsOu5h5r5UNuCt+PAeKQ69xY7f3Ecoku8a7JmqXkq9z6LJ2rRK
         n4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCULYczVppbRPlTXs5hlmG9rwgYg7sXVt+WEF1mDDUuPXBcxVwj2icaCoh/15EWjSZ+zp6aGrQkeaLxreySMf64Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxmVEFLJUiaKBSkPOV+tu2f/YeVDUsA19QG2H8/MPEGCFZi+wH1
	CoAHnROP2r2GiQclfBg/zaaD3hdya22RU6qntBTplpDfZiMba7FwsptA/fZTMa2Foec=
X-Gm-Gg: AY/fxX6PQrpVcxto6BUPtYC3mggHHXJA0nYt0snimNozayf8z6/MrZ0CsqAUBDo58zF
	DyprjmA/OVE7sJTSE8QE6yQnSvo+bfsFbMDA5Ac41LoHv3N5JCG+E6krz5rnAkAOj2y1Ue9bKn0
	9Pmv8yWoeIG+sBOApoJ2UZGNSbMitBMiNhu7RpU0kJSLTm5VA5hHQeES0V678/CM+raI9RANHPR
	4yN/Oa2C4dKC3VDoCVUgOI7SOY2cxRbOJvjutMU6JqM81wpjtsktLm42qB4oFFZjs5bkBIOGrR4
	GvQOhkXyQI+ZbssLO3DPFYbkR56uHqCiajO3+2AyXx0b98DFyxWAnvYc8HhmJpDdBHI1usiRlJy
	8L6/hIULq0Yf2FuHCYwA4hRY6Jt1c9ESUuo6JZKmDk0QkK84ddfSMBiSqWudbEw8VUX6qYxqKU7
	rSXM5d6W550X5quR7veIT8sejOySvmBufls+bolDY1kkrd82TMWgT78RPfJT9lMqkyHm1oBRc=
X-Received: by 2002:a17:90b:4d09:b0:343:747e:2ca4 with SMTP id 98e67ed59e1d1-35272c8de8dmr3516213a91.9.1768593646505;
        Fri, 16 Jan 2026 12:00:46 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527312381dsm2750075a91.14.2026.01.16.12.00.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Jan 2026 12:00:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <12f527c6-7728-4512-a4f1-08c778627ea8@lunn.ch>
Date: Fri, 16 Jan 2026 12:00:35 -0800
Cc: Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <87C51F3B-7770-4BFA-8BBC-5E83A71920E1@nexthop.ai>
References: <20260115003328.26095-1-abdurrahman@nexthop.ai>
 <12f527c6-7728-4512-a4f1-08c778627ea8@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120047_670058_C959AEC3 
X-CRM114-Status: GOOD (  10.44  )
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



> On Jan 16, 2026, at 7:23=E2=80=AFAM, Andrew Lunn <andrew@lunn.ch> =
wrote:
>=20
> On Thu, Jan 15, 2026 at 12:33:28AM +0000, Abdurrahman Hussain wrote:
>> This makes the driver work on non-OF platforms.
>> Also, make irq optional, since the driver can already work in
>> polling mode.
>=20
> Are you saying ACPI cannot describe interrupts?
>=20
>    Andrew

It can. We have enabled the interrupts through ACPI on Xilinx I2C block =
and it works great.
For the SPI block we currently have an issue with our FPGA. Luckily the =
driver works just fine in the polling mode. By just making the =
interrupts optional makes the same driver usable on a wider range of =
hardware platforms, with or without the interrupts.

Thanks,
Abdurrahman=20=

