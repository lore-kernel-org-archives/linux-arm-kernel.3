Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48647C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 18:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+rZXeg2h8FFJjzzSKXnu2tsAZmNScsbIa1AmfrMPH8=; b=EUyVLBCkBhT2nrk+cVi02NIDLq
	bNBgpCheWlQNtxCH6h03WWry0uo0Trr9bp3lpXA11TB54AvAjKc025SKhp97fgouVMa7tyeNgyed2
	jt7IVMuq1S8ajdranP7F0jflKzEE8np7VKpwLb5CJgHydgaf0iKgr0/FYtNscKeUONnHCtb2nPVEq
	s6udl+7ev2XU2Rj9lSQHQseH7Qvlq/8tafk3uQlyrygdVsuE+4yOimSqLkW/NXlx+56nXmuxmecbD
	GgjofNR6eZ/3mzzMtEwdMaY8deqCcaTFrLlomU93+Pn+PEX/TPBzSnAM9+PZfM1Zsc/vE78qgCwfv
	PQM89KBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLns2-00000005r62-2sFC;
	Sun, 01 Jun 2025 18:57:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLnpu-00000005quq-2FeX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 18:55:11 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6049431b409so6550142a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Jun 2025 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748804108; x=1749408908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+rZXeg2h8FFJjzzSKXnu2tsAZmNScsbIa1AmfrMPH8=;
        b=eGSfMR9S6zyQfejWgih3gtmHD3aHKu4uMpyoke0Wd/zuBmp9C+LZxtsccdwWvp2vEJ
         +0BkDUUDaelaG90UWQcbEii06XEOQd0WgucMVDLIpkJ9WYNatVr9xzbinGUQE858uG0h
         RFf3gark4tRXyU8vXVrrXBnI4TM7iC6SNC0Frl0ho4zFFH/3IGaNd7iRaLRx8Y7EbMVr
         5Z7BuWDjVbUgj2roGuUGhBsdsO2YadFQ/YtsT6R17Z3d0IUuJwWBDA6FCqibI+KFNZFf
         utAy+Gnm/BFjETXd9yjdUnwsLd/qAoH79JcYSvMKqO/j7J83BWgA8KWyNXIgOHj0tdCQ
         ABfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748804108; x=1749408908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+rZXeg2h8FFJjzzSKXnu2tsAZmNScsbIa1AmfrMPH8=;
        b=NB4+axU4Wt8P0TQkCUbUPx4vuSt5qEi/KItMaLE7d9nPCezCvhslG2DXqXzTwHPSFu
         ecMthICekd6dtNFK2uVsyKFyegLTrBDgmiejRWu1A5XijGlw4ZBUt3+3s2FIajk9vCFw
         khB7NON4y3ZsBKhU3ew9DLoULz3jp/2790iygXg9XNnki+F2kjFZmDwauGo23IQmD9Tf
         iMP3zqmKNvE5BellQL8Rt3pdJCYLw0LvTCXv+in0/GtzEtNJt+jtSg9T+/4bmz5Hk3wg
         ZSDfmLpUlgL4DYO50iFl3aZinNdCwpSNXyj0woydwfRTSvtclyeWS0Xi8X/3p2NQEhrB
         c/4w==
X-Forwarded-Encrypted: i=1; AJvYcCX6YcR4uTmOH49JegRmp8adjJXzil6pR1fYY20llPK2Qw18iCLLhpxsDAjdIj3M5ZUke9mm5B18dBaaevTVagmN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbr6tnW1gvWnx4A+iwIqDcJdf8JJSnLKClR0HAkkAY8IszZyxw
	O8mjgIPQsydYxSo3ie8+9iY7o8ke+hIFjSNFXxoJN2pvqBKkORy2SipN
X-Gm-Gg: ASbGncuDXbw1FIbLh3GkUoAezfJA0gVXlksr7N5F9p+rAou4uYm7t+5bhjDV44Aw9fT
	o7WUNegPHYc5QQlIagwdXXtA+w+taqWBfg1ZD7iyYr2iQYwlsGCXnQRo4gY8Dm9qsUzoWKR4fLL
	VME40DarBfT3c0BaRcaGfatg2E3R/jsMmfCxt0qRismE6IWdO3Oofyv/jQrpaCD5pAAmxG9RjGV
	+XJFi7j0472uXUp5LXsvFcSqyXKukNHLwzbUyRNs7qOD0ENmxX/BV6vy73byEwNKBHRhr6OUbx+
	4BSlUXlHJmxIhLbOGSljztyt5BREWcHl/BVR9zv++jdIUhSjqKswARY8RjlJGkDW3wkYGFV6BPc
	Lk0v5so3aGnFDchPr0+DStrcEEITYwQ==
X-Google-Smtp-Source: AGHT+IFp/ARVXyjA6tzOC4tGnmBvidx5QlpVw7FOMafdXAdEPbHMfgPxKJm7amG7iCl+8q+ttzGUoQ==
X-Received: by 2002:a17:907:7f93:b0:ad8:976e:533e with SMTP id a640c23a62f3a-adb494bd4demr514846066b.34.1748804107861;
        Sun, 01 Jun 2025 11:55:07 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fee1esm682786366b.25.2025.06.01.11.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 11:55:07 -0700 (PDT)
Message-ID: <c27311d7-8fa3-4ee2-a751-154517cf7d68@gmail.com>
Date: Sun, 1 Jun 2025 21:55:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/21] drivers/perf: apple_m1: Add Apple A8/A8X support
Content-Language: en-US
To: Nick Chan <towinchenmi@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
 <20250510-apple-cpmu-v7-9-bd505cb6c520@gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-9-bd505cb6c520@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_115510_583984_410B9C28 
X-CRM114-Status: GOOD (  12.03  )
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

On 5/10/25 18:10, Nick Chan wrote:
> Add support for the CPU PMU found on the Apple A8, A8X SoCs.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Tested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

>  drivers/perf/apple_m1_cpu_pmu.c | 124 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 124 insertions(+)
>
...
> +
>  static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
>  {
>  	cpu_pmu->name = "apple_icestorm_pmu";
> @@ -912,6 +1035,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
>  	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
>  	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
>  	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
> +	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
>  	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
>  	{ },
>  };
>


