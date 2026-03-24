Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEABF54ACD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHhlIbgR51v0pWgOdMRItIhO1Sy0NpL6OXQHGCDdAtk=; b=tiiQ+3TbkF/Vw1IeapflBaf57U
	SYD48xY1KC9TQsNM5t/R0I/TjhbNIBySAp1ZuGaXlIAsXmPk/bUaWhuNqkC9urGHeiamfF7JnJpb8
	vM4xEVzqKMyaF0LqeLcAacyqITlC+L4rIPzcnEFCRxDtQ+AMzpRgvGtAJZJU+DICkUBBDEyQgL8HJ
	YtUQkGewOYxiS24KDW7MDgmXRdcYTbDJVM2hYNHmKzL0qy9nMfqprXq/IJLFHJuJGzgKBb/Vo8dPj
	7sI4LO/PmeEHHjfmQ75ErMKiGpqHXwqLJd8Ab3Ol2Y26IzHxj4aWW0j31XicWQOGb53JZBktrazPq
	vSK5wZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Si-00000001jmQ-43gu;
	Tue, 24 Mar 2026 15:14:32 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Sg-00000001jlH-1zAd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:14:31 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-509069a7a7fso611771cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 08:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774365269; cv=none;
        d=google.com; s=arc-20240605;
        b=h107tl8iPuAXBMot4TAr0NVVI53juIAd18hlLWU6pNzMFCQg21dDe/OmtvSoo3vyyR
         CkNTh9jBm8xT7skxzBN3mEcqsx5lCHiaHzV4dqnDAT8CrZrMz8G+6pNmjAe5cbi1WfMV
         3Pz1O2Exoschyhq+RjEJpAaT9K59hNHL96u3E/nQyzW+BtXSsrj0UUZ26qEEwvDPTKRP
         +cbaVSMK5qb+tfNCdBhQnFl6BpFq4mcxklo9z+q4dHE2SxwWSDCf7afX5SZ64OZjEaj4
         JhVh/uwL2CvZGstjpxi2I0z6pskvSuSM2fLavc5EjWDkOIAJwxxxwei0nqSb3pDNavE8
         3QsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OHhlIbgR51v0pWgOdMRItIhO1Sy0NpL6OXQHGCDdAtk=;
        fh=gCPnNF99H8k8iKH0YpH4XofejhA2p1eOTMEdN6kZiDQ=;
        b=LTrdrwZzPniHPVtodJZRz0B6J4Vt+iXldhAmEmGnMkSxh64oMoKCUSqEDJN72/e+sI
         RGn8cVbAZu+MPEzF1r5TBOxwKFvPyZsWMeCjMv2+v+KJb/NZrlKchkzV+/iHvR07uFh0
         vi8CdZKTuDYqAhTGHdEx+D7kUxcpfNkoaklg6sYKHHbHI7M+86QnYTNE18vdj2Yp8Mef
         Zjxry6q3Ha8iqwqxiB1Z38CRLs7Su5L3ZXSO8onmI3gdQsWJhU0xHIEGKwRB06zl/WtM
         wtstqKEN/L4WjaCAZ+0w+RCQG9hyKQ7sVYLli0x+Wt7t8dZvmfAbcb9GpWJztWYF91+f
         LOUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774365269; x=1774970069; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OHhlIbgR51v0pWgOdMRItIhO1Sy0NpL6OXQHGCDdAtk=;
        b=CDa2juZ3nUtr80iwebBY5miND5f3bQPoDMPFUijmxZYw012zaTDnmvRlgboxs73lSr
         D+jUtX7qdzCubi1rnJpJVpr2QzDvkqARU6zXpdKu99Tl69By5kq5/RSK/I/bxv2CjJf+
         P0KaE213Paz1rCGXhuoq3Mj0xJjfgXQMo0s3ng66Lfiql29sPmSHpKWJrD5roqVRwXKl
         n2zcRRu01aBT7aRfvFe/9XD+qBlpHw7L3eyNmOqS6V12MlhicmCk+HmS3ePLZsfENuVt
         5qEXTGdQzuXBuNmzgKH/NtPV+LyvBLAlRmgI3e6+H6ntSzj6m/PCwBPvhWuuKNdbPWWp
         d7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365269; x=1774970069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHhlIbgR51v0pWgOdMRItIhO1Sy0NpL6OXQHGCDdAtk=;
        b=TLppDPcnttJ8mHpVBiG4/4hMaEAO1wBdOF0GNEyYOkhvkXNskznjPyQMLv525L1C+h
         T3kMye1lMkGIWj/5G2cg1K26kwuEvA9aON2iOLWkPbq4qYbTTCG4x31uI4TnXOguJ1m7
         myeAVxWrEXPrJYQQQg9zwipyQeFz291hSLS6x1hwWiMEAvqBy2FWuTRhtBbUrjsPkLCl
         h892bHeCX3f2noh2nH9YHhGnTld9hPwq3MS+XQyxTBVhyci/gWMGvLbUhYyl7aQ6GeWI
         R3wWvQpHSSTo4ey94viFiMwspqDvNh+Jb+bjaaoZd2ERQ9HBa9LJwBUYwgsnvbxFCM5j
         mObg==
X-Forwarded-Encrypted: i=1; AJvYcCVbOQjFhzTN050ySMRLxe5Y0/Ptt94EKCG6wbzz6snhAsdFy2hbXjvCQDrKPLI/AkpVC2I02h1H46ysdTqMbM/z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6P88uWa8LBi6txHQzPIdeDDc0HqiPGR2wIWQwXFF84G3x6zdw
	0c60n/pZ5hsLkDoQ8iSO2nHxjEM5fvnxZEwu1hJxQR7l5iK83DIEbjonYwTg/YVzLbIJltK4gjq
	AddqpJhD6FwxdKCddms3ArQsu3NWGVogAugbuf4eG
X-Gm-Gg: ATEYQzwLYxBKEa6kffs4+ntksoP6Symt9MQOkM+763O6IJZuX9d50s2HqVBF6ekjVeG
	AVzRDCE8Dln4DOHyP2NAOhmW4jQxmGFDw5eorVnQpLna9SKFrnP+CZKndwscPtAWNepFIQkijtE
	u+AjJCBje+AKQIOG0TlMC1Cd9KkYra72UORNrlnQ4fEY5qvqRoI2QZh5MUjddF1xICESLb2pwqU
	cidb8nLCYU4gW+pORG3qGpUAHl37xhU02yJY1FPChriLcDb/Qog7HaxK1Sv0jlDqGnAQEKOCGcU
	lCwY/YA5lWh1Lj2cFTYIURv1J6ImwQ7IyMGlKOFJVSCAbu0=
X-Received: by 2002:a05:622a:4d91:b0:509:15b6:f69f with SMTP id
 d75a77b69052e-50b6fad61bbmr17131941cf.2.1774365268527; Tue, 24 Mar 2026
 08:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260324135728.3532400-1-sebastianene@google.com>
In-Reply-To: <20260324135728.3532400-1-sebastianene@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 24 Mar 2026 15:13:51 +0000
X-Gm-Features: AQROBzATxAiMLCKzmxNe09xoPDaD-5DeEa4L_Kx89Id0GO_kSoP9AtUg-97MxTQ
Message-ID: <CA+EHjTycaE363WXD1f9ztYv9cTe9xeo-3FQ2Ep0aVO4592XGtQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Inject UNDEF when host is executing an smc
 with imm16 != 0
To: Sebastian Ene <sebastianene@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, android-kvm@google.com, catalin.marinas@arm.com, 
	joey.gouly@arm.com, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	suzuki.poulose@arm.com, vdonnefort@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_081430_542918_30489ED3 
X-CRM114-Status: GOOD (  19.86  )
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

Hi Seb,

On Tue, 24 Mar 2026 at 13:57, Sebastian Ene <sebastianene@google.com> wrote:
>
> The ARM Service Calling Convention (SMCCC) specifies that the function
> identifier and parameters should be passed in registers, leaving the
> 16-bit immediate field of the SMC instruction un-handled.
> Currently, our pKVM handler ignores the immediate value, which could lead
> to non-compliant software relying on implementation-defined behavior.
> Enforce the host kernel running under pKVM to use an immediate value
> of 0 by decoding the ISS from the ESR_EL2 and inject an undefined
> instruction exception back to the caller.
>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index e7790097db93..ff6a90a4a4c7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -756,13 +756,18 @@ static bool handle_host_mte(u64 esr)
>  void handle_trap(struct kvm_cpu_context *host_ctxt)
>  {
>         u64 esr = read_sysreg_el2(SYS_ESR);
> +       u16 imm16;
>
>         switch (ESR_ELx_EC(esr)) {
>         case ESR_ELx_EC_HVC64:
>                 handle_host_hcall(host_ctxt);
>                 break;
>         case ESR_ELx_EC_SMC64:
> -               handle_host_smc(host_ctxt);
> +               imm16 = esr & U16_MAX;
> +               if (!imm16)

Do we need to introduce a new variable for this? This isn't easier to read than:
+               if (!(esr & U16_MAX))

Also, we have a mask for this: ESR_ELx_xVC_IMM_MASK , please use that instead

Cheers,
/fuad



> +                       handle_host_smc(host_ctxt);
> +               else
> +                       inject_undef64();
>                 break;
>         case ESR_ELx_EC_IABT_LOW:
>         case ESR_ELx_EC_DABT_LOW:
> --
> 2.53.0.983.g0bb29b3bc5-goog
>

