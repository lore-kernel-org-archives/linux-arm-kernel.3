Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6070CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 03:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1BNHEetSJWwyWmdZxZ8anoEi5BOLx/1Umxr1Rv4+CE=; b=L01Dmrng5Mb2rI33MW5R8ViGiD
	fBApiehi+cA4suPYyC9dyRse65FkPe/IjagxR9CioZvDaojmkTtz1bSiPaDfKxsC78GB8eTpzazug
	Jq1NSUDIgaqag4MaatqVmd5YJa2WRADiT89ftIMiuQkmzRAXK2Hu0ZUGc1++TwU6aeAuEo4G+0FPt
	ku7OFaZz83jTWXOoB36RMvseibc/Anaun6lG98t3SSYJ2z1aDhx/3hjgiTlI+mXybjBFN2j6MIDBL
	BPrjMjhLsRSZAxQp1/nas9t3YyMNPocsHljhQVxQHPIL4r0sRIFnCBksblO3/6L13gnBVdpzbCfQj
	ZOBqRPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iUY-0000000DgjL-1wRl;
	Sun, 28 Sep 2025 03:54:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iUV-0000000Dgge-2XN8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 03:54:28 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so3632884b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 20:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759031666; x=1759636466; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l1BNHEetSJWwyWmdZxZ8anoEi5BOLx/1Umxr1Rv4+CE=;
        b=KnnnWU7GRhBCJKw+Igm8Al7AmlAgdTr6XX8S++6Jckocsdiz727Gjn5cPT0cmc7QQw
         gyhr8xhdUzgfjhTbuIzFP8G71WApn51Xw4Efrm9aaKZ4rHTZ8gnNjPTkvGS1PGd/s1rV
         iiBnXbYXDrZpmGXANizbH6uRbxiCvGm9IfXfbjGblE2Dx1kRhUIGDHqDWWzCud/WodOV
         J+uM8QsxQHCbReNtMYoR9Beiet++LgTv/kivbPpd03loIJyoIoEa40biaE8Ciw5FwtNr
         OviCVFQHkPOJTqqvHc8GMmrLJ0fn+BbpqB2kES42+C8JHl+1buqxNRNO/HuZLfkEdpe/
         9FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759031666; x=1759636466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1BNHEetSJWwyWmdZxZ8anoEi5BOLx/1Umxr1Rv4+CE=;
        b=Irrt57cCcXcqQ6Uo8rKevFFD+Kkz5GE9vl+YYFVftt8fCPMhJ05GG1kbasMMwPgdOp
         VwEjBGiy084TUOyCYnDPpBwiDhmigIEm72uRN4ISBN6XrVaiU+cJPlBAV0Fk9JSO7IqR
         CTIsj9askKgEDdaqHcS7h/XnLpR/9ymKblNJLNaJl1Of8UG1YqdlSO6JPfmV0dpoATnO
         k1D890heWFGAe9MEB/0UwIMefiCMSyyGvwlSiLXMaAHfpVV8UADijPqVnPFe8vCJ84Nm
         4Jp/eYU5T8x6jhISef4i6YfSLZKMhs15Jn+Cy7fCspkMiVQOe6WA112cOB4dVzxI/y2d
         65Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUrBQcMJqp4b0cFpsFMxtCj0Cb9DU1zEICiJS27d46V5+ErS+d0FXlrA9+ze/Cy3Z6HFfsnHNR9RD8EVr5VSs6e@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu0rYbsaUVjHTM/QzAtjTfsizxBONmCVLmps7wo9KFeL96V3ud
	a17tAyALLqxm8mmrjZGgemvI6cjBqfBCkq1wNJD/XjrViWcLxOXtweVO
X-Gm-Gg: ASbGnctjVX44LuVFt3QIDAybuAw6q5evlt0Ph3MHF/Tbd9pXv3cccI8UcF/34xfEdq7
	+i61972xCG9175aVEGgBY67zqhXNbLWGqYNdJYNUE2sEgJwnuotvS2tsaxtR+Qp+rGgod+vb8xh
	DJvgcEZVDm15x6UVlgrcxIahOtEp4lU/Eesv2pWDMv3WJKu7IpLJN4tR0huD6ULbT12rQF5Numz
	bwE+E5OCUGw6tP97/7fMUmiOs4ZnbEIimyBE7fHe/vviAzFhnEi2KkZKaBqAyTlERtr9qIfv6mH
	ixY6f8EgEK3MNu3o0GxaUnKxuNbPJQTtBm55C0pIuWfaETR+hBbvURhBy/YKPyGN6QnapJU6aGf
	8oG94mBqsCcLY3BrXP/Tc92+RpDq17GyJj2+nrcc7BMqg/AFzSaf0SFjgzMswYL7CnApQ6gm76W
	Q7YAT8OYlMeI/512ddYPw/2g==
X-Google-Smtp-Source: AGHT+IHNNiab72Qr90mrD0VFSHKiT7iwH2G/FUkrpdBr28ej5amRG5/YNJ5ToVKe35zmVyUx5bpQbA==
X-Received: by 2002:a05:6a20:734d:b0:2e5:655c:7f8f with SMTP id adf61e73a8af0-2e7d1751cebmr15882160637.46.1759031666372;
        Sat, 27 Sep 2025 20:54:26 -0700 (PDT)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55752d9sm7979487a12.28.2025.09.27.20.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 20:54:26 -0700 (PDT)
Message-ID: <9fb7ac10-3966-4c43-b550-827108bff886@gmail.com>
Date: Sat, 27 Sep 2025 20:54:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: rk3399-pinephone-pro: Add
 accelerometer sensor support
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com>
 <20250921-ppp_light_accel_mag_vol-down-v2-2-e6bcc6ca74ae@gmail.com>
 <5b6ijumsm6bgqymsfc25frqzjlpiryq7iupuk2pokcb6d4bz56@yqrz6j3oj5ga>
 <649ca4a6-3158-4c52-bad3-6c266edd177d@gmail.com>
 <kkxecpaatgeqk7ru4maqtbgftiqmdjjweam2zw6xrvbbzpqy4a@nz6llsm37qdx>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <kkxecpaatgeqk7ru4maqtbgftiqmdjjweam2zw6xrvbbzpqy4a@nz6llsm37qdx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_205427_666794_2161B766 
X-CRM114-Status: GOOD (  15.01  )
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

Hello Ondřej,

> Well, it's not clear this will work as expected. Someone should at least test it
> with some well working userspace sensor fusion program, that uses this
> information, (along with the mount matrix for accelerometer/gyro) for eg.
> compass feature or something like that.

I'm not aware of any compass app on Linux at the moment


> Also I don't see this matrix in v3 patch set.

https://lore.kernel.org/all/20250921-ppp_light_accel_mag_vol-down-v3-4-7af6651f77e4@gmail.com/

+ mount-matrix = + "0", "1", "0", + "1", "0", "0", + "0", "0", "-1";


> Did you test it? Any suggestions on what people actully use for sensor fusion on
> Linux?

Yep! I did brief testing, but I've put detailed testing below:

For the accelerometer, the screen orientation works correctly now. 
Originally when tilting the ppp to the side, the screen would rotate to 
the correct side. However, when the phone was held regularly in your 
hand, the screen was upside down. With this patch series, it is no 
longer the case

For the magnetometer, the command I ran was

```

#!/bin/sh

DEVICE="/sys/bus/iio/devices/iio:device2"

X=$(cat $DEVICE/in_magn_x_raw)
Y=$(cat $DEVICE/in_magn_y_raw)
Z=$(cat $DEVICE/in_magn_z_raw)

X_MIN=$X; X_MAX=$X
Y_MIN=$Y; Y_MAX=$Y
Z_MIN=$Z; Z_MAX=$Z

START_TIME=$(date +%s)

while [ $(($(date +%s) - START_TIME)) -lt 10 ]; do
     X=$(cat $DEVICE/in_magn_x_raw)
     Y=$(cat $DEVICE/in_magn_y_raw)
     Z=$(cat $DEVICE/in_magn_z_raw)

     [ "$X" -lt "$X_MIN" ] && X_MIN=$X
     [ "$X" -gt "$X_MAX" ] && X_MAX=$X

     [ "$Y" -lt "$Y_MIN" ] && Y_MIN=$Y
     [ "$Y" -gt "$Y_MAX" ] && Y_MAX=$Y

     [ "$Z" -lt "$Z_MIN" ] && Z_MIN=$Z
     [ "$Z" -gt "$Z_MAX" ] && Z_MAX=$Z
done

echo "X_MIN: $X_MIN  X_MAX: $X_MAX"
echo "Y_MIN: $Y_MIN  Y_MAX: $Y_MAX"
echo "Z_MIN: $Z_MIN  Z_MAX: $Z_MAX"

```


Tests:

# phone on a flat surface

top of the phone pointing north and bottom of phone pointing south: x 
(between -2379 and -2263), y (between 109 and 207), z (between -2340 and 
-2132)

top of the phone pointing south and bottom of phone pointing north: x 
(between -1079 and -956), y (between -54 and 46), z (between -1831 and 
-1621)

top of the phone pointing east and bottom of phone pointing west: x 
(between -1587 and -1473), y (between -448 and -339), z (between -1850 
and -1602)

top of the phone pointing west and bottom of phone pointing east: x 
(between -1426 and -1300), y (between 554 and 661), z (between -1917 and 
-1706)


# the following tests are where the phone is tilted at a 45 degree angle 
and the top of phone is pointing up to the sky:

top of the phone pointing north and bottom of phone pointing south: x 
(between -1300 and -1189), y (between 117 and 227), z (between -1819 and 
-1614)

top of the phone pointing south and bottom of phone pointing north: x 
(between -539 and -422), y (between 23 and 143), z (between -1160 and -922)

top of the phone pointing east and bottom of phone pointing west: x 
(between -1038 and -915), y (between -408 and -313), z (between -1570 
and -1345)

top of the phone pointing west and bottom of phone pointing east: x 
(between -965 and -849), y (between 540 and 641), z (between -1542 and 
-1336)


# the following tests are where the phone is tilted at a 45 degree angle 
and the top of phone is pointing down to the ground:

top of the phone pointing north and bottom of phone pointing south: x 
(between -2345 and -2237), y (between 80 and 189), z (between -1207 and 
-971)

top of the phone pointing south and bottom of phone pointing north: x 
(between -1805 and -1691), y (between 5 and 112), z (between -1896 and 
-1651)

top of the phone pointing east and bottom of phone pointing west: x 
(between -2127 and -2013), y (between 460 and 563), z (between -1621 and 
-1378)

top of the phone pointing west and bottom of phone pointing east: x 
(between -2158 and -2054), y (between -376 and -264), z (between -1540 
and -1262)


I will put my testing in the commit itself moving forward

Thanks,

Rudraksha


