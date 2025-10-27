Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E0ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KddKMVM5wd0B6J1q1MLWD60MfPMYXHaAJAvI7FQnRAc=; b=czdIVxpRoD4Cm3
	q8vxP+sm3gvGcczHNPzUaf1cjiAL0troFT31KA1TaASGlCBDAHQTpex0JhlVP61mhDVpDF0ZdHkmG
	W4yRCeGNCUjDlpfsurl5g49ZPCe+iYV6IWuAM6v7E1eCko765WXq4n6layIq8E1jSja0uGZUEsgvT
	CtqLnw7QDr7KTXcerS5hFhodihkd9HfD5rcsofwDVUyWrwpqoK5302kVHGQNWk2l6ok4HCVk0CzAE
	yNKemri5S4VINp8v6AngxveypwTQOmXN0RdLcPwQhNn2FVdFRQGM1FrqNDAwv/V0UXjDHpDGfrnNs
	HGqoRJTdEVCfNcHazbjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQVN-0000000ENcv-1uFo;
	Mon, 27 Oct 2025 16:55:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQVM-0000000ENcp-3HgG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:55:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E941060546
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9738DC116B1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761584135;
	bh=KddKMVM5wd0B6J1q1MLWD60MfPMYXHaAJAvI7FQnRAc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=OEgi0eJbG5TcR+9LSQwWgmXDBAJ7OpXXhNUs0/2rA0ViWXyq6yyd6gYVyP9h8BbZr
	 126ppYrbnahjMz7WjD46RZQndMzJeJpIZMuRo7F4LjIkSbNfSpcRh5gu7oIOxFmRv0
	 +7qdo63pj8NWI8zknqj0Eq9lMBG7MmXdzgWPjN+r48PbJHSRGc7JoaA5Q/Tgk5/CFT
	 UF/XUvTz0fyJY6uCVzPqxlAbCHIhG1ri3StqZCZBPI4Vrw7SSjF0q5iOGvLfvI1JLv
	 kQEH1CTHFhffVT9SduHwktYAN7AuySBLjEAZHA4F0Mn/kqPuPIO9Zsfy+jL/W0pH5C
	 hnqCiqBjOTpcQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-378d61ce75aso45331811fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8/kXdDolPNdmbFtjq9/1erctS1/d6aqt0NwTjoN0RiWq4pL9gmqlp6Q+F5u9b67ZXBnWi2Yfy7L97k85tAv4e@lists.infradead.org
X-Gm-Message-State: AOJu0YxWQ7L/76cHh2uyNCFcRbXwZNshZzWG/6SDjgodi9QV7DenErTl
	4aZ/0GgV2+EKy0D6GSCbTehz57u+3DaYWB5MdtJhTwhP9ryqGIcv/Uh0mIejXL/J1pZQoeGV5B+
	CzYjQAfCPr25j6P6H8xu/zyR44CaIuNs=
X-Google-Smtp-Source: AGHT+IGwv/BQ+++SBFxYYP2GD7RTs091hoc1u0QU8IvYs61A4uKZ+F34EWnDa2h9Kf3sdYzwjvjhGmCCjViKq/p155s=
X-Received: by 2002:a05:651c:1444:b0:372:221a:b124 with SMTP id
 38308e7fff4ca-37907b313edmr634581fa.0.1761584133992; Mon, 27 Oct 2025
 09:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-16-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-16-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:55:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v66br9q8S0uVOoUsPoMOHxXnO1UExhs2PhbbuFYqhB9-kw@mail.gmail.com>
X-Gm-Features: AWmQ_blFUa5jniV5lL0-JsOEEq2milyC58nrIxK4tO0XvnhoJRoyHMfQHehc-Rc
Message-ID: <CAGb2v66br9q8S0uVOoUsPoMOHxXnO1UExhs2PhbbuFYqhB9-kw@mail.gmail.com>
Subject: Re: [PATCH 15/30] drm/sun4i: layer: move num of planes calc out of
 layer code
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> With DE33, number of planes no longer depends on mixer because layers
> are shared between all mixers.
>
> Get this value via parameter, so DE specific code can fill in proper
> value.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

