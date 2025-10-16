Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88967CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 18:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvdI1tHJ0y9UyYUK8ggKpv8HiCk5nY9MZSyFsaBNsRY=; b=bIvD+o1y4fG7Kx42eBdejDTgY0
	jw7t+YNOgiXP48Pjt1zVzJSmaEzStOZD0ZIRr3J6OYToCsXBXih8zFtOiMvcxpwIp8NdtmZB42l4K
	nB8ZT7GfwhQQcUE1oc+3owaX7twg79CPF7qj3VI9uBJSrs1ncGnQ4l1Tpkwh6Zbshds3RdE16qdtc
	6/0OBvdsWTBtFf0nZVcb9fPdo5LYG1x+aea0ljizu1Uv3UX960wBuXZFvhuwdqY+EVzhhi3mCax5A
	17PTZjZWhZruqEPhlK+fT6nIRotU+Y0W4CsXgDlPVsA/ndHQQo20LbbbDA1+Jwoh5Xk+XOBmeOdu6
	Gn1N4JKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9SP2-00000005fED-3XY3;
	Thu, 16 Oct 2025 18:08:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9SP0-00000005fDs-2WV5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 18:08:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-26e81c17d60so2003935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760638117; x=1761242917; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvdI1tHJ0y9UyYUK8ggKpv8HiCk5nY9MZSyFsaBNsRY=;
        b=cmflf3KjH0RmoYo8avkTb15pue1OM44GqhxcIKpl44Ql3mfakBnTk0EsJ12gMhLYSC
         nz9x6F/hdGk614NGIX81kK9FIGC5X0/l89mdZD54k2/Ln1ewCK0NqBHTv5BpqC4e0gOM
         afXFN7RI7LkXgYMX39tnW/v1Mf3TavU1E9XMQTBRG7f3QKQXnU7r2gK/JhM5n6SaQM1X
         ChntNkQoKqYqnYoxiDra+6LnN8jpjvpwsD3PyclfU5LMFx5COBZx1h1bhd9ZLUVy12Go
         M4LAbR2JnfQfRSNjFQNRHJeJ6D31iplNIgf1x3cu9HGZkccD6PvG4mwf1NTSawtuFsOk
         8IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760638117; x=1761242917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvdI1tHJ0y9UyYUK8ggKpv8HiCk5nY9MZSyFsaBNsRY=;
        b=uPWgmI+6xF/deKJBO/HyGimCGy1UtW9wJIgAqcrkwa6EwrccNMq3vie4VN5kOJd9J2
         p/i4YwNdDTUsET7lWABnrkx8or2QYGguB2ER2Bdi94VxFZWt4K1P13Mf90Pt22zZ1zRa
         sI27yAXuwaOfvEBuvaXunUiXg18M8tP0wYMVgNBeTKAmPocLc7J7rQDDfg5gRG6e6ldT
         lA5aAyfsUwcIzQTDMf8Ft6Bh3KD4rQOC0l8YnAtcauor1v87Lig51l2ySX12SN9pmcxS
         FwuZeEipTRZMazWZWNRKxeZjUFCXQAfgdpIqfjZDTSmCbupobmzyxwZSMmLtj3+SQ++P
         Qs2A==
X-Forwarded-Encrypted: i=1; AJvYcCVckNK+1yy4/Ki05qT38HWaSF8kCgKu0nGFEq4QPtQ93FZNwDSsmRipIGQMpMgFB4tAv0zpRBedWLL75MdekEZF@lists.infradead.org
X-Gm-Message-State: AOJu0YxrBzqx5TbTyx8LrLdPiDXP3mCM/dMlV4W8BUOD5IIGwG5ggNgd
	g/FmLDPRRnufrveIt5DhkjCVOiS54fd4SeLs3lrrmixVolqjPiFeCWJySW6rpFvbG+0FUzJujXA
	lzGlsUXBCcpVeMrKX9IwuWJoa3jXEE5Y=
X-Gm-Gg: ASbGnct45i5mOGcCEnqgyIuq7Z25DKyyv7UKBu8VjlI7bQLIgUt/Oa/7aUt2eEDDepN
	agpB50VqunBFSP4joybDHMw1ICDNAMSqtF4i7bLB+AwDCGJkYJmxDr1ct0kk5CVCL5BPKJuayxo
	X7xlOWfwDCXaSDAZZTmYQPSjuSQ3dt1dXydrYPifrO56y/B9fKjCtpTEVKmQLVlgbkA94u/dNS/
	hmXVqQnJevUpMW3LBXe0uNU7WlUM+WcmZEHbOAC85wA22ICZEl1WfNRbmrQG01W4/w7yDit8RxJ
	4i1EsQPQaVhyqK+i8V9/J/EuxdP4Cf9FU2YlfVjxrNuuUPOpbDJlNEAemYrmkihM7bEqHrWTpQA
	cSDtncYeQZ9VODQ==
X-Google-Smtp-Source: AGHT+IEoB07YLtvOmgRhJpNg1dneDk3OqPXrwHl8ZjlPvoUL+f8vvKYxA5NW6SB6Z+zvhdKoNNyC5a3rT2Kl6EmYok0=
X-Received: by 2002:a17:902:e743:b0:264:cda8:7fd3 with SMTP id
 d9443c01a7336-290cb27ec63mr5305925ad.6.1760638117403; Thu, 16 Oct 2025
 11:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 20:08:25 +0200
X-Gm-Features: AS18NWA8avJ7AT3gN1GiIIdaHzAYbZXDs9-XkxbnI3nrmWWVp79jjOsrQv3WW6I
Message-ID: <CANiq72ntKAeXRT_fEGJteUfuQuNUSjobmJCbQOuJWAcNFb1+9w@mail.gmail.com>
Subject: Re: [PATCH v13 00/12] KVM: guest_memfd: Add NUMA mempolicy support
To: Sean Christopherson <seanjc@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_110838_638569_4D43F0F7 
X-CRM114-Status: GOOD (  11.72  )
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

On Thu, Oct 16, 2025 at 7:30=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Miguel, you got pulled in due to a one-line change to add a new iterator
> macros in .clang-format.

Thanks!

The macro is not in `include/`, right? That means that, currently,
when I rerun the command to update the list it will go away.

If that is correct, and you want to have it in the list, then we
should add e.g. `virt/` there or similar, or we could have a few
separate lines at the top that are independent of the ones generated
by the command.

Cheers,
Miguel

