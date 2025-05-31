Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F577C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 15:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSSawh4TJNRt/0sWPEPpqG3dCXsETs6+b32NUQaU2jQ=; b=tlVobCnWbVwzDldrHdFkfWRvdZ
	5K1Q5sjgeCIWWKHw6mo8+I3lVDjnp0L+S4i9fHHdfXKVuucZqab5Fx90wKxjoFkypRltMli9WrLub
	wZdi9NiT1KQKCsfk91bENAeo2pnh+0AOap26Wmki5DXidheDgcWL1AdTJiSUKjVGYV/PYL2EQJzWi
	2SGWSbvJNy//XIzHE9M9I9vzclYYptVeqSwxPsKuhpCxGoeOPgXdUwcdhL3mvq9LnrvWvh3Z4WmSe
	EBcZrRwC0mgIZmTHi1Lwa1JCeAai/ytZ6qewO5WgpfZROIAfZiUZz1ts3yT9rD18ilBGwJ55msa50
	2Yhs7Adw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLNwx-00000003wv4-1nWF;
	Sat, 31 May 2025 15:16:43 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLNun-00000003wph-2FVo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 15:14:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad56829fabdso456791166b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748704467; x=1749309267; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lSSawh4TJNRt/0sWPEPpqG3dCXsETs6+b32NUQaU2jQ=;
        b=XwGZGYuOpX0c7/d3iA5pqhVHOaeCw1odrjSCqrl85CYPs1RYMuypqxtx/UdRSYRzgm
         F7SugLW1aHVD3wIRjhjJu+j3ZUkfH0Ah+TNcvlUsklFfQ1migY50xd9DVnfuExFd60WV
         xEmko8gfiXxDPI7HjLtLsEQ2M2fcVSsufgVGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748704467; x=1749309267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSSawh4TJNRt/0sWPEPpqG3dCXsETs6+b32NUQaU2jQ=;
        b=fNGqB++KsudJjYHjr8R22ckUajCmRCxMnH6F+scnr5BknqmvAotDPk6cwCPjOB6Y2g
         Ik8BzcP/Hoo49T9saNrvMgFuQ8XbOUcq7LI+xNnXmQ1hSeBaaT5CT1OGeAd7KmNOdZD9
         aovVUCmGqIR/DC8ayGVS9NB0MTST3SZBuHR+zQxieTTurqpJuYHTNnUVsDCE23fe0yt0
         J48MHc1o5Mmtj0J4LB8iKyjaxf09kmr+GbEtMfy8LSC8Q5S6IKUrEugkwQ9LOxc+sZd2
         d8DVhpIbCKyUbMa42jFoMMsee63p2UbyujGD1/+KM32PCuCdbOFOpxQWsV9KOCNa2sg3
         abww==
X-Forwarded-Encrypted: i=1; AJvYcCXAM8R/qU/Nyyzgxia0INz9k9loj5NBXw/QMAik8HndrvKIlMVYOdbnPM8TDPQ5nW/PoGOwtYUgtdO4IQG5/ynZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxAuygm/W4C9/J0msF5VbyDACWxwNiaH2ZRmAuC8Me23aZDfRwg
	pYoezURtYWROWQU4RoYis2/PhnbZQ5rnLSaO4bXFqn7hdi/BTHWCpS6BEQalMucTp88atvwitTu
	nMLUyyAI=
X-Gm-Gg: ASbGncsg6ghEkfIC/b5AivzTY4IwlqP5W7El3rxZwzhYJbdiTHbLtAQpCujjNsFufzB
	qcmrRjFHNks4TNH/rCcw5J1j9t4QNn7z3fFzLZpQ3ebciz3Z8am4uYeb2QP4Sqh2+MB5t8E5Ob4
	vdxuMm4I6R35+A300Fmv6zPseddBGkdpSODDIi+/8oMLe6xhE2cZZpdmgB2B+vsoGKPVNqK+2fh
	SGG9sjckfGrHjf6yX1/kjOjG7T0xSP9UeVJcO07vghjIL97QorrfcRsIPIGolk23gBLwb0waHng
	2G6pYBcnialOzAEV0gVOTKJYpgU3uZqDhLeYIuQvTY9HlYI2oKuM4xOfuhssuMyJ/xm5a9RQoUa
	riV+pMbIYsivZIaUAuyye0PEgYA==
X-Google-Smtp-Source: AGHT+IHT6jh1ObWBiaS4hAjRttk30c0jl1HrDHEZ5ksFtLLvaTrrlyqtYNSdHU4c942PuoCL1/GYsw==
X-Received: by 2002:a17:907:940f:b0:ad8:93a3:29c1 with SMTP id a640c23a62f3a-adb494e5b54mr202702266b.37.1748704465647;
        Sat, 31 May 2025 08:14:25 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82ccf8sm505040666b.44.2025.05.31.08.14.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 08:14:24 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-604533a2f62so5615743a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 08:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/UWbSSsmq86RI5VpSvwIl9oWLSBbxf9ThN40/kKL4FPmY9eI+Pi5glaLN636RDRG8/rgOmfuQruo3bEaT6UKf@lists.infradead.org
X-Received: by 2002:a05:6402:42cb:b0:601:dc49:a99f with SMTP id
 4fb4d7f45d1cf-605b7748f23mr2083379a12.18.1748704464453; Sat, 31 May 2025
 08:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
In-Reply-To: <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 May 2025 08:14:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
X-Gm-Features: AX0GCFuT43-u4qtV8M_qs-fcu_pSqgRGcd6qMnD3Ro4tTsTKzf_cc8MjRwFbJzA
Message-ID: <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
Subject: Re: [GIT PULL 4/5] soc: devicetree updates for 6.16
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_081430_070407_6A136368 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

On Sat, 31 May 2025 at 02:07, Arnd Bergmann <arnd@arndb.de> wrote:
>
> There are 11 newly supported SoCs [...]

.. and then you go on to list ten of them. Or 12 if you count Amlogic
S6/S7/S7D individually.

Just checking that I'm awake?

           Linus

