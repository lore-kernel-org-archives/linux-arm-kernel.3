Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4B6CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 12:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZYjx+1r5vp0THNJehBxeMIT4m4dt14EorNdO1/i8AY=; b=qGOQzoomD4Is2LPErF677J0ll7
	EXRtRNctI4LA3FHhVvfjQbGeVJfIGasGQ/D0qSV5WE88HxP238oVFxJKNGXnbn0lWPzsn5mbWU7w1
	1+d8O9RjapCd+dN4jRLRIRb1mhb2fUeb3toU7yj6BE3XNRemTR7IFRO9Ixjk7XlwY67UycgMwDg8+
	yEEEX1relsufPXaFB3p4YyUvO02pzuBV2lkBqVOv3jbmk5z7JJFU2X8xMMa1mWzXc1p9R+waci3kU
	xiNAO8A1buDVpcxdF4lDXX4bA1WF3frAO69BAPN0NDH33+wzTXBRqkxFupRArQ06a2JrsNgj6V4Ah
	OijbYhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDLEp-0000000EmvQ-2DsP;
	Sun, 04 Oct 2026 12:22:43 +0000
Received: from mail-qk2-x0d.google.com ([2607:f8b0:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDLEm-0000000Emv2-47Gv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 12:22:42 +0000
Received: by mail-qk2-x0d.google.com with SMTP id af79cd13be357-93e49f4d30bso91185085a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 05:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791116559; cv=none;
        d=google.com; s=arc-20260327;
        b=sBhnDeBVD1+GZozIWP/icKLL/Gi9tYuml5pMfGaMRw1w9eplYQAJZG4ZUWPBBBJn4H
         is1gB/Eg+1VIyp1MNXfO/lqYCUaQ3DcgCySum0kjcxyXMLQKjL3cpTpZhbFWryi77a6a
         PJf1LV+Mwt2Jqui3Rx0SfhxZcjSKo8p01DD7XnVqd6ue0+hd9PWpUIBMrOe/rp7MH1jp
         8MhGZFzS8udsbHqROaw5gcnBzCvpOeE8bwW0j5WaZ5RVFqsr33lR1rre0M6y91ELSooR
         MO3/nuQO2bGb31Z2dr3oFkOMmlfu8eY+ZoKuxtjrbFdM7/ypsHcFjdA7MsNk8xFsHwVv
         B2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ZYjx+1r5vp0THNJehBxeMIT4m4dt14EorNdO1/i8AY=;
        fh=wMf03VeyC7cnlK7+xbzJt6jtNaIPG633ypPU5Z6TA/w=;
        b=l3N3wTdOLpXIdVinpahNvmqcDVXiLgznuMKSV0lN3P7Jz3hXmqYxABuaSq04puCbnt
         mrMUw79KKvAKLCTsFjDIar/woURNE2iwI7U6KI/XgGjrfYv8StvXNjF/Ir59yHATYdFU
         grqAFnIEAHLQSicLBDZ+ilcTq2vObnkb/A1MwhiJ89Ie1Ug/Oz8y+7YZ8cdW0RWTaV5u
         yorfAvSvfq0ufnxKoWWIaCHpLuYn41RAmrl/xqLw0rIEXNQni9IcMvup6Zu1Wk4TtYiO
         2py5X1r4hYF/32OkDTdpFsePmiBVrNQCB9oOrMx6XAmrwnVVRzyT2bDr+LQWOxtCav+t
         MOnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791116559; x=1791721359; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ZYjx+1r5vp0THNJehBxeMIT4m4dt14EorNdO1/i8AY=;
        b=gaFprp6kVxzd5C92J/Dx0DiAku4mJ6Z2zxJVXRoi8INpQUfLRICGE+10wzTAXaXRdX
         kqeOJsTzkd3dpMbBKIY3T8LEwPWUgIk44VUJKX+83K4bRKNfWorUN9SGb6x72NUE4UxT
         YeF24FdGcmmV0CP/K7s+J2xJR5FclGJGlUYJs6RoyTIdlxiw6XHnroOkOE8pNDbSkPE0
         4J+E4YN3o1j0jduI0dgg4luXpfuqU9kPEJZ6K30ZvA4r7EbNNPnhuor0+AnqWPazlhC0
         DrWwjHoO/jGNtKSOBmkwo2d1iAtDPq55elQbMZ5yWwjarrr9lKdjGCYtSxNZfQznAJ8W
         W+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116559; x=1791721359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZYjx+1r5vp0THNJehBxeMIT4m4dt14EorNdO1/i8AY=;
        b=iqHm5saT3mzYSb49adaJ2e5xJwY5MptHLGz5FCIDXi8a+pNcjNVH2xALulTAbSeiAR
         7eiciULiJz5GmNnnVOr402lgAFbQsj4dcUr9PUYz+Jf0QLI0f63pfVDoSZygJv3vpuml
         DgceK7Ld968BQnYVwOrNXX7kk1C2kGWuoBF6MyB0FiHouAIXbNY/WHnTsJUd1ehwoffp
         yRlhz8D9lI/c7qjRqPlJLOOF2e/FiLN9awnyOXBdcAeQMnJzS32dL5cpan9xxDnDlIj+
         yEOLOm8YWkfv2Jfm8NikuM4YhlwMafxr4C0IV3crMSpBCE2yy6/Sb50TMAZNHKzNCVN/
         n70g==
X-Forwarded-Encrypted: i=1; AKwUvByuMDukRRYHT8ju2VUXppxZVPMz4uIT5ZGS/jl8AyMkXGMGkvoo1odbl5qj+GYwGCrjHQKeEMYg1jDxszRTeSBF@lists.infradead.org
X-Gm-Message-State: AFuF++nHDPbNlo6MSUs/foCNqzlIAzBESaNavXDCAwkRToIH8prHo28h
	p4pKFh1aM+f3EfHz1WeNLnPeosthrDh/ksn9V6Kn/WTLUG6uspTyBGPthE+0zqpGrw1fWgqTFPO
	LYdRXD1ICWI4O2GvkrtV886dPH/i9hXw=
X-Gm-Gg: AYBFou1YJsl8QlNf4FAgbdHwnpsfazCPCGNCw6mVyJazl+a2/a3hfcKe1jZoWESzNP8
	SOYn148I/BR2HIU6bqHr0vaerEOQO66XokoH0rDNQTgBwbwPaa6Brv3quSlOiU9VlFvPQkn+QgJ
	+5d/Elaxn/GvGE5vsU/XCG1ghGVlPBAba0NQCuxP/t6l9pR4w25wYOih/1ooasMpq0LpdLA4v/h
	nM/Wr0wFgTcETMA66TR9qcZUsMMKwjElMY2FggP0zcoNZVVZA1IwS4ZLGvpHVEZeDwtBzIOnP1j
	GANDoWTz0WJ5ulFoQN25aO4bVaUkQW+RSen1ynp2tahI5UiVsIRTiu1r08Mtkk2P6/MM
X-Received: by 2002:a05:620a:43a5:b0:936:df48:d507 with SMTP id
 af79cd13be357-93ce94ed6e2mr1355623985a.18.1791116559566; Sun, 04 Oct 2026
 05:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261004120526.2728564-1-zxyan0222@gmail.com> <179111571610.1402591.377888819234151971@kernel.org>
In-Reply-To: <179111571610.1402591.377888819234151971@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Sun, 4 Oct 2026 20:22:27 +0800
X-Gm-Features: AclHuK9jrfPfFj8M3GL_Owa_kw9zKNkIad5XcOnkNjdlIpwCoWA_TR7BFvZBUXw
Message-ID: <CAP7veTLPuO6QfS89b0VuKSBYDmQkgQtPO94KEhVtjNTNLoYNdQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
To: netdev-bot+sinfo@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, 
	maxime.chevallier@bootlin.com, muhammad.nazim.amirul.nazle.asmade@altera.com, 
	rohan.g.thomas@altera.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_052241_192588_5DBC4CD9 
X-CRM114-Status: GOOD (  23.03  )
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

On Sun, Oct 4, 2026 at 8:08=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>

- How discovered: Patch 1 and Patch 2 were found by code inspection
  during review.  Patch 3 was found during development testing on a
  local DWXGMAC2 board: the PTP clock advertised the aux snapshot
  channels and PTP_EXTTS_REQUEST succeeded, but no PTP_CLOCK_EXTTS
  event ever arrived - inspection then showed the XGMAC hwif pointed
  at the generic stmmac_ptp ops, which read the dwmac4 offset instead
  of the XGMAC register.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>

- Actually triggered: the EXTTS failure of Patch 3 was hit on real
  hardware as described above.  The races fixed by Patch 1 and the
  OOB index of Patch 2 were found by inspection and have not been
  observed in isolation.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>

- Tested on: local DWXGMAC2 hardware (not Agilex5), for the Patch EXTTS
  issue and basic PTP operation. Agilex5 has not been tested locally.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

