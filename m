Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1CDD0D16C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdQze0tFMfdCcZRE+Fz1xsHkvoih7BkzLiCp0crO/Bc=; b=dGyYW3HFSHEetjMp07Y19mWFKO
	WnZtbjPpDQuhJODbOhBnjH3z8hAtZI4QtbpPxtnYg0YBVRmoiLoGE96rT49YKmWXb6P5AxkRkZgut
	sajOVHU6LRDomIV/cP9Hw82O2NpIfpIo7B30wtjmRIrGtHEp6qiqMOwqhG+oaLn9kXyXozU7iYj57
	c7MtRTvzTX8Qrq3HNKngGtlNKTO5s0hTTQAZs7hUpKcGKtWF6UFfOxedDStuAvx+OraVUATu2fnJj
	S/7HSiTRO9Utui4frn+yQSCmW19jGzYnxPUFnmCqW25+GwOiQ5B/LzO/47t/tFw66O37tgCGLqA9L
	y4QFtOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZ9z-0000000FXKU-2UyI;
	Wed, 07 Jan 2026 19:25:35 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZ9x-0000000FXJg-0e99
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 19:25:34 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee147baf7bso575651cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767813930; cv=none;
        d=google.com; s=arc-20240605;
        b=bOJhl9lssZbA3hNlbxhvPCQLoL1tgM/1OAruzEYr3wMRlMTXm3Mu/8rj+ThjqqWVTN
         aSSazIF4lOZ5xsPaG6npPzbIHR8CP6JE2xcLtK7e1OrxeoBzO3X+7/1KfLbYK4F6MzSC
         p+HhDbuIZpU8K9oeojeOADRGEgblH/ExAaKhTcmcDucwesbMjCpJbDCDBytTiahwIi6m
         63Zfq0gcS6eN00gVB5/CHWWa3TlJyC835lbifCZiI96SfIuuAeBlMYSFNN1ATpXcu2Q+
         PK19KmDLj7XBrClxQcsE1lEA9QNZnTTwLF8naoDXXcux2qw16iAwJEuKj+gAIaFL0Fdx
         7XhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sdQze0tFMfdCcZRE+Fz1xsHkvoih7BkzLiCp0crO/Bc=;
        fh=lwpKxMXMEOHdLdajXm8/aiT5JwXFfhQFU71eh3muezI=;
        b=DK96sf2HWgPpCZg53w2yMmFoVxywI1awEDc5NLFwxWj+bDNL33a3n2pVIY1fq/AwJZ
         zihxRRic+ZqSMjQ/BXCn0rrXeSnga5NAA/Ys1GgNGwQFttPxBkr5VxLg+zJNIW7dpGLw
         PO2MfD2h3DKbkyA/TrBJ+j0addcmUKOzBnqhYlbOMk7kB+EWrnyhdHYa7s0JNrP8SY6q
         6BXDzZ6l6WTQZw9dgxPc3e578nH5JxdFDSvDGnY1gKe7Z7yEMf6Y4/cqfcdBan/F53vw
         9hRBOh4B7D0E9WrrLZrteYroHy5WykZ3jzX28/p39aRfJtFhLq23l4IyyjZFm2y1C0oW
         q1+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767813930; x=1768418730; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sdQze0tFMfdCcZRE+Fz1xsHkvoih7BkzLiCp0crO/Bc=;
        b=iLEgCBoKmFsBmmtU7MpJS4dv6b04s9OFxOhOua0XlJLjLYA5Yvd7rM5V7znQWm93zC
         hrrIFwyNqCRVKNEO1FW2MDn8enZelQ820wGCilE7SE9uBnUcTzcnjGONTD/cJotLoYgs
         OCTMOLtEfP5V+nrcUOuQML2dUk1zpmQVqeYP5uDORI1mJ08yGY3O2kUqpNFotcR20J3G
         3iz5imG0RO7X1PPfJcF4srdJwj+z3aLdBwCheuYUOUA44Y45Lv5bLWgd8h2aQj0Uy0GM
         nbePegs/Q5brw9Rin1yIcVNBGxkaHAersbOQRChsiEiuj/7ieDLKUWMRlGOBO/qt84C3
         03LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813930; x=1768418730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdQze0tFMfdCcZRE+Fz1xsHkvoih7BkzLiCp0crO/Bc=;
        b=hIYG8wHC7TfsQ8QLmhE0qqFfXuqg3TLwBKR63dfho/Lnt5IrXq0aTyqtxHXziy1Tq9
         SJ9qnmMbsaxa9RqUgjV5LtPPD5t9TX3x0ZiKnDgvvYarIv+6dOe5Zsth1jEj5PVLJtaQ
         xt3QjpqNqdCycDqobODDQ3qr1nIEcQp34MvbaiVUsvZgM2lttMKU6B/wCfPggMXLDaut
         05BKjflW1MA7UbwFzGO3N2OyFfWC2NwkbT+fLMzaxcixXYEtS2IK8bCxyweubQi9eTi1
         YvrY8jcMtLTou46gcMcZj1Z833rPwHw7B6+SJTqYUyojxxzJUf6gYkj0NQqUHfLKSYB+
         b5iA==
X-Forwarded-Encrypted: i=1; AJvYcCViOrCeArRnqAh/EAJtrS4+Ac5JtymEsSrdBkzpaWAdGvbgtzDxy2AbqiWweH1BME9T/hTj7lyoNYY7jznstJVq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2INippFsKNdU9Ss8iRMfvhr3Ez3f4tjqFOshaVRB4t5UNOSRZ
	lPrlTx8BKzOGYkJb+yWMWnRiUdC6u3wUxtTj6hGJZMqrcs8jrus+XVxPNe4RInRPhccLnMzsG5M
	iWy49EfWTmAQL5cRJeNMNdG3SJ4CR+tu9ze5fklu5
X-Gm-Gg: AY/fxX5k6hhO+G7pBiDkFBmsPGOjOJHnFg9+9oST2kvn3odT/eYW9OErIg31jY/I23b
	z5Uvf/ESNOL5UoBQ/LRCYC67nfWGzRTr3N8WdmaOiM9yK4wsWMiNOv/LQm1HuLiakCNelMnPZII
	gkBWdaZlbnpQl3mi4kLJcUi5o3m4HAjfBalaQhLF9h8HtHcebltyguhw2mSqWtxhWlnJS2cGOwc
	OCsbJg9h/739b+gYFvP6N5yBH/59DcfVfVbWur3rDDZT8ArSOftxVrzKoQyUU6yQXwBIh8i
X-Received: by 2002:a05:622a:5cc:b0:4ff:7d0c:c1cf with SMTP id
 d75a77b69052e-4ffb3aa6b6bmr15709851cf.0.1767813929956; Wed, 07 Jan 2026
 11:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 19:24:52 +0000
X-Gm-Features: AQt7F2osm9O_NLuokFKY_-m1ya4_XJF8FlJHLjM1yNQTzxjP3vc84G0MiN9eNTY
Message-ID: <CA+EHjTwsX9+3XZBZo8PHvaP24fVxBKSdg_raJGL46nX5hE-4rA@mail.gmail.com>
Subject: Re: [PATCH v9 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_112533_205095_8ADBF0CB 
X-CRM114-Status: GOOD (  14.87  )
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

On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> Update the definiton of SMIDR_EL1 in the sysreg definition to reflect the

nit: definiton->definition

> information in DD0601 2025-06. This includes somewhat more generic ways of
> describing the sharing of SMCUs, more information on supported priorities
> and provides additional resolution for describing affinity groups.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

It matches the spec.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  arch/arm64/tools/sysreg | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 8921b51866d6..6bf143bfe57c 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3660,11 +3660,15 @@ Field   3:0     BS
>  EndSysreg
>
>  Sysreg SMIDR_EL1       3       1       0       0       6
> -Res0   63:32
> +Res0   63:60
> +Field  59:56   NSMC
> +Field  55:52   HIP
> +Field  51:32   AFFINITY2
>  Field  31:24   IMPLEMENTER
>  Field  23:16   REVISION
>  Field  15      SMPS
> -Res0   14:12
> +Field  14:13   SH
> +Res0   12
>  Field  11:0    AFFINITY
>  EndSysreg
>
>
> --
> 2.47.3
>

