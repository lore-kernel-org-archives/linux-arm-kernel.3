Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A99C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHkwFuq4eT24IZKsGZMTukEgMJ+/mZ79J1QjtwQxKwE=; b=lHV2oewA9l53ohOUnEpFMHheMz
	sWk+srfjINxjO7wP3z1OQCjU1J5OsYYSpWom8hEoOFQZAIa93s12/yFMzlgAF43xu8wfvCwCgunqg
	CvpY83xViXAsX2FP8oJVr1nKhHPlSJVy1eHD7xUoteRPfv4UTxcosCyvt58iPDwtxNZSntTyQfVV1
	K7X8h6dFvmjF7Sc0vuUmOf3ZUKFp1fPGdJWrA/n1HP67SCLc+w1LWBgkXXcr67Nhn5KiP5WWfkjH3
	P7ZNcpk23fQt9wulNmIrrhD8zMxZVWtl4OD2Owx1Y2NWW0p53PzZ1jCascxFQE/qLLKtoRQ09FU+a
	7ByrD2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYeVW-00000001S6w-2QCN;
	Mon, 07 Jul 2025 05:35:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYeSB-00000001Rfd-2tbj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 05:31:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45362642f3bso2955055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 22:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751866306; x=1752471106; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YHkwFuq4eT24IZKsGZMTukEgMJ+/mZ79J1QjtwQxKwE=;
        b=W96fX9+OX0fDQwG0RCuRhyrjUvDZ83wkJaYVak3Fx5sMbDvNFXepFTyw9aFzyQpfuz
         i3oMGggCq73GJpho5z6iWSNqMYiLsRBGv/hLEmrN5tjH13/gcsBx9A2S/slgKJphT3FO
         hb/xQNjMEXct1FEr8Om7W/+I6pXa4KVSuC6nJxO/q+VYYEB0qkt8IXCJ1NeRdVUIEqh0
         bx4BQI1usdzP73uAWj1LaDkLNAZRc7DrfgKOhIPCnhROiYbPNlW/UjZBUuEZ0mviyy+L
         D8ph2wzj7wtOzUirq8jRPd1En1LJJPu6EmeoyEq4EyvLU3qQzpqifkE3KezBa8yjhDbd
         ghBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751866306; x=1752471106;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHkwFuq4eT24IZKsGZMTukEgMJ+/mZ79J1QjtwQxKwE=;
        b=SPoXF9TdML4UCzPVTZ9xa0uz8dawXJuEr59U235cOzZGBgit9PcgiLP+38oRgejZmH
         mSM7JcC8iGTaX3E6nPCcaIOGdMxllfKwh5lXfivcti0hSQGMSfIKWvohuky9d8fXyB7S
         X31Dq3KXQyOewVlc/qQ4zlu0IafV+uyJrBm/eD+iFOgkNUsGFZjlWMxeWxDEP6asthEt
         ozUZ90tbcp+Jskahhf0E9WzFframanjpm+tPyeLPeDacT+u/8XOaAKafz2nc88FB9czr
         LLTmPqTzrenL0drpPQae4Jau/NHynhBHOMgKwTqEzFnnC0JGnNv2HB3X8C0wfuhBjzSZ
         0LwA==
X-Forwarded-Encrypted: i=1; AJvYcCUgk1XV4Qna0DWg77oeYkrBfTDDooISRnWqL7+FXhTYTPak85sav5WJQO54p1FIfkIkQBaQWSmcJ9Nx4w1xHHRr@lists.infradead.org
X-Gm-Message-State: AOJu0YyMEilv3dESpz8+6qfiy7u7ZdQ9sfZ9rth1r3kRS5QuV+qqScqp
	kNDRihyjNxvhDeLZ6nN89hkziO+M4ej/73fv4n+lKa2AJlhJaN7X+nMnLr+Kh5LhdeY=
X-Gm-Gg: ASbGnctnQD2JeZLCIu+I+yeocYcYBPN9WrXA4UBnTYIDIJruUvVN+3Z+oo2T+/JSE/n
	yYMxuCkY3Vb4hoMDsg0FXe3jzWSQoKrbNnw2JSocCP0gGdMbTgOzyIh4kJwZiyvo3UA4Hut0nlp
	Rs5w++i4H9ZmYw8++G+GYj4ayPEULzUkA+kdX6MZPVkVzSqUdeY0gXdlVjYX/zMIXRllF1AzzAc
	dwJbnlmS3g0S1mdhWGvDf/k0bt0MFfK5Y/2NBIQINGp/tfbbSK+w+3xIdWiCounIgZn3DtAVKYF
	WglAA++6X3hI8r5cilBmtsTn7b9zE4IkHYdoUxl9l3HjLHiJHKd2HmXDsA71la3sW946KNet8X+
	DELjnu7xNWaK0r5MB
X-Google-Smtp-Source: AGHT+IHWz4nTVgOZn/wog9WT6y1vGam4GDDDJ+oOq6abzjfnj6Sf5pBAfZzakmR3QWvc0RfE54Czwg==
X-Received: by 2002:a05:6000:3111:b0:3a5:2d42:aa1e with SMTP id ffacd0b85a97d-3b49661d4bemr3409666f8f.15.1751866306036;
        Sun, 06 Jul 2025 22:31:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0ae0sm9259121f8f.33.2025.07.06.22.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 22:31:45 -0700 (PDT)
Message-ID: <56f73f55-092e-44f0-84b3-b7e0f1590453@linaro.org>
Date: Mon, 7 Jul 2025 07:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: sunxi: Combine board variants into
 enums
To: wens@csie.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas.schmid@netcube.li
References: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
 <CAGb2v65XF=A5Qrm8FrLQaZXLLs5T-0osBLP3Fz3UabrTi5xUXQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAGb2v65XF=A5Qrm8FrLQaZXLLs5T-0osBLP3Fz3UabrTi5xUXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_223147_742152_67410690 
X-CRM114-Status: GOOD (  13.06  )
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

On 06/07/2025 15:17, Chen-Yu Tsai wrote:
> On Sun, Jul 6, 2025 at 5:58 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> The common style in all bindings for enumerating similar variants is to
>> use 'enum', not 'oneOf', so all boards of same variant or using same SoM
>> should be grouped under enum.  It is more readable, more compact and
>> makes easier to find actual devices from the same family/type.  Also
>> there is completely no point to repeat the compatible in the description
>> (incircuit,icnova-a20-adb4006 implies this is "ICnova A20 ADB4006" and
>> pine64,pinephone-1.2 implies "Pine64 PinePhone (1.2)").
>>
>> Combine two easily visible cases: ICnova A20 and Pine64 PinePhone.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> I can take it through the sunxi tree if you prefer. We do have new
> boards coming in this cycle, but I don't think there is any overlap
> in the board binding file.


Please take it via sunxi tree. This belongs to sunxi SoC.

Best regards,
Krzysztof

