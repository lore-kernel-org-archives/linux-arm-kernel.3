Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9D8C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 20:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMHnsHq/OTZKiV4PYYiWLQwRz7k4SvVkH85VQAVMhEk=; b=DVucLnbVyb3o2vFvEBNbLQFLGc
	gxwYmVNffgj5zO8HeTHQb+9KdxWxQXDsjH3QBjB73KBb7MmqoSxPHcUQDZCDeP6QhZk/XI9fMm5o/
	OpIrVjitKBsRsjkWseJAWP5o0RYH4ENvS/KBov/USk6xGs00O7LAe/yx3DhYS7KcBd5Cl43Qpuv2b
	KngNllUY5eFEcLZGX/glpfpNk02mqwFI1jL0fTTPPXv55qPeIlHEYUqwJG2w8LS7EF8pY9IvmChix
	mly+gy0yzrJvtvrTkvYLksVBtC5OF57muBKMIFuP8CEcZfuEKdRKfBduF2zKWyESPInJbl/KYp5o4
	s6vEI/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Q4O-00000003Q8Y-1qix;
	Mon, 14 Apr 2025 20:06:16 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Q2W-00000003PzI-30OE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 20:04:22 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so821991a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 13:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744661060; x=1745265860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMHnsHq/OTZKiV4PYYiWLQwRz7k4SvVkH85VQAVMhEk=;
        b=SXMF41d9mo2L9j8ecHOvY/v9fRVhbdejd4Pd1GBlIgQNyhitlU/IsddphPR3kWB5vb
         QFutbnkfYsAKINPuCjHSkbb51TQM/bckLxSTudN6Z8EbJSKo5mTQtEoLBvtn2BdizGB+
         SSLYOGAfFtrOxMPZ5u9Z0fDJbUnxtBE1bsi66MfW5wahqcTY5nfgwu2pgcNIhcGpDxLK
         94rXqMysSTA0Rb/HQWrHaV87BPCiLfmv4ndt6TBNlJh7yNe4QXTLgtNuRJr4u2i2SHUW
         qEO7Y9dOArnkQvIYz901/tWUE46ROO0xlEc13A9tRaarro1ivuW/4+OWAtwW41IDqlBC
         dkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744661060; x=1745265860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMHnsHq/OTZKiV4PYYiWLQwRz7k4SvVkH85VQAVMhEk=;
        b=lbKvZoFaR/J5PjHQ/D438fHZQZBSQZq2E5C436SaLriRAxmgWcehqtivbzaQxPcrjL
         TklCz5HPh0oy4NKoRJGKl29HhdMkFq/U3Bioq2Umafy0GMfLbh5h7VcZxmtxj2frThG2
         SGs6JDh/JJZYwx+5LrHQQsgCYbScay9t9Er+5lNAszoMeizDJGSwnSPcBSWiusKDmFaQ
         IsEDEQkDnyzMrii4Lms6bBf9lVkLt6bfQC1TjchPhPgIXeKolAwr9BXoYgWTdZ47QX+n
         20AOK0XVOQg739AGSTrqzH7xc4p5EO3T5YfylDSXpAG/0iDgJ7CKA2AXohfXNuemILP1
         jZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUYwdWASGcs9K4/ryiYV4ViDQeqYPNUOdIbxZX5L8NNgBH3Dq3t189U/pIsBWQN8NnJEQ35nvexJWnstN58HAe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx495dNB6dQ7xCTquMc5ndL3upmYKvdapCCXY+E1C9NayIujft8
	jb40+egkzHak4npdjK621JoqDJ71+5zPgU+AATQxD5QtcmhN74OBBc5ZbhkWCOReoL3CyB5RWjH
	dlltTVTs09AdQrsl+BG5f6pe6t/jiT+6Y
X-Gm-Gg: ASbGncuHQW7Eddi+81JceBXMyC0mLu4li2SYvUm41/XIAl4yF3drJwHNtbR6V6r4oDe
	/QsRlkxwT5SFsAQdLSJGThi4mnDiJwHKnPDYAkS2p3DjnhvFY0TLhbD3+vlVGHoVW4Zdcwarjec
	y1jXuymWIUwGuaqiHiMrIUPg==
X-Google-Smtp-Source: AGHT+IEIsC+csnI6Weh2OROunc3WgcgEHXLp5SfVQnPJhalUb5ZDeDIp3PEVZXXpGRp6IE4jLRwQHMQHJQ/2aNQrYNg=
X-Received: by 2002:a17:90b:17c4:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3084e7660a7mr588747a91.5.1744661059013; Mon, 14 Apr 2025
 13:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
In-Reply-To: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 22:04:05 +0200
X-Gm-Features: ATxdqUGhP1sZvMYgYKWAALlWFoszwfZM_Wql-C1K7rgS--G_42gWwTfE1HErvmc
Message-ID: <CANiq72k0BY04QgxWUTsgDTZJmwHurtK4XKmdWrBA1qN5jKZqpw@mail.gmail.com>
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>, Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_130420_754039_3E4E73F1 
X-CRM114-Status: UNSURE (   7.50  )
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

On Mon, Apr 14, 2025 at 8:14=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> operator with some support from upstream Rust. Or do you have

Or, probably something that makes more sense: just forbidding its use.

Cheers,
Miguel

