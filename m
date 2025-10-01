Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6074ACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 07:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONrm520dkd+lQqlPmyPFU3y1WxiCuM4kiuFUCUUyuHc=; b=koGvuUwNT6oESpRSV4eIhPQJQs
	QUT3lH0Y3arEgmhoRabWFSfuv25Abbv7xsebpaPwMZBD92pz0ttGeSbgnxVCq1sgInQHGSjOaVe9n
	i6o8/yKWOPp5Us/8r2uB637jR+UmESlOzHm7SqU8Fd9TSXJfNTWaMRmtuWAEtu3KkitIHBLkjwnvG
	Kz5FIaBfThix02aqc56dGajeTdGRCxZmUhpuTLEDXuAKXMJy513CQZ/VqsxquNMnVTiqQfdRJ/Xs7
	b7lgqNJw370vEH5+smJutI5Om2326jrkdN0FocmFut/eoC/ZVm+yTtuouC8+CMwr7IlvIk0mbLJCz
	DjhqArug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rDB-00000006u1A-3h8N;
	Wed, 01 Oct 2025 07:25:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rD9-00000006u0l-1yYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 07:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759303514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONrm520dkd+lQqlPmyPFU3y1WxiCuM4kiuFUCUUyuHc=;
	b=cpctPVSQvB/IrzyNfmjegVeU1evy3Dx/ReYgp7UfWbsJlzivR4CzZxb3KusIl79+D+CEZM
	Aq/WGp7f89zNsMUc9C6Bpt5RGqVesMGoLZyYSILn5eLw1ZxQzqndIZR+fSmGBJ0bmU+OGV
	FC2/oIdFOLN5ZIjsvk/Nshs8e7B6txY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-fxrPuYf1P5uoK7iJWHVz9g-1; Wed, 01 Oct 2025 03:25:11 -0400
X-MC-Unique: fxrPuYf1P5uoK7iJWHVz9g-1
X-Mimecast-MFC-AGG-ID: fxrPuYf1P5uoK7iJWHVz9g_1759303510
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e5bcf38dfso3388995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 00:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759303510; x=1759908310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONrm520dkd+lQqlPmyPFU3y1WxiCuM4kiuFUCUUyuHc=;
        b=wxOGCksUcekJ0IKrUdc9eXcQPKx3qXQJxdVrJEycNfds2TYs1Gaq4jjMvWWWE5NRdJ
         R2un5hHVDruP02kKxyOe96jLZl5q1vUSI9cGR77bsP6sc7wHb8jq3QvYpsvyNKCCfd0z
         YsVmATJGnYcRv0mG9eYgYUtCYEWMsinv1+rSVW0Ajfs665fjLFBlIehUN8q/223zlkau
         /t7QOWsun+uXMTRqSl9oIDobErgZk52waO4bw3yg/PEfupwCjLYlDe8UVWCmYO6IiP/7
         LMfkgBk0sxX7bI+zZx/q0RgyPFkFLA4KXQ1zfuzUdD6vjcK7Rpbbji+GD4/3hUtB31m4
         7hXg==
X-Forwarded-Encrypted: i=1; AJvYcCXxm5ec1nO258aW1ZJRCdPfvpTTE6UkbZ7Z2TpO14xGX6KJqcfNND0o7oY3N2ZZL6t5V0mDH7HjqjDZXxrPZxft@lists.infradead.org
X-Gm-Message-State: AOJu0Yypmr+JY2O/kiNac8Lubel6uOI5KBYQx95P6dfWXivnsRSDz6Tj
	Y0fSJzp8zBPXkMNBsVsbNhxWl4jt5eNTbpawItHy7ZL7N0Oc4yk01cAL3/7IMLYden9m7AC+ENI
	7eJecmurvh8l/hzoQqV1kAKCSsw3DppqvK+cn8+saftyeLvLzCZPKAQqRJV7ZYLhbQJpNSPQNwq
	P4
X-Gm-Gg: ASbGncsDqfYPsQcAD0bEpwWoQ9d4HPuZ3I9lOk1wwq6No5+w7rFRrJ9eCRzha/it7fo
	7x9NLddJkdL9ZvJ7Byr9/XygGEm5ra+xfYeslhZGjaQPYv60jbJXZVy1Ve4+ClLyXsn43U2oUk/
	hcKovo33EF509KtFfkRQ5vJPGjL6peKBcq8L7Peyhg8h0RU3FzJZo7HMYV0KnHy6kpW38B2zP8V
	sxiOIDoMPbVP4EDEplXUsMUgqsDc9U3tr0ARblrE9pZIL6LAF1j0VpCNFwlhoSiBhIcvcPljAZJ
	Y9NxZ+K8GF+n2qrYlQ8Rxy6mYJzf/bVi8G+YjbfCNRxjy6/bXeMMrUL06W2dHXPkXXeB0IhC+UH
	6A/IGoI7GtsMzxMNB1w==
X-Received: by 2002:a05:600c:a210:b0:46d:e5bd:2ba4 with SMTP id 5b1f17b1804b1-46e58d16578mr35721255e9.18.1759303509711;
        Wed, 01 Oct 2025 00:25:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYANHEU4wHCl6KF8iSKnSJvFPjuGdoHZjMN7oYFUa7TE3yY0tBZuepifFCIEmjJ4HCuCIziA==
X-Received: by 2002:a05:600c:a210:b0:46d:e5bd:2ba4 with SMTP id 5b1f17b1804b1-46e58d16578mr35721095e9.18.1759303509297;
        Wed, 01 Oct 2025 00:25:09 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b8343sm25823335e9.2.2025.10.01.00.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:25:08 -0700 (PDT)
Message-ID: <d5aaff54-04dd-4631-847c-a2e9bd5ad038@redhat.com>
Date: Wed, 1 Oct 2025 09:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20250925191600.3306595-1-wens@kernel.org>
 <20250925191600.3306595-3-wens@kernel.org>
 <20250929180804.3bd18dd9@kernel.org> <20250930172022.3a6dd03e@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250930172022.3a6dd03e@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zlEekFPDIXEllNmCN06vh9C6Bfl8nbQXG67EHzwT6eo_1759303510
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_002515_591363_6B272C96 
X-CRM114-Status: GOOD (  15.18  )
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

On 10/1/25 2:20 AM, Jakub Kicinski wrote:
> On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
>> On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
>>> The Allwinner A523 SoC family has a second Ethernet controller, called
>>> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
>>> numbering. This controller, according to BSP sources, is fully
>>> compatible with a slightly newer version of the Synopsys DWMAC core.
>>> The glue layer around the controller is the same as found around older
>>> DWMAC cores on Allwinner SoCs. The only slight difference is that since
>>> this is the second controller on the SoC, the register for the clock
>>> delay controls is at a different offset. Last, the integration includes
>>> a dedicated clock gate for the memory bus and the whole thing is put in
>>> a separately controllable power domain.  
>>
>> Hi Andrew, does this look good ?
>>
>> thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.org
> 
> Adding Heiner and Russell, in case Andrew is AFK.
> 
> We need an ack from PHY maintainers, the patch seems to be setting
> delays regardless of the exact RMII mode. I don't know these things..

The net-next PR is upon us, let's defer even this series to the next cycle.

@Chen-Yu Tsai: please re-post it when net-next will reopen after Oct
12th, thanks!

Paolo


