Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF64E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 22:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nSIYHT+rwvtPlt9X2+sDNhWPHkSk17Ltt7LSNM66Go=; b=Z219O7FDMopyhrk9VmRq/sJoSn
	cTPBoTeiNolpZ7/uv9ct6Mzx+YMfL21mldfb6PugsDqALrZyTNGMZCA5OGYWcfD2ecWp9/2E+zvHi
	rrlNLrAscSL66TqSPczcaAHblhTDOA9RCMjQuuOSpfLHM+I3hI2Noa9EeFaaOmChdYrDPOMRVdL+S
	wxR0+Xbfk5qbAgWcjfS0eR42QLk6vX2yJHUfWzdLX63dbXjP7p0I43hNBv07LXytBaFqv1UO1/eat
	jo6grCDmbxF8MqiFTjbd2Dx4k3d8JH/rkcFgKtWB5YZFZsDIWmumGaXJObajXLne6aTDywh0hahvz
	gzOBs0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvvD-00000002u4q-3OQP;
	Mon, 06 Jan 2025 22:50:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvtz-00000002tvm-239N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 22:48:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2163dc5155fso212533015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 14:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736203729; x=1736808529; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9nSIYHT+rwvtPlt9X2+sDNhWPHkSk17Ltt7LSNM66Go=;
        b=GuIVb8XgKlzAuUMwIW/eTM4oV+NafRPvM2WOkVcMhWH6FygrthB0Lj0v6bgrM0Yf1d
         6H4R8Gj2fMprd1Lacs95DOmp6AjHNGByExYw8gCbx25lBp1b25Kg4WQ2vKnnUx6uZx5G
         g43bIMz3/U+xyPM1+eWxmAwgjggOXYZABQzEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736203729; x=1736808529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nSIYHT+rwvtPlt9X2+sDNhWPHkSk17Ltt7LSNM66Go=;
        b=TrwsFDaVg763ANXsTAUoxBjQA3KBMyJx4TiQNkhZs01Q/TjeLytw5cryds0+FuMXd3
         b6mr0aUGFHaH7Yoya6x9elnXEySTYcHTD/s6DNiEMQhBzbzXMNc4iyI5bitk5JqFwqz/
         pbjCfWQUV9xeCF5jMmJCm4Jn7UYYL0ivECCnfXopv2rmikHSF6CHpwzdQmY5RZ6aBSU+
         ZbhFqB8jiLZeVYfsTuvPV8t+BPZHpZRDAZhcMpyXKjyY6FKh6fNxZlTtMDnmpBX7tTWE
         rcfOt5BcRPPcEZb3/hQusXJ4pah7djpC0lZeTbP3doGApAJmka8WxJYkLyZRYyfM/yN7
         p+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXwoNvlkz5lH7sVv2PMSElW1rgx6En5t0V0Q1nhJucKHhZZZNdECjgpJrmbr5EFHKnNh3IKV0VQaSWtn7zgeDVz@lists.infradead.org
X-Gm-Message-State: AOJu0YxxWB4WCAjEJO0MrhyBZ3a0BWlvY11vLiW6MwlgJS0E7GX4nLUp
	OvZvNwLsaVwu91O2xw1rhmgAVSucSfg0xYx213wgAreL1kC/MADFHAcLXyqirw==
X-Gm-Gg: ASbGncsjRgHMaIDQGCdlMTwK34Oc8c5hfqyT8ZNMjwm9n9SMk8h3bjlM0NY4RC23DNQ
	OCK5Bl+e83pDEYIa2Djr8QpNxJDiST/Vq866NjpAah4lAEgStILSHNg8bv/WXpkqYJeRi+Qk1JJ
	P5Dj3muMWKSHSBU1jHiRZqe7SlTVNypu6nmLHkitdD+Cs+fCZQUwNpkCSljmdJX7r9GcTWaaVMw
	W+UVK6lXAi5aFxpdBAPx1HJk78pU3I3hYYq0C9pEB5DLdnqTul/vdjV12QzYgzbdNUZz1VHmnUg
	jZIInZZTKw6yl4xGIklh
X-Google-Smtp-Source: AGHT+IFo4GEyCYAMGPJ+m3HD0ATJsPEIdB1Nk6nXQdJLb7QXkhqift28kuZ4wANvJ2mz/1zFnWGjEw==
X-Received: by 2002:a05:6a20:7f8b:b0:1e1:9de5:4543 with SMTP id adf61e73a8af0-1e5e047021amr103106702637.14.1736203729569;
        Mon, 06 Jan 2025 14:48:49 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e36caf84sm29367712a12.74.2025.01.06.14.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 14:48:48 -0800 (PST)
Message-ID: <18dbd7d1-a46c-4112-a425-320c99f67a8d@broadcom.com>
Date: Mon, 6 Jan 2025 14:48:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Douglas Anderson <dianders@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>, Julius Werner
 <jwerner@chromium.org>, bjorn.andersson@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 stable@vger.kernel.org, James Morse <james.morse@arm.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org
References: <20241219205426.2275508-1-dianders@chromium.org>
 <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
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
In-Reply-To: <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_144851_674028_63F357BE 
X-CRM114-Status: GOOD (  27.27  )
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

On 12/19/24 12:53, Douglas Anderson wrote:
> The code for detecting CPUs that are vulnerable to Spectre BHB was
> based on a hardcoded list of CPU IDs that were known to be affected.
> Unfortunately, the list mostly only contained the IDs of standard ARM
> cores. The IDs for many cores that are minor variants of the standard
> ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
> code to assume that those variants were not affected.
> 
> Flip the code on its head and instead assume that a core is vulnerable
> if it doesn't have CSV2_3 but is unrecognized as being safe. This
> involves creating a "Spectre BHB safe" list.
> 
> As of right now, the only CPU IDs added to the "Spectre BHB safe" list
> are ARM Cortex A35, A53, A55, A510, and A520. This list was created by
> looking for cores that weren't listed in ARM's list [1] as per review
> feedback on v2 of this patch [2].
> 
> NOTE: this patch will not actually _mitigate_ anyone, it will simply
> cause them to report themselves as vulnerable. If any cores in the
> system are reported as vulnerable but not mitigated then the whole
> system will be reported as vulnerable though the system will attempt
> to mitigate with the information it has about the known cores.
> 
> [1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
> [2] https://lore.kernel.org/r/20241219175128.GA25477@willie-the-truck
> 
> 
> Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
> Cc: stable@vger.kernel.org
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Don't guess the mitigation; just report unknown cores as vulnerable.
> - Restructure the code since is_spectre_bhb_affected() defaults to true
> 
> Changes in v2:
> - New
> 
>   arch/arm64/include/asm/spectre.h |   1 -
>   arch/arm64/kernel/proton-pack.c  | 144 +++++++++++++++++--------------
>   2 files changed, 77 insertions(+), 68 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/spectre.h
> index 0c4d9045c31f..f1524cdeacf1 100644
> --- a/arch/arm64/include/asm/spectre.h
> +++ b/arch/arm64/include/asm/spectre.h
> @@ -97,7 +97,6 @@ enum mitigation_state arm64_get_meltdown_state(void);
>   
>   enum mitigation_state arm64_get_spectre_bhb_state(void);
>   bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry, int scope);
> -u8 spectre_bhb_loop_affected(int scope);
>   void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *__unused);
>   bool try_emulate_el1_ssbs(struct pt_regs *regs, u32 instr);
>   
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index da53722f95d4..06e04c9e6480 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -845,52 +845,68 @@ static unsigned long system_bhb_mitigations;
>    * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before any
>    * SCOPE_SYSTEM call will give the right answer.
>    */
> -u8 spectre_bhb_loop_affected(int scope)
> +static bool is_spectre_bhb_safe(int scope)
> +{
> +	static const struct midr_range spectre_bhb_safe_list[] = {
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A35),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),

You can add MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53) here as well. Thanks
-- 
Florian


