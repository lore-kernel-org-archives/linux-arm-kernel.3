Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38332C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LnLWJUsAr+JAkpxUkcXadAzf96B3tnYqEVcIVAbTvg=; b=VzttQ4SbCyk/gMt0zWO01i1ZWD
	U583qMA5iSIzD8R0EjE1uYg2dBSFyNYmk8kjJWkJl04MCx0+zEKgfQOTw7PTjJeyXffwIFCIzOH0O
	zoBfII/nveWITGjRU9sSpoYzQ/3xQkt1Sxx71vcubGjG07sd5uI8PRpsZiN3VPz71TG3SyEKHAvU0
	lbh0fdlJeikmupngaAnrkLb+ZnXA9LA3BeO/AnBQCZ95zmEKjJU+ideUWw11x937g8yCKrzlq7c5Y
	dY6FBQZK7UTwHjKuUgKPcE/QKp5aNo738vp0qRN4m6sif/dy8RkNOHqsd8atzGmbplrvpoLrC4JPi
	w/3hIBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtb2-00000000Brp-2gVm;
	Mon, 21 Jul 2025 16:42:36 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrCm-0000000HT2W-3ATo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:09:26 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73e88bc3728so477373a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753106964; x=1753711764; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+LnLWJUsAr+JAkpxUkcXadAzf96B3tnYqEVcIVAbTvg=;
        b=fUtac6v6OPZKO7xu1UTTftCGuYZs/cbFJY5xh3n1We7wQVQgefjP3LyOmHaWXZRX4V
         J9UYsLSuHCPRDwMBP8YvRmf/IhEeaIC2PHBHhUewIh9T0hsAHMluPAbrhzVSOV1jyzWM
         1OzNtJ5PixHeNVN73lT8EXbQd8yNFRbqmiRam3tXxJa8pf91ZmQN3Ca1eFVQ/4TJJVwP
         Zeilv3Gam05+8+h2oCc9KhdxibCaM77LscUMszS0XMONtD6obV6RDRSyjSgWsdTQJlE+
         9WOg09c4nFJ/H4RyAvCwZOB5/x/yUCsmc03vEyG7aJAKOxKUhR7UCkC6hQr6zK40RnIg
         KqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753106964; x=1753711764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LnLWJUsAr+JAkpxUkcXadAzf96B3tnYqEVcIVAbTvg=;
        b=EqvtQhngSEefYngZuMXhVDGnC1fcXQRIm26lXhRWDrFACWMWXkyWssGs2JbD4/UD0w
         uY1P1A3v0PR1x7cVoVnd3Joxfi7VhP70OyU3xtAwHvx59/1Xrfg1GvRG6yzZRSnNq94U
         pJM/Iur7fLIlcB5uSffz+CmeDvRTiV8rDTiewIxSP2tO/JYwQjaHlROWFbr3yudWJ35X
         dMplVTOFnQRGyu/MxsMqRDf8FCHlAv4j+S1K3N0dpdHflRHZKD67Ggg3oVdI+Qp4d3WD
         rBhumVL9Zlk66tLFAqYL8P0ELCtMafc8fdG27tS1mhcDxk7vsOapJ6sZv9ajDSNJtstQ
         T6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXxXngO9x6q/SZg3h/yrPoDjqqWfRBHf3c7BxLiqprVW0JY4BrLGFkPs0DIX8P4bBstxtIWZHsVrnqmIaS1pT/H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3mvl9Bls3X3immIXiErNBb+Gn4V3K6TBpQUQL2cywMBouxpMf
	gNfcAcpyhizcNQcsQ30vYNczKI1L9cho2uaw7l7Q16mv7cG2+fVH42Cl9bLdSB1lSuQ=
X-Gm-Gg: ASbGncvPR4L/WZ0xoVBxV5DcTWhImkdQHS+xZsXEnkFu5nGGMbCuT84mHOhRcTg8LBn
	xE07zSTGMYsGdY3/mjlZ5sPBimK4nCfJxuvmPhOm33yDH5tR2LazBSJJfImVFQ8b7ENGhAqf43N
	rTrZI8oIPhoJ974hvrmVlcNe5ilJxHVTr5aoMFWV0ecF5kGJPRG+Fh5v53coJuf8AuUXIMhy4qu
	BiDirGVhQdICgWJApqULtpJHVaoEK1WsSmwFGD1MBGN/77eLp6XAsVu9BkbkrQBskv/5EgMknLN
	5RfshNpa9r8wD8fs/xCb6/MG6mZEccVdXYmIpgWIzomn3QO9zRZdfWJdd39g4+3uw1qrevW972A
	fsEePVk+Yb653HgrFuoRXcCI1GZyaCbB+C5lT1GVExv+yscEbYYtcwMtAmCRc2DJbdEhsq8Psie
	8=
X-Google-Smtp-Source: AGHT+IEYJ69qw8hWrbyhfCDdoYCGwahdtxo+pfFxwMph5mSmiJShT9DMVnokAtIY6hWFVoiT1iMVrw==
X-Received: by 2002:a05:6830:3e8b:b0:735:af51:5ea5 with SMTP id 46e09a7af769-73e665b9181mr11113510a34.22.1753106963677;
        Mon, 21 Jul 2025 07:09:23 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3bea:f296:60f2:c6cb? ([2600:8803:e7e4:1d00:3bea:f296:60f2:c6cb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e83bf667fsm2820418a34.65.2025.07.21.07.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 07:09:23 -0700 (PDT)
Message-ID: <35eba285-2c49-49ac-9da2-29636e257196@baylibre.com>
Date: Mon, 21 Jul 2025 09:09:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: Sanjay Suthar <sanjaysuthar661996@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
References: <CADU64hCr7mshqfBRE2Wp8zf4BHBdJoLLH=VJt2MrHeR+zHOV4w@mail.gmail.com>
 <20250720182627.39384-1-sanjaysuthar661996@gmail.com>
 <84ad0f66-311e-4560-870d-851852c6f902@baylibre.com>
 <9574826f-3023-4fe1-9346-eacd70990d73@kernel.org>
 <CADU64hDZeyaCpHXBmSG1rtHjpxmjejT7asK9oGBUMF55eYeh4w@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CADU64hDZeyaCpHXBmSG1rtHjpxmjejT7asK9oGBUMF55eYeh4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_070924_900983_281D26FB 
X-CRM114-Status: GOOD (  17.83  )
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

On 7/21/25 5:15 AM, Sanjay Suthar wrote:
> On Mon, Jul 21, 2025 at 12:22 PM Krzysztof Kozlowski <krzk@kernel.org <mailto:krzk@kernel.org>> wrote:
>>
>> On 20/07/2025 21:30, David Lechner wrote:
>> >>    - Ricardo Ribalda Delgado <ricardo@ribalda.com <mailto:ricardo@ribalda.com>>
>> >> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> >> index 0cd78d71768c..5c91716d1f21 100644
>> >> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> >> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> >> @@ -149,7 +149,7 @@ properties:
>> >>        - description:
>> >>            The first register range should be the one of the DWMAC controller
>> >>        - description:
>> >> -          The second range is is for the Amlogic specific configuration
>> >> +          The second range is for the Amlogic specific configuration
>> >>            (for example the PRG_ETHERNET register range on Meson8b and newer)
>> >>
>> >>    interrupts:
>> >
>> > I would be tempted to split this into two patches. It's a bit odd to have
>>
>>
>> No, it's a churn to split this into more than one patch.
>>
> 
> Thanks for the reply. Since there are suggestions on patch split as it is touching different subsystems, still not clear if I should split the patch or single patch is fine. I would appreciate if you can guide on the next steps to be taken
> 
> Best Regards,
> Sanjay Suthar

Krzysztof is one of the devicetree maintainers and I am not, so you
should do what Krzysztof says - leave it as one patch. :-)

