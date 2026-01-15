Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46359D46612
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rr2uuRVZLqUYSrynWXRUh0/8+Ov/0sGQjhqLxsdA/sA=; b=boJzR2kS351uKxgKsD3ZFKTzL7
	LOdgkmFqFcSfUuI1yL5G1JWs8282ToVmjWUC0DxbJftX9bs4jg7vOdgHShOA7d1mMQA89DqODf2su
	e8FpiGX/sOH37BkLjf4rwXE2pZJEGu0QgPGxHBitmeGZ8Sqd8Ehtg07PbY8rh5o/R7Y2mCeNEc78F
	iaXHCQO8ypeoJnJscNgMftJAozcok8R6tbNcccMEQJu8HNP6gO4xVzrAfFe7FA/od1eJCmtAwRYDR
	LejUQ7hhYzLGh6MfFebZ+0sCl3iEmtJs2228smdyyJIc1Aw/tQ4uWu7c2cxqSaBA1xhIY0dRpF6y7
	TvduWIdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSeM-0000000D16x-1bQZ;
	Thu, 15 Jan 2026 19:04:54 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSeJ-0000000D16X-2rwm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 19:04:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0d67f1877so8420255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 11:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768503891; x=1769108691; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr2uuRVZLqUYSrynWXRUh0/8+Ov/0sGQjhqLxsdA/sA=;
        b=Sns/bn9HzrzNWUHq2Ro8rBRTv01cEOTOKO/l2WJgeOi0gOwwOBHtsTmL+j9KG4p8KZ
         1jUh+1570JKv9ZAl4vdDO5FKGWiAMtSwZg9rNDFJknSniDtU4NuinZvlt3e9nvSmrJhr
         IWS00c+WDzHn+9X2+26mmihmBwNPhWmbgUZv1mk/xZSXSKvyVpWs2YNWvEJcLJsKDRRb
         O3SPDLyPOqy6mteql0q4krff8C/Ypk6qnrQRZDtFrGIY1ZXKCCPIpyjtP9J6BZHJNRAd
         LObY0dryboPnd4+UCl2RHI4J36S3x0sWuFc86cwN2pY0h3JsowEoOHqqmoGc72wEbDc6
         hLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503891; x=1769108691;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rr2uuRVZLqUYSrynWXRUh0/8+Ov/0sGQjhqLxsdA/sA=;
        b=P2gX8L5kXGC9ILa79CG1exU16DUdkkwZRm8j7NR6lL9/muKNVPNukuRSTmTqZIpfgr
         /D5VjxOHeLjwzFpOhaAKipEujb2Pr3sJ+fY6KKjy1YzR084bKhRhWCOo/v2Vs6CNmg2w
         BMPbYoNA/R33SHrGUDA0Tj+HwGQYKqcWJgz6d5CwNPI4tV5bOmaKHwZWsKHL9uJVMYNq
         s8+3fblFwKPDobneLzZ+00D/U73eJhtW1uv+pljskH/9bVY44bKP1XLivEzy84JVQvHG
         aSS/wo19Ykg6XHEPX7awGXe1+590Q9vney7LdTUxGYOIYNor/FvsyOnYoGajj03ecfKv
         kVKw==
X-Forwarded-Encrypted: i=1; AJvYcCXOrIAqRCuRlDMmI+8NNEUEJQSg6EwqRZsaQuRtk1CGlFUuXbKhdhES0B7BUGAmyF2qFy5resYsuWYU7AfJj/7d@lists.infradead.org
X-Gm-Message-State: AOJu0YwtDpGrHlJ4qx3f6pwqfxoY6DPFIoQNIP3jZmhwruoYx7I/IFc/
	HdImuFsJn4d9115JOmuzEBx+gp4fkAiZ8Ehx0zFtEgsXtmwQUGnN25eiqZddRzO/ARunizMwFaW
	zj2o758M=
X-Gm-Gg: AY/fxX5umAayCUjdCVtM0mUWnZXQCeeG1ekhOGszPKHo++I1+xkkfDlCDXNGGm16fIj
	ub88DC04JivXlBkgwWQARtWp5roxsiBbyLJ/VxEbBGBiFZhdc/rvE4SCbP3XWCyKSnqD47Uo9SO
	vfECgy3vK0GVW5+2SH4EfxeLxDNKYKh1kTHjyawSa7VHClqwV7KScZJqW3Ey6qtfa3HQcWTxgXi
	rfGEYYP6JXQKIpJNK4cXKDWi1ILeIJcmKA5Otil3qc0KFTiIIaYmsj3QqbUEPiV0RvC2rrMaDIK
	pkXn8KiTmwL/WjSwc3zk4LzzfQAO+3JTu14pDDfKYQLYxjnT0WSbtC3IGPCJcHwvnQXXghYrQOj
	ECZbWIbGyHvvkLaUb8x6LRmIgAF238oCIgPmmtw3p+sywwi26ypwRfe/6M+7jCcHyAU9se3jUsg
	Zy+aHJAoDqvpoL6nXla1nX9EVYEnNYMt4lJ4iesUlVhzPU9zt0GKHFAHfNWLj5j+oaRg==
X-Received: by 2002:a17:902:ccc7:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a718a743e4mr2047095ad.61.1768503890626;
        Thu, 15 Jan 2026 11:04:50 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd19asm480895ad.59.2026.01.15.11.04.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jan 2026 11:04:50 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] i2c: xiic: add ACPI support
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <aWjlTKrM34lfDsfC@shikoro>
Date: Thu, 15 Jan 2026 11:04:39 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AAB5CE7A-9264-4CE1-8A49-2FD3043B0A80@nexthop.ai>
References: <20260115002846.25389-1-abdurrahman@nexthop.ai>
 <aWjlTKrM34lfDsfC@shikoro>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_110451_726082_0D3815A8 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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



> On Jan 15, 2026, at 5:02=E2=80=AFAM, Wolfram Sang =
<wsa+renesas@sang-engineering.com> wrote:
>=20
> On Thu, Jan 15, 2026 at 12:28:46AM +0000, Abdurrahman Hussain wrote:
>> Use generic device property accessors.
>> Make the clock optional assuming it's managed by firmware.
>>=20
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>=20
> On which hardware has this been tested?
>=20

This was tested on nexthop.ai data-center NH-4010 switch with Xilinx =
based FPGA.

The following ACPI ASL fragment was used to describe the device:

            Device (I2C2) {
                Name (_HID, "PRP0001")
                Name (_CRS, ResourceTemplate () {
                    Memory32Fixed (ReadWrite, 0x80a40400, 0x00000200)
                    GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0,
                        "\\_SB.PCI0.GPP5.FPGA") { 10 }
                })
                Name (_DSD, Package () {
                    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                    Package () {
                       Package () { "compatible", "xlnx,axi-iic-2.1" },
                       Package () { "single-master", 1 },
                    }
                })
            }=

