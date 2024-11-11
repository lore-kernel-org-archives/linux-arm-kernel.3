Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28239D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veL2tYK9DnM4z6o4abrBRrurn0HQ49ytttUvm/62mK8=; b=SiMBYTzRn114ZvHtvlftxKDuuK
	RJosTfSq703kC/aESQzXhmgzlQOWhvOpuZmLkPFb5xYSVblqWp949f/rxZmuaPP0VkfT36Es/F2Lw
	Jm3LRFoD46pEOVChxJED5U6c6ItMa5Kci75FbZhuA5WdbeISF6l/zwfeNq1ppVkk9qiGU/FWVD7EQ
	BRDDKj2SnbqwAZDokxtZtMYDl3U7rC4tyghPoWT3fWlN/8GfIWZC2uW0yf6J/3vkIzRp25KvqNqT/
	KUvQmUEzBLhkUvCRjSTt7iEdKbC9W5JvZ8ARiZjhWdwmquQuBCywZE9URGYq2nGtfuDqVbzbt8OVE
	GpcGoesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaN9-00000001628-1xND;
	Mon, 11 Nov 2024 19:46:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaKa-000000015eA-1F5F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:44:13 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7f3e30a43f1so3323934a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 11:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731354251; x=1731959051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=veL2tYK9DnM4z6o4abrBRrurn0HQ49ytttUvm/62mK8=;
        b=VnPGnqGlBD74HGJCo8snJTd0puWJFjay+uqAEgQW9/ELhgXVsDIlVcUjC9/Mx4gKg2
         uEViOhQ1/+lOYr9+5gWRHKXbovGSOhL94aenqLPUrPy0DZh4IUXZwfpC2/Z9NzmhBKv3
         iTIi3eeQYKrYYaVG/m9at9Uh5IivmmowXeMPPf3SbO4gx/KFXUZQ+F9xxwtNe7UlAoDd
         HmH0b2/f3bKa8CmLRmCvud18TFl+pYCIs5NMZ9ygzis5kHWAYQuqhr0u0p/qtrpdNyhO
         UJYf0AYfMJUZf+R9vlbbe3Dma8NG6HkgEBB1HPaJF8jeSmb0K08fVMPtIv5z5aRhLzlr
         tZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731354251; x=1731959051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veL2tYK9DnM4z6o4abrBRrurn0HQ49ytttUvm/62mK8=;
        b=W100ne9oTxU6i3Y9mc9yxxv0XPiBQNK/1sJPoWzu6KeZIQsARxzf/iADkIivkuiVYF
         tadyRoZaS1vKZKycODASrHCv3G4AZ2KBgyMgv5GgV+qcwEeii5lZwXiNLu9UErYn7mzj
         JSwNHWXCnlcibj/QsqY0liisDR73iEfhCo79pQiIO7RysoQUGrV25zbBX+qkSIB28i63
         +czeK35RRAxlthsfmgarXlEizET3HXwRoCrqiLB7w/DBTGuGaUiwPEVCVH6bJSGg2EnK
         h/5Vd4F2ofdyn3bgPViGOIVgAGB+bH/ZZuhnNT8q1p01OIoBJ3Wxl4Z2oWqCjUlvmxkf
         IyMA==
X-Forwarded-Encrypted: i=1; AJvYcCXiIs82Epczm6Nv0UUZ/YOS9DgCxQdJe4J8GrHAqgnX+qC50AEKVPdZ4PqKqtCVjhIg3ZJWh8m97ZX+AWBZk9mQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyO+agkHhLoZWcsbQ5hwSvlzy+n4TOKbLjTtvNLVLlbg9m7HbVp
	h+i7DK/IMxXbxSEZpeFDfNvIj7YxFPv+XlMe7I9OdHL7t4YdxIfq
X-Google-Smtp-Source: AGHT+IFHOCYxbg/qgY0GkJoG21foSSu1yr68jbLBsGuJy//lwDOcCwcIED/7dEbbGDOoCDv3wOZogQ==
X-Received: by 2002:a05:6a20:840d:b0:1db:ec0b:f2dd with SMTP id adf61e73a8af0-1dc22b57940mr20555533637.44.1731354251186;
        Mon, 11 Nov 2024 11:44:11 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f65bd27sm8880023a12.81.2024.11.11.11.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 11:44:10 -0800 (PST)
Message-ID: <d1221ad1-2705-41b3-9dc9-05a3038e0cf2@roeck-us.net>
Date: Mon, 11 Nov 2024 11:44:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] hwmon: tmp108: Add helper function
 tmp108_common_probe() to prepare I3C support
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
 <20241111-p3t1085-v3-3-bff511550aad@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241111-p3t1085-v3-3-bff511550aad@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_114412_404642_4F73545B 
X-CRM114-Status: GOOD (  13.45  )
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

On 11/11/24 09:32, Frank Li wrote:
> Add help function tmp108_common_probe() to pave road to support i3c for
> P3T1085(NXP) chip.
> 
> Use dev_err_probe() to simple code.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I applied the first two patches of the series, but I am holding back this
and the subsequent patches since I don't know how the kernel handles having
two drivers in a single module, and one of them fails to instantiate. I did
not find a matching example elsewhere in the kernel. We may have to use
the method used by the st_lsm6dsx driver - essentially splitting the driver
into three parts (i2c, i3c, and common). That would be overkill; the alternative
might be something like the approach used by module_i3c_i2c_driver(), but with
a set of #ifdefs around (some of) the i3c code.

Guenter


