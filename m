Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30657C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 03:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5w5RFyx5Fde3sjleuIUHKTkCI9P3qZB2/QHcS9ihhf8=; b=zgIwaNFaC6lmf9Bd7V3owUchUz
	FnypoLI3W1zTZceEkvUp7ffYOeL3uygDx0EHhqvLFkmfBa2LGWngxoGKUM8PCgCmdGKpzxv+8UEoy
	XlHPpJDkPQWTSKZ8zm8rzCafL1NN8u+m6dWFC+cyspRgzzhkf9UUIx2phIpTzUff3jIuO7YC98mgN
	Jv1g9gkHC9Jn4Dc7VFcLYpPTMWN4JE8F35kBhOBnF3z/polHPyTvFvVFsvwteCuRuuRczVQ76JDr1
	PJOmLtaRm5mUOgGOf4WiUmqZ3Gf/fWE01EFGWNDOTYKGuMzfXNX4SIxxBrriKVIaHhFjSSVXsOzXt
	UU5EA9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73sy-00000005ha0-0P40;
	Tue, 22 Apr 2025 03:01:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73hO-00000005gXP-1TKD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 02:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5w5RFyx5Fde3sjleuIUHKTkCI9P3qZB2/QHcS9ihhf8=; b=TIQOir1W+IvuvwdMOj1H2ZXARx
	sziYycX6ZodFHke9tjjfk0O2beL/HMNVdbIHu+yG3wUqNeevnp5VAGpjlP9eNhIL/jzK0Ry/IXncF
	Yt9tpGtS1JSlyBhpcmvqiN9kf9Kq0OSRion2xFCedHzjMEZAroMrgGvEENfG5BH0y5/yn0HQRdqp4
	pAzxFDR+79/g6ZkpWVhOLIRHJUsa0YNkYU0Cv1zyhaaQSseB3Uij6sS71QNDocf8/iMhFQGOAdKTo
	UkibkjAvBVUmFbv7FWp4cZZTtJh8JIxfsLzp3OUgRTgiDqrmokmue0XR6Qd8wOWzv2Auj5/p9GPcd
	lEmXsSQA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u73hK-0000000B8Eg-0IRn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:49:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so33161455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 19:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745290159; x=1745894959; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w5RFyx5Fde3sjleuIUHKTkCI9P3qZB2/QHcS9ihhf8=;
        b=GzT3Ag86T3yTsWEenotuEpVnLvybyQWwgtt7n7HaJHKtDeNxNG8KzhfGSq07Cxd2Jj
         IpKmk3pVvSThw81FT1neMy2kZj1iPzGqi5rkCrXP7fzxG/hxeaP2BzSnZIU8nN/TsJp7
         pBxXYRr3ixniqVw6GbpGI4HMQePjy96+FZP5eki+g/B04HU1cTknRyBA+zIJJPm9w84v
         CInGTUvL7P86rkGK01xKBlBihrL2q9X8JAueMETFq0lHCFJ6lFdCaH7tGq2b4hpq2mOu
         QfJLewgQhv1r3PFNiieUtTQbzooH9xOd6hcE0TW0PoQE39BSRgn7COLNDGYa+gHL7Zx6
         mW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745290159; x=1745894959;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5w5RFyx5Fde3sjleuIUHKTkCI9P3qZB2/QHcS9ihhf8=;
        b=QZl/ot6ufFYzjA9kmPizE9jaqD2Mo9eujZZHRdkroGpSuBMBxI8Xtq5CEu/3GW1yyN
         ApK7QFXPdm4xF1ywsSEZEOUqSRcwhzmTCoHpLTd1JFiAQ8Olu0LEbSINu8+6u8Ov1EvT
         9AytsVHi9BGN29XIrqYcIrst13TccZNcfett9U0Kd+WWRfzvaL59ysWEvg+YWngIKdxq
         wDLKPacjT96NjEqJMd1j/3xjBTzFO5c+bjygyQaf/y3f9kgrulNjtpfsqBMgYpTUb0Ak
         89aDWLhQj111TNePeM+bug4XKlkKqK40uVBmh2QxgcsvVLHXY5/FvzbP4hXRBB/AmT//
         tbTA==
X-Forwarded-Encrypted: i=1; AJvYcCVjzPmsvZvIPVTp0A503wvTNvuKnbc14Ad+0JSJypbQJfn6alF5lyi9PkiwpYTSHWTsDAivnfo8eeV/Q64lskCk@lists.infradead.org
X-Gm-Message-State: AOJu0YzqRuyIFiMIWAiw4EesRgAwqMbrLbysqbRu1QVoQY4iBArXJBPU
	n0+hK41WHGRhHUoxIay6cwI+UjhpoZH09r6ZBdiLI/qUBmGRoh8c5aXpkz8wy+4=
X-Gm-Gg: ASbGncugzF+IM6GTRw7zhe6AKv3ml+IMAp/rwdLJnUbIr/yWF066kLOZCLNaZIajSLc
	F8rLE+0XwyujxGfzUMIpWw03jL6IHdyinkBMBTbFQVyAY4WT1MciMvtdBF/zHIVLETTmKebcoZ4
	59prKOlNGQRLEN6iiNua5+Ai+6iupxsEL9j0wqMMY6vsQMDl8snVkx02pOGzcSbiKN6dKjNuq8z
	MxIwJWVYJ9Mi7hF0Xa1RdBRmqKBGiQbFWmb9FJvODEygG4bQUXrceMhB6a0PTaOXhr1/HY97wHe
	EKKshSLI29K3CYWwLbz/g1QQGdIAFIoyaLr+1QCD3QeKAx8fh4o=
X-Google-Smtp-Source: AGHT+IFHOUnGuFF7OKg26doAxP8+/Wmt3TKEqsEMokxQaF5Gq9QsD+XTtQwXLVRgj0GoP+lTjP1sNg==
X-Received: by 2002:a05:600c:4e8f:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-4406ab66eb4mr131770005e9.2.1745290158755;
        Mon, 21 Apr 2025 19:49:18 -0700 (PDT)
Received: from localhost ([2.216.7.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9e50sm156862795e9.6.2025.04.21.19.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 19:49:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Apr 2025 03:49:17 +0100
Message-Id: <D9CTQ5P0YSCF.2802I0W1M4AWM@linaro.org>
Subject: Re: [REGRESSION] amdgpu: async system error exception from
 hdp_v5_0_flush_hdp()
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <frank.min@amd.com>,
 <amd-gfx@lists.freedesktop.org>
Cc: <stable@vger.kernel.org>, <david.belanger@amd.com>,
 <peter.chen@cixtech.com>, <cix-kernel-upstream@cixtech.com>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <D97FB92117J2.PXTNFKCIRWAS@linaro.org>
 <1567c4e7-fd5c-42d4-8278-e1bba2ce46cc@amd.com>
In-Reply-To: <1567c4e7-fd5c-42d4-8278-e1bba2ce46cc@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_034922_555882_0B0E7B11 
X-CRM114-Status: GOOD (  13.90  )
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

On Wed Apr 16, 2025 at 12:44 PM BST, Christian K=C3=B6nig wrote:
> Am 15.04.25 um 20:28 schrieb Alexey Klimov:
>> #regzbot introduced: v6.12..v6.13
>>
>> I use RX6600 on arm64 Orion o6 board and it seems that amdgpu is broken =
on recent kernels, fails on boot:
>
> Well in general we already had tons of problems with low end ARM64 boards=
. So first question of all is that board SBSA certified?

Yeah, I can imagine.
I can't find any info about SBSA cartification for that board hence I'd say=
 that
state is unknown, hence most likely "no". At least that's what I think.
It is a good question for cix or cixtech.com-based emails.

They have some updated potentially unstable UEFI firmwares to test though.

> If not then the chances of that board actually working correctly are very=
 low unfortunately.
>
>> [drm] amdgpu: 7886M of GTT memory ready.
>> [drm] GART: num cpu pages 131072, num gpu pages 131072
>> SError Interrupt on CPU11, code 0x00000000be000011 -- SError
>
> Any idea what that error code means?

Well, current thinking process that it means:
-- bits 31:26 system error interrupt;
-- bit 25 indicates that it was 32-bit instruction;
-- 0x11 in lsb is probably implementation-defined which can
be anything like bus errors, parity, access violations, etc

That's probably not very helping here.

Best regards,
Alexey

