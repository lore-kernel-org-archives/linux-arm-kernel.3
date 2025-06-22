Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED41C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 20:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XI+miuquo3gzPgrHbyJTHFVjYX9SZTLf8t7NEGOQjyw=; b=Y/Bp99eZJ6n1ZKPiH3ZQIh6h5f
	HnQJd1b+SWwZ1VNz/TW56WX4A90rPX/9X6K+RCA1U568gZL3cdICs2rrImM9jXZHWyTvyMmAcKAEZ
	a1cFRmDVBfI/xhWwp8yeRMbVXZYbns7QPA9aXx8+0of8KwyDW+JRFW5wmEh623SbPQZMhPVC9AKrN
	6UgGpyNnCDR5oe0o9wPQ0LJyAyZ8das/whpUV6wHmap9A6mpQK8CxL33s6xVfcNARRrHrjxHHulrb
	OY7prQBhmA9q8+8LHAPlP2pj0TV4weCqu2wgW1m4hyzP/MMWsOW4X/0i7oMLfPCmRIJuxq1LuT2gt
	bOO3t5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTRM0-00000001B6E-1oWM;
	Sun, 22 Jun 2025 20:31:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTRJd-00000001AxW-3PjF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 20:29:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso2612103b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Jun 2025 13:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624165; x=1751228965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XI+miuquo3gzPgrHbyJTHFVjYX9SZTLf8t7NEGOQjyw=;
        b=TAsAV9w7HatsV3G1Cry2U2sZEJr2x9tiOtCdT3/AT/cjHsekd4RoXpT06c7N4HdkKk
         SzQmScoeG9ad4fHTFNYKBmBIye3hycVoADJ9GqbDsVrYXlyE7mwPQvxD2V1xMfHx2uGa
         ySe2NeeTEn1s62q0jEMUDNzqnhfEp7gJTPb+2wxiCuOc8eYJD9HlGP7e0+Xa6U+pgM21
         TE8Jf7tjmNVpUkI0+6yF/BSl59ioTX+ILr3cGzd24X7KJe9JgK4syrihEY4dk1Bl5Jow
         lMM7j6pwFLGK8d2t86W8VzN4jbq1j0YjBnWwmIEl3E9YQM2RZqr8SJbhJfDiw9psR95n
         QN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624165; x=1751228965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XI+miuquo3gzPgrHbyJTHFVjYX9SZTLf8t7NEGOQjyw=;
        b=iJa9Gd4vdxSKVikTSadt6RKliwoxcIRsdgCVR5PWz8nQXhzinf79oIcb3rOkr5piKM
         A9COUm4EigUqAm9qul1WSfjsD5Mu5VLqYDuh5H/bQIbQJ/H/oRGvOo+QPC0G9mzq2Jzq
         a7c9Qd1udJEO48pFFvHFMk93KbAnSdutyVPvFPhM9KyKniac60kWzMIkUZ8lqpt0wsVr
         zjxRmGw2ESw2VnarhsnGSWcShgLKWTgqVIxisTL4U49V1NR0yZKh8HgEwU2Kru37PQh8
         nK7MElVNGihzdh7+nC7T83fA7FifIZhzMcbVggCVswXn0rCXCdThF+mCBwzuKaIP+z8p
         9Muw==
X-Forwarded-Encrypted: i=1; AJvYcCVH0ESX7tDrnNsUmcpMCkuJ/FqdhmrHUcFRLf3t/6OY6BlHmjQWBvD46njg8v9kDRf5Nbr/IXirh7BwxDumgFuB@lists.infradead.org
X-Gm-Message-State: AOJu0YxxfH5zLLgxo5ICy0FY0vMY8eeHEdxAnioj/NCFvt83XNT6WveO
	w/2gVFBlFjjJ0DDFccTRIsiNZXAyInASFi7p4HeZ+dRd489y2kbNW2cH
X-Gm-Gg: ASbGncvkpH5DWNUpRBZN4i03EKO+vRy4GfQGUkYxUVMKZlKre0lguCnpHp4ksmuuLMZ
	VXGjK+a4D31nZB2BfqHL+ybV3ddetiHIiYvGwlzudo5h5QZ5axfY3v7oJKvV74nQOiWYbFTUbLH
	MzSWe2rapOS3GbwLDbydqKhdMTdgqeDdcJ632KQ2epDkxfNa+sw8auRa2bM6GdwLkjcqX5c4LB8
	IoVzQCdfboXiEM99bFtdjcaFWWcH2BsNgFF2q5XoobigZhUkozLY8/EQTGrm4RrKG/sF19Dtcvl
	/atopwwJntZcyYo3ST2WMzJAm1FmsO/14zgrkz9eISbqYnQffm/13fSGIAiP/m/OdYGQy/23fSB
	MaMXHR9+jrrIzs2LaCH+60vhI7vjlFutb1bDgfQ==
X-Google-Smtp-Source: AGHT+IGzEyIbY5Nuu4V8gPRP1Y2Y8MrHPw6ZQgNlZcDOEJYlnkYOtLmVoxR24UmtSwSordm1VSfqCw==
X-Received: by 2002:a05:6a00:1954:b0:748:e0ee:dcff with SMTP id d2e1a72fcca58-7490d760679mr14084508b3a.11.1750624164710;
        Sun, 22 Jun 2025 13:29:24 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:ba1:dccb:1016:4667:352b? ([2600:8802:b00:ba1:dccb:1016:4667:352b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6b3aa5sm6635272b3a.166.2025.06.22.13.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 13:29:23 -0700 (PDT)
Message-ID: <67b9cfd5-b06f-48a3-9d26-c3fa3ab867ad@gmail.com>
Date: Sun, 22 Jun 2025 13:29:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: export __memset/__memcpy/__memmove
To: Arnd Bergmann <arnd@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Abbott Liu <liuwenliang@huawei.com>,
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250620111257.3365489-1-arnd@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20250620111257.3365489-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_132925_859185_A027D111 
X-CRM114-Status: GOOD (  10.29  )
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



On 20/06/2025 04:12, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When KASAN is locally disabled for one file, the string functions
> get redirected to internal helpers, but those are not actually exported,
> so this only works in built-in code but fails for loadable modules:
> 
> ERROR: modpost: "__memset" [crypto/ecc.ko] undefined!
> ERROR: modpost: "__memcpy" [crypto/ecc.ko] undefined!
> 
> Add the missig exports.
> 
> Fixes: d6d51a96c7d6 ("ARM: 9014/2: Replace string mem* functions for KASan")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


