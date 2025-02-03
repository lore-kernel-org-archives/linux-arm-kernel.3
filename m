Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBCEC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqYW+hN2Y2KDZOoWXSdQn18bREqQvJTWRQyb/yrvcoE=; b=MtxBxlJDAc8Y47uwzHoxaVyNsM
	t4eO9qWBdV2VKT0MxGFMgAx+DqUQWsKbvMowKpttCEi4nEv63FvKCq59ZFeiX5AH6vMy3efwAj5dz
	3E3UG24bvBQ6unL2IYw5oe8lPn7D8RTFl6BtYffGybHClyZhJFcvP6DBhmnLzk/qkuXvLHcZF7D8j
	J3LaqeG9KLVzv+hDdVJh7vRqTW/fYAlFvzjxIj3lVP/x4z5O9Q/O/wHWM3benZ3eUXVU7uzEheLeV
	gHIJzH2MUOTxCAaKbmO55Ss2gXkpVKt3laHR4P0moOEYDL5siGdibtlr5RbJfeQwsI1dn6GkW6Kt4
	zeZOhH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuBO-0000000FBKd-2zD0;
	Mon, 03 Feb 2025 11:00:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetsk-0000000F8zp-0epf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:40:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385e27c75f4so3545371f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738579244; x=1739184044; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqYW+hN2Y2KDZOoWXSdQn18bREqQvJTWRQyb/yrvcoE=;
        b=gkH5Lv8O9NIQVKjtKFdbtjAkdr+9njMRkwadsebLvKrC3SkW/7wVouKzp6ueUzfI/i
         rcsDnGJvPEe3RJOJufpU+LOpoQ8nF9a3o4hcQFakc+ZrNk9DxTyvtCZWt31HbFSfr6MW
         WcUUAeJ+xnszGwQ+DLGh4vH4+brRP/fE4Cw8NCdA8q+2r/De+ISWmcB+8PDjRUqCwTwN
         IlTEHAijH+624J/JXVnzkzhzQ98IMv0RJXzo3MjNk7xjU3juYUopc4znBAXgQa19dKuo
         R3uYN5vHmilfX9rJ1ZxyfQKSJFEFn1htE4m8ohvx64jvfHWH1vMvzETHzUInpDlpjM8+
         B/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738579244; x=1739184044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqYW+hN2Y2KDZOoWXSdQn18bREqQvJTWRQyb/yrvcoE=;
        b=mMGqBGlbc3naoulej+ou18BWaV4xaeyW9H3tQIVUtsgDD0QfMWbGn47T19dJfaRYj6
         PkLmzfWl6D1vdxn5ySGp/+tneQ/sD4DL9VuDXFnxtOPVPecE9bFwllx8dFRDpPednpJf
         HIpgUEoXrSw9x3jpLlS4sa6ZUjVSNO5vqEuPD1ZU71m6ZfGWoJyPYHbMHC859lOZWJxB
         XI3NKYFJjOTlB0oB4dD24m53fYRSVK9OBTxppN5wH425oTJOsivIHcUnEqnWm/o4LcWT
         BALZvIEfNfWOHtB9aqZihP1tv4YeeTjNOp4Oev9Z+Kop0TMxqZromLPZreeaRH0J7Uvs
         20qA==
X-Gm-Message-State: AOJu0Yx1hAXO4QD1oCkGFjRyukmcsHnWNy8gjf0uScb5mhR/EFACeyjw
	CS5ekoCOi87RWF0zydu873Pl2oyy1Gf210eQ0oxCwuq84Ao4iQG6bwkk0Zj57tQJn6ov4W84S2i
	J1Ws=
X-Gm-Gg: ASbGncsqf2NrCDahXMXMpOcbupe9HRjpZtULK9KNaZk2CtKTYo7Mz0CJpOp4kc0EebQ
	n2ANPFTh/AU7OBnEwaHVKfxA5eGG9KGgqxfEHkgyDLoEpeujWUk2mp4jY5IWkVgUb9pUAqt3Kgo
	53+G742lyDf39lsAdGPtWho1Hh4QGOaAm3GpRTB5/r3v1Ag45wgwg9V75bm1KYEwZ2K3iiBqYIn
	lPnRjs7EUqmbeeXZafjBsZqaxpnlVm0j8XZ2R4vlzKJobUv0XSXTS3YNn7WzscvKfzYG5yE/GKl
	gGuqS2gO0RV7UoRWwAvkP+2KOA==
X-Google-Smtp-Source: AGHT+IGOMd7k6IiFZ/qRr89XaNMzuLGbCX4OtGntn53AQk5HgByLIRtP1twYFWrJFYieIbOY46NAuw==
X-Received: by 2002:a5d:5846:0:b0:38a:2658:bbc7 with SMTP id ffacd0b85a97d-38c51b5f3d9mr16615608f8f.29.1738579244326;
        Mon, 03 Feb 2025 02:40:44 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf555sm12549296f8f.97.2025.02.03.02.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 02:40:43 -0800 (PST)
Message-ID: <8c96613d-9952-45aa-bff4-3a4570de976b@linaro.org>
Date: Mon, 3 Feb 2025 10:40:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] arm64/sysreg: Sort sysreg by encoding
To: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 broonie@kernel.org, maz@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
References: <20250115162600.2153226-1-james.clark@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250115162600.2153226-1-james.clark@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_024046_208164_66C65B5D 
X-CRM114-Status: GOOD (  11.51  )
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



On 15/01/2025 4:25 pm, James Clark wrote:
> A few small fixes and then sort and ensure sysreg remains sorted due to
> the discussion here [1].
> 
> Applies to next-20250115 for the review but I can repost after rc1.
> 
> Changes since v1:
> 
>    * Use same matching mechanism for both opening and closing tokens so
>      also collapse those commits to 1. This now allows trailing
>      whitespace on closing tokens which may have been hard to spot (Marc)
> 
> [1]: https://lore.kernel.org/all/996c7843-7f51-49a0-9122-e688e37f9902@sirena.org.uk/
> 
> James Clark (4):
>    arm64/sysreg: Fix unbalanced closing block
>    arm64/sysreg: Enforce whole word match for open/close tokens
>    arm64/sysreg: Sort sysreg by encoding
>    arm64/sysreg: Enforce sorting
> 
>   arch/arm64/tools/gen-sysreg.awk |   38 +-
>   arch/arm64/tools/sysreg         | 1010 +++++++++++++++----------------
>   2 files changed, 529 insertions(+), 519 deletions(-)
> 

Gentle ping just to say this still applies cleanly to v6.14-rc1


