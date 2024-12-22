Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1108E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 21:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1oye4z15+lr2o1w+EQ1x0Cmk8LMpN4hRUXuCC9sKgc=; b=hz4r+qp8eeIS1NeOl5vV1sf4ip
	HJmt6AzV0N38cF8xIwTalvfb1krRKf7lcU2pCAWWktUwVXM54j01/g2rqwf+nbZaWoFUWppKYFKQa
	N98WCxJzMjGUzjGut0ggla3KUeFg0efa4Q9K3ZSet/g3G2+BZe7aR2Hjt9y2KqCzzZDX3CRbv6k9W
	XGdTIP9IOfzaoZceYeGVpu5pFfM2tiNn6gNLgUlCGg+84Fq8eGzUXcGyJZQfbT73g5Al5Df2FA1lC
	KEitrJCxVrX58zE2CT5WrUX+40iGSLK5Q4CthijvaP07hPEUfJyG1iiY8M3/pe2QhLWmleZ8PhmE+
	kV+ysBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPT9S-00000008puc-3Kej;
	Sun, 22 Dec 2024 21:06:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPT8F-00000008pnk-0SZR;
	Sun, 22 Dec 2024 21:05:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43675b1155bso13209945e9.2;
        Sun, 22 Dec 2024 13:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734901497; x=1735506297; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1oye4z15+lr2o1w+EQ1x0Cmk8LMpN4hRUXuCC9sKgc=;
        b=c863JUd4HC18ygJXKerZdYioLzNr7Pa/hLa0WgCtrvHGAn0zHlFlANcbK9kpl+pFya
         +bIHjAuwhvvCReqWpCeFCaSO1T1vKv3MNYsNwjVR08PCTNcA1GNdrg7P72h+f26ehRFz
         +PzP8o71FpKGDNlF66mA5/jetFceLjPx/q8YjCqNI8OMlZ9idnMOd04DKrO5nKWP7GO3
         /0XrLcKv9BFBsK6Vpg2IFs4I72gNw6MKbC+pO4j+DomL9Or34Q5vlyDUhIJOyfkfelni
         9m2m/vGGb9oiH/HmjeMmVZYsOYlUDU/BWP9aY8tH0mS34pYw3CMMU7MVuGFMP3DACh0U
         3h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734901497; x=1735506297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1oye4z15+lr2o1w+EQ1x0Cmk8LMpN4hRUXuCC9sKgc=;
        b=ggua+An1NyoEXOXDuHLCmHfWD2ao8qSDz+J3Iib5fw7MyPC8DyunV5L5/D+J7yhOCj
         2QvdCkLVebLuwktiLTLtHrl/RYchRR7FSeYKh5PfUQ7sS5nrms/vSLuZHUYtOV2mjKBV
         Ru7hHXBGiwuvWRQMnP7boy8NMZc94h8jhQZohdyhGK9ZVVwwidrlm0vFWRetNfvi60gO
         19t4AVzSn5YK7qnzkBt/fgaVpGrB7vLITcgr+ZQsCngCU+eq1yggaTdHlg3Y+Q7io/cI
         670XBbu8WyOq0kZkXgVPXkVtBVLM9xYxnP7eK5T6/FxAmstIxTPzLzffg1bg5xL9VqkJ
         NSjw==
X-Forwarded-Encrypted: i=1; AJvYcCUEVIPZVlxtGmWxA49oj09ml7C7mkpT4wo1Bn0GJ16kGwp1aZboOiUS8rRf3FBtptZk0unR+dYXkMcMCfCWuTVy@lists.infradead.org, AJvYcCXx4ukhdbOKjumL5NMmSBh+Ej6NUjdpxuSfALUfxkhZhBgdEiFW43bIds4rQNNyZgNO9j7vMVPb+JxZrDZL8Ro=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMRXw7Vlq6alxlOYA2uZmv5PCiLqPy1JXyotskmsg60rRJm9wj
	gRJhJvP158907j+YiKFe47VbPhTVJcO/KYMXLAU5JzZi8pRfFWyk
X-Gm-Gg: ASbGncuR45qsA4Gr9ueAUsgCKPRj+efN3nAON36MGI4nG/c9fhQCifiuESdrdi72J2B
	R1yTmoWVOpjzdaP4FLguonGAUd9RZvv+a681ABaiBcbSDV5/oo/lykbfEmgH9Ii4Ks52hte3rO5
	pKAKwyW/NrK5MgHSPGUSt0sQsIPZ7X2RUwEHPXaqfKOkNwBTAE5p9psOtnUcccgyQ//32C+JmhI
	zg3hfpI2j/1c02PuEG7+5425eZETjRslbcg4rxkQ/9Jq6MeSrkDem6LAg==
X-Google-Smtp-Source: AGHT+IHrVNOxvatH0wJahcvx8K9R6UCZia3C2mnXBs1VmInWx4bVumdXRL/+jSSx4T8TnEac1wlEhg==
X-Received: by 2002:a05:600c:1c12:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-4366aabbed2mr92183945e9.31.1734901496299;
        Sun, 22 Dec 2024 13:04:56 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c508sm114539775e9.33.2024.12.22.13.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 13:04:55 -0800 (PST)
Message-ID: <6d839f1a-9c38-46a9-aa3b-62afbd75cea7@gmail.com>
Date: Sun, 22 Dec 2024 23:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net v2] net: wwan: t7xx: Fix FSM command timeout issue
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, corbet@lwn.net,
 danielwinkler@google.com, helgaas@kernel.org, horms@kernel.org,
 korneld@google.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
References: <20241213064720.122615-1-jinjian.song@fibocom.com>
 <20241220085027.7692-1-jinjian.song@fibocom.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241220085027.7692-1-jinjian.song@fibocom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_130459_180272_D03A3034 
X-CRM114-Status: UNSURE (   7.54  )
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

Hi Jinjian,

On 20.12.2024 10:50, Jinjian Song wrote:
> From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> 
>>> Fixes: d785ed945de6 ("net: wwan: t7xx: PCIe reset rescan")
>>
>> The completion waiting was introduced in a different commit. I 
>> believe, the fix tag should be 13e920d93e37 ("net: wwan: t7xx: Add 
>> core components")
>>
> 
> Got it.

[...]

> Yes, the patch works fine, needs some minor modifications, could we 
> feedback to the driver author to merge these changes.

Looks like the drivers authors haven't enough time to maintain it. You 
are the most active developer at the moment. Could formally resend the 
updated patch with refcounter as V3? And, I believe, we can apply it.

--
Sergey

