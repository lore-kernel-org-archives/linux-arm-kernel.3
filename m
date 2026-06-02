Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C8FCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/F9SBkHIYEzDXTuA4BV3hptq8kg192HlVg4BWvVGGE=; b=cvvjWfxRrmO/jG9SBSbK5U/J7B
	KIyeH/oTjYjnIz+P3cOX0oCcqRW31fLRAI9KHrhprLgomo9GYQ+TEDp1y4AHkhS7BPR9gw7iqP5YX
	/rFP39eRihHxXOCVci2xQHoi9MZjkDV7Ci/4hmd1+bpKt7TQK08UUcltPvOHE/lFNrGI23FzUUKGz
	Eg3vY2/dJjv/Ptd9B68BWdVdwrtA8bnlaTPIrOBAdHSMl0/i2Ataw68OBUEpOFM6sYyf132yuu5Rn
	Greli7b8Ek+u6Rxzj6EGGxR5TzDCUmtiBlEB7DRwmZYeVRIkTC95QLwOcSUVZmSaRIuDQ9fho2ny+
	ZTA68e8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUW0y-0000000DmDE-0JVA;
	Tue, 02 Jun 2026 20:47:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUW0v-0000000DmCL-0TtE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:47:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49041e84237so97133465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433223; x=1781038023; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/F9SBkHIYEzDXTuA4BV3hptq8kg192HlVg4BWvVGGE=;
        b=YpBgEGd59fL6mgRnCt7NamNOSz3g2g2elg0TNBm3pu6oP9me++GWkBVt9x0yHEeBIJ
         xixbjUozMECNl5x0yLqmgB8Y4Fenlprdck8VSn+1utp5O737RNbbYxt7hrn66knFuUhf
         xfyilsAT1eYdRv1yZeEHHv0vD73Jqg9bP0LzjxC4NVh8ewic8vc52hQxeXftVzE8UQqE
         GUo/VsU95uA/HWMK8C+GNQAxa8VmxhAFCbM94JkF1zLwcBFNAWi68aNIiO5NNEN9c3tf
         GLL3AKJJv88nwjSxXAkK6pquAQsBGTmbt+Rwj2GvLsIRwjOQJpnWfLL84IC8hMBLDvNy
         tLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433223; x=1781038023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/F9SBkHIYEzDXTuA4BV3hptq8kg192HlVg4BWvVGGE=;
        b=NuLOApBVjOa75jc2AcHGZ06E1YQM8BzVdXAnrlSfNkuVgNnsampEzKH5fp1RV4+DLd
         5vBWi0Om54srvubCUGLV/PUx78ygA3tE2yNUNx9rgwzKexk9B2ywaCYjJRnPVlwINmsz
         WBW6GiAKtez9rbTZvG5d++yUPF+o2ZR/yyQOUVfIPku1pgEeBqlwn1hlJrezimEMF+Km
         42og38B1/pS4F+a4d0hIExDTTribHoesbAHJiQ9xAzcJ8tzhmgHYKt2zZbrSP/gayxgx
         kh8A3siM/skXjTngn9uX2vVELxXw3PxFbVCCpTgpajboOhgGjHcNDwMp5RnYBsIvP3tv
         BuPw==
X-Forwarded-Encrypted: i=1; AFNElJ9gYNzbly4EQlqXmaP03vv3M46QN7waZxxHrIATo1bsbkODNK+elXo1nXvB+mUQ3ZdXvxGfG2fUQnfLe0i/InKB@lists.infradead.org
X-Gm-Message-State: AOJu0YwN3fHNd5/58cKWTYmSfW3bQ6xgKQyKBozp5iTBI13Pee+9zEh7
	RsKm+XgT77fw1ZN5THblwcAQhhB2mADETLSqwb9wSDTJuLzw62G46Gb0
X-Gm-Gg: Acq92OGPdyB64FffLbbgG9WwaV94RJOImUTMXDhPLLAA11XnHj5fbCAf1Szv+tyeim5
	wzCOjttKhTyR94kC5I5ckfXjwoM6CGc6hcuSIboa2A15F0ZeAr/s2GGnXtzztCyCvZR2MPEqcSR
	l8ZfYMsPkht0kRQJxYmVLhy4SeuKsKFT/iXQ6Jv3aeZxsEPV1IskuHIsLEwfptZDkiIxgs/aaZq
	Ij4sGkKfLmgdNG1MlefDUxzwKEqjrNjMTsCeLHqf+deLnLE8k1anwll/NDQaBZSgx43Z3RvyWWD
	J6HSwnB3xZJOE2IpyfcEw2hPYc1vJN8jXcZ9J8TTbZzoYDl34r5xHAsqZgDG9zWKketfBc9j6wd
	OKlPnRO82p//IxSA6+Rw63drK8K80D0uDcbeZn+t7OGwIfLKGXji/VCG4xWU62jx0VCAETPFTH5
	opl8g4A/eJE75M242N1b/3JH7RSySuYnkxGs01YA==
X-Received: by 2002:a05:600c:458b:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490b6128dc3mr5058205e9.7.1780433222731;
        Tue, 02 Jun 2026 13:47:02 -0700 (PDT)
Received: from [192.168.0.2] ([212.50.121.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b60f6d5asm5811745e9.0.2026.06.02.13.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 13:47:02 -0700 (PDT)
Message-ID: <e7df5082-ef48-43d0-ad07-10e1e64e1d26@gmail.com>
Date: Tue, 2 Jun 2026 23:46:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
To: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
 Minano Tseng <Minano.tseng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
 <20260601173401.2c892526@kernel.org>
 <c279aea41ecf41c6aca4314a2f4e306b@compal.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <c279aea41ecf41c6aca4314a2f4e306b@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_134705_178081_222469A7 
X-CRM114-Status: GOOD (  22.34  )
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

Hi,

let me join the discussion and put my 2c.

On 6/2/26 13:58, Wu. JackBB (GSM) wrote:
> Hi Jakub,
> 
>> On Fri, 29 May 2026 18:31:39 +0800 Jack Wu via B4 Relay wrote:
>>> 43 files changed, 14761 insertions(+)
>>
>> Please try to cut this down to ~5kLoC for the initial submission.
>> Whatever the absolute minimum sensible chunk of code is.
>>
>> Each patch must build cleanly with W=1
> 
> We've already reduced this significantly from the original 41k LoC
> down to ~14.7k by stripping out non-essential features such as
> exception handling, memory logging, devlink, statistics, debug
> tracing, and others.
> 
> We even removed some arguably necessary features (PM, mdlog,
> throughput optimizations) that we plan to submit as follow-up
> series.

Great work. Highly appreciate!

> Note that the line count may slightly increase in v2, as we plan
> to add missing kdoc comments based on review feedback.
> 
> For reference, the t7xx driver (two generations older, simpler HW)
> had an initial submission of ~11.3k LoC [1]. The t9xx hardware is
> more complex, so we believe being in a similar range is reasonable.

Let me elaborate a bit here. The size problem is not due to a git or a 
mailbox limitation. It arise due to the human limitation. The T7xx 
submission review took something about 4 months and 8 iterations. And it 
was 'only' 11.3k lines. Let's do some extrapolation assuming that 
function is linear. 14.7k is 30% bigger, thus, estimated reviewing time 
should be 5 months and 2 weeks. And this looks optimistic.

Recommendation, shared by Jakub, is practical. 5k lines might be 
reviewed in a reasonable time and merged with the full confidence of the 
quality.

> We'd like to keep the driver functional and reviewable in its
> current scope. Do you have any suggestions on how we could further
> reduce the size while maintaining a working initial submission?

Off the top of my head, I would suggest joining T7xx and T9xx code 
bases. It could be done through factoring out a core functionality of 
T7xx into a library, or through making the driver layered.

I am not pretending being an expert in any of these drivers, but 
generally divide-n-conqueror together with code reuse work reliable. As 
an alternative, I could spend a couple of weeks reviewing the new 
submission and will come with more specific ideas on what can be thrown 
away or reused.

> [1] https://patchwork.kernel.org/project/netdevbpf/cover/20220506181310.2183829-1-ricardo.martinez@linux.intel.com/
> 
> Thanks.
> 
> 
> ================================================================================================================================================================
> This message may contain information which is private, privileged or confidential of Compal Electronics, Inc. If you are not the intended recipient of this message, please notify the sender and destroy/delete the message. Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon this information, by persons or entities other than the intended recipient is prohibited.
> ================================================================================================================================================================

And this disclaimer does not facilitate the review. Am I 'intended' 
recipient or should I destroy the message ASAP?

--
Sergey

