Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC12E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DYFuvVPX9cHeF8QayHC3cjPyNno83Ev2qdEkZx3JGY=; b=jWEykSrT3jcbFX28KeHhD4iep/
	9DT0wWiyGP1C6fKVfmwf2K4ViKAM/rru8A791uGeYP1Kh/9LpAzRuJBowzAlhZYTO2TNEu95Yqv6F
	KJTgDlfUPH+DS1kp6tCczQWM1jZ028Xf97uB8hnUHtXNev6nflQFgFjDSHG5MdV512fn8KZoMUr2T
	gGxneqis1rdbcpR3x60NrmnZVqoFkxCLfR/nftXESDef6yb/rMYPF6GAiZYRJs8TvcVbkxSmyM071
	4JYzmwAe6o4+ibCB441eW9w4C7Db4MX13UmWoF6fYXme5SKTHW1hHCwiXCbWCdLXZrDaIuC2vyis4
	xVQwRlFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNt0h-0000000GZpS-0J4R;
	Wed, 18 Dec 2024 12:18:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsza-0000000GZZS-3e7i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 12:17:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3863c36a731so4614091f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 04:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524249; x=1735129049; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4DYFuvVPX9cHeF8QayHC3cjPyNno83Ev2qdEkZx3JGY=;
        b=i/KJqZyJUIJYQMq2OHiagOYZcdTzS1hTxUU/VyZGuOcRQDQZL79wcW617eOVHcWqHG
         A5xjmSSP3cXdSn9VslozXWpyb6RHmFTFTytJLuawBdToVJzy9tH/2YnbOvhpFVfVOe9d
         0xTF53JD9oaT2ry5BlP0TTpRkRJifzoxSq8mY2F9EeHB0Vfo9clVk/4QYIT+8I8M5i3v
         E/EYr+VhXKlAuXebnmPcKIP3EQaWEE4jGRpiRlaAuYyk+1DInkWA+iD+mrcd0OMTqtio
         RWK9OBzn2XCcWAJsOCSCZGlz0F+mQFGt3/q57ZFntm/H0KBDfzqugiab4orcq8NsLowr
         Y6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524249; x=1735129049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DYFuvVPX9cHeF8QayHC3cjPyNno83Ev2qdEkZx3JGY=;
        b=bMLfu6ec7y5e45SnJsRaU+71/zVHfT95CCi8RGDgxzP+Ma1GBTIL2jOS0Stq0GZKrN
         LkXB7KHxgqji6B7g89MUvNSqTEDTtz1a2QkKeNJHcXVJk6Ma5twq+R0bv+sVkRRcqzGr
         bOugpCMqt5gNlXT3Kbo7GPI1F3quY5n7zeQ95YMo/hQZF8ZeYQJ+omdXkZtWWIDgCctr
         bXVkIyeoAdnYHd+e6zDlmVWDbGkkeL1Aa8RDFOJYVUeX0I8qM3pbeCP0uTHe8URip/pm
         DZoU9pFSi3FeLp9ng3KAvI5zvGn4kfPo6ECpiFC3r0g6udOFFSXmrtZqDCEHcJt03gD2
         9FAg==
X-Forwarded-Encrypted: i=1; AJvYcCVDj9HS/rlgRYD5I2n+uYaHsIgx5ubqTJGfRREAINBP6eFEABxNri/KXhhYZN5MxCIEF88C6eqPC+eiTziz6sRk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw48ScIbVPPVAsHodRaGh0nB8h98yEHWLs9OpFnOZbMWWnc8UFl
	OwonjOBlvs2KoPcif0gmch6dkwlG6WPItGwyJ/b93SOLw+q8H4U3XjxitxaFHXE=
X-Gm-Gg: ASbGncvt21PMUq8u6lieSNxKKCw/XFCss69cDaRWXmklgCE2dXG+tMzt4xUWAi6fBDW
	iOiyhWujERGpuFIwOt92CRAide0Pb8W5Ym1U4tzuJqEWkEgf97Pww2rE5pFceveDNJ0egJMAE+t
	k1nqSdjjyvik2ZPT1p8pPFIuimvUW81zrXSLmLAg85zdqSeakH5xcb5pLaewAjg4h0m8E34pw2A
	l0H35cLF3edHgMkc1QA8Ixw11AJjigvC13dO8Bep2UWje4tbHGOLl+DQOd0FZsGKi2mGw==
X-Google-Smtp-Source: AGHT+IER+QEY6V8nq14LSSmIcFR8gdF8DVvylZ0bkqNg1sTgTrfWj+uIM7Fda3t7Dg2mEA7/hwP9Jw==
X-Received: by 2002:a5d:5f4f:0:b0:386:3262:28c6 with SMTP id ffacd0b85a97d-388e4d310d8mr2650855f8f.5.1734524248972;
        Wed, 18 Dec 2024 04:17:28 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012081sm13819658f8f.19.2024.12.18.04.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 04:17:28 -0800 (PST)
Message-ID: <23ae6fb9-2c66-4d16-83e7-d53c1a6685c2@linaro.org>
Date: Wed, 18 Dec 2024 12:17:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
 <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
 <fe28a9bc-82ef-4fef-af50-9d9261ed9b39@kernel.org>
 <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
 <hevfx4sgsatohz4ndgrlidj5kqxaiizmakjqjghlkbmguluzi5@ezxa36uasb32>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <hevfx4sgsatohz4ndgrlidj5kqxaiizmakjqjghlkbmguluzi5@ezxa36uasb32>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_041730_910568_A798F12F 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On 18/12/2024 11:36, Dmitry Baryshkov wrote:
>> Agreed.
>>
>> The commit log should make clear that the ABI hasn't been cemented yet.
>>
>> 20241217140656.965235-4-quic_vikramsa@quicinc.com <- is still pending
> If it hasn't been comitted yet, isn't it better to post a fixed version
> rather than committing a version which has known issues?

Yes.

- yaml
- driver

are merged but

- dtsi is not

So we can still change yaml and driver prior to fixing dtsi.

---
bod

