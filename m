Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86AEE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 23:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9XPKCT8QhEaC9tNgTUGx1mSYdmp6MzCOvuxEB6mhcY=; b=Nubq17sSlUlxGZAacNuaaUWqxr
	zWvX+V/lbrdJiTf6tSAuOmvBBakkxtlG1Mo2YOet8nwvsZTnPAQNIEGZ7S44dP+8M7kXbtzYGwSyZ
	HKeS0CthTE16EM9jWE9dX1uBb3tfOLudHSPXyfncqF21EkDlUXcaIhIh4SfUEmT1v6uufb43Bz9Wo
	cm8lDY6hhNfH3h5HrIRlaoG78xco5qdUKYRqAXrBwLyke+ZiQzMJMgP2dPxjeG43BnDGMFtIGIIL2
	T4cQIupYbMoHvcGjk3WL6JeAa3aai2vlKlVijNijBLy1EsBxhHJL/wOTkiZxoUCOdi65WWkTv6xVr
	m5DBmlYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW27D-0000000DZmf-04P7;
	Thu, 09 Jan 2025 23:39:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW25z-0000000DZcb-28zH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 23:37:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-218c8aca5f1so30926425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 15:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736465866; x=1737070666; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9XPKCT8QhEaC9tNgTUGx1mSYdmp6MzCOvuxEB6mhcY=;
        b=lv/s825PtsvKFIz+5/z4mUrijyqHbid89O+WRyAU2OkewCf2bSqS+aeVyitnwSnHSm
         SwT6TF7cpCLggN0YU1zGaW3+Dzv5/OfS84wqKYhAPYI37d9TJw8/apoLIzhwATL8sMor
         448WjJsL61no+9WSL+MXA1Wuiize4Pu4a6kYznYvAVfWc/HSkbfCXsMJW96aScjvDPns
         h4y4hTjds8T11hGOfy8yJeojO/iVjey2C0/wC9600JMLOD2l3UO2bhjLLygi/AVh2ne7
         tJ9O4Tq8tYUKj8RPVbIktnAyCz/eEvhU7jWJ4zg/AMhIJ86JnMpA3KRq2/aophYtLkSe
         c4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465866; x=1737070666;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9XPKCT8QhEaC9tNgTUGx1mSYdmp6MzCOvuxEB6mhcY=;
        b=ajPvlwRqoTfkoczaWexKJ6YhqKZ4j9mY1SW2dzFTU5Kn0UeXmV9NVMrfUTXGSBThIb
         fMbwJsi3tzNnhk22CQuLXHoUntQ2O0aMpBxE5i22Jba8pe37aBsgnVd6ZYCVzbao/Bc+
         8MAic1VWG6nhPX8jevwxLzyqZaNm2zw5u/JfSc9Yt76CotI8pt4fJdKjM3/hVg/QBlkT
         YG+AkqAIulkoFmV/4TXY+fs0UtRzG6l8BoYXOqZvG4DsunDXc2FBdX5+wOsIyz77xccb
         fCp4FxCu+/XeimYz0SNWiMgyD7fTnjccfK8jQ+eMpUajhBo/zln3ypsdfIvH7tBZA1pu
         dNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsbtgibDwSCiEKmTdhLJ27tUAmkN8dLc0QH9maI/PNHwLiVbgc2Vv2A3vK/TJFCTGnYlj1wmR7b9picVW0f3TO@lists.infradead.org
X-Gm-Message-State: AOJu0YyyXFKu3ON/NoOiSDNKM1eiQTlbJVVzQ1xMwnHWiGm0XX+8UXM9
	KjGhM1ayEj9qZ8W9zrMjFiNgFfilLKtrJviYUQe7+ORJ+nwnbcQhijmOii89yA0=
X-Gm-Gg: ASbGncuaPSYUqJzOVt5ajWYp5XupYj8KlqrdQzB0KDwapLrp50GSkB0TzmEpL7G0NyX
	WtCD/a9XyTkQ34L3ncOfuuuQU4fkwnUEC3bQGOAagFUI52gmj8UE1nbQrNfo5YCZhT/Bt/VOMuK
	hDGlIokbK49Hx82Bq3q+ynsKa/I9Bscxw8GuIA7JlGFAtT46ZNvmB7omCnYf61W2dmrLDCn2ASA
	rbAnXRRWmuyr+YDJxQ3Fnq4cMQ3ZIIaFDN22drPwtjk+unAoNnRqGU=
X-Google-Smtp-Source: AGHT+IEfEBVr03htPuKk7GnouY1uEKaeksFavfal49FWtSio2uOLv2gDake8CxsSp5RKbe2PLBGoTA==
X-Received: by 2002:a17:902:ce11:b0:216:49b1:fadc with SMTP id d9443c01a7336-21a83fe4b7amr134857165ad.42.1736465866394;
        Thu, 09 Jan 2025 15:37:46 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219330sm3186745ad.132.2025.01.09.15.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:37:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: soc@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm/omap: drivers: updates for v6.14
In-Reply-To: <20250108091348.46f71e35@akair>
References: <7hcygyb3yi.fsf@baylibre.com> <20250108091348.46f71e35@akair>
Date: Thu, 09 Jan 2025 15:37:45 -0800
Message-ID: <7hldvj8som.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_153747_818872_B145D145 
X-CRM114-Status: GOOD (  11.70  )
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

Andreas Kemnade <andreas@kemnade.info> writes:

> Am Tue, 07 Jan 2025 15:26:45 -0800
> schrieb Kevin Hilman <khilman@baylibre.com>:
>
>> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
>> 
>>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>> 
>> are available in the Git repository at:
>> 
>>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/drivers-signed
>> 
>> for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:
>> 
>>   Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)
>> 
>> ----------------------------------------------------------------
>> arm/omap: drivers: updates for v6.14
>> 
>> ----------------------------------------------------------------
>> Andreas Kemnade (1):
>>       Input: tsc2007 - accept standard properties
>> 
>>  drivers/input/touchscreen/tsc2007.h      | 2 ++
>>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>> 
> This is input, the only reason that is goes via soc to keep that
> togother with
> ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

Correct, it's going through my tree after agreement with input
maintainer, Dmitry.

> So shouln't it go via your dt branch?

Since the dependency is not a strict build dependency, I separated into
dt and drivers like I normally do.  They will both land in the same
upstream release, so should not cause any problems.

Kevin

