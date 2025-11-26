Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A70D10377
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 03:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66TuTBZPQ5vsv3Iv0COl1blnafpP7gUF+2AzcPsJnME=; b=3fN5tOC1tyYr3H8jLywyEOhirm
	AGZp5uZ2+J4kaWCG9xAa50mJZ1cRpAAoL+ImpHO7EfQKqIleMcTTPaFpcRFUPW9ozP6ipRfhIixmW
	zGI31loUnlMGOEbYO9lunHDYElutgklEosu+5IXqWjY9oXkyhZxxUVEI3MQZW/Tn8PMuoWG//Ge0m
	TQBkdS0S+ucxy0kk9D6SO9VvFkSqA3O+br88KFg3Yvw5TC/2NBzsReYv+bRocKh5Q+/lr4Upi/d/U
	59ZuTQJUDrUlb61paAsG2pFpSArOIE3Zex5DJhXWbIgIYR07t6zWe9O5E+XaEvIu2w8BUTGTrwNi6
	cgUu0YaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO6Dd-0000000EIV7-07F4;
	Wed, 26 Nov 2025 03:29:25 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO6Da-0000000EIUL-0g3m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 03:29:23 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-37cf475a1fdso23631181fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 19:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764127759; x=1764732559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66TuTBZPQ5vsv3Iv0COl1blnafpP7gUF+2AzcPsJnME=;
        b=Fn4E8iuvk4aHGmenBwcFjhyh2Vu1rcMoU+7h5PJ7QZPYYJ4e46epqDZj3z01fHaVri
         axq23izfr8AzUfu/sFyyCARKA9oM8rnS+qYAJtw+3eQLh0dqDswaNUpUEBwrlUehzHP5
         bNAoZIzDiWFtvZp/NDYmwuzzAY9pfimsEtLHVSGRlXutlxa1NnEvSYaSo6eVh4tpBZsn
         +VPx8IeqqFWl6Bwj6RxrQNlUtpCoQJZH11PlwrjN8h/cLgOaP6fU3X+rWhlY1/XnRkhZ
         GJPDLHKc+zjBLIvE9PIUUUCAgywYF4oL3ETqBOYF1KPNIDXnjdxOlFq1bjXNAlh8g+A6
         W40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764127759; x=1764732559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=66TuTBZPQ5vsv3Iv0COl1blnafpP7gUF+2AzcPsJnME=;
        b=FxOXK4cuF7Uim62xmpX2bkxLwnmK8gd5Z0xXpNFcninWJUG0yllTB2Qn6R7ytKaeoR
         dWCR0Qw6gJO9qSuraB/cLOQmcJkj4REuDzyPWFNw3HlkNNqtaM8pLC+BRb1NYL77U5Sq
         BmfM0nPOwcTScIUgl80scneRwLDzMQR428/ezulSXW4EzalzL1yJ+AIgcvSSADN5JNSU
         b2a3DP8tH3aQuWeh6DnA3rpv13yyNcPUFE7Tfm4kn80tWYAqQ/ZbvZLqbs7zZ0HBguvn
         vrp1q1ZEtFQ3zHvqEl6Mqg8VY6YH/WAL7z+zYSN/VIueigYv8epAIR73/I9gs6JdXgYy
         ozag==
X-Forwarded-Encrypted: i=1; AJvYcCUlqZqMoMvz8xEYHehpKN2vwz6mbgGnMYwsFiG6XcjddO6PUN8mp0sGznS1tftTTmn43wEYD6U4lluMlMDncbtd@lists.infradead.org
X-Gm-Message-State: AOJu0YyUhXPnbdr7Pyoyn/ocLKO6oj0ByEda4rPWXzbBl1I46OsPAKSY
	cENJu/cgUqDSgxcCgOOe8e4Y1EZ+P15QrGHNw3ij1ZfpTmH6g5pbrSx6+vxkMTqK2aRAGY6VX4E
	KyZ2bNbtPOQkTYm28Qtu+b3GaG+e3Y4M=
X-Gm-Gg: ASbGncu5nw3UxPg+XdQgVkuugWqEjloacG07yiQVCh3lUYyFDn41d21OJg5x1G2/C2v
	jR25z19pcyC+/Whw8Sk8S6upYQbBSWb5YtG5ahS/YDwwAGupRl4AdmXbYJ2P9ZhTAVPdmVEp/xl
	hmg8N7ACfYca5rj9xPB09l37k0Nw9YrHbkKBUMQT/pUISY7kQTpc3oFeYRfWpZKB33sK/MUfN3G
	MNdOZpRF5Gt7OtOW5fUJHv+zSm/3ueCJFv0BFg5S03z49865WZZop94ToQj51XrIhCsAg==
X-Google-Smtp-Source: AGHT+IFXNDNWfBE/jdt0Dz9W+S2FZLkrdTl/cEteRJj+bVHvSnDXE5eODbEtCrm2sfh2BeISb+8B1VHSywmIxbn2U6I=
X-Received: by 2002:a05:651c:43d8:20b0:37a:432f:8ecc with SMTP id
 38308e7fff4ca-37d07953a3emr15608421fa.33.1764127759248; Tue, 25 Nov 2025
 19:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
 <176366460701.1748676.511972373877694762.git-patchwork-notify@kernel.org> <fcMPe6V9vMYxkXRMnKXiaeTnOwAMBNRTmF1mgLePTpz3Q4hPqpb0WVQ5aXZljqkOtZ2W_47PVL1Q4lnf7kZJhFS4aGwP8_4QiqJl2ScKSi4=@proton.me>
In-Reply-To: <fcMPe6V9vMYxkXRMnKXiaeTnOwAMBNRTmF1mgLePTpz3Q4hPqpb0WVQ5aXZljqkOtZ2W_47PVL1Q4lnf7kZJhFS4aGwP8_4QiqJl2ScKSi4=@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 25 Nov 2025 22:29:06 -0500
X-Gm-Features: AWmQ_bm2zfUBQgnJooefgPcNZ-tIRrataC9j9VnWGhDa0KJzloTqrrroBYDFEXM
Message-ID: <CABBYNZ+LrMOr-Bb-Sfk--FAHjMWxzeUCdDoGLuRqhF99xaGE3A@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: incogcyberpunk@proton.me
Cc: patchwork-bot+bluetooth@kernel.org, Doug Anderson <dianders@chromium.org>, 
	marcel@holtmann.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, regressions@leemhuis.info, 
	regressions@lists.linux.dev, johan.hedberg@gmail.com, sean.wang@mediatek.com, 
	stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_192922_200583_8EF27A38 
X-CRM114-Status: GOOD (  14.07  )
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

Hi,

On Tue, Nov 25, 2025 at 10:18=E2=80=AFPM <incogcyberpunk@proton.me> wrote:
>
> Hey,
>
> It's been almost a week since the regression was reported and an patch wa=
s provided to fix the issue, which has now been accepted in the linux-next =
tree; but I see that despite being a patch for regression, a merge/pull req=
uest was not made upstream for the latest -rc mainline release.
>
> Is there any way that I can track the updates for this patch to be onto t=
he mainline release?
>
> Sorry, if I am missing anything.

This was merged into net tree a few days ago:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=
=3D8a4dfa8fa6b5

So it should get into Linus tree in the next few days.

> Regards,
> IncogCyberpunk



--=20
Luiz Augusto von Dentz

