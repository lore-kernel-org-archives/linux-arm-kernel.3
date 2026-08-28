Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF8BC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 04:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=; b=k15nFMLHiblunqJ9mM7M2HjP6U
	Ev3ExeiM2Cp00MlUt8bL0EYIOniJwkJUIwqjG2wrH+MK6sW7jYk+qS5zXCWX1IWE8p6Q486H9g33f
	hXHpXHpguGfYcKVv46iaukqfjnCUBAFs3YB84Lm6H0zcrglNAxa5MOD/0wO5K1B6228euROAohFpl
	/r7/mFmnTiwRhydUDye1bI/c8/qLLLt9qziQSrSBDawtPtP+rrJABR7GdrQvmjDgAQdbCZ8fegG8m
	XfAPvgh+d/CttlB8otQ/tAgQDFZO4xdu1inbZ1yrFfUq9EgIH8k/gCbE2xbQNCIlAvk22zU5UmS+o
	9FdMu33g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wznyf-000000055ql-26YQ;
	Fri, 28 Aug 2026 04:14:05 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wznyd-000000055pz-30dW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 04:14:04 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so456271a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 21:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787890443; cv=none;
        d=google.com; s=arc-20260327;
        b=amTq3kkm9sRyfgfuQnJKwU4UT0BE8qZJuPkqVWCaLy50XtEd/Cu4JNEIYe7QGXzK/w
         G2/06zcIQdY+AaoTPaLHWKMteodxxQwuATDsomDCM4RMt4MTKyhCmdFk0OUNYmauYIEs
         lGEkRWdVR2Ivgt89pjDXa1X7nOdChrsLmx4XUTPIgwhCPJHjCMxe5PyEZJQ+vxxNAcru
         qgROsJ2fHAD7GBdbeM99JbHGSk6NzfYA+LqIPntLrXTqNfGdBECZYwNWQQiZ+y1pP5pd
         l5Ke+O0fPVamcptz5zBpCSfxWT5ifgoN0eurBsrXwh1ENGG9pf3ewxjwzod5g9fB0sCq
         e9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        fh=oWFC5AlJRG8eq0FZeF7LB/CpjKR0wgSrneoym1Eo8TM=;
        b=RRc2Nfp7WAczO3VBk8VH83ycRFERHBb+RhgXTsuTbSu5dI1VCR+GP+Y1JkJ6/ieoQx
         /tEXnGlG5qp94RzOL3EctSVmgfZbRbOMCZw8NacEw3vzkVESUG1qBQ6lFmspjOxCLXMa
         QEFPTMNKsFKRZg5ABsSR6rPWBaZsmKW8sczqvKUqJGE6JTWNeErJd3Q+Nmw0eaPqGfkD
         UXO/zJCUC1OopOH/1b5MeDrlyL/9gqOBl8VyBZh2HBNOjswdARCsrpUE+7OwWXUZ4yL5
         jCCggWtIUdXcKomS5gxkYip5DyT2Aw4js07xlCkn/dOZS5JMaLU/sht+FZsCVE0U73K3
         8kAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890443; x=1788495243; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        b=PzdCqDoW9YrQnYtbgXwBCuQPPZ6uCdFUZPf7S748VfMa5w/IPtjk0Byl6XTOgL3PJp
         jC9A0bpa0rtl9WrCmjtfgHCcAsLQHxorEesgeZBAo/vsdgvJvZRkcG7jjpfePN36Ssgv
         rt2P1XN7iTYHXNU0iEH7xlBshoL5WBeuUP1oXs78xAbXZ9VQAjrO7/cbGYnpgl6wd8TH
         MXCbgi4FX/myIYQJ+u0tueUqCkKd2hFht/JRl24ANje7Z3Kh9BG+3T7QYx5KkYHMiC6X
         5oSpbbd7ioALZfYGshKv13yJ9kkCegNQ4DsD7Q0dHbESUpynX944JBVN6L0M9RDOBLHD
         tUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890443; x=1788495243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        b=OOlNJmjy8aOtP/1AJqnCfJwWwcGJ7MEJW2FttEHWLFHMMcmEdR6F4PdmhbWBEMaS91
         iBUPmY4rl2PCftld4/+R1qCTpO0wV5p4/aYVnSGz9yzFxWPW8cJIbGPAbla7tpDKY00o
         CXjEJxBLlVCwrHulywRqyL7hGJWNEe9EoN3IYK+cdh4oVrnalgYpeAUQTYD5HNDpvVlv
         6TP7xF2rmRzkpIAhX+xxXVxGbt1PX/9VeR5IQy4qFYn4XVvrpNe8pyi509jS5chCvUQr
         b2JsthjjWGwzo3M3ZS3UUCfT8p8HSWG9duloJDUccI/yyZ25E6Ss1aak6p4uOHQa94uv
         z3Qg==
X-Forwarded-Encrypted: i=1; AHgh+RrI6p/ohxuyuV+cJWFQYCDQk9fbz7Kt3MGA1kaVtcPlFNUk/G8Yxlh7tNCqwtraCsxAy8ADAR5poP2oIpdZCsDT@lists.infradead.org
X-Gm-Message-State: AFuF++kHauJ7Cy/tmf5LuNcJekQ4cm610U52L5vBUYexgHd1NbfE+NO2
	5PpOGocFmK9j3ySL2JJMRfw9b8egkbs2kBYZkzGEyAIvLRhQglN5HmuDj7tLJGcGGqPC1476rpA
	UTwUu2c3MU9pRUUAKuzM53mKLPGt1v9o=
X-Gm-Gg: AR+sD13AhrpmO6ORoVwqDxoSwSUiF41R8wSoN6ywrdDLjC3bgvUS6Q/kmdLQwZVQWGA
	DIcR/W55nbvUxLyz/yeJLQE2mVpbilyU1ar2RuS3WVnQ/pJYlnflVrBZuuXQwQ8wMwETnPpE2Oy
	W3HvibDDq/C2PzlQPhCzpOfkAX4hiN2Sy3egENiO4aKOMTZPfvr+WjVmlNWZseCmKif4Oj/a3JF
	YKWTtIT8QKasCCJxbrgwWbCtsIx0Djs020ogxfShEoTev6do6BfwHPiFkiLY5iWBSG3zXw4dU7n
	CnDG/G+8ynNM1xQNVRAxnTRn+n8LBa7m2Qrdsn4jcxEHSL6jkXQAwy6k0sNVHe8n14szee++l/b
	2TxYjk2cfZJAPpw1JXSTwCA1I8pw0HkZ6uikaUMM+4LNz1+9J4KWLIN3N
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id
 98e67ed59e1d1-396d0ed0023mr8931366a91.6.1787890440156; Thu, 27 Aug 2026
 21:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260821122928.41343-1-phucduc.bui@gmail.com> <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com> <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
 <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
In-Reply-To: <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 28 Aug 2026 11:13:48 +0700
X-Gm-Features: AcwNN1VmqsU00XHb8qwR9ukL54h8LR35XqmovAAS6AwR9_5yGXPiNF5RdG4pFBY
Message-ID: <CAABR9nG=CNwVPcqqDE96JWsFYiJN7pBP0Daz9wi4DvYoGiz2Dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_211403_754258_D5743CD3 
X-CRM114-Status: GOOD (  14.35  )
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

Hi Mark, Cezary.

Thank you for your feedback.

>
> > To be honest, after looking at the code for other MediaTek SoCs, I foun=
d quite
> > a few logic issues and inconsistent clock handling. This, along with
> > the git log history,
> > makes me wonder whether these code paths were ever properly tested on
> > real hardware.
> > Therefore, I have stopped at mt8186 for now.
>
> There's a lot of code there with shaky error handling; probably the
> default case works but things blow up relatively easily on error.

If you think these code paths are generally functional on real hardware and
the main issue is the shaky error handling,
I=E2=80=99m happy to continue reviewing the remaining SoCs.

I=E2=80=99ll also apply Cezary=E2=80=99s review comments regarding the cloc=
k handling in
the mux disable path and returning directly from apllx_mux_setting()
instead of using a goto label, and incorporate these changes into the
next patches.

There are also quite a few uppercase goto labels.
I think this cleanup can be addressed separately later.

Best regards,
Phuc

