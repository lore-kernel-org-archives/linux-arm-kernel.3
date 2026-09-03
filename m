Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4C7C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CG+3ejVLufbC+NpKWAEcR1Z6tEvzwvJUKgbwfN9xzf0=; b=RGWu2n7WZdC4p6vmMv/656Q2sm
	vNHXi/cPSK8bIYfzGchrfMHylHWJ3OSZ36qg1HJjDc0374tCGSrJ+0dC+jWPJWFT3tqgKPHLXRfcE
	KBcjaLjRLsXM/RagoT188UYuooygLljeXklqVcg3a0gVmHp9s2RN74BbVOmvo2Z0iZdhESKlAB8Td
	oT+nQoddcOkJ4B0l+VIII2dfpD2ID+H+H76wuR6jXzu6gMUtPMDOezJ7S+Mr6EegflOGKRxeEQJCA
	HYGAfD3Bzw/3+6J59akdhiTAM87Fd3FWTGkqKOncQvUqrOSKKwHAKifZw2rhMXDSjor5MumZ39/i1
	JEgQSunw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DYp-00000000WIY-2Aw4;
	Thu, 03 Sep 2026 19:57:23 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DYn-00000000WIC-1aqP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:57:22 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so243403a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788465440; x=1789070240;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CG+3ejVLufbC+NpKWAEcR1Z6tEvzwvJUKgbwfN9xzf0=;
        b=fGSop+wW3mtYFkB/Cj+f8AExGtIRy8GNZAM7ab7gw2MHxfrG5W9yOc2p8CZqi9fu+z
         SxKwa3t0uvUnWkR9/liPlRh84tY9U1MUzBdH1eqwGVATcV14fj7PnHph258/5RVdYaC0
         9EdRMzU17SrLlF2kN3efbBb5BscnO4epQfXU55L7H/rpjV/WBBGFOVjlhAfExLjvpNIH
         9Mn2hxDzlHHa44xYGyxMx33k6MEn8vVKrtuvedtT6ZAV8cCYuNB2Pkpz/9U9PJLffciV
         ky+HJCxx95bqEukQ/aP4r7GNGj4b1etJlRIkCJJ4VLiFsGmyw4uZkHyn8x9rjVsFxJLY
         xvqQ==
X-Forwarded-Encrypted: i=1; AKwUvByQvcWF5/IyTpT3jhF2kG5VtE5N6CtrTD7Hs+GWyHoVB+M5fVLJ9WFw0tMWTYc5oewe/4+9L6Wn5jWwkMwXGMn5@lists.infradead.org
X-Gm-Message-State: AFuF++nsptq1o1LUca94ZiLC+qeMi3Ew3RazJRlp+DQlC7FU3ZOu6mPJ
	pO6vsaPW1GMI74ZtpBu7Ww70jYSVWG/GgW5qcBBmbjRJ1446lHqsqfFd/O6McrWaK5JAMKcWHa1
	nbIrYoaXxG7Z1MnaB9LYJLkb0vt+kAtlld/4PMqWTTGb5d9QRordrAZCbQ4gz+q7rfYnTXNn9mm
	zWTDUMS2nZiTRGcf7/Not9zVprs4/d9CJAhbVKNLR065b64Cq+0Z4itUqSyLRZpZFUyAxQ9J1b6
	rr0tAqlSZ3sFTw9BMYtpFNG4d1SRwgnnmc=
X-Gm-Gg: AYBFou2FdZjZ5KSX4A8Js1VLVpE1CFowkVFi4ivuxAbxt4nOaqWSYeaPzGOoC2W0yTF
	+onVMsnGWjG+D8jKjpQyTWHueQ41GXLwEV9PLOH4Yf08V9wrtqu6VNlMUt7DX+0L3vJzhaVwm22
	P6SQ5THNVM70NcploNRneZc2Y9AGj7CGOweEpDCwklCuyalfFQesRRpOyF2hCoGp+Sxi2fVvCUv
	dv24cxijDOuD8Qc3vDx1s1DqoyGM1ATojFW7a99jiiO7J4dnWNV8en3s3FsyOtM9811HEnFJP3f
	6ChSZy1gdyCGP/NkYlg4G9ABV30DBZ3qBcdEM7pBEm4DAZB+FZ+Th6d/aJjHf072z5e2NiMbo3+
	WHcf6RpIejfpflQWcyAZ5xhjPnOzYzBPpdySB/kG6CvyH+jSpD897lONAjSEwWK0BnejmQLffj7
	xnC0eFE0SMgA3U68mlnZTn2SknZsIG7MS93/5yFgwe
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr1512657a91.13.1788465440260;
        Thu, 03 Sep 2026 12:57:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b261435e4sm169968a91.7.2026.09.03.12.57.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:57:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53033887f50so8720971cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788465439; x=1789070239; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CG+3ejVLufbC+NpKWAEcR1Z6tEvzwvJUKgbwfN9xzf0=;
        b=Kr6wyRnBB/kUmImUyK/zKHWtTDTC/k3LfS/j6gF8WWKfmLRlSJ3OoXM8vdqqUPPWdk
         lvTds7ifN/NUaSOxoSX32yqigdOZpKo2rzHN1wawyvcRw10kWm01N24VB32pxLJOp/5c
         xL1CsmjHB9q3wq9CLH+tUDVOPIOABq1EkQkaA=
X-Forwarded-Encrypted: i=1; AKwUvByZS3xTjltyKMLPpxpj0NB8suD9eYUhJH5leIgLEn6AB5tmsrDXZJ6kMKT7kg8H7uwd6TKNq2MAnd/Daknlv8Cj@lists.infradead.org
X-Received: by 2002:a05:622a:1a81:b0:51c:d52:6049 with SMTP id d75a77b69052e-530548e0cb2mr14536401cf.28.1788465439072;
        Thu, 03 Sep 2026 12:57:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1a81:b0:51c:d52:6049 with SMTP id d75a77b69052e-530548e0cb2mr14535931cf.28.1788465438491;
        Thu, 03 Sep 2026 12:57:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040664474sm2764476d6.21.2026.09.03.12.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:57:18 -0700 (PDT)
Message-ID: <b036760c-2b78-42ef-9840-104a115c94a1@broadcom.com>
Date: Thu, 3 Sep 2026 12:57:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: AC56U: set WAN MAC from nvram
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260805190101.6773-1-rosenp@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260805190101.6773-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_125721_453162_BEDFE1BE 
X-CRM114-Status: UNSURE (   9.26  )
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

On 8/5/26 12:01, Rosen Penev wrote:
> The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
> userspace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

You are doing two things here:

- assign the MAC address from NVRAM
- declare the switch ports along with their label

Please split this up in two separate patches, thank you.
-- 
Florian

