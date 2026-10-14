Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF23CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=; b=BupfkSbm0QrRK2NGEWi2kQhDBr
	IbIph6wLsx0OlDVCfttaEqwZPaKJ0NDrDnidbcABKpP5GW81qjM+Y/gRBF/GVwVEtgmxGJgFQh1As
	6gZNWqrE11qxvdIq25YurdgPnP4KhZVZ1WDpoZGPL3ybSq9ZDISM8KIm130H0Tch+WZQvJIOnwn1R
	JRcl1TbwWhHrPu82S67WW8etmeYKead+HC9FSOUoUCGFraOH7b0nW/hz6gIDtfMILqCgZlNaJwfto
	QX04tVMSv4IsfCZUVJ38DCePe6z7Cc9nFHsvl2pRhe60mSjvxIksXS/Tc5JSYzVLcLgZ6nToFg0Hw
	aYBFtELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvqp-0000000FAAY-3nWp;
	Wed, 14 Oct 2026 10:04:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvql-0000000FA7h-2mjQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791972281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
	b=E3A3Lwxfd7RtHnhyYfATiE8BMQATbHnPK9oc1dT7N7P5ZPGhQvg4t4/dnyFRviLJz1+2Ei
	RlBOVjkSICZQ9q795spDONdTnBHpnytetCLTHysXkMXnFQgkh9M1fXcNDInAO6TocEhoF+
	xcrlqsqJh6roi/lzd5luTmyFv/xCjvs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-vk7HrLMIPWqWqTJt9PiL1g-1; Wed, 14 Oct 2026 10:04:40 +0000
X-MC-Unique: vk7HrLMIPWqWqTJt9PiL1g-1
X-Mimecast-MFC-AGG-ID: vk7HrLMIPWqWqTJt9PiL1g_1791972279
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso8869455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 03:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972279; x=1792577079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XemIgLfXAXsX5F5DvdAMtcb2KhZv0+MaaLg/MSFJqAo=;
        b=xM8841k22C3vIgVx0e73sbgylpW9qCmci1ukoxPhbyFFPuCMafhjJPCrD3NZdWUdUd
         5FqStEHNHUwAs830DEulbL8BQ/grl8cr/ZvCUb3sQnNp+tGrT1cum3pnwvcz1c46PeGn
         eOZNT9cwMDNA2e5k2Ui9C6ktoJJLZ9VWJ6LEmgauYYN0zgfcbuLCnKpvUWzXqQXMnssx
         31hPIANx/KFXMRq0+AvaTZNe717KH8b6oMVH5pRKSwBepO52nmw1Xe7n0MvEd8ojbAh0
         D//75dbZN68FtpL1mkMKndiPEfWYJ3NSYMuXA4P7yEpqMRb9aIyNkWyhXMg/cjrZ9w3G
         Gscg==
X-Forwarded-Encrypted: i=1; AKwUvBxI4rEuAmyqOUEq8ZR4M63rod1X3IW9XNKTQGXRLEhZ+NBIaVsfOxQCX2K1V5EwSJ/cDbOEm6aZNmdsWOUq2aYB@lists.infradead.org
X-Gm-Message-State: AFq9FYIntCPF1rtyINviULj0A4kOa4hgJ6SjN2uJKE4UAxpqWs9YoZJa
	KN7J6FlbfqNm49ozUV0ULVKMb/NocHisnPh6KpjcavSxdR7N+mCZNJC6AiB7BJIH9yG+vEvHk8V
	mCff2hAwxNOP6z4SjQesd5UG5wnfUmQJTjfOJBpgpojl6quDFdsTvRSHaxkYeqqmp/OI7upngYu
	lU
X-Gm-Gg: AYBFou3EKwi3go+dFGPGjtZFe5ECx/gvTE3eARpE3ELTKNvpP+0NChVdFz4mHMl2ziP
	1XF0yd8JLzIHV1E5FYD/t7i4iGlaelJvhffgiZH7TWruG+9DtXWET1L+jnw4KBtkXWyqZOFb/h3
	tuoC7XsdVrqS1MURR91lxXMOFFe5uMlPKkp0ZS6bW7JxqbwnO2WQnyO6horCckqdBF2+XoZPjd5
	qGRtHgJg4BhunBUj72zYW2GHwbpL0UAKrS0Usbo84TOUZ7C/JWXpay7AwPHjKlkosEdImnZGh7h
	auNrwmurqdXp/GQNlqGIJ/h7ViOaPoEfe5H3hzngi1MvG9NHhlkcpEhLZOZvWeUQvwHzBaC1hXj
	ulXxj3FhHoEgnjmnCHkUoTLj+WbGwG1eXiGL1fcrnIiIUGYSwzItq7wmltAuGmgDMIvJTynukmg
	==
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr101285235e9.33.1791972279252;
        Wed, 14 Oct 2026 03:04:39 -0700 (PDT)
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr101284465e9.33.1791972278755;
        Wed, 14 Oct 2026 03:04:38 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm419838595e9.14.2026.10.14.03.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:04:38 -0700 (PDT)
Message-ID: <3d3b9f10-e3e8-4d50-b543-0d451cb07598@redhat.com>
Date: Wed, 14 Oct 2026 12:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes
 after the MAC
To: Aleksei Sviridkin <f@lex.la>
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
 <20261013151233.2474217-1-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261013151233.2474217-1-f@lex.la>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MOBqD5KAAtPq-1vKTZ--5Plah-JFxZWDJy4vv2YjdNo_1791972279
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_030443_789975_3F7D98C2 
X-CRM114-Status: GOOD (  16.95  )
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

On 10/13/26 17:12, Aleksei Sviridkin wrote:
> On 10/13/26 09:53, Paolo Abeni wrote:
>> The above looks like a significant amount of complexity for OoT driver,
>> and I understand it could be solved with a different kconf?
> 
> The PHY driver is in mainline, air_en8811h. Only the board's device
> tree lives in OpenWrt.
> 
> A config change can avoid it, but it is expensive here. Building
> air_en8811h in is not enough, since it loads its firmware with
> request_firmware_direct() from the root filesystem, which is not mounted
> yet when the switch probes. It also needs CONFIG_EXTRA_FIRMWARE with
> 144 KB of blobs, in a kernel that OpenWrt shares between every board
> of the subtarget.
> 
> Is that the expected answer for a board like this one, or would you
> take a smaller change in phylink?
To me this series still looks too much churn for something that has
alternative options. I would like to hear a 2nd opinion from Russell,
Andrew or Heiner.

/P


