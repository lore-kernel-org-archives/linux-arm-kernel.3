Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF5CEF8FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRD82glsj6nOntxvtcB/gUHxdV3IX5WvC/uNfoVC8Bo=; b=yn+anLXWDMecyA
	JIw6qhYM7W/UC5lwIRFXHQOKDBdj99uKLjLxVZHyOo8Bi7ATyMBmWsk87mXjMOHRCV/iA6uTFbgE9
	qZlRPpuX2IHcicNFSxDhz0ej6Gt9LxbB9/apx1ucoKqsVItBCTzB4FUXmKInD44qmSJpR/IVdj/St
	ydr0HW5mhezBejj7TQ7p6YVeHJ1EwUM9jTdK2WovoE9jmWKmeSRxdUopEEpJb9TmQ1UKcyFTv3M8D
	fQyQf+6fSErijq92xFPNHc4tkjFD2/ZpTCb0OLXlHebl3+DtBO6/LWLtSCB9Rc0DFkjMWII9wcVoQ
	e8VR5z45JcR79q+3ZSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmwb-0000000HLXE-0c0V;
	Wed, 04 Mar 2026 14:11:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmwY-0000000HLWM-2jO4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E0834421D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 14:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBC2C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772633478;
	bh=RRD82glsj6nOntxvtcB/gUHxdV3IX5WvC/uNfoVC8Bo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=HjwpUZhOiHy5YjL40RhBG3fdomNubKi5kiDja9gd8xIT84wzMdXAYDmZ/9KZGKaba
	 G8fKqNlelm/1sW5HoG31CZJTMqJ+jPijG1tHdW+zj8dPDlM02gJ0OOCkTxefmYpWqy
	 P0PjgXGWwHZ2iT+hNW2N2neMbH4ygfBvfwx4lgFkzmgSezQz7JVgehnzyKkmfnVfxo
	 vPIkK89KL8t9Y0awS03Gx+PR7QAkT8MJ+otrgWFgY6JkcDXagbCKZK60KGhSudYkXv
	 9Cd6bkaU4DGesvtwMo/VeF3UfvCd6m9U0Ri9dpSn9RUuW8Jtc9D7860tdKUAK95RLV
	 IoBpl2v1hE0ig==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-679f23befd6so3209581eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 06:11:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVO7VWy8W9qO3OwN9lFDkswfpLP6uBLkK2BhJ5JY9aEeR775bMcqtpuXzT9uJbSnTNjMIXxss55PKbVlFEoy5AQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs5qodtt7bzdGvA+aDcFymRGnan5DKfl/DksokWiY+GOI6ozSg
	pEmuZ/ZLMeNjAalcYmjPXCRWXD6qb2ORpfxUqxBQ61fZzk3pnSw5OuT+hkxGGhWiNcJaxItWYfU
	PMEb1D5ngHgjLMM+2lGEiReZ88f2+H9c=
X-Received: by 2002:a05:6820:16ab:b0:679:a650:cc0b with SMTP id
 006d021491bc7-67b17762deemr1124355eaf.51.1772633477338; Wed, 04 Mar 2026
 06:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com> <20260303192600.7224-26-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260303192600.7224-26-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 4 Mar 2026 23:11:02 +0900
X-Gmail-Original-Message-ID: <CAGb2v64Uvd9R-UBvsK7dH2FOAFy5LiVunj7eK3xXX_MYZBwPWw@mail.gmail.com>
X-Gm-Features: AaiRm51UKZgMQvlJkBBvuicIHC1NRc6PgGvmlvXLPvJenUPydhv9dgHS9yfMsTk
Message-ID: <CAGb2v64Uvd9R-UBvsK7dH2FOAFy5LiVunj7eK3xXX_MYZBwPWw@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilken Gottwalt <wilken.gottwalt@posteo.net>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061118_707120_15E660EF 
X-CRM114-Status: UNSURE (   9.23  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 4, 2026 at 4:31=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Apply the new helper to avoid using internal structures from the core.
> Remove superfluous setting of drvdata while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

