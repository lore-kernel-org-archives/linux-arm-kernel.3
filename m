Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E8ED3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUJvc61OU63bFccHPQvUU/nZDfsgPsRPvd/ZVSTIseM=; b=MuqZ3NqOxdI4oWOTxTJIabiB7D
	BXNBs2YtaNCHYGeV57HCk1HNW7e4CLhw5KGWCC99dxiawilBttrtcWMdnI0mcpGwQVaDRAYYe3bkA
	1TVTcEAvC2IqnzHMBbqk9vrthFxoIlb80HZSnZPYh/9zIuGdRjYOipDPaz0VYi1d8cQVYu7y/CuKI
	4AOxcn4FB9SD25XXKMousOUDgIky4k4FSoQq57YlNeVBqYgRR0yzuFjZOU/ofAIZMFWZkWeyfP+h3
	u4pCDUTuhLUZleksEQRyM4hSQoDMSQj/iV/g5/Nvga6C0Bv8RIFlCYT/7gL2yViRJjslUYIPZL4Oo
	YRE3k9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qMZ-0000000FNqG-1kCE;
	Tue, 29 Oct 2024 17:50:39 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5pgM-0000000FDB4-2e24
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 17:07:04 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6cbcd49b833so34773036d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1730221620; x=1730826420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XUJvc61OU63bFccHPQvUU/nZDfsgPsRPvd/ZVSTIseM=;
        b=d6l55p4TQ0jD59uUQ4M/tDa82VrAJqIYTMo88oNF9PHmoDpoqI2Dfw1jlUfw6mIEUY
         oEYcSCVT4qBlZ2p0Jxm1iiRGJrhsJ6sNQVe0bK4KVvsYBQYoHFMz9w/h7Y8ov0X6p5Jz
         m434m1+Lk1H4N2zi7M+GILj1SV7YyLBpQBTos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730221620; x=1730826420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUJvc61OU63bFccHPQvUU/nZDfsgPsRPvd/ZVSTIseM=;
        b=vwpwrU9wYBBbHo1whK6jtjV3MQXFvg46R7YGAUQs32t7pXWCh/w93RepHwKD7kmHmC
         9ZsNpgPNdy0ehEA61W7X0t+oMgr3ybx+X5XGeZyCIG6bzFBGzkqjfUdmy3lDXoSV/BLi
         D7Q20K0PbDKVzT4f+OzNabY3zvs2XeNvbaxMb1M4zSxwWfjtdaMCbUTf1fWcTGkpZj45
         9vNxvcepsxlWszvP1PoTXWmsF3IQYbd50DT6uxPm46KaCG2coUiSMKcQKIaOq63Vw87d
         pDhYTKso4EmElBWlJ/UmumB0P1LbMhVcj65EcEZKxv28TAfpys1iRXr4o8e5e/n0V9bb
         oKsg==
X-Forwarded-Encrypted: i=1; AJvYcCVulMbSmiwL3BtOwafkvtHbpZDdrp+ngTH0GetVwtBYW8GYqasBscCUUJvxALaHOGjRLyuAMN2liheafu9WsE3B@lists.infradead.org
X-Gm-Message-State: AOJu0YwIFxN/zz/6TQfst2XnYiMcN5DU3z4ckfs3lRcZFZD92FxwGnAL
	7WRX1gdvdv29PgKT/ZCYs1YszoxFm+eXg4OX7nBk2Q+BvGT+mUHTHo30r9XGjA==
X-Google-Smtp-Source: AGHT+IHCGKwhf8zI6C5EC15lum4w7t4OGXmxeXEVnk6hKfTc2d8BQmiWhoi2TM0vTYSCnfcEJSq+DQ==
X-Received: by 2002:a0c:db83:0:b0:6d3:4055:e92c with SMTP id 6a1803df08f44-6d34055f03emr22792006d6.8.1730221620060;
        Tue, 29 Oct 2024 10:07:00 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d17972f73esm43780016d6.16.2024.10.29.10.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 10:06:59 -0700 (PDT)
Message-ID: <51b6692c-4e71-4f4e-ac73-fc87b9f2ac5b@broadcom.com>
Date: Tue, 29 Oct 2024 10:06:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "cpufreq: brcmstb-avs-cpufreq: Fix initial command
 check"
To: Colin Ian King <colin.i.king@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241029152227.3037833-1-colin.i.king@gmail.com>
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
In-Reply-To: <20241029152227.3037833-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_100702_801959_CCAB6E8D 
X-CRM114-Status: UNSURE (   9.66  )
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

On 10/29/24 08:22, Colin Ian King wrote:
> Currently the condition ((rc != -ENOTSUPP) || (rc != -EINVAL)) is always
> true because rc cannot be equal to two different values at the same time,
> so it must be not equal to at least one of them. Fix the original commit
> that introduced the issue.
> 
> This reverts commit 22a26cc6a51ef73dcfeb64c50513903f6b2d53d8.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Sorry for not replying earlier on.
-- 
Florian

