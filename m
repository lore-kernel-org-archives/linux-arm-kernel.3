Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026C1CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8AkZpbZCTo7d3LdnWMBBV6pSxnl3OrCMz1va21zOtM=; b=SF466Bi102oPii77LnaGHnWDIW
	OeC8HVN9yOT2aMOCr/BAp3+m3NTLdNp/SpMsuinh9fcPx+JVQCfp7mxq8oI0SaMnYRdt5cMKSwa8r
	iKzPRQoQQnnzquh+XVreROYy5x9Jg0r8vUK79u5jhISBk1eBgOPIC1LzWrI/87UUX26lj0o4x0AUx
	QTTuqHFXBJ14zrtvI7louxokEw675dJQqn28CK4aiWuwznS2Rkyam7fCzpjpSOxTOWkDTs9TwCxz9
	R2Xp96V9HRp0N1z8rLBAdA66jXByhZEUSSB6ME1/HZ0ei0xoZ1+EUcvFBsSSvir8YvOnznAC808v3
	gKg/DIZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPh7Z-00000004hNT-2nnK;
	Wed, 20 May 2026 13:38:01 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPh7X-00000004hMe-1ZA5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:38:00 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1357c851a48so5112402c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284278; x=1779889078; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8AkZpbZCTo7d3LdnWMBBV6pSxnl3OrCMz1va21zOtM=;
        b=HZXMJrSXzjcXceIp/syic4MTrsgV6n4kNP8mKYv0jrKbFQRIh/bxs5bFWIF6K4xexm
         9IoCXCfcnkwBz437J+N1I/pYdIbNKYvftblgafbB10cZ/QOSslsJE+igfMESJ6e428I0
         SSxJHLjs1JRD6vRKmEHoZqt56+wp7J3PEgC7Ulfkkg6XQPydlE7dlPTk272J/sX6wEHj
         EDP91EAZfF3QeH9X2bT+wDca/ZmEHiakkKiuDUKt/qqyokmh4XwWDGvTtoZ1SMFPbgE3
         Sa/AeJURlBR2D/u3bGr6xGoeRfCJk3sceUfQg6yr+L7CC92tSKlIBXWjUrhDEBjg+mCi
         ivUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284278; x=1779889078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8AkZpbZCTo7d3LdnWMBBV6pSxnl3OrCMz1va21zOtM=;
        b=Edooa1T9QyiTGaigTWhoVUcSNjBFkY+Cp66n2RiJ3KPBoqqHjq2TbYp7G0oyU0ci1Z
         LMSAb6n4OqU9fZBnT0/wyhfsB9G2qTtO/ZklEFZBmGWjrFrz/pb5IW//f/xVLwgsVPdg
         YWlxyA/vqQKcJ008f1LPO3cFnr40I1WuuhOQDxPmHs1K3Fv1Go8jYnQXnmhK7hQiIoAy
         2JECgPycgCqfNBoQNIDfJKeubKj7lmfFYfYx4K/qhiA+BR1FMgIx9BKnopRJILIcHoXX
         en6b4XR0U9nWzPxIchoJtFllE/k/aedargkqbJjsqSKsiBDetF7dToSkOi35ZUXA3ZAp
         fbNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tCHDp4yRsoEKizmJ218RPTGGDoUzVNxDHFv+Vs5oXgX5SMO47TSW2hIuvNgCEKZry11wHwbAfKh+heGLP8TiI@lists.infradead.org
X-Gm-Message-State: AOJu0YxQs15T/v/jDTwZ8AcO4J91GlHs9O5Vk17qLk0YWmv2lrxrcKU3
	8e1jMqpq/9s66lJI9gy4SqrR0t0ua72CNq7ttJmpeVXw5Mh9RM4RCWvu
X-Gm-Gg: Acq92OHk3Mcb8sSFsLPYBpotqfVYIHz43lc/0R4Sd+gND+ozI86kq0FQr39GjgjsVHm
	xgJqoX4WcYbJDsVrS3kLWwXPdJpWo1RjFFJONTmpyD70yZev1c9Th7N6uE85XUWa0f0i3mESAtH
	EgrbZf8qP1AkZN8rwdixM+wfWn09I/ElnPx0e36M895N/XgRBTmLdFlulAYYAvJmsFIBV5WNmzu
	BXKlPr18KAQ3mvuiGjhGK0z1DdvNbNIPmQIEjAmuTrHpWmbgRo1BUvc2DnBZVYUs9bmImPedhh3
	I8YmJl4fGz4lbMeRnTIGqkEaYOn+On6wm9chfmX04oRBr1FJvspgmzNJxv7yZiG89A5nhRCYcDs
	yOqOgrShrFDXZtw/kQp1palcjWyJ9QJ4J26whi9MBiwKaus+YnNpd0DFsTbPTqErVlfRr3PPN5v
	A32Tkh2eo3WgaA3OoRoyR87FqAoLyILbPERnBsG/DhC3xfz5w=
X-Received: by 2002:a05:7300:6429:b0:2d9:2b54:ea9c with SMTP id 5a478bee46e88-3039867e6efmr12060147eec.18.1779284277938;
        Wed, 20 May 2026 06:37:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffb85sm19200837eec.7.2026.05.20.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:37:57 -0700 (PDT)
Date: Wed, 20 May 2026 06:37:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: raspberrypi: Add voltage input support
Message-ID: <ffaa4944-e839-4de1-bb6c-14008a81cd06@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_063759_406385_76643F5B 
X-CRM114-Status: GOOD (  14.26  )
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

On Sun, May 17, 2026 at 01:34:44PM +0530, Shubham Chakraborty wrote:
> Extend the raspberrypi-hwmon driver to expose firmware-provided
> voltage measurements through the hwmon subsystem.
> 
> The driver now exports the following voltage inputs:
> 
>   - in0_input (core)
>   - in1_input (sdram_c)
>   - in2_input (sdram_i)
>   - in3_input (sdram_p)
> 
> Voltage values returned by firmware are converted from microvolts
> to millivolts as expected by the hwmon subsystem.
> 
> Update the documentation related to it.
> 
> The existing undervoltage sticky alarm handling is preserved and
> associated with the first voltage channel.
> 
> Tested in -
> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>   Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied, after fixing:

WARNING: Missing a blank line after declarations
#207: FILE: drivers/hwmon/raspberrypi-hwmon.c:74:
+	int ret;
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,

Please run checkpatch on your patches.

Thanks,
Guenter

