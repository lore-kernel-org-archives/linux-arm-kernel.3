Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A422E77170
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 01:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvMuO2LzOEcK6bZJDOQK5xJYTAbXjx0HM3xx7EXHDhI=; b=31i9VECguZXz9RauN3PiUHNpVB
	eNUAkqT1R95q0f5QSk/LUs4k4RdN5VW0kR1TsQ49UeUMp01GEjWfQpDPU2UQEFs05mfwdncOuyf/z
	l7Hc78X4JjqOMkCTd7zKMVJQsNrot5Xt48X5i2wev+uNBkWomQCdIkCUngR/BheU5HDHwfoICNNpU
	juL0Pnu8ITTtcb5iigK0Q+NIEm65/s6VmBxwFc+tgX6PWR7bbYmm8ddGeX6SP9USi4OCI3sO8Xb/X
	SlbQfXUYeKZt2tYBUL5uTLTi/pXPuKmIHF3ku+arcudGFOK7PzCkmPXrE2xlDS0Kx+snENgZqkX1o
	bairo2Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNOp-00000000Dpr-0q1R;
	Fri, 06 Dec 2024 01:44:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNNm-00000000Djf-3vUE;
	Fri, 06 Dec 2024 01:43:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-215ac560292so15648065ad.2;
        Thu, 05 Dec 2024 17:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733449429; x=1734054229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvMuO2LzOEcK6bZJDOQK5xJYTAbXjx0HM3xx7EXHDhI=;
        b=Or1o7xMGZp87FV9pDcDZlmOAXeHdeB5KMwaByyM0bXtHmTiaS3M8cQ6EitNZXgR/po
         E8L0D+hqhppC6lJ1f9vpMx/gjioR+UF99cBn7kXq5NUqa+RSBeyW9Ar6m3g585LWm+V4
         x5edPHieOow30XMmfOOVCkVcyGPPUgX/txXAng+0BGwwPjz95T141RdZ3SDPVrSNqlwy
         WwekDD7ganW0NqmrAEPnoSX9u6jhhPZtWNKbtGlATP8tqBgpgpqyygkQFbWU2excOVM2
         nOI/UepRsdI2ATnDWKTpeQ7JXfDjoW54mA3Z2SDQZpxmGFW0IzV0SjiqcHCbj9XGdI4x
         hMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733449429; x=1734054229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvMuO2LzOEcK6bZJDOQK5xJYTAbXjx0HM3xx7EXHDhI=;
        b=cNvkVTgCT+WNUDG6RejrNrZZw5sh+KjWJxC1cReSkduedGamuGobxPh2jKeUVTbRq1
         wgiiZ1x0Go+Ehykdfk5qT/wmwshHAK4snrsR0W/77keTltO0d1ImclrDDhNwKEWV3Ymq
         Qa+iWibqWTIyfgrNw5NeNm6gBXjbT81CcGY42PF95FGexVo66y3jZweYHQYUQ5VmTlVJ
         CaWu8GNEt2k7n8COGyBsJEDiZRWofa+ArZZ2BWkB3gKZsQY3/2hiEkY4PKY+qQUKpoAR
         VIR3cFS3MpkIvhG29cKkemOjZGXPFTX2ljqZqmR4X3cyICPQLKXDDYzcztEX/+bi0gdc
         ANVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2lhM0nxgTomg/+hXM9X1tGnri66y5GRITUSVx8c3c559lt6DvFRH7wD2M9DuqUztfmx9rEanUych1bGoOnn9J@lists.infradead.org, AJvYcCXOz6hRjasaamvPLrqU50Zw7l7aV2va3lEqAQCr30xcwtlkAckP49IN/V8wCZtTqTxGF16dpjgR5FyK@lists.infradead.org
X-Gm-Message-State: AOJu0YyoZWV0n0TQ+ZnapNVEH73vrGf9/shy4iCfk/6HmkkMLW5UiDl1
	Z6fr6zKAQ5A06z5vMSB3FuFmJQoiMWdI372MqubT/HInMoHWxAFy2G0IkA==
X-Gm-Gg: ASbGncupCjV4WiOUi13XoELunodWpVgcYJuXWTwzkEqmbwe3jA1JOtDmCLc5Vmtjj+4
	TXF3bHpFzWtAwNkZKfPkJJ/UPDpCUsKMes/Bk7aHMOfpWYOuOWzeX9stK6KJ7a31X3ofkA/BOcN
	Wy0nNSWVyi8DK97zaoZ9yHF8kLOUGB3sR8x479WLeoLbzD0UZP5kvbhgRhDkoG7J2GY6WmhoDl5
	Z/tN8/FF1TqC03qp0aN/ulI+ewATCnlpKbNjn26XJlku/F4M4bkljfzGYdM6PMSzNJV/2Gxr6ki
	2rsajMHB4xFHT8LI5ZCLlSJN
X-Google-Smtp-Source: AGHT+IFYW2PobbERX0J/R0MGurhl+mv/yjucHbwp3t0d/Vn3DANq7WcMduBahQARhzIKRTXGHQSXBQ==
X-Received: by 2002:a17:903:188:b0:215:5935:7eef with SMTP id d9443c01a7336-21614d68778mr17893035ad.22.1733449429330;
        Thu, 05 Dec 2024 17:43:49 -0800 (PST)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e5f30fsm18793305ad.74.2024.12.05.17.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 17:43:49 -0800 (PST)
Message-ID: <d41c9484-6192-462d-92e8-c200192d37f8@gmail.com>
Date: Fri, 6 Dec 2024 09:43:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/2] Add support for nuvoton ma35 nand controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241204025129.150525-1-hpchen0nvt@gmail.com>
 <878qsuwhm1.fsf@bootlin.com>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <878qsuwhm1.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_174350_980582_E7D233EC 
X-CRM114-Status: GOOD (  11.67  )
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

Dear Miquel,

Thank you for your reply.


On 2024/12/5 下午 06:26, Miquel Raynal wrote:
> Hi,
>
> On 04/12/2024 at 02:51:27 GMT, Hui-Ping Chen <hpchen0nvt@gmail.com> wrote:
>
>> This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
>> It includes DT binding documentation and the ma35 mtd nand driver.
>>
>> v10:
>>    - Update ma35d1 mtd nand driver
>>      - Add unsupported write page handling.
> I was about to apply it but...
>
>      [31m●[0m checkpatch.pl: 117: WARNING: please write a help paragraph that fully describes the config symbol
>      [31m●[0m checkpatch.pl: 141: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>      [31m●[0m checkpatch.pl: 348: CHECK: spaces preferred around that '+' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 352: CHECK: spaces preferred around that '+' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 352: CHECK: spaces preferred around that '+' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 429: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 465: CHECK: spaces preferred around that '*' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 465: CHECK: spaces preferred around that '+' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 466: CHECK: spaces preferred around that '*' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 466: CHECK: spaces preferred around that '+' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 467: CHECK: spaces preferred around that '*' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 467: CHECK: spaces preferred around that '+' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 468: CHECK: spaces preferred around that '*' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 468: CHECK: spaces preferred around that '+' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 479: CHECK: spaces preferred around that '*' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 479: CHECK: spaces preferred around that '+' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 481: CHECK: spaces preferred around that '*' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 481: CHECK: spaces preferred around that '+' (ctx:VxV)
>      [31m●[0m checkpatch.pl: 514: CHECK: Unbalanced braces around else statement
>      [31m●[0m checkpatch.pl: 611: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 650: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 665: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 675: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 689: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 699: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 715: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 756: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 805: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 935: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 950: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 953: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 975: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 1001: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 1018: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 1131: CHECK: Alignment should match open parenthesis
>      [31m●[0m checkpatch.pl: 1159: WARNING: DT compatible string "nuvoton,ma35d1-nand" appears un-documented -- check ./Documentation/devicetree/bindings/
>
> Please fix these warnings and checks.
>
> You might want to use --strict by default.

I will fix it.


>
> Thanks,
> Miquèl


Best regards,

Hui-Ping Chen


