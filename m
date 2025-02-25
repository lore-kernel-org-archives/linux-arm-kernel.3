Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CC3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlIg0iX5rLeI1/17Pjh/O9LHmXIOARF0OAc7AU9Migc=; b=ql6IinNbP1Yypjo4zaPI0ouF4G
	l8u6J/UKKpN5m8ytW6p92++jONjIMFCYa9RDWOkHH11YJsNp5jR0OI7BWtFFyBWUsEGjXR14rAlVr
	Gjqzn1SJYharJVo/ZUH2k6EB9jGRfi29K6iKaiHyBIs3vlddMYiggFKa6QbN2T6/PggqfZSP4C26a
	pHPBUFr63tFDKzMYfNg/BpBpwyvNqH6oA+esuAqoBn+MvhOrFvISxmG49DNzLclRr3RmXzzM2QUPD
	nhYWzmtsKM7tuBzwmttYuIjaCq0SAlbCPKoIvvAs387/gSfwUJ3E+i2+CHH+MN2Jb9HaPNuTv8cmN
	LiZiT9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrVz-0000000Gfgf-19CM;
	Tue, 25 Feb 2025 09:46:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqz7-0000000GX3B-0xHi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740474732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlIg0iX5rLeI1/17Pjh/O9LHmXIOARF0OAc7AU9Migc=;
	b=MbtKSI2xQNk/V1HxCMrVWJ9W7oqf4wvFgsYbF8OazDcVU6pyNMi/2jqPPNz0/SsREasNM5
	2CQzIeZeU4+JqekhMKe9HZY7fCY0H76HShxF6FEHyao3CktoE7HxmC1GE4twD0Dhmojre6
	x3aQju7X6k6E0V1mI3l93z5gTLdyiL4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-gZfHinZqPp2ifx9XNHR0rA-1; Tue, 25 Feb 2025 04:12:10 -0500
X-MC-Unique: gZfHinZqPp2ifx9XNHR0rA-1
X-Mimecast-MFC-AGG-ID: gZfHinZqPp2ifx9XNHR0rA_1740474729
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f4cce15c8so2513754f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 01:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474729; x=1741079529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlIg0iX5rLeI1/17Pjh/O9LHmXIOARF0OAc7AU9Migc=;
        b=IlrbqiQ01JE7xgBCxpE+GyBH3C119JLlRkLijRaqBiAgRZaLQF7m+b989j/4yFaFrB
         GI/OraijOU4ZWdZPwzXVGbbr87LLatYeZ9CWYNdFFKdd2mxnAMWHG6VUPuKVQrbAF4KD
         k6pzD1TzAUwBPoKafuamsOGd63P2VqEj+/Sys20p+NnI0wlTyLtPz1hIMtOcMeif6itC
         armeIxvCugsRq6Sz9lWciysC5tCvxTgsClj0pgACQgHh/rJGH86kxnYlEIcnAnB7xNkC
         YjoyohGIEEbYgbQTqpoiYfYcTKCPtyATrLrRZepaVIM69EjWY/RXuLsx7ofqLbh90njR
         OxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgVupb/9WPCC6KbpHiJ9JrYBLji0D2YDaXHnYM07fBMdAney2liMq5ubUD9N0yfsEcJiZ4y9QowVosuBrfM2on@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd5y/4j/yRTLmC2ymhBe2ssSk9dMjjZdLtnOBDilzl8ohAQDmA
	k7CXQAwsU20wayXHfDS4+sJG+gNbzIg52BP6u7iEoOR4T9itecEzv/E34C7gY7kWjDmb5GPMjb/
	GRaY2vbnHgHxnivHVl/TQCe0aC4ncYEj14L8bfFcubOxYztAD9vIwxDXMpxueLbpBTOO07/ep
X-Gm-Gg: ASbGncs6IKBWCKMR/4yYVBnvii3LMp6mH0+EzHUeuH350DFTQdp+5tXqkPRp6oZyra9
	EEOcUid3Ee8RewC0793E0F/2923WXMJWrjaR2GUDYW2WMjvBG20NQorGZ2l9wahOOcr3732yAhG
	IxUnYmCnzGQtGc1+k/TyBsKwAytW8D0SRoiYesUEsx75SZ73oFDVeEVk8qwys7DU0Yjoqeuv7+a
	rwKkFoC/VV0GbFO9dokGaBCNsdXSnvHzvY2PSHctJ8F29ycwDWWXtdbniYeTdylPKN7o+6JF5j3
	5HYdjo39nYkKgtUBK7N4KD7Ow45lI77B6TiRIiMXnnQ=
X-Received: by 2002:a05:6000:1548:b0:38d:daf3:be60 with SMTP id ffacd0b85a97d-390cc63ccf0mr2071749f8f.48.1740474729263;
        Tue, 25 Feb 2025 01:12:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEolJkbGKjJj6h9uEQW/S7a4oRbKctMUQh95C2XKh9ehqDL16AcT96CB9ug5umxMfHDYCtt4w==
X-Received: by 2002:a05:6000:1548:b0:38d:daf3:be60 with SMTP id ffacd0b85a97d-390cc63ccf0mr2071706f8f.48.1740474728801;
        Tue, 25 Feb 2025 01:12:08 -0800 (PST)
Received: from [192.168.88.253] (146-241-59-53.dyn.eolo.it. [146.241.59.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd866dc4sm1624406f8f.11.2025.02.25.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 01:12:08 -0800 (PST)
Message-ID: <910cae0c-3d45-4cd3-b38a-49ab805a231e@redhat.com>
Date: Tue, 25 Feb 2025 10:12:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/8] net: phy: add getters for public members of
 struct phy_package_shared
To: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
 <20250224180152.6e0d3a8b@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250224180152.6e0d3a8b@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ph1fKIPJxAPZL4Pec3h1eza0nNZPl__nAw4ZPvrt9k0_1740474729
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_011213_353133_D2E173E5 
X-CRM114-Status: GOOD (  11.01  )
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

On 2/25/25 3:01 AM, Jakub Kicinski wrote:
> On Wed, 19 Feb 2025 22:04:47 +0100 Heiner Kallweit wrote:
>> +struct device_node *phy_package_shared_get_node(struct phy_device *phydev);
>> +void *phy_package_shared_get_priv(struct phy_device *phydev);
> 
> A bit sad that none of the users can fit in a line with this naming.
> Isn't "shared" implied by "package" here ?
> How would you feel about phy_package_get_priv() ?

FWIW I personally agree the latter would be a better name.

@Heiner: could you please give that naming schema a shot here?

/P


