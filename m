Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE07D73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=be866/Yp5BAQJMoBK98y8dBJLQ2gHvccZfOQ5Qw+jAY=; b=POFTm3R7J7S9grhtfPo60C/ou1
	x9TiWU7DzM75PsQmvO6Ews2bMcgq4K+arZMAC0GVe5YHiV2p8+LjyqDKfcZTLb/hhfIY0UkzvdKRj
	iZ86ZFjpOCRB8v42DWfyXkd0FZqolfZMOL++rKjmevjs55orfsxJjH400FbtjUllHKFweEUhaWs8d
	490AC2RtQvTviroBOjBmprW9bDZtdpe5oJnfVI3ws7dXdkxS2t0DV3NXjer+2aPdRGS3uIW4mU6dU
	QHxBb6ey1MXgyAhmAzqLzV+2K1y3wg3I6RPlw0CZ4HEbzyg7W2QGFR/ETvjiadwpGuOWvUkw6tENN
	h5GS6oQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVq1-00000000R9d-1JY5;
	Thu, 29 Jan 2026 17:29:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVpy-00000000R95-2EBp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:29:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47ee2715254so7413475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 09:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769707785; x=1770312585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be866/Yp5BAQJMoBK98y8dBJLQ2gHvccZfOQ5Qw+jAY=;
        b=iOWWBQkgq+TmwiyxEnowLIOrNbnlu4w0VzLuMJ/rTRQN59dkPtyqTYcToo+j39RBjq
         lZ2619U43Stio9EZ4Rmc2rfJ3rXZKn81BtdrZuR7218aG/nnGqDGrVi3c3Mzi7Ot5EMo
         Dh4zmZj5F6aLfnxXMWIbq/qrmInygeMuCZ3QoZWG+g17VTunaLe/emwAbDYM+LmDkgOD
         jgXL5CgT36TSVOT2lNGRu9C7HMYkd8FpRJvWDckRqe+VVajoVGKZWsQsoFidi2dYfO1q
         z6oSg0SESAGzlM9yZB2W5fSY8NcsESLtPG7kGY6jEr1iwHbGvBDVnOCddwbET7NK6NP6
         tgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769707785; x=1770312585;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=be866/Yp5BAQJMoBK98y8dBJLQ2gHvccZfOQ5Qw+jAY=;
        b=hhzJP93MD9mz+nP8PfmRGC0vq6ay9m9x/yvuuq/4QsjcnXnCnbd/BO6qwH6vVETb1V
         z8+XfPDZCks4+RdHQpVDniuWqE19Cki9+2itLRMoUCGAwDw/c8rMwVDPaS6bKWlWjK6v
         T+fkeV5tyBTcpvmh1YCpJRiZM8YsRGAU0zP2CUetdtzMMsUMdjHhmF9g9M6dH6s5KxOb
         kM+MvFoP+GRyjsiySqlPW9jXirwYns5w7dXYMGVI/9EZHy/P83pv1aZbsPmFEGfln0AU
         UJJiUlCwHt3mLLY5XeFjIIe3JUOWQw4HrpDgd+qxMOdEwsa3Zcad2BcjnXtbIWsKwzJm
         5vRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDev/qhCczXK98wqTpWt0yPDZ53r8EI/VzljVvCX4P3iKPYZm+ifWbcdTdJut9APdKP58QAFTEy8Z7yGLrhtdY@lists.infradead.org
X-Gm-Message-State: AOJu0YxyB8t/5AJLlFBXZs393aD2063P08FW48x+Q8qnpvXMdqn7RA7z
	u0+uWMR28KWuEQOHSkWQVo+17/c315dyl3pVftW2IThJFFP2Fb9fCafQG8BTLozvx/o=
X-Gm-Gg: AZuq6aKMulXcjg8rPWki6KOBx/Lw9c5dV5vhIxZL35ZSk/RjADxmWKqcvX/Nopls7kq
	Ee+SoC7MJ/rlLgdkeQmwGRYDgBn3N6WQ+k7/0VMEIYlL3eCyCG34OCl0ph8aN8OuGP6rYbkyrNV
	FFnLsBRxcWXe1ARxWWHcSceh/K8Xe00fIZ8ljWlzZZ7LhBnV2+Auo+EFniBmIJO6gvbCothevBM
	7VIikyRGSnM6XioIBk+xhtjxIxXBASi2mm+zoYGe2+w9yYjyZVzX7myS/ggLG/zTI5ISsO9jKGd
	zmg73zFojH17alXoIBnpEyJJQcvPC/BsMBMEmguojwg7IzQ01Iy6HZH8ClnKEr9pdCrLZ1XTF0Z
	Rq2gmLIANQSIZf8y4p6K+opKxTC4GpffR8RLUVjXfN/bcEHp10skZA5T2XsMi31dkSl0Vm3kZuc
	oD3Uef54/cQhA=
X-Received: by 2002:a05:600c:350b:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-48069b9a017mr121874905e9.0.1769707784613;
        Thu, 29 Jan 2026 09:29:44 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da8eba27sm66755e9.6.2026.01.29.09.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:29:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 067175F878;
	Thu, 29 Jan 2026 17:29:43 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,  Joey Gouly <joey.gouly@arm.com>,
  Catalin Marinas <catalin.marinas@arm.com>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Will Deacon <will@kernel.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Oliver Upton <oupton@kernel.org>,  Dave Martin
 <Dave.Martin@arm.com>,  Fuad Tabba <tabba@google.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Ben Horgan <ben.horgan@arm.com>,
  linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kvm@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 04/30] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
In-Reply-To: <76bf33a0-968d-4b99-a157-3eef076af69d@sirena.org.uk> (Mark
	Brown's message of "Thu, 29 Jan 2026 16:41:05 +0000")
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
	<20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
	<87343o8jay.fsf@draig.linaro.org>
	<76bf33a0-968d-4b99-a157-3eef076af69d@sirena.org.uk>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 29 Jan 2026 17:29:42 +0000
Message-ID: <87wm1072ex.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_092946_808531_C2FFEE35 
X-CRM114-Status: GOOD (  10.95  )
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

Mark Brown <broonie@kernel.org> writes:

> On Thu, Jan 29, 2026 at 04:39:33PM +0000, Alex Benn=C3=A9e wrote:
>> Mark Brown <broonie@kernel.org> writes:
>
>> > Currently when deciding if we need to save FFR when in streaming mode =
prior
>> > to EFI calls we check if FA64 is supported by the system. Since KVM gu=
est
>> > support will mean that FA64 might be enabled and disabled at runtime s=
witch
>> > to checking if traps for FA64 are enabled in SMCR_EL1 instead.
>
>> This is conflicting with the now merged 63de2b3859ba1 (arm64/efi: Remove
>> unneeded SVE/SME fallback preserve/store handling) so I think this patch
>> can now be dropped?
>
> Yes, this should go away in the next rebase.

Everything else applies cleanly though so thats good ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

