Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF34D2ECFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 01:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrH9sDwa3QtPj5gSU1d7cy8zDFpQYEGB5vrm976c5QE=; b=3Ok5LM4CErP6Izxm0maoKfJasC
	j7iNyjFPms+O/xp5JRVcpXb7i7lBD696lKDGSZjXpVTb5RKNsbLV1tX2gesr43rUjU9KVPbAv75HP
	CMmMhkIYo+baTO3Mcgea1rnD+0kWPvgMMzgY61fbiBXgQ23xc/WpaYowW7OrpzboN3eXmhAXORQKd
	57/Il6snXjRXL54KIsDdR+TtycZUOZgG30mAP7GQoVrCgFbuEalkJkNGN20OSHl9QB3wn59WSi3As
	lCD/i0utLowo5qFyeTjct8RUHFxyqoeldRU3kAysuy468vJML0/83SQYbf/jwW4NoqRVQad+GoRO8
	QiI68l4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0dv-000000032hF-1Fkn;
	Tue, 20 Jan 2026 01:34:52 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0dt-000000032gu-3ArK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 01:34:50 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so3720851a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 17:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768872889; x=1769477689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrH9sDwa3QtPj5gSU1d7cy8zDFpQYEGB5vrm976c5QE=;
        b=Z8m8RkAvqZUAaj39x++bQ3jt5FJ8KwDlXxIyKsDKTWh9UFKG1j5YToMoCHuZZs24xt
         /Em1uH9oWi9qrGxz/ff7UCdV9gtAW9hZPaYMZ9YP8Fg1K9vHAZHVrx9n8SvKubEl8l3b
         8tOtZzbRh5ZcicTB2XclG7VTQKExAezQkZxojd3P8RZhA1CQloKAXwdlynzb4P7vBgbu
         jA1a81hPg1KFeckRcaYT+bayti73Yitf/jkPBzsjpwO5GJ4j8KgQx4XBhqyh0in98mE3
         LgMrc3u2LcfHPQjcX11hjsMP4RkEDBINHb4va7bIpJEcdzI89OHumKjsWWdl7yWcdoof
         3vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768872889; x=1769477689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrH9sDwa3QtPj5gSU1d7cy8zDFpQYEGB5vrm976c5QE=;
        b=roHHYDyYPmrVxzTbNUU+yi5mzsqT9wMSDNLlWnT4/Y0/i6twJxCxdsys+vUgMxTUqj
         W5l3wigulJFv9U2Qmdo6Ae0OtlkAlrVBSiQNztFDL7FYK6ApFRjbiOndFn+VdFYXDjKi
         fZG3CpmOKvRXB8DK+LWnt/hvhmq1CvxaqbiLAj5nFoR6Ftcp764Yi0jiLeslDwrA9kYx
         Ie2q5A2QJnwoUBZxA+FmIf1DZHMY6lvehB2EABvmogL/+BL8SvWEoZtq3WrUX7D6NBhK
         v7JGr1jM/8XTDe4wHvq+KBvuHCDQqCbkIN5jkAkV2soy/Cx3QAB/5sHRlEt4ICR2pid+
         9Ifw==
X-Forwarded-Encrypted: i=1; AJvYcCWXYBZSRel0kbgTwC6/r84tzht9y8/OgZTw4dBpYQzmVnEx4/3dJ12lnS7KbsTbBdz4ciGI7Qk2sm47kAeMbAiI@lists.infradead.org
X-Gm-Message-State: AOJu0YxbYuq+7Z8LLKPfdcr9VypewPtdo9mAgEAemTEFkuRXqc+1eaWy
	5KSoUKEj1DFlEMiAZ5+U1ZoSNdyTLExtITHemhcXov7XmQhhvpsJwGw0
X-Gm-Gg: AZuq6aKpB+zJcW4uIVT2gJ6aVH9woLvSH4jyQ4ed2Hk/5zdhdnwGMIPgfGQPmAHZaNh
	pYN1PynguhotiiHqIMUiVjrR9KFrAs8/4s7ZkQ0NG/84yILp6wGP2mKq5s3niOcdP6rK+kMP8kK
	GT1OTrHqYIGmAVTXc7hC1Nx4LPK6v5hYmaK+VRjtZ4PUrZlYCL6bIATB9KSHYQo4yr5MOYvBLIS
	/x59BJFeyodDll/AT8RrkpWA9fWs38TJueL9iZOC+abzJ/ksc43w7KOF4wa4gDnUX036oXbcy8c
	TIOvT1/RQb7VibhIn6Ipt8XJbkD1jB+JBtJQ3liRd0BBb/VQci9MLwSwIabNLFewd34u5c2jxhZ
	GTN3pK3PA7OOneF/HjTbc4CD8LQO0J37evoOn39+Y/djG3R3OPxDpwB56S/wTVp1dohEvEOKADF
	SiC7OwQDAWxiXEtj7fflMSCki/kjxoz5dLHTQ5eMXXd9d7rWBybIPyJvT+HufgxBmPTcfRoWx34
	ks=
X-Received: by 2002:a17:90a:c110:b0:336:9dcf:ed14 with SMTP id 98e67ed59e1d1-352c407a272mr335012a91.23.1768872888766;
        Mon, 19 Jan 2026 17:34:48 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ca9acsm12931529a91.1.2026.01.19.17.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 17:34:48 -0800 (PST)
Message-ID: <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
Date: Tue, 20 Jan 2026 09:34:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
 <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_173449_798287_8FE68E70 
X-CRM114-Status: GOOD (  16.05  )
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

Dear Andrew,

Thanks for the clarification.

In our design, the Ethernet PHYs are located on the base boards, not on 
the MA35D1 SOM.

The SOM base board routes two RGMII interfaces from the SOM to two 
external PHYs on the carrier board.

On the MA35D1 IoT board, there is no separate SOM and carrier board - it 
is a single integrated board.

I will update the DTS accordingly so that no PHY nodes appear in .dtsi.

Thanks!

Best regards,

Joey

Andrew Lunn 於 1/19/2026 11:22 PM 寫道:
> On Mon, Jan 19, 2026 at 03:33:40PM +0800, Joey Lu wrote:
>> Add GMAC nodes for our MA35D1 development boards:
>> two RGMII interfaces for SOM board, and one RGMII
>> and one RMII interface for IoT board.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
>>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
>>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++
> I'm somewhat confused with your naming here.
>
> A SoM generally needs a carrier board. So the SoM is described as a
> .dtsi file, which the carrier board .dts file can then include.
>
> Where are the PHYs? Sometimes the PHYs are on the SoM, sometimes they
> are on the carrier board. If they are not actually on the SoM, the
> PHYs should not be listed as part of the SoM.
>
>       Andrew

