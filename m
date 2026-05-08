Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6525DCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jyuo4pdqxp+5k2cLL5SvSNM1ufmKJNN793e/W3zYnw=; b=nPv1zkrpm95AqxyiTVkeVFolHo
	84X2BcfJf6TVRiaIrJyou9/GXIkF71Hx63lnYsKLiN+Tm5Ro5FJ7dhHkSXS4I9njf79WmE5LtAfRa
	fcBXQjQksiVwmnTF9sj//CbGieYAfUSB2oB9GxEmGAw4TyeTGGdywo4HeLVPY8GYnoJF2NG832w8T
	TFWUkpukdQLKHsjxn7tMbA9S+CuhUvDSFDME6bMAkogCxI3wB/VOsrJGYdNm7k5IjF/GmLlLpHBXA
	0X8bfbL39nW1jSDP3QJ89rx9C89oSFwFmYkJnDvBkkL5ntJDw4uWlOf2ecM6gsPFUepfVTjmOu9Lu
	WTv86jJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLL2M-00000006WRH-2qD3;
	Fri, 08 May 2026 13:14:38 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLL2K-00000006WQv-1a9Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:14:37 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a87782588cso2568039e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778246074; x=1778850874; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Jyuo4pdqxp+5k2cLL5SvSNM1ufmKJNN793e/W3zYnw=;
        b=KrwpxJXUo5cVXtlCQVOZv6YWN1IdtjRMX/AoZRp/zqsu3WIEFsv82qhEwDL7viUTLT
         cuoW6hx5bPwJeUUuZDTIDmg1FbPNlpLkyRiI6r+HecS7kdz5wlC/xPUXkwlgjOX4Mvyj
         74Qu17mVnuTM1Y31HwnR2eZ3mMOIoXoKQy4UnyVYwrDNhFSRkLYX6S/4MEaJJbz+4R+x
         04WJIIsX1o24t92ZpSBiobjS87W5yi1/lDDQTil0QUSM+iN4qV+cGvaGe5g7zyZnvaXn
         MYzOouAmQFpFMiwb/MbF7T/V9ZQBBQOcYMofdOIh90q3KnbOE/Ooe4CsVfQM6J21Tr7t
         6qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778246074; x=1778850874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jyuo4pdqxp+5k2cLL5SvSNM1ufmKJNN793e/W3zYnw=;
        b=sqHR8PzQyeiTNE2KSz7oe52NF5J2rqGwxI5NQB3SmNAIqSqixeIfWbcjQbJYxf1y+O
         ZSJk5gpwJgBbXhv3Dt+qzXuyNlnI67c0AEi7MFHV/YuKuyTNt+plnC0P62pKt/ajxIXZ
         IOWo+QItoITdcyK7SEJmabXpCJ54oliTxrs0Ehh9mUkwD6fa7CvYKA3hDwd98sQU0TPn
         kAkiOGN+HBXAe9ZYRFV/0aRetDZ7fsKDEVXBrMzwMerTvnFNoXMiSUUqZktTP/GWCnu4
         uc11/Jl/jTIOFclGCC1jb2JXu26hJsRU1aje3d5M8TTp3Jm0bt5sBtRv5cvxFwU6Z6aj
         aXOg==
X-Forwarded-Encrypted: i=1; AFNElJ8IkBi31aWvV9Me2jSUX87VVDTzY6+Q8HWtvMb8sVNM8bfEixw/B4v3bfdYIV5KOWOd5+VaiwBGgcJxc4VgBVUk@lists.infradead.org
X-Gm-Message-State: AOJu0YwIYSUJWB3CWgkkl46TnotAlWaSo5kkX9KbjFxOoK/ydQkVDNM5
	L8P4Kaw4My8fBSfFs1MRNuINsiaM7tAqdsfVDcZkFp055UNBASdims5i
X-Gm-Gg: Acq92OGlUowq1F75Azu/+NQd9FOuHIrl3njZIU2nec/oq0Y1xYOcw8rgGDZNrSgoXlv
	PD7IZ9QTU18k9u93u9uauB237M2xrrUlWgeRrQDrAm36tLTney869DzcfF0A6G8p1cPsTiUHak2
	Nik35ibnknHw23ejijhsXXHqfrU7+miTdprZ5hw2C2eSHgTNCH2rwVAx/5QfFzfoSSTNCKkz+MM
	Uw2zQLAZqAdWrQMYWAOCgGcRu9Knph6Xi9x3qcg2sUKmYrNPhyUZ2tk83eayRLYgxj55IPdPkwn
	BfvXvm1+n4Be9uU/poWHd1yzc15tGndeJzOpdmcylLwvoHjCpXYkrL1LInDLaF2mpfsO8+abkPl
	AN2mlXciUAbyUZwzvgb1bcdLqMg4snzlmEVNmGQwZBN3tyJZqo87/ue4f2lJQl9t9v8oZD+1+fd
	kpmEaJpSdx3vGi3h8ba9DYd4lvLuwE2VuLxEMZaJI1w0NgwSww6d3iUfpJPF/m
X-Received: by 2002:a05:6512:2345:b0:5a8:891f:388 with SMTP id 2adb3069b0e04-5a8891f03dfmr4959267e87.29.1778246073843;
        Fri, 08 May 2026 06:14:33 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951cfb4sm502098e87.20.2026.05.08.06.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:14:33 -0700 (PDT)
Date: Fri, 8 May 2026 15:14:31 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 0/5] I2C Mux per channel bus speed
Message-ID: <af3ht8OX_VUYVAgg@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_061436_451990_A4813168 
X-CRM114-Status: GOOD (  32.92  )
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

On Tue, Mar 24, 2026 at 02:54:14PM +0100, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> This patchset has been used and tested heavily the last months
> on a custom board based on a da850 (DaVinci) platform.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> Changes in v9:
> - Fix stray blank line
> - Link to v8: https://lore.kernel.org/r/20260314-i2c-mux-v8-0-fb1738a4df0=
a@gmail.com
>=20
> Changes in v8:
> - Fix gramatics and change %d to %u were appropriate
> - Link to v7: https://lore.kernel.org/r/20260223-i2c-mux-v7-0-ec75b214718=
a@gmail.com
>=20
> Changes in v7:
> - Remove code for finding first mux-locked ancestor
> - Introduce a unlocked (i2c_adapter_set_clk_freq) and unlocked
>   (__i2c_adapter_set_clk_freq) variant
> - Let the locking be handled in __i2c_adapter_set_clk_freq
> - Use I2C_MAX_STANDARD_MODE_FREQ instead of magic numbers where
>   appropriate=20
> - Link to v6: https://lore.kernel.org/r/20260216-i2c-mux-v6-0-9be28ecfd7e=
3@gmail.com
>=20
> Changes in v6:
> - Change logic to find which ancestor to lock with I2C_LOCK_ROOT_ADAPTER
>   It now find the first mux-locked ancestor and then lock its parent.
>=20
> - Remove bus_freq_hz in i2c-davinci and only use clock_hz instead
> - Mention in commit message that clock_hz can be used to store frequency =
in an uniform way
>=20
> - Swap order for change freq/deselect to keep symmetry
> - Only allow bus frequency to be lowered in select()
>   This to not allow an intermediate frequency to be set when it is not
>   supposed to
>=20
> - check if(ret) instead of ret(<0) where appropriate
> - Fix typos in documentation
> - Change i2c_adapter.clock_hz from int to u32
> - Simplify i2c_adapter_set_clk_freq() by removing 'ret'
> - Link to v5: https://lore.kernel.org/r/20260213-i2c-mux-v5-0-fb2cbf9979b=
3@gmail.com
>=20
> Changes in v5:
> - Take the lock of the top-most mutex locked mux to make sure that the
>   root is locked
> - Link to v4: https://lore.kernel.org/r/20260128-i2c-mux-v4-0-dee49ce276c=
0@gmail.com
>=20
> Changes in v4:
> - Rebase on master
> - Swap order for printing warning about "channel %u is slower than
>   parent on a non parent-locked mux\n"
> - Fix typo in comment, adaper->adapter
> - Link to v3: https://lore.kernel.org/r/20251020-i2c-mux-v3-0-908ac5cf922=
3@gmail.com
>=20
> Changes in v3:
> - Return -EINVAL if channel is faster than parent (kernel test robot)
> - Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd95=
6@gmail.com
>=20
> Changes in v2:
> - Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golas=
zewski)
> - Removed idle_state from mux core (Peter Rosin)
> - Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a61093=
0@gmail.com
>=20
> ---

Friendly ping on this series.

Thanks,

Med v=E4nliga h=E4lsningar / Best regards
Marcus Folkesson

