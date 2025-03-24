Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DE1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUsQAeLrXmMBDPBNBJ5Tco/UmEd80PgNGXB53REdkSY=; b=KOoB5MS9MJg78pwCbzVyb7XqgJ
	XEMxoMs4CPiQZAEpwj0F344y4jX6uxy+jgXDzBZPPElXghROcJDE1Xha+6aGNK71cVljdc2D2kjhd
	bhlrnFT9pYPZGY2RDs69Vlg2b/p7CjFnAoPelxWelExusN/5Bpy746MBi5Dhve/urVldTRHhBvkyJ
	fnnP92bx5uLofvjR6uJTRwL+ZdHyjJKKfO20PVivPu9TmZ5FAVjTPdVZ3wkCoLaxSyeg19c9RuoKa
	cGqki4TRzTSZbl+YyYLB4P4XKm2nxPv8Miihawt+OGTZJc4wwdyzFZ2gEo9O8TJIAyO5M3JvNCr9Y
	lU8qfq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbwA-00000002PGP-1cHT;
	Mon, 24 Mar 2025 07:09:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbsS-00000002OfD-0IMQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:05:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-391342fc1f6so3314695f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742799938; x=1743404738; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUsQAeLrXmMBDPBNBJ5Tco/UmEd80PgNGXB53REdkSY=;
        b=dl6gpAGX+CwBKLMYcICzZDvVH/2TlDWMCXnOUU4IG5IQkILFvdH5gbAxpihSV/fVuL
         eZWjai0spRtAW2lLCKiIXj0cvxeApHRct2R6bnHGYa3pjypBiwVpPseIVFL2Twx2eBKu
         xlSa2LbQ+sGdf/4cFicKUjS+3URpLmdPSKb5S+8TqdiHmbCrdHSw8muPSUvK1QILjnbR
         4xChmuKlUc9X6EUkjUeR+PTPN2MWpCFN3x+mKyPpeLMmtzmTOhsh9obXY347xQDb5hko
         DlFQs5F+knO0iBNNUsQrDKCEzA4O/6FIB+CIRdMQzTt1zr4FvtjwDmsgwDfhaRQX9wbO
         1HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742799938; x=1743404738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUsQAeLrXmMBDPBNBJ5Tco/UmEd80PgNGXB53REdkSY=;
        b=ADMHsjbheiVvq7UJYW/WfaZO48HJImnuwuVLXOoblYJDRQp63wEUgXHb7FwmX6dHYh
         HIF++fXtK8BSI5hJTY5SWbDBCSj8CdlNBh0Ad8QkKVeiZyP5yv9E/2xDQX6UYVQTBppL
         GDFT9AMP8aO+++YSOfCFfv6tAob+EZE/kx/7Pq+Kih6Zp1p+F2ZXi5Q7pwJ9lgXJtL74
         09Taw+fj3lmmiNJeZt9Gf1yxLcS2GZurOreXEpRGgSdjVhpfFuPMKciDHd6/kEJ8gO8e
         tK4Dq8cLWxSGn+PirbrcwUrTZ+PX+Grsohz+1FPs/VOFaBERF1C9DddKWf6vRpNVXeCh
         +LkA==
X-Gm-Message-State: AOJu0Yy3xOShH4wm6IyZz3lAH5w5bqj3YARZhF7bfD9IWvcxmyavrLAS
	HpTm59E/yY0teT+QDkb8YR5foloXjTWirkWXNIUWCFVa69wFYy0IOA7kljzdPznGbLUn6TxQYpU
	9
X-Gm-Gg: ASbGncvZdzbwsf0Uw3I4J9G4WvRV+S2VV8zMCfB95p4h7+ZyjH6rI5zUxjqZu2R8+F0
	XHId2+oV2faYiyRfOlb2d509+NEYQ1vpgmFcLVzdo3zuaZC998fckU6mldZd/UmXuHK0YoAXObG
	Ch+xzsnKr3w7VlAIq019O5FFUcZiPC9rC9TDFrTtaXWQ7x0jYGV+2UCWouvndGthh64lhWwpPjO
	qrsLgmyMSdkqJPBaoQGBTrOBZXKa5LOOksQpUZRAoBU/EbUGE/GJ0sgJOik494mtE26qsL2P2BR
	uFAeLzwhT2Sngd6fuaqv1i1E+1feWNBr7qujfsH1a5R+7SF/IriMrunV6Dm7pCAcEt5vdm4pjGD
	sj/5RvH+b
X-Google-Smtp-Source: AGHT+IEMETz2s8mO4odpgp/jacQbTVDD3wjaf5GMfHUB88GZYtSFOPZcVw6BAKzh3clt2DPNETurfw==
X-Received: by 2002:a5d:6482:0:b0:391:2da8:6e26 with SMTP id ffacd0b85a97d-3997f94083fmr11257517f8f.52.1742799938385;
        Mon, 24 Mar 2025 00:05:38 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43d7c6a5sm162871945e9.0.2025.03.24.00.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 00:05:37 -0700 (PDT)
Message-ID: <2da5156e-a793-4c97-a1f2-1d0daed2dc7d@linaro.org>
Date: Mon, 24 Mar 2025 08:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: s32 architecture upstream tree
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 chester62515@gmail.com, Matthias Brugger <mbrugger@suse.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-S32 <S32@nxp.com>
References: <2f686d68-4852-4aff-a551-51e8515de6e7@linaro.org>
 <fa9d57de-9eb3-d317-3d39-3940248ca17a@oss.nxp.com>
 <c16c69eb-a5c6-4b3e-a849-3b1719d26dc7@linaro.org>
 <7139ce39-c089-5932-4d99-93e9dcc7d321@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <7139ce39-c089-5932-4d99-93e9dcc7d321@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_000540_107611_C6C10875 
X-CRM114-Status: GOOD (  14.47  )
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

On 24/03/2025 07:48, Ghennadi Procopciuc wrote:
> On 3/24/2025 8:43 AM, Daniel Lezcano wrote:
>> On 24/03/2025 07:27, Ghennadi Procopciuc wrote:
>>> On 3/22/2025 1:39 PM, Daniel Lezcano wrote:
>>>>
>>>> Hi,
>>>>
>>>> the MAINTAINER file does not give the information about the location of
>>>> the repository for the s32.
>>>>
>>>> Where is the repo to base the work on ? Especially the device tree
>>>>
>>>> Thanks in advance
>>>>
>>>>     -- Daniel
>>>>
>>>>
>>>
>>> Hi Daniel,
>>>
>>> Shawn Guo's tree should be used for the device tree patches. Please
>>> refer to the 'ARM/FREESCALE IMX / MXC ARM ARCHITECTURE' entry in the
>>> MAINTAINERS file.
>>
>> Thanks for the pointer.
>>
>> I don't see the SCMI clock bindings. Who is taking care of that ?
>>
>>
> 
> Hi,
> 
> If you're referring to a header in 'include/dt-bindings', it does not
> exist. The feedback was to use raw numbers [0], making the header
> unnecessary.

Great, even simpler !


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

