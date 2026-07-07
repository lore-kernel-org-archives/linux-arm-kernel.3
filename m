Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718BCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjaKNQDIB8x3lV2bAr2D5lvHBXFHHvfoE6oAh2cW/Bg=; b=VVDiJ5iN0JiKPcuZv+vTYqX0Km
	CP2Dl97UDI/Q+QovQ6/qAlj5zROAASkJYPQLVo1TWir2i6Dc04MpDkrgXSXSedJiIyIyJIltxIH8p
	qIAf6WE+6FUM/MeXMYUeYkseIA3AC+3aK2eD7grA7OdYj85lPFPtSmnOZ6bQIjz9oqkcxBH2Z4+I+
	lL/5/TbxFR2vp449x4aPHnBm4At13lD+1GCw+ns+RNdv74rwip+OOCAUBwrcwm3ZngHOAj6ZpiVm3
	4firfuHAfy6Yql9Gaj3a/IsuVf1egn4Ccb0VWAxfHDiv/QzmH8r5RVPvOeg520IjMLVoYsredkegP
	nIm/P3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Lx-0000000FF0m-3XlZ;
	Tue, 07 Jul 2026 15:04:54 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Lv-0000000FEzj-2pqR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:04:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493b27c7451so8975665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436690; x=1784041490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjaKNQDIB8x3lV2bAr2D5lvHBXFHHvfoE6oAh2cW/Bg=;
        b=dg9W1dzlzkoUPz4ycJHYaSuOU97wJHHuSnlD7xE5i1b/gY2266YE24fu0cg68xG7yi
         WjuMilzQ9IVPnJkuAToL36vmxP54oqYtSYFdEeiBq0IV31Ipj84ynPTSqcWLoIavggE3
         JEntSAEFVhUf5ny/1/bzHGaV0Zo8Z8/2fDdmNXIDFfZkXP6ByXeVYXBlIjr+UirK+cSt
         SoYzc5d/e7R620mFdwI8Xmc14ADm59EMe+M5vhvm0RTLCxHn6mX/hmSn6xGr5FNCCmqv
         UNANLIUZXavlqya01EITp+MnXlgyo9UcvXqgvRZOfL9h+DzssNqvRCvrGuymcrEnuOVI
         E7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436690; x=1784041490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjaKNQDIB8x3lV2bAr2D5lvHBXFHHvfoE6oAh2cW/Bg=;
        b=NeLWXgxqCdx8Ncz8HOBkMUrmSJh3+T4Gs1jmXWTQRzVWOq13+x2fRWnVQnZvlGbfMY
         FZL8SSIUQEKd5vllaCPHKid9E7Hmf8l+QcuvZ8Cw/UEPEBGxCliPd3lSn6v3jTB0MOYd
         zxGHnRV512zwwBwAWqMr+uSMiQShT5ZYCZ1jQhDJOYHb7fEY6umJesLeuDIjyisV+HjE
         CjK2CKodnOFWBKUKTdJ/583I8e0cliTdLxuSbIhO/DvVGJ/r1ItllILK7uU+PTt5aQ9t
         lOQYo7GltSvIiGIlGrEXQVVt/XWc8iOddQK/F7HcA3uEbwuFtF3yyo47gePGQ/wrRWO/
         ryYA==
X-Forwarded-Encrypted: i=1; AHgh+Rra93uFZsDuPxNdm07WVebkVquvg018NPRW3Sy03GjhISaakEon+M530enAmhM9B8HWRuJbrjvjU5g2X+FKoeIP@lists.infradead.org
X-Gm-Message-State: AOJu0YzX/5bMdA1t+1kY1Zq0P5m9YeYW51sC3sxa7H/fK0+klPpe1VXx
	JLhQF//Nws/zNalC7m0xU5Mh7+/gfMO07UaFMBLxiS7zsnW1siDWnPE=
X-Gm-Gg: AfdE7clO4mygF/THwB0fApcwdFOqfGJy0fDbwHaeTiBPrUYEee0T5cRmJ9G0hRCYaGw
	i0LNxp/A/DsqP82CtdTbiyKbBTHLLZ6P1k/Fq/vqjoQ4n6YQF5Fpa+XIcgMK9vt8HG4t9Euq+vB
	wxUsiBPy05DAqD0EZU/tjQAwciTNWzya6qVrKHe+V2NhTFzfMctuNpVUzf2o+6Ll1emcGZKxZ5G
	Er9IXwP5HEoU3DvkXo/ynptbPz6kD7/t1KiscP4rfY0xBfUdXIL9o4+0TdG0PiGPASBdt66CsLc
	l3YMKZeGf9W/5gE9yWXTJ/ak/yLovAWOzMbijSHrPCm/f5RZBLYe7+SDiWY7IiLurQYxHeck8eK
	0tM7ReQGw80b58MqkqPtghj1KdlujAv/nm1CerrPRDUQPzbQ8LbOvXif1ZtJwsSb9HA6lSZGJpd
	ugny6a2N7mjmUeAgByDBN1dfaOMnsikybP/wo0FoI7w9jC41Y/SicjeYZczysln9DyP+6T4A==
X-Received: by 2002:a05:6000:2584:b0:473:6590:c42a with SMTP id ffacd0b85a97d-47de97ea689mr3990217f8f.9.1783436688978;
        Tue, 07 Jul 2026 08:04:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm35142014f8f.32.2026.07.07.08.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:04:48 -0700 (PDT)
Message-ID: <6acf86dc-0df0-492a-b3dc-224a666214b9@gmail.com>
Date: Tue, 7 Jul 2026 17:04:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/13] iommu: arm-smmu-qcom: Configure lpac device
 with split address space
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-1-01d50c3e0c99@gmail.com>
 <5vfdbrk4bu77e7wgutp4h3ilbpjhcxxnwemqiufmtiwoffp4sl@oaonwwouw4qm>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <5vfdbrk4bu77e7wgutp4h3ilbpjhcxxnwemqiufmtiwoffp4sl@oaonwwouw4qm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_080451_736384_284C1E8F 
X-CRM114-Status: GOOD (  13.31  )
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

On 7/6/26 5:00 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 05, 2026 at 09:13:35PM +0200, Anna Maniscalco wrote:
>> We want the context bank used by LPAC to use split address space just
>> like GFX.
> Why?

I'll update the commit message in the next revision.

The reason is the same as GFX, we want split kernel and user address 
spaces so we can use per context page tables for userspace submissions.

>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


