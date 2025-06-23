Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99029C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4RaWpq0ZKRdLkixVIJe8lYt976+F2RYcsNhNiQu2Tg=; b=OpCnF/djEENIhC8PzMn0x4cLH1
	rX3moTQPqZJS+qfSnW2sCuk3url/asSYjSnrXYpxsrPdELaXTU2LWkC5F9MafLDfsX45e8CZO80Wr
	FzqxBPoX5K9hBJMUf/euVcfjE3Ze5dIVRMZ/uhZuKWDrdJYJVXZAS9e6HGVFfZHQI8Zv4dpIDjxSX
	Owqd1KlVXJLTqVrjr04Ep35DZH4wbSCiY7LZgszdPbsC33CpE11foAx3LgGtnFjQNCn+QICutqcNy
	51YZ7eIgXclcojlChPZUoI7hdmCGYp6kcM6c80kXLVnWqSlNGHLIgIoAncG0/vPM2PHOq9f56onjc
	l5RVs66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZM-00000004FEY-3MbJ;
	Tue, 24 Jun 2025 00:31:24 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi1O-000000031Nr-3SDO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:19:44 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-adb2bb25105so682091366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750688381; x=1751293181; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4RaWpq0ZKRdLkixVIJe8lYt976+F2RYcsNhNiQu2Tg=;
        b=IGySqNWMCTXa9ehn/gBwZ0OaRCZgETG5zKxFIzkY3fjulBFxYuPzF5l/lLNAnCA/Qg
         cKWsUcN6u6gDSU9Twj7kCqpwTVQein5Dqxkz1tls3TOR9NK4jjaqvm1DVhBHlbja1a2R
         CG2n5Ah5uS7VW5DEEeI29QfgugwtzG3W4ARw8cDfT08O9U9skWUiYiWsEas5uo2vIxwG
         xzxdSHDiKpO70jMxcG5AAQb7MNd1tjvduG1Us5qTgV3wkHTZbBZNrU4safTB2Qd5KZof
         onES1fn3hGY9bm6VtTlM+ZlaynRH/d1spqm1t4UIexoXyttL1Q9PVP5kBohRO0vgTVqA
         vbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688381; x=1751293181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4RaWpq0ZKRdLkixVIJe8lYt976+F2RYcsNhNiQu2Tg=;
        b=gDmFHyDpHufcX2K6a2I7QfyV5HzlmZfK/ryTRDXElXqfG2Jm8eVtdXDCM1zPHsmhn4
         zNQahgR9Ja6v75wAy372cW9X5xeP/zB22zMUYk6U+65Ez3mwznIfvg7/+DfBDM2TICEU
         14IhQfU+BEI/tPZe/5UMqFlGGn7Q5OVR8FvwWklFKv9ZUmtXwW1ITZ7+q0OUNCou8Upa
         Gbdl5MNFTEmyuP1Wv77DxQkbva627+qkacaFVlB34AXXthff0CeQnB+flKaI9hG6jMC9
         nmqzyZNE0F4jd1ZDjsGYfGaQEm+2wZEfVuis0QIHiZGb9L02EaDxorKytPR9vaqWdflE
         2oQA==
X-Forwarded-Encrypted: i=1; AJvYcCWc8IE0J3Ciaorb7WSSaiD+mmMpu+lEXiK2UO7XjmsA1VcSAjEQvobETkLB4vQDunSUPd21vagg062r/WaGvx9I@lists.infradead.org
X-Gm-Message-State: AOJu0YyAg1u6bqgHqQZVQHfTb6NyLNEOMKBVCGV5a+KfXHtHZ0SrVcsN
	ol7fQoesWiDB1KszEankRulCJuN2QErcsd0f3KhlmwQ6VM4ej6W+yJC5
X-Gm-Gg: ASbGnctnsGY2PO5GiaHhfAIcddO2NJTvhCMflv/2/e1Jok3g/ci8DQ6HjJMNRiK2HTK
	PqG6cg7FK9/AIvTUGRlZpCV5DoFg5OIl8YVMnhQQjQG0RsFgiK03AhbbrVC1bnVba9j+j0bIr4c
	HYejcW7D6nrA5l3EAlIYxcf2yGZ8PoDE35j94leeC8nZyqfsJt3WzWPSvJidiISvub6J2x6TJOg
	GV4kXunr6hL7Ai9PksC9vcueN4BWskEcTVcQQ7UpAfoBYnz9Zvw4gMzlHsj5QLVbShlhfa0SqV2
	Zg+XoklFL/0XvwsFfJFbhI8d8woNGUywq/EiFygLpdx/53K22EpCuyBO4DWtVjQIpnB+4ek=
X-Google-Smtp-Source: AGHT+IFysmPAl7SZsmV9pPCgEFPxil+tuIOlJgMNXwTSQbww7umYOSo53xU6pPPX9Cpuqly+9XmnGQ==
X-Received: by 2002:a17:907:6088:b0:ad2:3fa9:7511 with SMTP id a640c23a62f3a-ae057bb8dcamr1242357766b.41.1750688380845;
        Mon, 23 Jun 2025 07:19:40 -0700 (PDT)
Received: from [192.168.1.150] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054082d0esm719221466b.79.2025.06.23.07.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:19:40 -0700 (PDT)
Message-ID: <0a73b9be-d0d2-448f-91db-209f0d59198c@gmail.com>
Date: Mon, 23 Jun 2025 16:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620122353.150700-1-goran.radni@gmail.com>
 <20250620122353.150700-4-goran.radni@gmail.com>
 <aFVz48C3d+HHVHvv@lizhi-Precision-Tower-5810>
 <00cf9c47-e101-4335-b918-f0b3a3c71de9@gmail.com>
 <CAOMZO5B39pBzWuXBoo5=eqQzZLxS3zBxCJw_GBYmABKT_cdQww@mail.gmail.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <CAOMZO5B39pBzWuXBoo5=eqQzZLxS3zBxCJw_GBYmABKT_cdQww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_071942_862561_7A4D1F7B 
X-CRM114-Status: GOOD (  13.62  )
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



Fabio Estevam wrote:
> On Mon, Jun 23, 2025 at 10:17 AM Goran Radenovic <goran.radni@gmail.com> wrote:
> 
>> I was using git send-email, and I did not notice any problems with
>> dry-run. I have 3 patches and a cover letter. All were marked correctly
>> v3 0/3 - v3 3/3.
>> Everything looks fine here:
>> https://lore.kernel.org/all/20250620122353.150700-1-goran.radni@gmail.com/
>> Or am I missing something completely?
> 
> I only received the patch 3/3 in my Inbox.
> 
> It seems you missed copying everyone on the three patches.

Thank you for the feedback.

I was using the following configuration in my global .gitconfig:

[sendemail "linux"]
     tocmd = "`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback 
--norolestats --nol"
     cccmd = "`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback 
--norolestats --nom"

So I relied on the automatic recipient generation from get_maintainer.pl.
I didn’t explicitly specify the recipient list, assuming the tool would 
correctly assign To/Cc entries per patch. I’ll make sure to double-check 
and manually adjust if necessary next time.

Thanks again for pointing it out.

Best regards,
Goran

