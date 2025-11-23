Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFA1CFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 17:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIANx9jGl2SWaC9mRIgpqWIi2tjrJHPgyOK0RQo1cKY=; b=nF0D6kTbic6t2uiZ4/6/lVEm4w
	KAt6VNpp25D4zoAqLdNuIW9p5sfWdih73tGOfKi6Wib1yKT1pOOWVcRzHhjRyB5c2l/2tswQRB5pj
	MDxwUL6jatbgYtit6KSwXRNkwi+xjvQGfX2zZCt53d1E+dqPqCfpX5MPJcJIGruHUAHp7/dS801N9
	ZOTtuLK0Vwf1HaYMdG2WgJsuZqsyUUmAiycFJbLCPP5b7ihPLpXr1QOm5cOwT9vjVhqYTS5AUHq9e
	Vh0L5v4Pfc4EUMDDUbmk2hsCEl1NdN06nZ9EvFCGLurPvl2t05tiCWJbG6FHV6m90nbhnS/3/+VoW
	/D190CAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNEFI-0000000AaoJ-1bgB;
	Sun, 23 Nov 2025 17:51:32 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNEFF-0000000Aanu-2gps
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 17:51:31 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8845498be17so51078216d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 09:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763920288; x=1764525088; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIANx9jGl2SWaC9mRIgpqWIi2tjrJHPgyOK0RQo1cKY=;
        b=NWnI117JkxF4kvjH0Rq2nVpLLH/uSWY2gBdmngIvcPMmQnUOmWoqF1+3o9f5NZXPse
         q1MoxBPaS4rBuPdn9pK1wQyp5mIp6Cmt1bK0qavlYEb9ruI5JLW1b5wSSw0D31tRuJmI
         Y91tBZGDhAJfnqElOu5HC/Wzswfk1jvFPZPsyzTgDJpoQrDI/+QOnmbVixcuHQyYLati
         yo740gj/4gaQjBVkESKDjW3hzgQLiBUrY6gB6K8os24CT60kz4Jn7cYtXS0uIPtAnxC8
         ywAi26nBG4aPTN3Sy6hejZPEm7ztaX+dJoa+uAy5+KPS74mtIXMuRZ3V18T5aC0d5CWZ
         sxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763920288; x=1764525088;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIANx9jGl2SWaC9mRIgpqWIi2tjrJHPgyOK0RQo1cKY=;
        b=eo/sOmnNn/L9P5y3GvJ6bamSAwIhzqOL42AXRtu+XgQBjNO7/QsgnpGlmIFa/md4qA
         iY6nj2LnMJShOQogvBY1UzhCjmVjvGe2qWFGIF3UxuWVfCPciF9sC1ht6r12Xg5MPwM1
         rDNiB3s2Y3+kQ0Wq1EmS5gE1Uw0gDsfR8eeMT2fE0IXzGKOhcjP4G05dBCW5yN/og/qT
         FEEGO0vqaOAbehu3cqDpqL6H8yxbeDhtIC5CuoMYTs4pYOB242dZavWLhRlN5cwjYBnZ
         kUQMhIutkONeInl+d9VgETucYOxFor6Jqs+43Ca3qDjBTd/aRX59X0+cr8KFzmttvIx3
         BfGQ==
X-Gm-Message-State: AOJu0YwFASSoHo5vQYdDKWYP/HBuUns2iShr53mQenS+MVg1s1Lw1trQ
	jOC8mlwFPvcUfnakV1SQ8MdEKSMB+KqTQA/N31XsVaSwn9hwl4Ek7Wy+Hr67E1YqQQw=
X-Gm-Gg: ASbGnctyB69ZqYXN1rX8xVy8DJtHl9X0XcsjFbcif6htbPdjhCRFN0GHixOjTzH2VhS
	JANIDcdGMq8J5AxBOcLV5OTgM1ng4p4a0Qb1PlnZcq2/ABphg39TNDqJxit2EyYTIWgBWCU5sGd
	0Dc5bPR78M9t3mLy5BybRgBF1OCZJo+EArmNcOGXUoVDOX5qoYIU7AEMWHKdJyk4hZpeWEZWFAf
	6QhSd4jJA2GFbPIqNbg7j2zIM+W4LsgbLnNd7M/v6+Rc+aKrzQSZMa0nld5P+XjpKDjewnCxwKx
	WGAUk1ZJEBCOwK8PZCc3ZKfRroOeesH7Lp+FzLn8vOZG9bRxmSDLWsYlOjQop9NObG6KyJM7pEv
	FxPSbCFvv972GrnCLzQyLgsfePPGrVnNN+yKZc/UkK53FphYWdtgmS0gjJQKywn+6/5O48SvZq8
	NbU9EC7m+Jd/PwtI0glcS+i7OKgddezNMnjR20DQDu4w0zFQTEsHMeK4acSw==
X-Google-Smtp-Source: AGHT+IGGmRjy6S6jG9UQOZ7re2IoKjO567YiFxEaApg45oVagihjcnDFg0s0qlsPTSkuzLAkIZrimw==
X-Received: by 2002:a05:6214:ac6:b0:880:78d6:fa67 with SMTP id 6a1803df08f44-8847c4a3e03mr126072936d6.23.1763920287620;
        Sun, 23 Nov 2025 09:51:27 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e5744ddsm84544876d6.45.2025.11.23.09.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 09:51:27 -0800 (PST)
Subject: Re: [PATCH] arm64: proton-pack: Fix hard lockup when
 !MITIGATE_SPECTRE_BRANCH_HISTORY
From: Jonathan Marek <jonathan@marek.ca>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, James Morse
 <james.morse@arm.com>, Douglas Anderson <dianders@chromium.org>,
 Trilok Soni <quic_tsoni@quicinc.com>, shechenglong
 <shechenglong@xfusion.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20251117051211.16108-1-jonathan@marek.ca>
Message-ID: <71ec790c-511d-7b57-a5cb-7c26c46257fe@marek.ca>
Date: Sun, 23 Nov 2025 12:50:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20251117051211.16108-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_095129_782930_BDF3DCE1 
X-CRM114-Status: GOOD (  18.82  )
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

Can you pick this up? Its an urgent fix..

And looks like I forgot it, you can add:

Signed-off-by: Jonathan Marek <jonathan@marek.ca>

On 11/17/25 12:12 AM, Jonathan Marek wrote:
> The "drop print" commit removed the whole branch and not just the print.
> For some ARM64 cpus, this leads to hard lockup when
> CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY is not enabled.
> 
> Fixes: 62e72463ca71 ("arm64: proton-pack: Drop print when !CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY")
> ---
>   arch/arm64/kernel/proton-pack.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index c7d70d04c164c..80a580e019c50 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -1032,6 +1032,8 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
>   
>   	if (arm64_get_spectre_v2_state() == SPECTRE_VULNERABLE) {
>   		/* No point mitigating Spectre-BHB alone. */
> +	} else if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY)) {
> +		/* Do nothing */
>   	} else if (supports_ecbhb(SCOPE_LOCAL_CPU)) {
>   		state = SPECTRE_MITIGATED;
>   		set_bit(BHB_HW, &system_bhb_mitigations);
> 

