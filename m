Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271EBC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2R+4kjVw0MIjcDwbj4ulbwDY6d2MGtIJTjtocSZokg=; b=OBDbdW5aI1ZZCYvlPSuYTNUMVm
	9CdLjjIxS8cTXXWNu8VYlCGoGzEJI7LlS+yZwAPWScFLUHHn+RIpdfAzye0Ns9EkhJG8KD5YH4P/s
	4lp9uKjv+uyJ3zrKiIYbzPEDkiLTvmNEZGBAWpi/+HWsjI0ToOpxnHJTC9pbKrLfQIa7x/u+Osauo
	4CbH7VaS1du1QM/AF8zbCj81zSMzqBWRbOeIOGOO1f87aCUfefByg8IFunS9gwEwRsDlSTQz0JCMJ
	d+f3GJv+YTxsNMP2JjGS12HCNf2gQ7u/5hAWaF8IM3euORyPv/2oAnj2p+YbyHAAHQasx9F7LuB5A
	BGRHw0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vws-0000000GMgc-1io2;
	Sat, 19 Sep 2026 14:21:50 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vwq-0000000GMgA-1M1b
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:21:49 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso12198625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827706; x=1790432506; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2R+4kjVw0MIjcDwbj4ulbwDY6d2MGtIJTjtocSZokg=;
        b=VauVVVBekLx8i92QzUbHX3rAU2JXvNDMZCYWWkVN4X/6FHy95iTXR+mwLb2x6Sfjqj
         1REY+LIU8IsByVyHUMn7d4CKKbH9nuA3tbWEyr4XaggplHl9LVVzb5kn6R4cjlAsHlua
         8RAV4P5N2liApY6RpLJ5/GrYwEI8csJFITCLTSqWpviWKSNyqKb4lO7Xga4He+YG0bvD
         YJ8vyQDbbDQFhNwHXJAimooa1xpCOMlIYL/Q14A8MRHJccyyN1Ran0B1x8BG9Hul6Pjc
         /O9flPGeADxpZTA5lxU3KYE0agJ0V2UHmGc8IsI8NIeBAEXngUvB4gyljFAp+CZ5Pm9T
         7HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827706; x=1790432506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2R+4kjVw0MIjcDwbj4ulbwDY6d2MGtIJTjtocSZokg=;
        b=als3MqtU3OSbtOkn1fiGFAzY3dvSwrJyYMAzQBsIB0aQgWHiBCi3Ytk5+SbcEAjdQe
         yx9nl+n6MVrMBqPdNmAWP6b2dENupydkvYls2xvOsqZna+cCXCzBhVPvFdnsvKJsHR0s
         u9xE6tyFXarNB9HVAAKzHJMTls+Sku9qsKNPdu9ciQbeF3RWwOcg7EfP5LSdsY+foUzP
         bhkh/qBCEf1eIp9YIogxMf0wMDJ3117dI2Xxd0wSycayoKK52UqimUNFpUlg2d63mHdC
         oecCYWqETHSf/1AX6e1LFFCDzBlxs+kiN58rEzNeCZjUKTX7hbWGqGtuUWgayGABFgNW
         1Q+Q==
X-Gm-Message-State: AFuF++klAagbkWjA0j0E6KhEhLXVGsborNPzxLRqIv7knwcX7ZwRkEED
	at63oWt7WZLorp8VGlH1eBP7B4vDchX0OkYO/AYDL1+C5aQmS7c+08VxPRnLFXmboSc=
X-Gm-Gg: AYBFou1OiSFMd5mHVmy6QInrxmA7zeZQluqFTffvdjKSf/w6olez6t0ZSDncXcrMrpH
	SO4Yo2+GQnuffgo1QDI9MEBeKYbTf84yiOCXdYnVzepivOIyUjdmZ4tvaWx2MZjoc+tM+E8uvVG
	7NwJ1BbWoyBtaOrpePAXYEb6zR+CJbnKV+mCGPdRcWgYImXMd/Q6FbOaPTKbUylaKSVDpcxbbi1
	mg73hsCpL+C/b0WY82pgH+8XbvcuMiPL3aep6OACK99ccF3Z9EcfwkmvWhrS+dmy1aBpsmfogG1
	dnGlmW/l3+VpcnowG/87vYPDuB/l8XfcgwDSuoocrZWxFuU7IiNhGcLxHZIY1coTZVhIZDezKGw
	pJtZ7kkaVJUNz+yVxN2gHDGaCbsUf9s5088thWFwa/c2MdnOrtWcFYhXZpe8hIh0dWWhmTgI40k
	dV6lAn9AqcuwozhXR5szCsHlqPpTE+NBS8Y0TpaAWZwDJg5smsiyj5j0uSqDLP2e6q/wYyGZk2m
	zOhecGQjda0dVJ1FVckgIz6epWEMILtT5okZyaM0rhXIJ1LGpK/S48=
X-Received: by 2002:a05:600c:474c:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fc569587bmr82361065e9.14.1789827706512;
        Sat, 19 Sep 2026 07:21:46 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc521f5d9sm38646635e9.2.2026.09.19.07.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:21:44 -0700 (PDT)
Message-ID: <06eac2e8-183a-4108-9eb5-8e141902e4bb@tuxon.dev>
Date: Sat, 19 Sep 2026 17:21:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend] soc: atmel: Convert to of_machine_device_match()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <c3b4f8aceb5f0bc95fa10e6fa469574cfdaa8ee6.1788429505.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_072148_370421_E5FA9A7D 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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



On 9/3/26 12:59, Geert Uytterhoeven wrote:
> Use the of_machine_device_match() helper instead of open-coding the same
> operation.
> 
> Signed-off-by: Geert Uytterhoeven<geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

