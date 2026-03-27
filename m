Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219D510BA436
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=; b=D2IHoYD/3dUbT85xlfzWFPvtlE
	vw2l1CjvrlUGPuVO3/U+HPYB9aC3/IukDWHP3Wqz+6OyYVGzh1DbJ3cifMHMCg9q+M59nl/XXgbQQ
	ssGExXulPV8fWp6XJvhXvmFs4fMXO/ws/1ne3RJndFmG1uphg5FjJvOjOydrd85Jh/jRYijdRGk7U
	E4cygSklI1a3c+KTCeDswC1M1H3yrgXokA7lBAYZjTVoZNj0iHWGPYfQG6cbCt7t1I/s5CRismJfJ
	zpFTvsNDqMxWonbZMWTFTKtKlPKugIEj75DWrTClFZzaO8SwLxdWCiFBkPhPwZxvT0ALTPyEA2GM0
	6DP2fD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6296-00000006vmX-0z7K;
	Fri, 27 Mar 2026 08:02:20 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6294-00000006vl4-0S5x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:02:19 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-12711867ca1so128399c88.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774598537; cv=none;
        d=google.com; s=arc-20240605;
        b=B7aftAgp0uITgpZJ70D3etKc6Qd1nUikAhxWPk/gFWr8xnr6JKaR6m8dkPm9dXv5Lp
         HLupHHYva9ZJYpZWT9JQT2+8PW7HaUwWFkh/waroDttFct7t2MDECud2tY0meM2407N4
         hVS6/VRwhiKBOOOo0/LcLyV1q5nFdfbLHjCvV+/3E9FuZp6XlrKuOlXy3sJiy3sv6n+I
         zjE6Qh3vG1rXkg9b/TzUsYXlGgfE/kcsmeDMugR8zPj2T+khC5h3y+bY1Yk9ncxhn8ES
         TAeIz8ovWX/7gSRaMX5iCBCQLofr+4nOCfDs8aCF1i+jZRLMzVRmCKvX+YhWnn61v2mL
         DCaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        fh=FwQXC6PWGmAOXzC4y+KdKt5rJ0Zms8skw14Qf50nucY=;
        b=FVwHGxk8Y59G9vTtDytJcRwgYrtFjxAvlZZRnY9z3+sil2g+J+0uNcHOaFleRih2XV
         5rkdopCQhjOyaNOtz86YwhnRRs5KUh2HBiYbHEy6O4VsRa7PHRi80Wdd6Y5StQde89iR
         csMhUGP15rQtzcEQJ5kZOEttBal/8CPxKda+oo/6+RjHWihEYan+WB2Rluu1i+fE5XYl
         cl2rceyhg4fvtC1pt0Hxuaou5nls7NiorpZ6I7YexgSDW7iiCkTmwenhwZ4Z+WehAub8
         gglIWa9FgD/8onXSeqcbJ3qgPNtZDCHXNh9UnN23taCf8+StyKndaLW5QsqDE/ROlP2j
         2DkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774598537; x=1775203337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        b=ouhKD8WIUezfHoEpyasPFTUZwHo5eEFGgCOFAxenrCCRU84lRKprD/pd3/UJeL9z5P
         uM8PvKTepz3A8r9ZlmgWwpjULg5k4P9H6B248lPzKHRfZZrOx5WTaUgTtfmH9/c0Wg3Y
         mdYMBEylzCx3Zfg0qGcNNtcVYE8klNX4+zusnAP9B2hwqeVhbzvJE9C91ma1YD7ta3/5
         983i66wogS3kLcSFAD/IcXFOW0qwnuR0ZhUiJV9Oy5N/YQRHWYCxhQpPWbq5AKwtq3/X
         DJteRhU98VM9j8F0mbtAD/oNCdvXW98+dmnru3awV/gwrA0d3pryFBIx+NuGKzUTo8E+
         iDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598537; x=1775203337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        b=LMfH+no9rwgaQbVdV2dnblMoytJiAda76MNcETCOQS9O6SHSR4neYEJIobqmfKN75/
         zSNE1ZDTib+jC2EwwFv4eM5jJWdJJsea2CrnHBZw3Q5MyQ3i7Pjszppxr0AsjkmzP640
         0l2TZxGslvu/C1CZ48jjNy8VKi49rmR7i9Ixnzkaor0jqBxYuYpYAmLivndcTj2blYxK
         2j93CeUlEimkFOsUJtxrqqwU0D9UhyP7R6wd1T9GMRUmZNZbiEEBTg8WN89MIb81GVF0
         vvGFwGIgedN2cp46Xc1noVEBExfhn/P4aXLskFnXzIzBoCewqaF0gq5RCE66YSqMGBAT
         yezA==
X-Forwarded-Encrypted: i=1; AJvYcCUaMSkCkGdUJizjUpf1nI/W/X5Pz9eHIPfEcfo4BoRj6Z+zP8lXcmxWO1CywEBt2ME8nII8PMlFhKaky+HOC+B1@lists.infradead.org
X-Gm-Message-State: AOJu0Yydw7s7dfL9V4VNk02mFX7nHKAlhb34ilUnrqIsKiDZHp2kOs6x
	l2HTVIviEbBKdlR228Y8NgVxpUN2r1FBry61UTffXjIYWoKJMxRLkbauhA1F8Ai0A6dsovU3Nnl
	UlcMcAUIzO8XJ+FpB3G0C5vWk7ziMC3Y=
X-Gm-Gg: ATEYQzzUDD0vHnkqeWBRUJg7d0uma8xLLSwM5z8QaWMSnWUvxjonughzrHnbW4Y7JgX
	ZuYYeFqXHVyyiWP/VOgLkd+GOL9tITeLKaf1uAemtkIXOhRBIadzBaXWLiqUT/UDI9J8/Ox2Ttj
	6RMOMgz8Gr4UlJftcp8UbMkm9P9JcyDSPxaK7Z0QY8iPpQ+XEwlyvEtwwo0yT0fQmuBo4xaVloz
	hMcVetx1nctENcMQHwWfX/OgyQIaX/HweYncB+dXneHtZTt/wnGI9hfohk1zT8Zq7Jtlm1dm8gK
	v51z/kkzxosQ1F7yz16M6llI1NAstT049akymeMmu+FAJbxsSPBxjdeM275jfvmARrFFSjd0b3D
	dm3obZXW6QF0OmwF/6h/Q69A=
X-Received: by 2002:a05:7022:618a:b0:12a:6cde:fd0c with SMTP id
 a92af1059eb24-12ab2906c98mr371178c88.7.1774598537022; Fri, 27 Mar 2026
 01:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260322194616.89847-1-ojeda@kernel.org>
 <7ad8bdf9-5eff-4443-ad15-c05355d793d1@app.fastmail.com>
In-Reply-To: <7ad8bdf9-5eff-4443-ad15-c05355d793d1@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 09:02:04 +0100
X-Gm-Features: AQROBzCrGdIlIe2CkDWKMkYFmP8XiqVc047zlhYRt_gjOqAGZtEWFJuOGnDO47I
Message-ID: <CANiq72nz6zB0jGahw4Eh-i-Rew1kQ0g_qcZ68Whw==MyjhYaJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	driver-core@lists.linux.dev, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Alice Ryhl <aliceryhl@google.com>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, 
	Johannes Berg <johannes@sipsolutions.net>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, Russell King <linux@armlinux.org.uk>, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_010218_151508_0D0486C2 
X-CRM114-Status: GOOD (  11.39  )
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

On Thu, Mar 26, 2026 at 10:13=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> I have an older patch to drop CONFIG_NO_DMA entirely, which
> may be better here, since we know that nobody cares about the
> empty stubs.

In case it helps / for future reference: the patch I sent to Marek is
already in mainline: commit 2cdaff22ed26 ("dma-mapping: add missing
`inline` for `dma_free_attrs`").

Cheers,
Miguel

