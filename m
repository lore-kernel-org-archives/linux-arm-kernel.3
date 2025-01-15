Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC1DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFKwmVwiS7IFaxPoXvsho9KfAcIhxJ1ZRpPv8inn8w8=; b=gVf6qKN+i7NUTklzBc2sOsfIrD
	AhwBN44caA2Ue2ylLZdYGoeiZiChKxa+LjEXSqnDVcnZO2UwSQUI0ijwy3duH9SxL7+1jiPg77Wej
	KkXp+IwYKdFw9fiAsXYEqJq3cJkfKyqBjVbKN7cdEtHrda21ZuKkmpbJjKZwb3CJxiv5wOxbDFuBu
	EjCTOlcCjj86buiLYGiloNAsWBdvW/OS1tmkkpa3jxc6auF1GcRBOG6oLV9KFn+QD5m+kJDW3aZd7
	YiAMu2dU9snZv+NTANkG2AXXyHTFXsnT+O03fTBLuCW38OGt0sU8U+LhjUbC+tGA8MVNvpCrP1DJU
	QkT43mnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2Ir-0000000BoaX-1m5E;
	Wed, 15 Jan 2025 12:15:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY2G8-0000000BoBS-3RAk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 12:12:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361f796586so69474615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 04:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736943151; x=1737547951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFKwmVwiS7IFaxPoXvsho9KfAcIhxJ1ZRpPv8inn8w8=;
        b=g/9CcHD83KbzonczWCpRB4i4AWH8MqF8SrXFmfaSwKG13CoE4Otz1FuDGtifVlMd7K
         hk7QAXQg3mH7ObP0Z3bk0HjyJH0k3yNyLUU6C73a46/8U1VaNCsVQkVbLqvnWotTAKjR
         0SnvsHukJPoscEFyeHJ7X8vTWbFI+kRkEbZ/ytfp6AbhSuMDkztUzcPGAsQ8dJt4rDi/
         Aq9ME29DHushH37n1nDAjPQfLSHUEuxCSgP3PselU+5CU6pWf/4bLMyLr5ybVzXNCyMI
         aXpafcsefttGYRgWLfdar6nml6utUWABmfl+9cyVsHsuQTNLe+o+TuM6tkpx4TzuzEMZ
         qexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943151; x=1737547951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFKwmVwiS7IFaxPoXvsho9KfAcIhxJ1ZRpPv8inn8w8=;
        b=a+TxORQhvNVCBboYtPAzG94/TUxViHqfyHlHkqXZqkZ+k11pDO67c8L+CLs70N6xOw
         nuhn5NFCFNjnb92zFRo7EV7v+51omGmQVpl3R/k5Uc5CTubWfIjryXib4ShlAR/fpfTu
         AxRcEXgTAXl90bNIO8REBaIo1VyKrGDCxnL53WO99Hh6td2OBQ78DzqEbIdMNcwNbmhf
         mKLl2QioAJm8rp3jsMdt6nWI0zfRJmJjYqgcbBF3j0kX+wLVRVVeONoTIGNcb5q+9GnK
         VZ+cferZR6rMAASxGTZy4Fc5QnM86aSU00pgiKMocdqprbt72vJ2DwpC+lWlpmOlMG+E
         x+HA==
X-Forwarded-Encrypted: i=1; AJvYcCWUkDRlc9JOgqv+BCPNGnViVg423nbbOYdKWvQqHsJq+2ypML/s4pg+UVPfT9ai4ZKOMI2LLp6CGgOWzzeTOwqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxJKl0C/G4PVQyUrfRLJ7TNSpDRUP675ryhrr2QLuQQGqoc7LVv
	/vU52GPw9X2d177pQXQlIbd3X3FneKf+0NyBT/OdUDopXgX/bdTACMjC5hJQTJw=
X-Gm-Gg: ASbGncuMrXAxlvdmW2HuwwEO3BL90q8fOcp+ljP5oOuInQoEK7liKnHvJjYKZu1fkqW
	ZButFzesFY1WyrB6Dbi6lBNSmq6ejIRTUDWur8OCQ3DYeVflMvDQI/RiLsV47QuZ04qSm/cTZp7
	nY+fdtHZPDrLSPDEwaVQnoYbey4dj/fKzpPfUe4OuJ67yqRJdGAvPwphDyoNk+MMpC4L8qJk+tc
	+C1IspnDZ5olvEnLr6sfF3FWBiVJFkAd1LXUWCvfrXDcXxG7WHvbtIrChb2XodhG3DuFHHHgQ4A
	sHJQ+vBmuTQl2Vbs+NOJ04NcmTqT
X-Google-Smtp-Source: AGHT+IEnq6vo1E5LSI2Qrhm/y3n3Xe++W2QNQ6RQqz61y+rXMn7THrldWxmRVHgfkDHSnoXO9oEzlg==
X-Received: by 2002:a05:6000:4802:b0:385:e877:c037 with SMTP id ffacd0b85a97d-38a87338d79mr24645826f8f.42.1736943150788;
        Wed, 15 Jan 2025 04:12:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:cf13:bc18:6c34:e11a? ([2a01:e0a:5ee:79d0:cf13:bc18:6c34:e11a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1c01sm17722217f8f.97.2025.01.15.04.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 04:12:30 -0800 (PST)
Message-ID: <fda131d9-50bf-4049-9e6a-f9cea61846c9@baylibre.com>
Date: Wed, 15 Jan 2025 13:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: add mmc2 support for mt8365-evk
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 macpaul.Lin@mediatek.com
Cc: vsatoes@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20250109-mmc2-support-v1-1-9b9d1b1ae35d@baylibre.com>
 <91ac34bf-e184-486d-9af7-f9ddaf8f26ed@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <91ac34bf-e184-486d-9af7-f9ddaf8f26ed@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_041233_067223_9C64BDE9 
X-CRM114-Status: GOOD (  10.06  )
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



On 14/01/2025 11:38, AngeloGioacchino Del Regno wrote:
>> +&mmc2 {
>> +    assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
>> +    assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
>> +    bus-width = <4>;
>> +    cap-sd-highspeed;
>> +    cap-sdio-irq;
>> +    hs400-ds-delay = <0x12012>;
>> +    keep-power-in-suspend;
> 
> Why keep-power-in-suspend?

This slot is mainly used for WiFi / BT / GPS chip, which need to keep powered on.
I guess this is to avoid to do full re-init, re-load firmware, lose context, wake-up from it...
TBH, I didn't work on it, all I know is MTK need it.

-- 
Regards,
Alexandre

