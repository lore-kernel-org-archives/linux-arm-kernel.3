Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F92C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKMhv36eTVwOYBrxUb1Bibo3iK9Aa6oEo/P/njWpUJg=; b=dB2b3obNMwi9uuSEy2uLSt4tZu
	WEytLW2bpKng4oZ7lJJcVimn7WVnJjqmj3P4l/gXKoDRXqqnHfVKR4R8QGboCvzDpgJY72p2qI3Ot
	wRj1sB7tQ2lcrhk648lAZJVlNdSA/VAAINPYisEIchcP2ycTyWX40lJvyGSs7uMRd4etGRmK8FWuG
	0JwweG26FQDB3N1jabNZchPSTwR2FP3nGYukV/rvAQxDm2UmqKyV1MVtcwR/Cm4Fm9NZMSqIVt1DY
	jKIQJv+uwklaRU4K2lcQV44WCgokKea7qPGEQsCCvsZwVnGFCiqb55c0xFZqSuOApDpx7AXXeHpfM
	5Nbo9gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gYu-0000000BjMX-1bX1;
	Fri, 04 Apr 2025 12:54:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gX9-0000000Bj5G-0uBP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 12:52:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22580c9ee0aso22853565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743771150; x=1744375950; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DKMhv36eTVwOYBrxUb1Bibo3iK9Aa6oEo/P/njWpUJg=;
        b=NMurWp4SlH2YF4RXf/GYepoU4vqEXvp+/pO9nk1Jib1G+/BiItq7vUBdmmnhak7AXl
         oFiQzl/GvGshpXgM7g+ly/sAFbLz/UGYJw8CTx2sMtskA/SCdJHe5LXIFS/kHiBExotX
         K09I4Ad216mQ4IyHN1Ow4pdLv0DrTihPmRQ4Q0mMsLjgfwqhz8x5wJLVDAWcic8dcOu6
         ivEHJ7QRt/Y9q6bBlhhwwXVpikhH2vTxwcSUo4awLhOioDqbZEL+HJ1T9sykGK6YU0eI
         1dwqvcWHUatYR3qof0BHL1NVL+1CBeEThcPFwXgIkWByECa+f9Or4+g+TZB0PWSqxwOj
         EUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743771150; x=1744375950;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKMhv36eTVwOYBrxUb1Bibo3iK9Aa6oEo/P/njWpUJg=;
        b=nvLvtDwhHVLDgfC9d4Gxv56NJNL5MO2MjuRG7wuLt9LEq7nrGZsrnMCCP2uev+mwTk
         RTslbJ3qXWMRIqtcWLGVmaQWurlia08ETvpqvLI9ZQt1Sj+OMTyMyr9iXjR6/28Ggns4
         JuTuVHAGdqrF1u/KjYqoaXtPFD7ars/p9SmPgCgMWCEcSJWbr6oFeHNi8zSS25HZ6Fxd
         NJSc1YIZwMNYzht2ajAk3Pc/iBYuAlY4NxIxtf2aVIKzaXOaHb3/4ih16seGr23MCj0b
         sZbGPU+OAKHlfsb1wnW+m4KJUImth7JrvcJQDFBELRMjpSe2r80CNrWvm3lxcER1P37o
         O/mw==
X-Forwarded-Encrypted: i=1; AJvYcCUYOeynV8vgdjP6zAVJVE+blQvsCR7+ULLGpl8fQcLyLcjOTHtU+ec7CimqJ3/mVs0tqxuyUSkz8EpCGXCbxr/t@lists.infradead.org
X-Gm-Message-State: AOJu0YycqfnWz3csUrQ580qqWcvTniLHA+6OwQf/rZGnHBN3obQKNdV6
	CTQOEiyWJzhguDQJPFRDUZN1rbp5MThncSFVylDmLdrjcZLGzwzFvZCTEIbHhA==
X-Gm-Gg: ASbGnctJCJ9bKaT3VKgWs3AjZPPvv4P+q1gOIWNFXdRnb2XmUP4O54D/+ksqYnRejPi
	+oK/5E085WXG3wd01DDm89ot91HO0Ovv8lYgs24Cidk/2vcJ1sCqZyIu0ym8HuR47oqLXJuk/yF
	d2HTj4Csc5hWa2r9QrHUhvhIQ2aCcJFce7bj6AmwDU9JdZbJizkLkzk4VTcQB8HfhdC8EygUg1h
	Si0ue/3TqiJIvz+r9nctnz+6oNL22+J6skvelltvri6rlWRcNptdinGHZChAv7ylFhu/owX9U9w
	XvWMVOYySlVFe+VUvl4nFw7ho+/hB32mF90TwZxz5LPvAog6N7RRzJTC+ycrBf1icg==
X-Google-Smtp-Source: AGHT+IERCFn6js6qeVXEwdJZjCbdeV3RjyphuuYpeMmQ+ZbwSxAgINay3FYEHGIrYESdCmhtl9xeVQ==
X-Received: by 2002:a17:902:d4c7:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-22a8a85a18dmr40259765ad.2.1743771150028;
        Fri, 04 Apr 2025 05:52:30 -0700 (PDT)
Received: from thinkpad ([120.60.75.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad83esm31289735ad.20.2025.04.04.05.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 05:52:29 -0700 (PDT)
Date: Fri, 4 Apr 2025 18:22:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shao.mingyin@zte.com.cn, shawn.lin@rock-chips.com, 
	yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, 
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
	heiko@sntech.de, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, zhang.enpei@zte.com.cn
Subject: Re: [PATCH] drivers: pci: controller: pcie-rockchip: Use
 dev_err_probe()
Message-ID: <4mbdugltwhiaw5kgg2d44jq4yz4mpdrscjiomp2kmnv5gk5i22@hid72rovi2oj>
References: <20250403154326411S4luMrK8A5RXovincATzF@zte.com.cn>
 <03d12cd2-c719-4703-a0eb-2a32ef41af92@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03d12cd2-c719-4703-a0eb-2a32ef41af92@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_055231_255029_F78A3584 
X-CRM114-Status: GOOD (  13.90  )
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

On Fri, Apr 04, 2025 at 08:09:40AM +0200, Krzysztof Kozlowski wrote:
> On 03/04/2025 09:43, shao.mingyin@zte.com.cn wrote:
> > From: Zhang Enpei <zhang.enpei@zte.com.cn>
> > 
> > Replace the open-code with dev_err_probe() to simplify the code.
> > 
> > Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> > Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> > ---
> Considering zte is sending untested patches from poor automation (or AI
> generated), this might be correct or might not be because it does not
> look like probe path.
> 
> Anyway, don't send patch by patch and line by line. Why you did not
> decide to fix all of the places in these drivers?
> 

To bump up the contribution maybe :P

But to reiterate what Krzysztof said, please send patches only after fixing all
identical issues in the driver. Patches should be split only when the fixes are
non-identical.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

