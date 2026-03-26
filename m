Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1307D109C038
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1rpr0C2dmOBXYyPWul0Xwe45NLnRL1Y3ksA5yPVlBA=; b=d91Qok0GWSI21yjRrq7fNkskyG
	JhEH/eLyunXKmeQhS0B4d5gostrOxLShOdJA0rnLNihBVTFsJ5U0xxEUCN/UdD9i7I5PIKPKc9/dt
	rUX8i+HLjysjOmfWFEO2pcrZETzpW2lT/foBgJX04roZlhKHGe61obbmncREcGnjUmQeQigjXtR/O
	p9LU5GOEP/G10UqxOJ9j7vdg1kkiMQMM6AqS18r3SE9w1k7QAt8wcsv0BZKaWSCBSIqV2jQBOjnBd
	Zt7pbPgwpFB/6bo3y9GzMuUF2sqJzF5FhEax3StKCxbmxFuLy66GBGtFD32BxVQ6oPjXlGEub+vgR
	sbSpg+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fIj-00000004wtb-0QVn;
	Thu, 26 Mar 2026 07:38:45 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fIg-00000004wtG-41HL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 07:38:44 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a3e79fe2b8so445865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 00:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774510721; x=1775115521;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1rpr0C2dmOBXYyPWul0Xwe45NLnRL1Y3ksA5yPVlBA=;
        b=dVjaOnx10A35XFESNGswq6B8sasEhuOF2A1AUMRRb9B0KOfTWYFmxbWcQ0UmbTQuVO
         cdlX0sWruyxq9BjKN8A2z6szuAOiEvw1+4o0L6H9no5AIUNeeUEVkb9fhjOjEw6OJ9AF
         +xXrI3CDKCx4LPzQjeorIxOd4rVqdmRW+8FvK65uLLJiCnD8jgh+copjjYSxdPz0it2k
         s/m3cmpX3hZI3ofn0fAP72j/Hl1SoVId2FXl8u+NI5QlanNRVRFv4x1UJuaN66XJjpiN
         3TZg4HBryD/rv1Opl1547/jKibFAS0yBUV6uOC5yFpCJqOpjOPO9YV5Da4mkTZROCczL
         I63g==
X-Forwarded-Encrypted: i=1; AJvYcCV7mIVPcNRJ1vgDniCO87OSVCSQPGrOo6rFjdapPaYab8QEGZ2ZTTVjR+PTu43IJBnHIUc9uRGQZgFSN5z9hnR+@lists.infradead.org
X-Gm-Message-State: AOJu0YzoeSb2VkipJSY9+iK1qig/TjZNOHwQjHiKCooJEfqFJJy4+Wvv
	N30ha/YlF9LVYB8B42rwTXlb1TS7arkCUL8VL8ZkD8kaur94uTFS10aX
X-Gm-Gg: ATEYQzxa4V8xlgDCeyC8x6aXxMgDnbvjWUFBOcZiluHc53OXrMQnkzNg8Y2EYx7Jw4/
	ZxVgBXVecLIEHq1xeZxv1ZvUbc7iZ1WAOAE3OFvDRyaEpLCnYobCN874TFH5yxx7LhThu0OAr5c
	xqZOS4OydrXBbXllVhZGF1XS2XnGizMj5jlAqLXLNtcyb92mjX3yzUEkpAz/UsHORbeB0xMwBOE
	7HAkUg+oxOg0XrrjCoTgVRgLQxtSXPDnMI/fUCJuu8b1Tr5cmerNV0qYfngqWtcKLZftyMXHvu2
	jYkzwO8igUJmj9Jiq3urs0axM6RVrcR4VtDydSFMPuI84Znfy9K1fcrcP4sUSBcFVBrtYbVkROk
	mN3GPjYf7MqmSJyhiFmRNuH3zVaJncRx1iYvVdLKCL8nhxeuG2AlNAhU5rFVuWEzehxGEzbBqY8
	vKtv+HMn6VBMo9tNvVYCToFJMZl/zcMvyyK1JkAby9PkVrBwbKsjEJLbHrQ96d2fiP4J7Q5t8Kl
	2Q0PRxCtpii7svmiQkr/A==
X-Received: by 2002:a17:903:2acf:b0:2b0:bf0c:cb46 with SMTP id d9443c01a7336-2b0bf0cdaf9mr9439045ad.8.1774510721579;
        Thu, 26 Mar 2026 00:38:41 -0700 (PDT)
Received: from [172.30.1.21] ([119.206.52.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc87e6cfsm20682045ad.39.2026.03.26.00.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 00:38:41 -0700 (PDT)
Message-ID: <f45312a8-7ead-4e81-82f5-75ffa8df7f6a@kzalloc.com>
Date: Thu, 26 Mar 2026 16:38:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: defconfig: Enable options for CIX Sky1 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Peter Chen <peter.chen@cixtech.com>, arnd@arndb.de
Cc: geert+renesas@glider.be, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260326033939.3789800-1-peter.chen@cixtech.com>
 <c2127a57-3ced-4c0c-a7df-c052cd5dac7e@oss.qualcomm.com>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <c2127a57-3ced-4c0c-a7df-c052cd5dac7e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_003843_024308_0145DE33 
X-CRM114-Status: GOOD (  12.09  )
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

Hi Krzysztof,

On 3/26/26 4:14 PM, Krzysztof Kozlowski wrote:
> On 26/03/2026 04:39, Peter Chen wrote:
>> Enable pinctrl, gpio, pcie and hda audio support.
> 
> Why?

This configuration is required for GPIO functionality on the Radxa Orion O6.
The following issue has been reported on the Debian kernel mailing list:

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1131772

> Please search within similar patches for explanation how why this is not
> enough and what should be here.
> 
> Best regards,
> Krzysztof

Thank you!

Best regards,
Yunseong Kim

 


