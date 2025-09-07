Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9A6CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wo3tK6bHFA7DqiNO7PYI330tCwygBeTXt4YoEOQtnvM=; b=ypdR3YJcAvz+wQT8TEnJIqyts6
	W5zdzyLtAvdD1sod49h+fdMmNZf5hWvUUHTzVEr2wEGigkxI+Hkus3gzU98F0FOCh+VC6LB0ozihC
	n+Skzhn8hDjHV3wT3PvMgD9/TfHJDwuYy5lBYMM50sasxxjuJujzXpYTbrD8u+eXeMWfWrWf1kNyU
	goWqExgWhVpy8MctO2ENlZwbci8O8CNOxgNSrspXRMvxxx1oVtlQ2JQJ7X5PORpjt2yBzjV+drrgR
	CIOKdkFjKz/m4n06IDvRoXmXIPvNeoPA4N/N03WaOpdz3OqRvGaA0+G0nS5SYBrpZ11fR+KqO2zmN
	Iw897+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvOdo-0000000DJrV-2Ihe;
	Sun, 07 Sep 2025 23:17:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvOay-0000000DJ5x-2BZV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 23:14:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24b2d018f92so241475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 16:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757286891; x=1757891691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo3tK6bHFA7DqiNO7PYI330tCwygBeTXt4YoEOQtnvM=;
        b=sDN/MmspHzvlFKMY4brK307QsMzrVrmw3LA0ABB/AhRxd1hiHw3paYlCO1TpsMLCd5
         X9la4ntnYR2lyLwDVtSY3rvF9ym0c8n0A1Wayo1LnnF+2tJenMfRxgw2bfUkja35SQ/9
         gIgzVp4UBDq9sbsKHKfNYkL2tWFLfB7QKpGvKKCiQD6gpcp92T5Wuyix+LCaXC4nDzmP
         KaN9tFeZRuxnJoDkpswOLcchIsRsJ889OBnsypAeGvYk4UHmiokgyCxeEggIwiZohmnA
         OaAULuPTG/9Zwf9VLUmY9L5iLcxou93i36XFcVEk0GGT/5lepQ+7gEyoPsRQFieKcVzh
         ZmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757286891; x=1757891691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wo3tK6bHFA7DqiNO7PYI330tCwygBeTXt4YoEOQtnvM=;
        b=E7eQpsA+Ga3fYTkqIBqvIEfPkco3xDYyn0I2kZnsphWH+udCxB/X0IW1GciSQHsW6k
         allE6u0QLsQsaiKoRtfvZtBNFsSY17shVdZTFFsfVMU/UZWBHkeuuvk12Vm055sJIQR9
         hNxmJ8DC0NXjikUXiu3AWOVtOTX3OUUnaUgT/qN3I9dFgmdZSJNg4T3rKDmbHhpkb1WH
         Bfx0/7CYpk82OhrToYTtpZvrPSDz5DqJ78+byvS0xNVW5uMuNbh5oMLLkk0O21UiOBh7
         KpDbLf3xouduW7aUldrhIuvMcwXC/8Oy9Mz6aGsP6y/kzNaMBvEeaaswP1cXiacA3G8J
         JYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbm+R8/gWm16TTBikcr5LLMcT6EhjY9YyzxWcvkm93zNcEiFWTks/jYbZnw3T6dTebtloQ8prFSp91B+57+lVJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyTWm5eZ7zuhsYhu+DpgsT3gaRren3UHMyN2JuAkyE3rOQeYxVL
	AaK9OnywfOQDIwWQOZ9BZuxniOx24iGBJ1EIDssDEpVMbiy5/pCd32k/QMPd3/g/EmOSXC7g30H
	J7cxDZ3S4zCTfLALDs0Vabrf+IwgjQ8n27Y8fKNe8
X-Gm-Gg: ASbGncv7yJYI5GjZ9l4+urH02OnVIO8/iU2CbGvzyAf6nm/HW94fYDuQgxoTTIgtBX8
	zQl8nDBJ/CbG01kbcmD9vPb2WXEpn5gmvG5nz1znUPyB7KGDPdaRIW5D7xG7h/q+JTCpXxlus34
	rs5Fa1wW5ZXz/BSeX3ntkyMkQ8Q45Ym/0qwm4vu/4yf2EuaPE+/RIkbXYS9EcSmBLmtoDTwWNxf
	l/G4bpCoDSvr5w=
X-Google-Smtp-Source: AGHT+IEltd/sAul6Dn7ms8HB6NIeq1vgyjW8DOdKH+H9ryQVdD/7vpwWCRfh119NUS1vpsfKq75+rwJhHcfHD7PiJjg=
X-Received: by 2002:a17:902:db11:b0:24b:1741:1a4c with SMTP id
 d9443c01a7336-2510f458c5emr4290315ad.0.1757286890641; Sun, 07 Sep 2025
 16:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
 <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
 <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com> <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 7 Sep 2025 16:14:39 -0700
X-Gm-Features: Ac12FXyVydF5cSsxyRKJ_un6fARDQ6-2DZTw3qkJGbuqWtoGH405LU6WKebU2PI
Message-ID: <CAP-5=fWkcxvZ0z9FJztbN4EhU+BNEJTNxe2a6_+11EcYhjZQaQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Doug Anderson <dianders@chromium.org>
Cc: yunhui cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, atish.patra@linux.dev, 
	anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, masahiroy@kernel.org, suzuki.poulose@arm.com, 
	maz@kernel.org, zhanjie9@hisilicon.com, yangyicong@hisilicon.com, 
	mingo@kernel.org, lihuafei1@huawei.com, akpm@linux-foundation.org, 
	jpoimboe@kernel.org, rppt@kernel.org, kees@kernel.org, 
	thomas.weissschuh@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_161452_581105_3A4613EC 
X-CRM114-Status: GOOD (  21.00  )
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

On Fri, Sep 5, 2025 at 4:57=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Wed, Sep 3, 2025 at 4:56=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.co=
m> wrote:
> > I=E2=80=99ve read your linked content, which details the pros and cons =
of perf
> > watchdog and buddy watchdog.
> > I think everyone will agree on choosing one as the default.
> > It seems there=E2=80=99s no kernel/watchdog entry in MAINTAINERS=E2=80=
=94what=E2=80=99s next
> > for these two approaches?
>
> I guess to start, someone (you?) should send some patches to the list.
> Maybe one patch to make buddy the default and one to change the
> description of the "perf" lockup detector say that its usage is
> discouraged, that it might be removed, that people should use the
> "buddy" detector instead, and that if there's a reason someone needs
> the "perf" detector instead of the buddy one then they should make
> some loud noises.
>
> You'd want to CC folks who were involved in recent watchdog changes
> and make sure to CC Andrew (akpm). If folks react positive and Andrew
> agrees then he'll likely land the the patches and we'll have made
> forward progress. :-)

+1

There are also things like /proc/sys/kernel/nmi_watchdog being used to
enable/disable the hard lookup detector. If we could move that to a
unique file so that perf is less confused in places like:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/perf/util/util.c#n70
ie. perf shouldn't warn about the NMI watchdog being enabled and
taking a perf event when it doesn't.

Thanks,
Ian

