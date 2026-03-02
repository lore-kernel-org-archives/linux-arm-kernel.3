Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAAFE9B37D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdCPnffZML7kxbwJKrhPE0nWT3T0abqC8IY8tAq2JzI=; b=IRW70BS3rsSCR7Q81wrTrx9yAR
	M0SIWvX+jOdAI2bTyo/DIpUXJ5bkdz7358a3pFMrHd7rIV2vK5CpQJX7LKSzPhWMZACwTaYhfyXAb
	NPfRJIdS6vTVJK5G4ZSTu34NNHyM6pe7mRydm8Is8ZRk25aA2vtD3R0HjDdWou2NsczCGamJ0adlb
	G+Tifa6FS6wMB6WDD4IO5yTp7RGwbhQqIPYJ1igtqiHvJRFCLM1BIi9z6Hja9e7YB4GD1EUc8VpY8
	uMox6zeIU0WQI1voX2WBhlm1dgcj+IuXV6OrDzLAbS50rsQPYooMT5+22mpXTekt/Z3jCwv0VbC06
	Gq6Itzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx36v-0000000D50B-1MSb;
	Mon, 02 Mar 2026 13:14:57 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx36s-0000000D4zX-2piF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:14:55 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5069a785ed2so908071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772457293; cv=none;
        d=google.com; s=arc-20240605;
        b=LYluXiqYe86z6MgNjsgCc+Po1T2MHk+B3XZsCg0u7fn9dUvtQlodMISZ98aOXw2Sfl
         OjuslqVS4xHyVPTNXDH2WO/Os50QkB77LLWU1nwnWr3WqH2uersjYSj+DSJnCPXDVmOT
         QOrkXUiswN57lSJP2wMtOvrl8i9b3ssCuSIlCruosxAk8UnmUIoOJWi+8RwJNFsEsJfL
         lmiTahhPR1Y72/IPUc9pdyRASaC4hBB9AIFnrwI73WAh8MUWzbBZW6GzS2fY8xL/8zDI
         GgXY6FWwLJXxbKbLS66EM+gosMo0mX1elraSagCrWHHzTz380T04KKuXnVIHRBGiTNZU
         qHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BdCPnffZML7kxbwJKrhPE0nWT3T0abqC8IY8tAq2JzI=;
        fh=VFXcUrr3kGurp0SuF0YJGl5pPwUAd9HYetUbgSB3cYw=;
        b=jfKDOoc79l6nZJNd9sh2fRCiFgJhMkuxyF+gL2hwXXWzgymg0BLF8DKPhuIGmLeEpP
         7hynPo0hjJYhZf+S3LwVvyPyIv3Og2aiy7a6CXfBRZvMeIN5tW+BlXmzLSsZzkax0JFh
         rFRUxfkC0/UmTDBnx5R9/sQKtznqassXsXdM2d+6vWBhg7c5bLjsXydTNeIKf9/RzcLx
         3jzVOHluS7E4smKsApScDnUkU6pOooaYjwo5X/cTvSbbg+R9Ogd+j6OkfmMKX/rFDo9S
         /5ZJgbfp8HWcKwOMTuWudiPgd8yCvrs9wV0Zrp/KT5lAZm+yZe0+wJYN1JKKlv5p8nia
         ouEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772457293; x=1773062093; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BdCPnffZML7kxbwJKrhPE0nWT3T0abqC8IY8tAq2JzI=;
        b=M/+TsPrjuKCM8A6SGxT4AyB8dCbY+v7jc2sI4SUT+S0y6KjTCJrUwuct2qQIOZrKLG
         wPccKAFLKtr4T997MdvUXF01+5DJSMeyOpCZBsE0pBuzMrta1gmI0DhBHgXHUAjdmxV8
         Yj8HLuxZs6Cq1pbOLAWhzuTAutC0IoBbEreOeAamjSePKG70f556ezAFoL9VboQA2LvY
         PplFLBGXEynzflvk+3L0IoMV0jW/3N1fGBaT7nZ4BZOxa/TjIGMSG01sacWf3ahBZ8N1
         i5rRY10l+aJqyCjmLqtkH7NrlOz9FEP6ztB4fCMDKHDZmc1BqVpNIgdbqH3sw/iAK1t9
         AmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457293; x=1773062093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdCPnffZML7kxbwJKrhPE0nWT3T0abqC8IY8tAq2JzI=;
        b=sK+t6cE2h2aqPcj47A+PNTf09HKbA3REH5nGEZpGUIEEik6jotKswipNZSCFqCKeqD
         +ZjEYkPBYKRJEysZ2tQtxABrf6+ChgSFsuSptGVUSn79F/WImO7c1NYd5HycF8yRqkbs
         s4ae9edoshSsgyFnmj5dOpNQ6PnfewZO9hwcyqucc5Ebe7v+BBoT5Hbe6268yenLCRH1
         uxOV8gUp7BoBYUJQOLE+4m3ENkp1DutrDPKBKBLnfJeH61xRZI4YS5+QALjxA0m4i0rV
         XnJmU/KOdJJnXt5S7dchvuyQeycAZ2j28/u8eewkDiBcUdE/O+S6brEHIsVrE7cgVS4B
         Ck2g==
X-Gm-Message-State: AOJu0YyB+iCxFA0/04RXlnhvOq3Utaw+UOls1Qi/08s5D0S3TsuegWTR
	Im7bxznxYlIIc/uwQZXFkCZ0w5hJOaxJLiBHi247ygWRg31nMsD5N/ieHZecX8C1BrLATBJfyn6
	IXpI2qJnbfU3DF6NtTBU5FdQta8ipABaX/50EHrRN
X-Gm-Gg: ATEYQzwwqflQRKJeb7qW/YqIqHHrNU8EJzryr0dBH08tzdZ+auTs0WwlaDT3WnGXLL0
	omYKhebPIkFobkpnScrBWrMiOqNflS2JSD1DZXb/CPBrtx2puOI8PPsN81/r6w9+XoayDKKRJwM
	qfxkX4y9WQnpdoGJjDwjcyilnz5Keyj4KqV8tkg0+7td5wjwQ+xvehA1osMy9664b845TWXRsGK
	zBMqSQ0j0jarn5ppQ6jaaFh54iD+VWRxUTFno5DcE92AyCYYSGJUZxXVWaBjPkaUuC4Af34ago9
	PIh7anRJ
X-Received: by 2002:ac8:7d06:0:b0:503:2e98:7842 with SMTP id
 d75a77b69052e-5075fd22f86mr20835191cf.4.1772457292926; Mon, 02 Mar 2026
 05:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20260302115653.1517326-1-maz@kernel.org> <20260302115653.1517326-2-maz@kernel.org>
 <CA+EHjTwYhdjfmZxyW4yjfOaokNdVGkHB1h6Qb9O-4D_3f1a-Jw@mail.gmail.com>
In-Reply-To: <CA+EHjTwYhdjfmZxyW4yjfOaokNdVGkHB1h6Qb9O-4D_3f1a-Jw@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Mar 2026 13:14:15 +0000
X-Gm-Features: AaiRm52zbAJaUiKA2h0ehijliBClOvA-7sxDw9s8hswO4KclN4NGMGHaGZeuTPY
Message-ID: <CA+EHjTw+zpNyAnsJsxFYxH5RiH2f_jNR0E_Zz5hnegzfy9Mh-g@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] arm64: Skip update of an idreg field affected by
 an override
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_051454_741085_E85D90EC 
X-CRM114-Status: GOOD (  22.17  )
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

On Mon, 2 Mar 2026 at 13:05, Fuad Tabba <tabba@google.com> wrote:
>
> Hi Marc,
>
> On Mon, 2 Mar 2026 at 11:57, Marc Zyngier <maz@kernel.org> wrote:
> >
> > When computing the new value od an idreg that contains a field
>
> nit: od->of
>
> > affected by an override, do not update that particular field.
> >
> > The value computed at init-time must be kept as-is, as that's
> > what the user has asked for, for better or worse.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>

Another nit, should you add a fixes tag, since this flaw is tired to
the original override facility? i.e.,
8f266a5d878a ("arm64: cpufeature: Add global feature override facility").

> Reviewed-by: Fuad Tabba <tabba@google.com>

Thanks,
/fuad

> Cheers,
> /fuad
>
>
> > ---
> >  arch/arm64/kernel/cpufeature.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index c31f8e17732a3..28fc77443ccd3 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -1224,6 +1224,13 @@ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
> >                 s64 ftr_cur = arm64_ftr_value(ftrp, reg->sys_val);
> >                 s64 ftr_new = arm64_ftr_value(ftrp, new);
> >
> > +               /*
> > +                * Don't alter the initial value that has been forced
> > +                * by an override.
> > +                */
> > +               if ((reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
> > +                       continue;
> > +
> >                 if (ftr_cur == ftr_new)
> >                         continue;
> >                 /* Find a safe value */
> > --
> > 2.47.3
> >

