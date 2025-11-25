Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBFAD0EE13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Umec4MYCn7UWFTu95kobtomRxgANDBIZB5gZ37QVB98=; b=TesGDFyUgD8JsBB6mmyFLa42a+
	eD6pP5v6PHdf/pg6z7xWZYiUxaBfzZdLunTG61pL+Zd99ihh7kXC4GsWojJdtUFOoUy9hW6+BqAj7
	HinTOeqf6Pq6iDwCxExMr+7qhxmkWbkqkaMoegMebT33o+40WDu5PY/D5J78880oGQaKDBByhFXmq
	tkdJm4GLA0NNNIYT3M8cn/lKkCmoqdluv1NxgGX8Zzadjx6Xr/7FDPWQ53TYCdTIhSNv7vKow33l2
	XQ8FDZrrzpKXZJe9hKJAGU5TcCybMLGuDGFbE3K8P1wL+46WJwyxRAefRHGW6q4/pFcyzIS3njNFZ
	61p4V2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxUs-0000000Dk9Z-101g;
	Tue, 25 Nov 2025 18:10:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxUq-0000000Dk93-1dsX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 18:10:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-297e2736308so5803525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 10:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1764094235; x=1764699035; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Umec4MYCn7UWFTu95kobtomRxgANDBIZB5gZ37QVB98=;
        b=nBo1cvozRqilQ5QK+pvxpndg0bfpbwAlqZk0UAz//X2tQp9ub+QqxDfVxAJYJOFXWy
         tDzbCwRcxgrvF88xN7v1CkQorJHWjgi5LBGWyla1ZX5i5p+IPl8hJayTR6z/WOBGgj1N
         2hEIIghZ4BO6pbdwOGH405GD+D3Scis/csTOICXK4e4hnVTaCBILq0jb8ySk/mAUPYsg
         W1GLKEm893PedwU0vSo+mYR/adQTqXaMyYJLVb0HLE1vj3LYQ9d3Y9zIWz+MjOeBqgSI
         sJpy1lyRXu6d8OnZniRgGK7fQEALy+v9tN9mMO8zgszLGxhu/QU4LKosFJ0F0XuEB+oN
         HhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764094235; x=1764699035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Umec4MYCn7UWFTu95kobtomRxgANDBIZB5gZ37QVB98=;
        b=CtIhzVypK0t8XWdlvqk6Qbg+OTWnSXGK60+qt09evTNIynUqEGnoRi3JnPG3lpOetO
         VRSoR7WmC7vC7MUFGriG3bNoDtHa14erzWVv8af/H6vo5h6oKNm4dLMxhK3RMWRvYDsj
         OY/InoIpGoOSEUleBHU6salqgP///6SOA/qNzvJtZDxr4GZRDHtzKjH1mMY5X5+m4A3Y
         b1J69skOW47x6o3VqgMS5aIRkI79hoDMs+vq5Hgm5ZtIjyUCf4Iyau1AHTxrSx9zjW2A
         W4VH90Kq4jb0u6dKN6cJDKqNDc/JFLtEv1CuqBTJmag5HWIvZIDOXfnfMhase4DGougi
         j40w==
X-Forwarded-Encrypted: i=1; AJvYcCW+BBhaGH+IsknkTSsV+TBpD37rk2HaYMq0smIBqff+vsrjzyP16TiyNRFqA5r2usyZhHnY52djsFD1p+sLCjR0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4w7ymFrO2d6DjcjygbxjWwYguDj8F1Mdq8H+9sbkEgQmbXixl
	juU/pp32XtBIi7HYOdqmrFxeF1zNL8HkoM232NpAmX/nCOzqfeZ8OW/bPtuprwfp76g=
X-Gm-Gg: ASbGncudKHar0nhmjQfKQc2qyaPiS+cvXJHkReuRjSK6tZiNTdopO+kObJysmB1hrGD
	xKtsgEW3oUs+SgVlYJpTjjk9yUF3qKHKTEb8wckvI/6rz7f+5FMqgygPPj7Bu6yiLVzgoLrXfAn
	c2FSLcrdxl2HbpgSZOQ61ZZT8uBETYpL1CJsGZvWI/DqnsZzDkVYJdEvomeBNK2E0kfADF41Klh
	0P2we4GSR0LbcBVmzO1ht5UddOrqcD2nafXc7CsI+dAIRS6nY1SuKtrtlueA6H8bpemegQpbM22
	gMaKByMh0XoolGSaw31IrtVW5wnM3ayYB+PIYuDIXfDU88S6fqmOHnP5MoBjJwSH1JwiRMuE+6x
	TDmC3wuZ6uSIZgzUupjCeQYHeVOcwe2+X5uOIpkPm83aYDwRltyRSsm5CIA==
X-Google-Smtp-Source: AGHT+IGMaalvfN9l0DOr2S33Cgy8CQf0jRx582FHWei67nCNYyq/uZZfeYcD3+INNTene/3kJVhYsA==
X-Received: by 2002:a17:903:19f0:b0:297:f3a7:9305 with SMTP id d9443c01a7336-29b6bf6c143mr103444455ad.6.1764094235141;
        Tue, 25 Nov 2025 10:10:35 -0800 (PST)
Received: from t14 ([2001:5a8:47ec:d700:7dee:b1a1:fd3f:6b76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174ba7dsm18606671b3a.64.2025.11.25.10.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:10:34 -0800 (PST)
Date: Tue, 25 Nov 2025 10:10:32 -0800
From: Jordan Rife <jordan@jrife.io>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>
Subject: Re: [RFC PATCH bpf-next 0/7] bpf: Implement BPF_LINK_UPDATE for
 tracing links
Message-ID: <gjfaxdq3qyz2q4ajgigwmqthhkoeffuym7sy4z764m4bvmfqdt@4eggpiyxff2i>
References: <20251118005305.27058-1-jordan@jrife.io>
 <CAADnVQJ-9JubH5r4oSwQneu3o6U6s8Fa0cjCsi=+6-R+9nkzHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJ-9JubH5r4oSwQneu3o6U6s8Fa0cjCsi=+6-R+9nkzHw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_101036_630023_7B2B4C94 
X-CRM114-Status: GOOD (  17.25  )
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

On Fri, Nov 21, 2025 at 05:43:28PM -0800, Alexei Starovoitov wrote:
> On Mon, Nov 17, 2025 at 4:53 PM Jordan Rife <jordan@jrife.io> wrote:
> >
> > Implement update_prog for bpf_tracing_link_lops to enable
> > BPF_LINK_UPDATE for fentry, fexit, fmod_ret, freplace, etc. links.
> >
> > My initial motivation for this was to enable a use case where one
> > process creates and owns links pointing to "hooks" within a tc, xdp, ...
> > attachment and an external "plugin" loads freplace programs and updates
> > links to these hooks. Aside from that though, it seemed like it could
> > be useful to be able to atomically swap out the program associated with
> > an freplace/fentry/fexit/fmod_ret link more generally.
> 
> I don't think we should burden the kernel with link_update for fentry/fexit.
> bpf trampoline is already complex enough. I don't feel that
> additional complexity is justified.

OK. I could drop fentry/fexit from the series to avoid complexity with
the associated arch-specific stuff.

Jordan

