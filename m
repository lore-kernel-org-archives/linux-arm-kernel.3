Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFD8D79769
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 11:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmuSv2QmfBZum+GcyEyFfTktPLozfuoPR4C1tZRIupo=; b=dBc4L4P0kJmSwXwNyKTAG1/UTB
	9jyY4GNUBNTfKmmjh6ogBeld3mNQcPimiEpY+1myOEFYKZkBn+Yhvs93B6pX6+xWwc6EKfO7OqHnn
	l8eTBI29FcGmciSmISlaFsPA78+vbaVaVZRuC6MMChI8NET7878oWGUBDaa6xIgQ7WIGindJkqxfW
	zhQ71TZODyk3OB6sptQX+h73Jf9VbNnlJOWxtHiGUFin5a4eTD4dsodzMb4CntK8YD5toFlur6sw+
	ZCbqV22K9X8/tVauhiBbeC8ZOk6ScHsWKRKf8EZ9ov0rwINpX8PNhRdQuywetBjrEZwfTtEDFiGvG
	z/e7Zz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8k3-00000002WCG-1Lwf;
	Sat, 31 Jan 2026 11:02:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8k0-00000002WBr-02jl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 11:02:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47edffe5540so36064025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 03:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857330; x=1770462130; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tmuSv2QmfBZum+GcyEyFfTktPLozfuoPR4C1tZRIupo=;
        b=aCfaKA+VtlCA0H+08+Kjy8y3FEfG7e03qqWKU3hOg2AB6zZp6gtDKJL5Byedi83PXz
         3N72vPsj02lRGy6XlAUdfTLPP1ennfDGXPLx51QkEiLLuVCnghZEFUeviuIkaXJ7HkgP
         Pge5TbI7mRTHwfACdGtOnAqD1ER3C7wfkpdZGsv0fgcrRp8QK/AifS6TTNY/OQepdB5d
         FZjzmadSxyGJwB5ZmnHRkyEhIDftNM1QKBgjVsvIKtR3FAhx1oKH0HZxadkoySz89zab
         TgMWEFX+iGgbVxSFQnz8Jd8p7y4eXAkx/1KEZtPqYD/acGfxo97Lo+yau4/A3u5a4TP/
         /rHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857330; x=1770462130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmuSv2QmfBZum+GcyEyFfTktPLozfuoPR4C1tZRIupo=;
        b=neTU8vIByLdOERMnQkJaZXXUWHiccsZVZaqpTiDEvzoEsMCbRIaj/TxKJamdnYUCi3
         lcMCDNfxdphOUGZkmHocP2j6V1WNMUwZHHWvAwuLDcnmKXi/hMSL0d6ckEDbpafbwAVP
         YTzdU/uXCI9937eoghg5Fz4hsNihAfWsR0RNoOrdXYeHWATLqkFxabI64Fkld9p1Tl+0
         6TfubsmGMExn6T4oMNd9dR1Yblc2c+J1YL69I5mbSHOdPTABgGkJDLADNzUY0E5CNjQi
         ywKgBCrvTg9KcO7Y8BmUt2byl+o9YgiXP0HCQiqHzVFOV1Rqf+7qc8dFi1dh/iCkTacI
         Aqhw==
X-Forwarded-Encrypted: i=1; AJvYcCUXzzfp7SQI0usPLsUWnpnIeaU6mf92nJKtW0O/X3URooQYIEBY5go8qvkQX82eUML84dBY67OdZO3MK4Msqy1B@lists.infradead.org
X-Gm-Message-State: AOJu0YyPY4y5fyPRPgf6vKxIHCIR9iEAtkTe2iNFNXaAmUuRKXoVUgi4
	dOKJDMrwsiLSzuIZghzybFIk3Y0WxNtDPZowQCewgpoGW36zpKgAT/RjGhNcxXAph7I=
X-Gm-Gg: AZuq6aI6FqLYKwpeR05g6kUOK12pvpLWKy/yU4lrt15bLBzj5urOxz5k3ZIhx3yhXui
	ovakGgdw9dtDDto9cHFlQW/h4USGyyAHG16NmLgCXH0kqm8xvarOU9aBywghzGGc+ecqKCJJBq7
	oP9oXX9MvBD/f0g2SYINz2PFrony3iKia5BhTclo9+a9qkUxpnc+XbPdyNBvD3NQNKZSuyshMz/
	jYtaTcpnNWnkDiOXdvMQ45P1VIlRxWvQYY70PiutbunFjW7KNSW0NdntGwlhkNxnnrAnVuav80G
	LeFBj5853ygMOtAIBxMAlF8zAKe4R5VhXe44Cb2ruZowX9KLUNlvxYOtbeJhemoasqFh8oQ+Wpn
	B7hvXKq+Lu+e24MK3HlGL/WMbS6yo5TocY7LQTMf45mK/p0AhfgKHY+N+RpHY+HAtHtivrA8cFn
	47FNJSK77zFqRRahc/CcOI9ZlGODAnURy/mm4=
X-Received: by 2002:a05:600c:4ec7:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-482db46b04fmr69444905e9.15.1769857329727;
        Sat, 31 Jan 2026 03:02:09 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd77b8sm257266965e9.3.2026.01.31.03.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:02:09 -0800 (PST)
Message-ID: <a400a729-7176-46c3-ae08-d69cdc3ba3ee@tuxon.dev>
Date: Sat, 31 Jan 2026 13:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/31] clk: at91: dt-compat: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <a3d52e30d624ba3859d9d3ba6fe8b8194b833c83.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <a3d52e30d624ba3859d9d3ba6fe8b8194b833c83.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_030212_057354_163DCF82 
X-CRM114-Status: UNSURE (   6.04  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch old dt-compat clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the patch description adjusted as mentioned previously:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

