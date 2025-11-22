Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EA4CFC516
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 01:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eK4AUJBiIJz3oZNmu7sUeKDHnLWzFnSMuNw1lB79Qkw=; b=hLHTe4jwcvFnGNDIQwGKCe+fUr
	NdjpWw9DmuovClC+eAcedc9HUsm0NiZNSPbYnVpw25FuLKB1SS4tXPs5sMI+r677JuEs6ZkH47YQV
	I53xHGB37wmyfa6kXxwY8OYuefjMGYl/55BtqndFlvZWBgmTmf4T5A8bsKXotfzg7TEm/A4REoqc0
	XVHv2Xo1SFaRzvhWc3xp8cgmXirOQYZ9nWoM57GTBUwB+HocBtkPiOqQ3ALxrajlZvYbh6oVFEXxp
	SOFE1pkhL9pKCDP3xnayylvBHJuNifJ+celc6XjUs+gYO5xP4Is0zDdGlpwXyhX9Ltf+uujalp0R1
	qtQ1g7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcfA-000000099yt-3uXe;
	Sat, 22 Nov 2025 01:43:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcf8-000000099yF-0Sh3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 01:43:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so2299901f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 17:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763775820; x=1764380620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eK4AUJBiIJz3oZNmu7sUeKDHnLWzFnSMuNw1lB79Qkw=;
        b=Db478SPi9E9FXy2vlWM7B1t4KBibcCfM4MwZ8p5gtNGHz+X2zX5QO1PC8S8M92yK5Z
         hHyQ5q87KDixTFaq6yWovAbb/6zUoZM2ycnbBAU4UKG2aTNQVuExHtwmMX4Gaew1VD9y
         VfwHjyc5UpjlhoQZNObprgM/1tc+I42usLejpq5xSK9U4a8oU81WQLlZzVvK+genkiPr
         ISuQzHFUDm4eKuTFQxWfypkqAwS0x3Lu0qKAMCe/Q3Kae9W/REasT+hs0QM0b8gogiGs
         hiupdTZpnTiBH9deZzwfxXsQ5reIUn7eNPTAr3ObPuNoc4OBT3nYOwdj4nJy2lJRML63
         2jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763775820; x=1764380620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eK4AUJBiIJz3oZNmu7sUeKDHnLWzFnSMuNw1lB79Qkw=;
        b=aL3LWG6P8lNPGOtlaZT/i5ZQWgbC5iUBkDIXKN13WC97PwFZEBiES9bcf1wiRv+oD2
         NGmXetYEm0CYqEjB2wLfDXeSTzeO6EBba88YTwuEcyrWzzG0VpqFFfbZQTlQ60QyetaT
         AAzyfqkiKIVvHeurc4OgAtEDn91cgvI7JMiUj6SXvTG1LONkVkrhgAspm3cDbBoviYDL
         5KwERLX1lVmO5tbLecZeLyMrhBcrcox7N8Yik8GHjqLTg5lSkqKVM5ziiFpPuzVBuvzI
         hTlJEB/hT9uAjmKtmcFKAFJgADrTY7n78xjI5wGyzC3d+SmDSG4U6C7t0eJ3byCStysz
         Vp+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAndWUqxSezCvyLqOnEi/GaUF4uFqaFDSu9W9Ao3i/RybOQ2PqphxMuOSLApy91kJ3qgErydth8UiGZEB3P513@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5n0mXhxM1xHqsDyC9pvzzD/pIP8hDAmwAG7Ysl+RIAowMBZ9E
	x/YlD21vJSUgfoSlofna17MYAbpzX9MAy/iwXQu8PeqBwW1wE1x3opdpp0KX6ygKwmxv/4NlUST
	+515QB/CfdwT8jqlpT35wrO+EKaRi6pk=
X-Gm-Gg: ASbGncv5OFyog++Sl5DePdPPd6Uv1GRwWe5W1eOneOBD0TiiM0jIlCySM5yykes/Dw1
	MmauJgc4Nv8U++JzwmlBj2MSyi5aHL1MmGludxDsHFw6Ni7JGtrQUoxWpsd8sCTBxz7pWB2TZoo
	RCH/2XpoDGhvblXN4Yj+SVGYz6EDGxiTQLszioQOeXGueKyUuXRTVlvf8pMWD93mZ7RPrtz6o0z
	VYbktA56t4AwpeY4j0/pHN0odMHAWOk/7n/cOaSWLEDWy5HgQUMIQVfD2zrQuaHR5WmRMJYX5pQ
	nsqSmW0F/L5p6bvR7muXSPTGKvBV
X-Google-Smtp-Source: AGHT+IHNIEMsKMuIfgmf4nSIkpkBE7g7sYoDWkVC8xsVj6L3W+IxV7WiDaJ3iYbj6vVbtX2WyqaxCHsUQwVIf+tm5GM=
X-Received: by 2002:a05:6000:26c7:b0:411:3c14:3ad9 with SMTP id
 ffacd0b85a97d-42cc137bc77mr5027746f8f.21.1763775819744; Fri, 21 Nov 2025
 17:43:39 -0800 (PST)
MIME-Version: 1.0
References: <20251118005305.27058-1-jordan@jrife.io>
In-Reply-To: <20251118005305.27058-1-jordan@jrife.io>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 21 Nov 2025 17:43:28 -0800
X-Gm-Features: AWmQ_bmZ4EmkvTNStUUIL16LVXwHaftQKTWLBknsNveweaHyuQUb67hzwSYmSE4
Message-ID: <CAADnVQJ-9JubH5r4oSwQneu3o6U6s8Fa0cjCsi=+6-R+9nkzHw@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 0/7] bpf: Implement BPF_LINK_UPDATE for
 tracing links
To: Jordan Rife <jordan@jrife.io>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_174342_160825_36C41DA9 
X-CRM114-Status: GOOD (  11.02  )
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

On Mon, Nov 17, 2025 at 4:53=E2=80=AFPM Jordan Rife <jordan@jrife.io> wrote=
:
>
> Implement update_prog for bpf_tracing_link_lops to enable
> BPF_LINK_UPDATE for fentry, fexit, fmod_ret, freplace, etc. links.
>
> My initial motivation for this was to enable a use case where one
> process creates and owns links pointing to "hooks" within a tc, xdp, ...
> attachment and an external "plugin" loads freplace programs and updates
> links to these hooks. Aside from that though, it seemed like it could
> be useful to be able to atomically swap out the program associated with
> an freplace/fentry/fexit/fmod_ret link more generally.

I don't think we should burden the kernel with link_update for fentry/fexit=
.
bpf trampoline is already complex enough. I don't feel that
additional complexity is justified.

