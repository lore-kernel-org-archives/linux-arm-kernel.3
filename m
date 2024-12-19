Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CC1E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhXU90riflbMMXXiNNRfoBPN4nWysFB0QvF1+RIxPmc=; b=Urf+kNomMbPH9Ud4f6KQTFb8Tr
	B+1uKpIgfiAgPTMZGC3sRpzTbO3F96WE2PhAZ4JVB9qOLOnj5Ht+KLd5GZHDbxjEWC2ENTxR8UjEw
	ETK5nb+nq2qNXYWH4n3DTJsUCOV4EqcVTBfvHQkb04d/VRiFg3gWSBXClF6lrBddPLhkmBxvbDl77
	agzi5Dmd24Rl+ozlsJlAFkWIAtfj4YW/A/UmgVQnVRfm9dPCEAB67qjFidZYcjb48URJaB0EgIqz6
	8L9bc4yWNVqyKll7seJIR49Z8Vrjr5hDKTW+oML9bGysj6KewN4MbzMbD91VsDBw2XqXl9An8cE4o
	+8tLcJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCWs-00000001MNC-13ru;
	Thu, 19 Dec 2024 09:09:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCUz-00000001M63-3E6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 09:07:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso477727f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 01:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1734599232; x=1735204032; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YhXU90riflbMMXXiNNRfoBPN4nWysFB0QvF1+RIxPmc=;
        b=BhHDObaZBwjQcaJfeLd6cl1jj1zVlCtBSmKhVy4dmwhHGYIP+A0BgWVukmYhuTHmic
         t4Tw2U6PU7jigIehE7rWzkTL5WS0Qz0OWbS8whisArZ91lxDKCyu5BiNkvcX+laC5Aqy
         PzsHHbi8L6rJXKFL0SRE/ZWH38Gz6CZe2wSeypOym9kmuqxHsnVVARHBUg/cLAMXbMbI
         bJJXUnH3T0o4fSAg4/EfrnAwtKOFnnb6h5qkNLluKKXSH7N6+xux+HafNeSpxSxTpFKY
         gZ2Ye3OZQuGuHCwwpcR6keiM33KS3exuy/MRxKT9sz97bJdC9FpP0MFByh+8F7Zars2f
         6Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599232; x=1735204032;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhXU90riflbMMXXiNNRfoBPN4nWysFB0QvF1+RIxPmc=;
        b=sKriGdUubBnAoHRS/C6z5WSDjocV6aRUZl30rLorr6aspzXuhTHmJyJqEPPv+Gp4Ot
         Y1ARySElYWLr3EO4K1Mhpjs0oSpFuLAiTr0YuUNDBAYmWpmpU5dFHd3H59zoPu3lAq3H
         JgGAPauqmDAucycQsR1umBwVYYZHjDnxOLzRuc+8eZuuoWFgITe8m5J/cANGet297vb2
         oWRXMZFSevkDK1I9LXaWUxs3mWijNDgRpMdSMYvlqz46rxciMuu16Ajmrw2ONWH63aR1
         XE/wMtH7QoCNUefCDXtzTwGb01ZUnE1aR0gZn5F4+GGm20YbZE5LExveBzDPUxJBS/xt
         yNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+awW+qWuNBKkbyqL/kacYWVrCqRCIthiQlJ58IEfXSCgi07av/1CihoCaZC0YFDrTt65FkqhVDTv2C2SGNtfZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyIpydqLZNdcm/83yD77rLKFdFT1+LVsfvMs3FBO1/BrAMXNycg
	QvLKLciGrbzMy5vWDDpcfLE/Ell84kFILcxkQuserBohK+UxqfbWrad/jIeERjeeXbzuqAocQzB
	6
X-Gm-Gg: ASbGncsCQzbAhXNcBOvNWqFjgWY6IhFM+57uv2bQOS+a6wGeUurZz7VDoO2Yb3PnREq
	mPCTiI2o+4qo12wwNpkzGSEFGL3a/f/ajW4cHtz2U+KCET0k5CzpS6myw0r7tTUdaE6qc4RbX27
	8EVBL6e/DyxOm7gXDQU/d3G3xDYcbnqL4mybyF7loq/7klPF3GMivHgq7RZHX6fYaAdtFLltPEh
	fxtci/PIuQWSTVg3foa3WMobMCIFlDlQLqfXeCDJv/eai+vGWVQCN76eGI2nxjpRQ==
X-Google-Smtp-Source: AGHT+IF7WYa1QHYe4An4vUxQWS2KauZ22DGqQxC5ejjoWjVjb7f9ys1QTxnqb2k6m7oIcFBfI6DzEg==
X-Received: by 2002:a5d:5f56:0:b0:385:f996:1b8e with SMTP id ffacd0b85a97d-38a19b0504emr2588375f8f.16.1734599232117;
        Thu, 19 Dec 2024 01:07:12 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b41904sm45606305e9.37.2024.12.19.01.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 01:07:11 -0800 (PST)
Message-ID: <1e2cb493-f645-4448-8df9-e6c19cb96a70@tuxon.dev>
Date: Thu, 19 Dec 2024 11:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ARM: dts: microchip: Add no-1-8-v property to sdmmc0
 node
To: cristian.birsan@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241119160107.598411-1-cristian.birsan@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20241119160107.598411-1-cristian.birsan@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_010713_808998_BF4B6385 
X-CRM114-Status: UNSURE (   6.39  )
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



On 19.11.2024 18:01, cristian.birsan@microchip.com wrote:
> Cristian Birsan (2):
>   ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to
>     sdmmc0 node
>   ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to
>     sdmmc0 node

Applied to at91-dt, thank you!

