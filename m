Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474C2C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYNhQ6Yi/iRYbkVUGBJRb8uet/bvchjSmRRTPBWP7EA=; b=LC5nOnMkjbKAPqoaHtaEat2fDB
	LNhWo6hNmc5DcsmfAmkA7Nju/tD1F8a1eSEVWfel7eMv9Vme61LTo9nLc4o1WgSDiAPbw2DHQhnFB
	EViOLNwQP5Rry7ehgHgNEsDbQf5A/T6N6lrSf7Uqlt5M5ff7Tf79oWIS9YiyeMdSwowgLuvUi/1PA
	TZIj72iLAEQx3q/okbYSRot9E/BOlLdaW94IKiJ7pe6ZURIk+BKrQU3gt8Q5mlxRmNVDG81lyDmWn
	szMRWsgH1EV88NS9I432qAT+wA8ia2NGXcHVzKBAbQTFA2j3FKVxx0JyqXwZGWk4ytS/nDhxw2q6g
	vS/3/02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IzE-0000000BuSh-3X0T;
	Wed, 09 Sep 2026 14:09:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IzD-0000000BuRg-01vL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 14:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QYNhQ6Yi/iRYbkVUGBJRb8uet/bvchjSmRRTPBWP7EA=; b=GkTfZlk22oInUjIj0KwN5T2ip3
	SLHqDuPyV+4ASVGSZc1FOr3kBECJ1fRC6GNIVJmVKsdhBr13XwEohdZPH+IVEoFxt4i6syaP9f8Z8
	4sV08Nit6ac7lvJfNUrZAgsVr47hRkfUDDbXcHKKv3aaH1qL0IWQZmi0xn/fyB62QBFcwl2jLiH94
	2vz+2ZlQtDKojG5gJKsrWT2ofGfJa2CGNT1baClPVzmCpyWO+TCKIFkFUA3Uvuo/2NZYYviarlQOr
	2kOLrA33v5Si8+S64OzWrA5n1kpDdBWEByMKvlmU2SF8PFPZ4hmpdopLi84CyVLDDJBV8fTFPywKQ
	WI3RJNPw==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Iz9-00000001HN0-3RED
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:09:13 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-398a5aad413so4849526a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788962949; x=1789567749; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYNhQ6Yi/iRYbkVUGBJRb8uet/bvchjSmRRTPBWP7EA=;
        b=ADkNu+E8YICLU7kGyzGD8dB4zC+7us2mn/fwjkye8TdAU+SKY1dK4WIjaN3TLnQzx1
         jxWRJi3QS+o1lP1vqkVecF4igdjraRADlWvCI3FSWTywZeX+S/IENz7BpZc0fZjQRNQK
         bubcgxzzUzQ2iZaswaIgZ0zbtRJEGVpX9pRBOIVLPuKMNOFVD53VNtNk71BZyRIoC8V0
         BxhTg7PX1iG7xfWkCZXjsEstK/ybHssKQsxi4pmQZZmDBfnTIt14LnBJbW2nwM+Ko4o8
         IOxtvmgVrZyuRRlXVxfeEPls9+NSCbvvce5Ma1ATPD0DWMeiU9RSR+7YU3p3kIQWQmOo
         mIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962949; x=1789567749;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QYNhQ6Yi/iRYbkVUGBJRb8uet/bvchjSmRRTPBWP7EA=;
        b=EjzJvkyIKtZR5yEbsvjTj3e/aI9p5EujAVVL3hCIE6BGHG83BekqIavaDXQ2PEkS2K
         ZQjZmaBZGwZAPzbeo85cLGUGN+U0X5u49iI92A6xhUJMEGKDpA+JE8f64JuB7h5YP3TB
         NPlt+ltg4BOvAurSPIc5HytKGOoMHzC//BzvxUydk74T3Zs0dRhGegIPEO42R/seuV8X
         oueMjz3HRd2IZqcZQnLqBgLauq+hAr+VvlwvI9mlNfs1TJsbWkTv4Bn6jyRXELGSShm8
         gMUXvNDGmqB8XZ5h1hZ5Jaca1/Fzptd0JkA6rSaCpjrvVFaszoN22wQDtUAMytZ8DJgy
         qs+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwws8+1+YkJIwLUBon/w/kPZ19H16jIAKZkLQZ50KPvGmGEBot62TE2nd6wDY2qqewopmwTYqDrw3VOfokJqlB3@lists.infradead.org
X-Gm-Message-State: AFuF++lo94q0/8dmMlUiHxhcYvLY3Rp+BsBqV9Q8Ax3IKIWC+6DtoFvc
	z+uhkVMizXuK6py0XBMpzQNB0zLWm8h0ao0xsrhDxBU6X+3tULQpL5MD
X-Gm-Gg: AYBFou3pOwjgM3G2Vlc3mk1imY4FwmK0LQ+T1hczYphFISXTx1fqymVsnj996cQ8o+I
	YzNIHE24htwVmWSeHaH9JDYYIusSzJuX9erqZhrJDtJv0CbJkDrP56b3ufSbmCnHcBORMR/Zv+V
	2waZryjnyoZ5IlHJ7Wj1yJgVHjx8YQaD7mpd4T8LqLQsXugg/mYfoaZodx4LsqbX3Em02Ys2VWD
	GyITK4TylBxM9vg+XmJZvNiIqoWe6DBPUWcM+AFmcKfYjK4Il8aQIzm84ff+fsgv9eZ2ECJIUXz
	JdHvPNiEWYdSpejFNpH7cbVeKBJqPzyjLruJsT4lRUYe4fclqmzrYgCXyxDurKO9sciY6EDO43K
	BNAJA7j/TfaUbt4/vUnIpEVGx3x4Hm5kb3M7PV4TdToiD5YQVkjqYVuyKAjNu8+FT8cIjzfPe5p
	zPSdR5mXgvgWbBye2A8LtlhZSWaq7Ry6fUd74xc866amTDZaBuQuvJvKbWsAqvLIWnOE+uLN0++
	Z+AXF9GTlOvrlzp3Qd+WgP3W0B8QsNSu2UCU7ZJ0GriRZxI
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr55218364a91.15.1788962948995;
        Wed, 09 Sep 2026 07:09:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm39687906a91.5.2026.09.09.07.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:09:08 -0700 (PDT)
Message-ID: <f54c391e-5152-4c60-a52e-9c997c16f706@roeck-us.net>
Date: Wed, 9 Sep 2026 07:09:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] mfd: remove unused rdc321x southbridge support
To: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
 mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Support Opensource <support.opensource@diasemi.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-watchdog@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-3-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260909132153.1596191-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_150912_006431_2E5D56EE 
X-CRM114-Status: GOOD (  11.68  )
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

On 9/9/26 06:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The rdc321x was a 486-class SoC developed by RDC. While RDC's later
> products closely resemble the DM&P Vortex86 product line and are still
> sold under both names, I checked the datasheets for those and found that
> the GPIO and WDT blocks on them are incompatible with the rtc321x.
> 
> Remove this driver, as there is no way to run Linux any more on the
> older chips after i486 support has been removed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>


