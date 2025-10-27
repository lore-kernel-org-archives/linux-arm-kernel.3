Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A754CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyGCp9ASaMEVdd7OGwSr0N7G26LNgplWkJBV0Rgw9hw=; b=R8Cu+atA6scQnh7+SmhWxrhKU9
	loz5eMxquN6PTl988DbGstzP0S6RAGUQTGvCYOFOjNFolN1eMCGt1r8shjfxEcrAcW0NdKBNu6Mf2
	ZX2upIjEb0UaTFr8JgwSLJnA9RKQsCZ6irC2yQUSGvuSpZXK4oYnVxGewibo7x8OOuS8z7a+DVkgp
	9zD/UYCfoiDJe5wbQm1+BD4v0xmrNcSzfIazHy+LBlMceYFby4ldvC0OeukVwv3E0wZQ9UJwSLz64
	qeE/8ivWR2jrqeIbeHKR8V04cUB4PbwBDBwaUthvRFokiTYnkUkQ1mNtm2WHx/5gzArjQZh7/e7f0
	cv1nd9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNz1-0000000E7XE-2pf3;
	Mon, 27 Oct 2025 14:14:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNz0-0000000E7X5-3MoZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 14:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JyGCp9ASaMEVdd7OGwSr0N7G26LNgplWkJBV0Rgw9hw=; b=SBTm9wSWyviVivtNEA6DU2DCOx
	7+9lob9eSf86LhPHbzboZSW5f99ql1DAHqaiPoMVvL981/8hfuc6cX/gWoJ6kzwZZzJWG/7EQmCWr
	IkPV5sB05anjPNZXOffTWQue2uuT4px1f5EIHbdl0wtT/gNHVzb1c175ApDJXML8O7MZGfr/GH8ps
	liwM9RIx3RohZn0bmPLsI0lVy5nMyZbMP3Hw790IvkASOIiTrJk7C54406PsBNzzta+SHCidtB1sl
	iMs7Z/EZ/4ZptWLBFQIa7b4/k+Ak+KNIFKBN/Z/UUcU0pXg89wNaNAWHSK7+uLTdbLzFP/rr9UfmC
	LXQiCKJQ==;
Received: from mail-ua1-f45.google.com ([209.85.222.45])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDN7D-00000002Gys-2M2K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 13:18:29 +0000
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-932c2071cf5so4504520241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 07:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574436; x=1762179236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyGCp9ASaMEVdd7OGwSr0N7G26LNgplWkJBV0Rgw9hw=;
        b=R5ySl7Opm+5M6bdXAG6glbYJV7k2krf8mCvvmTmWoCbutNjeSzMfT1P/BKB2HCnX2G
         4aDBqvsh/2jtJ28cm7RhtgnlTT1wfkrGt+njhQxBhbnQZ9X+HhvyillHp7PaUnVw2XIL
         uEa3Tgdho5o+f5QPpFaHxPENReoDVFI0vXGmsotgNIk5xSKKQ5vzT+K36Ug0qvTcrRS/
         1n2sZAuFNoFkR0BHXWG9dRfB3IF4I/jm6czvciBIYxL3vnNtiFXNBmzku6/SVX6v4J8W
         6XbfFW9R5YNg4zO/579/eFr+fpjdC+ncF2Nu0uYXL/zcQYE7zwaPFRb9aQQXO1D6OurH
         fyeg==
X-Forwarded-Encrypted: i=1; AJvYcCWgVoIupVF+YDXNXWqjpr50jYgE6wQ3m1muq+utSGmEEY0FQRkeTDfiON9ObkZjSqFsvFWhk18/px98BYUJ3lPv@lists.infradead.org
X-Gm-Message-State: AOJu0YynOo3IG/fOqCtikVmXOoaFx2xj2339F8aE8hrUheB8BCihkPzr
	wXeXMcA4oZtGlk0RZOfm46ZDQ3R0w/5hFtmonw0g3uRNq9q/aCNKQ1qUqak0kXB3
X-Gm-Gg: ASbGncsgvnmvDgW35/Q7QxOMxn4pIOYzEMaCpJiHXRV/tO4u+3RuuCQrOgSwUzVr0ui
	Jsalp7OeeZBijMESDinz7kSqXL76MqfoZ7q1F1oW6LCEdLvnO8dajRrsmTBxkFZA1/tkt4Eecmx
	0lyoY7si2LdnN4oWzdlJZyP+wE97xcLLNDqaaY/gttrwSr+xEOcuU7iFD6zmVZwhPnxAqfSUn5Y
	2apSm6Wo7ndoSszIoq21FmqFGG3I0yhsszbD64/KOQsiwnFc+YytWbzdgDWfD/u5HGeJm2m3nwg
	Gf/5zWAivjM/nnk/Z2gwjvNFwYOY50ZEzhz0pywdRMB9wC6XhYk7MGFb5q7//ucDDefUhmFRpKP
	9ZkSvkcCR+jhcQ1mPw+OukDUMRP+Wj35X+QTWCKN0MrZd/jlwIGF3XVVzbXEqiW7J8EAf2Qqfap
	qQN3sJSGzXZSE/Ch7CkfhFEpJE8F/tZarGkAE3qxhbYBxOXFQ9
X-Google-Smtp-Source: AGHT+IFbqjgX04SErK4LeoBS1Oc6xqkDYjIkgca/vi+cfo8ctYfTg00c+Lk1MQGokmx/W2yLUQdjCg==
X-Received: by 2002:a05:6122:20ac:b0:556:a243:8a72 with SMTP id 71dfb90a1353d-557cdc32e90mr3767482e0c.5.1761574435992;
        Mon, 27 Oct 2025 07:13:55 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb9d2eesm2867251e0c.21.2025.10.27.07.13.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 07:13:55 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8eafd5a7a23so3548158241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 07:13:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRA/xwDp1En7F1OZjCFzOdOmFxr3sgTfjpa8nNuPaNDlyKFKQAseqjyhQIE55xqmRWppM3sWV4k1tI24a6livU@lists.infradead.org
X-Received: by 2002:a67:e443:0:b0:59e:73d5:8b57 with SMTP id
 ada2fe7eead31-5db3e22dde3mr3134960137.16.1761574434833; Mon, 27 Oct 2025
 07:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org> <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
In-Reply-To: <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 15:13:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyrkDuciWUxpSM746mL67KaZvcwzFVLLMj=NmqNXdg0Q@mail.gmail.com>
X-Gm-Features: AWmQ_bkADagh4uPO_Rn8vJHrRcLCHt41Yo3zGWeig4Q4PkqMqdfqLZfmPk9_Qcg
Message-ID: <CAMuHMdXyrkDuciWUxpSM746mL67KaZvcwzFVLLMj=NmqNXdg0Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>, 
	Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_131827_722847_C2441EC2 
X-CRM114-Status: GOOD (  18.14  )
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

Hi Matt,

On Mon, 27 Oct 2025 at 15:08, Matt Coster <Matt.Coster@imgtec.com> wrote:
> Apologies for the delayed response, I was on holiday for the rest of
> last week =E2=80=93 I'll apply this to drm-misc-next now.
>
> On 22/10/2025 04:37, Marek Vasut wrote:
> > Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> > present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Thanks!

> And just to keep the test bot happy:
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510242309.6p5FyVLQ-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202510250550.66T4zLPd-lkp@i=
ntel.com/

FTR, none of the 3 lines above should be added to the actual commit.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

