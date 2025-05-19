Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98330C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9+AOPXxrsjtGniILsGnZjKCgDv3F7K2+yKjpaFrVAI=; b=vMCMqT6gMX9vkzNeWLExhdFGDg
	WX3jTGIV8ONhvlRbp/Mq5q77l/xegK18uRuoPp1c+wfTQVC/wzC8cjOmgJPZGLMkuBuyVAWYfA43w
	hxr8Krl5rNTSM5+pbSqZLKKVAEblr2N0IeUg97GPqSz8iKnDBU6nlkwYiAM4Z3/xtLEV3sZhgeLIr
	49/LElVGK+Oiqq5KWuIaMrlLpPsNwoyiPm4/FefPFKUMSMB5ZoaDe5Tm5+MOGf62sjSN173+4pvtm
	IIajtbbR4dFbW+/uhBrThIpJRpp3j0XeIed0j0Ld8E1i6LeynK2zaO4/dpLpaA3ZeEuben1uTsuLF
	iAxeCwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4gG-0000000A27Z-1vUy;
	Mon, 19 May 2025 17:53:40 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH41F-00000009vIJ-2Iam
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:11:18 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3f6eaa017d0so4144447b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747674676; x=1748279476; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9+AOPXxrsjtGniILsGnZjKCgDv3F7K2+yKjpaFrVAI=;
        b=hFbTRugoBjNYp6anD8hdqA+jEYwcxiV3d02o5tQ4MK3Y7N9qrGVoyoseSeoK7S2Zt8
         MobDkAnpej7wkTp3LcHHCdk7sl73LbzMEgiOKdK2ELxPVQDabWgp0m0aI91ZVLNXXkPZ
         W4CHWKyRpoon2oerdqTsl1PTv9u80Wm2aq51luWU482g1zmY0MYFpZJr957rsZb7nFC8
         dfkTkzqLogbqihLzuls/DxqA3z/TWiqcRhkQUtVnkSTYH+HeD1cATfSE7OiuhuuhL8Gw
         9914T9jTELHhoQoXZu744uA8rnXGr8XNPXWi/JbGQcVwarPUmZ23mJ/MOGbQUFTQrC+R
         2ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674676; x=1748279476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9+AOPXxrsjtGniILsGnZjKCgDv3F7K2+yKjpaFrVAI=;
        b=WhX2cDtwEabs6PTJCD/eH2ig715K6MTIYjRKVLORPwYoU38mejFUHlHYLvSHGialnA
         Oz22SIGJDha2PRfT4SUCzbQMTLVwdlCjRznDzpsJjMAhE8B0XivEcvMO/W4jFIbdehEW
         iOR68Cw7S/4a3Hm1ZSYGkxoHVBJawJAI8No4cccE4rPvgc6+H1Z+jw3a436XzdW0JURd
         6WW/cbviYIDYZbMZe4aEMnGWLsvEYZUbcs2Da9TYmYlZfSKglnc5Ld8JjHEKmxlQy3VY
         i72zLIlqrtIDe/WSKFdsqzMDMEX8nJy+dun/+ts528Q0NFccc+/iIZm/FdMgOmH3kXc5
         pd8A==
X-Forwarded-Encrypted: i=1; AJvYcCWvrYs7xel2Ox6sunHO8Q0VJ6lWv4nlhI2s77brBvheq0o8rR9BdIDTAvX9bQNJyH5T832G5Pzpv/gD9AOL7tGK@lists.infradead.org
X-Gm-Message-State: AOJu0YybpSEdk5SYeUl3eoUzSL49T6WDh9lP1qwiErYYNdAIyTlibk88
	ncDahwu/DaixpCTxxeGHOf82HWUrlyO1AL02lJOwdGi/sJYRxtbCppMhJ0MVk12AiMgUrbnVLuX
	4jjyFX6HJy177P+bQ2Vm+kZrynRW7sC/gMOHX9tXb
X-Gm-Gg: ASbGncvwMIIs6AKQoauUS6s05dsZ+gl+E01/zuUq2k5YfVosRrMdvaCxxzCi4r9HKHZ
	ghpXaHRerQGRTJyY02p69eo3vQsJDS75CJz2Dxc1tPeo0ehl/PZHdv+NOahMMvAdfvrEDCFPrk1
	LdSTO6iJuXoYT5/mGXE2FjOjo7/deBAXaIKFdXkYCUCjk=
X-Google-Smtp-Source: AGHT+IGbc3Cqvl0hgY9PsJO87Lm1XcEa46xCiiwbO5jWDmdGQWmCs6c23IP7AUXSBHo3+nusSu+IzZxGz9BjH90D83k=
X-Received: by 2002:a05:6808:6c91:b0:404:df89:85d9 with SMTP id
 5614622812f47-404df8988e9mr6567361b6e.33.1747674675605; Mon, 19 May 2025
 10:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250320171559.3423224-1-song@kernel.org> <Z_fhAyzPLNtPf5fG@pathway.suse.cz>
 <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com> <aCtfAcg32kbczs-g@J2N7QTR9R3>
In-Reply-To: <aCtfAcg32kbczs-g@J2N7QTR9R3>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 19 May 2025 10:11:04 -0700
X-Gm-Features: AX0GCFsWLG4-Bb9vmj3DbSo8XE63IQ1V3WuVgVTvtIAVe62z6XsrFewtIVMSBqU
Message-ID: <CADBMgpzPyW+EnB3A1Hr=LQGhuen4pUuJ0QYa44nH0qfQ9TFaSQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
To: Mark Rutland <mark.rutland@arm.com>
Cc: Song Liu <song@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_101117_583742_0DA8A22D 
X-CRM114-Status: GOOD (  13.41  )
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

> FWIW: I reviewed the patch above ([1]) already but didn't hear anything
> back.

Sorry for the delay on this, last week was busier than expected on my
end. I'm aiming to send the revised patch within the next couple of
days.

On Mon, May 19, 2025 at 9:40=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
> I've had a quick look at [1], and IIUC that's a hard prerequisite for
> livepatching, as without it the kernel *will* crash if it attempts a
> late module relocation.
>

This is correct. In both module-patch scenarios (module is loaded
first, or patch is loaded first) the relocations on the livepatch
module occur after it is already RX-only, so a crash is inevitable
with the current relocation code.

Thanks,
Dylan

