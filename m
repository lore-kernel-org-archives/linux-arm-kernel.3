Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48463CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESC+v0XgmstDdpSeKPKLi7hpKQuqlzaVaJSl8UIzksU=; b=ktiwbRn1Jb/ykuMHQbnu5Nc2Kk
	y77R6KqLhZBKbMbjuMO067qzhpAwhAPkTkozLMQHrgKSnonctQKgikeWdGF4MJOTQEft4V97aOV2Y
	zJKSx1qwia42aNSUQnvsMtwXvovTQaPnCVugZ19iOOtW8H7kidGvKgxB4and5OiiocRtipBfZ5p6+
	7kqkP8X9VrgdH5rFDRHRu97vPd/ugLnxvRZrdWLR4jrFCRJqGk9s/703gCiox/c+U6a4lRuEAhbJZ
	Y/iigE61VXujcLALA2InRJ6PX4x4dXJemWA7pdJSghLLsAExc6B4Fr4UHsD/8Mz9Ooio+NjZvic5R
	lyaQdu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYm7U-0000000D5Jc-3pO8;
	Sun, 14 Jun 2026 14:47:28 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYm7S-0000000D5JF-21SL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 14:47:27 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51765531803so675451cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 07:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781448445; cv=none;
        d=google.com; s=arc-20240605;
        b=WoaMZOzQ3UhXEBFGwwkVW9VBbNEvuRaD2XYZU5JgwWITOeSLFnGjer6QqVpNiLoWVU
         CfPvdSVjaw7Iu5rTltInq1haEsIR3vwOSMN1GzfyP9JnRi2LYA3s8C3wXvSMXh4nfzIS
         Zbo/Pn86/2LbZxqukwo54X6uEu+7ePVz9IhM1BgqRYg7dsyhee4WK4IPRomaer6akNra
         TCeKTbWDuZsm4fRaLxj3ZCjyfyDh/YKGNAaWXoiZ20VTZp4mrqz2GQULOJboSlyie6Is
         UTmmvwnH2IudBUDlWj0J7wGMjZXG/oniVh+Qz6QHfiPslU/Msb0VSRM7/OQaBQ33G9iN
         HoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ESC+v0XgmstDdpSeKPKLi7hpKQuqlzaVaJSl8UIzksU=;
        fh=92x9snhu5ZQltGFmvBpibX0QGIrHLHhmdpI2DtXLCqQ=;
        b=gYJZLvud+pcn/r3FXq2thQ4XZWQcdcE2GlJ4Tu5ZKkKDH6y2RRoygAFyRxpk2eRY1S
         PzCPpUEzjMNJ0DP0xJniDcL9BDDCiSN1/Ug4ap3EwlXfaQvcCa4fiBQYsFe0g+agrZ2F
         SUVFKT2C10Lsoy1PWlz30pB/ssmpgDMk9+H04kXumEhiIK5wsjUd6eDXzRvuf3SSP8ZZ
         Zg+GtlxIvrt9aj5VXjzZ/2Jyrpfr0h2e85OPlTQXs9u50wZQf2c5cT1aX5OGX+YWfraT
         QvIyrRYuXGyNRmhjxp4CMBmMD/Q/xAyaViZBRF7GyQOtcQDqKdOLe9ahDLuCEvtC7dtk
         DCTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781448445; x=1782053245; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ESC+v0XgmstDdpSeKPKLi7hpKQuqlzaVaJSl8UIzksU=;
        b=l6unB9IUdIgeWZ53pZAmmbMxGjNosluyTZiLleQKD0r9S9IhgwbgxWKw3WghDwVr+2
         0seSObuDfRB3o4fva7pJFiItqmPuh2wAA4e5itAKqTa0ouLwzYRmuVLlIbMXRxn87oV2
         ZXIh5VvslimTpX+B08kU2EppPIyebq6L1hs8RQ8URds+A94m6m8q606zactdrvFouX3o
         dW8qpN4Za3D0HEx5JFfsuO5aPZsPUI+IX3zsURg/6jKLvsF6xAVrnwOw5xCU98FS7fcR
         Rfr5QX/PKn+x5oTRDXqzpX/q5UIkBKDuBZzaFaxnyK/1uL1BbVKpa0odxfIoaaqVpvYE
         r3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781448445; x=1782053245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESC+v0XgmstDdpSeKPKLi7hpKQuqlzaVaJSl8UIzksU=;
        b=UaQ07roBZeA7YNh3+zshr05AXTl+bK1G7PPt/YNWkAwOvZAPCg8eiVo3dW0c00b5OX
         rlM8gEydUFfBaBf7T/NCnm58B1Wy7WgERNFkrHtDkoLeHgkVMSXUXF24xfkd0VdDmvo7
         HVbag2wV0S4cvt1EXNfzOPzcVNj9Fw31JPIwQ4sd216L1fB6Xr2PLIp0li/v/OTg01jz
         fVLGu++z1yFetkojUaR4FPS3my3NsA8fTHi1lsJkJc7q5Wy5T2SB7kGlDzZoLkezRncQ
         6R0zVuuWv9wKh4RX/xJykKVd/mGjmlWLe6+Aj34KleJVp4wty122WbShTTx5xXVWgvJr
         dhUA==
X-Forwarded-Encrypted: i=1; AFNElJ+m6nfxZXbW+9nAM6BWbJBGcy12dTAIy7covSuzNKUy3aoahp3LfEMfueiIFirFp1fADxv5bqIpXOxAbdWdwCxI@lists.infradead.org
X-Gm-Message-State: AOJu0YyWEfEuSt2Xm+yN2F9wsevznadXKCJnJ6AmD3Z1lMf8T0J4OgZj
	zsOcMoO+ceNBDkJzP8OEMM5p/xv4Nn2YXQjiqaCMaN6EqVrsDhnKLTF7i348ZFlEjkbFeFVgm7g
	cv/PHtAf4SYFjYchBYkOjGQc+eAoM8Eyb5v5MThm0
X-Gm-Gg: Acq92OE5gdaJqbi4jBY8Aa8g7UMGtJj4BrX9JFIHdabWRz1MFaRO3ZSFs7SaSEAnyYA
	YoR+g5yTNlgLs/KBCpbxnKAALbbztcCGx69ZbCVeQSOFzo7npZSU7B8AeRjSw4RZ4SymsU3Fvd+
	ZVWFQPvtgM2yUMaEOxdoLVSADFZw3+gjF8q8SCe0swF7vPBxUXwWUEenJUhROTWD/Ov5XkrEjVJ
	PGkQRS+nXj4tVw4x3/Wh1odDnsD3Yrl8HdTMQOkUgkJFrRwyoUQHFWaBbKf6gcCDLsqo+XKwWUW
	Z2iXD0Lb9dhymztU+8g=
X-Received: by 2002:a05:622a:130b:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-51955e96830mr10838431cf.7.1781448444601; Sun, 14 Jun 2026
 07:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com> <20260612142245.1015744-4-vdonnefort@google.com>
In-Reply-To: <20260612142245.1015744-4-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 14 Jun 2026 15:46:00 +0100
X-Gm-Features: AVVi8CdPI9qwkxm2EQu_Iwcwk_7iZT6Mq7CK1wTAMeM5gn94DrPfRYjAc8Hfnus
Message-ID: <CA+EHjTz6S342aNXxj+yNvS1mLjm0r2fUW681a1jNo2+70rGVMQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kernel-team@android.com, qerret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_074726_532350_5275D07C 
X-CRM114-Status: GOOD (  15.64  )
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

On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> The current REMOTE_EVENT() takes as a __printk argument a string format
> and a list of arguments, such as RE_STRUCT("foo=%d bar=%d", foo, bar).
> Add a REMOTE_EVENT_CUSTOM_PRINTK() where the __printk argument can be a
> function. This intends to support the creation of a "printk" event for
> the arm64 nVHE/pKVM hypervisor with a dynamic prototype and by extension
> a dynamic print format.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>
> diff --git a/include/trace/define_remote_events.h b/include/trace/define_remote_events.h
> index 676e803dc144..4f4d58e37b84 100644
> --- a/include/trace/define_remote_events.h
> +++ b/include/trace/define_remote_events.h
> @@ -35,17 +35,26 @@ do {                                                                                        \
>
>  #define RE_PRINTK(__args...) __args
>
> -#define REMOTE_EVENT(__name, __id, __struct, __printk)                                 \
> -       REMOTE_EVENT_FORMAT(__name, __struct);                                          \
> +#define REMOTE_EVENT_PRINT_FUNC(__name, __printk)                                      \
>         static void remote_event_print_##__name(void *evt, struct trace_seq *seq)       \
>         {                                                                               \
>                 struct remote_event_format_##__name __maybe_unused *__entry = evt;      \
>                 trace_seq_puts(seq, #__name);                                           \
> -               remote_printk(__printk);                                                \
> +               __printk;                                                               \
>         }
> +
> +#define REMOTE_EVENT(__name, __id, __struct, __printk)                                 \
> +       REMOTE_EVENT_FORMAT(__name, __struct);                                          \
> +       REMOTE_EVENT_PRINT_FUNC(__name, remote_printk(__printk))
> +
> +#define REMOTE_EVENT_CUSTOM_PRINTK(__name, __id, __struct, __printk)                   \
> +       REMOTE_EVENT_FORMAT(__name, __struct);                                          \
> +       REMOTE_EVENT_PRINT_FUNC(__name, __printk)
> +
>  #include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
>
>  #undef REMOTE_EVENT
> +#undef REMOTE_EVENT_CUSTOM_PRINTK
>  #undef RE_PRINTK
>  #undef re_field
>  #define re_field(__type, __field)                                                      \
> @@ -70,4 +79,8 @@ do {                                                                                  \
>                 .print_fmt      = remote_event_print_fmt_##__name,                      \
>                 .print          = remote_event_print_##__name,                          \
>         }
> +
> +#define REMOTE_EVENT_CUSTOM_PRINTK(__name, __id, __struct, __printk)                   \
> +       REMOTE_EVENT(__name, __id, RE_STRUCT(__struct), "Unknown")
> +
>  #include REMOTE_EVENT_INCLUDE(REMOTE_EVENT_INCLUDE_FILE)
> --
> 2.54.0.1136.gdb2ca164c4-goog
>

