Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A61C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ji/KKSHoP7yY7aJyBCvNgq977Um77Yq/cN+M0anXeoY=; b=zy47NDiVhHOlt93FBtEkeEjd3d
	wh3DlNQvKAlHU3qxlAwXkwQu0+mg/pRZtHG3GxlpBWf2QJ5xINw06UpiA85jXsAYw5Mom0NnLDPWx
	kabxei/QGJS6I5Mh9QxuvUQEUla43rnNnPzZGTw+liTQM3fpekNb6JDcjaBz1SOMhTuYe6kAn70VG
	0g2JDHG8Q+L9QsjQDiAGhooKe+/WC7Mnes0cQQ44NV5MNd8oue+4ggsFhimYEML4ePatF65RvyEWU
	VH869OHsVLd9IInJgVhhmyJkZ/syYJl1I9oUyEaYKgwLGdWhMUi0/Ul4s5lwym+GCqC4ecMhWUObk
	qpCYWOTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTL1-0000000HOtZ-3mq3;
	Thu, 15 May 2025 07:49:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTHj-0000000HOMR-2dWn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 07:45:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso6694665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 00:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747295142; x=1747899942; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ji/KKSHoP7yY7aJyBCvNgq977Um77Yq/cN+M0anXeoY=;
        b=amffhPLrZ57y5DBotMUjNpf44jy23qjmF//wcZvbekcfmes6Pk4b0oqebonAcUiCPY
         5qECx1jyON02HgOT3SBQzVP6Yb9Vf2M+KQFZPIPr4kgWM1z8MDA0Y31s7NE4KGScnee0
         mr73smdGKq8h7LuMngFjjxIN1zeQBV99ElaNmX0Vjiu/bL37Vk6imBvV4d1+O01iEaMB
         Waf/+ZFn/+iYz9PMaSrf5dXhWaAIgnIle1VNyE19KXdGR+QIaGh8FGVB7RU6wMt4Dq99
         mU80SwamK0W9oHcD+0tYyaa0IvedfmO31i1aEmTrp5l0VQOA1XdyWOsb37Yx39E0UHfH
         CIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747295142; x=1747899942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ji/KKSHoP7yY7aJyBCvNgq977Um77Yq/cN+M0anXeoY=;
        b=uVN/xagAXe1Ai6wmYlURlvA7eJX8jp0IHpbsU/e7fzpr22vDjpw4tGhOBOjYZkfVxc
         yLzxuOP4DZaj34qEFBj/l7+JfF6iz6sHNM+XJdjVo8lACz6pUux2Q8fV8YmZrJvb1eQB
         GSd82iumAGTBC/JG6zw5TNu+gC7rsXKTptzqP3zBBhZjLBQerRFYAWCgZaPAqOMRjYEE
         bowvCLBjHjPhokGu5elFbM7S2LvX4I7k05CtRqhVascjg18F1wXfABi5cuT7eY95AR86
         PKBTd963Xp0vyFh+dUPYNHO6BrydqP4uHIoTRW8u6sd1n033V1Gxi6DAjQd+4VLf01AD
         kYVg==
X-Forwarded-Encrypted: i=1; AJvYcCU74Xx3Hj63lEv/9qfJoK8XwR/aPRYd9WTp26jbgFSX+o0m2EqirRwdLuS7jgtUuMy7e6hhR5S71PPeSAFNPUxD@lists.infradead.org
X-Gm-Message-State: AOJu0YwTgsAhbD8KE1b140VHuPTRTWNFSzpN5y8NgKrj6jaOvd5CSB7B
	Xi7MdVJtzI5MVggJHYovY/rjCtgKz/GmN9B28V3YE9vdyE5h6Z0v
X-Gm-Gg: ASbGncudSNNyaKtYIW2WjA+pRcrwAfSgazCpNXg0heoxdCzDR+HMGh0iMKjDlXoXvBZ
	K/w1M2LaIdPJ+Fo14aZn/v3EQ8CAt+LJZbW9Xylijx+0t6sNf9VAR7AiEfyu6IbEJg5r5UK6Cob
	lA2ruOS+J+uMbWwjaLvI2IeiFagdjiR7ofeT+0ZFU+J2a2qtGX7wUqWIAwzUp4fSQZi/hJuNqIv
	b4AyMC6ek05Od+VDbrPPEbkdDjizGo/QzAmOyo/FpBnyDw9bxarZ1Cxk6O+FxC5hH9415OpQQyX
	NGBuvqxtzcu6axfhyJeU6AcB1e5+nxLuwpIpvGIdJ/2vMSjlEpAWv3Bt+G96cux2oxrgeHqi48j
	vmF2YwjNicFZJxwYl
X-Google-Smtp-Source: AGHT+IEnXEKhyoqKyql7HmWJcCHO+Gr5r3eS6SUzYuWVl+B+RTKRMOQwn/WGYHQLnofQqru7Sv/AKw==
X-Received: by 2002:a05:600c:3c85:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-442f20e5547mr55352885e9.11.1747295141986;
        Thu, 15 May 2025 00:45:41 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395060esm60261815e9.17.2025.05.15.00.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 00:45:41 -0700 (PDT)
Message-ID: <d5083f6a-e39b-46cb-8551-ca7a5f6f6bed@gmail.com>
Date: Thu, 15 May 2025 09:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] pinctrl: armada-37xx: a couple of small fixes
Content-Language: hu
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Imre Kaloz <kaloz@openwrt.org>,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
 <CACRpkdb2Njam8GGuN5yeR+DYvi0xe11xbARaoDepoGk=gAK6GA@mail.gmail.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <CACRpkdb2Njam8GGuN5yeR+DYvi0xe11xbARaoDepoGk=gAK6GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_004543_664874_1357B6CE 
X-CRM114-Status: GOOD (  11.45  )
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

2025. 05. 15. 0:28 keltezéssel, Linus Walleij írta:
> On Wed, May 14, 2025 at 9:18 PM Gabor Juhos <j4g8y7@gmail.com> wrote:
> 
>> The series contains several small patches to fix various
>> issues in the pinctrl driver for Armada 3700.
>>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> 
> Patches applied by applying to a separate immutable branch
> and merging into my "devel" branch: we were clashing a bit
> with Bartosz rewrites so I had to help git a bit.
> 
> Pushed to the autobuilders, check the result!

Checked, it is fine. Thanks!

-Gabor

