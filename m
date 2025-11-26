Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17538D1119B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ay1HyD/YXcJtqug9NBApq+fmqHdHRxdWGXWcfRUTS3Q=; b=Hu1Xl2idch3R/yTvm9L2PsiTOm
	OyIveeY/GcNotI9a2gZ7uxtHA2V2dmh6nb31PZU+IlekQ9QyTZ6x1lB3F7v/8KIruh3qYKCtNyRli
	jotvgBtUPks8TDn/qDlfe+ZHT4gyzFFuwqDEIikR6iGcAjfIAWaLvmPj9xfWYBX8KhBQJb7gIpU55
	SiVNyb5VjXpkb4xiAjr/XovMX428zfgLLauJBeOHRfWXSxyhL6PdnOMCmZDIjB3FvPRw6wEGfhV/Q
	YCOLssmiOsIuW8DuCGtTu4cOLwdkx7L5rTkQC2tkvt28Fee1WE9wEcPnR29xI8EzioMS92D4QsJZn
	qG63LZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONdA-0000000FhPU-0kCX;
	Wed, 26 Nov 2025 22:04:56 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONd8-0000000FhP6-1xIj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 22:04:55 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so226408b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 14:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764194694; x=1764799494; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay1HyD/YXcJtqug9NBApq+fmqHdHRxdWGXWcfRUTS3Q=;
        b=HMBloqvPMKokQXgOpX3VVOPot2vYKJCubPruGBPz4S9yyYujO4vUOSFfZbN7dVlVLv
         K9NmJeenhNW0jqX2h9snP7PBmLwTr0F9qabnvN59TjXywzEUnF2a6edh541bl2kL73H2
         j60jHpj5T9u4zF4ChxRlGj/5Sl4pv4muBvhocS1hCGN4wfI4FKWJ5MctuH/SWpMY3Wr0
         GEYKHxD5iD4YsV9hqIbVeiqM6gUW6c1Xemi6Vuhu/reY0fT+/GrD9fon4uoU0O9O54uF
         Qvl5pV9Zp8fnDoHrkP1LH+FQQ6mQPeeco/uluiFk0rczg83GwqVufSrBAWxFET+eeBOC
         bodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194694; x=1764799494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ay1HyD/YXcJtqug9NBApq+fmqHdHRxdWGXWcfRUTS3Q=;
        b=Bb+mWj8TFEgmIDCFJMTstslSUUuO5IdDrwUBsZxQAcdh71mAr8pMIc3xKw67IGxomx
         hKtF6k+m70GXMG7GU5WzgslZbiRWQ+JFyvFN2HkmsKootCc4FhH9F4AIfc9OjRKcqbY2
         qChCAD//7VfB/6HbNs4tm0Q0wDe4FwjZDpNiuShFQsavRDKxhrakoGX2USbZ/v1D6w6S
         5iA87S35keVfatlEaHgFEYb7DGGZbNF1YyOpuCGOeEbFV4WXT6rGWzpAcpDEa0Vify8P
         f/eq4d2tMzbOCoL3MAbDY4NHulqkqzyDTpB4dqG0RwYsCfWqo8KVgm0BeV6MP8U2f8Gd
         J6gw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Z+vsFGeCsjciasvwn+b9/s4c/0za7o8tyrsktqiRdhZwL/Oq07yhz7MaYoq0d4foVtSvH650fHAUoj6IEEAQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwxLvroMopRWvqkAOmAL8SoFrPnggabdyHPTb0tbJn32Jvn3lyv
	5p92bjlF+7xaoI3mNNKDlcU9OCC7tRTCKvKYkT5GhjzZ1NPDTRqVGmcfiR6zryxo/w==
X-Gm-Gg: ASbGnct2dBgUeMmsznyMvAOvnFSv4AevNJ6D9KrB7zSKULPm88iZkYs/+3E+dJITM08
	cPC4jjeVPHfahgoKY+NxWjgOVtmmtHGt5vriM2gLkQ1qc85ZZEe+HeysUEZpY5LMqybMyA+4pUs
	X6IAFulnMs5bq3ipjmBUgpGUKPZl3tTGBetPxxVvasUUQr9Utw5srCzslFBjNr+Ov8KB6PCT/5x
	CqYMCSAIQPlPc9xCjiLVUFqf1rSxnG1hcP9fqwfesGWxK3WydiYD+PtvK/FjREQ/2cksWjtD6qz
	faA8WcpnOMFNm5+bYouCF59HOMYDQm3J6ognHmFeix3Awn9Dka7zBTFL5Ymq7md4zYYMcneT1yL
	wEaNv6DcQvvMmNF8ZKh3b/rqjLtsuJfFt43FvokfWwnnpXtVMAtXmT/UiEU+yGAAJ2WFbzhRl49
	FyO0q55Byr27s9ZnCcxga+JlcMfPzPPVdtSBTzhFR6N6uFUo2OEzwp23NJsjOCU/USya0i3gmFu
	9Ve6VSqbpIvIQ==
X-Google-Smtp-Source: AGHT+IHgCBAVlJ/1/Oj2H+nvmtjVOEfs8Cj4GuvQ7p3t9lR/WHGAMof8mvn31hs8D+Fx43GprBkfMw==
X-Received: by 2002:a05:6a20:244d:b0:343:64dc:8cc with SMTP id adf61e73a8af0-3614eb15e9fmr24287915637.12.1764194693250;
        Wed, 26 Nov 2025 14:04:53 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm20451772a12.4.2025.11.26.14.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 14:04:52 -0800 (PST)
Message-ID: <be908072-fd0a-48dc-97e0-b120539f5584@google.com>
Date: Wed, 26 Nov 2025 14:04:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] power: supply: max77759: add charger driver
To: kernel test robot <lkp@intel.com>,
 Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-5-6b2e4b8f7f54@google.com>
 <202511261521.hSYp4ttf-lkp@intel.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <202511261521.hSYp4ttf-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_140454_535368_6579AF80 
X-CRM114-Status: GOOD (  14.68  )
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


On 11/25/25 11:38 PM, kernel test robot wrote:
> Hi Amit,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 39f90c1967215375f7d87b81d14b0f3ed6b40c29]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-power-supply-Add-Maxim-MAX77759-charger/20251123-163840
> base:   39f90c1967215375f7d87b81d14b0f3ed6b40c29
> patch link:    https://lore.kernel.org/r/20251123-max77759-charger-v1-5-6b2e4b8f7f54%40google.com
> patch subject: [PATCH 5/6] power: supply: max77759: add charger driver
> config: um-randconfig-001-20251126 (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511261521.hSYp4ttf-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `max77759_charger_probe':
>>> max77759_charger.c:(.ltext+0x27b): undefined reference to `devm_regulator_register'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `enable_usb_otg':
>>> max77759_charger.c:(.ltext+0x983): undefined reference to `rdev_get_drvdata'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `disable_usb_otg':
>     max77759_charger.c:(.ltext+0x9c3): undefined reference to `rdev_get_drvdata'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `usb_otg_status':
>     max77759_charger.c:(.ltext+0xa06): undefined reference to `rdev_get_drvdata'
>     clang: error: linker command failed with exit code 1 (use -v to see invocation)
I believe this is because of a missing "depends on REGULATOR". Will fix 
it in the next revision.

