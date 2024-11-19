Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14077D60D09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZU9m1MkdWx4i6vZAKzVum+IVfxNM41Y0ukpBjBroxA=; b=DWoIaaEFT0JHvqb2UVatuD7ES4
	BD88eD9umy5St+tCWvERt7CgAaFQUasWAREP/zZ1s9OYckWNx5MD5Z6Lhc95hykaB1iQa1l5NAW2j
	h3AlS4gpBQVPVCOWS0Y299P3f024ulpRoKrm91AGzaLvUR6MRqpZJ1+E/DsgInhrDwYyMl/i9zbF5
	K6g2BI8NuoIQzfv2I1zYcTW6yFDVP847Ey3tL8tK7cy232V5qk7BhkGgQ0eZ6SX2x520FD6L+UsGx
	pJX5UflttNJ3BBQvtnUqCW/OxMqcRI2PaQKetze9G19fKMvpeG/zpT7cHv/pxTCY8QiAyxvz5xNya
	Hr/BVNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDOZ-0000000B7GU-2OEL;
	Tue, 19 Nov 2024 01:51:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDNe-0000000B75T-2JhK;
	Tue, 19 Nov 2024 01:50:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43193678216so3392185e9.0;
        Mon, 18 Nov 2024 17:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731981013; x=1732585813; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZU9m1MkdWx4i6vZAKzVum+IVfxNM41Y0ukpBjBroxA=;
        b=niEMwMXrxLfxAAOXcYdWVAmEtRc0ou8so4Wg6CCal3Srg37WbzDLgOtRQNaoaJQqnx
         uCEqOMu5AbIkhtuizLDSJK7kNMZ6F0i6YbxctzAOVoOupsxLwjayehZtDVFd5C01XUAJ
         +j7pmT4j8eMUaQk03oBPPqQTAse0vcTxJWog2n0CVj9FnZmUc6OnfqMW/jwQaiAZla78
         LLCd3lrr7tVxOt4fI/2jxhAskThanMD6k2khCPw7OpcBvbTubYontlGWSbyWDvek5M24
         JtaZz7KI2FijMsfoyWDtxetjur4zyI4NlotB//lg3sT8C8fI91yBX6lTiwPmH7nIK63S
         y2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731981013; x=1732585813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZU9m1MkdWx4i6vZAKzVum+IVfxNM41Y0ukpBjBroxA=;
        b=CsMkrmSHKRpMuHXid87mLYBlwqYPaqyVSnpbZ+7qS7WYqJ1ZLrBrK8zXqKa6w+Yyec
         pv+IyLgf93LrgVWrpQ6y1LAQxKCQtAyFBSn7HJ51i4yy2uzntPUoJsqg/04auSzX3ha2
         D76plupRV/Dd7CPQXwtyBjdBe5do2E2cyBjkvG88CSJZGKkPBCBr//DqvjgEGmHcWnD5
         OkZZCeEQwea9L3rTFN3Cx8xIwrvL/c/yeejSHNZ+DrKU5cbrMG7nOQ07gxBXTW6lYPsv
         PjuPYebquO2Ye6WBXURtc0rgjfDNoNilOK0hWOGlnsOLBvnuA+oRmA0X8HKmE51URvKx
         0E3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdblJst57+nuYs2F/nm8JRiMEQWOqj+d1+b4JBjiBwet34WzwZ7ifeKyFAGspE/5O3KcxCZUe6U/sGGxRSHe0=@lists.infradead.org, AJvYcCWm85e+QxMtE+Ce6kadTw6/9nrkKG/Cihw6OEfjAwYJvoCQMofySX8/pZTkjCN+4nMhTVqtWbmYgQ7p7n8rWC8C@lists.infradead.org
X-Gm-Message-State: AOJu0YyAT7iIAsB4xDaqXIB2vUJB0iL5UXVYKoaJZVcMNr9u+fQC/Iqp
	+EU8SEdq16U6EhBW/Fd5UR5xTG7OT+lIUiBSD/uPR74TrRUS013o
X-Google-Smtp-Source: AGHT+IHlOI4F0kpcJOGv0iEQ33+t3UPrLsLMx4Chv12jG/53XXfwtQzEFnpW7KqtOrTwbh7/wRbVtA==
X-Received: by 2002:a5d:5d89:0:b0:37d:4647:154e with SMTP id ffacd0b85a97d-382258f10b2mr12237535f8f.9.1731981012634;
        Mon, 18 Nov 2024 17:50:12 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3822eb34170sm10389757f8f.11.2024.11.18.17.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 17:50:11 -0800 (PST)
Message-ID: <de5f6ecd-e3c9-4a14-a9ba-12614f19f191@gmail.com>
Date: Tue, 19 Nov 2024 03:50:44 +0200
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
 <7e5e2bda-e80d-46ec-816a-613c5808222e@gmail.com>
 <20241118174456.463c2817@kernel.org>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241118174456.463c2817@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_175014_595267_9D79761F 
X-CRM114-Status: UNSURE (   9.22  )
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

On 19.11.2024 03:44, Jakub Kicinski wrote:
> On Tue, 19 Nov 2024 03:01:47 +0200 Sergey Ryazanov wrote:
>>> He's decreasing the sleep timer from 20 to 5 sec, both of which
>>> are very high for networking, anyway. You appear to be questioning
>>> autosuspend itself but it seems to have been added 2 years ago already.
>>>
>>> What am I missing?
>>
>> Some possible funny side-effect of sleeping with this chipset. Like
>> loosing network connection and dropping TCP sessions. I hope that 20
>> seconds was putted on purpose.
>>
>> Suddenly, I don't have this modem at hand and want to be sure that we
>> are not going to receive a stream of bug reports.
> 
> Power saving is always tricky, but they say they tested. I think we
> should give it a go, worst case - it will be an easy revert.

Make sense. Then let's merge it.

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>


