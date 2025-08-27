Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DBECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcmoYrSO6K0i6WXr8sztyfu6DTAP/aOG70ic5dYuN3s=; b=5Cb0+vHZsFsWRkMqjSsu+YeViy
	cGY3rCzbyhofgHcAZGlFZnrNJhcfslNaf7QaTx9icuJXpI4MFiQx1wukf1UxNbPCyPl0jqln5swNQ
	V13EeQu6zmh517+f+/rzJDWhVW3Heib9erknUOzbkD8laRZMCtAmcI73Spg3+PFmQ/H1aE0gLZ6NA
	0EdkG9cuNQ1ZgtOZIBrSG7lTpX54gkpQvvOmrs3ttP6Q5alfF4x5C7FBU7tPJrMLmIt4QnjgzY6EI
	3YcW7u0RIWO75sq57rXZ6yLI1a5ahCJnIQv/b9jbVjg1J/6UAEf5nk2X/6073fKkJEYClioTtAgER
	pFxkvfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbz-0000000GZM9-2vy1;
	Wed, 27 Aug 2025 19:15:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJ3y-0000000GBjF-1Omk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 Aug 2025 16:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=rcmoYrSO6K0i6WXr8sztyfu6DTAP/aOG70ic5dYuN3s=; b=ar5bsxAWW+Y/lAJWUpdna37CJA
	ls1ANpAh9xrmC7KHocexKkj635LdFbMLQOzAeJb+xZuq/0C88oeyEUsMTLMxZPrLe0+DP4Oc3P1+o
	2FoDvzisMt8GQL2ukM+XqowDlax42PRoEzncySTxzKAOGhgYp6O6O4trYkzZvM+yLgd1k+LM/UYxe
	Ve8MJEtcrFsz7drdcf/MQJuoZMLtggypQGS75qf2aM6LwWL5WCpXVUnPFPs6yqU3QZcOEvZBSK2yO
	rSkPVfN7gcCsfYOi8usqmVmnZg9nWio0mqSZyz/tn5oAEt7vayqwGMCK4tsQ2uUmG01qpD5Me9KpD
	rO0nLmmw==;
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJ3u-00000002TKi-3Q7E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:31:53 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2445824dc27so61025ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756312308; x=1756917108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rcmoYrSO6K0i6WXr8sztyfu6DTAP/aOG70ic5dYuN3s=;
        b=oP0aPadlN8BOU29w6vxEabGGATd3JCV7ak4CC9KIiaX9FICdXBmy8fbDTJ70ucgDxZ
         YMPCA4S6UUoBIIrg2V2wgvhD0JmZ+T/HIIUZ7VCGryeHOK2+1k02FTju2DlfRHONvxrf
         UOt/I+1MaHVBmKPBBLB4Hi4NF3hWWCtpE3MBOIxE/ijv8Aq6Q16AGYxpKksHmLkLPRbt
         I5y7QmkOY7CNJIE/oJFt2UtNCZY79r0Xe+awwcMu62HQLMMY/8KPJHrTjGbLPt/nl5F6
         1Ex+UaaPziQfEiRJ19nVvKORqpEDaHc/e2HOIJFKisg9BNwtr2+Qd3ymBEhTp0ihjnfz
         IY6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrtNxfCfLiehVmSUBD32eszEpUIZycSuf8fH+nZ4eFRJ8wXvycWVRLKpfPaVVHt8OiINdMBz1WPYnCxwgc3o7+@lists.infradead.org
X-Gm-Message-State: AOJu0YwbZOOoPTK4dZwpCaJ6fB5qr9U87UYY7QP8vob4Aa9Rvjl2PJlF
	7jvdfJFDDl2dymNQq5CDXgq8pBUlEuQI/2brhoETAB1rUnUZrNztGMyaH72lUdhrGxqWZYi3zQi
	eO1YRtJILUM2PflphK4pTH+TgyS0LUTdXb1sKHtrjk4cNEwgx0nKImpaOURE2clRVunOl+Vnm0F
	oQ6l/W8HOQePod0IIbyWZr8zlTksMXgaZ52unF6afnKD70jnZ0rbT0XR1BtpUB1E/0BEhsUxxkI
	tv+q7DIzNmcEVeM8unCPmJvCguWVj353ss=
X-Gm-Gg: ASbGncs6TGuf4WPNjSGFVl8K54Q54syLBvoL52HMrhbrbl5qK+MxBVUQDQcySbcAu/q
	p/f/cErzyxbvB10GnVNTPoyNOPp2TkzURYQ3xKFnidwXCBs3FLZxFEZRSoo/9/i6wJvyGl+9kr+
	vAIiECA603CX7cA9htgtL1s2OGSsgFNM7ZNN7AI0+rCY3kZ+Te1SHFqTu6sgUUzja1V2XbhEYc+
	8Zjuw+/iynVRLizXhP1EpBEdw8opjIoB0UXy78n5Qgi9XEehUvFzEsUyzqsz5qigVkiRV3tHncQ
	fJGaNl3qnuy7Cg+lAtWm+cQCrvGSNukCOeUY1nyLVvu5mv2g9JBNWkLNASXAzyHQQ0xTuLIguU6
	Isnpxl678NRH5ERi9UFyx4dAd9yXLoMSMEu/0uU7SWU32tPHZGymcR7+9p2EPRIHTovxOCH66Za
	Dienn5
X-Google-Smtp-Source: AGHT+IFqFeXTLxHSTL+fTsLbgoJqOfaEgqM8a1TIlqYSWwpuow17v3QEU6BVHewOqtOFiIelIYurv5w6N1cT
X-Received: by 2002:a17:902:f70c:b0:246:a165:87c7 with SMTP id d9443c01a7336-246a1658a38mr193818235ad.42.1756312307799;
        Wed, 27 Aug 2025 09:31:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3276f53ef74sm195314a91.1.2025.08.27.09.31.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Aug 2025 09:31:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109919a51so877771cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756312306; x=1756917106; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rcmoYrSO6K0i6WXr8sztyfu6DTAP/aOG70ic5dYuN3s=;
        b=Bw3FXzSaLY0Yok4OI8C9fEnmIgBAGI49TPUayDdNOFxmzeJAX+fsLlXnH98fUnpcdD
         lu+u+8/kRqRXfXs8qBkKOxcgt8529O4niKiOK1km3J5plHkg2FNyA6INsO9UNIdrzzmu
         wlNrX4XO3yc4bDXJ3tZrvkqb81IhWOzr9qsMQ=
X-Forwarded-Encrypted: i=1; AJvYcCVHHDGwB50npU4R3MOU+VwzBYDprU70WgI49yHTjgOtB1dGDFis/hjCM/tBzNi4jro9SNGU20BWSHu0udHhd9gQ@lists.infradead.org
X-Received: by 2002:ac8:5786:0:b0:4b2:fd79:9ea3 with SMTP id d75a77b69052e-4b2fd79a035mr516801cf.52.1756312305704;
        Wed, 27 Aug 2025 09:31:45 -0700 (PDT)
X-Received: by 2002:ac8:5786:0:b0:4b2:fd79:9ea3 with SMTP id d75a77b69052e-4b2fd79a035mr516161cf.52.1756312304895;
        Wed, 27 Aug 2025 09:31:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8b0312asm96801691cf.0.2025.08.27.09.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 09:31:43 -0700 (PDT)
Message-ID: <3c3beeed-a545-4dfb-8199-b57066d3eff7@broadcom.com>
Date: Wed, 27 Aug 2025 09:31:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Stefan Wahren <wahrenst@gmx.net>,
 Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net>
Content-Language: en-US
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
In-Reply-To: <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_173151_017780_F7757186 
X-CRM114-Status: GOOD (  16.53  )
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

On 8/19/25 02:18, Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 11.08.25 um 16:46 schrieb Andrea della Porta:
>> From: "Ivan T. Ivanov" <iivanov@suse.de>
>>
>> This driver provide pin muxing and configuration functionality
>> for BCM2712 SoC used by RPi5. According to [1] this chip is an
>> instance of the one used in Broadcom STB  product line.
> i'm not sure about the whole driver naming. The cover letter describe it 
> as "pin control driver for BCM2712 SoC", but this patch is described as 
> "STB family pin controller driver". So as a reviewer, I'm a little bit 
> confused of the domain of this driver. Is it for a single SoC or really 
> for a whole family of many SoCs?

The structure of the driver is applicable to the entire Broadcom STB SoC 
family, of which 2712/7712 is one instance.

> 
> I'm asking because all the other BCM pinctrl drivers are mostly SoC 
> specific and not really general for a product line.
> 
> In the former case, I would expect a driver name like pinctrl-bcm2712 to 
> make it more clear.

pinctrl-brcmstb.c for the main part which is agnostic to the 
chip-specific functions is adequate.
-- 
Florian

