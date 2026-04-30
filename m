Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57540CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 23:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRfJ91dKSszpfdR8DuR6IPrBqkdsGBVokk2DQ9C/ack=; b=IPtN+AFcFzWU3NAabDtMg4stIB
	+HMp2rrELEuT8nE4//sm0OucAgcIATXeNJ+zoMp1501T3ZgJAGCZZveB83l0eVRNwarv85S1FYfA/
	jTwC/0+FXwuxAL/jc8imHcH+EV9huA80KhGkfSOL45z7JiH1sQrmoYbw+gv2EARDXoXZlbXMKVzfI
	Ir27ZWBz4+9yv5yxQ90aoVmZUtMzl+Gukul8I2xPcztKJkMd9pA69TxyyYgVmJFQJA5Z2Lyr5kca2
	8etqdyid2AeoCnItKZD0vV0ty71Y1WC+gNWwBBC7ua2JXNsCfFzMD15oscRf3CM23hk5MsV0kFXIo
	0xr+ubpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIaZN-0000000658L-2Maf;
	Thu, 30 Apr 2026 23:13:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIaZK-00000006580-1sxD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 23:13:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso878510b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777590797; x=1778195597; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRfJ91dKSszpfdR8DuR6IPrBqkdsGBVokk2DQ9C/ack=;
        b=O8WHBEvy89CbbUd5tbkDqxQsjPMtvWAXbpie9aflqfnXg9SkH6KJu/4aiqUD5vFRW3
         I1PZegVJRSb3nX6njPTWDKBIXEl4qH5nM4kDzhh3bIVciweYbya7CwXbgoq2DVvWQ68R
         lfUuIUVbXoolJHHYUWBlbtFS6VJn9Rfk6Zn+RFE5ivVXL/ulfFqDmFxJyEZijgPWZ03J
         ciBzUZc01gXBlt5TmjW8Ysi0bu3lFhfJFZn30LYas8KytmT05UG6MTUpEnsIg+pO9RMc
         1f+6J9HpI4sUEGZ0DrNPCbUvSdzYZaQXTnb5PZdx5Ldy6l2NdDD12bykafBN5+z4sDc5
         4e5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777590797; x=1778195597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRfJ91dKSszpfdR8DuR6IPrBqkdsGBVokk2DQ9C/ack=;
        b=ZQhh4wYASGgNkgQEnXmzZT7wE6BgrR+oCoJdQb6lbKWyF4xmms2tAD8OjDJpthPLyf
         iOik3kqiJyilBLaWihSpLeFVTJW6urfaiK+Nax8NgtPlcPr051umI5fJjjfQmwnCk+Pk
         dMbHTDIUD+Ynrf84VHU37jyE3sLzRNzlutmJBLRJ3eliUlNIkfXaW3sZVFCc87/ax9HP
         PZ8tHyKhipUcCl1s/TQCqmMnm5Ii/hU1A2JQNfyhUpGfYMXwSE0lh1Pl0Sc8zB0uAry9
         HLnhBCLpTo8YCL5GMdym+C/6JvTPINYu6wuDvedbj8RNK86xZRJkqMFx+npUlbsImG9S
         a0iQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XrQCJpxhO/VYqu96U5jpMfApVZY6SOa9A4tKZxCoBRyP1ZlFXkFuVrr0EVJJLbRca+NZR0PeIBaw38U3UHT3u@lists.infradead.org
X-Gm-Message-State: AOJu0YyW93o6Yju7L+VnTfU9ojmE1RsP66horyNwd7BosZmwazeCjIm+
	c0Xai+ZSTO01PfFwv13Tsm6b3Kg/OToCLKTUOcD6dqe7FlOGTenSpb3e
X-Gm-Gg: AeBDietKgRNWpvLuvkWFgbpmr+2p9gsP78ZDeWTcQSVJ1KLRV7M6ePN/AjRZ2cUNtOc
	TmI1ETwNieEwDYDh7j8yJkwHWiAmlBq5LkZRLXqWeKT78cE4k9CZgEWcpLxdRV3dPoqeH1DPTEY
	80a2NHaF9S3K7Ntbi5uViRX65Py/NB+gnpFh1ZidTMCgF27rhQMDBdAFDTuVL/pqso57FoW7qtB
	CdxsDbra51Q1CAKrSPl0yd7SlzP8gntHsM/NBOp1ewG/hFVRr1jzstmRl9Iz+anlOgQ22d3yPbJ
	HSC1UdQrt8hrx0mKDsfasWd9D3rs3qxvCyaq9WuvATEDp06KD6QTIWNofvyYiZ3jr4qER/acjU6
	jLLGY3gqlkQpd3pgsuvznVp9j0IEET/riu+SRdGvHiGLsgNLZYF1SvIu6p9JDTPXc+xH8+r+8Ob
	36QItz1JkA1YEQ7LYToJx6FIzH11K51GoGeNw32UIrJ8sPiiA=
X-Received: by 2002:a05:6a00:430c:b0:82f:5576:2853 with SMTP id d2e1a72fcca58-8351a59ca27mr541087b3a.30.1777590796764;
        Thu, 30 Apr 2026 16:13:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0049sm787335b3a.33.2026.04.30.16.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:13:16 -0700 (PDT)
Date: Thu, 30 Apr 2026 16:13:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 1/3] hwmon: emc2305: Fix fan channel index handling
Message-ID: <2bce6b65-d09b-4237-be0f-3b53698d8031@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-2-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-2-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_161318_492538_74B37610 
X-CRM114-Status: GOOD (  12.16  )
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

On Wed, Apr 29, 2026 at 09:59:53AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The fan channel index is used to access per-channel data structures.
> Validate the index against the number of available channels
> before use to prevent out-of-bounds access if an invalid
> value is provided.
> 
> The thermal registration path currently uses a sequential child index,
> which may not match the validated channel from DT. Use the DT "reg"
> property when registering cooling devices to ensure consistent
> channel handling
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

The problems found by Sashiko are real, but they are pre-existing.
The locking issues are pre-existing, and data->pwm_separate is for
all practical purposes always false (there is no upstream user of
the platform data, so it may well be removed), meaning there is no
separation of pwm channels if the thermal subsystem is enabled.
Given that, applied.

Thanks,
Guenter

