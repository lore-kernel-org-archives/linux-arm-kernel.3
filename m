Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D84CD60D00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Dy+y/Sg7BxkuaJRt8lN8ekR1rY4pdHsedbh1qGx8MM=; b=FO9gYQwCd2s+smjh5WoCq1Jr4F
	Va/opt0lJ3hGTsDnfVuPsOw5g4ca2bjNtj/0FLBXfUcN4C/VgHfHvaUxyQAoW9LczSBXTywsWDrUs
	rPys5ToY+yERTxwNaaDOFZ4zzkVs4bT7Z+srugu0V4t1gfFesNKthCLdZpbKk0+CUpeI/tVYDCFgW
	Y679Gv85uyS5D0NxB9MZUf0gOqoW9qj90sDglbk9cDvHRUvozH8r2yWaFZUcDZ9HO06HjRZL5OmH+
	T+EqGRI6nBpslp1zODsItQ9Mz1QtqYaA2EhFQiQtLsE9R9GC+SaneXcShlzjSdvBsvk2ZL4uMLaE7
	wWxE/CMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCdD-0000000B05z-21Jz;
	Tue, 19 Nov 2024 01:02:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDCcH-0000000Azv7-4BTu;
	Tue, 19 Nov 2024 01:01:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so40325485e9.1;
        Mon, 18 Nov 2024 17:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731978076; x=1732582876; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Dy+y/Sg7BxkuaJRt8lN8ekR1rY4pdHsedbh1qGx8MM=;
        b=loEPPHnDpWTSz8YzMXu3m7+20lBcDu59cL7VnJCWv3mG+t8J3UVMbgAC8Jjzim4id4
         td6DhATlMybQndTC8DEQoEkxrceb0z/Rs6Db/361sf+Hf2fDAcAzrAmzT1M5QaAWOhAI
         R6Ch/czTQy5TtNNhP6jqLGN2oxla6wGDZHykfGdIHYnCrl+u7QWDVpOUyTDRba+x5AnE
         loWmUISOdDhwwUIkwpxPY1kWHx5juVLcrUWzFNUOdCvwUEvvueKVSKa+2r5SdVJwVcCV
         faIcCOrvvNMFKJBBQ/XtVhrDV2KlkXUIDcKbubECkZvi8Vr2oFZXOOnucQ93O/1kPt+4
         KeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731978076; x=1732582876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Dy+y/Sg7BxkuaJRt8lN8ekR1rY4pdHsedbh1qGx8MM=;
        b=PDNHG8yUq0d4DnU8HbaeXdBSQtcuLD1JvNMUkGGMp5UVVtLl1O7cdih9CUhhwihKaV
         gR6GEH37O2jfUQwX1I3Xx4js29Bq+kUfncsWLbX1myzdydjTYzSuL0Zgqy2uZ44IcBgh
         arJrHYcHFgc0vUBkEPM74URaCWR28skzj/CXTBu0j3OEZ9DnojOTOiKmhUGRhyOpL/Yj
         +I5/0OXUHgS5NkL/fbZIol4JKl7eskjdaO9Fr+Tp0jlnZ412lrY3nk2hAP4KeEpw+DGP
         YJKrrlERnB7tfcGsUJVOVgu7+aeQpvXEGXLjVgwOGk9/DzAiG4CZ9kWEXBvgmtMyIerF
         mX2g==
X-Forwarded-Encrypted: i=1; AJvYcCUyNXPkJEdm3Fwlvb3vkCi2jc2PXUWsJH9OjVHXOtnJ7ZI7Ev2uUo6rttlBwql6ZqplYB6coWUS6KBtrihw84E6@lists.infradead.org, AJvYcCWoKDBdhq7QaEkYqG4KTbjJ4UGjGPrwWqUqvy8ffoEw8CMcMi5Uv8HjfhKsYct6ifuktwFDmTKQ6Nt4vEhrRgc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk2nrgTNvsq0BzM/hL4R80OpxJRL637r9k05T9Oycuuy0ACoY5
	HuSayM8ogjxTG7na/d3hsnxR5I1AJJp/LksXgIyX+vVoNcHFuMPu
X-Google-Smtp-Source: AGHT+IEizM8QYmdo4n+yxWV+vTQ5NKdtCjht1TWjEzKwHsEwScR3M5pGs6mWJKIG4P+ZrrDw5YPuqw==
X-Received: by 2002:a05:600c:190c:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-432df798ea0mr108474025e9.33.1731978075857;
        Mon, 18 Nov 2024 17:01:15 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab76dafsm172723215e9.10.2024.11.18.17.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 17:01:14 -0800 (PST)
Message-ID: <7e5e2bda-e80d-46ec-816a-613c5808222e@gmail.com>
Date: Tue, 19 Nov 2024 03:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v2] [PATCH net-next v2] net: wwan: t7xx: Change
 PM_AUTOSUSPEND_MS to 5000
To: Jakub Kicinski <kuba@kernel.org>
Cc: wojackbb@gmail.com, netdev@vger.kernel.org,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com
References: <20241114102002.481081-1-wojackbb@gmail.com>
 <6835fde6-0863-49e8-90e8-be88e86ef346@gmail.com>
 <20241115152153.5678682f@kernel.org>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241115152153.5678682f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_170118_038333_EB123877 
X-CRM114-Status: GOOD (  13.39  )
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

On 16.11.2024 01:21, Jakub Kicinski wrote:
> On Thu, 14 Nov 2024 20:54:20 +0200 Sergey Ryazanov wrote:
>>> We tested Fibocom FM350 and our products using the t7xx and they all
>>> benefited from this.
>>
>> Possible negative outcomes for data transmission still need
>> clarification. Let me repeat it here.
>>
>> On 06.11.2024 13:10, 吳逼逼 wrote:
>>> Receiving or sending data will cause PCIE to change D3 Cold to D0 state.
>>
>> Am I understand it correctly that receiving IP packets on downlink will
>> cause PCIe link re-activation?
>>
>>
>> I am concerned about a TCP connection that can be idle for a long period
>> of time. For example, an established SSH connection can stay idle for
>> minutes. If I connected to a server and execute something like this:
>>
>> user@host$ sleep 20 && echo "Done"
>>
>> Will I eventually see the "Done" message or will the autosuspended modem
>> effectively block any incoming traffic? And how long does it take for
>> the modem to wake up and deliver a downlink packet to the host? Have you
>> measured StDev change?
> 
> He's decreasing the sleep timer from 20 to 5 sec, both of which
> are very high for networking, anyway. You appear to be questioning
> autosuspend itself but it seems to have been added 2 years ago already.
> 
> What am I missing?

Some possible funny side-effect of sleeping with this chipset. Like 
loosing network connection and dropping TCP sessions. I hope that 20 
seconds was putted on purpose.

Suddenly, I don't have this modem at hand and want to be sure that we 
are not going to receive a stream of bug reports.

--
Sergey

