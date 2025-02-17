Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE79C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B74dWrHkdsECoNtjQdU0Obn3rg7n8WfP2B8f9PshJuY=; b=sIRthbToYBLw85ltAvkSi8FWdf
	3+raG08SO4yLYyfQ4EdLec9RNyHh63QUsbm6c3v63anjE3JL+KwUaKSV8OTDrqm8ptSIioRh2EY9X
	xZdjvy6+atuNCrdJPAlywi0mKoXuY/aXqzrPAwdrFucUatuMgUylVbgK6bHgeZRJNE4v/mFmtESTD
	hbMx/8KDuhIBAa4pCjgyJSJR+F54iTBSQoIz2iEA+1bL72uH1y4NsVA1PgPwLh6mX7bY00SBPIPwd
	F8h/rcUwxOq/hXDEv+EaZMEEI5pJItca5m2V5G5J1sAitin80PthfzSDHqz81o99H+7+jvTeu6e8X
	hnpZnybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxTw-00000003wEY-2V0C;
	Mon, 17 Feb 2025 09:32:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxDm-00000003tlw-2wuw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 09:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=B74dWrHkdsECoNtjQdU0Obn3rg7n8WfP2B8f9PshJuY=; b=RBQhA7uHxmwbh6u0pouzOXjHOn
	jnwrWZ17+dogFlqYkPOQQ3xrEZoM3IoneJObGScLyeYefJqfWAvmtrj+cQBguW10XfoCLcqJlHz4h
	p1vCpfieD0K1yEj6Rs81bvr9zqDtFTzAvS4Vk/sKhLVJDaCNKe9ZYg1AqfZgcq/28KwoR7rQjeljJ
	J2yTYgOqZpLIFvbuePKkDBSVuOBMmB9m6OFRHrMf84kKLt4CPaAGZee4KYgGGCB31AOBWBGnX/LdJ
	qM7LF2dLITZFNPgezzzS5kLMz8jpVKF6OkGrJrYAUv5CfI2UYenJt5uoOFmDEEDhr+DXX0unjH5Dj
	YzJqyDng==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxDj-00000001kQr-3HcM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:15:21 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso1815096a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783717; x=1740388517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B74dWrHkdsECoNtjQdU0Obn3rg7n8WfP2B8f9PshJuY=;
        b=engtgJ2DDxPTTkKGh6gKpYDtE94Lj5wp/7bEk5AJu8GR8t/J1AnROJ+LuSQJNQHTJ5
         OprspOhaiCNj6A7aXkk2Io9FMdazUtvlOOs8qco0LBxIcZ9fzUFIp3ytEKK2S9nFA6z4
         UJUn38e3YkfOmLJougUKsu/0SQf09jdVQlELhiUeEgToGX0KLDTOkS2pIGCFKnVRYlOQ
         jQzyzuCN0aEOri5wtzYMnyPnxq+hOEwbvEjYnwlex+volsEGO90uRffrSsVBhhre8Jpt
         GttWGLw+2EDDe1U2B+PT6nnPPyzayeFYDFGGooGi4RkHkl8QmedmpGBb/+t7at7epHfh
         aH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783717; x=1740388517;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B74dWrHkdsECoNtjQdU0Obn3rg7n8WfP2B8f9PshJuY=;
        b=bZBXtZnxY2RHkX92czJR6ClHNz8a4+ugPv4HNrukEaroXiKJA7mL7/OGubunswJqlu
         E1D4pFqOC9McrIPU9IsP8HNZtMRws1bS6Qie7Cw+xVjBiLzlkhrPfE2FoJgQAQcqmwaF
         12s2qtX2NYBbKKMTJeF9+O8wo2PBUsozEhon4ZOXaLxtRh98q4/r6gdpCFgdyQIREoL4
         upBFur9fuHHLAfqt3Yi56OZu7IJgIJYSbhduzcQvR3iI7pN8FSy1ktmCxllJNl+LzlRG
         KGVvEdUlqen3IfoWaSfkWt4N+p/W2KZTZZiJB79OvW+tkn5Ju78WdQv1xxTg5mM2vaxh
         52eA==
X-Forwarded-Encrypted: i=1; AJvYcCVfg4Xsf6Ok9R0zACf98ttj46otdyakfulaqYp+Ftx6sj7czPFO8s9903AbmCcVtkBoRuDsMA23X2UXLqabdrOO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi8xHJ1CmOEo6eDevErO9R0IRpdcN5aF4GSNAR1u+Y3H0gE/jH
	McPgertbLplh//IHxgoEEEkLS+hQCAxrPvJSzsyHB2VPUGJw17qx3HT+wwuaOP4=
X-Gm-Gg: ASbGncsjYQdiVxiC51ucUngWL1LCCWawvzP/z2FM3GrCZDUXfpsiHaz3wEwB1u9VPmY
	Kshg002RfhoRzt5zvgCIfH1IhPT/UYvlUFRhOA5mmRFgF2TcYayG/EmP7+a5IeXsNVJop10WJDt
	F07nkNwGY8B8EZwqVZCj2IOJZOBBFxTvDrAf3F1P//N56qVwlHdHjbxVB5xE+O5i4aQR2dVg2Tu
	A3s7RnsNOvk4yUSAm9BAgSsTL2PoKngyTNq9XalQNFUNf2YO2pL1IMfDXABfqtF1FxC5Tqn5Fwl
	LySycV3koeapueF9UjbC4RU=
X-Google-Smtp-Source: AGHT+IEMrhkZcva4RBS+kkon7q84KVXR16ulAthaujUtAZ/PxslVHVSNe/geC5YVpS+ivaoXq+QuxQ==
X-Received: by 2002:a05:6402:27d3:b0:5de:c9d0:673b with SMTP id 4fb4d7f45d1cf-5e03600514bmr8825804a12.1.1739783717480;
        Mon, 17 Feb 2025 01:15:17 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270b17sm6933732a12.62.2025.02.17.01.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:15:16 -0800 (PST)
Message-ID: <15ab9baa-4644-4b4b-a6f1-ac71afe8465f@tuxon.dev>
Date: Mon, 17 Feb 2025 11:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add power monitor support on sama7d65-curiosity board
To: Mihai Sain <mihai.sain@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250211143302.4102-1-mihai.sain@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250211143302.4102-1-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_091520_019561_6D1DC594 
X-CRM114-Status: UNSURE (   5.14  )
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



On 11.02.2025 16:33, Mihai Sain wrote:
> Mihai Sain (2):
>   ARM: dts: microchip: sama7d65: Add flexcom 10 node
>   ARM: dts: microchip: sama7d65_curiosity: Add power monitor support

Applied to at91-dt (with some small adjustments, please check), thanks!

