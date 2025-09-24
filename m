Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFCCCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDYjbaYtR9X9/K9VwNWQp4yXt0BXnnN3Mgb8xKTG+Sc=; b=bTBa5VVgeu7hjJaQwzn93poEgb
	ZtqImrUZgBLr5G7OYPTsK31gC832rUc07axQKPfuStbJmp+MACdbYsqgpKVUYtTFxwznXYmfI4dTC
	x2PeuwiRKHyTs1YYYQ4EmyStSYnvQt9jVp8g4m8TG/atrg2SLL2rQigF52CHQckuqvhLhLiXGl9jr
	lpdDKVRCFwOo64mvkBj2o2UXQFXaP7rDqhgHFw8Vg7mRuc+G7ULUa52R905OZScspw/xWyjryrRhz
	4fgiR3HUstAYmBDNmwGy9tG1ugmg4aEEUx+bxzHY6xTJPF/g1Mwgo/k50x6gNVBN5s0dOk1zQEgTl
	5a65uAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M0w-0000000G8zO-1DRy;
	Wed, 24 Sep 2025 09:42:18 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M0u-0000000G8vi-01O1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:42:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3ee1317b1f7so3242191f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758706934; x=1759311734; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDYjbaYtR9X9/K9VwNWQp4yXt0BXnnN3Mgb8xKTG+Sc=;
        b=G1P6R4RqIblUnKZSBKQzb5A6V745siumVjMtxQeNlOYz+QSjoTuXfmIYoRG/13zCTs
         ziFUUbxl2XgMlhNAavCRK9yGv33cAZcuTpo0TY2KJ6gMmWnrRMu6DqfyrgFbA69Qg9ZH
         c6Rvb5F6PgSfqvw536qw7dFzEGuGjpnwsrvlb4/JuuDNgo4Mj8N7UGIKgkK/n1XsWe8Y
         ZJAHgokH4ael/2rb0IqAG/VVHUXp/dGfqtNt+MmUStyNRRt8DoQUNawMxk+IlO/Ph+Aa
         aI1f84ovMoWgetLEoHjK+AbUVUYrBvCPw7fgntQTs7D10ml+NtrAGnMBHqDueu0m5O6y
         C8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758706934; x=1759311734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDYjbaYtR9X9/K9VwNWQp4yXt0BXnnN3Mgb8xKTG+Sc=;
        b=UrwFH3uFpZ/jY/8WLv36F133J3DZ6bYtCIvGFiepi1Txxvx9xstSbUmvjzbVl6Yi6c
         G87iOc2cXzZvFtC0ZVDthreqgxyZzMOqqKRKIYHbjJ+moGas1P/UmSt1IG8zjE5nPrnm
         efqOue7BVJgN90U9XTwlj76Lsh3x2eUw+yeLBnnEjCiyxFCoPJqALsdLVYDxbPrSqBaJ
         FmQGfJiIW817OTYxRxOvT1K0SPmdggUdKgQsC5IjIgRmuwr1NQSXRVnM86tMooJ89TZ+
         G0QHhhtubjXwEbfDHhG9CGWsfKWcXw+6ILc6sSEfsi5DAdafs1raIWZyy62QwNWVlJ2S
         a7jA==
X-Forwarded-Encrypted: i=1; AJvYcCXMkchTpHMmMEnaym5KrHUHuMbMyLDQ4Ow2X8ZVfd8vduIS9f7t4z7ir7lytIsedOXujczW4uKUoH0TURhRosUT@lists.infradead.org
X-Gm-Message-State: AOJu0YzGPWMQvq+bfR3RiqiGTwecRP1h27AWfOeNyJsQdaVjy/HLCkPs
	hT4XM+/bAj2IIbuVZ+Sw9yAaHu+d8995TReP8bRGcHJXheSNyRXjLxRJ
X-Gm-Gg: ASbGncvVQskkHBCpzqdp1EpgN9nJ7wTT8U55tItAigN9JYG0T1rRV3Y29BkKBX/q87Z
	g0G9HIsWlX62gywV4ClX0D2QBxPw0B8cZwNBPI53vvrExXAIulsIBG5hI2l5QY3n5tDBnkIHvkx
	cKrByPCZ/X7uUHln5C4B4TXWhv7l2JB1zr+IypBfw6NxzXGlYFFjHtKQckUkEdNOZiyXgSS5GXx
	TmASrafXYDxgfXgkkGBIifX765IXEmBUkuKBqFyc+LmvgPRHu8TTCKn4SGMsFabLw9rpV6hol/G
	uYNxUbTWjzWVCvk4qeWikUmGboL0iUnuFA4Gke16RxL30PeSfcnXADgULbpLd6yNgMh+A4S9Wd4
	0W7eWf88peJkr2Ya0FzikCuK9fVmn/EEyclgD/g/56GKVzA/fCaoZlvFAQbU5aW5d1d+bx2Igdx
	GpDlCSw9115tMNBfW7yqnVKBnLv2IKealDTuiykt65SZ+Xg0hvCs+McG0KMf5J
X-Google-Smtp-Source: AGHT+IH91JwgVhi7xpvny99FXoN7tjt7AmIAW/YGtLT1L1J+48wCTADkEz6Cf/AvHGUdfI4k0/hLkA==
X-Received: by 2002:a05:6000:40c8:b0:3ea:c360:ff88 with SMTP id ffacd0b85a97d-405ca959751mr4813428f8f.31.1758706933633;
        Wed, 24 Sep 2025 02:42:13 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7503:805b:76:f865:8f03:23d3? (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-402188ef7b2sm8909600f8f.34.2025.09.24.02.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 02:42:13 -0700 (PDT)
Message-ID: <841138c8-4fcc-4388-9639-391def0ebc5d@gmail.com>
Date: Wed, 24 Sep 2025 11:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
To: Julius Werner <jwerner@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
 <20250922-b4-ddr-bindings-v7-1-b3dd20e54db6@gmail.com>
 <CAODwPW_oDTh9FdnLq7w2FPQv68ReAUUpssqEktUH5zhewbfcxg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <CAODwPW_oDTh9FdnLq7w2FPQv68ReAUUpssqEktUH5zhewbfcxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024216_047663_AE0698CB 
X-CRM114-Status: UNSURE (   7.28  )
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

On 23/09/2025 00:45, Julius Werner wrote:
>> +      lpddrX,YY,ZZZZ or ddrX-YYYY,AAAA...,ZZ where X, Y, and Z are in lower
> 
> It looks like you accidentally changed `lpddrX-YY,ZZZZ` to `lpddrX,YY,ZZZZ`?

You're right

Best regards,
Clément

