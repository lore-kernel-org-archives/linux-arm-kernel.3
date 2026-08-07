Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C393C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjSX3DSji4nKkqVPKbNZg/lqBAxi+8jNL2xKHv5aM18=; b=JtsUQuU98NsHI2CJIbhxd9hIAI
	dyDCQnRvUVQQzVI0w+Vy9geNe8MydWdDRt2rhXgEaBBkZr/hYUsZjllF6J2XrIoL6S5xdXdHaPTOG
	a56OMLE/sfKs86WwZn7r6GFg/KbvlK5Jm5D4k1LEMx7Zcz0CD7BDLpSCa7Mc+0WalL0cCljaL4I/1
	AtqK7abQvp6BM2TV/UYoGAujyQFIv/kGPjRvuZoG0qp4c4+AcglPNIzz3VSFTYz2zs++28PyLsdbf
	4YZWH4ZxPGdwcPzn0qg9ed+k4kDmBHh/0BhErOSSdoRMh4gmrGwkkUZiPdQqI8vH3e1AJV0J9LhDH
	V0UxsbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGa2-00000007UDo-0AR2;
	Fri, 07 Aug 2026 09:09:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGZz-00000007UCW-0RvI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:09:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954aff6088so31368255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786093765; x=1786698565; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjSX3DSji4nKkqVPKbNZg/lqBAxi+8jNL2xKHv5aM18=;
        b=g6n7YhdGFEfmbUsAKXpe7wZGacqu9MDdGZn3MwAKfCLlIqiupmhrmhe9Yzz9xdWXZP
         v8wiNV2OjWcxLsnCzDBHg2MAOx8Fl9CtjoBhLG6sP5W7emZqGo21Bpv7ev10jV1Mow11
         mfZrrBHplLGm0PzzLgyv0iWpWy06NBildKcUsUKhdmoX1oZRVkejEwPZG7EowFZTANBn
         5L46pmoBqfj1UdgaKhPLT2qcYGQJY3mSLI6j4qP/VPnzPdb9TW+ZlIMCKmwtujDodgr9
         Eog5t0+cENZzGq1Za2XytlLNS5qVN0JbrcFDQDqZTf+VmIssY5TlBN7cOfmUcVo+M0o8
         1ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093765; x=1786698565;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjSX3DSji4nKkqVPKbNZg/lqBAxi+8jNL2xKHv5aM18=;
        b=e6VleCbqv0jN2BoQRNEjQDyHNwFhFq16QJxK3DQMwFtgUTpH/5IeN4FBvXe/3Dx9jT
         cWTPKp0KatGDPC5HqVhWf2gsFSzE6dVQLTHld6keWenAGXiryln4hKjvy7dUw7gv1m/g
         IinDpbNASUBOCDErTdbDTvFPbzo7gg1rouCjnRLMA3+skpBLt1EzhhmEOZaL4nRUMN4c
         kT1KIj/D+7Tf/FB497zAJ3HSCVu9uOS0oKxiw5ZQHfugRbuadgrc6P+r2B3Lf2LBl7zJ
         rZZ/9VCXNJ7ClBCihLTOam4+8CiKKkXIF4somi74oaqjMeSTiosQ2n5+ExcHtaKrqDcK
         PZKw==
X-Forwarded-Encrypted: i=1; AHgh+RrIX3+1/xpBZrQ3b4yXFqVp62pdXnukv3nKeEMI9uz7nXsEgK5y4W1oNJPMXA+oYfkTdMH0aRVp35hvEjvcJmcc@lists.infradead.org
X-Gm-Message-State: AOJu0YzJmT7jtD6UjxPEZo2Ni29V8njURbYYbpa/AMAy+aj+E9cHopRR
	rbuWl9wOZErTncTRxEdmOQdu3jrdHFTX1cEx+PlmRbrip4lx4ZD1DCAPEIR8aubNlv4=
X-Gm-Gg: AR+sD11pmlClUsSnwteTHItYuvwTFXiq9bqTl1ngDAciauAqTjd9k/vCE3i5M9kBbpc
	M8spZT5/cpfcWzrREwCtN5NdWFHBrYZb4F2JkCNpWyZXcQ01igjT+wt2GN0NDaQU5pJ2KQOCiv3
	IdfuuPO6wk5Co+s3jcw7kHbx4blClBi2jft5ADq0lPpQuxqN90IfGL7UL/S9PBU6sx4SBLoaABW
	h2PuAXKxp/2mU3IETiQyWnLLAYcvVgXDtMFkuJJapZ5EwDjEud48aQPCtGnsD8lf0JWszQheRJc
	w6567FwtBtpwu0Pe+ixQkyjWHjO/KEcC5roEVkUIAOPi56/o+QEjRlUa2hOjkrRx+r6PangAGCr
	b/+hbo49363HmNpAvCD7TaUb7WB65D1naxSvE9ogwfMNWyRqJQADT3DPc9g61nYNMlYC8ZbkO6o
	fuJh31EkPnC3KdYmZVtBbrCM68OPJh5VmwSo8sbO5wO3jqQ7FCZ302X7AdiMSl2BQ+PaX+99zA
X-Received: by 2002:a05:600c:4e87:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4994e7c0356mr282890995e9.11.1786093765114;
        Fri, 07 Aug 2026 02:09:25 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.30.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145966sm3871692f8f.5.2026.08.07.02.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 02:09:24 -0700 (PDT)
Message-ID: <c3cbebcf-19f5-4944-9e20-04dbb442c4d9@linaro.org>
Date: Fri, 7 Aug 2026 10:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] phy: rockchip-samsung-dcphy: factor MIPI D-PHY
 power on/off into helpers
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <Ji-6adk9LJbP87Y7X6SfOcAyVnGpO4dbHk0lBikX3NGAPz3dynWpvL8QjkVM3G3jEnwTrTV0p7nOqBxPRaH0MQ==@protonmail.internalid>
 <20260726-dcphy-rx-v1-v2-2-cf9cc34a412a@gmail.com>
 <43327fb2-0085-4d86-b408-8723d852c258@linaro.org> <anTgZiqnol4226Le@venus>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <anTgZiqnol4226Le@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_020927_167238_F941D5A7 
X-CRM114-Status: GOOD (  10.32  )
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

On 06/08/2026 20:31, Sebastian Reichel wrote:
>> This looks a bit funny.
>>
>> Do you have an int method() {} with a final path that returns no value ?
>>
>> Tooling/compilers will definitely and rightly complain about that.
> int function() {
>      ...
> 
>      switch(foo) {
>      case 42:
>          return 1;
>      default:
>          return 0;
>      }
>      /* cannot be reached */
> }
> 
> Greetings,
> 
> -- Sebastian

Hmm.

The LLM tells me there is no compiler version that will generate a 
warning for this.

Entertaining overdone too

"Across compilers that will ever see this code: yes, and I can now show 
it rather than assert it — I installed the spread. gcc 12, 13, 14 and 
clang 18, from -Wall -Wextra -Wpedantic upward: clean. Then the decisive 
one: clang -Weverything — every diagnostic clang possesses, a strict 
superset of any CI configuration that can exist — on Sebastian's exact 
function: zero output."

Meh

---
bod

