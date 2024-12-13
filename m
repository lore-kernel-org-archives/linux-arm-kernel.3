Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07E4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4P5h27YPOkyA+5/aC4d0mYq670kQsIu4WEG26jSUHQ=; b=DIW7b4B5hCFUG7S9XDbenZdNt2
	205vMCyD0P1+VRQmJdpkafzgHjMBX/YcqkiNfxwhVZiLgOL+rEZKTlMnwxjbvG5LSDdNhSfzkksTF
	0spJ8ydVs/m0Kk5y+wzlIaQJlWQlDWH4rWNJ92M4LJ/xV9nvBscmUrM+5Zqsp2ASI5mbf1BKqhN7K
	hiqWBK0ROm9d1szBOomj8MP6Pk0dqcTDlDnPejj9Hjl2djr3tjQW/RzFrjv7x3VVJJmxUPgWkZ9uN
	alqGXO1aOsFOBkWB0xW0ebxL95VuQwqgQWtSd7+G57fniSygS60UgyYlHP4+v14ue4hZwz5pJR7O6
	mw9VSYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9Ab-00000004WYS-22p6;
	Fri, 13 Dec 2024 17:09:41 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM99W-00000004WNE-3d4l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 17:08:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-725ea1e19f0so1775221b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 09:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734109713; x=1734714513; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=S4P5h27YPOkyA+5/aC4d0mYq670kQsIu4WEG26jSUHQ=;
        b=csmbEznmmY4tPucDHPBgA9lYXOQ+xsGa/jvWJJ8G0yWHQhKxcpCMsJPhSIE/3pRZMd
         qMEUPHRqVZqBCItUi+DvXvvpzG5X7WBExXOf/hWzKDxnQfmNRq/WDayI+Y6Lsru4KEHF
         cQs12hMlgbwtEgc8SX80z7TOvuqCUDY8+p+iNWdHIGE0lzRRSZPiHr16FDSUQqk/TvdS
         Blj7NHlkoGFJw83lW38GaSZBWhnMWhH/lKIN6eq5NfJUjFGJw6i0/hwcZE+bG55Zi06Z
         RUa7BYjNJPFVtHEVun9atkMPcwe8obEdq2LntTksYHaCpFhix1kOx/7eMopBSu1z4ao7
         XoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734109713; x=1734714513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4P5h27YPOkyA+5/aC4d0mYq670kQsIu4WEG26jSUHQ=;
        b=RTKk22PaHgxw4R1PpqxyGFkQNtesIH8K/XhYL2r5aSk2nrifXZqYTMIE5YDOh9xGcJ
         nOYcmBb0yWKTUZM4/xiLMG7JM2/XzIxJ4hL+jDoeSaz5IK7pJmDfSnAMssZEwUTSOCtV
         Z0/BpAGrClAIgKzU29agTnjobjXAShmf2Ev8u0SdHe+bVrAXHrDwedwwd7zgEOAINFZ/
         Ti+7xdbCZn2w2UcbifrYwoNFZHXLiCZPmKTy57M4MsmWW/fupl+vpkFthZDXFaOBnUkc
         KQtTHBpe4ACiiR6Sm1R4hv6NtHQVp2wkAzxyGVTLWRjUPJSLh8hUpqZ47NCx8cxvHFSt
         fWow==
X-Forwarded-Encrypted: i=1; AJvYcCXxD3+Vymn5TodUSs2Le5URgxlB6lzyF4Ljze6qeWG8HkKkprOmpVh2v0rs8SvhXYGED+TveB4E6/li+M8qDvZh@lists.infradead.org
X-Gm-Message-State: AOJu0YxuIQ4MZ7T8epTl+NGXsOXGyBlIF8ptfqB1Ep8GSKW9sLFYM4+k
	j/Vrx/Bav6SLCcK3kcUVY+fLcWePKIpcdlWpbBoe2C2BjIthTmWA
X-Gm-Gg: ASbGncuC2aoYPYocKRM6liRzOhAmhGDJr8uRMxzPkOgV0LUIjjrMvCQbMeCIIzUlQ6A
	V+2pyxdbrXUY0Lu3wJoqG9O8P34cMvO3jbChn9o6u4qpXngsmQpa6kBymvP7/EtN3SVuKBnwpho
	6A7v2kh/uM/o5yxrta1GTGrt7pXDbxKS8ome5tAcdG41/6pfc9tc9492GKHX4gM1qsetXuGc+6/
	nw8zOJz3CxKgOC4x+OSIhhFls+qhr1uAzOIY0wM3X329wxaNl8ge2iUh3BmqNpGY8ilYgxJfrj8
	4orT7ccYCP7SjpfL21zz+ARL4Ew1IQ==
X-Google-Smtp-Source: AGHT+IFNl1jFRcUys8+E1szg3JT/tH8apnoiFfDfmvVVa4TzEpKSuj2z6i8x4YQXRdjMljGMn4gdeA==
X-Received: by 2002:aa7:8b4e:0:b0:729:c7b:9385 with SMTP id d2e1a72fcca58-7290c7b9577mr4155847b3a.6.1734109713452;
        Fri, 13 Dec 2024 09:08:33 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ac5380sm13611b3a.5.2024.12.13.09.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 09:08:32 -0800 (PST)
Message-ID: <2713e85d-f88a-49d6-8221-151e8631758c@roeck-us.net>
Date: Fri, 13 Dec 2024 09:08:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] hwmon: pmbus-core: Add label for fan and temp
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
 corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
 Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org, peteryin.openbmc@gmail.com,
 noahwang.wang@outlook.com, naresh.solanki@9elements.com, lukas@wunner.de,
 jbrunet@baylibre.com, patrick.rudolph@9elements.com,
 gregkh@linuxfoundation.org, peterz@infradead.org, pbiel7@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
 <20241212214927.3586509-2-ninad@linux.ibm.com>
 <f9d881b7-7301-476e-b281-0380dfcf0e10@roeck-us.net>
 <c7717f89-65cc-4668-a3e0-ee042cdcd426@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c7717f89-65cc-4668-a3e0-ee042cdcd426@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_090834_909516_9150DFAF 
X-CRM114-Status: GOOD (  16.40  )
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

On 12/13/24 08:12, Ninad Palsule wrote:
> Hello Guenter,
> 
> On 12/12/24 16:06, Guenter Roeck wrote:
>> On 12/12/24 13:49, Ninad Palsule wrote:
>>> Adding label files for fan and temperature sensors in the power supply.
>>> The openbmc application dbus-sensor(psusensor) requires those files to
>>> consfigure those sensors.
>>> Note that prefix for temp label is temp[A..C] used instead of temp[1..3]
>>> as dbus-sensor(psusensor) application calculate index based on last
>>> digit in the name so we do not want to make index double digit after
>>> appending page index.
>>>
>>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>
>> We are not going to fix userspace problems in the kernel.
>>
>> Guenter
>>
> 
> Thanks for the quick review.
> 
> Sorry I am not clear on this. I feel that it is better to support labels for temperature
> 
> sensors and fans like other. Are you saying we should not support these labels or
> 
> I need update in the patch to support them better?
> 

There should be no such labels. Labels are supposed to have specific meanings,
such as "this is the CPU temperature sensor", not vague meanings such as "tempA".

Guenter


