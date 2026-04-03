Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32769E8537F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVAFddO7rkVjUEFxW/6GAQN4GzyoLvVdv8+D4JuOi9Y=; b=lcYacOtdoVK3Nom6QAuzkZ4Eiz
	9m5ZV5nV4/fMiv7aZmafhp/LU3DxIKfCTT2XhQupZ7hlfJ3k/FADdsbj6h+9LrJ4E8m3BUSjr+u8B
	y63bGsRHpMsaMU7l0rQ/sE8DHmsf7eTwh8Rx5f3m6l/V0ojsUOMrg7iij+M4hjTI1u/isopSySrLL
	iBrkR9MCz/3PrP2rOMAHHQ6uFtKyeuLSAbd6q6Plhmzs/lFfTZTrEl4mQr6R6ulKnhfIsQVmJterO
	rlA+JQemGX10cLPiKdB+xN1TBOFu1viu1yMDeFpRqtDm0Bkdx5ODwQRvi24e6ihIU6ulUEchKmksO
	OrKXQR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gxH-00000002FVj-285M;
	Fri, 03 Apr 2026 16:01:07 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gxE-00000002FV8-24Xi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 16:01:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82cd9d0eceaso1559308b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775232063; x=1775836863; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVAFddO7rkVjUEFxW/6GAQN4GzyoLvVdv8+D4JuOi9Y=;
        b=d5TSlv70KGkPj5SSa0rDpX8XhF25EsICQMUGpSaFkScbjJdc5G+qLigLchSjwZrZ0I
         I4BCCtt4rqKkM+KHEA8eJMmJxN9E2iQqtqCDKQm+qQNwlPrPyCyM+YxjQV380wkTnXtq
         cjFX0XJekvUn9KQounM2cAZyispoV05gWZNkM8UBX/355SLhBUcZ9FYeAJXJQ34MYqFM
         6kjwIeL4ixUsrIHqTjSCyJS8R5KGgPPjTeidZI1q/GVazwoDOvx2UlhMwjJQ8vzjEC3M
         D9OnbPuVIwT/2qQ5k52hZ53Ia531TFy02H8cgOkkztAQTLs/CacPaEar/YDY+PuMj9JO
         fSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775232063; x=1775836863;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVAFddO7rkVjUEFxW/6GAQN4GzyoLvVdv8+D4JuOi9Y=;
        b=caJ/+4HCFim0T7XSgEKdV6soCANy4nzIWa8yM6q5rSPvTDsqq/CC1OA3eIiuOGjHTI
         8WzvgKRCtZ00bc5FYsGgJcF8yD9dj0fAQ5nywE7i8CZnncmoDwGiU0EZTUOxispZpyb/
         J1OW+uwGHgW+wH81UJ66hEFpL8RcOIx6TyxmQXyAIYKSsfausmEPMlEpVj4AiNKRVDET
         VJJuTOO8fZoJaKwRWi8aLTxUZiRcys/NvG6M5rbig8abIcqESIKF9fDFdwmLusWI9dHD
         vJN9RDe3eR5MAVUzgY9rovwW4n6ol+sFRZpEMN142MfKKptaW+fQ6TbfTLXDFT0pn2WI
         CsYw==
X-Forwarded-Encrypted: i=1; AJvYcCW0x463Qme5tzR/CZZVxFT70CI3sjljAeAuguirSqveUXaoo/ozZhEZFhFTlGigY4qTae48mfiOa0tfF1fONvYw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy01/IVR89RxPYT1FhbBJ+/0MDy39uJuhtc3ORnFfhIp4e5Bwqy
	rqi89LLT19E+cUshTQGRjy6HnUNNg9i2UIvr4O7LR12pEBSAIzUKtRCjZe+kwAT4IAg=
X-Gm-Gg: AeBDieveE2lkn4HoQWlGdprcuogScC0AMjxiHRO0wsPD6cWzE6SeNOrWA5fRF8A3vwB
	WeHe345X/CQ2VMnUp5a5Qr2nm1w4aFg7qWKZXfq48pj/GwcxzQNmh+YhaoGC5w6LR6s6Sc9+pVI
	2IYEH8Nv+7/yuSZ2MDVYDCi3akqsDeQnPumxHeijB85WxYD3JQYnw/wuKM/VmgZX2Y1NUMWja2h
	i6+WHv4E88sOls13+1umALOLqRmKlBJNVRSEVXKEjKb8Wmwx3zzj0cIqCLIyw3aG6c5c3naQitF
	hu+zmisg9OkgvQoB3vR46d8O4Wvg/pv4Y8Eum2Kj04Qm4yDKRdHuL9fQgfwlPofCfylRlCGW6eW
	GFpe9ujl8B88q4d3ucjtdLt9y3sigBj1LAt41W7SwEDLXVDXhYHUc/3tKy7Xf/SjQnVRra/4P4f
	XNdr337xrZFZujeUe8UiI=
X-Received: by 2002:a05:6a00:3d49:b0:829:7553:afbe with SMTP id d2e1a72fcca58-82d0dbe6401mr3671936b3a.57.1775232063072;
        Fri, 03 Apr 2026 09:01:03 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm8256712b3a.19.2026.04.03.09.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:01:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: dts: updates for ti/omap for v7.1
In-Reply-To: <83d0c8d8-fcde-4407-bb09-c2ae0e0e142d@app.fastmail.com>
References: <7hqzoytlms.fsf@baylibre.com>
 <83d0c8d8-fcde-4407-bb09-c2ae0e0e142d@app.fastmail.com>
Date: Fri, 03 Apr 2026 09:01:02 -0700
Message-ID: <7hwlyorq2p.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_090104_789402_9C173886 
X-CRM114-Status: GOOD (  13.64  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Wed, Apr 1, 2026, at 23:29, Kevin Hilman wrote:
>>
>> ----------------------------------------------------------------
>> ARM: dts: updates for ti/omap for v7.1
>>
>
> Hi Kevin,
>
> I applied this one, but I noticed two problems:
>
> There is no long form changelog text, please add
> more information about what is in the branch in
> the future. I've added a short paragraph while
> applying.

Sorry about that, and thanks for fixing it up.

>> +-
>>  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi     | 744 
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts           | 101 
>> +++++++++++++++++++++
>>  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts            |  70 
>> +++++++++++++++
>>  arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                          |   2 
>
> Something went wrong with the overly long lines here.

Hmm, not sure what happened there.

Thanks,

Kevin

