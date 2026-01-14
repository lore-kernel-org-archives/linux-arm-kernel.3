Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61D2D29FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NcxQNU+z+mjpVWzVO5zIslJ+Ha+xCleufzRRdU3nw0=; b=t35X4hE0fAs88+53AkXQPPibg8
	Kp3Y8Av8H4MVlLbYEcv3qH/kAdJlbFoKMqb0DdiaeFVDhPPg9ReG99+/4lFlQBm8/ssFQ81pB20Uy
	ZYGghIepRvlgP5uOo6a6bmMIRyR3YZbiK97qV2llsjKwZ84/OWkpHx8kUjTsD6AvjmN/06qQ0590A
	RVSD5GC3kzbI/Qr6lreU7fbgfRwPyjxO8tPAOenCvU6tn51JfQg6UMuVR8ldQxoEFrInQQa9Cz21K
	YuaZ8q7T58So+M2ih55xjQnZBuQ8eEXIFvRxuAuJq3jaRkg2+pgUq3jqY4bpxe3xZJth2+CwQq1zS
	W1rhQnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyJO-00000008pq3-1vJ4;
	Wed, 14 Jan 2026 10:41:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyJH-00000008pnV-1hMi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:41:12 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so54024985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768387265; x=1768992065; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NcxQNU+z+mjpVWzVO5zIslJ+Ha+xCleufzRRdU3nw0=;
        b=Rs1VMoaGExrvIbqfJgrIObFoy8mvwJ6Hm4YcHlpedB5SoOlXvf5JydBnIA4R7azzHk
         oIiiGV2paaljr2fXBRgug/Aj2ywMssyAQKoIeNAXikz04uBHXuCPC1ofNfN/Nu0I7enm
         d+shSZ2qRK7eSw3ldOq0mu+Z0fyX/BPQWrddqG7/hru26Mt1b0tv9GdlvMz0bYcieY8l
         n/1ocAxQnogi91rlNEDaYhaDGLyyHrmhsg3JvDCSYZLiUS71WvAJdkc6M0BYC5pLlxFB
         cbeXJ0UKB8iN3GnyQgewwA0j0X8eBKh9PBIxc2d+gBYSempyoxe0D/fgU7y7hRBhMxds
         Ac6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387265; x=1768992065;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+NcxQNU+z+mjpVWzVO5zIslJ+Ha+xCleufzRRdU3nw0=;
        b=mHoIne/VpiZPajHBEBJEfSG3DqGo0iKmiPv4YVsLnXu2Eom2zrfYdYjB7B5wRKa+7y
         fEHlFQsmfmYRR+utzbSEv65f95X0aRqBIWxclVvRwT+yafqKtQO6njCCMV6O1dEtJGGK
         iRetIkofO9mN5chkunTKDHnEXw4KhG+pWXKdavfz0ISsWKiOpYDe0PqJoK8ga6gvOJS6
         eaJ3XDKIXNZnYFEq7U6pdyrGnZo42re7WINj5AZycYE+fWyb8iS4A0QIn5C7tX/lLUcN
         KVk2Z8L2SvJ/Waai7YjFzMTtFsSCTGejvrvBmqEE0au5bo5VkjbQyRKT6hvs6V9ICwhn
         W11Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKd3QxipVXm6612uhMKvtkhAhKtou9CKx4zsb9LyJ83nCqtPOYosWG6KOiUR349GmJUXGqzoiOurA2quUaKhwf@lists.infradead.org
X-Gm-Message-State: AOJu0YxKdIm/RU2fRqtz28FBe0YJBsRKOnLcwdlTQgVLJvP2vfecpw5a
	VF4RYXtrYLlEtEBp21KgTWDlv54A2sEpaUdsf1UE6f5z8GHpdxrFPcBU2dfGuM4f7EU=
X-Gm-Gg: AY/fxX6Aq8NkvxJY5KSRcPXVWSTAkB6cFTp2YOtou7gMOQJFFh7iGFvOzd74jT9WMhi
	eYNqrzs74b5EAcd6ukAe/7M+CJp+PmvG1ntIQiOgX6RycpZNbZmwlz3W77DrX/TJsxS5ZBUIeAW
	fAXsbT0tzonF/vnbp3uRfSf1VJywlMsMLoGug0iyBdYnYrAsGF5Iqz5g+m/b+w4QceSdwfC2o40
	4A2W2W+CXNmw+HgPbkbk8N4z6z6vHfyZvZvlLrf0VqbvfZXiizBp2UUnClaAjUQ9XpCcF75MOdP
	utCx+ZCSrMvg021efMiM9dw6OvAVKqdQ0e6tgMO9n2EthB4mad7NUwerSH9UI8auRPEKlI3scEH
	bE5+DH3tqTAPHO1s6VdaoO+Clj+a9VrUnYU2fv//Y2UJrzf9Mx70Oz1Zsa2nbpTfqbsf+x5pHl8
	hOTFG/oDSWzw==
X-Received: by 2002:a05:600c:5490:b0:47e:e20e:bba4 with SMTP id 5b1f17b1804b1-47ee3356e79mr22358195e9.18.1768387265370;
        Wed, 14 Jan 2026 02:41:05 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f2cc:bd72:2de3:86cd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee578d37esm21654835e9.1.2026.01.14.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:41:04 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Nick Xie <nick@khadas.com>,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: amlogic: s4: assign mmc b clock to
 24MHz
In-Reply-To: <d55bd5c6-d5f8-45d8-9c6b-22e401f6a7ff@linaro.org> (Neil
	Armstrong's message of "Wed, 14 Jan 2026 10:05:35 +0100")
References: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
	<20260114-amlogic-s4-mmc-fixup-v2-1-7e9ab5f12286@baylibre.com>
	<d55bd5c6-d5f8-45d8-9c6b-22e401f6a7ff@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 14 Jan 2026 11:40:59 +0100
Message-ID: <1jikd4xyro.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_024108_011762_9790DCB7 
X-CRM114-Status: GOOD (  16.58  )
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

On mer. 14 janv. 2026 at 10:05, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 1/14/26 09:56, Jerome Brunet wrote:
>> The amlogic MMC driver operate with the assumption that MMC clock
>> is configured to provide 24MHz. It uses this path for low
>> rates such as 400kHz.
>> This assumption did hold true until but it now, but it is apparently
>> not the case with s4. The clock has been reported to provide 1GHz
>> instead. This is most likely due to how the bootloader is using the MMC
>> clock on this platform.
>> Regardless of why the MMC clock rate is 1GHz, if the MMC driver expects
>> 24MHz, the clock should be properly assigned, so assign it.
>> Reported-by: Nick Xie <nick@khadas.com>
>> Closes: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/
>> Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
>> Tested-by: Nick Xie <nick@khadas.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> index 9d99ed2994df..62538fd9db6b 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> @@ -838,6 +838,10 @@ sd: mmc@fe08a000 {
>>   			clock-names = "core", "clkin0", "clkin1";
>>   			resets = <&reset RESET_SD_EMMC_B>;
>>   			status = "disabled";
>> +
>> +			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
>> +			assigned-clock-parents = <0>;
>
> In this case, assigned-clock-parents should be dropped.
>

Dunno why I thought that was always required. I'll fix it and the other
instances

> Neil
>
>> +			assigned-clock-rates = <24000000>;
>>   		};
>>     		emmc: mmc@fe08c000 {
>> 

-- 
Jerome

