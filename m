Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982EAC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ir5Os0CQnbQuxUCzuubgRfeVAkcH8JmP+kvrHlYfrQQ=; b=axLggdslW+uYjiMFW49PSFoSOR
	CX/1ogBrV2wn8xh+KbtqGm8U/v6VkEP/C2uUCDfBNYJMKo4Pqu0ShEO1HtQQVtjuXxW532e/cE09V
	3J+DMzpldOpCJLGE5fKcZgdOCyMphUCrA2P3EpoDQIjyfhX/FrRUo3qFQRZ8H4CnTR+o0l0y/BXyT
	I67DqoHjOJPuty4gDbdzQ5OEzj38MgCA5Pg0Tw3Z4ro6VozuKccMjF8VPTBBVyDpbbb1FU057n8Zz
	eFcQzFtiuJoOmYio9fJqvgDBm5jDSz+R74aHTUFNpGGC5WSaWeeGp7vdVoe3CenU3QHFtjjWi15CM
	d0V2Qv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8wB-000000025Ny-3Pm6;
	Wed, 26 Aug 2026 08:24:47 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8w9-000000025N7-1yRO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:24:46 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c15cd3fd760so73863666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732683; x=1788337483; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ir5Os0CQnbQuxUCzuubgRfeVAkcH8JmP+kvrHlYfrQQ=;
        b=TYPb8000W6CcqX7qFBj+FbKLwSoDv2LxVJBhy8IsKhTgHi31+eq8gUCa3aP51V54dI
         YlWXsek4N1/dyM0K4E1oYYz9z+neVoq1IYV+6sq64m45XZkQIq2nkD8PylzlY1PZ3Rsl
         EWDmFMC151yWNp+WlSoOtmx3ugAoYclV2k9Y0X3uRTsZ8Ak8aABRoExZsPyGdyyAp7pW
         C3nfXWQX+lHbRegWr0uTB8do7jKDY96zBAYz0Wi3JOmnVoYaFhb8bf0tWaeIACexAq+7
         ZJPreE3iUTmWsRJjOf97fAc62PftHtxAoWl4Bk0FZVQlD+jBZF1NuMkNkUFptC2nPsBw
         330A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732683; x=1788337483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ir5Os0CQnbQuxUCzuubgRfeVAkcH8JmP+kvrHlYfrQQ=;
        b=Las1UQ0JIa5RzTxRCBAKzFVNYpi9IpzaAV2Ldk4eAy/WaZyB49g9cwtYfyf96Xtdly
         gcRakCkA4RbzQ1YApw5Yjea0FmUdfQCtBTX+JF2bM8+P2EclaA33lxGS1UMZ0JR1Cbef
         KabZ+QR6SgCx+FyPXhPmy0wzscJYmTvGjU95GtG52PDRPlw5UV6jy3kVN/6fusW0uRVp
         jk5qrka4csAyXlm6vp49qgIxxVKbua9v2ukfNFqT/ByMpye5xlA7cHcy9cvoQyW/xgTt
         oqmOZ2h/dxjFtu942bVA0XoKRyRe26LBC2YIESM5C5XC9M8EDzpTVSb23Q86KV9XrbsD
         t9zA==
X-Forwarded-Encrypted: i=1; AHgh+RqGmcJdATIfUIYAEu1mLZyVHUkJdrzWAS38wqCAsSX3sDtZnx6mwWKTF8U7FQg/Fy5wgR6p9F2SHI3bXkwxbvov@lists.infradead.org
X-Gm-Message-State: AFuF++nTeRjhHY79xLrsZL8WUgII8NFJdBBqOMynG1BYGECYPlNwzqRh
	2gc4YphO6eVCETIV0Fh4fhOgjvE0aakjxWVFvrQnCnGJ6AJjsulFKQlLTgcqV/tH
X-Gm-Gg: AR+sD128Vc31qU0748g3VwUHkN1d1RJjjnEx/Hk9fVmoC1OLy5+e89Zp3AIJB1Jsru9
	3sNHOKI7aQHRt0tvNWeWRgip/OBViTF7kQtRl4fa/p7qmZ0sEmdo6m25JDGbk8OujNryuF/5wpr
	lwgm0XoHdYO0s64vch7X19IvwGZ7N7Ps/SJttvqPTADhf/J+O4FakJ0iYcj2iW5bs0ppvQ9eD4H
	yqeE89+CHR+CJlDUjQsATwvB7AcEc2Q4Rer5+9YrSMJ3XojLyaoXNz5Kn+ovC6z9pX9KNkXXnc8
	gbLwxQXOkFO9GGHtUCbgkpsthEr0K8yA4sE3RbHAbtU+VJ7RBzA+rricp8jjHdy8L79F16UNyIX
	Vtm6Z8rEat059vYRZ4k0Asa+pqgtegW54kRyNVw/PkHShEpGRiHUhzlA1VU/ENW8LnlXlViAHFl
	iWUFSkMoc8i++2LV9EPemahs5QtKfO27xZq3GfLDmXDOyQyvYFbDQj+toe2cBYTDviJetSYRHLT
	aDwR0onsgkMZSTfNJEqTw==
X-Received: by 2002:a17:907:3cd6:b0:c1f:922d:34c3 with SMTP id a640c23a62f3a-c250c308f96mr539179466b.14.1787732683231;
        Wed, 26 Aug 2026 01:24:43 -0700 (PDT)
Received: from [10.25.211.251] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d6acasm419960366b.9.2026.08.26.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:24:42 -0700 (PDT)
Message-ID: <1c5e12af-927b-40c3-b682-8f432a0d9907@gmail.com>
Date: Wed, 26 Aug 2026 01:24:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, elena.popa@nxp.com,
 cosmin.stoica@nxp.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
 <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
 <CAOMZO5B7Cn_qRq=_9ALXHx9svU8WQZbaaL_jXJorhux1L-JoPA@mail.gmail.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <CAOMZO5B7Cn_qRq=_9ALXHx9svU8WQZbaaL_jXJorhux1L-JoPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_012445_524367_03EFE233 
X-CRM114-Status: GOOD (  15.28  )
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



On 8/25/2026 2:52 PM, Fabio Estevam wrote:
> Hi Laurentiu,
> 
> On Tue, Aug 25, 2026 at 9:11 AM Laurentiu Mihalcea
> <laurentiumihalcea111@gmail.com> wrote:
>>
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>> following hardware feats (list is not exhaustive):
>>
>> * based on i.MX95 19x19 SoC
>> * 64GB eMMC
>> * up to 16GB of LPDDR5 memory
>> * 1 x USB 2.0 TypeC
>> * 1 x USB 3.0 TypeC
>> * 1 x RJ45 port with RTL8211 PHY
>>
>> The support targets revision B of the board.
> 
> Please add the bootph- properties as well.
> 
> Elena plans to support this board in U-Boot where they are needed.
> 
> For reference, here is a commit that adds the bootph- properties to
> the frdm board:
> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/commit/?h=imx/dt64-intend&id=50c0d934698f7602d579ba21262fcca3643c5464


thanks for the idea and the reference Fabio! let me try this locally and will update in V2 if all's good.


