Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30618C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSJ87QP02yGhkp48cz1m9o6mISOrqhmhfxQe9Uq5Mb0=; b=HeQbDfchrgZ0LjHLCHwuoFM41r
	DMhlnfa5Nx9vTX193vZn7Gu0d4buYSIxlGQZ6WJBN7zkFrPmQGuN4QBZwo7EMySVc5g6nKSdrk819
	A2wlvzgs36r9PQfgwiQaGx8IB9kEJVH6FcRDIzuRaoU2lUgcVfQ9glwsE9f7YmyJtRcVFKAWf9+/8
	2Z5g0DdaPZ9ivyLegUYXxGA5WgbVkKrLPDT2aBLoMSIM8uiZoLCNzUrAiG3Xtavx2yr7VeX3AaMdy
	dbq2Dn/vF8gN4SrM46labspM4x2U5/O6tf+yA7jDF740xVBilImEn9GBx6d7njQZtIFF3lb40iSCN
	36QyKCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oJq-0000000ALHj-3imG;
	Tue, 29 Apr 2025 17:00:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oE7-0000000AKVb-02VR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 16:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CSJ87QP02yGhkp48cz1m9o6mISOrqhmhfxQe9Uq5Mb0=; b=CzCi+N1f0SDZCPtCNI3JQ7moCh
	6Q80FWEPG9LR5Goex00YrcfjHbS2P5LOj7o10f701GN8z2/GhR84ONsRG4fjQh+07vwH4m4N1nLtl
	R4so722RITZetiFoJqrWro4DM04//puJLlFRlHO+yzo3RlMGxdI1cZszkhvufFudcpzH19qKtY53G
	trOK9/LTRXdOV/dFBOqoBRWJyefsRpEE8dxKX/EZC9vhNicBvGC7gheeNYKcg2khTQRcHuu3m3EWq
	rRPu+daCXvD4nCe0qJ9Yi1mBF0JhXSMzHXN5NQIWhbtr4/uEijCRJn928o2mSTk6TaGEg/hyizhrF
	dYTw0B/Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9oE3-0000000DU6t-2dGu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 16:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10C2745131
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 16:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EBBC4CEF6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945666;
	bh=AdoYyKISP36xJeQD9woyN2YEZghocYxvykppZ9AflqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oMCcA1ody40ilGXC0Qybb7DD6sqJxB52dAXTz8M0wbK6IB+bf8EDHo+zzXnykV1B2
	 ZI1MDHferuz/WYILmf64MfVy+QwDtMwoK9hJu5FENIHEjcHPdsmJr8V+2NcyUZWQR/
	 Zdf6orSEajxT7dZqQA6CDJXGCy0o17kNrAxtAudher8AP/WyxvfA6LVxGJvT4OZ6pS
	 0bIxAIDtB15QnFrdc3oEUAdhVzZGoHIszrH1ZT2KmV1CIzLZA5KlnpXlD58F78ji4B
	 Ov8zQU6zZvoTI9gS8fwNBEguGszOBuHXgZ+V74f8H1IwxjKGkr04VtKNjQAL2PJNdg
	 FAAdjY9cCvHBQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so11370529a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 09:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3inx9iuX0r9haVo8b2XpNZ6kXXL9m1xvGpPqaJaK4KJU8hqWg6IUmzphg/8TDwoibFs+st3Pn+XD5hWZnmwsG@lists.infradead.org
X-Gm-Message-State: AOJu0YxDeoiRanrAoGaL4OABpLxmZYo2raS2LVC84uwxIQqagf4baDJG
	5CHIbxwMyIZsEJfUd1E9/IccJC9rRGMrDBa0QelwDi573+L+8KmSQ669XGZEbLC1tSUqeLi8FZC
	E1f0e8dLIetNR87ZlV7Kle1/HSIQ=
X-Google-Smtp-Source: AGHT+IG7skFkYmrh78r3PBufunbwFhCyH6bMAAQyF6iwtL4SiSNbNImHJcW3bMTneYB2TP8fzRb2vISMbXZRWbUX/Vo=
X-Received: by 2002:a17:907:3d0d:b0:ac7:eb12:dc69 with SMTP id
 a640c23a62f3a-acedc6226e0mr11217966b.28.1745945665026; Tue, 29 Apr 2025
 09:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250428105657.3283130-1-wei.fang@nxp.com> <20250428105657.3283130-6-wei.fang@nxp.com>
In-Reply-To: <20250428105657.3283130-6-wei.fang@nxp.com>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 29 Apr 2025 11:53:47 -0500
X-Gmail-Original-Message-ID: <CAOZdJXWxX6BKqt8=z-dWNO15AunjbhNBkSi5Cpfx6Dn3Yw4BaQ@mail.gmail.com>
X-Gm-Features: ATxdqUH2vDIYWUftzeH4CwoDWqiZzAE9yKFOOu8ghijiqo79WRaU9jaZG_afqrM
Message-ID: <CAOZdJXWxX6BKqt8=z-dWNO15AunjbhNBkSi5Cpfx6Dn3Yw4BaQ@mail.gmail.com>
Subject: Re: [PATCH v6 net-next 05/14] net: enetc: add debugfs interface to
 dump MAC filter
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_175431_853636_47CCFA51 
X-CRM114-Status: UNSURE (   7.79  )
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

On Mon, Apr 28, 2025 at 6:19=E2=80=AFAM Wei Fang <wei.fang@nxp.com> wrote:
> +void enetc_remove_debugfs(struct enetc_si *si)
> +{
> +       debugfs_remove_recursive(si->debugfs_root);

You can just call debugfs_remove() here.  debugfs_remove_recursive()
is deprecated:

void debugfs_remove(struct dentry *dentry);
#define debugfs_remove_recursive debugfs_remove

