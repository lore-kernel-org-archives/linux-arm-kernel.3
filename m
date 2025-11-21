Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B335CFA768
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zySQOdwGxFpkY27ErIngTUBlvdPwiMxRULejkAbxCU=; b=xXzLdaAPYGa0g6CCyThMLkvEa3
	zdSqDcKRuv2dG2/MtQj1t/lPJ9BIO3zSuS/G8pT5c9yc0yIBcRNd44fhaMef/oG7EkoAmd8T3s0zR
	4oBU/7AURumyBl1cq4By/tQs5dlSm/8/0FGrlYtMUNU3d/ck5byVld2FCNKnDvCGtWpNIc5PnCj1p
	43VJJGKTbdssNNH25ABdbD9c8FbexLE313ut1iVCkg3DQReU+XmzEpegbtShYLyQ8PqTPj1d5htNR
	KLRDAw6HCBZa/y63HNaujMdadoyMSEDo/2m4+iNEsvWv0cNrgmDYLXDW/hUxjFQfmZEvi3L1Xi+b4
	NXtYu15g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMU23-00000008iba-2qli;
	Fri, 21 Nov 2025 16:30:47 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMU21-00000008ib1-1XGj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:30:46 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso1781129b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763742644; x=1764347444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zySQOdwGxFpkY27ErIngTUBlvdPwiMxRULejkAbxCU=;
        b=kALQ2tekd2CpoCw2S4atHZ7Xg+UKM7OVfPmlJpReofEEUCa9xRQHZtxtkaDHZldkW5
         Wj13H7v+d92VX9d0iNjzeUFDH66PPAWiNv+PVOxQKzhsgN1ZsYVgLDYb+iSmyokhH5UC
         xsVsvgWh5WO4uw4LJ1/RXfW/kPW2FWNMy9beBZOVHUDWK0oYq6wJVoAi7Cc+hcfLGFbq
         LnLD9W7w0OkmFpQeEpUi1of5n+WdEjgpLFELgg9+bhGr0rShn+ia+ZQ4a16zIec2NEcf
         GLqj/6MO9i2YpuVnWU6NQgQkLE5nVoXhh4lgqTM4N8ibbjNHRGBTvN26e/0F3DPOZYkP
         U9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763742644; x=1764347444;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zySQOdwGxFpkY27ErIngTUBlvdPwiMxRULejkAbxCU=;
        b=o+VCW9+BCPUiX3k3Bvagq3+/rsfnqGYw8v43rfF8F5SFrzSPMEWsugxns9/atAFxA0
         MIjRVj9885plAQZhPha7xmF3eu3ja3KRRcSbsh+MWoZH1x14cpV5yYr9AnfHTHXQvejN
         2WzTbZCwfROvmPxm4QVOsRV4AhDYZDXkYO20KGDH6xeHt51QtRCMAgQ42UEutmCAS9kv
         olWmMP1kDrTKWw+05Jhv0eVQFN7CIfM+Dxy5lIZH+CJDBcZUxW4qIhqPvjF5D4K4qvhd
         hCoQ8YAIo2NGiPs8CV0uN8sfeMBkieT+F4w/LEAHItN0FMxNwTVFX6NG7duM3gwWFk+R
         aszA==
X-Forwarded-Encrypted: i=1; AJvYcCXI/tbVMJZo2CpP0fhxUDGoFFVN/qk4rl459/3BYWNcTZQU7XJ8q2vRGaUR/1ad6xhc6z8sCNTJf0t4DMo5wdxJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxqZ0KJ9HpeOCYCwmqri+LNtundtqAE4RtBlqYjAt3thgXdOMTy
	UFO1mAD9PAEnqybIYFtxzena+XmThJZAZnLCRSr8RFWQvoi6eCYrwAhxkjKozGJ4lyw=
X-Gm-Gg: ASbGncvtZHHwfiTZQLecXwkuXpccC1o5ZHb3F7MtZuKJQFl+m3TVZm3T5o361/DTQBe
	OtVnsJH8GSjXtrK8DPOnGCwG9GAIk8iQ3iIpbT9LL414rGoYnaIXvwEJAqppG+3XAbSRrmzFHVl
	OPOBweorxVRn3JuQc7NV580oGsSdzLOMn89NEQRTWX2lB4W2x46UqShKwfngjyAmX6CFwOtFJTd
	36DvO69tNeVi36zw4oPiz6pG7TfFjjgsF8eynRwaVIAHCvDQU4CDF+YyBUA09IH6+upv4UdGUWI
	2n7o6fzuvIvFxIh9wTcQtyZcAmdCSfpWeJk6v5crYB1IspzEixFdKJqN1gsnFSTx4nOCBYgCWjh
	D5iXeCoOYlKZ6ludLcfo2nIcu7grma2gImTp1uC/+LLTQx6DDMU6+jdwPK8jVhRXhYfbMc8K4h5
	AOdOsU2ByBB16qrl2IhDixq1yQJINj
X-Google-Smtp-Source: AGHT+IGR6kXLQfWOqj3ROiSJXt8B7HXDEY6evWJWJeMFCfbxn2XfmxkaSR6X5pAKpq9yjUhxglQGWw==
X-Received: by 2002:a05:7022:2390:b0:11b:8b4b:bff7 with SMTP id a92af1059eb24-11c9d866a70mr1156623c88.39.1763742644015;
        Fri, 21 Nov 2025 08:30:44 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8083:8d:38f1:8213:f721])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm26561874c88.7.2025.11.21.08.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:30:43 -0800 (PST)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Luis <luis.machado.foss@gmail.com>
Cc: Catalin Marinas <cmarinas@kernel.org>,  Will Deacon <will@kernel.org>,
  Shuah Khan <shuah@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Oleg
 Nesterov <oleg@redhat.com>,  Mark Brown <broonie@kernel.org>,  Catalin
 Marinas <catalin.marinas@arm.com>,  Mark Rutland <mark.rutland@arm.com>,
  David Spickett <david.spickett@arm.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64/sme: Support disabling streaming mode via
 ptrace on SME only systems
In-Reply-To: <05dd180e-f12f-44ef-96e2-2a6013da14df@gmail.com> (Luis's message
	of "Fri, 21 Nov 2025 11:25:30 +0000")
References: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
	<176341325906.789443.15370787298292895484.b4-ty@arm.com>
	<05dd180e-f12f-44ef-96e2-2a6013da14df@gmail.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Fri, 21 Nov 2025 13:30:41 -0300
Message-ID: <87ms4fmjpq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_083045_453889_9B89F1B8 
X-CRM114-Status: GOOD (  13.52  )
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

Luis <luis.machado.foss@gmail.com> writes:

> [off-list, as I'm having bouncing issues]
>
> Hi,
>
> On 17/11/2025 21:00, Catalin Marinas wrote:
>> From: Catalin Marinas <catalin.marinas@arm.com>
>> On Wed, 15 Oct 2025 18:56:35 +0100, Mark Brown wrote:
>>> Currently it is not possible to disable streaming mode via ptrace on SME
>>> only systems, the interface for doing this is to write via NT_ARM_SVE b=
ut
>>> such writes will be rejected on a system without SVE support. Enable th=
is
>>> functionality by allowing userspace to write SVE_PT_REGS_FPSIMD format =
data
>>> via NT_ARM_SVE with the vector length set to 0 on SME only systems. Such
>>> writes currently error since we require that a vector length is specifi=
ed
>>> which should minimise the risk that existing software is relying on cur=
rent
>>> behaviour.
>>>
>>> [...]
>> I don't think we'll get gdb feedback soon. Thanks David for the LLDB
>> ack.
>
> Unfortunately this flew under the radar for me, and I haven=C2=B4t been f=
ollowing these
> discussions closely.
>
> Is there someone working to rectify/validate this in GDB from Arm's side?
>
> I=C2=B4d gladly review it and get it through into upstream gdb.

I will work on it next week.

--=20
Thiago

