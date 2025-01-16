Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2624C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 04:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4lTg0T9hFxSt/NfABOy8Ts2GGYfCa7L7ZN3BcykZak=; b=j3yR5iECoIsoZE9u1gIlBjoQiV
	q98EVocYgs+GB255V9UPdJXnKWP1hrCuJx17ybqp5niEGXSZkn1G3WMf18imTFCjCRDRbRwnzhvdJ
	4LblFH/M6EKZAOabkoHli2wxzEJWj4YT3sKxR0jTy822gShdZeyVQvTrB8k6Xhwxc1allJj0QAY7v
	EQy2MaKLU5KuHKn6j77WHvBTkyi09F5vVsvv/7K9EOwcPRs26ArtRFBRQWk+LU/kSBAS+RwUSK3X+
	eonpXusOft+utBiiquUeIbS1qE/S32ARmFqOGT7AYw6gODl+hy82mEidgkSi3iEmzSqn4pRb9XhnK
	MQvAt9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHus-0000000DplM-193v;
	Thu, 16 Jan 2025 04:55:38 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHtb-0000000Dpe8-1adZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 04:54:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21661be2c2dso7703775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 20:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1737003259; x=1737608059; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4lTg0T9hFxSt/NfABOy8Ts2GGYfCa7L7ZN3BcykZak=;
        b=aZbhMDHIBtw5gzHl49KpCAUtFM7bCmR7CsITIGMinrx0Lcge7UEj6mkLg9kHRRTL/3
         ulMornvRkiT9MdS70a7b6iz6xliSvi2M455pBh/vxe3FsJEqKylLQpR63Q8FuTpkdg5H
         xUaYqikFn+gusgwu3jj/+lUXeE7lNXUm80iGvMP2DYgxraN8a+7hvASRfyIscFmkskWv
         +dIHYLDaDEKlG4CuxS9tmB875ddbHfWzHRDSbiBoOeH6KSyCU5FiUZdcBY340PflN5RG
         +uYFfWfvdMdEMQZQgrOjg2uTURndzj7G+PXW2UFiwfNyEiMuoKat8TrVU+ef1u017wj1
         H8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737003259; x=1737608059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4lTg0T9hFxSt/NfABOy8Ts2GGYfCa7L7ZN3BcykZak=;
        b=eDD/at6HQlQOrfBtJn2QQRt1lGxPZbJUC+6hvxZaY+SnTgOX/kxxG2oD7KtlogqTlA
         oksRF5B19KP4Ih9gcc28EXYNLsLIsEHkRxJAYxqN0s0wkIuGtcQAZDSHMMrVFD/DX3nK
         eSjPAZVsWTgxIUkF+N0Ge/EEoOGRfQNbYUaJAZvhgwkwoTG6fg033ZD2jraeccHfVD0y
         mbsbQN+MQMsqnzpSDnXjX0cSXyEmvLAGc6xXoKnCsE2FOf2YoFSsftgwal11+XN8dv0c
         UiLKuzjxfsqRJut1sYlnIqNabn9b9eCHXPm8MurVLVZfk4aXsj4Yw0WO/4UnSJjiTTG+
         MGiw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Yir6VM/98ICQMiDBcuIQfs0dxOw78sevQ00isuHiUbIAjTMnBsA4SPRcpCCsHrNWihc476pBnWxRjd1vcQnM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4t175Y/BMVJYa8Be6w6l8B+45xi+F5yRfzYR0JytNRYB3kXhe
	IShHudFH9eQtzDKCseZzyNRrPOW6MwW7If+NFYLrtarra5FOWEAxUFXVtZFPV+s=
X-Gm-Gg: ASbGncsaoNnn3fk8sCh+CSKIoPjlxgJziYIiSLBIsNJS0otn58Xen1U3vJO/ChdUhIy
	9MY486O5++4XJwz4Zf8qRLPFBIDobeotUTJI/9nYYUeXXIoEhOzrbT1OnuVvQJur+zJSXvRafsg
	jPeXETpL6sbZCqw2IW7qaiEY9x6MXkBcq7cO95ZXJLAqfWziVnVp9vJtJxGporQ3WyhSKK0VEYO
	O7it6R4Ge8NhYPIhPo5z7rkN7nDyigU2FQMkLqSDlU2uW0DUA+kbp0zFuhEnXhmlXe+Qpk=
X-Google-Smtp-Source: AGHT+IGrIee2UMyxZ1TjWISfaNWFFsUV/xQqvtny3X7oWRWZJQq5c4TtrQOvGnVq1jkMQDFxC4rirA==
X-Received: by 2002:a05:6a21:a24b:b0:1d9:6c9c:75ea with SMTP id adf61e73a8af0-1e88d0df9efmr47653820637.5.1737003258724;
        Wed, 15 Jan 2025 20:54:18 -0800 (PST)
Received: from [157.82.204.145] ([157.82.204.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31857cfb2bsm10568472a12.26.2025.01.15.20.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 20:54:18 -0800 (PST)
Message-ID: <b864aba0-fb12-4409-ab82-a7c6ed09674a@pf.is.s.u-tokyo.ac.jp>
Date: Thu, 16 Jan 2025 13:54:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spmi: Fix controller->node != parent->node breakage
To: Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com>
 <5b139af8d639e20a14c8bd00e8e03a4a.sboyd@kernel.org>
 <58cb6c37-0ea0-4866-a2b1-92cb0f0391a7@gmail.com>
 <305d7cf5f0a66efc01181f24d3a288d3.sboyd@kernel.org>
 <91e2bd5b-71fa-402a-82cb-e68d3295804a@gmail.com>
 <848b4dad4f38dc6545b97f7c5007e514.sboyd@kernel.org>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <848b4dad4f38dc6545b97f7c5007e514.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_205419_423900_92448891 
X-CRM114-Status: GOOD (  13.82  )
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



On 1/16/25 08:16, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2025-01-14 12:37:20)
>> On 1/14/25 19:30, Stephen Boyd wrote:
>>>
>>> Ok, I see that I was reading the already reverted state of the tree
>>> where the 'ctrl->dev.of_node = node' assignment came back. So there's
>>> nothing to do besides drop the patch in fixes, which I already did. We
>>> can then apply this patch to drop the duplicate assignment as a cleanup
>>> and to avoid a refcount bump on the of_node that isn't needed.
>>>
>>> ----8<---
>>> diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
>>> index 3cafdf22c909..122140b97579 100644
>>> --- a/drivers/spmi/hisi-spmi-controller.c
>>> +++ b/drivers/spmi/hisi-spmi-controller.c
>>> @@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
>>>    
>>>        spin_lock_init(&spmi_controller->lock);
>>>    
>>> -     ctrl->dev.parent = pdev->dev.parent;
>>> -     ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
>>> -
>>>        /* Callbacks */
>>>        ctrl->read_cmd = spmi_read_cmd;
>>>        ctrl->write_cmd = spmi_write_cmd;
>>
>> That works for me, thank you
>>
> 
> Joe, care to send this patch to replace the one you sent previously?

Thank you for the fix and the suggestion. I just sent a patch removing 
the three lines [1].

[1]: 
https://lore.kernel.org/all/20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp/

Best,
Joe

