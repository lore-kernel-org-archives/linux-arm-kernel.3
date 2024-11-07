Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A2D35E5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHCnQjwtQk6Ee4qEjCK4DR0rfCUXjzBPqylzEtsbdRg=; b=XzAHnpY2kmHnkSyN+3mKDpRkiv
	x8WRPlrCSlHGzspbCZEih92DZO5qp/zZZOrlofUgJBHU1CyvD7xu9lByS3fFWXo3hBOG/JAa7DXqD
	KZWQQyWM1mUi4kjvy1z8aC9qTj7jEJG9j/27VNLx8JJcK7+nOp/FnHiwrbVMnqdycEdVKE18dlxD0
	oXi9BLt9h7Seq2bkH4kFt2j2JRVpsyWDtV9MfPROSvrzykkPkMIUXYHIPxFTxdiLmDcDpxg3I3PQo
	pl9sO0uR9sfzdH7C7YNwMG3F/xnDRcsHoVtKmzuyMR+JSpniKXSH178jkkeeqrJFLVYq2V3CMEG+v
	7amdrKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zvb-00000006W3s-2TnJ;
	Thu, 07 Nov 2024 10:39:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zqD-00000006UcW-2xO4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:34:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20c714cd9c8so8674735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 02:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730975657; x=1731580457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHCnQjwtQk6Ee4qEjCK4DR0rfCUXjzBPqylzEtsbdRg=;
        b=SiSJ6vM4w+4C4FFPOUoX4XKSIMVPPE99WVoaL7TugtAAze9mAZJqhX4rot0sR+xhqC
         vwUZZo27PZP2oK8ppzNl7hxvxHubKkhrBEg/WbsTRKJa/C6/vO9QP0kFjSGLfwD9tcTb
         V9fU6ti7D7xsPqNRH3zKpUY1RYNefsEQVn+zh1YYBIn3elH1mxcJCJlYocqQRAPIuIIS
         D5Zu12bn4Jv5S39VHF4COc3A+9KJcRUECgvknrHCUphEh7rMEFsw5ZaoSVV6jVlZ5Vkp
         WBoJu50anv9tK8jSVTrsZl7FY/5CXFd9Y4sBtpDz4Qtcm4kQnIjSFpkIvElW8C8RVe5Y
         GnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975657; x=1731580457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHCnQjwtQk6Ee4qEjCK4DR0rfCUXjzBPqylzEtsbdRg=;
        b=oSzrdGF4gOO30S48ZYH2GddEzoQ2UeRTn3sQrZsi5libjTQFo1ZtpITH7e1W4ULGOX
         cyV1WlDYZ3wfhxEScHfqUQqWk5zpLStdPa/eXDMnoTNROpQ+Y5fPvD+bVyVOxUO298hI
         Hgk6fwpPpuhbFsYmm1m4ILtV4XWTe3Coba8BLk1IjRv7dO2qGgkpsvML8ln1dGhGKPbI
         qcXvaTvXbWK3RD4XzM45Kom7+G9Lpn6In/gEN1A9jJsEWP0+eH/gVOULxTi4kT2l5uQs
         AqVeuscVbxrhdDxMJGpGm/+1sk24Re39XNN0J6coLzLmwnscW//y3QdEIbLl+8aYuBOe
         HrYA==
X-Forwarded-Encrypted: i=1; AJvYcCWGkQ984tvdncVy6OerkP6Z4BNI/VMI445QO8DlyBSbFd1/n5rdtng0SrXn5PzFemUPfBZOawxKTkQpR7OD7rrJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzraGKnHug09JbRBIaPB/eBhAJkMuJHYYKk/KnaUZYlTotEfM/p
	GBqzU2KFkQbNB372gzyYgXfJpVdz0xBqakDLLlBDRJB74vbfdcX7
X-Google-Smtp-Source: AGHT+IHkZfIEbD222fQn11aAU/4JCGtUmB7xX2nq1qct7iJZBs/q3eDUArv4HK7B8GzG/yGYnzOsoQ==
X-Received: by 2002:a17:902:e884:b0:20b:3f70:2e05 with SMTP id d9443c01a7336-2111afd6c99mr328557145ad.41.1730975656993;
        Thu, 07 Nov 2024 02:34:16 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e42b8csm9056135ad.131.2024.11.07.02.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:34:16 -0800 (PST)
Message-ID: <61a76bb1-f247-4e9e-b6ba-163fd8af4f69@gmail.com>
Date: Thu, 7 Nov 2024 18:34:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <12f4ea21-d83b-412c-9904-d9fe8f8a0167@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <12f4ea21-d83b-412c-9904-d9fe8f8a0167@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_023417_762721_98940409 
X-CRM114-Status: UNSURE (   6.70  )
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


Andrew Lunn 於 11/7/2024 2:13 AM 寫道:
>> +  mac-id:
>> +    maxItems: 1
>> +    description:
>> +      The interface of MAC.
> Please could you expand on what this is?
This property will be removed. Thanks.
> 	Andrew

