Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6B5D64064
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xw86N2iYX57qGc8nq79PlFANOzXfD7Duu0m6WN54d9M=; b=tZxG5zY0pxPI8b8zsejjDO/X6K
	Q/K26HuOx/gYoCRWta8ddv+P9iOxfEuh0GmHCld4ws7EuJTs4HbLXb5qedThnDbr88KlLPbPY6sNT
	aggRqfLeW0fCeJenWfO6+DC1spKjomj1bvLr6qf2DNxj9VfxUEKhEN2zBqfAGXX3zww2yzIfrzPq8
	T49yss99KPZAbdXeQ/HO9adc3Kx7q6i9TH/iiPLTG2jsNWKCifIdWFd9a7Petc3uY3WVfmgFUHEM/
	NNnmF/NeK8G5LuubNIqE+4oP8tbsjVGx0/WPs59WNgqe9zYsojiuIX07xY18jKv6Oaa9uDxlgHua6
	HzAAIepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RvF-0000000BEPG-1rY5;
	Fri, 08 Nov 2024 16:33:21 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9RE4-0000000B64Q-1Ixz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:48:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e9b4a5862fso588180a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 07:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731080922; x=1731685722; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xw86N2iYX57qGc8nq79PlFANOzXfD7Duu0m6WN54d9M=;
        b=OI2WaBMI7zjoq+YO1mkWDT3pVngSLpGjylbmlyJzScOgTGz67rT8DVldaXqq0azafM
         cLR7ilAHic6FJY6qxLgCysFY0AMQH1/AmafCCFpEoFvq8RR3/gN4rvaKNVZ99Lh4LZRE
         uVhOg0Aa47LXaADeX6soBkWqfkivCnocvLoS1LswkAbcb6pLMM3GfWOy6ncEBiJQs809
         VV54iOpNPnhaqW7js3AVJNY3kZt9yGvlV1ra5yDiqGiNhFGevRT3avd9E1LOaQnoGZld
         wuTR+mxyWkEeO6serqbStHsDl+qtl+pdEdtGR+2v0mX8azwFT+4uFliJqdydSACqt8gv
         DmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731080922; x=1731685722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xw86N2iYX57qGc8nq79PlFANOzXfD7Duu0m6WN54d9M=;
        b=qUvZKmbTIDy2SV63DFtLS2Ic9wgRdPP51dRZmRfeOfNBsQBb6UJNFi5TXfRPWsyH94
         pxGBXcjRD7wMGr1bR5GkICvdmn/rCyYzdMrXsgOcgAS/qJqLbMFF9ck0mO5QtlUORMhy
         uf97waWMvtTzr0DxFp9Ov9u3nMqcGdsV62nWrPj5oijp56opcAqPX5mGxsVV0SgPtpCH
         kGx47W/U6vTPghPnyaa1MRa8X8jAeYO4YfNDCdNebtVKzzcvv47kPH9tKwdIuUZLGnyc
         SBicsRbI5xhZGwcYWdppMsBQnk8ZR56ouleO6dlh39vqFJeZSbkhpGtj4p8NXpMZ/RFL
         ETyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP7yyrYpIR6Y3Ra9fA4n6UDPGnXCfAisE5c7F7V8nrMJBHlvF/cT6T0oZwALxUQwgEvFTuTARODz72OlH5BMpN@lists.infradead.org
X-Gm-Message-State: AOJu0YyzS+DUTyAZJ2U0FX2QxKkuupv9uibI8cEd9I3mmPK/cyDhM3yc
	rQChOH7u61C3XYrXuCvMqwllMrzbTg/l3iwxR6r7tvho1wHPUNdeQy3hp85lyw+YC/hi7zRl1OB
	Dyqc2Aa08MCbfULlmG+RSPFLvc4UgWVo46XVOPg==
X-Google-Smtp-Source: AGHT+IEJSlU2p83YLTbA+mJi+Uych4Hya5wMY9x1p6MnGvfZMWTmJClKKkw978ZNI1ECwUZVj92+bIAzxb8n2MpYNOo=
X-Received: by 2002:a17:90b:1649:b0:2e8:f58e:27bb with SMTP id
 98e67ed59e1d1-2e9b1655850mr4391856a91.8.1731080921787; Fri, 08 Nov 2024
 07:48:41 -0800 (PST)
MIME-Version: 1.0
References: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
In-Reply-To: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 8 Nov 2024 15:48:05 +0000
Message-ID: <CAC_iWjJEXU+dodjvWQYM9ohPa3P2p0bFG=exGoi-iYFrLLbCTA@mail.gmail.com>
Subject: Re: optee-based efi runtime variable service on TI j784s4 platforms
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Masahisa Kojima <masahisa.kojima@linaro.org>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, Manorit Chawdhry <m-chawdhry@ti.com>, 
	Udit Kumar <u-kumar1@ti.com>, "Menon, Nishanth" <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_074844_376464_ACA30580 
X-CRM114-Status: GOOD (  19.77  )
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

Hi Enric,

On Fri, 8 Nov 2024 at 12:26, Enric Balletbo i Serra <eballetb@redhat.com> wrote:
>
> Hi all,
>
> I'm looking for any advice/clue to help me to progress on enabling
> TEE-base EFI Runtime Variable Service on TI a j784s4 platforms.
>
> I basically followed the steps described in u-boot documentation [1],
> I enabled some debugging messages but I think I'm at the point that
> the problem might be in the StandaloneMM application, and I'm not sure
> how to debug it.
>
> What I see is that when I run the tee-supplicant daemon, it looks like
> the tee_client_open_session() call loops forever and the tee_stmm_efi
> driver never ends to probe.
>
> With debug enabled I got the following messages.

I assume reading and storing variables already works in U-Boot right?

>
> # tee-supplicant
> D/TC:? 0 tee_ta_init_session_with_context:557 Re-open trusted service
> 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
> D/TC:? 0 load_stmm:297 stmm load address 0x40004000
> D/TC:? 0 spm_handle_scall:859 Received FFA version
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
>
> And tracing the function calls gives me that:
>
>       tee_stmm_efi_probe() {
>              tee_client_open_context() {
>                optee_get_version() {
>                  tee_get_drvdata(); (ret=0xffff000002e55800)
>                } (ret=0xd)
>                tee_ctx_match(); (ret=0x1)
>                optee_smc_open() {
>                  tee_get_drvdata(); (ret=0xffff000002e55800)
>                  optee_open() {
>                    tee_get_drvdata(); (ret=0xffff000002e55800)
>                  } (ret=0x0)
>                } (ret=0x0)
>              } (ret=0xffff000004e71c80)
>              tee_client_open_session() {
>                optee_open_session() {
>                  tee_get_drvdata(); (ret=0xffff000002e55800)
>                  optee_get_msg_arg() {
>                    tee_get_drvdata(); (ret=0xffff000002e55800)
>                    tee_shm_get_va(); (ret=0xffff000002909000)
>                  } (ret=0xffff000002909000)
>                  tee_session_calc_client_uuid(); (ret=0x0)
>                  optee_to_msg_param(); (ret=0x0)
>                  optee_smc_do_call_with_arg() {
>                    tee_get_drvdata(); (ret=0xffff000002e55800)
>                    tee_shm_get_va(); (ret=0xffff000002909000)
>                    tee_shm_get_va(); (ret=0xffff000002909060)
>                    optee_cq_wait_init(); (ret=0xffff000002e55910)
>                    optee_smccc_smc(); (ret=0xffff0004)
>                    tee_get_drvdata(); (ret=0xffff000002e55800)
>                    optee_smccc_smc(); (ret=0xffff0004)
>                    tee_get_drvdata(); (ret=0xffff000002e55800)
>                    optee_smccc_smc(); (ret=0xffff0004)
>                    tee_get_drvdata(); (ret=0xffff000002e55800)
>                    optee_smccc_smc(); (ret=0xffff0004)
>                    tee_get_drvdata(); (ret=0xffff000002e55800)
>                    optee_smccc_smc(); (ret=0xffff0004)
>      ... continues sending this forever ...
>      ... Hit ^C to stop recording ...
>                    tee_get_drvdata(); (ret=0xffff000002e55800)
>                    optee_smccc_smc() {
>
> [1] https://docs.u-boot.org/en/latest/develop/uefi/uefi.html#using-op-tee-for-efi-variables
>
> Thanks in advance,

The most common problem with this is miscompiling the tee_supplicant
application.
Since we don't know if the system has an RPMB, we emulate it in the
tee_supplicant. How did you get the supplicant and can you check if it
was compiled with RPMB_EMU=0 or 1?

Thanks
/Ilias

>    Enric
>

