Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C847E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P6J7CC2+ddqyvspzxGk9dhLYIMX+2ilpolCnOsNTNQ=; b=fGhLEDtM58WqHPtHDaM1O8fgvF
	R9Mb496MtgW2NGmSow6bW5k37b/pT41BVRFt3t1+NkatsVYstZ/QKvYD1OhilFst6daQMk0Rxn7NO
	9djYOBEvqr+8WcYPauzYlzw+v5685bciudFYxMnPt7oGGFk5rit+OI6vyGjSC+ncq89297AbMe0HA
	dT9gJRU2W5UNxDsTtUgq1wcgpTRFu54MhwqqXRyA03+SzYzH1jfacc7/zCkFaFbFtN0ozHwdRU724
	vvSninkvKYkLS8SmV5vPoE1zT0YLoo3a70L/j6VCe0ot//qUFPSmCP6cvdfb7/SIkJ28snHoW2sDq
	qgozD12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7E5q-00000009m7o-1NXZ;
	Sat, 02 Nov 2024 13:23:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7E49-00000009lv3-3LWV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 13:21:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20c693b68f5so30444915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tweaklogic.com; s=google; t=1730553680; x=1731158480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8P6J7CC2+ddqyvspzxGk9dhLYIMX+2ilpolCnOsNTNQ=;
        b=P/ruCYh0x1vAJVeEIwzzqeqp7vmNDhf5EeNOcLDnjVAwWDk5lXKiZ6thB7duuQLjUm
         h/LgMohQdsY40f3zf0/rsrWXtjsdxXV6v4YghbpE6MqyCRKvoJ28H1oWs12YRVPK42KA
         dYO0ANSlq1j5SKdBEz/7UcIZeQazCa+9aEemza97B1Zzw0YSG9xt4wq9rFquzMFWbZpn
         LRL9oJHm7PSc6WcPN14/6KmuAjbmtJ8daeIcQkepoJXQaGuNvPDTW9Ni56Ct6EqK2rTp
         7PEnGa+fdGz9xP/xHVaRkwzlsMl9xy0IpxSbnON6QfLIbkpwPB/PUnua5uzu7PqyQLCo
         ctjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730553680; x=1731158480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8P6J7CC2+ddqyvspzxGk9dhLYIMX+2ilpolCnOsNTNQ=;
        b=aehB314GbOTrpv23h4Nh77Yk3emoGsovmwQ3d+ir4XcMF00EkBU0r4aQz6VUVdqS4+
         UBs9oaPbHjHcg2aAyX36WLJSTODRu11egZV3nzK9uWNmBVEm/Rk/CwBXYwuDmAf7NwK2
         gUu8CwaoNS2nkKJduzZcDAtxQYbKmZN8Ie+nNu1SWdIh+1rWsCQ8HuvhpHAvBuHwYFlR
         R+dnL8pNspWoqG0pS85Aqis+Steg/doxt4cOZ9J5M4Bzayfo7X16cupSrci2YY5GZWpU
         dCfNcn0HfzBp2AOmdGBii//KETVeTYcn6u/Is2HXWgwm+u+nU+QalddH/VqZN90wOtV5
         d+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVEeZqiwDKswvtsw7oE3GQE/gW9+82WCNCuETGFDJXF6+hEB/TBofaw2xvMRzJDhp+VAFDIkjSjVmkklPKU3f9B@lists.infradead.org
X-Gm-Message-State: AOJu0YwiLtFhn1k1rOFN/zuWm1jswO85hzwzXPHY3T8zH6Zp+JpRU2un
	udPcmCCTVF7kt0g6OxpkhWHDXf0f6UTqws84EtTDKaGrP5jwGeDchomOVGoshKE=
X-Google-Smtp-Source: AGHT+IGq+i8a8MyrkZrVMk7tFGx4jYT5BKdNbeajY1pRzeXD9zZdCy+jANqzkpIEbDK9zAkNl1bK+w==
X-Received: by 2002:a17:902:d2c8:b0:20c:a055:9f07 with SMTP id d9443c01a7336-21103b1a5cfmr145523125ad.26.1730553678217;
        Sat, 02 Nov 2024 06:21:18 -0700 (PDT)
Received: from [192.168.50.161] ([180.150.112.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2110570b482sm33784505ad.71.2024.11.02.06.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 06:21:17 -0700 (PDT)
Message-ID: <4e4e5281-d489-42b5-b358-c44958cfa4f9@tweaklogic.com>
Date: Sat, 2 Nov 2024 23:51:05 +1030
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] iio: light: apds9306: simplifies if branch in
 apds9306_write_event_config
To: Jonathan Cameron <jic23@kernel.org>,
 Julien Stephan <jstephan@baylibre.com>
Cc: Mudit Sharma <muditsharma.info@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Dan Robertson <dan@dlrobertson.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@amd.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Jagath Jog J <jagathjog1996@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
 <20241031-iio-fix-write-event-config-signature-v2-13-2bcacbb517a2@baylibre.com>
 <20241101164118.687be624@jic23-huawei>
Content-Language: en-US
From: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>
In-Reply-To: <20241101164118.687be624@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_062122_029666_CD7BFAF3 
X-CRM114-Status: GOOD (  14.60  )
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

On 2/11/24 03:11, Jonathan Cameron wrote:
> On Thu, 31 Oct 2024 16:27:08 +0100
> Julien Stephan <jstephan@baylibre.com> wrote:
> 
>> Simplifies the regmap_wite if branch in apds9306_write_event_config.
> Applied.
>>
>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>> ---
>>   drivers/iio/light/apds9306.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
>> index 8adc74040db2bddf93fbb773e3519abcc726b9a6..9c08e7c3ad0c17519689a630d42fe9b90438dfe8 100644
>> --- a/drivers/iio/light/apds9306.c
>> +++ b/drivers/iio/light/apds9306.c
>> @@ -1125,10 +1125,7 @@ static int apds9306_write_event_config(struct iio_dev *indio_dev,
>>   		}
>>   	}
>>   	case IIO_EV_TYPE_THRESH_ADAPTIVE:
>> -		if (state)
>> -			return regmap_field_write(rf->int_thresh_var_en, 1);
>> -		else
>> -			return regmap_field_write(rf->int_thresh_var_en, 0);
>> +		return regmap_field_write(rf->int_thresh_var_en, state);
>>   	default:
>>   		return -EINVAL;
>>   	}
>>
> 
Hi Julien,
Sorry for the delay.
"int_thresh_var_en" corresponds to APDS9306_INT_CFG_REG bit 3 (Datasheet: INT_CFG, Address: 0x19) which
is a single bit value only. If user does "echo 4 > /sys/bus/iio/devices/iio:device0/events/thresh_adaptive_either_en",
which trickles down to the "state" variable, do we really want to write any other value except "0" or "1"?
Correct me if I am wrong here.
Regards,
Subhajit Ghosh

