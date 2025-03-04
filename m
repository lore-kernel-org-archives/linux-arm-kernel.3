Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718F3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aul07l9GfhwCjHtjGDfD/NfsZREfo2EqSgSJg3nuUF8=; b=0LMgt9+XfUGrFaVnYAN5BHsVoq
	vGojEIDcjXa/+809ktYYF9Zqm2UxfqONy2u7xpa/ggRQ9OxCpq1hQBNtj49wjbp9PjuDBKopNvaH9
	gpHSY3ZcEfx+/6MOblfddkCN5XVFnsrZCaVI/jQ81tYaP+y8DEodllfdG1kFe927LzEw7u2G8HGVq
	1G4lDqxQel5s2LOqLhom09BqWLWFe3ArLtpBjpjnbWmHyDB/K/VDYVtr8HeC7OFqRhfnlOOpLDPU3
	SkcfbJfF4k6tPzd7cU3yWM3ESqlznmG7QixBte2MFSzrWqXBnLKjy+lx5em9L9BQeNvGG8pbm7Ng9
	lX3OkcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa0O-00000006JpT-37yb;
	Tue, 04 Mar 2025 21:40:48 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZvp-00000006JGh-1Pvy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 21:36:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso8292839a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 13:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741124163; x=1741728963; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aul07l9GfhwCjHtjGDfD/NfsZREfo2EqSgSJg3nuUF8=;
        b=hgPe8g1MU9ZhZwNmfcaTcA43KRHOBxUCcnNEb7YBI5PjMbu3A6ligl9Rpop2RdYGCy
         8DmohwyV169ehJKuu6iql4ddIXkL1jHCOAoWLehEvd5wy6fAuMNpjqSjKG28KO5Bm/OR
         08/RvxQyrTeC3Nf5nHlXbqNvgvj70sViWyVvYOA4tGtLsV2w8hRaVHz3WRImrNo6vhzf
         0SL3wDYE/XWS0v3HKjgbF7rjWt5jLvvP1iObEoUCOjP0eH9+9FyfpG+Mub0MVfzNP3sd
         mLTEpU6+pQ6UAeLil3df0WOXRyrBvhDRysTBxtwlqSXlK36rjRLmfnNcgR7Ek//fe2Ed
         40wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741124163; x=1741728963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aul07l9GfhwCjHtjGDfD/NfsZREfo2EqSgSJg3nuUF8=;
        b=kgqAiYLLbEptjvBqILpvMIOxJwWiAVkCa/8nla7/N0QW5Za++XC6Zw9N3X3/Paoiav
         WQbqa7GiX/NsMRN+E16SADI0QGkocr2gIW+GnnY2EcNJd6lTJHxepi4RTiyHi+djFc14
         o8lN8ZkE0x4yUD2tLq86AE3ISZBYb1ckJbIu93HhdByZRAjxOYia2YEx2dhEBVeoibnV
         P226FubdcMV1dHMEKe7gGsqKAZRsjfp23dPjBaciULFsFETrfEn+9/b6nH2i9ksRjgtd
         0r/WsQ6R1zna6N9Mn1iQi5Uf/UePXDtFT9wm4kilndzTnuYLQGdrG33W5XmUHrWs/GUI
         KSqg==
X-Forwarded-Encrypted: i=1; AJvYcCWme4khOtui2mQdDMtSlxx2k9pG85S7KqNc5jsz97FOR0VkpY4LYxoxtQYb9fhnzcGTqomFRQWJsiRDtctP9MEU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkh9R9IRHFy5q9edJtLI9FGwDdU1Ypfrh6zCTyEG2d0Hi90rWp
	eaS6/z5M8th1+7HsotTGD9TiAhREZ9+W6PR9tSSq3tEiaXJeP5Sx
X-Gm-Gg: ASbGncu6payOVS/hj6yHHW7xTmh2EPW1BabepbNoLHAFYevp4klU3es2Xgagpk6Dsep
	CIImu7Mx0taXKs56C4dKOPLhkMmZKdCrFGTCNOSUTIpp8iLxGRbpGpMWSIj9fWzM5i8eycueByG
	bDrx2tho6yLb9XAipn5YpzYiiTiEYwe1papmu4tTcCvN37FXyhuHvoS4b5ahCO5WiLsPRJCjxh/
	6kjnApd2spV882yOEWplfilaNTlOv+bhzkPFQuFdExyzSwMvotesj76gmbOw/X3f61bIENtF/M1
	vgLWwrPFjiHdShr6Ak+D67+8cVnEyAcz06mFhFoal2H/jAz172BKf9JEJm45GSTt5t5HqJ1L6Q=
	=
X-Google-Smtp-Source: AGHT+IHs7d8BBwbkw8DJDPW9i5mIaZ+Eha2Wmv+f6E90nzjq8XUloML3x2a6rJ4eSQ3DcQCiw+551Q==
X-Received: by 2002:a05:6402:1e93:b0:5e4:9348:72c3 with SMTP id 4fb4d7f45d1cf-5e59f384ad5mr490926a12.10.1741124163230;
        Tue, 04 Mar 2025 13:36:03 -0800 (PST)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bc8800sm8943647a12.48.2025.03.04.13.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 13:36:02 -0800 (PST)
Message-ID: <88584d8f-e1cd-4b56-8906-461e1e6d9cc9@gmail.com>
Date: Tue, 4 Mar 2025 23:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-2-laurentiumihalcea111@gmail.com>
 <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
 <CAEnQRZBeQdnC+K92+Udb5awTmom10YHHNt7Ld-pYK4A1i8sr3Q@mail.gmail.com>
 <d66996eb-f49b-448b-9743-d19a3c3eba52@sirena.org.uk>
 <e45411df-1b8b-4f21-878d-d52e1112e62d@gmail.com>
 <20250213064724.kbmxsk5szpxwclj6@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250213064724.kbmxsk5szpxwclj6@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_133605_376849_EA7C7BA5 
X-CRM114-Status: GOOD (  29.88  )
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



On 2/13/2025 8:47 AM, Marco Felsch wrote:
> Hi Laurentiu, Daniel,
>
> On 25-02-12, Laurentiu Mihalcea wrote:
>> On 2/12/2025 2:38 PM, Mark Brown wrote:
>>> On Wed, Feb 12, 2025 at 12:11:49PM +0200, Daniel Baluta wrote:
>>>> On Wed, Feb 12, 2025 at 11:38 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>>>>> On 25-02-11, Laurentiu Mihalcea wrote:
>>>>>> +    const: fsl,imx95-cm7-sof
>>>>> Albeit Krzysztof already add his Reviewed-by, can I ask why we need to
>>>>> add the -sof suffix instead of -audio or so? SOF is a software project
>>>>> but you can clearly run different software on the audio-copro as well.
>>>> Sure you can run a different software project on the audio DSP but
>>>> you will need a way to distinguish between the different projects.
>>>> There might be different mailbox, memory configurations. So you will  need
>>>> to invent another suffix specific to the new project.
>>>> We can make  const: fsl,imx95-cm7-audio as the one used with SOF
>>>> and think about a different name later for when another project will
>>>> want to use the DSP.
>>> I think the point here was that the DT should stay the same even if the
>>> DSP firwmare changes, just as how changing the main OS shouldn't affect
>>> the DT.
>> It's rather unfortunate but based on the experience from the 8 series
>> (imx8qm, imx8qxp, imx8mp), the programming model can differ quite
>> a bit (e.g: remoteproc vs SOF) even if the core is the same (i.e: DSP core).
>>
>> The different programming models also required different DT configurations
>> (e.g: dif. mboxes as Daniel mentioned, some extra properties (i.e: reg-names), etc...)
>>
>> The "-sof" suffix was chosen here instead of the more generic "-audio" (or whatever else
>> alternative) because the DT configuration is specific to SOF's programming model. Other
>> audio applications running on the same core may have dif. configurations (e.g: use
>> DTCM/ITCM for memory instead of DDR, dif. mbox count, etc...). I suppose this kind of thing
>> is bound to happen to some degree since the DT node doesn't just describe the CM7 core
>> (but, rather, it also encompasses information on the memory, mboxes, etc. used)
>> but perhaps I'm wrong?
> Time will tell if there will be any other user except for SOF for the
> DSP but and this is what I wanted to point out: the DTS should abstract
> the HW. IMHO The CM7-Audio node should contain all properties required
> to turn power and reset the core (e.g. clocks, reset, pm-domains). I get
> your point regarding different configs but please have a look at
> mt8183-kukui.dtsi. Here the rpmsg config is a subnode of the actual
> system-control-proc. This makes much more sense to me since the HW part
> is part of the generic core-node and all the software config goes into a
> separate subnode.
>
> Regards,
>   Marco

I understand your point but we're dealing with 2 different programming
models here: SOF and remoteproc as opposed to just remoteproc as it's
the case for Mediatek.

Going for a similar approach would also mean quite a bit of software
changes as we'd need to factor out the common bits (most importantly here:
core operations like start/stop) and placing them in a common driver. This is not
trivial and I'm not sure it's worth the effort right now given that:

    1) The current way we model the hardware inside the DT is not exactly inaccurate.
    The core does physically use those memory regions, mailboxes, etc.

    2) Whatever we do, the information in the DT will still depend on the programming model.
    It's just that you're placing it in a child node, instead of the parent, which is arguably not that
    big of an improvement?

