Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6699BD68BE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MbkWbTcMyJCBwwGFH5mzKdQbrS61TByU2lSza0tBxM=; b=fj8T+VNdaPBaGAnHuLy/rHeFha
	kemmt/uHU4mS+CsxrGuAukAsfqinD+EuZX99sVEShktbjPY1aX3KFHpLLMYf2KWa2UMqULHZlTHtP
	DrqNnHqgqYRR+kYFZ0Y+ucdhJb0FOC4kOm5ja7gT8IqA1d3zwbk8eYXhbWZJl3bwFjv8OrPDI9PFD
	65zEtk5RgxwZJEnKy5g6u4v/hqK6OewO5VWiHXI3pSXC0w3w4B6DHV8XgWeVnibsDsqvo3DzHJM7T
	rMRafEYKkFcrw753rZkmvVCTIqrzKwWWV6o2iv+xRpL5G+S/drJKdbGAYe7pg+frHmjVMfJ4HxJYR
	dEQYZhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCNCK-000000061MI-40G8;
	Sat, 16 Nov 2024 18:07:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCNBO-000000061Bw-3mfc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 18:06:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a99f646ff1bso419402966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Nov 2024 10:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731780365; x=1732385165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5MbkWbTcMyJCBwwGFH5mzKdQbrS61TByU2lSza0tBxM=;
        b=RrpN7DFggolEAJ5xhUPTTEnAdu9i+FuqkQ8kzFtY8wyjMeTioUN0psF5jNw2wQnCPS
         9vMx4IaB7TTXs82Yeed38uaoM++9nGvuPocD+dDnvCEwS8q9qitGW1rPOivM8+k6HjQM
         5HfZ8JoOy1I3omIFsivxCXB0bzyy6nIuWY/zDsku3kxD5krik0Z+7Y0vUK2gjTThskfT
         eSyupGDZy5HRFMnTCdDKDNebSRCDSYuzv0N+P1c2YcjG1hAh++4zR/3CJSuX/ahweE+1
         eVRT6yPt9CKZihuuo3ag4Dbmdp62XIsRUy5RycgDubl8A1CBFRvNXovXTcvXR8+Nq2nG
         WyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731780365; x=1732385165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MbkWbTcMyJCBwwGFH5mzKdQbrS61TByU2lSza0tBxM=;
        b=jMkFWYHwnVRTZNVMYBFXryxxeRTnHu/2FMX2ECc/OJx1VUi3vcPQSHm+ElcileRRY7
         gJdYEy7tSEKv8BhyvYqnKieEMXcxj5qdc0mjkUzVPzIi8pLuTT9F/9gO8mgVfsR1DS0f
         Sk7C0CduKjG2P/u1X7vvRXV1sZ/mDDdbscTnDm3c0EKyvF27kRlgp5nFg73v2Hv92DJb
         yQZ1ZJxiXtwjFLxTi+K/HwHfleZhFV6nO+mGR22BoRAhof9n7gQ06yTI4zccdaE0SGCZ
         vz1jRxZSFNSBnsBDIKnaj7uE2R+L3iPaN1ARaHnThAKa5BiEdXK2HBO5W9dji9CyIjOH
         mC3A==
X-Forwarded-Encrypted: i=1; AJvYcCUt0YbjdUiYDo2xBtz96uXmnssO2XCK4AeVqtnVhWFguXtJPHTc2JS7Q69tQ9DhBA0O4XWlSj/hf/fRgJQo32GW@lists.infradead.org
X-Gm-Message-State: AOJu0YxotNi3b4Eg4NBUe9nPiAze1+Zzd0Xy2sV/3oU0a6ch/Wkr4dcg
	J5Xf6Kuim1SdW83uBtQFerMCPlYUMhuXnsWxbyLicbTga8MJf+7x
X-Google-Smtp-Source: AGHT+IHYpJ1CGdDFTs7irKG37tG9/+9C7qVIWSkB/PHZ4zOEvRGVYzWs6HkJAviEiLY8BUqkL7tqjg==
X-Received: by 2002:a17:907:2d11:b0:a99:5234:c56c with SMTP id a640c23a62f3a-aa48345440amr645629766b.33.1731780364840;
        Sat, 16 Nov 2024 10:06:04 -0800 (PST)
Received: from ?IPV6:2a02:3100:a557:e100:45f4:697f:1405:21be? (dynamic-2a02-3100-a557-e100-45f4-697f-1405-21be.310.pool.telefonica.de. [2a02:3100:a557:e100:45f4:697f:1405:21be])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa20e080a90sm329627666b.174.2024.11.16.10.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 10:06:03 -0800 (PST)
Message-ID: <913e6891-51f3-442b-8af1-351d96ff018f@gmail.com>
Date: Sat, 16 Nov 2024 19:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] Fix 'ethtool --show-eee' during initial stage
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
 <ZzdW2iB2OkbZxTgS@shell.armlinux.org.uk>
 <170a8d59-e954-4316-9b83-9b799cb60481@gmail.com>
 <Zzi7dqqZLCCVvlHq@shell.armlinux.org.uk>
 <3915908d-d70b-4fbe-b80b-990d02211965@gmail.com>
 <ZzjZ8EcwpU-YnZrz@shell.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZzjZ8EcwpU-YnZrz@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_100606_944392_4625E687 
X-CRM114-Status: GOOD (  10.99  )
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

On 16.11.2024 18:44, Russell King (Oracle) wrote:
> On Sat, Nov 16, 2024 at 06:41:13PM +0100, Heiner Kallweit wrote:
>> On 16.11.2024 16:34, Russell King (Oracle) wrote:
>>> Hmm, don't we want to do this under phydev->lock, because network
>>> drivers and phylib may be reading from phydev->eee_cfg? If we
>>> update it outside the lock, and then revert, there's a chance that
>>> the phylib state machine / network driver may see the changes
>>> which then get reverted on failure, potentially leading to
>>> inconsistent state.
>>
>> Good point, then the patch would look like this.
>> BTW: Saw that Jakub applied your patch already.
> 
> Yes indeed, so I hope Jakub will apply your follow-up patch soon!
> This LGTM.
> 
OK, then I'll submit the followup.

> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!
> 


