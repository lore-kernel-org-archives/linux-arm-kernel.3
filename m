Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9611FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RN+4SkO8PJ9d9SXPrFRpz0v6UaMeYjDz8fSXVOFCTUQ=; b=2ShdVen5uBIjYWtPItNnM7Zmk6
	nNFA4NOHEuksnswb27e4n42yIK6HGS6RIOKW5yCbplQn7OQ5XEWAbjkwi8jKU8RGLNeo3tM/OapjQ
	/rRyWRoj0NfrSVY6PM4xCPCVq4IxGnJb6HqSC0IYd/Xbfg9lQHLo7jS890BtYz1u21oG7A8VyYOBE
	LlSliidOteBWOaCBJ4KE/VVw12Rubf3I3kko++oiPxFEMmFIjIGcUDkCebMS0nnev45OAf0Vlzkse
	tpcdwklWFagn/ZTeoUAXfUL7Ip9eznF1D36tc0aSwdxNN4gxq3Dekg3qrHBPX5rFRLnbusnv6s1Yg
	Kv90wBig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtUZ-00000003Drd-3gXF;
	Thu, 09 Jul 2026 18:28:59 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtUW-00000003Dqp-0beo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:28:57 +0000
Received: by mail-pj2-x04.google.com with SMTP id 98e67ed59e1d1-381191ea2adso116614a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 11:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621735; x=1784226535; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RN+4SkO8PJ9d9SXPrFRpz0v6UaMeYjDz8fSXVOFCTUQ=;
        b=KeDclZzgQiFiBf2siTEpRGdWjizWNVMyxP/265tqZ71uHIPzN6twsUV36CauJH46Q7
         Ioonxucb9HAjr96pNTNzJ4LubnMBXC3mhi7HtZjDwgq50DTzEXNXp+akf7HW+wFVyoy8
         3ahlHCxUitVaqQEAT+RV5gokfKXvoFuIt4Q3Ry2u3h/XWJKp3UKz+3PeBkLiOYbvIFgR
         Yuk9EDxiTNtXzgVQqdILPbrNZJytLfbBK/UqQdpT2h/B+XNGHlkvQFd8UbgQQ0dgnsxA
         ibff65//MO9WryFDee5sfcoV4jpsK/O0O8I3+hC+3d3TNR7BH8wr9ZQ5yFOQjvh++Eg5
         CRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621735; x=1784226535;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RN+4SkO8PJ9d9SXPrFRpz0v6UaMeYjDz8fSXVOFCTUQ=;
        b=eAuBtNxX6WvvYw/1AB9yWMgTmqDw/zzvLVg5psG6Cin8TUD8jQWygX6oOP7+4xaMy9
         bEBG0PMjVwzAFLyIKwtZ9f5dnurcQe6UWYMZFUrIjLAXQya1TvJeUGq3Vc6qHievSK0K
         OtjzZVY+JICQ89qX6CXTtqj1mR8st/sXfPX2oFqDE3VIjdNeGEOp0pP52mtkovuHqxjO
         822P6QD4vh06J4Kv7tEh6Awuy+DSIVoqqMaNKOq3sK6xIkvAo8EvsfC24Y1lESFTip+Z
         fYFlc1x5wzR7Mw0QunL+e8mrSAnMJEx/a4sawAKcUtiLdrABi8AstMPUqigqxuXo6jkq
         mVDA==
X-Forwarded-Encrypted: i=1; AHgh+Rrde2odAQOLTB+6ubuWYTR7GHM/Do6FY99dipJ5QNmmiLpU25RKMuD5E2ToGBUUg8wZ6cLP9XMd2RNlBJgfSoBQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7uaSNoraBTtbXQH8oMa3SG/pQnrfAYETyL/V67EXOraDR3mIj
	u2Tit1xgpsE6TCpj9rKr5r58um1hwo92LWI4fYAzhjrwyYpmYrcb0fSU
X-Gm-Gg: AfdE7cmbIJCje6z3+vxvACunDtv16he8X9UkOft2pGtZpM1EoASD7KvP19TJfU2UPtE
	RoLyfZMzuBrAjwK56D51ofMiAyVD/SsGOc6ACxv7LUimq9WJDJ0eYuuXMXDFyNbJipUIFtRF1vF
	98C7v1O9nmtS3FHaZjnaJvz0RHzbxYQwRB80fGbmTHG/kA23fPmCnqu2WLNdE1HNt6izceq4FsF
	39v43wrIfvuUEoTYBDx57FBAU9P8K6QLr0fxYZkXKVsy7FojaQ46HR5mUIE38LZgLxWC9yb7v2X
	3mD3GpWUj8peH/BkopilqvjhN2gROoLaW97C0hLQYDpNfBL6JU9jijUJrVE2R+PjWUL1bnLUCO3
	Fk0xY7kdFpFMeC4GiHAat3lPWEZfydQn04JES6Zn9bSNOzucHgonNGXogyGGf53TyGFm7wPKQmI
	UboUlPByJGWXiOLePIo1csRf4=
X-Received: by 2002:a05:6a21:7482:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3c0bcbc0455mr10030942637.38.1783621734601;
        Thu, 09 Jul 2026 11:28:54 -0700 (PDT)
Received: from ehlo.thunderbird.net ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm4088600a12.7.2026.07.09.11.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:28:54 -0700 (PDT)
Date: Wed, 01 Jul 2026 18:01:30 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add graperain
User-Agent: K-9 Mail for Android
In-Reply-To: <20260701-sturdy-imported-oryx-dfc12a@quoll>
References: <20260630153810.3574714-2-coiaprant@gmail.com> <20260630153810.3574714-4-coiaprant@gmail.com> <20260701-sturdy-imported-oryx-dfc12a@quoll>
Message-ID: <A4CA0393-B348-48A0-B5DB-D1F9098EB37B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_112856_206520_3BB526A7 
X-CRM114-Status: GOOD (  18.10  )
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

On July 1, 2026 3:05:45 PM GMT+08:00, Krzysztof Kozlowski <krzk@kernel=2Eor=
g> wrote:
>On Tue, Jun 30, 2026 at 11:38:09PM +0800, Coia Prant wrote:
>> Add graperain to the vendor prefixes=2E
>>=20
>> Link: https://www=2Egraperain=2Ecn/ (China)
>> Link: https://www=2Egraperain=2Ecom/ (Global)
>>=20
>> Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes=2Eyaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>
><form letter>
>This is a friendly reminder during the review process=2E
>
>It looks like you received a tag and forgot to add it=2E
>
>If you do not know the process, here is a short explanation:
>Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>versions of patchset, under or above your Signed-off-by tag, unless
>patch changed significantly (e=2Eg=2E new properties added to the DT
>bindings)=2E Tag is "received", when provided in a message replied to you
>on the mailing list=2E Tools like b4 can help here=2E However, there's no
>need to repost patches *only* to add the tags=2E The upstream maintainer
>will do that for tags received on the version they apply=2E
>
>Please read:
>https://elixir=2Ebootlin=2Ecom/linux/v6=2E12-rc3/source/Documentation/pro=
cess/submitting-patches=2Erst#L577
>
>If a tag was not added on purpose, please state in the patch changelog
>or cover letter why and what changed=2E
></form letter>
>
>Best regards,
>Krzysztof
>

My apologies! I am quite new to the kernel submission process and=20
missed picking up the tag from v1=2E=20

Since I need to spin a v3 anyway to fix the text wrapping issue in=20
patch 2, I will make sure to include the missing tags and resend the=20
entire series=2E

Thanks for your patience and for pointing this out!

Best,
Coia

