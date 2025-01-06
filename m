Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41908E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 22:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5di1ZJTIkSt/0vjsQI3NGZHRVROu2YShhixW2NJYijg=; b=ye0ZQcgM56R69rTjIYuFbtZnPM
	4JnxzP+3KTpxXheFQ1bVKt6TLW6Wr9BowmE+l84+Npq6swgTxAT7/5krsYYwGeWfjKpvhUO62/YIz
	c5uma6vahSJfArahECeYBn/j79e0IZl/y8ZEwSxnoBYHbLF7Rt+/nYCQZRFc3Bsh4AplrhS4wQRWk
	F1eTmb7RzfdCyd+X71qCK74Z/5XKYS877CCfg8HkhZcttUl7GbcBnggJVXWc3EwYj5OwOkCunDNmt
	gcb9Vq2apdVlZ2muwd9oyRoxxkG/GJT3SHMkmb9DH2kaE57dXSGa4K8ObrNc8kpfXVDmxM9p48uy1
	VatsBQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUvg2-00000002sxJ-105F;
	Mon, 06 Jan 2025 22:34:26 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUveq-00000002soU-08b8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 22:33:13 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-303489e8775so167647861fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 14:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736202787; x=1736807587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5di1ZJTIkSt/0vjsQI3NGZHRVROu2YShhixW2NJYijg=;
        b=EOa/MPfy3qKocVdeWtLhmMxD14zv453hmKDXPChhKXUaQqJIXsqg1eYfgcjzq7BXkO
         0UHoBGstk+W4qrw91GVGm8P+YObn549Oqog3W8fvlURVAwSJaI1PDnqVwCs4nGrJh3WF
         e2p4EIzwM/3uoGn0fImaj8jYdntFab8AzmfvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736202787; x=1736807587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5di1ZJTIkSt/0vjsQI3NGZHRVROu2YShhixW2NJYijg=;
        b=NZpKW9utOyBJXFnkaMBLe5gN8QH4xdSWxRwmtbi87GynA+29O0A/poNirTejQb5KjL
         i0bzT3WaC+xa228mfA/cM4MCBSmoyWiIZ6k8edX8xRWC8Ycf2lOJNQtAEn5fdvD5VAIY
         LFiGfsNs/2MVR7MU9OTkaWkNcaBsKmd5aD06RDUMwaJvIipa1LscLs7YOftDC0epmYF7
         QNfpeuG0kdkTJqdeYG9i9Ld+6Omh5W+9n2d8TejebYysLzFvLE/PVK7B8RdZ7M2a5cl0
         ZabhomC831macIroNadfrQmkMHwgTQldGHUJ1XnA3/O6HmgOtDCdgwLhXkgr7zEElekc
         KsrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTKosHRGvl6O0PZ2zTFfjd7B5iCnLadhYdFf0F1pbOtalvFVTWkE5JoxF5qfYFHKlskWlg2gvxy019u+Bzv//x@lists.infradead.org
X-Gm-Message-State: AOJu0YzrCyfpzmk68OH8usNc0lTwxD62viOBeY0+XHYba+6P9nNd8JNb
	ApzxCqyaiIZO4iMQXxxub8WcDC4w8ikK21fV/EDliQEJgGj9/I86wUEZdJ+Myx6kdCsaDo6oAHI
	=
X-Gm-Gg: ASbGncvyMf4eyHZF2URMJVDYo9nWfJ8/V/yC1DDxGLIauIoRsSWWAF/mQh+p7t5empw
	m1eg9skwUwyptUONbwckYaqpVQAMW1Sz7aPqOmhYJIHtLzVxBH1H5hkCMY41dyM8XLSX4vD0DcZ
	0Ame60DAF8DrbChDenWezL8i4uDKPE4UWiswY45ov8eNmAk9+0GK2FvmKxItKltzdiB/TOq+4yO
	nGGbAgrgh7OgJZxO0UBzYj1+eWVcCw03ulp6J0t9fz0LIdZITYnGXI8CAdJExBDeAmJVDPWzy96
	yPFs/N5C4qTd6/H42jRf
X-Google-Smtp-Source: AGHT+IGBxI5lbfQzArxiSdfHAzvSCUbyDcLFq6vp1/k2o1rTJb8GAIJSLYWw8E3RyIm5ShUJDE5hlQ==
X-Received: by 2002:a05:651c:b0f:b0:300:3a15:8f26 with SMTP id 38308e7fff4ca-3046843a5femr176993281fa.0.1736202786873;
        Mon, 06 Jan 2025 14:33:06 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b069f04sm56985931fa.89.2025.01.06.14.33.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 14:33:06 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e3a227b82so13625702e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 14:33:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXp49v4vRR9o5Wun1NSjyehdOF15PTSIwcnj4H/qKmMehAFtMf6yhUc9v3euPeHB/aGWzMQcW8dpxPWVk2cklSn@lists.infradead.org
X-Received: by 2002:a05:6512:23a2:b0:542:1b86:7c1f with SMTP id
 2adb3069b0e04-54229522934mr18141915e87.4.1736202783870; Mon, 06 Jan 2025
 14:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20241219205426.2275508-1-dianders@chromium.org> <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
In-Reply-To: <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jan 2025 14:32:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U6t42VNFSY3Jk1XUk+O=B8VnhioQxOHMv86ZH0BqLJQQ@mail.gmail.com>
X-Gm-Features: AbW1kvYZAqrZVb37fi_gK8pn1DP2gA1RSqPKabqLChsYVb9JJqj2V46xz1vb8Rw
Message-ID: <CAD=FV=U6t42VNFSY3Jk1XUk+O=B8VnhioQxOHMv86ZH0BqLJQQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>, Julius Werner <jwerner@chromium.org>, 
	bjorn.andersson@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_143312_096570_B92C29B3 
X-CRM114-Status: GOOD (  14.23  )
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

Hi,

On Thu, Dec 19, 2024 at 12:54=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> @@ -916,9 +932,8 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_m=
itigation_state(void)
>         }
>  }
>
> -static bool is_spectre_bhb_fw_affected(int scope)
> +static bool is_spectre_bhb_fw_affected(void)
>  {
> -       static bool system_affected;
>         enum mitigation_state fw_state;
>         bool has_smccc =3D arm_smccc_1_1_get_conduit() !=3D SMCCC_CONDUIT=
_NONE;
>         static const struct midr_range spectre_bhb_firmware_mitigated_lis=
t[] =3D {
> @@ -929,16 +944,8 @@ static bool is_spectre_bhb_fw_affected(int scope)
>         bool cpu_in_list =3D is_midr_in_range_list(read_cpuid_id(),
>                                          spectre_bhb_firmware_mitigated_l=
ist);
>
> -       if (scope !=3D SCOPE_LOCAL_CPU)
> -               return system_affected;
> -
>         fw_state =3D spectre_bhb_get_cpu_fw_mitigation_state();
> -       if (cpu_in_list || (has_smccc && fw_state =3D=3D SPECTRE_MITIGATE=
D)) {
> -               system_affected =3D true;
> -               return true;
> -       }
> -
> -       return false;
> +       return cpu_in_list || (has_smccc && fw_state =3D=3D SPECTRE_MITIG=
ATED);

Upon looking at this again, I realized that I can fully get rid of
`cpu_in_list` here and the whole `spectre_bhb_firmware_mitigated_list`
variable. After my patch there's only one caller to this function and
it only cares whether the firmware call can be used to mitigate, so I
can rename this function to has_spectre_bhb_fw_mitigation() and
simplify it and the caller.

I'll plan to spin this in the next day or two and also include the
proper loop value for Kryo-400 cores, since I've got that now.

I'll plan to keep Julius's review tag unless told not to.

-Doug

