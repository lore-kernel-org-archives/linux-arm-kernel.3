Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6A9C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZX0aGXRptTCUQcorsU5tL8EzdmJ/4Dcw0VhDpZ9VkFw=; b=gV2U6WZBxwQIEwnSoBHjJtLnV7
	z+rA0y0HhRjtkwQOnAKlsVvEVUulMmB5Ofdpq0XinWOuVNIljdXwhD4PCiBkf4lQD+i/mZ1sHwxTy
	Z0G29irobEruXjgF5rhtXs4jCe81+GaZR6tvRgIz/8Ik242AjOOiNr/mzoi0jBGe6h4xfTiebm90U
	nqUZ4q3r73M9VyCtysA6uikothExy0FZ54IER9zxTG26PndrnLoOfbFgeXPs6yEM048RgE1VL7UYP
	QjrW/DPlWRmJ9Diez5//wnhp8YxsSlTO22Hngo7D919Sn0I49JcIb5LV8nkNgZiCVbkwenHBkR5BF
	cC+ROA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2ACI-00000004RoA-0E1U;
	Tue, 08 Apr 2025 14:45:06 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AAU-00000004RRS-47af
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:43:16 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-60219d9812bso1581287eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744123393; x=1744728193; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZX0aGXRptTCUQcorsU5tL8EzdmJ/4Dcw0VhDpZ9VkFw=;
        b=QV3PMiVuTm1QYllkcEi4aPvBHFQ4o6/2VuRBBzIFrrOGlReA8MsFcC9+sqLaa6CNaN
         UR3rNA29t6kH19gkiNRrjD3+/VUF0nbm1GD5cZuJnUyVUPnmtfk7jhwFl9bYjkcLB0jA
         GtRIAlxr04cXFFLuoiBYkvzovG+mAl/XhskWp9dYN8uX7M8LfBeGZJ9zckYWgd6a31sI
         TwhHdx3qV+NZOUAFTrj+IvAeMfm2nFucdgCxUL3+4U0dO36NzIj4c3S9OibipviFfFgM
         RHjjlJwiUCM/21oM1x0TiiRY2Jjrl4VI1kKZsVkEbKDvzOp5R5o6soGoSz2eOqo/nHao
         91Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123393; x=1744728193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX0aGXRptTCUQcorsU5tL8EzdmJ/4Dcw0VhDpZ9VkFw=;
        b=sJoZA6LsZnnmNMwPLNlQbaAt4/adPkIdhcP1+dWNIeUx3jFvSYzxliKxEhPawn0+NP
         m2ULuR6VU7ApO6Ru8/zQUzZH++SIrWI+N2HqjkVu5b4Ga91GBhT/IK63EWfK4w6o3dIr
         dgNmpdFwpnXqAEp9NMWl+fKrlTXldxCse+wU0F0brcdT2DQvVqNb65aLk4ii+XLpUbIh
         vT8zmAbSObBTF/3ARi343w2DNcrji5lP7yjuowvuzS5+6CiuOPgC130gzuptalygpDeI
         R424vwKztICsCxDIjD861V0LDlvtn0X7eAvETqXHizdfRV90jeE2mC9jrNVaz1rHsEMA
         mOxg==
X-Forwarded-Encrypted: i=1; AJvYcCUovJK3NdCROozXZD/ricBpQbpHzjDpV1Hnz8/QegTTANTf8ydgBHfcvBH/JkYNytyD5Hlh6c2fL9Di+QwZEZn6@lists.infradead.org
X-Gm-Message-State: AOJu0Yykay2oiTNaGuylB3QFkQnmHuwHR2rg+m4cje7j/vXXw6yIcOf1
	AmuZz0EWfCm6CTyDvr1ZE+vZAVwvYNPwjhfx+HBIoS5sycjr6ft0WGl68V3PBtg=
X-Gm-Gg: ASbGncsc9BHpMsX0A5NVG0aE06O4cIBmBA5AAUbhwrsAaS1rFL/UMcIulIn6Lh+6xw8
	FTPYsuWa0Z0fY7ATbsijwg5MV2oYlUArBpp6H68+fVWmqKGO3XzesQckQnXKQC7bcltamgG9Akp
	kkmDrofegoPuZ6FsibtaRpF0Vz5LNF7COTH7yFXscsspSYH/reqyEGcnZBWNBZJEhVvOSVOPUp+
	EC86l9EnPcqpixPMUOvSca2/CWabP0vxVhypU68QLlvuoYFNlvXHjviMUt98pkP+bjVEwB5Tb2y
	+pIRYcvxYAsmu5xHzpMaP8oMCOBX+bdn7d7xzac762G2fie2JfRNt5ZyqF0RJApxCpGv3bHl8Ts
	AyqXEcwozaM65d/ym
X-Google-Smtp-Source: AGHT+IHydLilQvszzuRpWvpl8zBnzCfe2oBsCFFQZFAPCcrx+PW2NEIcAFyuNBZbinDzJI3j0Elo8w==
X-Received: by 2002:a05:6808:4493:b0:3f8:7c69:561b with SMTP id 5614622812f47-4004d99ffe3mr7838878b6e.14.1744123393329;
        Tue, 08 Apr 2025 07:43:13 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40069105b97sm475279b6e.13.2025.04.08.07.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:43:12 -0700 (PDT)
Message-ID: <0550fb58-cff3-47fd-b5f4-cbc19113436c@baylibre.com>
Date: Tue, 8 Apr 2025 09:43:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: adc: stm32: add oversampling support
To: Olivier MOYSAN <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250403162358.1257370-1-olivier.moysan@foss.st.com>
 <25b34e60-5392-4bfb-b994-49212dfbdb22@baylibre.com>
 <6d12b6fe-85fb-4345-bf32-02c0fbb1a27a@foss.st.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <6d12b6fe-85fb-4345-bf32-02c0fbb1a27a@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_074315_023133_A520E409 
X-CRM114-Status: GOOD (  12.91  )
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

On 4/7/25 11:07 AM, Olivier MOYSAN wrote:
> Hi David,
> 
> Thanks for reviewing,
> 
> On 4/4/25 18:15, David Lechner wrote:
>> On 4/3/25 11:23 AM, Olivier Moysan wrote:

...

>>> +#define STM32H7_OVSR_MASK        GENMASK(25, 16) /* Correspond to OSVR field in datasheet */
>>
>> nit: Comment seems obvious and can be left out.
>>
> 
> Oversampling bit name is "OSVR" in datasheet H7, while oversampling shift is "OVSS". For naming consistency, I used OVSR instead of OSVR,
> and highlighted it with a comment. As an alternative, STM32H7_OVSR could be renamed, but I would rather keep it unchanged.
> 

Ah, my eyes do not easily see the difference between OSVR and OVSR.

Makes sense to keep it so grep picks up both spellings.

