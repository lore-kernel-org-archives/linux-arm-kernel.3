Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D43C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYR6737R9PdlNQuW82+z1wwa0+J91c+dkKgGkvTEGCQ=; b=O0BiIYABF24Mqaz9IroVuRMwVt
	1B5InLSdv9Z3fDRPO54Z99QCKoSyKsS6KAcWkCwkWp0z2Gk1Lm7K9XLpJCwI93oEG0Fk7fSrlsw2Q
	2BPBoUlRB+Z/dP+o60uDJwZigAPa3zGepwsniKmS/xhIJax5+o3ars94ZUD18mX15OdeTJjcHKMkq
	H0ag8jKJ5lwCXp4pj/bx5pJoAhLFdb0/U5vUCNieXorVFLKkOeOdHeiVJMHa7RUP7By0X8wcN1AAE
	E1p0vm35IDiO6ETSMpx1gh6E3KTFYOTqxmGTu4WHb8IVIY/2rkhIQvTMfIkuusrdbRYBW3iRNK0uS
	VW5ziuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Mpd-0000000Ch4G-0NVn;
	Thu, 17 Apr 2025 10:50:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MU3-0000000CdZU-0ZGj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 10:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744885718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYR6737R9PdlNQuW82+z1wwa0+J91c+dkKgGkvTEGCQ=;
	b=TQlOPR/xs+TguijojuLz5Az8eM3kFz2lFqQYN3MUBl6L/mJIPA0nGoaW7WMuxw/4CpeUNQ
	hT/Vi4hhK+kQyiTnmwGNEuwYbCOqLGcYTohxt5aSj7JrQgGi/4lHIjSnYRWw7Ky+c1sTFV
	v++ITD0rg2chCvT0mDMwSRuFRLhDztw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-h3RDteUDOl2bAS-I32PH4A-1; Thu, 17 Apr 2025 06:28:36 -0400
X-MC-Unique: h3RDteUDOl2bAS-I32PH4A-1
X-Mimecast-MFC-AGG-ID: h3RDteUDOl2bAS-I32PH4A_1744885716
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c548e16909so44874985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 03:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885716; x=1745490516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYR6737R9PdlNQuW82+z1wwa0+J91c+dkKgGkvTEGCQ=;
        b=DYiGu9UGP5kqy5qvFMb6XIL8F2kLt6Z/XwHj6zjpcya1+VTXUzLExSwBX8GG66lQOE
         s+o4BCzVxRIRE/OTiy9V4VG7Ey4cB2o5fwWr3HmGxgNub0Ye2Jur6yr3gKdsFCjsSgAD
         K/eh2E1na2RZGbzkx84mq1OU295GqLE7tU0VDSqieixXURAoH+f6LEu2rMjiZAjC1K3u
         EfB9nnrlHlGq5OSiJ62IGp9+eXc1vO5easOhdCha1QmVDIg+Cn1iwhbdBDhaSIz5JSmP
         E3hg0QXb2z9Er+EsmnCkI4rCqXr1ytqRfFFbSgcrljmO5tWbOVdgXfu9GA+2J0486sFO
         I6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhACBalRQDz9lJnBpB0SQRmNL5bXRNuXoBLe39UMfT3W6yu1QeIWv3l9h7xHTrCs/3AAHIgvTbB+0mViE1uB+E@lists.infradead.org
X-Gm-Message-State: AOJu0Yza56XJMRVx5G0ANmycmFJnESLq10g2TONHPU2RX7mbHKYgxae2
	Dj/6bz55dEKfNKILhcgZg4iIv3g8grdvSCaWGk242Wq5b5D6iqoa1rERud40e0bN8q/1QVAZO0X
	h+/fUdhnlmCJQ4jOPba4p5Im3Hc+8dEVhCO+QtiXgFNK7pSt+ehxP/nlmBCEupuzJLMDTf1UW
X-Gm-Gg: ASbGncssr9HhhAOO2h02jR69D66pDAtirK3CP9mXdgM+GufFlYrks8Yjn9mSCTmjk+T
	5LTrnQvZxNe1W3R2kqh7z303Rz8B/njrK49srbpso5uykL0Bi4gRSpMptzuHOVOTJ8iQHV4ZpZB
	4kEjqWqZcDSpE47vdHTaL5C/orqG4HuQ/fquEUacdH8fduBVCo32YwPjVC33/ILwI8p5UJxVmMh
	Z4BPSs5g5PxwIHwzT2AoExmaXxmJWivaTP4I4XRjvyz3WwRv6lKZBhny8GlcYce2ERzpaDxuNyA
	dmUOaoGklVwvBYqhJ+VPs66YFlDC8ygeq0xHYworYg==
X-Received: by 2002:a05:620a:454f:b0:7c5:602f:51fc with SMTP id af79cd13be357-7c91906563bmr852556785a.44.1744885715934;
        Thu, 17 Apr 2025 03:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqzTf66yKPKOlZDjn6KCEnTCMGlag6Vhw4gC6r0xHrSuqE8PUM4LdRh5W3NOMjL3tUjQDzgg==
X-Received: by 2002:a05:620a:454f:b0:7c5:602f:51fc with SMTP id af79cd13be357-7c91906563bmr852552185a.44.1744885715635;
        Thu, 17 Apr 2025 03:28:35 -0700 (PDT)
Received: from [192.168.88.253] (146-241-55-253.dyn.eolo.it. [146.241.55.253])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89424c1sm1168102885a.3.2025.04.17.03.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 03:28:35 -0700 (PDT)
Message-ID: <7c9ace30-a973-444c-ba9c-96272474a76d@redhat.com>
Date: Thu, 17 Apr 2025 12:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Tero Kristo <kristo@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <9d73f6ac-9fee-446b-b011-e664a7311eca@lunn.ch>
 <659d6affd7c58474c4bca5c92fc762925591d0d9.camel@ew.tq-group.com>
 <9e0e6365a2c0151c819e442775ece37353468d91.camel@ew.tq-group.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <9e0e6365a2c0151c819e442775ece37353468d91.camel@ew.tq-group.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BLuEzaBrzOWXyU_rOcjgG-TCum5qYSvpvcCRlr3nHto_1744885716
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_032839_252478_DCE745C2 
X-CRM114-Status: GOOD (  16.96  )
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

On 4/15/25 3:37 PM, Matthias Schiffer wrote:
> On Tue, 2025-04-15 at 15:36 +0200, Matthias Schiffer wrote:
>> On Tue, 2025-04-15 at 15:20 +0200, Andrew Lunn wrote:
>>>
>>>> +  **UNCOMMENTED_RGMII_MODE**
>>>> +    Historially, the RGMII PHY modes specified in Device Trees have been
>>>> +    used inconsistently, often referring to the usage of delays on the PHY
>>>> +    side rather than describing the board.
>>>> +
>>>> +    PHY modes "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock
>>>> +    signal to be delayed on the PCB; this unusual configuration should be
>>>> +    described in a comment. If they are not (meaning that the delay is realized
>>>> +    internally in the MAC or PHY), "rgmii-id" is the correct PHY mode.
>>>
>>> It is unclear to me how much ctx_has_comment() will return. Maybe
>>> include an example here of how it should look. I'm assuming:
>>>
>>> /* RGMII delays added via PCB traces */
>>> &enet2 {
>>>     phy-mode = "rgmii";
>>>     status = "okay";
>>>
>>> fails, but
>>>
>>> &enet2 {
>>>     /* RGMII delays added via PCB traces */
>>>     phy-mode = "rgmii";
>>>     status = "okay";
>>>
>>> passes?
>>
>> Yes, it works like that. I can't claim to fully understand the checkpatch code
>> handling comments, but I copied it from other similar checks and tested it on a
>> few test patches.
>>
>> One thing to note is that I implemented it as a CHK() and not a WARN() because
>> that's what is used for other comment checks like DATA_RACE - meaning it will
>> only trigger with --strict.
> 
> Oops, DATA_RACE is actually a WARN(). I must have copied it from some other
> comment check that uses CHK(). Let me know which you want me to use.

I think it's better if this will trigger on plain invocation, so that
there are more chances people are going to actually notice/correct the
thing before the actual submission.

Thanks,

Paolo


